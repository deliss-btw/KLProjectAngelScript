
const FConsoleVariable CVar_AI_EnableCombatLOD = FConsoleVariable();

class US_AITargetingSystemV2 : UECSScriptSystem
{
    UPROPERTY()
    FBuffConfigRef TargetingHintBuffRef;
    UPROPERTY()
    TSubclassOf<AFXActor> TauntLinkEffect;
    UPROPERTY()
    FName TauntLinkFXBeamStartName;
    UPROPERTY()
    FName TauntLinkFXBeamEndName;
    UPROPERTY()
    FName TauntFXTopName;
    UPROPERTY()
    FRuntimeFloatCurve DefaultAlertnessRatioCurveByDistance;
    UPROPERTY()
    FRuntimeFloatCurve DefaultAlertnessRatioCurveByAngleOffset;
    UPROPERTY()
    UAIAlertnessConfigDataAsset CommonAIAlertnessConfig;
    UPROPERTY()
    TDataObjectPtr<FAITargetingConfig> FallbackAITargetingConfig;
    UPROPERTY()
    TDataObjectPtr<FAITargetingQueryConfig> TemplateQueryConfig;
    UPROPERTY()
    TArray<float32> AIPlayerDistLODDistances;
    UPROPERTY()
    float32 AIPlayerDistLODBuffer;
    UPROPERTY()
    FAIVisibilityPriorityConfig VisibilityPriorityConfig;
    UPROPERTY()
    FAIVisibilityCacheConfig VisibilityCacheConfig;
    float AnimLength;

