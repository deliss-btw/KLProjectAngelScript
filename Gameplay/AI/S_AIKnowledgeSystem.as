

class US_AIKnowledgeSystem : UECSScriptSystem
{
    UPROPERTY()
    FRuntimeFloatCurve DefaultAlertnessRatioCurveByDistance;
    UPROPERTY()
    FRuntimeFloatCurve DefaultAlertnessRatioCurveByAngleOffset;
    UPROPERTY()
    UAIAlertnessConfigDataAsset CommonAIAlertnessConfig;
    UPROPERTY()
    TMap<EMonsterRank, float32> BeTargetedStressScoreByMonsterRank;
    float32 UpdateFactionTargetableEntitiesInterval;

    US_AIKnowledgeSystem()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void Monitor_TryRefreshTargetingWhileTargetEntityRelive(const FECSEntity &inout Entity, const FC_DeathTag &inout DeathTag) const
    {
        int local_14 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            FECSWorldPtr local_8 = this.GetECSWorld();
            local_14.RefreshByTargetSet.Add(FTargetEntity(Entity));
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnAIKnowledgeAssign(const FECSEntity &inout Entity, const FC_AIKnowledge &inout AIKnowledge) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            return;
        }
        Get local_12;
        if (local_12.opCall())
        {
            ECS::GetContextTime();
        }
        return;
    }
    UFUNCTION()
    void Job_AIForceRefreshTargetingByTarget(const FECSEntity &inout Entity, const FC_AITargetingV2 &inout AITargeting, const FCS_AIForceRefreshTargetingByTarget &inout AIForceRefreshTargetingByTarget) const
    {
        FTargetEntity local_8 = FTargetEntity(::FAITargetingUtils::GetCurrentAttackTarget(Entity));
        for (auto& local_28 : AIForceRefreshTargetingByTarget.RefreshByTargetSet)
        {
            if ((local_8 == local_28) || AITargeting.AllTargets.Contains(local_28))
            {
                FC_AINeedUpdateAITargetingTag local_36;
                Assign local_34;
                local_34.opCall(local_36);
                FC_AINeedUpdateAIKnowledgeTag local_42;
                Assign local_40;
                local_40.opCall(local_42);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_RemoveKnowledgeAndTargetingWhileNoController(const FECSEntity &inout Entity, const FC_AIKnowledge &inout AIKnowledge) const
    {
        Remove local_12;
        Remove local_16;
        Get local_4;
        const FC_CharacterAIConfig& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.DefaultController.IsNull())
            {
                local_12.opCall();
                local_16.opCall();
            }
            return;
        }
        local_12.opCall();
        local_16.opCall();
        return;
    }
    UFUNCTION()
    void Job_ScheduleAIKnowledgeUpdate(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, const FC_AIKnowledge &inout AIKnowledge) const
    {
        if (AIKnowledge.NextKnowledgeUpdateTime.opCmp(FixedTime.Time) <= 0)
        {
            FC_AINeedUpdateAIKnowledgeTag local_10;
            Assign local_8;
            local_8.opCall(local_10);
        }
        return;
    }
    UFUNCTION()
    void Job_HandleHitHostility(const FCE_HitAIHostility &inout Event) const
    {
        int local_20 = 0;
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
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateSpreadAndOutOfCombatDistance(const FECSEntity &inout Entity, FC_AIKnowledge &inout AIKnowledge, const FC_Transform &inout SelfTransform) const
    {
        FSightPerceptionConfig local_12 = ::FAIPerceptionUtils::GetCurrentSightConfig(Entity, AIKnowledge);
        float32 local_13 = 1.1754944e-38f;
        for (auto& local_30 : local_12.SightPerceptionViewList)
        {
            if (local_30.SightPerceptionDistance > local_13)
            {
                local_13 = local_30.SightPerceptionDistance;
            }
            if (local_30.SightPerceptionAngleOffset >= 180.0f)
            {
                FECSDebugDraw::DrawDebugSphere(FAIKnowledgeUtils::VISUALLOG_PERCEPTION, SelfTransform.GetPosition(), local_30.SightPerceptionDistance, 12, FColor::Yellow, FColor::Yellow, 0.2f, uint8(0), 5.0f);
                continue;
            }
            FECSDebugDraw::DrawDebugCone(FAIKnowledgeUtils::VISUALLOG_PERCEPTION, SelfTransform.GetPosition(), SelfTransform.GetRotation().GetForwardVector(), local_30.SightPerceptionDistance, local_30.SightPerceptionAngleOffset, local_30.SightPerceptionAngleOffset, 12, FColor::Yellow, FColor::Yellow, false, 0.2f, uint8(0), 5.0f);
        }
        AIKnowledge.SightMaxDistance = local_13;
        return;
    }
    UFUNCTION()
    void Job_ResetFactionTargetableEntities() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        if (local_8.FactionEntities.Num() != 33)
        {
            local_8.FactionEntities.SetNum(33);
        }
        for (auto& local_26 : local_8.FactionEntities)
        {
            local_26.Reset();
        }
        local_8.NeutralEntities.Reset();
        local_8.CollectItemEntities.Reset();
        return;
    }
    UFUNCTION()
    void Job_UpdateFactionTargetableEntities(FCS_FactionTargetableEntities &inout TargetableEntities, const FECSEntity &inout Entity, const FC_Faction &inout Faction) const
    {
        int local_3 = int(Faction.GetFactionId());
        if (::FAIKnowledgeUtils::IsEntityTargetable(Entity))
        {
            TargetableEntities.FactionEntities[local_3].Entities.Add(Entity);
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateNeutralTargetableEntities(FCS_FactionTargetableEntities &inout TargetableEntities, const FECSEntity &inout Entity) const
    {
        if (::FAIKnowledgeUtils::IsEntityTargetable(Entity))
        {
            TargetableEntities.NeutralEntities.Entities.Add(Entity);
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateCollectItemEntities(FCS_FactionTargetableEntities &inout TargetableEntities, const FECSEntity &inout Entity, const FC_CollectItem &inout CollectItem) const
    {
        TargetableEntities.CollectItemEntities.Entities.Add(Entity);
        return;
    }
    UFUNCTION()
    void Monitor_EnterCombat(const FC_AICombatTag &inout EnterCombat, const FECSEntity &inout Entity) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        Modify local_6;
        FC_AITargetingV2& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.AlertBroadcastSources.Empty(0);
        }
        return;
    }
    UFUNCTION()
    void Monitor_QuictCombat(const FC_AICombatTag &inout QuitCombat, const FECSEntity &inout Entity) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        Remove local_6;
        local_6.opCall();
        return;
    }
    UFUNCTION()
    void Job_TickPlayerEngagingTarget(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, const FC_ControlledByPlayer &inout ControlledByPlayer) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Monitor_UpdateCombatKnowledgeOnGameAttributeInitialized(const FECSEntity &inout Entity, const FC_GameAttributeSnapshot &inout GameAttributeSnapshot) const
    {
        ::FAIKnowledgeUtils::InitCombatKnowledge(Entity);
        return;
    }
    UFUNCTION()
    void Monitor_UpdateCombatKnowledgeOnBehaviorTreeInitialized(const FECSEntity &inout Entity, const FC_BehaviorTreeInited &inout BehaviorTreeInited) const
    {
        Get local_4;
        const FC_AIController& local_6 = local_4.opCall();
        if (local_6)
        {
            ::FAIKnowledgeUtils::InitCombatKnowledge(FECSEntity(local_6.GetPawnEntity()));
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateCombatKnowledgeOnGameAttributeChange(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, const FC_GameAttribute &inout GameAttribute, const FC_GameAttributeChanged &inout GameAttributeChanged, const FC_GameAttributeSnapshot &inout GameAttributeSnapshot, const FC_ControlledByAI &inout ControlledByAI) const
    {
        float32 local_43;
        bool local_1 = false;
        bool local_3 = false;
        int local_4 = -1;
        int local_6 = 0;
        for (; local_6 < GameAttributeChanged.GetChangedAttributeNum(); ++local_6)
        {
            int local_7 = GameAttributeChanged.GetChangedAttributeLocalIndex(local_6);
            FGameAttributeRef local_22 = GameAttribute.GetAttributeRef(local_7);
            if (local_22.GetGlobalIndex() == Attribute::HP.GetGlobalIndex())
            {
                local_1 = true;
                continue;
            }
            if (local_22.GetGlobalIndex() == Attribute::HPMax.GetGlobalIndex())
            {
                local_1 = true;
                local_4 = local_7;
                continue;
            }
            if (local_22.GetGlobalIndex() == Attribute::Posture.GetGlobalIndex() || (local_22.GetGlobalIndex() == Attribute::PostureMax.GetGlobalIndex()))
            {
                local_3 = true;
            }
        }
        if (local_1)
        {
            float32 local_40 = GameAttribute.GetAttributeValue(Attribute::HPMax, FixedTime.Time);
            float32 local_39 = GameAttribute.GetAttributeValue(Attribute::HP, FixedTime.Time);
            if (local_40 > 0.0f)
            {
                if (local_4 >= 0)
                {
                    local_43 = GameAttributeSnapshot.GetAttributeValue(local_4, FixedTime.Time);
                }
                else
                {
                    local_43 = local_40;
                }
                ::FAIKnowledgeUtils::SetAIBlackboardValueFloat(Entity, n"SelfHPRatio", ::AIKnowledgeCalculation::CalculateStableHPRatio(local_39, local_43, local_40, (local_4 >= 0)));
            }
        }
        if (local_3)
        {
            float32 local_41_2 = GameAttribute.GetAttributeValue(Attribute::PostureMax, ECS::GetContextTime());
            float32 local_42 = GameAttribute.GetAttributeValue(Attribute::Posture, ECS::GetContextTime());
            if (local_41_2 > 0.0f)
            {
                ::FAIKnowledgeUtils::SetAIBlackboardValueFloat(Entity, n"SelfPostureRatio", 1.0f - (local_42 / local_41_2));
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_TargetDeathNotifyWatchers(const FECSEntity &inout Entity, const FC_DeathTag &inout DeathTag) const
    {
        this.NotifyWatchersOfStateChange(Entity);
        return;
    }
    UFUNCTION()
    void Monitor_TargetReadyToDestroyNotifyWatchers(const FECSEntity &inout Entity, const FC_ReadyToDestroyTag &inout ReadyToDestroyTag) const
    {
        this.NotifyWatchersOfStateChange(Entity);
        return;
    }
    UFUNCTION()
    void Monitor_TargetBeingInteractedNotifyWatchers(const FECSEntity &inout Entity, const FC_IsBeingInteractedTag &inout IsBeingInteractedTag) const
    {
        if (::FAIKnowledgeUtils::IsInteractionFullyOccupied(Entity))
        {
            this.NotifyWatchersOfStateChange(Entity);
        }
        return;
    }
    UFUNCTION()
    void Monitor_TargetBlockInteractionNotifyWatchers(const FECSEntity &inout Entity, const FC_BlockInteractionRuntime &inout BlockInteractionRuntime) const
    {
        if (BlockInteractionRuntime.GetbBlocked())
        {
            this.NotifyWatchersOfStateChange(Entity);
        }
        return;
    }
    UFUNCTION()
    void Job_EnvBreakablePropPhaseChangedNotifyWatchers(const FCE_EnvBreakablePropPhaseChangedEvent &inout Event) const
    {
        this.NotifyWatchersOfStateChange(Event.Sender);
        return;
    }
    void NotifyWatchersOfStateChange(const FECSEntity &inout TargetEntity) const
    {
        int local_10 = 0;
        int local_14;
        if (!(TargetEntity.IsValid()))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        if (!(local_10))
        {
            return;
        }
        if (!(local_10.Watchers.Contains(TargetEntity.GetId())))
        {
            return;
        }
        FECSEntityId local_11 = TargetEntity.GetId();
        FAIDecoratorAbortSignal local_18 = FAIDecoratorAbortSignal(EAIDecoratorAbortSignal(2), 0);
        for (auto& local_40 : local_14.Set)
        {
            FECSEntity local_44 = FECSEntity(TargetEntity.GetWorld(), local_40);
            if (!(local_44.IsValid()))
            {
                continue;
            }
            FECSAIUtils::DispatchAIDecoratorAbortSignal(local_44, local_18);
        }
        return;
    }
    UFUNCTION()
    void Job_CleanupStaleWatchers() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (!(local_8))
        {
            return;
        }
        TArray<FECSEntityId> local_14;
        TArray<FECSEntityId> local_18;
        local_8.Watchers.GetKeys(local_18);
        for (auto& local_32 : local_18)
        {
            if (!(FECSEntity(ECS::GetECSWorld(), local_32).IsValid()))
            {
                local_14.Add(local_32);
                continue;
            }
            TArray<FECSEntityId> local_42;
            for (auto local_60 : local_8.Watchers[local_32].Set)
            {
                if (!(FECSEntity(ECS::GetECSWorld(), local_60).IsValid()))
                {
                    local_42.Add(local_60);
                }
            }
            for (auto local_60 : local_42)
            {
            }
            if (local_8.Watchers[local_32].Set.Num() == 0)
            {
                local_14.Add(local_32);
            }
        }
        for (auto& local_32 : local_14)
        {
        }
        return;
    }
    UFUNCTION()
    void Job_TickRemoveAIKnowledgeInterval() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        FECSWorldPtr::Clear(local_2).opCall(EECSRegType(0));
        return;
    }
    UFUNCTION()
    void Job_TickRemoveAITargetingNeedUpdateInterval() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        FECSWorldPtr::Clear(local_2).opCall(EECSRegType(0));
        return;
    }
    UFUNCTION()
    void Job_TickRemoveAIForceRefreshTargetingByTarget(const FCS_AIForceRefreshTargetingByTarget &inout AIForceRefreshTargetingByTarget) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Remove local_6;
        local_6.opCall();
        return;
    }
    UFUNCTION()
    void Run_Monitor_TryRefreshTargetingWhileTargetEntityRelive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorDeathTagOnRemoveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_TryRefreshTargetingWhileTargetEntityRelive(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnAIKnowledgeAssign() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAIKnowledgeOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnAIKnowledgeAssign(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_AIForceRefreshTargetingByTarget() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_172 = 0;
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
                this.Job_AIForceRefreshTargetingByTarget(local_46, local_48, local_12);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_90.Iterator();
        for (; local_134.CanProceed;)
        {
            local_46 = local_134.Proceed();
            ++local_100;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_AIForceRefreshTargetingByTarget(local_172, local_48, local_12);
        }
        local_2.UpdateCachedEntityCount(local_100);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RemoveKnowledgeAndTargetingWhileNoController() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
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
                this.Job_RemoveKnowledgeAndTargetingWhileNoController(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_RemoveKnowledgeAndTargetingWhileNoController(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ScheduleAIKnowledgeUpdate() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        int local_178 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.1))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.Job_ScheduleAIKnowledgeUpdate(local_12, local_44, local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        local_92.opCall();
        Exclude(local_88).opCall();
        Exclude(local_88).opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            local_44 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            this.Job_ScheduleAIKnowledgeUpdate(local_12, local_178, local_46);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleHitHostility() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HitAIHostility> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HitAIHostility& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleHitHostility(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateSpreadAndOutOfCombatDistance() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_184 = 0;
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
                this.Job_UpdateSpreadAndOutOfCombatDistance(local_36, local_38, local_44);
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
        Exclude(local_90).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_90.Iterator();
        for (; local_146.CanProceed;)
        {
            local_36 = local_146.Proceed();
            ++local_112;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdateSpreadAndOutOfCombatDistance(local_184, local_38, local_44);
            local_52.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_112);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ResetFactionTargetableEntities() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(this.UpdateFactionTargetableEntitiesInterval))))
        {
            return;
        }
        this.Job_ResetFactionTargetableEntities();
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFactionTargetableEntities() const
    {
        int local_20 = 0;
        int local_56 = 0;
        int local_188 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(this.UpdateFactionTargetableEntitiesInterval))))
        {
            return;
        }
        FECSWorldPtr local_14 = this.GetECSWorld();
        Has local_18;
        if (!(local_18.opCall()))
        {
            return;
        }
        FECSWorldPtr local_14_2 = this.GetECSWorld();
        int local_26 = 0;
        int local_25 = local_26;
        if (local_4.IsViewCacheUsable())
        {
            const FECSEntity& local_54;
            FECSWorldPtr local_14_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_30 = local_4.GetViewCacheEntities();
            int local_31 = 0;
            for (auto& local_46 : local_30)
            {
                local_46;
                FECSEntity local_50;
                if (!(local_50.IsValid()))
                {
                    continue;
                }
                ++local_31;
                FECSEntityScopeCycleCounter local_51 = FECSEntityScopeCycleCounter(local_50);
                this.Job_UpdateFactionTargetableEntities(local_20, local_54, local_56);
            }
            local_4.UpdateCachedEntityCount(local_31);
        }
        else
        {
            const FECSEntity& local_54;
            FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
            Include local_102;
            local_102.opCall();
            Include local_106;
            local_106.opCall();
            Include local_110;
            local_110.opCall();
            Exclude(local_98).opCall();
            bool local_11 = local_4.BeginViewCacheBuild();
            int local_32 = local_4.GetViewCacheEpoch();
            int local_116 = 0;
            FECSRuntimeViewIterator local_150 = local_98.Iterator();
            for (; local_150.CanProceed;)
            {
                local_54 = local_150.Proceed();
                ++local_116;
                if (local_11)
                {
                    local_4.AddViewCacheEntity(local_54.GetId());
                }
                FECSEntityScopeCycleCounter local_51_2 = FECSEntityScopeCycleCounter(local_54);
                this.Job_UpdateFactionTargetableEntities(local_20, local_188, local_56);
            }
            local_4.UpdateCachedEntityCount(local_116);
            if (local_11)
            {
                local_4.CommitViewCacheBuild(local_32);
            }
        }
        FECSWorldPtr local_28 = this.GetECSWorld();
        MarkModifiedIfDirty local_192;
        local_192.opCall(local_20);
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateNeutralTargetableEntities() const
    {
        int local_20 = 0;
        int local_186 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(this.UpdateFactionTargetableEntitiesInterval))))
        {
            return;
        }
        FECSWorldPtr local_14 = this.GetECSWorld();
        Has local_18;
        if (!(local_18.opCall()))
        {
            return;
        }
        FECSWorldPtr local_14_2 = this.GetECSWorld();
        int local_26 = 0;
        int local_25 = local_26;
        if (local_4.IsViewCacheUsable())
        {
            const FECSEntity& local_54;
            FECSWorldPtr local_14_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_30 = local_4.GetViewCacheEntities();
            int local_31 = 0;
            for (auto& local_46 : local_30)
            {
                local_46;
                FECSEntity local_50;
                if (!(local_50.IsValid()))
                {
                    continue;
                }
                ++local_31;
                FECSEntityScopeCycleCounter local_51 = FECSEntityScopeCycleCounter(local_50);
                this.Job_UpdateNeutralTargetableEntities(local_20, local_54);
            }
            local_4.UpdateCachedEntityCount(local_31);
        }
        else
        {
            const FECSEntity& local_54;
            FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
            Include local_96;
            local_96.opCall();
            Include local_100;
            local_100.opCall();
            Exclude(local_92).opCall();
            Exclude(local_92).opCall();
            Exclude(local_92).opCall();
            bool local_11 = local_4.BeginViewCacheBuild();
            int local_32 = local_4.GetViewCacheEpoch();
            int local_114 = 0;
            FECSRuntimeViewIterator local_148 = local_92.Iterator();
            for (; local_148.CanProceed;)
            {
                local_54 = local_148.Proceed();
                ++local_114;
                if (local_11)
                {
                    local_4.AddViewCacheEntity(local_54.GetId());
                }
                FECSEntityScopeCycleCounter local_51_2 = FECSEntityScopeCycleCounter(local_54);
                this.Job_UpdateNeutralTargetableEntities(local_20, local_186);
            }
            local_4.UpdateCachedEntityCount(local_114);
            if (local_11)
            {
                local_4.CommitViewCacheBuild(local_32);
            }
        }
        FECSWorldPtr local_28 = this.GetECSWorld();
        MarkModifiedIfDirty local_190;
        local_190.opCall(local_20);
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateCollectItemEntities() const
    {
        int local_20 = 0;
        int local_56 = 0;
        int local_188 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(this.UpdateFactionTargetableEntitiesInterval))))
        {
            return;
        }
        FECSWorldPtr local_14 = this.GetECSWorld();
        Has local_18;
        if (!(local_18.opCall()))
        {
            return;
        }
        FECSWorldPtr local_14_2 = this.GetECSWorld();
        int local_26 = 0;
        int local_25 = local_26;
        if (local_4.IsViewCacheUsable())
        {
            const FECSEntity& local_54;
            FECSWorldPtr local_14_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_30 = local_4.GetViewCacheEntities();
            int local_31 = 0;
            for (auto& local_46 : local_30)
            {
                local_46;
                FECSEntity local_50;
                if (!(local_50.IsValid()))
                {
                    continue;
                }
                ++local_31;
                FECSEntityScopeCycleCounter local_51 = FECSEntityScopeCycleCounter(local_50);
                this.Job_UpdateCollectItemEntities(local_20, local_54, local_56);
            }
            local_4.UpdateCachedEntityCount(local_31);
        }
        else
        {
            const FECSEntity& local_54;
            FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
            Include local_102;
            local_102.opCall();
            Include local_106;
            local_106.opCall();
            Include local_110;
            local_110.opCall();
            Exclude(local_98).opCall();
            bool local_11 = local_4.BeginViewCacheBuild();
            int local_32 = local_4.GetViewCacheEpoch();
            int local_116 = 0;
            FECSRuntimeViewIterator local_150 = local_98.Iterator();
            for (; local_150.CanProceed;)
            {
                local_54 = local_150.Proceed();
                ++local_116;
                if (local_11)
                {
                    local_4.AddViewCacheEntity(local_54.GetId());
                }
                FECSEntityScopeCycleCounter local_51_2 = FECSEntityScopeCycleCounter(local_54);
                this.Job_UpdateCollectItemEntities(local_20, local_188, local_56);
            }
            local_4.UpdateCachedEntityCount(local_116);
            if (local_11)
            {
                local_4.CommitViewCacheBuild(local_32);
            }
        }
        FECSWorldPtr local_28 = this.GetECSWorld();
        MarkModifiedIfDirty local_192;
        local_192.opCall(local_20);
        return;
    }
    UFUNCTION()
    void Run_Monitor_EnterCombat() const
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
            this.Monitor_EnterCombat(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_QuictCombat() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAICombatTagOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_QuictCombat(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickPlayerEngagingTarget() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
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
                this.Job_TickPlayerEngagingTarget(local_6, local_40, local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickPlayerEngagingTarget(local_6, local_174, local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateCombatKnowledgeOnGameAttributeInitialized() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorGameAttributeSnapshotOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateCombatKnowledgeOnGameAttributeInitialized(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateCombatKnowledgeOnBehaviorTreeInitialized() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorBehaviorTreeInitedOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateCombatKnowledgeOnBehaviorTreeInitialized(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateCombatKnowledgeOnGameAttributeChange() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        int local_204 = 0;
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
                this.Job_UpdateCombatKnowledgeOnGameAttributeChange(local_6, local_40, local_42, local_48, local_54, local_60);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_102 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Exclude(local_102).opCall();
        Exclude(local_102).opCall();
        Exclude(local_102).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_132 = 0;
        FECSRuntimeViewIterator local_166 = local_102.Iterator();
        for (; local_166.CanProceed;)
        {
            local_40 = local_166.Proceed();
            ++local_132;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateCombatKnowledgeOnGameAttributeChange(local_6, local_204, local_42, local_48, local_54, local_60);
        }
        local_4.UpdateCachedEntityCount(local_132);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_TargetDeathNotifyWatchers() const
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
            this.Monitor_TargetDeathNotifyWatchers(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_TargetReadyToDestroyNotifyWatchers() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorReadyToDestroyTagOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_TargetReadyToDestroyNotifyWatchers(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_TargetBeingInteractedNotifyWatchers() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorIsBeingInteractedTagOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_TargetBeingInteractedNotifyWatchers(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_TargetBlockInteractionNotifyWatchers() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorBlockInteractionRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_TargetBlockInteractionNotifyWatchers(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_EnvBreakablePropPhaseChangedNotifyWatchers() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EnvBreakablePropPhaseChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EnvBreakablePropPhaseChangedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_EnvBreakablePropPhaseChangedNotifyWatchers(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CleanupStaleWatchers() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        this.Job_CleanupStaleWatchers();
        return;
    }
    UFUNCTION()
    void Run_Job_TickRemoveAIKnowledgeInterval() const
    {
        ECS::GetContextJob();
        this.Job_TickRemoveAIKnowledgeInterval();
        return;
    }
    UFUNCTION()
    void Run_Job_TickRemoveAITargetingNeedUpdateInterval() const
    {
        ECS::GetContextJob();
        this.Job_TickRemoveAITargetingNeedUpdateInterval();
        return;
    }
    UFUNCTION()
    void Run_Job_TickRemoveAIForceRefreshTargetingByTarget() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.Job_TickRemoveAIForceRefreshTargetingByTarget(local_12);
        return;
    }
}

namespace AIKnowledgeCalculation
{
float32 CalculateStableHPRatio(const float32 HP, const float32 OldHPMax, const float32 NewHPMax, const bool bHPMaxChanged)
{
    float32 local_6;
    if (NewHPMax <= 0.0f)
    {
        return 0.0f;
    }
    if (!(bHPMaxChanged))
    {
        return HP / NewHPMax;
    }
    if (NewHPMax > OldHPMax)
    {
        if (OldHPMax > 0.0f)
        {
            local_6 = FMath::Clamp(HP / OldHPMax, 0.0f, 1.0f);
        }
        else
        {
            local_6 = 0.0f;
        }
        return local_6;
    }
    return (FMath::Min(HP, NewHPMax) / NewHPMax);
}
}