    US_AITargetingSystemV2()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void UpdateAlertnessV2(const FECSEntity &inout SelfEntity, const FC_Transform &inout SelfTransform, const FECSEntity &inout TargetableEntity, const FC_AIKnowledge &inout AIKnowledge, FC_AITargetingV2 &inout AITargetingV2, const bool bIsInSight, const float32 DeltaTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_CheckCurrentTargetValidationV2(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, FC_AITargetingV2 &inout AITargeting) const
    {
        for (auto& local_16 : AITargeting.CurrentQueryOutput)
        {
            FECSEntityId local_17;
            bool local_13 = !((local_17 == ENTITY_ID_NULL));
            if (!(local_13))
            {
                local_13 = false;
            }
            else
            {
                FECSWorldPtr local_20 = Entity.GetWorld();
                local_13 = !(::FAIKnowledgeUtils::CanEntityBeTarget(FECSEntity()));
            }
            if (local_13)
            {
                FECSWorldPtr local_20_2 = Entity.GetWorld();
                FTargetEntity local_29 = FTargetEntity(FECSEntity());
                local_16.SetValue(ENTITY_ID_NULL);
                ::FAITargetingUtils::SetSmartEntityIdValueForEntity(Entity, local_16.GetTargetId(), ENTITY_ID_NULL);
                ::FAITargetingUtils::SendAITargetChangedEventV2(Entity, local_29, FTargetEntity(), local_16.GetTargetId());
                FC_AINeedUpdateAITargetingTag local_36;
                Assign local_34;
                local_34.opCall(local_36);
                if (!(::FAIKnowledgeUtils::IsEntityTargetable(local_29.GetEntity())))
                {
                    ::FAITargetingUtils::ClearTarget(AITargeting, local_29.GetEntity());
                }
            }
        }
        ::FAIKnowledgeUtils::UpdateCombatKnowledgeAboutTargetV2(Entity);
        return;
    }
    UFUNCTION()
    void Monitor_UpdateCombatKnowledgeOnEnterCombat(const FC_AICombatTag &inout EnterCombat, const FECSEntity &inout Entity) const
    {
        Get local_4;
        if (local_4.opCall())
        {
            ::FAIKnowledgeUtils::UpdateCombatKnowledgeAboutTargetV2(Entity);
        }
        return;
    }
    UFUNCTION()
    void Job_TickAITargetingNeedUpdateIntervalV2(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, FC_AITargetingV2 &inout AITargeting) const
    {
        int local_14 = 0;
        if (int(AITargeting.HoldTargetRefCount) > 0 && ::FAITargetingUtils::HasValidTarget(Entity) && (AITargeting.AllTargets.Num() > 0))
        {
            return;
        }
        if (DelayTask::IsValidHandle(AITargeting.UpdateTargetingTaskHandle))
        {
            return;
        }
        if (AITargeting.NextTargetingUpdateTime.opCmp(FixedTime.Time) > 0)
        {
            return;
        }
        if (FEcologyMisc::CVar_EcosimAI_EnableDelayUpdateTargetting.GetBool())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            __Lambda_Gameplay_AI_S_AITargetingSystemV2_201 local_18;
            FDelayTaskHandle local_42 = local_14.CreateTask(Entity, Foundation::MakeClosure(local_18), 100);
            AITargeting.UpdateTargetingTaskHandle = local_42;
            ::FEcologyDelayTaskUtils::AddTaskToUpdateTargetLayer(local_42, EDelayTaskPriority(1));
            return;
        }
        FC_AINeedUpdateAITargetingTag local_52;
        Assign local_50;
        local_50.opCall(local_52);
        return;
    }
    UFUNCTION()
    void Job_InitGlobalTemplateQueryConfig() const
    {
        FAITargetingQueryConfig::SetGlobalTemplateQuery(this.TemplateQueryConfig);
        return;
    }
    UFUNCTION()
    void Job_InitAIPlayerDistanceLOD() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        FCS_AIPlayerDistanceLODManager local_8;
        local_8.LODDistances = this.AIPlayerDistLODDistances;
        local_8.HysteresisBuffer = this.AIPlayerDistLODBuffer;
        return;
    }
    UFUNCTION()
    void Monitor_InitAITargetingV2OnAssigned(const FECSEntity &inout Entity, const FC_AITargetingV2 &inout AITargetingV2) const
    {
        ::FAITargetingUtils::InitAITargetingV2(Entity, this.FallbackAITargetingConfig);
        ModifyOrAdd local_4;
        local_4.opCall();
        FECSWorldPtr local_6 = this.GetECSWorld();
        ModifyOrAdd local_10;
        local_10.opCall();
        return;
    }
    UFUNCTION()
    void Job_UpdateSpreadAndOutOfCombatDistanceV2(const FECSEntity &inout Entity, const FC_AIKnowledge &inout AIKnowledge, FC_AITargetingV2 &inout AITargetingV2, const FC_Transform &inout SelfTransform) const
    {
        FSightPerceptionConfig local_12 = ::FAIPerceptionUtils::GetCurrentSightConfig(Entity, AIKnowledge);
        float32 local_13 = 1.1754944e-38f;
        for (auto& local_30 : local_12.SightPerceptionViewList)
        {
            if (local_30.SightPerceptionDistance > local_13)
            {
                local_13 = local_30.SightPerceptionDistance;
            }
        }
        AITargetingV2.SightMaxDistance = local_13;
        return;
    }
    UFUNCTION()
    void Job_UpdateCurrentAlertTargetsV2(const FCS_FixedTime &inout Time, const FECSEntity &inout Entity, FC_AIKnowledge &inout AIKnowledge, FC_AITargetingV2 &inout AITargetingV2, const FCS_FactionTargetableEntities &inout TargetableEntities, const FC_DamageFactionRelation &inout FactionRelation, const FC_Faction &inout Faction, const FC_Transform &inout Transform, FC_AIVisibilityCache &inout VisibilityCache, FCS_AIVisibilityBudget &inout VisibilityBudget) const
    {
        bool local_4;
        bool local_216;
        FScopeCycleCounter local_1 = FScopeCycleCounter(FStatID(n"UpdateCurrentAlertTargetsV2"), false);
        int local_2 = ::FAIPlayerDistLODUtils::GetLODLevel(Entity);
        float32 local_8 = ::FAIPlayerDistLODSchedule::GetUpdateInterval(local_2);
        if (AITargetingV2.LastUpdateAlertTime.opCmp(0.0) >= 0)
        {
            local_8 = float32(((FFPTime(Time.Time) - AITargetingV2.LastUpdateAlertTime).ToSeconds()));
        }
        AITargetingV2.LastUpdateAlertTime = Time.Time;
        AIKnowledge.NextKnowledgeUpdateTime = (FFPTime(Time.Time) + FFPTime((::FAIPlayerDistLODSchedule::GetStaggeredInterval(local_2, Entity.GetIdValue()))));
        FVector local_24 = Transform.GetPosition();
        FVirtualBoneTransformUtils::GetVirtualBoneLocation(Entity, n"Eye", EVirtualBoneTransformQueryMode(0), local_24, FFPTime(-1));
        FQuat local_36 = Transform.GetRotation();
        float32 local_38 = FMath::Square(::FAIPerceptionUtils::GetOutOfCombatDistance(Entity));
        FSightPerceptionConfig local_50 = ::FAIPerceptionUtils::GetCurrentSightConfig(Entity, AIKnowledge);
        EVisibilityTier local_52 = ::FAIPlayerDistLODUtils::GetLODVisibilityTier(Entity);
        TSet<FECSEntity> local_72;
        for (auto& local_90 : AITargetingV2.AlertBroadcastSources)
        {
            if (!(local_90.GetEntity().IsValid()))
            {
                continue;
            }
            FECSEntity local_94 = local_90.GetEntity();
            Get local_98;
            const FC_AITargetingV2& local_100 = local_98.opCall();
            if (local_100)
            {
                for (auto& local_118 : local_100.EntityAlertnessMap)
                {
                    if (local_72.Contains(local_118.GetKey().GetEntity()) || !(::FAIKnowledgeUtils::CanEntityBeCombatTarget(local_118.GetKey().GetEntity())))
                    {
                        continue;
                    }
                    ::FAIKnowledgeUtils::BroadcastAlertTargetV2(Entity, local_118.GetKey().GetEntity(), AITargetingV2);
                    ::FAIVisibilityUtils::InvalidateVisibilityCache(VisibilityCache, local_118.GetKey());
                    local_72.Add(local_118.GetKey().GetEntity());
                }
            }
        }
        Has local_128;
        if (AITargetingV2.AlertBroadcastSources.Num() > 0 && !(local_128.opCall()))
        {
            Remove local_132;
            local_132.opCall();
        }
        AITargetingV2.AlertBroadcastSources.Empty(0);
        TSet<FECSEntity> local_152;
        int local_153 = 0;
        for (; local_153 < FactionRelation.GetRelations().Num(); ++local_153)
        {
            if ((int(FactionRelation.GetRelations()[local_153])) == 2)
            {
                local_152.Append(TargetableEntities.FactionEntities[local_153].Entities);
            }
        }
        TArray<FPrioritizedTarget> local_160;
        for (auto& local_178 : local_152)
        {
            if (local_72.Contains(local_178) || !(::FAIKnowledgeUtils::CanEntityBeCombatTarget(local_178)))
            {
                continue;
            }
            Get local_182;
            const FC_Transform& local_184 = local_182.opCall();
            if (local_184)
            {
                if (local_184.GetPosition().DistSquared(local_24) < (local_38))
                {
                    FPrioritizedTarget local_198;
                    local_198.Entity = local_178;
                    local_198.TargetPos = local_184.GetPosition();
                    FVirtualBoneTransformUtils::GetVirtualBoneLocation(local_178, n"Eye", EVirtualBoneTransformQueryMode(0), local_198.TargetPos, FFPTime(-1));
                    local_198.Priority = ::FAIVisibilityUtils::CalcVisibilityPriority(local_178, this.VisibilityPriorityConfig);
                    local_160.Add(local_198);
                }
            }
        }
        for (auto& local_214 : local_160)
        {
            local_4 = ::FAIKnowledgeUtils::CheckTargetInSightCone(local_24, local_36, local_214.TargetPos, local_50);
            local_216 = false;
            if (local_4 && local_50.bCheckSightBlock)
            {
                local_216 = ::FAIVisibilityUtils::ResolveVisibility(Entity, local_214.Entity, local_24, local_214.TargetPos, local_52, Time.Time, VisibilityCache, VisibilityBudget, this.VisibilityCacheConfig);
            }
            else
            {
                local_216 = local_4;
            }
            this.UpdateAlertnessV2(Entity, Transform, local_214.Entity, AIKnowledge, AITargetingV2, local_216, local_8);
        }
        return;
    }
    UFUNCTION()
    void Job_NonPlayerSearchTargetV2(const FECSEntity &inout Entity, const FC_Transform &inout SelfTransform, FC_AITargetingV2 &inout AITargetingV2, FC_AIVisibilityCache &inout VisibilityCache) const
    {
        bool local_35 = false;
        float local_38;
        FFPTime local_48;
        float32 local_3 = FMath::Square(::FAIPerceptionUtils::GetOutOfCombatDistance(Entity));
        for (auto& local_24 : AITargetingV2.EntityAlertnessMap)
        {
            FECSEntity local_28 = FECSEntity(local_24.GetKey().GetEntity());
            FTargetEntity local_34 = FTargetEntity(local_28);
            if (!(::FAIKnowledgeUtils::IsTargetValid(local_28)))
            {
                ::FAIVisibilityUtils::InvalidateVisibilityCache(VisibilityCache, local_34);
                local_24.RemoveCurrent();
                continue;
            }
            local_35 = false;
            Get local_44;
            local_38 = SelfTransform.GetPosition().DistSquared2D(local_44.opCall().GetPosition());
            if ((local_38 > local_3))
            {
                local_48 = ECS::GetContextTime();
                FFPTime local_46 = local_48;
                if (local_48.opCmp(0.0) < 0)
                {
                }
                else
                {
                    bool local_21 = local_48.opCmp(::FAIPerceptionUtils::GetOutOfCombatDelay(Entity)) > 0 || (local_38 >= FMath::Square(::FAIPerceptionUtils::GetOutOfCombatMaxDistance(Entity)));
                    if (local_21)
                    {
                        local_21 = true;
                    }
                    else
                    {
                        Has local_54;
                        local_21 = local_54.opCall();
                    }
                    if (local_21)
                    {
                        ::FAIVisibilityUtils::InvalidateVisibilityCache(VisibilityCache, local_34);
                        local_24.RemoveCurrent();
                        continue;
                    }
                }
            }
            else
            {
                if (local_48.opCmp(0.0) > 0)
                {
                    if (FFPTime(1).opCmp(ECS::GetContextTime()) >= 0)
                    {
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_BroadcastAlertTargetsV2(const FECSEntity &inout Entity, const FC_Transform &inout SelfTransform, FC_AITargetingV2 &inout AITargetingV2) const
    {
        FECSRuntimeView local_22 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        Include local_48;
        local_48.opCall();
        Include local_52;
        local_52.opCall();
        Exclude(local_22).opCall();
        Exclude(local_22).opCall();
        Exclude(local_22).opCall();
        float local_66 = FMath::Square(::FAIPerceptionUtils::GetOutOfCombatDistance(Entity));
        float local_72 = 0.0;
        FECSRuntimeViewIterator local_106 = local_22.Iterator();
        for (; local_106.CanProceed;)
        {
            const FECSEntity& local_144 = local_106.Proceed();
            if (!(::FASCommonUtils::IsTargetEntityFriend(Entity, local_144)) || ::FAIKnowledgeUtils::ShouldKeepIndependentCombatGroup(local_144))
            {
                continue;
            }
            Get local_150;
            const FC_Transform& local_152 = local_150.opCall();
            if (local_152)
            {
                local_72 = SelfTransform.GetPosition().DistSquared(local_152.GetPosition());
                if (local_72 > local_66)
                {
                    continue;
                }
            }
            Modify local_156;
            FC_AITargetingV2& local_158 = local_156.opCall();
            if (local_158)
            {
                local_158.AlertBroadcastSources.Add(FTargetEntity(Entity));
                local_158.NextTargetingUpdateTime = FFPTime(0);
                FC_AINeedUpdateAITargetingTag local_170;
                Assign local_168;
                local_168.opCall(local_170);
            }
            Modify local_174;
            FC_AIKnowledge& local_176 = local_174.opCall();
            if (local_176)
            {
                local_176.NextKnowledgeUpdateTime = FFPTime(0);
                FC_AINeedUpdateAIKnowledgeTag local_182;
                Assign local_180;
                local_180.opCall(local_182);
            }
        }
        Remove local_186;
        local_186.opCall();
        return;
    }
    UFUNCTION()
    void Job_HandleHitHostilityV2(const FCE_HitAIHostility &inout Event) const
    {
        FC_AITargetingV2 local_20;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        FECSEntity local_8 = Event.Receiver;
        if ((local_4 == local_8))
        {
            return;
        }
        if (::FAIKnowledgeUtils::CanMuteCombat(local_8))
        {
            return;
        }
        if ((int(::FASCommonUtils::GetEntityFactionRelation(local_8, local_4))) == 4)
        {
            return;
        }
        if (!(local_20))
        {
            return;
        }
        if (::FAIKnowledgeUtils::CanEntityHasHostility(::FAIKnowledgeUtils::FindRootAvatarEntity(local_4)))
        {
            FNameHandle_EntityBBVar local_44;
            FTargetEntity local_26 = local_4;
            GetDefaulted local_36;
            GetDefaulted local_32;
            if ((local_32.opCall().GetPosition().Distance(local_36.opCall().GetPosition())) > (10000.0))
            {
                return;
            }
            float32 local_39 = 1.0f;
            local_44;
            if (local_26.GetEntity().HasEntityBB(local_44))
            {
                FNameHandle_EntityBBVarFloat local_48;
                local_48;
                local_39 = local_26.GetEntity().GetBB_Float(local_48);
            }
            ::FAITargetingUtils::AddHostilityByDamage(local_8, local_26, Event.Damage, local_39, ::FAIPerceptionUtils::GetHostilityAccumulationTime(local_8));
            local_20.EntityAlertnessMap.FindOrAdd(local_26).AlertnessValue = local_20.AlertnessMax;
            Modify local_56;
            FC_AIVisibilityCache& local_58 = local_56.opCall();
            if (local_58)
            {
                ::FAIVisibilityUtils::InvalidateVisibilityCache(local_58, local_26);
            }
            Has local_62;
            if (!(local_62.opCall()))
            {
                FC_AINeedBroadcastAlertTargetsTag local_68;
                Assign local_66;
                local_66.opCall(local_68);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_CheckTargetsHostilityMapV2(const FECSEntity &inout Entity, FC_AITargetingV2 &inout AITargetingV2, const FC_Transform &inout SelfTransform) const
    {
        Get local_34;
        for (auto& local_20 : AITargetingV2.TargetsHostilityMap)
        {
            if (!(::FAIKnowledgeUtils::CanEntityHasHostility(FECSEntity(local_20.GetKey().GetEntity()))))
            {
                local_20.RemoveCurrent();
                continue;
            }
            FECSEntity local_28 = local_20.GetKey().GetEntity();
            if (float32(SelfTransform.GetPosition().Distance(local_34.opCall().GetPosition())) > 10000.0f)
            {
                local_20.RemoveCurrent();
                continue;
            }
        }
        return;
    }
    UFUNCTION()
    void Job_AIHostilityDeclineV2(const FECSEntity &inout Entity, FC_AITargetingV2 &inout AITargetingV2) const
    {
        float32 local_5 = 0.0f;
        FFPTime local_4 = ECS::GetContextTime();
        FFPTime local_2 = local_4;
        float32 local_6 = ::FAIPerceptionUtils::GetOutOfCombatDistance(Entity);
        GetDefaulted local_32;
        GetDefaulted local_40;
        for (auto& local_26 : AITargetingV2.TargetsHostilityMap)
        {
            FECSEntity local_36 = local_26.GetKey().GetEntity();
            if ((local_32.opCall().GetPosition().Distance(local_40.opCall().GetPosition()) > local_6))
            {
                if (local_4.opCmp(0.0) < 0)
                {
                }
                else
                {
                    local_5 = ::FAIPerceptionUtils::GetHostilityRemainTime(Entity);
                    if (local_4.opCmp(local_5) > 0)
                    {
                        local_26.RemoveCurrent();
                        continue;
                    }
                }
            }
            else
            {
                if (local_4.opCmp(0.0) > 0)
                {
                    if (FFPTime(1).opCmp(ECS::GetContextTime()) >= 0)
                    {
                    }
                }
            }
            if (local_5 <= 0.0f)
            {
                local_26.RemoveCurrent();
                continue;
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ClearAllTargetsV2(const FECSEntity &inout Entity, FC_AITargetingV2 &inout AITargetingV2) const
    {
        AITargetingV2.AllTargets.Empty(0);
        return;
    }
    UFUNCTION()
    void Job_BuildAllTargetsV2(const FECSEntity &inout Entity, FC_AITargetingV2 &inout AITargetingV2) const
    {
        FC_AITargetingV2 local_66;
        TSet<FECSEntity> local_40 = ::FAITargetingUtils::GetCombatGroupMembers(Entity);
        for (auto& local_60 : local_40)
        {
            if (!(local_60.IsValid()))
            {
                continue;
            }
            if (!(local_66))
            {
                continue;
            }
            for (auto& local_84 : local_66.EntityAlertnessMap)
            {
                if (0.0f >= local_66.AlertnessMax)
                {
                    ::FAITargetingUtils::TryAddToAllTarget(AITargetingV2, local_84.GetKey().GetEntity());
                }
            }
            for (auto& local_108 : local_66.TargetsHostilityMap)
            {
                if (::FAIKnowledgeUtils::CheckTargetValidForCombat(Entity, local_108.GetKey().GetEntity()))
                {
                    ::FAITargetingUtils::TryAddToAllTarget(AITargetingV2, local_108.GetKey().GetEntity());
                }
            }
        }
        Get local_112;
        const FC_AITargetingBeTaunted& local_114 = local_112.opCall();
        if (local_114)
        {
            FECSEntity local_90 = ::FASCommonUtils::GetControlledPawnEntity(local_114.GetFromEntity());
            if (local_90.IsValid())
            {
                ::FAITargetingUtils::TryAddToAllTarget(AITargetingV2, local_90);
            }
        }
        for (auto& local_132 : AITargetingV2.ExternalTargets)
        {
            FECSEntity local_118 = local_132.Target.GetEntity();
            if (local_118.IsValid() && ::FAIKnowledgeUtils::IsTargetValid(local_118))
            {
                ::FAITargetingUtils::TryAddToAllTarget(AITargetingV2, local_118);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TickPlayerTargetV2(const FECSEntity &inout Entity, const FC_Transform &inout SelfTransform, const FCS_FixedTime &inout Time) const
    {
        Has local_6;
        bool local_1 = false;
        if (local_6.opCall())
        {
            local_1 = true;
        }
        TSet<FTargetEntity> local_46 = ::FAITargetingUtils::GetEntityCombatTargets(Entity);
        Has local_72;
        for (auto& local_64 : local_46)
        {
            FECSEntity local_68 = local_64.GetEntity();
            if (!(local_72.opCall()))
            {
                local_1 = true;
                break;
            }
        }
        ::FAITargetingUtils::UpdateCombatStateV2(Entity, local_1);
        Modify local_76;
        FC_AITargetingV2& local_78 = local_76.opCall();
        if (local_78)
        {
            local_78.NextTargetingUpdateTime = (FFPTime(Time.Time) + FFPTime((::FAIPlayerDistLODSchedule::GetStaggeredInterval(::FAIPlayerDistLODUtils::GetLODLevel(Entity), Entity.GetIdValue()))));
        }
        return;
    }
    UFUNCTION()
    void Job_TickNonPlayerAITarget(const FECSEntity &inout Entity, FC_AITargetingV2 &inout AITargeting, const FC_Transform &inout SelfTransform, const FCS_FixedTime &inout Time) const
    {
        ::FAITargetingUtils::UpdateNonPlayerAITargetV2(Entity, AITargeting);
        AITargeting.NextTargetingUpdateTime = (FFPTime(Time.Time) + FFPTime((::FAIPlayerDistLODSchedule::GetStaggeredInterval(::FAIPlayerDistLODUtils::GetLODLevel(Entity), Entity.GetIdValue()))));
        return;
    }
    UFUNCTION()
    void Job_SyncTargetingV2(const FECSEntity &inout Entity, const FC_AITargetingSync &inout Sync, FC_AITargetingV2 &inout AITargeting) const
    {
        bool local_5;
        FECSEntity local_4 = Sync.MasterEntity;
        if (!(local_4.IsValid()))
        {
            local_5 = true;
        }
        else
        {
            Has local_10;
            local_5 = local_10.opCall();
        }
        if (local_5)
        {
            ::FAITargetingUtils::ClearTargetingMaster(Entity);
            ::FAIQuitCombatUtils::ClearQuitCombatRuleOverride(Entity);
            FC_AINeedUpdateAITargetingTag local_18;
            Assign local_16;
            local_16.opCall(local_18);
            return;
        }
        ::FAITargetingUtils::SyncTargetingFromMaster(Entity, AITargeting, local_4);
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveAITargetingV2(const FECSEntity &inout Entity, const FC_AITargetingV2 &inout AITargetingV2) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        if (DelayTask::IsValidHandle(AITargetingV2.UpdateTargetingTaskHandle))
        {
            DelayTask::CancelTask(AITargetingV2.UpdateTargetingTaskHandle);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnDeathClearVisibilityCache(const FECSEntity &inout Entity, const FC_DeathTag &inout DeathTag) const
    {
        Modify local_4;
        FC_AIVisibilityCache& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.Cache.Empty(0);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnExitCombatV2(const FECSEntity &inout Entity, const FC_AICombatTag &inout AICombatTag) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        Modify local_6;
        FC_AITargetingV2& local_8 = local_6.opCall();
        if (local_8)
        {
            if (DelayTask::IsValidHandle(local_8.UpdateTargetingTaskHandle))
            {
                DelayTask::CancelTask(local_8.UpdateTargetingTaskHandle);
                local_8.UpdateTargetingTaskHandle = FDelayTaskConst::EmptyDelayTaskHandle;
            }
            local_8.QueryOutputRecords.Empty(0);
            local_8.CurrentQueryOutput.Empty(0);
            ::FAITargetingUtils::ApplySelectedResult(Entity, local_8, FAITargetingQueryResult());
            local_8.SelectedMarks.Empty(0);
        }
        Modify local_18;
        FC_AIVisibilityCache& local_20 = local_18.opCall();
        if (local_20)
        {
            local_20.Cache.Empty(0);
        }
        return;
    }
    UFUNCTION()
    void Job_CalculateAttackTargetCount(const FECSEntity &inout Entity, FC_AITargetingV2 &inout AITargeting) const
    {
        int local_24 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FTargetEntity local_12 = FTargetEntity(Entity);
        FECSEntity local_20 = ::FAITargetingUtils::GetCurrentAttackTarget(Entity);
        if ((!((local_20 == ENTITY_NULL))))
        {
            FTargetEntity local_10 = FTargetEntity(local_20);
            local_24.AttackTargetSet.Add(FTargetEntity(Entity));
        }
        for (auto& local_38 : AITargeting.CurrentTopQueryResult.GetEntries())
        {
            FTargetEntity local_10_2 = FTargetEntity(local_38.GetEntity());
            local_24.AttackTargetSet.Add(local_12);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnBeTauntedChanged(const FC_AITargetingBeTaunted &inout BeTaunted, const FECSEntity &inout Entity) const
    {
        FECSEntity local_8 = ::FASCommonUtils::GetControlledPawnEntity(BeTaunted.GetFromEntity());
        Modify local_12;
        FC_AITargetingV2& local_14 = local_12.opCall();
        if (local_14)
        {
            ::FAITargetingUtils::TryAddToAllTarget(local_14, local_8);
        }
        FC_AINeedUpdateAITargetingTag local_22;
        Assign local_20;
        local_20.opCall(local_22);
        return;
    }
    UFUNCTION()
    void Job_UpdateEntityTaunting(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_AITargetingTaunting &inout AITaunting) const
    {
        if (AITaunting.GetTauntNum() <= 0)
        {
            Remove local_8;
            local_8.opCall();
            return;
        }
        else
        {
            Remove local_8;
            if (FFPTime(AITaunting.GetTauntEndTime()).opCmp(FixedTime.Time) < 0)
            {
                local_8.opCall();
                return;
            }
        }
    }
    UFUNCTION()
    void Job_UpdateTauntAITarget(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_AITargetingBeTaunted &inout TargetingBeTaunted) const
    {
        int local_22 = 0;
        bool local_1 = false;
        FECSEntity local_10 = ::FASCommonUtils::GetControlledPawnEntity(TargetingBeTaunted.GetFromEntity());
        if (Entity.MatchGameplayTag(GameplayTags::CombatAI_ImmuneTaunt))
        {
            local_1 = true;
        }
        else
        {
            bool local_2 = !(local_10.IsValid()) || !(local_10.IsActive());
            if (local_2)
            {
                local_2 = true;
            }
            else
            {
                Has local_16;
                local_2 = local_16.opCall();
            }
            if (local_2)
            {
                local_1 = true;
            }
            else
            {
                if (FFPTime(TargetingBeTaunted.GetTauntEndTime()).opCmp(FixedTime.Time) < 0)
                {
                    local_1 = true;
                }
            }
        }
        if (local_1)
        {
            if (local_22)
            {
                local_22.SetTauntNum((local_22.GetTauntNum() - 1));
            }
            Remove local_32;
            local_32.opCall();
        }
        return;
    }
    void DisposeShowTauntArrow(const FECSEntity &inout Entity, const FECSEntity &inout FromEntity, const FFPTime &inout StartTime) const
    {
        Has local_4;
        int local_8 = 0;
        const AActor local_224;
        int local_238 = 0;
        if (!(local_4.opCall()))
        {
            local_8.StartTime = StartTime;
            FFXConfig local_128;
            local_128.SetAsset(System::GetSoftClassPath(this.TauntLinkEffect));
            local_128.SetbUseWorldOriginAsBaseTransformSource(true);
            local_128.SetbDetach(true);
            local_128.SetLocationOffsetSpace(EFXOffsetSpace(2));
            local_128.SetRotationOffsetSpace(EFXOffsetSpace(2));
            local_8.FXEntity = ECSFX::PlayFXDurational(Entity, local_128, FFPTime(ECS::GetContextTime().ToSeconds()), 1.0f, false);
        }
        if (!(local_8.FXEntity.IsValid()))
        {
            return;
        }
        if (!(Entity.IsValid()) || !(FromEntity.IsValid()))
        {
            return;
        }
        Get local_168;
        FVector local_164 = local_168.opCall().GetPosition();
        FVector local_174 = local_168.opCall().GetPosition();
        FVector local_186 = (local_164 - local_174);
        local_186.Normalize(9.99999993922529e-9);
        float local_192 = FMath::Clamp(((local_164.Distance(local_174) * 0.25) + 25.0), 50.0, 150.0);
        float local_190 = 50.0 + local_192;
        FVector local_180 = (local_186 * local_190);
        FVector local_208 = (local_174 + local_180);
        local_180 = (local_174 + (local_186 * 50.0));
        FVector local_220;
        local_224 = FromEntity.GetActor();
        USkeletalMeshComponent local_228 = Cast<USkeletalMeshComponent>(local_224.GetComponentByClass(USkeletalMeshComponent));
        if ((!((local_228.GetSocketBoneName(n"DefaultLockSocket") == NAME_None))))
        {
            local_220 = local_228.GetSocketLocation(n"DefaultLockSocket");
        }
        FVector local_202_2 = (FVector(FVector::UpVector) * 40.0);
        local_238.Location = (FVector(local_168.opCall().GetPosition()) + local_202_2);
        local_238.Rotation = local_168.opCall().GetRotation();
        float local_194 = ECS::GetContextTime().ToSeconds();
        float local_196 = local_8.StartTime.ToSeconds();
        if (local_194 <= (local_196 + this.AnimLength))
        {
            float local_248 = local_194 - local_196;
            local_208 = FMath::EaseOut(local_164, local_208, float32((local_248 / this.AnimLength)), 2.0f);
            local_248 = local_194 - local_196;
            local_180 = FMath::EaseOut(local_164, local_180, float32((local_248 / this.AnimLength)), 4.0f);
        }
        FVector local_202_3 = (FVector(FVector::UpVector) * 40.0);
        ECSFX::SetFXParameterVector(local_8.FXEntity, this.TauntLinkFXBeamStartName, (local_208 + local_202_3));
        FVector local_202_4 = (FVector(FVector::UpVector) * 20.0);
        ECSFX::SetFXParameterVector(local_8.FXEntity, this.TauntLinkFXBeamEndName, (local_180 + local_202_4));
        ECSFX::SetFXParameterVector(local_8.FXEntity, this.TauntFXTopName, local_220);
        return;
    }
    UFUNCTION()
    void ClientJob_ShowTauntArrow(const FECSEntity &inout Entity, const FC_AITargetingBeTaunted &inout TargetingBeTaunted, const FCS_FixedTime &inout FixedTime) const
    {
        if ((int(::FASCommonUtils::GetMonsterRank(Entity))) != 2)
        {
            return;
        }
        if (!(TargetingBeTaunted.GetbShowArrow()))
        {
            Get local_8;
            const FC_BeTauntedFX& local_10 = local_8.opCall();
            if (local_10)
            {
                ECSFX::StopFX(local_10.FXEntity, true, false, 0.0f);
                Remove local_16;
                local_16.opCall();
            }
            return;
        }
        FECSEntity local_24 = ::FASCommonUtils::GetControlledPawnEntity(TargetingBeTaunted.GetFromEntity());
        this.DisposeShowTauntArrow(Entity, local_24, FixedTime.Time);
        return;
    }
    UFUNCTION()
    void ClientJob_ShowAIForceLockTargetArrow(const FECSEntity &inout Entity, const FC_AIForceLockTarget &inout AIForceLockTarget, const FCS_FixedTime &inout FixedTime) const
    {
        int local_6 = 0;
        if (!(AIForceLockTarget.GetbShowArrow()))
        {
            return;
        }
        if ((int(::FASCommonUtils::GetMonsterRank(Entity))) != 2)
        {
            return;
        }
        if (!(local_6))
        {
            return;
        }
        FECSEntity local_14 = local_6.GetTargetEntity();
        this.DisposeShowTauntArrow(Entity, local_14, FixedTime.Time);
        return;
    }
    UFUNCTION()
    void ClientJob_RemoveTauntArrow(const FECSEntity &inout Entity, FC_BeTauntedFX &inout TargetingBeTaunted) const
    {
        int local_8 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            if (local_8.GetRefCount() > 0 || local_8.GetbShowArrow())
            {
                return;
            }
        }
        ECSFX::StopFX(TargetingBeTaunted.FXEntity, true, false, 0.0f);
        Remove local_20;
        local_20.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_AddCombatStateWithDelayWhileEnterCombat(const FECSEntity &inout Entity, const FC_AICombatTag &inout AICombatTag) const
    {
        int local_12 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            local_12.SetDelayToTime(FFPTime(-1));
        }
        return;
    }
    UFUNCTION()
    void Monitor_AddCombatStateWithDelayWhileQuitCombat(const FECSEntity &inout Entity, const FC_AICombatTag &inout AICombatTag) const
    {
        int local_12 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            local_12.SetDelayToTime((ECS::GetContextTime() + FFPTime(5)));
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateCombatStateWithDelay(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, FC_AICombatStateWithDelay &inout AICombatStateWithDelay) const
    {
        Has local_4;
        if (!(local_4.opCall()) && (FFPTime(AICombatStateWithDelay.GetDelayToTime()).opCmp(FixedTime.Time) >= 0))
        {
            Remove local_14;
            local_14.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_TickAITargetingPlayerMakeNoise(const FECSEntity &inout Entity, const FC_Transform &inout Transform) const
    {
        int local_6 = 0;
        FIntVector2 local_8 = ::FCS_AITargetingPlayerNoiseSensor::PositionAsLocation(Transform.GetPosition());
        if ((!((local_6.Location == local_8))))
        {
            local_6.Location = local_8;
            FECSWorldPtr local_14 = Entity.GetWorld();
            ModifyOrAdd local_18;
            local_18.opCall().NoiseLocations.Add(local_8);
        }
        return;
    }
    UFUNCTION()
    void Job_ApplyPlayerNoiseAttraction(const FCS_AITargetingPlayerNoiseSensor &inout NoiseSensor, FC_AIKnowledge &inout AIKnowledge, const FECSEntity &inout Entity, const FC_Transform &inout Transform) const
    {
        FIntVector2 local_2 = ::FCS_AITargetingPlayerNoiseSensor::PositionAsLocation(Transform.GetPosition());
        for (auto& local_24 : NoiseSensor.NoiseLocations)
        {
            if (::FCS_AITargetingPlayerNoiseSensor::IsInNoiseRange(local_2, local_24))
            {
                AIKnowledge.NextKnowledgeUpdateTime = FFPTime(0);
                FC_AINeedUpdateAITargetingTag local_34;
                Assign local_32;
                local_32.opCall(local_34);
                FC_AINeedUpdateAIKnowledgeTag local_40;
                Assign local_38;
                local_38.opCall(local_40);
                break;
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandlePlayerEnterCombat(const FCE_AIEnterCombat &inout Event) const
    {
        Has local_6;
        if (!(Event.Sender.IsValid()) || !(local_6.opCall()))
        {
            return;
        }
        FNameHandle_EntityBBVarBool local_12;
        local_12;
        Event.Sender.SetBB_Bool(local_12, n"bIsInCombat");
        Assign local_16;
        FC_AICombatTag local_18;
        local_16.opCall(local_18);
        Get local_22;
        const FC_ControlledByPlayer& local_24 = local_22.opCall();
        if (local_24)
        {
            FECSEntity local_32 = local_24.GetPlayerEntity();
            if (local_32.IsValid() && !((local_32 == Event.Sender)))
            {
                local_16.opCall(local_18);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandlePlayerQuitCombat(const FCE_AIQuitCombat &inout Event) const
    {
        Has local_6;
        if (!(Event.Sender.IsValid()) || !(local_6.opCall()))
        {
            return;
        }
        FNameHandle_EntityBBVarBool local_12;
        local_12;
        Event.Sender.SetBB_Bool(local_12, n"bIsInCombat");
        Remove local_16;
        local_16.opCall();
        Get local_20;
        const FC_ControlledByPlayer& local_22 = local_20.opCall();
        if (local_22)
        {
            FECSEntity local_30 = local_22.GetPlayerEntity();
            if (local_30.IsValid() && !((local_30 == Event.Sender)))
            {
                local_16.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateLockCurrentAttackTarget(const FECSEntity &inout Entity) const
    {
        int local_10 = 0;
        int local_1 = Debug::CVar_Debug_EnableCombatAI.GetInt();
        if (local_1 == 1)
        {
            FECSEntity local_18 = ::FAITargetingUtils::GetCurrentAttackTarget(Entity);
            if (!(local_10) || (local_18.IsValid() && !((FECSEntity(local_10.GetTargetEntity()) == local_18))))
            {
                int local_1_2 = ::FASCommonUtils::GetTargetLockPointIndex(Entity, local_18);
                ::FLockTargetUtils::UpdateLockTarget(Entity, local_18, local_1_2, ELockTargetType(2), true, 0.0f);
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_ClearLockCurrentAttackTarget(const FECSEntity &inout Entity, const FC_AITmpLockCurrentAttackTargetTag &inout AITmpLockCurrentAttackTarget) const
    {
        Has local_4;
        Has local_10;
        if (local_4.opCall() && !(local_10.opCall()))
        {
            ::FLockTargetUtils::ClearLockTarget(Entity);
        }
        return;
    }
    UFUNCTION()
    void Job_TmpClearLockTargetWhileQuitCombat(const FCE_AIQuitCombat &inout Event) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            Has local_10;
            if (!(local_10.opCall()))
            {
                ::FLockTargetUtils::ClearLockTarget(Event.Sender);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ResetAIPlayerDistanceLODManager(FCS_AIPlayerDistanceLODManager &inout LODSingleton) const
    {
        if (!(CVar_AI_EnableCombatLOD.GetBool()))
        {
            return;
        }
        LODSingleton.PlayerPawnPositions.Reset(0);
        return;
    }
    UFUNCTION()
    void Job_UpdatePlayerPawnPositionCache(const FECSEntity &inout Entity, const FC_PlayerController &inout PC) const
    {
        int local_10 = 0;
        if (!(CVar_AI_EnableCombatLOD.GetBool()))
        {
            return;
        }
        FECSWorldPtr local_4 = this.GetECSWorld();
        if (PC.GetPlayerPawnEntity().IsValid())
        {
            Get local_14;
            const FC_Transform& local_16 = local_14.opCall();
            if (local_16)
            {
                local_10.PlayerPawnPositions.Add(local_16.GetPosition());
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ResetAIPlayerDistanceLODLevel(const FECSEntity &inout Entity, FC_AIPlayerDistanceLOD &inout LODComp) const
    {
        if (CVar_AI_EnableCombatLOD.GetBool())
        {
            return;
        }
        if (int(LODComp.LODLevel) != -1)
        {
            LODComp.LODLevel = -1;
            Modify local_8;
            FC_AIKnowledge& local_10 = local_8.opCall();
            if (local_10)
            {
                local_10.NextKnowledgeUpdateTime = FFPTime(0);
            }
            Modify local_16;
            FC_AITargetingV2& local_18 = local_16.opCall();
            if (local_18)
            {
                local_18.NextTargetingUpdateTime = FFPTime(0);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateAIPlayerDistanceLOD(const FECSEntity &inout Entity, const FC_Transform &inout Transform, const FCS_AIPlayerDistanceLODManager &inout LODSingleton) const
    {
        if (!(CVar_AI_EnableCombatLOD.GetBool()))
        {
            return;
        }
        FC_AIPlayerDistanceLOD local_8;
        int local_9 = int(local_8.LODLevel);
        float32 local_12 = LODSingleton.GetMinDistSqToPlayer(Transform.GetPosition());
        int local_10 = LODSingleton.ComputeLODLevel(local_12, local_9);
        if (local_10 != local_9)
        {
            FCE_AIPlayerDistLODChanged local_22;
            local_8.LODLevel = local_10;
            FFPTime local_20 = FFPTime(-1);
            local_22.OldLevel = local_9;
            local_22.NewLevel = local_10;
        }
        return;
    }
    UFUNCTION()
    void Job_HandleAIPlayerDistLODChanged(const FCE_AIPlayerDistLODChanged &inout Event) const
    {
        if (!(FECSEntity(Event.Sender).IsValid()))
        {
            return;
        }
        if (int(Event.NewLevel) >= 0 && (int(Event.OldLevel) < 0 || (int(Event.NewLevel) < int(Event.OldLevel))))
        {
            Modify local_14;
            FC_AIKnowledge& local_16 = local_14.opCall();
            if (local_16)
            {
                local_16.NextKnowledgeUpdateTime = FFPTime(0);
                FC_AINeedUpdateAIKnowledgeTag local_24;
                Assign local_22;
                local_22.opCall(local_24);
            }
            Modify local_28;
            FC_AITargetingV2& local_30 = local_28.opCall();
            if (local_30)
            {
                local_30.NextTargetingUpdateTime = FFPTime(0);
                FC_AINeedUpdateAITargetingTag local_36;
                Assign local_34;
                local_34.opCall(local_36);
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CheckCurrentTargetValidationV2() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_CheckCurrentTargetValidationV2(local_6, local_40, local_42);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_CheckCurrentTargetValidationV2(local_6, local_174, local_42);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateCombatKnowledgeOnEnterCombat() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAICombatTagOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateCombatKnowledgeOnEnterCombat(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickAITargetingNeedUpdateIntervalV2() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_170 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_TickAITargetingNeedUpdateIntervalV2(local_6, local_40, local_42);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        local_92.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_88.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickAITargetingNeedUpdateIntervalV2(local_6, local_170, local_42);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitGlobalTemplateQueryConfig() const
    {
        ECS::GetContextJob();
        this.Job_InitGlobalTemplateQueryConfig();
        return;
    }
    UFUNCTION()
    void Run_Job_InitAIPlayerDistanceLOD() const
    {
        ECS::GetContextJob();
        this.Job_InitAIPlayerDistanceLOD();
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitAITargetingV2OnAssigned() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAITargetingV2OnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InitAITargetingV2OnAssigned(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateSpreadAndOutOfCombatDistanceV2() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_194 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_UpdateSpreadAndOutOfCombatDistanceV2(local_36, local_38, local_44, local_50);
                local_58.opCall(local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_96.Iterator();
        for (; local_156.CanProceed;)
        {
            local_36 = local_156.Proceed();
            ++local_122;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdateSpreadAndOutOfCombatDistanceV2(local_194, local_38, local_44, local_50);
            local_58.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_122);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateCurrentAlertTargetsV2() const
    {
        int local_18 = 0;
        int local_20 = 0;
        int local_26 = 0;
        int local_62 = 0;
        int local_68 = 0;
        int local_74 = 0;
        int local_80 = 0;
        int local_86 = 0;
        int local_92 = 0;
        int local_264 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_3 = this.GetECSWorld();
        FECSWorldPtr local_6_4 = this.GetECSWorld();
        int local_32 = 0;
        int local_31 = local_32;
        if (local_4.IsViewCacheUsable())
        {
            MarkModifiedIfDirty local_108;
            MarkModifiedIfDirty local_104;
            MarkModifiedIfDirty local_100;
            const FECSEntity& local_60;
            FECSWorldPtr local_6_5 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_36 = local_4.GetViewCacheEntities();
            int local_37 = 0;
            for (auto& local_52 : local_36)
            {
                local_52;
                FECSEntity local_56;
                if (!(local_56.IsValid()))
                {
                    continue;
                }
                ++local_37;
                FECSEntityScopeCycleCounter local_57 = FECSEntityScopeCycleCounter(local_56);
                this.Job_UpdateCurrentAlertTargetsV2(local_18, local_60, local_62, local_68, local_20, local_74, local_80, local_86, local_92, local_26);
                local_100.opCall(local_62);
                local_104.opCall(local_68);
                local_108.opCall(local_92);
            }
            local_4.UpdateCachedEntityCount(local_37);
        }
        else
        {
            MarkModifiedIfDirty local_108;
            MarkModifiedIfDirty local_104;
            MarkModifiedIfDirty local_100;
            const FECSEntity& local_60;
            FECSRuntimeView local_146 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
            Include local_150;
            local_150.opCall();
            Include local_154;
            local_154.opCall();
            Include local_158;
            local_158.opCall();
            Include local_162;
            local_162.opCall();
            Include local_166;
            local_166.opCall();
            Include local_170;
            local_170.opCall();
            Include local_174;
            local_174.opCall();
            Exclude(local_146).opCall();
            Exclude(local_146).opCall();
            Exclude(local_146).opCall();
            Exclude(local_146).opCall();
            bool local_11 = local_4.BeginViewCacheBuild();
            int local_38 = local_4.GetViewCacheEpoch();
            int local_192 = 0;
            FECSRuntimeViewIterator local_226 = local_146.Iterator();
            for (; local_226.CanProceed;)
            {
                local_60 = local_226.Proceed();
                ++local_192;
                if (local_11)
                {
                    local_4.AddViewCacheEntity(local_60.GetId());
                }
                FECSEntityScopeCycleCounter local_57_2 = FECSEntityScopeCycleCounter(local_60);
                this.Job_UpdateCurrentAlertTargetsV2(local_18, local_264, local_62, local_68, local_20, local_74, local_80, local_86, local_92, local_26);
                local_100.opCall(local_62);
                local_104.opCall(local_68);
                local_108.opCall(local_92);
            }
            local_4.UpdateCachedEntityCount(local_192);
            if (local_11)
            {
                local_4.CommitViewCacheBuild(local_38);
            }
        }
        FECSWorldPtr local_34 = this.GetECSWorld();
        MarkModifiedIfDirty local_268;
        local_268.opCall(local_26);
        return;
    }
    UFUNCTION()
    void Run_Job_NonPlayerSearchTargetV2() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        MarkModifiedIfDirty local_62;
        int local_206 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_NonPlayerSearchTargetV2(local_36, local_38, local_44, local_50);
                local_58.opCall(local_44);
                local_62.opCall(local_50);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        Exclude(local_100).opCall();
        Exclude(local_100).opCall();
        Exclude(local_100).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_134 = 0;
        FECSRuntimeViewIterator local_168 = local_100.Iterator();
        for (; local_168.CanProceed;)
        {
            local_36 = local_168.Proceed();
            ++local_134;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_NonPlayerSearchTargetV2(local_206, local_38, local_44, local_50);
            local_58.opCall(local_44);
            local_62.opCall(local_50);
        }
        local_2.UpdateCachedEntityCount(local_134);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BroadcastAlertTargetsV2() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_198 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.5))))
        {
            return;
        }
        int local_11 = 0;
        int local_10 = local_11;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_14 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_18 = local_4.GetViewCacheEntities();
            int local_19 = 0;
            for (auto& local_34 : local_18)
            {
                local_34;
                FECSEntity local_38;
                if (!(local_38.IsValid()))
                {
                    continue;
                }
                ++local_19;
                FECSEntityScopeCycleCounter local_39 = FECSEntityScopeCycleCounter(local_38);
                this.Job_BroadcastAlertTargetsV2(local_42, local_44, local_50);
                local_58.opCall(local_50);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_126 = 0;
        FECSRuntimeViewIterator local_160 = local_96.Iterator();
        for (; local_160.CanProceed;)
        {
            local_42 = local_160.Proceed();
            ++local_126;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.Job_BroadcastAlertTargetsV2(local_198, local_44, local_50);
            local_58.opCall(local_50);
        }
        local_4.UpdateCachedEntityCount(local_126);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleHitHostilityV2() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HitAIHostility> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HitAIHostility& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleHitHostilityV2(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CheckTargetsHostilityMapV2() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_180 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_CheckTargetsHostilityMapV2(local_36, local_38, local_44);
                local_52.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_CheckTargetsHostilityMapV2(local_180, local_38, local_44);
            local_52.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_AIHostilityDeclineV2() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_AIHostilityDeclineV2(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_AIHostilityDeclineV2(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearAllTargetsV2() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ClearAllTargetsV2(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearAllTargetsV2(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BuildAllTargetsV2() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_178 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_BuildAllTargetsV2(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        Exclude(local_84).opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_84.Iterator();
        for (; local_140.CanProceed;)
        {
            local_36 = local_140.Proceed();
            ++local_106;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_BuildAllTargetsV2(local_178, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_106);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickPlayerTargetV2() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_178 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_TickPlayerTargetV2(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_84).opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_84.Iterator();
        for (; local_140.CanProceed;)
        {
            local_40 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickPlayerTargetV2(local_178, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickNonPlayerAITarget() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_192 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_TickNonPlayerAITarget(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_AITargetingV2> local_56;
                local_56.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_94).opCall();
        Exclude(local_94).opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_120 = 0;
        FECSRuntimeViewIterator local_154 = local_94.Iterator();
        for (; local_154.CanProceed;)
        {
            local_40 = local_154.Proceed();
            ++local_120;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickNonPlayerAITarget(local_192, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_AITargetingV2>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_120);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SyncTargetingV2() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_180 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_SyncTargetingV2(local_36, local_38, local_44);
                local_52.opCall(local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        Exclude(local_90).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_SyncTargetingV2(local_180, local_38, local_44);
            local_52.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveAITargetingV2() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAITargetingV2OnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveAITargetingV2(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnDeathClearVisibilityCache() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorDeathTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnDeathClearVisibilityCache(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnExitCombatV2() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAICombatTagOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnExitCombatV2(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CalculateAttackTargetCount() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_174 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_CalculateAttackTargetCount(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_36 = local_136.Proceed();
            ++local_102;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_CalculateAttackTargetCount(local_174, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_102);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnBeTauntedChanged() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAITargetingBeTauntedOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnBeTauntedChanged(local_50, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorAITargetingBeTauntedOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_48_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnBeTauntedChanged(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateEntityTaunting() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_166 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdateEntityTaunting(local_40, local_6, local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_40 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateEntityTaunting(local_166, local_6, local_42);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateTauntAITarget() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_166 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdateTauntAITarget(local_40, local_6, local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_40 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateTauntAITarget(local_166, local_6, local_42);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ShowTauntArrow() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_166 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ClientJob_ShowTauntArrow(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_40 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_ShowTauntArrow(local_166, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ShowAIForceLockTargetArrow() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_166 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ClientJob_ShowAIForceLockTargetArrow(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_40 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_ShowAIForceLockTargetArrow(local_166, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_RemoveTauntArrow() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_RemoveTauntArrow(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_RemoveTauntArrow(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_AddCombatStateWithDelayWhileEnterCombat() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAICombatTagOnAssignView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_AddCombatStateWithDelayWhileEnterCombat(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_AddCombatStateWithDelayWhileQuitCombat() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAICombatTagOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_AddCombatStateWithDelayWhileQuitCombat(local_46, local_52);
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_UpdateCombatStateWithDelay(const FC_AICombatStateWithDelay &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetDelayToTime());
        FName local_8 = FName("S_AITargetingSystemV2::Job_UpdateCombatStateWithDelay");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_UpdateCombatStateWithDelay(const FC_AICombatStateWithDelay &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetDelayToTime());
        FName local_8 = FName("S_AITargetingSystemV2::Job_UpdateCombatStateWithDelay");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_UpdateCombatStateWithDelay() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorAICombatStateWithDelayOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_UpdateCombatStateWithDelay(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorAICombatStateWithDelayOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_UpdateCombatStateWithDelay(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_UpdateCombatStateWithDelay() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorAICombatStateWithDelayOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_UpdateCombatStateWithDelay(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorAICombatStateWithDelayOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_UpdateCombatStateWithDelay(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateCombatStateWithDelay() const
    {
        int local_6 = 0;
        int local_42 = 0;
        int local_50 = 0;
        int local_52 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            bool local_11 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetDelayToTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetDelayToTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (local_11)
            {
                continue;
            }
            this.Job_UpdateCombatStateWithDelay(local_50, local_6, local_52);
            MarkModifiedIfDirty local_60;
            local_60.opCall(local_52);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Job_TickAITargetingPlayerMakeNoise() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_TickAITargetingPlayerMakeNoise(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_80.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_TickAITargetingPlayerMakeNoise(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ApplyPlayerNoiseAttraction() const
    {
        int local_12 = 0;
        int local_46 = 0;
        const FECSEntity& local_52;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_198 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 0;
        int local_17 = local_18;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_2.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.Job_ApplyPlayerNoiseAttraction(local_12, local_46, local_52, local_54);
                local_62.opCall(local_46);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_100).opCall();
        Exclude(local_100).opCall();
        Exclude(local_100).opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_126 = 0;
        FECSRuntimeViewIterator local_160 = local_100.Iterator();
        for (; local_160.CanProceed;)
        {
            local_52 = local_160.Proceed();
            ++local_126;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_52.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_52);
            this.Job_ApplyPlayerNoiseAttraction(local_12, local_46, local_198, local_54);
            local_62.opCall(local_46);
        }
        local_2.UpdateCachedEntityCount(local_126);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandlePlayerEnterCombat() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AIEnterCombat> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AIEnterCombat& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandlePlayerEnterCombat(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandlePlayerQuitCombat() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AIQuitCombat> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AIQuitCombat& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandlePlayerQuitCombat(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateLockCurrentAttackTarget() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_UpdateLockCurrentAttackTarget(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdateLockCurrentAttackTarget(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClearLockCurrentAttackTarget() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAITmpLockCurrentAttackTargetTagOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClearLockCurrentAttackTarget(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TmpClearLockTargetWhileQuitCombat() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AIQuitCombat> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AIQuitCombat& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_TmpClearLockTargetWhileQuitCombat(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ResetAIPlayerDistanceLODManager() const
    {
        int local_18 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        FECSWorldPtr local_12 = this.GetECSWorld();
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        FECSWorldPtr local_12_2 = this.GetECSWorld();
        this.Job_ResetAIPlayerDistanceLODManager(local_18);
        FECSWorldPtr local_12_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_26;
        local_26.opCall(local_18);
        return;
    }
    UFUNCTION()
    void Run_Job_UpdatePlayerPawnPositionCache() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        int local_164 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        int local_11 = 0;
        int local_10 = local_11;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_14 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_18 = local_4.GetViewCacheEntities();
            int local_19 = 0;
            for (auto& local_34 : local_18)
            {
                local_34;
                FECSEntity local_38;
                if (!(local_38.IsValid()))
                {
                    continue;
                }
                ++local_19;
                FECSEntityScopeCycleCounter local_39 = FECSEntityScopeCycleCounter(local_38);
                this.Job_UpdatePlayerPawnPositionCache(local_42, local_44);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_86.Iterator();
        for (; local_126.CanProceed;)
        {
            local_42 = local_126.Proceed();
            ++local_92;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.Job_UpdatePlayerPawnPositionCache(local_164, local_44);
        }
        local_4.UpdateCachedEntityCount(local_92);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ResetAIPlayerDistanceLODLevel() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_168 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        int local_11 = 0;
        int local_10 = local_11;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_14 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_18 = local_4.GetViewCacheEntities();
            int local_19 = 0;
            for (auto& local_34 : local_18)
            {
                local_34;
                FECSEntity local_38;
                if (!(local_38.IsValid()))
                {
                    continue;
                }
                ++local_19;
                FECSEntityScopeCycleCounter local_39 = FECSEntityScopeCycleCounter(local_38);
                this.Job_ResetAIPlayerDistanceLODLevel(local_42, local_44);
                local_52.opCall(local_44);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        local_94.opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_90.Iterator();
        for (; local_130.CanProceed;)
        {
            local_42 = local_130.Proceed();
            ++local_96;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.Job_ResetAIPlayerDistanceLODLevel(local_168, local_44);
            local_52.opCall(local_44);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateAIPlayerDistanceLOD() const
    {
        int local_18 = 0;
        const FECSEntity& local_52;
        int local_54 = 0;
        int local_186 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        FECSWorldPtr local_12 = this.GetECSWorld();
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        FECSWorldPtr local_12_2 = this.GetECSWorld();
        int local_24 = 0;
        int local_23 = local_24;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_28 = local_4.GetViewCacheEntities();
            int local_29 = 0;
            for (auto& local_44 : local_28)
            {
                local_44;
                FECSEntity local_48;
                if (!(local_48.IsValid()))
                {
                    continue;
                }
                ++local_29;
                FECSEntityScopeCycleCounter local_49 = FECSEntityScopeCycleCounter(local_48);
                this.Job_UpdateAIPlayerDistanceLOD(local_52, local_54, local_18);
            }
            local_4.UpdateCachedEntityCount(local_29);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_30 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_52 = local_148.Proceed();
            ++local_114;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_52.GetId());
            }
            FECSEntityScopeCycleCounter local_49_2 = FECSEntityScopeCycleCounter(local_52);
            this.Job_UpdateAIPlayerDistanceLOD(local_186, local_54, local_18);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_30);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleAIPlayerDistLODChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AIPlayerDistLODChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AIPlayerDistLODChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleAIPlayerDistLODChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

struct __Lambda_Gameplay_AI_S_AITargetingSystemV2_201
{
    UPROPERTY()
    FECSEntity __Entity;

    __Lambda_Gameplay_AI_S_AITargetingSystemV2_201()
    {
        return;
    }
    __Lambda_Gameplay_AI_S_AITargetingSystemV2_201(const FECSEntity &inout _InEntity)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FECSEntity GetEntity() property
    {
        FECSEntity __r;
        return __r;
    }
    void opCall()
    {
        int local_4 = 0;
        if (!(this.GetEntity().IsValid()))
        {
            return;
        }
        if (!(local_4))
        {
            return;
        }
        local_4.UpdateTargetingTaskHandle = FDelayTaskConst::EmptyDelayTaskHandle;
        FC_AINeedUpdateAITargetingTag local_14;
        Assign local_12;
        local_12.opCall(local_14);
        return;
    }
}

struct __Lambda_Gameplay_AI_S_AITargetingSystemV2_338
{
    __Lambda_Gameplay_AI_S_AITargetingSystemV2_338()
    {
        return;
    }
    bool opCall(const FPrioritizedTarget &inout A, const FPrioritizedTarget &inout B)
    {
        return (A.Priority < B.Priority);
    }
}

