
const FName StrikeKey_Projectile = n"ProjectileStrikeKey";
const FConsoleVariable CVar_CombatPresentation_EnableOtherPlayerProjectileHitFx = FConsoleVariable();

class US_ProjectileSystemAS : UECSScriptSystem
{
    US_ProjectileSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    void RemoveConfigCompsByTimeline(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        Remove local_10;
        local_10.opCall();
        Remove local_14;
        local_14.opCall();
        Remove local_18;
        local_18.opCall();
        Remove local_22;
        local_22.opCall();
        Remove local_26;
        local_26.opCall();
        Remove local_30;
        local_30.opCall();
        Remove local_34;
        local_34.opCall();
        Remove local_38;
        local_38.opCall();
        Remove local_42;
        local_42.opCall();
        Remove local_46;
        local_46.opCall();
        Remove local_50;
        local_50.opCall();
        Remove local_54;
        local_54.opCall();
        Remove local_58;
        local_58.opCall();
        Remove local_62;
        local_62.opCall();
        Remove local_66;
        local_66.opCall();
        Remove local_70;
        local_70.opCall();
        Remove local_74;
        local_74.opCall();
        Remove local_78;
        local_78.opCall();
        Remove local_82;
        local_82.opCall();
        Remove local_86;
        local_86.opCall();
        Remove local_90;
        local_90.opCall();
        Remove local_94;
        local_94.opCall();
        Remove local_98;
        local_98.opCall();
        Remove local_102;
        local_102.opCall();
        Remove local_106;
        local_106.opCall();
        Remove local_110;
        local_110.opCall();
        Remove local_114;
        local_114.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_ProjectileTimelineSynced(const FECSEntity &inout Entity, const FC_ProjectileUseTimelineTag &inout UseTimelineTag) const
    {
        FECSComponentIgnoreLocalTagCheckForAllScope local_4 = FECSComponentIgnoreLocalTagCheckForAllScope(Entity.GetWorld(), EECSRegType(0));
        this.RemoveConfigCompsByTimeline(Entity);
        return;
    }
    UFUNCTION()
    void Job_ProjectileLifeTime(const FECSEntity &inout Entity, const FC_LifeTime &inout LifeTime, const FCS_FixedTime &inout FixedTime) const
    {
        int local_28 = 0;
        int local_34 = 0;
        FFPTime local_4 = LifeTime.GetEndTime();
        if (local_4.opCmp(FixedTime.Time) <= 0)
        {
            Has local_14;
            Has local_10;
            if (!(local_10.opCall()) || !(local_14.opCall()))
            {
                return;
            }
            ModifyOrAdd local_20;
            local_20.opCall().DestroyType = (2 != 0);
            bool local_15 = this.GetECSRuntime().IsServer;
            ::FProjectileUtils::DestroyProjectile(Entity, local_34, local_28.GetDestroyPosition(), local_4, local_28.GetDelayDestroyTime(), local_15);
            Modify local_38;
            local_38.opCall().SetLifeDuration(FFPTime(0));
        }
        return;
    }
    UFUNCTION()
    void Job_ProjectileLifeTimeWithTimeTweak(const FECSEntity &inout Entity, const FC_Owner &inout ProjectileOwner, FC_LifeTime &inout LifeTime, const FC_ProjectileInfo &inout ProjectileInfo, const FC_TimeTweak &inout TimeTweak, const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_4 = FProjectileTimeUtils::GetEndTime(LifeTime, TimeTweak);
        if (local_4.opCmp(FixedTime.Time) <= 0)
        {
            ModifyOrAdd local_10;
            local_10.opCall().DestroyType = (2 != 0);
            ::FProjectileUtils::DestroyProjectile(Entity, ProjectileOwner, ProjectileInfo.GetDestroyPosition(), local_4, ProjectileInfo.GetDelayDestroyTime(), (int(this.GetECSRuntime().IsServer) != 0));
            LifeTime.SetLifeDuration(FFPTime(0));
        }
        return;
    }
    UFUNCTION()
    void Job_ProjectileDelayDestroy(const FECSEntity &inout Entity, const FC_ProjectileDelayDestroy &inout ProjectileDelayDestroy, const FCS_FixedTime &inout FixedTime) const
    {
        if (FFPTime(ProjectileDelayDestroy.GetDestroyTime()).opCmp(FixedTime.Time) <= 0)
        {
            Entity.DestroyDeferred();
            Remove local_8;
            local_8.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_FinishSpawnProjectile(FCE_CharacterFireProjectile &inout Event) const
    {
        bool local_6;
        int local_136 = 0;
        int local_168 = 0;
        UProjectileTimelineAsset local_226;
        const FC_ProjectileTimelineData& local_246;
        Get local_260;
        UProjectileTimelineAsset local_270;
        FC_ProjectileBasicConfig local_296;
        int local_336 = 0;
        int local_454 = 0;
        int local_480 = 0;
        int local_498 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        bool local_11 = this.GetECSRuntime().IsClient;
        if (!(local_11))
        {
            local_6 = false;
        }
        else
        {
            bool local_5;
            local_5 = Event.GetbLocalCreated() && Event.FireConfig.GetbLocalPrediction();
            if (!(local_5))
            {
                local_5 = false;
            }
            else
            {
                Has local_10;
                local_5 = local_10.opCall();
            }
            local_5 = !local_5;
            local_6 = local_5;
        }
        if (local_6)
        {
            return;
        }
        bool local_12 = false;
        FTransform local_60 = ::FProjectileUtils::GetProjectileSpawnTransform(local_4, Event.Time, Event.FireConfig, false, local_12);
        if (local_12)
        {
            return;
        }
        FVector local_66(local_60.GetLocation());
        FQuat4f local_80 = FQuat4f(local_60.GetRotation());
        Event.Position = local_66;
        Event.Rotation = FRotator3f(local_80.Rotator());
        FECSEntity local_98 = Event.ProjectileEntity;
        if (Event.FireConfig.GetbSpawnWithPredictPath())
        {
            ModifyOrAdd local_112;
            local_112.opCall().SetKeyInfo(FThrowTargetInfo(Event.FireConfig.GetProjectileKey(), local_4.GetId()));
            ::FThrowUtils::MatchPredictPath(local_98);
        }
        if (!(Event.FireConfig.GetbLocalPrediction()))
        {
            ECS::LoadToEntityByPrefab(local_98, Event.FireConfig.GetProjectilePrefab().Get(), local_66, FQuat(local_80));
        }
        else
        {
            bool local_5;
            int local_115 = Event.PoolType;
            const UECSEntityPoolMeta local_118 = UECSEntityPoolMeta::GetPoolMetaByType(int(Event.PoolType));
            local_5 = local_118.LoadEntity(local_98, Event.FireConfig.GetProjectilePrefab().Get(), Event.Time, local_66, FQuat(local_80), EPrefabCollisionAlignment(2), false);
            local_11 = !(local_5);
            if (local_11 == !(false))
            {
                XError(ELog(0), FString().Append("Load Projectile Error: ").Append(Event.FireConfig.GetProjectilePrefab()));
            }
        }
        local_98.SetActive(true, FFPTime(-1));
        local_136.SetbPredictable(Event.FireConfig.GetbLocalPrediction());
        local_136.SetSpawnPosition(local_66);
        local_136.SetSpawnRotation(FQuat(local_80));
        local_136.SetAttackInfo(Event.AttackInfo);
        if (Event.AttackInfo.AttackData)
        {
            local_136.SetbAttackDataOverride(true);
        }
        else
        {
            Get local_140;
            const FC_ProjectileHitConfig& local_142 = local_140.opCall();
            if (local_142)
            {
                local_136.GetModify_AttackInfo().AttackData = local_142.AttackDataConfig;
            }
        }
        if (local_136.GetAttackInfo().AttackData)
        {
            FAttackRecoverEnergyValue local_184;
            FCapabilityInstanceId local_169;
            TDataObjectPtr<FAttackData> local_166 = TDataObjectPtr<FAttackData>(local_136.GetAttackInfo().AttackData);
            local_136.SetDamage(::FDamageUtils::CalcAttackBaseDamageValue(Event.Sender, local_168, Event.Time, false, local_169));
            local_136.SetDamageToAvatar(::FDamageUtils::CalcAttackBaseDamageValue(Event.Sender, local_168, Event.Time, true, local_169));
            local_184 = ::FDamageUtils::CalcAttackRecoverEnergyValue(Event.Sender, local_168, Event.Time, local_169);
            local_136.SetAttackRecoverEnergyData(local_184);
        }
        Get local_188;
        const FC_ProjectilePenetrationConfig& local_190 = local_188.opCall();
        if (local_190)
        {
            FAttackRecoverEnergyValue local_184;
            FCapabilityInstanceId local_169;
            if (local_190.bChangeAttackForPenetration)
            {
                FDataObjectPtr local_214 = FDataObjectPtr(local_190.AttackDataAfterPenetration);
                if (local_214.IsValid())
                {
                    local_136.GetModify_AttackInfoAfterPenetration().AttackData = local_214;
                    local_136.SetDamageAfterPenetration(::FDamageUtils::CalcAttackBaseDamageValue(Event.Sender, Event.Time, false, local_169));
                    local_136.SetDamageToAvatarAfterPenetration(::FDamageUtils::CalcAttackBaseDamageValue(Event.Sender, Event.Time, true, local_169));
                    local_136.SetAttackRecoverEnergyDataAfterPenetration(local_184);
                }
            }
        }
        local_136.SetHitTestProtectData(Event.HitTestProtectData);
        Has local_218;
        if (!(local_218.opCall()))
        {
            Get local_222;
            const FC_ProjectileTimelineConfig& local_224 = local_222.opCall();
            if (local_224)
            {
                local_226 = local_224.TimelineAssetRef.GetAsset();
                if (local_226 != nullptr)
                {
                    local_246.SetTimelineAsset(TSoftObjectPtr<UProjectileTimelineAsset>(local_224.TimelineAssetRef.GetAsset()));
                    local_246.SetInitState(local_224.InitState);
                }
            }
        }
        else
        {
            Get local_222;
            local_11 = local_260.opCall().GetTimelineAsset().IsNull();
            if (local_11)
            {
                const FC_ProjectileTimelineConfig& local_224_2 = local_222.opCall();
                if (local_224_2)
                {
                    local_226 = local_224_2.TimelineAssetRef.GetAsset();
                    if (local_226 != nullptr)
                    {
                        local_226 = local_224_2.TimelineAssetRef.GetAsset();
                        Modify local_264;
                        local_264.opCall().SetTimelineAsset(TSoftObjectPtr<UProjectileTimelineAsset>(local_226));
                    }
                }
                else
                {
                    Remove local_268;
                    local_268.opCall();
                }
            }
        }
        local_246 = local_260.opCall();
        if (local_246)
        {
            if ((!((local_246.GetTimelineAsset() == nullptr))) && !(local_226.TimelineConfigData.TimelineDatas.IsEmpty()))
            {
                FC_ProjectileUseTimelineTag local_276;
                Assign local_274;
                local_274.opCall(local_276);
                this.RemoveConfigCompsByTimeline(local_98);
                Remove local_282;
                local_282.opCall();
                Remove local_286;
                int local_288 = local_286.opCall();
                local_296.SetbNeverPredict(local_288.BasicData.bNeverPredict);
                local_296.SetbTweakTimeOnOwnerFreeze(local_288.BasicData.bTweakTimeOnOwnerFreeze);
                if (int(local_288.BasicData.LimitNum) > 0)
                {
                    FC_NumLimited local_306;
                    local_306.LimitNum = int(local_288.BasicData.LimitNum);
                }
                int local_307 = 0;
                local_288.NameToTimelineDataIndex.Find(local_246.GetInitState(), local_307);
                if (!(local_288.TimelineDatas.IsValidIndex(local_307)))
                {
                    local_307 = 0;
                    XError(ELog(48), FString().Append("Projectile InitState ").Append(local_246.GetInitState()).Append(" not found in config, TimelineConfig: ").Append(local_270.GetPathName(nullptr)));
                }
                if (int(local_288.TimelineDatas[local_307].Type) != 0)
                {
                    int local_314 = 0;
                    for (; local_314 < local_288.TimelineDatas.Num(); ++local_314)
                    {
                        if (int(local_288.TimelineDatas[local_314].Type) == 0)
                        {
                            local_307 = local_314;
                            break;
                        }
                    }
                }
                local_336.SetCurStateConfigTimelineIndex(local_307);
                local_336.SetWorldTimeOffset(Event.Time);
                FProjectileTimelineRuntimeInfo local_388;
                local_388.SetbIsActive(true);
                local_388.SetIndexInConfig(local_307);
                local_336.GetModify_TimelineInfos().Add(local_388);
                int local_314_2 = 0;
                for (; local_314_2 < local_288.TimelineDatas.Num(); ++local_314_2)
                {
                    if (int(local_288.TimelineDatas[local_314_2].Type) == 2)
                    {
                        FProjectileTimelineRuntimeInfo local_440;
                        local_440.SetbIsActive(true);
                        local_440.SetIndexInConfig(local_314_2);
                        local_336.GetModify_TimelineInfos().Add(local_440);
                    }
                }
                local_454.SetLifeDuration(local_288.TimelineDatas[local_307].Duration);
                local_454.SetSpawnTime(Event.Time);
                ::FProjectileTimelineUtils::AdvanceTimeline(local_98, local_270, local_336, local_288, FFPTime(0));
                Get local_458;
                const FC_ProjectileTimelineEventTriggerConfig& local_460 = local_458.opCall();
                if (local_460)
                {
                    ::FProjectileTimelineUtils::TriggerSpawnEventReaction(local_460.TriggerReactions, local_98, local_288, local_66, local_80, Event.Time);
                }
            }
        }
        else
        {
            local_454.SetSpawnTime(Event.Time);
            if (Event.LifeTimeOverride.opCmp(0.0) > 0)
            {
                local_454.SetLifeDuration(Event.LifeTimeOverride);
            }
            else
            {
                Get local_470;
                local_454.SetLifeDuration(local_470.opCall().ConfigLifeDuration);
            }
        }
        if (local_296.GetbTweakTimeOnOwnerFreeze())
        {
            local_480.SetAlignWorldTime(Event.Time);
            local_480.SetAlignSampleTime(FFPTime(0));
        }
        if (Event.FireConfig.GetbInterpoBlendWithOwner())
        {
            Assign local_484;
            local_484.opCall(FC_InterpoBlendSameAsOwnerTag());
        }
        Get local_490;
        const FC_Faction& local_492 = local_490.opCall();
        if (local_492)
        {
            local_498.SetFactionId(local_492.GetFactionId());
        }
        return;
    }
    UFUNCTION()
    void Job_AfterSpawnProjectileSelectConfig(const FCE_CharacterFireProjectile &inout Event) const
    {
        int local_32 = 0;
        FECSEntity local_4 = Event.ProjectileEntity;
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        Get local_14;
        const FC_ProjectileHealthConfig& local_16 = local_14.opCall();
        if (local_16)
        {
            Has local_20;
            if (!(local_20.opCall()))
            {
                if ((int(local_16.CanBeHitCount) > 0 || (local_16.DamageCanTake > 0.0f)))
                {
                    local_32.SetbCanDestroyByHit(local_16.bCanDestroyByHit);
                    local_32.SetDamageTaken(0.0f);
                    if (int(local_16.CanBeHitCount) > 0)
                    {
                        local_32.SetRemainCanBeHitCount(int(local_16.CanBeHitCount));
                    }
                    if (local_16.DamageCanTake > 0.0f)
                    {
                        local_32.SetRemainDamageCanTake(local_16.DamageCanTake);
                    }
                }
            }
        }
        bool local_25 = this.GetECSRuntime().IsServer;
        ::FCombatUtils::TriggerCombatTimelineAction(local_4, ECombatTimelineTimePoint(0), Event.Time, local_25, false);
        if (::FAbilityUtils::CanTriggerAbilityEffectEvent(local_4, EAbilityEffectEvent(1)))
        {
            FAbilityEffectEventData_Projectile local_44;
            local_44.SetProjectileEntity(local_4);
            local_44.SetPosition(Event.Position);
            GetDefaulted local_48;
            FECSEntity local_54 = local_48.opCall().GetOwnerEntity();
        }
        Get local_58;
        const FC_ProjectileActorVisualConfig& local_60 = local_58.opCall();
        if (local_60)
        {
            if (!(local_60.SpawnMaterialParam.IsEmpty()))
            {
                ::FMaterialUtils::SyncRequestChangeMaterialParam(local_4, n"ProjectileSpawn", local_60.SpawnMaterialParam);
            }
            if (local_60.DestroyActorDelayTime > 0.0f)
            {
                Modify local_64;
                local_64.opCall().SetDelayDestroyTime(FFPTime(local_60.DestroyActorDelayTime));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_FreezeProjectile(const FECSEntity &inout Entity, const FC_Owner &inout OwnerComp, const FC_LifeTime &inout LifeTime, FC_TimeTweak &inout TweakTime, const FCS_FixedTime &inout FixedTime) const
    {
        FECSEntity local_4 = OwnerComp.GetOwnerEntity();
        Get local_8;
        const FC_FreezeFrame& local_10 = local_8.opCall();
        if (local_10)
        {
            Remove local_24;
            const FFreezeFrameData& local_14 = local_10.Datas[0];
            if (FFPTime(local_14.GetEndTime()).opCmp(FixedTime.LastTime) >= 0 && (FFPTime(local_14.GetEndTime()).opCmp(FixedTime.Time) <= 0))
            {
                FFPTime local_16 = FProjectileTimeUtils::GetProjectileTime(LifeTime, TweakTime, local_14.GetEndTime());
                TweakTime.SetAlignWorldTime(local_14.GetEndTime());
                TweakTime.SetAlignSampleTime(local_16);
                TweakTime.SetBeginTweakWorldTime(FFPTime(0));
                TweakTime.SetEndTweakWorldTime(FFPTime(0));
                local_24.opCall();
            }
            else
            {
                if (FFPTime(local_14.GetStartTime()).opCmp(FixedTime.LastTime) >= 0 && (FFPTime(local_14.GetStartTime()).opCmp(FixedTime.Time) <= 0))
                {
                    TweakTime.SetBeginTweakWorldTime(local_14.GetStartTime());
                    TweakTime.SetEndTweakWorldTime(local_14.GetEndTime());
                    FC_ProjectileInTimeTweakTag local_30;
                    Assign local_28;
                    local_28.opCall(local_30);
                }
            }
        }
        else
        {
            Remove local_24;
            FFPTime local_20 = FFPTime(TweakTime.GetBeginTweakWorldTime());
            if (!((local_20 == 0.0)))
            {
                FFPTime local_20_2 = FProjectileTimeUtils::GetProjectileTime(LifeTime, TweakTime, FixedTime.LastTime);
                TweakTime.SetAlignWorldTime(FixedTime.LastTime);
                TweakTime.SetAlignSampleTime(local_20_2);
                TweakTime.SetBeginTweakWorldTime(FFPTime(0));
                TweakTime.SetEndTweakWorldTime(FFPTime(0));
                local_24.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void Job_CorrectProjectileInterpoTransform(const FCE_CharacterFireProjectile &inout Event) const
    {
        int local_18 = 0;
        int local_24 = 0;
        Get local_4;
        const FC_TransformHistory& local_6 = local_4.opCall();
        if (local_6)
        {
            GetDefaulted local_12;
            bool local_7 = local_6.IsTimeBeforeAllHistory(local_12.opCall().Time);
            if (local_7)
            {
                if (local_18)
                {
                    local_24.SetPosition(local_18.GetSpawnPosition());
                    local_24.SetRotation(local_18.GetSpawnRotation());
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_SpawnProjectileVisualTransform(const FCE_CharacterFireProjectile &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ClientJob_RecoverProjectileVisualTransformOffset(const FECSEntity &inout Entity, const FC_LifeTime &inout LifeTime, const FC_ProjectileVisualOffsetCacheData &inout CacheData) const
    {
        if (CacheData.AddTime.opCmp(LifeTime.GetSpawnTime()) < 0)
        {
            Remove local_8;
            local_8.opCall();
            return;
        }
        FC_VisualTransformOffset local_26;
        local_26.PositionOffset = CacheData.PositionOffset;
        local_26.RotationOffset = CacheData.RotationOffset;
        return;
    }
    UFUNCTION()
    void ClientJob_CheckProjectileVisualTransformOffsetCacheValid(const FECSEntity &inout Entity) const
    {
        XError(ELog(2), "Should not use FC_ProjectileVisualOffsetCacheData on non projectile pool entity!");
        Remove local_6;
        local_6.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateProjectileVisualTransformOverride(const FECSEntity &inout Entity, const FC_InterpoTime &inout InterpoTime, const FC_LifeTime &inout LifeTime, const FC_ProjectileBasicConfig &inout Config, FC_VisualTransformOffset &inout VisualTransformOffset) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            Remove local_10;
            local_10.opCall();
            return;
        }
        Get local_14;
        FSampleFrameTime local_20 = FProjectileTimeUtils::GetFrameTime(LifeTime, local_14.opCall(), InterpoTime.LastTime, InterpoTime.Time);
        float32 local_27 = 0.0f;
        if (Config.VisualBlendTime > 0.0f)
        {
            local_27 = 1.0f - FMath::Clamp(float32((local_20.CurrentTime.ToSeconds() / Config.VisualBlendTime)), 0.0f, 1.0f);
        }
        if (local_27 <= 0.0f)
        {
            Remove local_10;
            local_10.opCall();
        }
        else
        {
            FC_ProjectileVisualOffsetCacheData local_44;
            local_44.AddTime = LifeTime.GetSpawnTime();
            local_44.PositionOffset = VisualTransformOffset.PositionOffset;
            local_44.RotationOffset = VisualTransformOffset.RotationOffset;
            local_44.BlendWeight = VisualTransformOffset.BlendWeight;
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleProjectileHitFx(FCE_ProjectileHitPresentation &inout ProjectleHitPresentation) const
    {
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        bool local_9 = local_8.opCall();
        if (!(local_9))
        {
            local_9 = false;
        }
        else
        {
            FECSWorldPtr local_4_2 = this.GetECSWorld();
            Get local_14;
            local_9 = (int(local_14.opCall().GetGameModeType()) != 0);
        }
        bool local_18 = !(CVar_CombatPresentation_EnableOtherPlayerProjectileHitFx.GetBool());
        bool local_1 = !(false);
        Has local_22;
        local_18 = local_18 == local_1 && !(local_22.opCall());
        local_18 = local_18 && !(local_9);
        if (local_18)
        {
            FECSEntity local_26 = FECSEntity(ProjectleHitPresentation.Sender);
            while (local_26.IsValid())
            {
                Get local_30;
                const FC_Owner& local_32 = local_30.opCall();
                if (local_32)
                {
                    local_26 = local_32.GetOwnerEntity();
                }
                else
                {
                    break;
                }
            }
            Has local_40;
            bool local_1_2 = local_40.opCall();
            if (local_1_2)
            {
                FECSEntityId local_45 = local_26.GetId();
                FECSWorldPtr local_4_3 = this.GetECSWorld();
                Get local_44;
                if (!((local_45 == local_44.opCall().PlayerEntity.GetId())))
                {
                    return;
                }
            }
        }
        if (ProjectleHitPresentation.AttachEntity.IsValid() && ProjectleHitPresentation.AttachEntity.IsActive())
        {
            ECSFX::PlayFXDurationalEx(ProjectleHitPresentation.OwnerEntity, ProjectleHitPresentation.HitFX, ProjectleHitPresentation.Time, 1.0f, false, ProjectleHitPresentation.AttachEntity, ProjectleHitPresentation.StopMethod, false);
            return;
        }
        ProjectleHitPresentation.HitFX.SetbDetach(true);
        ECSFX::PlayFXInstant(ProjectleHitPresentation.OwnerEntity, ProjectleHitPresentation.HitFX, ProjectleHitPresentation.Time, 1.0f, false, true);
        return;
    }
    FRotator GetHitFxRotation(const EProjectileHitFXRotationMode Mode, const FVector &inout MoveDirection, const FVector &inout ImpactNormal) const
    {
        FRotator local_6 = FRotator(FRotator::ZeroRotator);
        switch (int(Mode))
        {
        case 1:
        {
            local_6.Yaw = MoveDirection.ToOrientationRotator().Yaw;
            break;
        }
        case 2:
        {
            local_6 = MoveDirection.ToOrientationRotator();
            break;
        }
        case 3:
        {
            local_6 = ImpactNormal.ToOrientationRotator();
            break;
        }
        }
        return local_6;
    }
    FCE_HitEvent& CreateHitEvent(const FECSEntity &inout OwnerEntity, const FECSEntity &inout HitEntity, const FVector &inout HitPoint, const FVector &inout StrikeDirection, const FHitBoxData &inout HitBoxData, const FAttackData &inout AttackData, const FFPTime &inout Time, const bool bPredictable) const
    {
        FHitEventParam local_120;
        local_120.bPredictable = bPredictable;
        local_120.bNeedHitMeshPresentation = false;
        local_120.HitPosition = HitPoint;
        local_120.HitShakeBodyType = HitBoxData.BoneShakeBodyType;
        local_120.HitBoneName = HitBoxData.AttachInfo.AttachToName;
        local_120.HitBodyPart = HitBoxData.BodyPartKey;
        local_120.OverrideAnimSocket = HitBoxData.OverrideAnimSocket;
        local_120.PhysicalMaterial = HitBoxData.HitMaterial;
        local_120.StrikeData.StrikeDirection = StrikeDirection;
        TDataObjectPtr<FAttackData> local_146;
        local_120.AttackData = local_146;
        return (::FCombatUtils::MakeHitEvent(OwnerEntity, OwnerEntity, HitEntity, Time, local_120));
    }
    UFUNCTION()
    void Job_HandleProjectileHit(const FECSEntity &inout Entity, const FC_Owner &inout ProjectileOwner, FC_LifeTime &inout LifeTime, FC_ProjectileInfo &inout ProjectileInfo, const FC_ProjectileHitResult &inout HitResults, const FC_ProjectileHitConfig &inout HitConfig, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        int local_10 = 0;
        const FAttackData& local_76;
        bool local_78;
        FC_ProjectilePenetrationConfig local_84;
        int local_90 = 0;
        int local_160 = 0;
        float32 local_164;
        const UUtilitySettings local_170;
        bool local_175;
        int local_177;
        FHitTestCheckResult local_236;
        bool local_237;
        bool local_240;
        GetDefaulted local_260;
        bool local_269;
        int local_278 = 0;
        bool local_285;
        int local_296 = 0;
        const FHitBoxData& local_406;
        FCE_HitEvent local_410;
        Assign local_550;
        GetDefaulted local_578;
        Get local_584;
        Get local_590;
        UProjectileTimelineAsset local_594;
        int local_718 = 0;
        bool local_3 = !((HitResults.GetHitResultNum() > 0));
        bool local_4 = !(false);
        if (local_3 == local_4)
        {
            return;
        }
        FECSEntity::Get<FC_ProjectileHitExplosionConfig> local_8 = FECSEntity::Get<FC_ProjectileHitExplosionConfig>(Entity);
        TDataObjectPtr<FAttackData> local_34 = TDataObjectPtr<FAttackData>(ProjectileInfo.GetAttackInfo().AttackData);
        bool local_59 = HitConfig.bCanCauseDamageByHit;
        if (local_59 && !(local_34))
        {
            XError(ELog(0), FString().Append("No AttackData for projectile ").Append(Entity.GetEntityName()));
            local_59 = false;
        }
        FName local_71(NAME_None);
        int local_73 = int(HitConfig.HitableRelation);
        if (!(local_59))
        {
            local_3 = false;
        }
        else
        {
            local_3 = local_34;
        }
        if (local_3)
        {
            local_71 = local_76.AttackTag;
            int local_73_2 = int(local_76.AffectFactionRelation);
        }
        bool local_77 = true;
        local_78 = false;
        FVector local_102 = (FVector(Transform.GetPosition()) - ProjectileInfo.GetSpawnPosition()).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        if (local_102.IsZero())
        {
            local_102 = ProjectileInfo.GetSpawnRotation().Vector();
        }
        FVector local_116 = local_102;
        FVector local_122(FVector::ZeroVector);
        FVector local_128(Transform.GetRotation().GetForwardVector());
        Get local_132;
        const FC_MovementInfo& local_134 = local_132.opCall();
        if (local_134)
        {
            local_128 = local_134.GetVelocity().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            local_122 = local_134.GetVelocity();
        }
        if (HitConfig.bUseCustomStrikeDirection)
        {
            if (local_128.IsZero())
            {
                local_128 = local_102;
            }
            FVector local_140 = FVector(local_128.ToOrientationRotator().GetUpVector());
            local_102 = local_140.RotateAngleAxis(HitConfig.CustomStrikeDirectionAngle, local_128);
        }
        float32 local_148 = 1.0f;
        if (local_90)
        {
            FVector local_108_2 = (FVector(Transform.GetPosition()) - ProjectileInfo.GetSpawnPosition());
            float32 local_147 = float32(local_108_2.Size());
            FECSEntity local_154 = ProjectileOwner.GetOwnerEntity();
            if (local_160 && local_160.HasAttribute(Attribute::ProjectileAttenuationRangeScale) && local_160.HasAttribute(Attribute::ProjectileAttenuationValueScale))
            {
                float32 local_161 = local_147;
                float32 local_149 = local_160.GetAttributeValue(Attribute::ProjectileAttenuationRangeScale, FixedTime.Time);
                float32 local_162 = local_160.GetAttributeValue(Attribute::ProjectileAttenuationValueScale, FixedTime.Time);
                if (local_149 > 0.0f)
                {
                    local_161 = local_147 / local_149;
                }
                else
                {
                    float32 local_165 = local_161;
                    local_90.AttenuationCurve.GetTimeRange(local_164, local_165);
                    local_161 = local_165;
                }
                local_148 = ((local_90.AttenuationCurve.GetFloatValue(local_161, 0.0f) - 1.0f) * local_162) + 1.0f;
            }
            else
            {
                local_148 = local_90.AttenuationCurve.GetFloatValue(local_147, 0.0f);
            }
        }
        GetGameplaySettings<UUtilitySettings> local_172;
        local_170 = local_172;
        bool local_3_2 = (local_148 <= local_170.AttenuationDamageTextDistanceThrethold);
        int local_176 = 0;
        FRotator local_304;
        for (; local_176 < HitResults.GetHitResultNum(); ++local_176)
        {
            local_177 = 0;
            Get local_182;
            const FC_ProjectileHitInfo& local_184 = local_182.opCall();
            if (local_184)
            {
                local_177 = local_184.GetHitCount();
            }
            FHitTestResult local_222 = FHitTestResult(HitResults.GetHitResult(local_176));
            Get local_226;
            const FC_OnlyAcceptSpecificEntityAttack& local_228 = local_226.opCall();
            if (local_228)
            {
                if (!((FECSEntity(local_228.GetAcceptedEntity()) == ProjectileOwner.GetOwnerEntity())))
                {
                    continue;
                }
            }
            FECSEntity local_154_2 = ProjectileOwner.GetOwnerEntity();
            local_237 = false;
            if (int(local_236.CheckResult) == 11)
            {
                local_237 = true;
                local_240 = true;
                if (local_34)
                {
                    EDestructibleClassLevel local_255;
                    FCE_DestructibleHitEvent local_246;
                    FECSEntity local_232 = ProjectileOwner.GetOwnerEntity();
                    local_246.Receiver = local_222.HitEntity;
                    local_246.ImpactType = EImpactType(local_76.ImpactType);
                    local_246.ImpactStrength = EImpactStrength(local_76.ImpactStrengthValue);
                    local_246.ForceDirection = local_102;
                    local_246.DestructibleDamageLevel = EDestructibleClassLevel(local_76.GetDestructibleClassLevelFromDamage(ProjectileOwner.GetOwnerEntity()));
                    GetDefaulted local_254;
                    local_255 = local_254.opCall().DestructibleClass;
                    if (int(local_246.DestructibleDamageLevel) >= int(local_255))
                    {
                        local_240 = false;
                    }
                }
                if (local_240)
                {
                    local_236.CheckResult = EHitTestCheckResult(1);
                }
                else
                {
                    local_236.CheckResult = EHitTestCheckResult(0);
                }
            }
            if (int(local_236.CheckResult) == 0)
            {
                bool local_261;
                local_240 = local_260.opCall().bNoReactToProjectile;
                local_175 = true;
                local_261 = local_175;
                Get local_266;
                const FC_BeHitPresentationConfig& local_268 = local_266.opCall();
                if (local_268)
                {
                    local_261 = local_268.bShowHitFX;
                }
                if (!(local_59))
                {
                    local_175 = false;
                }
                else
                {
                    local_175 = local_34;
                }
                if (local_175)
                {
                    local_269 = false;
                    local_164 = 1.0f;
                    local_175 = ::FDamageUtils::IsDamageToAvatar(local_222.HitEntity);
                    if (local_84)
                    {
                        if (!(::FProjectileUtils::CheckPenetrationProjectileHit(local_184, local_84, local_222.HitEntity.GetId(), local_222.HitTime)))
                        {
                            continue;
                        }
                        if (!(::FCombatUtils::TryRecordHit(local_278, local_222.HitEntity.GetId(), EHitRecordType(2), StrikeKey_Projectile, local_222.HitTime, local_222.HitTime, local_84.HitInterval)))
                        {
                            continue;
                        }
                        float32 local_167_2 = local_148 * local_184.GetPenetratedAttenuationRatio();
                        local_285 = false;
                        const FHitBoxData& local_288 = local_222.TryGetHitBoxData(local_285);
                        bool local_283 = ProjectileInfo.GetbPredictable();
                        FECSEntity local_232_2 = ProjectileOwner.GetOwnerEntity();
                        bool local_4_2 = this.GetECSRuntime().IsServer;
                        if (local_4_2)
                        {
                            if (local_285)
                            {
                                bool local_283_2 = !(local_288.BodyPartKey.IsNone());
                                if (!(local_283_2))
                                {
                                    local_283_2 = false;
                                }
                                else
                                {
                                    local_283_2 = local_296;
                                }
                                if (local_283_2)
                                {
                                    if (local_296.BodyPartData.BodyParts.Contains(local_288.BodyPartKey))
                                    {
                                        local_283_2 = local_296.BodyPartData.BodyParts[local_288.BodyPartKey].IsWeakness;
                                        if (local_283_2)
                                        {
                                            local_269 = true;
                                            local_164 = local_84.AttenuationBonusWhenHitWeakness;
                                        }
                                    }
                                }
                            }
                            local_4_2 = false;
                            if (local_175)
                            {
                            }
                            else
                            {
                            }
                            bool local_283_3 = this.GetECSRuntime().IsServer;
                            FCE_HitEvent local_290;
                            ::FCombatUtils::DamageTargetByHit(ProjectileOwner.GetOwnerEntity(), Entity, local_222.HitEntity, local_283_3, NAME_None, int(local_290._base_FECSEvent), ProjectileInfo.GetAttackInfo());
                        }
                        if (local_261)
                        {
                            local_304 = this.GetHitFxRotation(HitConfig.FXRotationMode, local_128, local_222.Normal);
                            ::FProjectileUtils::CreateHitPresentation(Entity, ProjectileOwner.GetOwnerEntity(), HitConfig.HitFXConfig, local_222.Location, local_304, local_222.HitSurfaceName, local_222.HitTime, ProjectileInfo.GetbPredictable());
                        }
                        if (local_240)
                        {
                            FFPTime local_308 = local_84.PenetrationSameTargetMinInterval;
                            if (local_308.opCmp(0.0) > 0)
                            {
                                local_308 = FFPTime(local_222.HitTime);
                                local_308 = FFPTime((local_308 + local_84.PenetrationSameTargetMinInterval));
                                FFPTime local_310 = FFPTime(0);
                                FECSEntityId local_275 = local_222.HitEntity.GetId();
                                local_184.GetModify_NextPenetrationTimeByEntity().FindOrAdd(local_275, local_310) = local_308;
                            }
                            else
                            {
                                FFPTime local_310_2 = FFPTime(-1);
                                local_308 = FFPTime(0);
                                FECSEntityId local_275_2 = local_222.HitEntity.GetId();
                                local_184.GetModify_NextPenetrationTimeByEntity().FindOrAdd(local_275_2, local_308) = local_310_2;
                            }
                        }
                        else
                        {
                            ::FProjectileUtils::CalculatePenetrationProjectileHit(local_184, local_84, local_222.HitEntity.GetId());
                            if (int(local_84.HitTestType) == 1)
                            {
                                if (::FProjectileUtils::CheckPenetrationProjectileHit(local_184, local_84, local_222.HitEntity.GetId(), local_222.HitTime))
                                {
                                    int local_239;
                                    local_239 = int(local_84.MaxHitCount);
                                    local_239 = local_239 - local_184.GetHitCount();
                                    if (int(local_84.MaxHitCountPerTargetEntity) > 0)
                                    {
                                        int local_313 = 0;
                                        local_184.GetHitCountByEntity().Find(local_222.HitEntity.GetId(), local_313);
                                        local_239 = FMath::Min(local_239, int(local_84.MaxHitCountPerTargetEntity) - local_313);
                                    }
                                    int local_314 = FMath::Max(1, (int(local_84.PenetrationHitCheckMaxSampleNum) - 1));
                                    FVector local_140_2 = local_116;
                                    TArray<FHitResult> local_318;
                                    int local_319 = 1;
                                    int local_320 = 1;
                                    for (; local_320 <= local_314; ++local_320)
                                    {
                                        local_167_2 = local_148 * local_184.GetPenetratedAttenuationRatio();
                                        FVector local_332(local_222.HitPoint);
                                        FVector local_96 = (local_140_2 * local_84.PenetrationHitCheckDeltaDistance);
                                        FVector local_108_3 = (local_96 * local_320);
                                        local_96 = (local_332 + local_108_3);
                                        local_108_3 = (local_96 + (local_140_2 * local_84.PenetrationHitCheckDeltaDistance));
                                        FCollisionQueryParams local_376;
                                        local_376.bTraceComplex = false;
                                        int local_378 = int(FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(2)));
                                        local_4_2 = true;
                                        FECSEntity local_154_3 = ProjectileOwner.GetOwnerEntity();
                                        for (auto& local_402 : local_318)
                                        {
                                            if (int(local_402.ECSEntityId) != local_222.HitEntity.GetIdValue())
                                            {
                                                continue;
                                            }
                                            local_406 = FHitBoxData::TryGetHitBoxData(local_402, local_285);
                                            bool local_283_4 = ProjectileInfo.GetbPredictable();
                                            float local_408 = local_319;
                                            local_408 = local_408 * local_84.TimeDelayPerPenetrationHit.ToSeconds();
                                            FFPTime local_308_2 = (FFPTime(local_408) + local_222.HitTime);
                                            FECSEntity local_232_3 = ProjectileOwner.GetOwnerEntity();
                                            local_4_2 = this.GetECSRuntime().IsServer;
                                            if (local_4_2)
                                            {
                                                if (ProjectileInfo.GetAttackInfoAfterPenetration().AttackData.IsValid())
                                                {
                                                    local_4_2 = false;
                                                    float32 local_161_2 = local_167_2 * local_164;
                                                    local_408 = local_319;
                                                    local_408 = local_408 * local_84.TimeDelayPerPenetrationHit.ToSeconds();
                                                    FFPTime local_308_3 = FFPTime(local_408);
                                                    FFPTime local_310_3 = (local_308_3 + local_222.HitTime);
                                                    if (local_175)
                                                    {
                                                    }
                                                    else
                                                    {
                                                    }
                                                    bool local_283_5 = this.GetECSRuntime().IsServer;
                                                    ::FCombatUtils::DamageTargetByHit(ProjectileOwner.GetOwnerEntity(), Entity, local_222.HitEntity, local_283_5, NAME_None, int(local_410._base_FECSEvent), ProjectileInfo.GetAttackInfoAfterPenetration());
                                                }
                                                else
                                                {
                                                    float32 local_166 = local_167_2 * local_164;
                                                    local_408 = local_319;
                                                    local_408 = local_408 * local_84.TimeDelayPerPenetrationHit.ToSeconds();
                                                    FFPTime local_308_4 = (FFPTime(local_408) + local_222.HitTime);
                                                    if (local_175)
                                                    {
                                                    }
                                                    else
                                                    {
                                                    }
                                                    ::FCombatUtils::DamageTargetByHit(ProjectileOwner.GetOwnerEntity(), Entity, local_222.HitEntity, this.GetECSRuntime().IsServer, NAME_None, int(local_410._base_FECSEvent), ProjectileInfo.GetAttackInfo());
                                                }
                                            }
                                            if (local_261)
                                            {
                                                FProjectileFXConfig local_478;
                                                if (local_84.bChangeAttackForPenetration)
                                                {
                                                }
                                                bool local_283_7 = ProjectileInfo.GetbPredictable();
                                                local_408 = local_319;
                                                local_408 = local_408 * local_84.TimeDelayPerPenetrationHit.ToSeconds();
                                                FFPTime local_308_5 = (FFPTime(local_408) + local_222.HitTime);
                                                ::FProjectileUtils::CreateHitPresentation(Entity, ProjectileOwner.GetOwnerEntity(), local_478, local_402.Location, local_304, local_222.HitSurfaceName, local_308_5, local_283_7);
                                            }
                                            ::FProjectileUtils::CalculatePenetrationProjectileHit(local_184, local_84, local_222.HitEntity.GetId());
                                            --local_239;
                                            ++local_319;
                                            break;
                                        }
                                        if (local_239 == 0)
                                        {
                                            break;
                                        }
                                    }
                                    FFPTime local_310_4 = local_84.PenetrationSameTargetMinInterval;
                                    if (local_310_4.opCmp(0.0) > 0)
                                    {
                                        FFPTime local_308_6 = FFPTime((FFPTime(local_222.HitTime) + local_84.PenetrationSameTargetMinInterval));
                                        local_310_4 = FFPTime(0);
                                        FECSEntityId local_275_3 = local_222.HitEntity.GetId();
                                        local_184.GetModify_NextPenetrationTimeByEntity().FindOrAdd(local_275_3, local_310_4) = local_308_6;
                                    }
                                    else
                                    {
                                        local_310_4 = FFPTime(-1);
                                        FFPTime local_308_7 = FFPTime(0);
                                        FECSEntityId local_275_4 = local_222.HitEntity.GetId();
                                        local_184.GetModify_NextPenetrationTimeByEntity().FindOrAdd(local_275_4, local_308_7) = local_310_4;
                                    }
                                }
                            }
                            if (int(local_84.MaxHitCount) > 0 && (local_184.GetHitCount() >= int(local_84.MaxHitCount)))
                            {
                                local_77 = false;
                                if (local_84.bDestroyWhenReachMaxHitCount)
                                {
                                    local_78 = true;
                                }
                                else
                                {
                                    local_550.opCall(FC_ProjectileHitTestDisableTag());
                                }
                            }
                        }
                    }
                    else
                    {
                        FFPTime local_308_8 = FFPTime(-1);
                        if (!(::FCombatUtils::TryRecordHit(local_278, local_222.HitEntity.GetId(), EHitRecordType(2), StrikeKey_Projectile, local_222.HitTime, local_222.HitTime, local_308_8)))
                        {
                            continue;
                        }
                        bool local_270 = false;
                        local_406 = local_222.TryGetHitBoxData(local_270);
                        bool local_4_3 = ProjectileInfo.GetbPredictable();
                        FECSEntity local_232_4 = ProjectileOwner.GetOwnerEntity();
                        float32 local_149_2 = local_148;
                        bool local_4_4 = this.GetECSRuntime().IsServer;
                        if (local_4_4)
                        {
                            if (local_270)
                            {
                                local_4_4 = !(local_406.BodyPartKey.IsNone());
                                if (!(local_4_4))
                                {
                                    local_4_4 = false;
                                }
                                else
                                {
                                    local_4_4 = local_296;
                                }
                                if (local_4_4)
                                {
                                    if (local_296.BodyPartData.BodyParts.Contains(local_406.BodyPartKey))
                                    {
                                        local_285 = local_296.BodyPartData.BodyParts[local_406.BodyPartKey].IsWeakness;
                                        if (local_285)
                                        {
                                            local_269 = true;
                                        }
                                    }
                                }
                            }
                            local_285 = false;
                            if (local_175)
                            {
                            }
                            else
                            {
                            }
                            local_4_4 = this.GetECSRuntime().IsServer;
                            ::FCombatUtils::DamageTargetByHit(ProjectileOwner.GetOwnerEntity(), Entity, local_222.HitEntity, local_4_4, NAME_None, int(local_410._base_FECSEvent), ProjectileInfo.GetAttackInfo());
                        }
                        if (local_261)
                        {
                            ::FProjectileUtils::CreateHitPresentation(Entity, ProjectileOwner.GetOwnerEntity(), HitConfig.HitFXConfig, local_222.Location, this.GetHitFxRotation(HitConfig.FXRotationMode, local_128, local_222.Normal), local_222.HitSurfaceName, local_222.HitTime, ProjectileInfo.GetbPredictable());
                        }
                        if (!(local_240))
                        {
                            local_78 = true;
                        }
                    }
                }
                else
                {
                    if (local_84)
                    {
                        if (!(::FProjectileUtils::CheckPenetrationProjectileHit(local_184, local_84, local_222.HitEntity.GetId(), local_222.HitTime)))
                        {
                            continue;
                        }
                        if (!(::FCombatUtils::TryRecordHit(local_278, local_222.HitEntity.GetId(), EHitRecordType(2), StrikeKey_Projectile, local_222.HitTime, local_222.HitTime, local_84.HitInterval)))
                        {
                            continue;
                        }
                        if (!(local_240))
                        {
                            ::FProjectileUtils::CalculatePenetrationProjectileHit(local_184, local_84, local_222.HitEntity.GetId());
                            if (int(local_84.MaxHitCount) > 0 && (local_184.GetHitCount() >= int(local_84.MaxHitCount)))
                            {
                                local_77 = false;
                                if (local_84.bDestroyWhenReachMaxHitCount)
                                {
                                    local_78 = true;
                                }
                                else
                                {
                                    local_550.opCall(FC_ProjectileHitTestDisableTag());
                                }
                            }
                        }
                    }
                    else
                    {
                        FFPTime local_308_9 = FFPTime(-1);
                        if (!(::FCombatUtils::TryRecordHit(local_278, local_222.HitEntity.GetId(), EHitRecordType(2), StrikeKey_Projectile, local_222.HitTime, local_222.HitTime, local_308_9)))
                        {
                            continue;
                        }
                        if (!(local_240))
                        {
                            local_78 = true;
                        }
                    }
                    if (local_261)
                    {
                        ::FProjectileUtils::CreateHitPresentation(Entity, ProjectileOwner.GetOwnerEntity(), HitConfig.HitFXConfig, local_222.Location, this.GetHitFxRotation(HitConfig.FXRotationMode, local_128, local_222.Normal), local_222.HitSurfaceName, local_222.HitTime, ProjectileInfo.GetbPredictable());
                    }
                }
                local_269 = !(local_240);
                if (local_269)
                {
                    this.StickProjectileToHitEntity(Entity, Transform, LifeTime, local_222, local_122, FixedTime, local_78, local_77);
                    local_269 = this.GetECSRuntime().IsServer;
                    ::FCombatUtils::TriggerCombatTimelineAction(Entity, ECombatTimelineTimePoint(1), local_222.HitTime, local_269, false);
                    if (::FAbilityUtils::CanTriggerAbilityEffectEvent(Entity, EAbilityEffectEvent(2)))
                    {
                        FAbilityEffectEventData_ProjectileHit local_574;
                        local_574.SetProjectileEntity(Entity);
                        local_574.SetPosition(Transform.GetPosition());
                        local_574.HitEntity = local_222.HitEntity;
                        local_574.HitPoint = local_222.HitPoint;
                        FECSEntity local_232_5 = local_578.opCall().GetOwnerEntity();
                    }
                    const FC_ProjectileTimelineEventTriggerConfig& local_586 = local_584.opCall();
                    if (local_586)
                    {
                        if (local_590.opCall())
                        {
                            ::FProjectileTimelineUtils::TriggerHitEventReaction(local_586.TriggerReactions, Entity, local_594.TimelineConfigData, local_236.Relation, local_222, Transform, local_222.HitTime);
                        }
                    }
                }
            }
            else
            {
                if (int(local_236.CheckResult) == 4 || (int(local_236.CheckResult) == 5) || (int(local_236.CheckResult) == 6) || (int(local_236.CheckResult) == 7) || (int(local_236.CheckResult) == 9))
                {
                    if (int(local_236.CheckResult) == 9)
                    {
                        if (::FCombatUtils::TryRecordHit(local_278, local_222.HitEntity.GetId(), EHitRecordType(2), StrikeKey_Projectile, local_222.HitTime, local_222.HitTime, FFPTime(-1)))
                        {
                            ::FCombatUtils::MakeInvincibleCounterEvent(local_222.HitEntity, ProjectileOwner.GetOwnerEntity(), local_236.CheckResult, local_222.HitTime, false);
                        }
                    }
                    else
                    {
                        ::FCombatUtils::MakeInvincibleCounterEvent(::FCombatUtils::GetFinalHitEntity(local_222.HitEntity), ProjectileOwner.GetOwnerEntity(), local_236.CheckResult, local_222.HitTime, ProjectileInfo.GetbPredictable());
                    }
                }
                else
                {
                    if (int(local_236.CheckResult) == 1)
                    {
                        if (HitConfig.HitSceneFXConfig.Asset.IsValid())
                        {
                            ::FProjectileUtils::CreateHitPresentation(Entity, ProjectileOwner.GetOwnerEntity(), HitConfig.HitSceneFXConfig, local_222.Location, this.GetHitFxRotation(HitConfig.FXRotationMode, local_128, local_222.Normal), local_222.HitSurfaceName, local_222.HitTime, ProjectileInfo.GetbPredictable());
                        }
                        local_269 = false;
                        local_240 = local_269;
                        if (HitConfig.bDestroyWhenHitScene)
                        {
                            local_269 = true;
                            local_78 = local_269;
                        }
                        else
                        {
                            if (!(local_237))
                            {
                                local_269 = false;
                            }
                            else
                            {
                                local_269 = local_222.HitEntity;
                            }
                            if (local_269)
                            {
                                this.StickProjectileToHitEntity(Entity, Transform, LifeTime, local_222, local_122, FixedTime, local_78, local_77);
                            }
                            else
                            {
                                Get local_604;
                                const FC_ProjectileStickyConfig& local_606 = local_604.opCall();
                                if (local_606)
                                {
                                    FC_VisualTransformOffset local_628;
                                    float32 local_161_3 = local_606.OverrideLifeTime;
                                    if (local_161_3 > 0.0f)
                                    {
                                        FFPTime local_310_5 = FFPTime(local_222.HitTime);
                                        FFPTime local_308_10 = FFPTime(local_606.OverrideLifeTime);
                                        LifeTime.SetCustomEndTime((local_310_5 + local_308_10));
                                    }
                                    local_550.opCall(FC_ProjectileHitTestDisableTag());
                                    FC_ProjectileVisualOffsetDisableTag local_614;
                                    Assign local_612;
                                    local_612.opCall(local_614);
                                    FFPTime local_308_11 = FFPTime(-1);
                                    Entity.MoveTo(local_222.HitPoint, local_308_11);
                                    Remove local_618;
                                    local_618.opCall();
                                    Remove local_622;
                                    local_622.opCall();
                                    local_161_3 = 1.0f;
                                    local_628.PositionOffset = FVector3f(local_222.HitPoint);
                                    local_628.RotationOffset = FQuat4f(Transform.GetRotation());
                                    local_628.bUseOffsetAsTransformDirectly = true;
                                    local_77 = false;
                                    local_240 = local_606.bDestroyWithTarget;
                                }
                            }
                        }
                        ::FCombatUtils::TriggerCombatTimelineAction(Entity, ECombatTimelineTimePoint(3), local_222.HitTime, this.GetECSRuntime().IsServer, false);
                        if (::FAbilityUtils::CanTriggerAbilityEffectEvent(Entity, EAbilityEffectEvent(3)))
                        {
                            FAbilityEffectEventData_ProjectileHit local_574;
                            local_574.SetProjectileEntity(Entity);
                            local_574.SetPosition(Transform.GetPosition());
                            local_574.HitEntity = ENTITY_NULL;
                            local_574.HitPoint = local_222.HitPoint;
                            FECSEntity local_154_4 = local_578.opCall().GetOwnerEntity();
                        }
                        const FC_ProjectileTimelineEventTriggerConfig& local_586_2 = local_584.opCall();
                        if (local_586_2)
                        {
                            if (local_590.opCall())
                            {
                                ::FProjectileTimelineUtils::TriggerHitSceneEventReaction(local_586_2.TriggerReactions, Entity, local_594.TimelineConfigData, local_222, Transform, local_222.HitTime);
                            }
                        }
                        local_269 = ECS::GetRuntimeInfo().IsServer;
                        if (!(local_269 && local_59))
                        {
                            local_269 = false;
                        }
                        else
                        {
                            local_269 = local_34;
                        }
                        if (local_269)
                        {
                            FSimpleDestructibleBreakResult local_674;
                            int local_248_2 = int(local_76.ImpactStrengthValue);
                            int local_247_2 = int(local_76.ImpactType);
                            EDestructibleClassLevel local_249_2 = local_76.GetDestructibleClassLevelFromDamage(ProjectileOwner.GetOwnerEntity());
                            int local_2 = int(local_222.HitItemIndex);
                            FECSEntity local_154_5 = ProjectileOwner.GetOwnerEntity();
                            local_269 = local_674.bIsSimpleDestructible && !(local_674.bWasAlreadyDestroyed);
                            if (local_269 && local_240)
                            {
                                local_718.SetFoliageISM(local_674.FoliageISMKey);
                                local_718.SetFoliageISkM(local_674.FoliageISkMKey);
                                local_718.SetStaticMesh(local_674.StaticMeshKey);
                            }
                        }
                    }
                    else
                    {
                        if (int(local_236.CheckResult) == 10)
                        {
                            FFPTime local_308_12 = FFPTime(-1);
                            if (::FCombatUtils::TryRecordHit(local_278, local_222.HitEntity.GetId(), EHitRecordType(2), StrikeKey_Projectile, local_222.HitTime, local_222.HitTime, local_308_12))
                            {
                                if (HitConfig.HitFXConfig.Asset.IsValid())
                                {
                                    ::FProjectileUtils::CreateHitPresentation(Entity, ProjectileOwner.GetOwnerEntity(), HitConfig.HitFXConfig, local_222.Location, this.GetHitFxRotation(HitConfig.FXRotationMode, local_128, local_222.Normal), local_222.HitSurfaceName, local_222.HitTime, ProjectileInfo.GetbPredictable());
                                }
                            }
                        }
                        else
                        {
                            if (int(local_236.CheckResult) == 3)
                            {
                                const FC_ProjectileTimelineEventTriggerConfig& local_586_3 = local_584.opCall();
                                if (local_586_3)
                                {
                                    local_269 = local_260.opCall().bNoReactToProjectile;
                                    if (!(local_269))
                                    {
                                        if (local_590.opCall())
                                        {
                                            ::FProjectileTimelineUtils::TriggerHitEventReaction(local_586_3.TriggerReactions, Entity, local_594.TimelineConfigData, local_236.Relation, local_222, Transform, local_222.HitTime);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (this.GetECSRuntime().IsServer)
            {
                if (!(local_10))
                {
                    local_269 = false;
                }
                else
                {
                    local_269 = !(local_77);
                    local_269 = ::FProjectileUtils::ShouldProjectileExplosion(local_10, (local_177 == 0), local_269, local_236);
                }
                if (local_269)
                {
                    ::FProjectileUtils::ProjectileExplosion(local_10, ProjectileOwner.GetOwnerEntity(), Entity, local_222.Location, local_222.HitTime);
                }
            }
            if (local_78)
            {
                local_550.opCall(FC_ProjectileHitTestDisableTag());
                if (!(HitConfig.bNeverDestroyByHit))
                {
                    ProjectileInfo.SetDestroyPosition(local_222.HitPoint);
                    LifeTime.SetCustomEndTime(local_222.HitTime);
                }
                break;
            }
            if (!(local_77))
            {
                break;
            }
        }
        return;
    }
    void StickProjectileToHitEntity(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_LifeTime &inout LifeTime, const FHitTestResult &inout Result, const FVector &inout Velocity, const FCS_FixedTime &inout FixedTime, bool &inout bDestroy, bool &inout bCanHitNext) const
    {
        int local_34 = 0;
        GetDefaulted local_98;
        bool local_117;
        int local_162 = 0;
        Get local_4;
        const FC_ProjectileStickyConfig& local_6 = local_4.opCall();
        if (local_6)
        {
            bool local_35;
            if (local_6.OverrideLifeTime > 0.0f)
            {
                LifeTime.SetCustomEndTime((FFPTime(Result.HitTime) + FFPTime(local_6.OverrideLifeTime)));
            }
            Assign local_22;
            local_22.opCall(FC_ProjectileHitTestDisableTag());
            Remove local_28;
            local_28.opCall();
            local_34.SetAttachToEntity(Result.HitEntity);
            local_35 = false;
            const FHitBoxData& local_38 = Result.TryGetHitBoxData(local_35);
            if (local_35)
            {
                bool local_39;
                local_39 = false;
                FTransform local_92 = FTransformUtils::GetSocketTransformInGameMesh(Result.HitEntity, local_38.AttachInfo.AttachToName, Result.HitTime, local_39, FDownsampleConfig());
                if (local_39)
                {
                    local_34.SetAttachmentMode(ETransformAttachmentLogicMode(0));
                    local_34.SetSocketName(local_38.AttachInfo.AttachToName);
                }
                else
                {
                    local_92 = FTransformUtils::GetBoneTransformInGameMesh(Result.HitEntity, local_38.AttachInfo.GetBoneHistoryIndex(), Result.HitTime, local_39);
                    if (local_39)
                    {
                        local_34.SetAttachmentMode(ETransformAttachmentLogicMode(2));
                        local_34.SetBoneIndex(local_38.AttachInfo.GetBoneHistoryIndex());
                    }
                    else
                    {
                        local_34.SetAttachmentMode(ETransformAttachmentLogicMode(1));
                        local_92 = local_98.opCall().ToFTransform();
                    }
                }
                local_34.SetLocationOffset(local_92.InverseTransformPosition(Result.HitPoint));
                local_34.SetRotationOffset(local_92.InverseTransformRotation(Transform.GetRotation()));
            }
            else
            {
                local_34.SetAttachmentMode(ETransformAttachmentLogicMode(1));
                FTransform local_64 = local_98.opCall().ToFTransform();
                local_34.SetLocationOffset(local_64.InverseTransformPosition(Result.HitPoint));
                local_34.SetRotationOffset(local_64.InverseTransformRotation(Transform.GetRotation()));
            }
            if (!(this.GetECSRuntime().IsServer))
            {
                local_117 = false;
            }
            else
            {
                Has local_116;
                local_117 = local_116.opCall();
            }
            if (local_117)
            {
                ModifyOrAdd local_122;
                local_122.opCall().GetModify_Children().Add(Entity);
            }
            ModifyOrAdd local_126;
            local_126.opCall().SetParent(Result.HitEntity);
            FProjectileStickAttachmentInfo local_146;
            local_146.SetTargetEntity(Result.HitEntity);
            FName local_148;
            if (local_35)
            {
                local_148 = local_38.AttachInfo.AttachToName;
            }
            else
            {
                local_148 = NAME_None;
            }
            local_146.SetSocketName(local_148);
            local_146.SetHitTestFromPos(Result.HitPoint);
            FVector local_160(Result.HitPoint);
            local_146.SetHitTestToPos((local_160 + ((Velocity * FixedTime.DeltaTime.ToSeconds()) * 3.0)));
            local_162.SetInfo(local_146);
            bDestroy = false;
            bCanHitNext = false;
        }
        return;
    }
    UFUNCTION()
    void Job_HitTestByMoveTrail(const FECSEntity &inout Entity, const FC_HitTestByMoveTrail &inout HitTestByMoveTrail, const FC_LifeTime &inout LifeTime, const FC_ProjectileInfo &inout ProjectileInfo, const FC_Transform &inout Transform, const FC_Owner &inout ProjectileOwner, const FCS_FixedTime &inout FixedTime) const
    {
        Has local_4;
        int local_16 = 0;
        if (!(local_4.opCall()))
        {
            ModifyOrAdd local_10;
            local_10.opCall().SetLastPos(ProjectileInfo.GetSpawnPosition());
        }
        if ((FFPTime(FixedTime.Time) - local_16.GetLastRecordTime()).opCmp(HitTestByMoveTrail.HitTestCheckIntervalTime) > 0)
        {
            FFPTime local_20_2 = (FFPTime(LifeTime.GetSpawnTime()) + HitTestByMoveTrail.HitTestDelayTimeAfterSpawn);
            if (local_20_2.opCmp(FixedTime.Time) < 0)
            {
                local_20_2 = FixedTime.Time;
            }
            FECSEntity local_32 = ProjectileOwner.GetOwnerEntity();
            SendEvent local_36;
            FCE_ArealStrikeRequestEvent& local_38 = local_36.opCall(local_20_2);
            if (local_38)
            {
                local_38.TransformPos = ((FVector(Transform.GetPosition()) + local_16.GetLastPos()) / 2.0);
                local_38.TransformRot = FQuat4f((FVector(Transform.GetPosition()) - local_16.GetLastPos()).ToOrientationQuat());
                local_38.SweepFromOffset = FVector3f::ZeroVector;
                local_38.Shape.SetShapeType(EHitTestShapeType(1));
                float local_72 = (HitTestByMoveTrail.HitTestHeight / 2.0f);
                float local_74 = (HitTestByMoveTrail.HitTestWidth / 2.0f);
                FVector local_44_2 = (FVector(Transform.GetPosition()) - local_16.GetLastPos());
                local_38.Shape.SetBoxHalfExtend(FVector((local_44_2.Size() / 2.0), local_74, local_72));
                int local_79 = Entity.GetIdValue();
                local_38.StrikeKey = FName((StrikeKey_Projectile.ToString() + local_79));
                local_38.HitInterval = 1.0;
                local_38.AttackInfo.AttackData = HitTestByMoveTrail.AttackData;
                local_38.StrikeEventData.StrikeShape = HitTestByMoveTrail.StrikeShape;
                local_38.StrikeEventData.StrikeDirection = Transform.GetRotation().RotateVector(FVector(HitTestByMoveTrail.StrikeDirection));
                local_38.StrikeEventData.bUseHitTestPosStrikeOrigin = true;
            }
            local_16.SetLastRecordTime(FixedTime.Time);
            local_16.SetLastPos(Transform.GetPosition());
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateProjectileHealth(const FECSEntity &inout Entity, FC_ProjectileHealth &inout ProjectileHealth, FC_LifeTime &inout LifeTime, const FCS_FixedTime &inout FixedTime) const
    {
        if (ProjectileHealth.GetRemainCanBeHitCount() == 0 || (ProjectileHealth.GetRemainDamageCanTake() == 0.0f))
        {
            if (ProjectileHealth.GetbCanDestroyByHit())
            {
                LifeTime.SetCustomEndTime(FixedTime.Time);
            }
            Remove local_10;
            local_10.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateAttachProjectileLifeTime(const FECSEntity &inout Entity, const FC_ProjectileStickyConfig &inout StickyConfig, FC_TransformAttachmentLogic &inout Attachment, FC_LifeTime &inout LifeTime, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_1;
        if (StickyConfig.bDestroyWithTarget)
        {
            if (!(Attachment.GetAttachToEntity().IsValid()))
            {
                local_1 = true;
            }
            else
            {
                Has local_6;
                local_1 = local_6.opCall();
            }
            if (local_1)
            {
                local_1 = true;
            }
            else
            {
                Has local_12;
                local_1 = local_12.opCall();
            }
            if (local_1)
            {
                LifeTime.SetCustomEndTime(FixedTime.Time);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateProjectileStickDestroyWithSimpleDestructibleLifeTime(const FECSEntity &inout Entity, const FC_ProjectileStickDestroyWithSimpleDestructible &inout StickDestroyWithTarget, FC_LifeTime &inout LifeTime, const FCS_FixedTime &inout FixedTime, const FCS_SimpleDestructibleManager &inout Manager) const
    {
        bool local_1 = false;
        if (!((StickDestroyWithTarget.GetFoliageISM().GetISM() == nullptr)) && Manager.GetStateMap_FoliageISM().Contains(StickDestroyWithTarget.GetFoliageISM()))
        {
            local_1 = true;
        }
        else
        {
            if (!((StickDestroyWithTarget.GetFoliageISkM().GetISkM() == nullptr)) && Manager.GetStateMap_FoliageISkM().Contains(StickDestroyWithTarget.GetFoliageISkM()))
            {
                local_1 = true;
            }
            else
            {
                if (!((StickDestroyWithTarget.GetStaticMesh().GetSM() == nullptr)) && Manager.GetStateMap_StaticMesh().Contains(StickDestroyWithTarget.GetStaticMesh()))
                {
                    local_1 = true;
                }
            }
        }
        if (local_1)
        {
            LifeTime.SetCustomEndTime(FixedTime.Time);
            Remove local_38;
            local_38.opCall();
        }
        return;
    }
    UFUNCTION()
    void Monitor_HandleProjectileHitStick(const FECSEntity &inout Entity, const FC_ProjectileHitStickAttach &inout ProjectileHitStickAttach) const
    {
        int local_12 = 0;
        int local_30 = 0;
        int local_44 = 0;
        USkinnedMeshComponent local_156;
        const FProjectileStickAttachmentInfo& local_2 = ProjectileHitStickAttach.GetInfo();
        FECSEntity local_6 = FECSEntity(local_2.GetTargetEntity());
        USkeletalMeshComponent local_22 = (Cast<USkeletalMeshComponent>(local_6.GetActor().GetDefaultAttachComponent()));
        if (local_22 != nullptr)
        {
            if (!(local_30))
            {
                return;
            }
            if (!(local_30.GetGameActorEntity().IsValid()))
            {
                return;
            }
            if (!(local_44) || !(local_44.Actor.IsValid()))
            {
                return;
            }
            FName local_47(NAME_None);
            FName local_49(NAME_None);
            FVector local_56(FVector::ZeroVector);
            FQuat local_64 = FQuat(FQuat::Identity);
            FHitResult local_130;
            FVector local_136;
            FVector local_142;
            FName local_144;
            bool local_147 = local_22.LineTraceComponent(local_2.GetHitTestFromPos(), local_2.GetHitTestToPos(), true, false, false, local_136, local_142, local_144, local_130);
            if (local_147)
            {
                local_47 = local_22.GetFName();
                UPrimitiveComponent local_152;
                local_156 = (Cast<USkinnedMeshComponent>(local_152));
                if (local_156 != nullptr)
                {
                    FTransform local_184 = local_156.GetBoneTransform(local_130.BoneName, ERelativeTransformSpace(0));
                    local_49 = local_130.BoneName;
                    local_56 = local_184.InverseTransformPosition(local_130.Location);
                    AActor local_216;
                    local_64 = local_184.InverseTransformRotation(local_216.GetActorRotation()).Quaternion();
                }
                else
                {
                    local_147 = false;
                }
            }
            if (!(local_147))
            {
                Get local_240;
                const FC_TransformAttachmentLogic& local_242 = local_240.opCall();
                if (local_242)
                {
                    local_47 = local_22.GetFName();
                    FTransform local_208 = local_22.GetSocketTransform(local_2.GetSocketName(), ERelativeTransformSpace(0));
                    FVector local_214 = local_208.TransformPosition(local_242.GetLocationOffset());
                    FQuat local_236 = local_208.TransformRotation(local_242.GetRotationOffset());
                    FTransform local_184_2 = local_22.GetSocketTransform(local_2.GetSocketName(), ERelativeTransformSpace(0));
                    local_49 = local_2.GetSocketName();
                    local_56 = local_184_2.InverseTransformPosition(local_214);
                    local_64 = local_184_2.InverseTransformRotation(local_236);
                }
                else
                {
                    local_56 = local_22.GetWorldTransform().InverseTransformPosition(local_12.GetPosition());
                    local_64 = local_22.GetWorldTransform().InverseTransformRotation(local_12.GetRotation());
                }
            }
            Entity.ActorAttachTo(local_6, local_47, local_49, local_56, local_64);
        }
        return;
    }
    UFUNCTION()
    void Monitor_InitFXSurroundMaterialCheck(const FECSEntity &inout Entity, const FC_SurroundingMaterialCheckConfig &inout Config) const
    {
        Get local_4;
        const FC_ViewEntityManager& local_6 = local_4.opCall();
        if (local_6)
        {
            if (FECSEntity(local_6.GetGameActorEntity()).IsValid())
            {
                FC_SurroundingMaterialCheckRuntime local_36;
                local_36.TraceLine = Config.TraceLine;
                local_36.CheckInterval = Config.CheckInterval;
            }
        }
        return;
    }
    UFUNCTION()
    void Job_DoFXSurroundMaterialCheck(const FC_ViewEntityTransform &inout Transform, FC_SurroundingMaterialCheckRuntime &inout Runtime, const FC_InterpoTime &inout InterpoTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_SpawnFXByMoveTrail(const FECSEntity &inout Entity, const FC_FXByMoveTrail &inout FXByMoveTrail, const FC_LifeTime &inout LifeTime, const FC_ProjectileInfo &inout ProjectileInfo, const FC_Transform &inout Transform, const FC_Owner &inout ProjectileOwner, const FCS_FixedTime &inout FixedTime) const
    {
        int local_6 = 0;
        int local_8 = FXByMoveTrail.Configs.Num();
        if (local_6.SpawnedIndex.Num() == local_8)
        {
            return;
        }
        int local_10 = 0;
        while (local_10 < local_8)
        {
            const FFXByMoveTrailConfig& local_12 = FXByMoveTrail.Configs[local_10];
            if ((FFPTime(FixedTime.Time) - LifeTime.GetSpawnTime()).opCmp(local_12.SpawnFXDelayTime) < 0)
            {
            }
            else
            {
                if (!(local_6.SpawnedIndex.Contains(local_10)))
                {
                    FFXConfig local_132 = local_12.FXConfig;
                    local_132.SetbUseWorldOriginAsBaseTransformSource(true);
                    local_132.SetLocationOffsetSpace(EFXOffsetSpace(2));
                    local_132.SetRotationOffsetSpace(EFXOffsetSpace(2));
                    local_132.SetbDetach(true);
                    local_132.SetLocationOffset(((FVector(Transform.GetPosition()) + ProjectileInfo.GetSpawnPosition()) * 0.5));
                    local_132.SetRotationOffset(ProjectileInfo.GetSpawnRotation().Rotator());
                    FECSEntity local_168 = ECSFX::PlayFXDurational(ProjectileOwner.GetOwnerEntity(), local_132, (FFPTime(LifeTime.GetSpawnTime()) + local_12.SpawnFXDelayTime), 1.0f, false);
                    if (local_168 && !(local_12.FXLengthParamName.IsNone()))
                    {
                        ECSFX::SetFXParameterFloat(local_168, local_12.FXLengthParamName, float32(((FVector(ProjectileInfo.GetSpawnPosition()) - Transform.GetPosition()).Size() / local_12.FXLengthDesiredDistance)));
                    }
                    FFXByMoveTrailRuntimeData local_180;
                    local_180.Entity = local_168;
                    FName local_182;
                    if (local_12.bUpdateLengthByTime)
                    {
                        local_182 = local_12.FXLengthParamName;
                    }
                    else
                    {
                        local_182 = NAME_None;
                    }
                    local_180.FXLengthParamName = local_182;
                    local_180.FXLengthDesiredDistance = local_12.FXLengthDesiredDistance;
                    local_6.Datas.Add(local_180);
                    local_6.SpawnedIndex.Add(local_10);
                }
            }
            ++local_10;
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateFXByMoveTrail(const FECSEntity &inout Entity, FC_FXByMoveTrailRuntimeData &inout FXByMoveTrailRuntimeData, const FC_ProjectileInfo &inout ProjectileInfo, const FC_Transform &inout Transform) const
    {
        int local_1 = 0;
        while (local_1 < 0)
        {
            FFXByMoveTrailRuntimeData& local_6 = FXByMoveTrailRuntimeData.Datas[local_1];
            FECSEntity local_10 = FECSEntity(local_6.Entity);
            if (local_10.IsValid())
            {
                if (!(local_6.FXLengthParamName.IsNone()))
                {
                    ECSFX::SetFXParameterFloat(local_10, local_6.FXLengthParamName, float32(((FVector(ProjectileInfo.GetSpawnPosition()) - Transform.GetPosition()).Size() / local_6.FXLengthDesiredDistance)));
                }
            }
            else
            {
                FXByMoveTrailRuntimeData.Datas.RemoveAtSwap(local_1);
                --local_1;
            }
            ++local_1;
        }
        if (FXByMoveTrailRuntimeData.Datas.IsEmpty())
        {
            Remove local_34;
            local_34.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateFXLifeTime(const FECSEntity &inout Entity, const FC_ProjectileInfo &inout ProjectileInfo, const FC_ProjectileFXConfig &inout ProjectileFXConfig, const FC_InterpoTime &inout InterpoTime, const FC_LifeTime &inout LifeTime) const
    {
        int local_16 = 0;
        bool local_35 = false;
        bool local_36;
        if (ProjectileFXConfig.LifeTimeFX.IsEmpty())
        {
            XWarning(ELog(0), FString().Append("Entity '").Append(Entity.GetEntityName()).Append("' has FC_ProjectileFXConfig but LifeTimeFX is empty, should remove it in config!"));
            return;
        }
        if (local_16.FXActorDatas.IsEmpty())
        {
            local_16.FXActorDatas.SetNum(ProjectileFXConfig.LifeTimeFX.Num());
        }
        Get local_24;
        FFPTime local_26 = FProjectileTimeUtils::GetProjectileTime(LifeTime, local_24.opCall(), InterpoTime.LastTime);
        FFPTime local_20 = FProjectileTimeUtils::GetProjectileTime(LifeTime, local_24.opCall(), InterpoTime.Time);
        int local_29 = 0;
        FFXOverrideParam local_274;
        while (local_29 < 0)
        {
            const FProjectileFXLifeTimeConfig& local_32 = ProjectileFXConfig.LifeTimeFX[local_29];
            FProjectileFXLifeTimeRuntimeData& local_34 = local_16.FXActorDatas[local_29];
            local_35 = false;
            bool local_1 = local_26.opCmp(local_32.SpawnTime) < 0 && (local_20.opCmp(local_32.SpawnTime) >= 0);
            if (!(local_1 || (((local_32.SpawnTime == 0.0) && (local_26.opCmp(0.0) <= 0) && (local_20.opCmp(0.0) > 0)))))
            {
                local_1 = false;
            }
            else
            {
                FFPTime local_28_2 = local_32.SpawnTime;
                if (local_20.opCmp((local_28_2 + local_32.Duration)) <= 0)
                {
                    local_36 = true;
                }
                else
                {
                    local_36 = local_32.bLifeTimeWithProjectile;
                }
                local_1 = local_36;
            }
            if (local_1)
            {
                if (local_34.FXEntity.IsValid())
                {
                    ECSFX::StopFX(local_34.FXEntity, (int(local_34.StopMethod) == 1), false, 0.0f);
                    local_34.FXEntity = ENTITY_NULL;
                }
                FTransform local_72 = FTransform(ProjectileInfo.GetSpawnRotation().Rotator(), ProjectileInfo.GetSpawnPosition(), FVector::OneVector);
                Get local_82;
                const FC_VisualTransformOffset& local_84 = local_82.opCall();
                if (local_84)
                {
                    local_72.SetLocation((FVector(local_84.PositionOffset) + ProjectileInfo.GetSpawnPosition()));
                    local_72.SetRotation((FQuat(local_84.RotationOffset) * ProjectileInfo.GetSpawnRotation()));
                }
                FECSEntity local_236 = ECSFX::PlayFXDurational(Entity, local_32.FXConfig.GetFXConfig(), InterpoTime.Time, 1.0f, false);
                if (local_236.IsValid())
                {
                    local_35 = true;
                    local_34.FXEntity = local_236;
                    local_34.StopMethod = EFXStopMethod(local_32.StopMethod);
                }
                else
                {
                    XWarning(ELog(0), FString().Append("Entity '").Append(Entity.GetEntityName()).Append("' FC_ProjectileFXConfig FX Asset invalid!"));
                }
            }
            else
            {
                local_36 = local_26.opCmp(local_32.SpawnTime) >= 0 && (local_20.opCmp(local_32.Duration) > 0);
                if (local_36 && !(local_32.bLifeTimeWithProjectile))
                {
                    if (local_34.FXEntity.IsValid())
                    {
                        ECSFX::StopFX(local_34.FXEntity, (int(local_34.StopMethod) == 1), false, 0.0f);
                        local_34.FXEntity = ENTITY_NULL;
                    }
                }
            }
            if (local_34.FXEntity.IsValid())
            {
                for (auto& local_250 : local_32.ParamChangePoints)
                {
                    if (FFPTime(local_250.GetLerpToDuration()).opCmp(0.0) > 0)
                    {
                        if (local_20.opCmp(local_250.GetTime()) >= 0 && (local_20.opCmp((FFPTime(local_250.GetLerpToDuration()) + local_250.GetTime())) <= 0))
                        {
                            for (auto& local_264 : local_250.GetOverrideParams())
                            {
                                local_36 = !(local_34.LerpParamValues.Contains(local_264.ParamName));
                                FFXParamValueLerpTime& local_268 = local_34.LerpParamValues.FindOrAdd(local_264.ParamName);
                                if (FFPTime(local_268.GetEndTime()).opCmp(local_250.GetTime()) <= 0)
                                {
                                    local_268.SetStartTime(local_250.GetTime());
                                    FFPTime local_42 = (FFPTime(local_250.GetLerpToDuration()) + local_250.GetTime());
                                    local_268.SetEndTime(local_42);
                                    if (local_36)
                                    {
                                        local_274 = local_264;
                                    }
                                    else
                                    {
                                        local_274 = local_268.GetEndValue();
                                    }
                                    local_268.SetStartValue(local_274);
                                    local_268.SetEndValue(local_264);
                                }
                                if (local_20.opCmp(local_268.GetStartTime()) >= 0 && (local_26.opCmp(local_268.GetEndTime()) < 0))
                                {
                                    FFPTime local_42_2 = (local_20 - local_268.GetStartTime());
                                    ECSFX::SetFXParameterStruct(local_34.FXEntity, local_264.ParamName, FFXOverrideParam::Lerp(local_268.GetStartValue(), local_268.GetEndValue(), float32(FMath::Clamp((local_42_2 / local_250.GetLerpToDuration()), 0.0, 1.0))).ParamValue);
                                }
                            }
                        }
                        else
                        {
                            if (FFPTime(local_250.GetTime()).opCmp(local_26) > 0 && ((((FFPTime(local_250.GetTime()) + local_250.GetLerpToDuration())).opCmp(local_20) <= 0)))
                            {
                                for (auto& local_264 : local_250.GetOverrideParams())
                                {
                                    ECSFX::SetFXParameterStruct(local_34.FXEntity, local_264.ParamName, local_264.ParamValue);
                                }
                            }
                        }
                        continue;
                    }
                    if (FFPTime(local_250.GetTime()).opCmp(local_26) > 0 && (FFPTime(local_250.GetTime()).opCmp(local_20) <= 0))
                    {
                        for (auto& local_264 : local_250.GetOverrideParams())
                        {
                            ECSFX::SetFXParameterStruct(local_34.FXEntity, local_264.ParamName, local_264.ParamValue);
                        }
                    }
                }
                ECSFX::SetFXUpdateTime(local_34.FXEntity, (local_20 - local_32.SpawnTime));
            }
            ++local_29;
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnFXLifeTimeRemove(const FC_ProjectileFXLifeTime &inout ProjectileFXLifeTime) const
    {
        for (auto& local_16 : ProjectileFXLifeTime.FXActorDatas)
        {
            if (local_16.FXEntity.IsValid())
            {
                ECSFX::StopFX(local_16.FXEntity, (int(local_16.StopMethod) == 1), false, 0.0f);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateProjectileActorFXSurrounding(const FECSEntity &inout Entity, const FC_Actor &inout ActorComp, const FC_SurroundingMaterialCheckRuntime &inout Runtime) const
    {
        AProjectileBaseActor local_8;
        if (Runtime.bSurfaceUpdate)
        {
            AActor local_4;
            local_8 = (Cast<AProjectileBaseActor>(local_4));
            if (local_8 != nullptr)
            {
                local_8.OnGroundSurfaceContactChangeEvent(Runtime.OldSurfaceName, Runtime.NewSurfaceName, int(Runtime.NewSurfaceIndex));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ClearSurroundingMaterialCheckUpdateMark(FC_SurroundingMaterialCheckRuntime &inout Runtime) const
    {
        if (Runtime.bSurfaceUpdate)
        {
            Runtime.bSurfaceUpdate = false;
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ProjectileTimelineSynced() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorProjectileUseTimelineTagOnAssignView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ProjectileTimelineSynced(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorProjectileUseTimelineTagOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_ProjectileTimelineSynced(local_46, local_52);
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_ProjectileLifeTime(const FC_LifeTime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_8 = FFPTime(TimerComp.GetEndTime());
        FName local_10 = FName("S_ProjectileSystemAS::Job_ProjectileLifeTime");
        if (local_8.opCmp(0.0) >= 0 && (local_8.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_10, local_8, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_ProjectileLifeTime(const FC_LifeTime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_8 = FFPTime(TimerComp.GetEndTime());
        FName local_10 = FName("S_ProjectileSystemAS::Job_ProjectileLifeTime");
        if (local_8.opCmp(0.0) >= 0 && (local_8.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_10, local_8, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_ProjectileLifeTime(const FC_LifeTime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_8 = FFPTime(TimerComp.GetEndTime());
        FName local_10 = FName("S_ProjectileSystemAS::Job_ProjectileLifeTime");
        if (local_8.opCmp(0.0) >= 0 && (local_8.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_10, local_8, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_ProjectileLifeTime() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = this.GetECSWorld().__GetMonitorLifeTimeOnModifyView(EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_ProjectileLifeTime(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = this.GetECSWorld().__GetMonitorLifeTimeOnActiveView(EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_ProjectileLifeTime(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_ProjectileLifeTime() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = this.GetECSWorld().__GetMonitorLifeTimeOnModifyView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_ProjectileLifeTime(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = this.GetECSWorld().__GetMonitorLifeTimeOnActiveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_ProjectileLifeTime(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_ProjectileLifeTime() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = this.GetECSWorld().__GetMonitorLifeTimeOnModifyView(EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_ProjectileLifeTime(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = this.GetECSWorld().__GetMonitorLifeTimeOnActiveView(EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_ProjectileLifeTime(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ProjectileLifeTime() const
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
            FFPTime local_44 = local_42.GetEndTime();
            if (local_44.opCmp(0.0) < 0 || (local_42.GetEndTime() == FPTIME_MAX))
            {
                continue;
            }
            if (local_11)
            {
                continue;
            }
            this.Job_ProjectileLifeTime(local_50, local_52, local_6);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Job_ProjectileLifeTimeWithTimeTweak() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
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
                this.Job_ProjectileLifeTimeWithTimeTweak(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Exclude(local_106).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_132 = 0;
        FECSRuntimeViewIterator local_166 = local_106.Iterator();
        for (; local_166.CanProceed;)
        {
            local_40 = local_166.Proceed();
            ++local_132;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_ProjectileLifeTimeWithTimeTweak(local_204, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_132);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_ProjectileDelayDestroy(const FC_ProjectileDelayDestroy &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetDestroyTime());
        FName local_8 = FName("S_ProjectileSystemAS::Job_ProjectileDelayDestroy");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_ProjectileDelayDestroy(const FC_ProjectileDelayDestroy &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetDestroyTime());
        FName local_8 = FName("S_ProjectileSystemAS::Job_ProjectileDelayDestroy");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_ProjectileDelayDestroy(const FC_ProjectileDelayDestroy &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetDestroyTime());
        FName local_8 = FName("S_ProjectileSystemAS::Job_ProjectileDelayDestroy");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_ProjectileDelayDestroy() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorProjectileDelayDestroyOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_ProjectileDelayDestroy(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorProjectileDelayDestroyOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_ProjectileDelayDestroy(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_ProjectileDelayDestroy() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorProjectileDelayDestroyOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_ProjectileDelayDestroy(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorProjectileDelayDestroyOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_ProjectileDelayDestroy(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_ProjectileDelayDestroy() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorProjectileDelayDestroyOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_ProjectileDelayDestroy(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorProjectileDelayDestroyOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_ProjectileDelayDestroy(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ProjectileDelayDestroy() const
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
            FFPTime local_44 = FFPTime(local_42.GetDestroyTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetDestroyTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (local_11)
            {
                continue;
            }
            this.Job_ProjectileDelayDestroy(local_50, local_52, local_6);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Job_FinishSpawnProjectile() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_CharacterFireProjectile> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_CharacterFireProjectile& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_FinishSpawnProjectile(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_AfterSpawnProjectileSelectConfig() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CharacterFireProjectile> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CharacterFireProjectile& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_AfterSpawnProjectileSelectConfig(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_FreezeProjectile() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_198 = 0;
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
                this.Job_FreezeProjectile(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
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
        Include local_120;
        local_120.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_126 = 0;
        FECSRuntimeViewIterator local_160 = local_100.Iterator();
        for (; local_160.CanProceed;)
        {
            local_40 = local_160.Proceed();
            ++local_126;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_FreezeProjectile(local_198, local_42, local_48, local_54, local_6);
            local_62.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_126);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CorrectProjectileInterpoTransform() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CharacterFireProjectile> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CharacterFireProjectile& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_CorrectProjectileInterpoTransform(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_SpawnProjectileVisualTransform() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CharacterFireProjectile> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CharacterFireProjectile& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_SpawnProjectileVisualTransform(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_RecoverProjectileVisualTransformOffset() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
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
                this.ClientJob_RecoverProjectileVisualTransformOffset(local_36, local_38, local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_86).opCall();
        Exclude(local_86).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_86.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_RecoverProjectileVisualTransformOffset(local_180, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_CheckProjectileVisualTransformOffsetCacheValid() const
    {
        const FECSEntity& local_36;
        int local_160 = 0;
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
                this.ClientJob_CheckProjectileVisualTransformOffsetCacheValid(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_74.Iterator();
        for (; local_122.CanProceed;)
        {
            local_36 = local_122.Proceed();
            ++local_88;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_CheckProjectileVisualTransformOffsetCacheValid(local_160);
        }
        local_2.UpdateCachedEntityCount(local_88);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateProjectileVisualTransformOverride() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        int local_56 = 0;
        MarkModifiedIfDirty local_64;
        int local_196 = 0;
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
                this.ClientJob_UpdateProjectileVisualTransformOverride(local_36, local_38, local_44, local_50, local_56);
                local_64.opCall(local_56);
            }
            local_2.UpdateCachedEntityCount(local_13);
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
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_124 = 0;
        FECSRuntimeViewIterator local_158 = local_102.Iterator();
        for (; local_158.CanProceed;)
        {
            local_36 = local_158.Proceed();
            ++local_124;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_UpdateProjectileVisualTransformOverride(local_196, local_38, local_44, local_50, local_56);
            local_64.opCall(local_56);
        }
        local_2.UpdateCachedEntityCount(local_124);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleProjectileHitFx() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_ProjectileHitPresentation> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_ProjectileHitPresentation& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleProjectileHitFx(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleProjectileHit() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        int local_66 = 0;
        int local_72 = 0;
        MarkModifiedIfDirty local_80;
        MarkModifiedIfDirty local_84;
        int local_228 = 0;
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
                this.Job_HandleProjectileHit(local_40, local_42, local_48, local_54, local_60, local_66, local_72, local_6);
                local_80.opCall(local_48);
                local_84.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_122 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Include local_134;
        local_134.opCall();
        Include local_138;
        local_138.opCall();
        Include local_142;
        local_142.opCall();
        Include local_146;
        local_146.opCall();
        Include local_150;
        local_150.opCall();
        Exclude(local_122).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_156 = 0;
        FECSRuntimeViewIterator local_190 = local_122.Iterator();
        for (; local_190.CanProceed;)
        {
            local_40 = local_190.Proceed();
            ++local_156;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_HandleProjectileHit(local_228, local_42, local_48, local_54, local_60, local_66, local_72, local_6);
            local_80.opCall(local_48);
            local_84.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_156);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HitTestByMoveTrail() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        int local_66 = 0;
        int local_210 = 0;
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
                this.Job_HitTestByMoveTrail(local_40, local_42, local_48, local_54, local_60, local_66, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_108 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Include local_120;
        local_120.opCall();
        Include local_124;
        local_124.opCall();
        Include local_128;
        local_128.opCall();
        Include local_132;
        local_132.opCall();
        Exclude(local_108).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_138 = 0;
        FECSRuntimeViewIterator local_172 = local_108.Iterator();
        for (; local_172.CanProceed;)
        {
            local_40 = local_172.Proceed();
            ++local_138;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_HitTestByMoveTrail(local_210, local_42, local_48, local_54, local_60, local_66, local_6);
        }
        local_4.UpdateCachedEntityCount(local_138);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateProjectileHealth() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_60;
        int local_188 = 0;
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
                this.Job_UpdateProjectileHealth(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_ProjectileHealth> local_56;
                local_56.opCall(local_42);
                local_60.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_98).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_98.Iterator();
        for (; local_150.CanProceed;)
        {
            local_40 = local_150.Proceed();
            ++local_116;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateProjectileHealth(local_188, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_ProjectileHealth>(local_40).opCall(local_42);
            local_60.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateAttachProjectileLifeTime() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        MarkModifiedIfDirty local_66;
        int local_198 = 0;
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
                this.Job_UpdateAttachProjectileLifeTime(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_48);
                local_66.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_104 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Include local_120;
        local_120.opCall();
        Exclude(local_104).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_126 = 0;
        FECSRuntimeViewIterator local_160 = local_104.Iterator();
        for (; local_160.CanProceed;)
        {
            local_40 = local_160.Proceed();
            ++local_126;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateAttachProjectileLifeTime(local_198, local_42, local_48, local_54, local_6);
            local_62.opCall(local_48);
            local_66.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_126);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateProjectileStickDestroyWithSimpleDestructibleLifeTime() const
    {
        int local_14 = 0;
        int local_16 = 0;
        const FECSEntity& local_50;
        int local_52 = 0;
        int local_58 = 0;
        MarkModifiedIfDirty local_66;
        int local_194 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_26 = local_4.GetViewCacheEntities();
            int local_27 = 0;
            for (auto& local_42 : local_26)
            {
                local_42;
                FECSEntity local_46;
                if (!(local_46.IsValid()))
                {
                    continue;
                }
                ++local_27;
                FECSEntityScopeCycleCounter local_47 = FECSEntityScopeCycleCounter(local_46);
                this.Job_UpdateProjectileStickDestroyWithSimpleDestructibleLifeTime(local_50, local_52, local_58, local_14, local_16);
                local_66.opCall(local_58);
            }
            local_4.UpdateCachedEntityCount(local_27);
            return;
        }
        FECSRuntimeView local_104 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_104).opCall();
        bool local_11 = local_4.BeginViewCacheBuild();
        int local_28 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_104.Iterator();
        for (; local_156.CanProceed;)
        {
            local_50 = local_156.Proceed();
            ++local_122;
            if (local_11)
            {
                local_4.AddViewCacheEntity(local_50.GetId());
            }
            FECSEntityScopeCycleCounter local_47_2 = FECSEntityScopeCycleCounter(local_50);
            FECSEntity::Get<FC_ProjectileStickDestroyWithSimpleDestructible> local_56 = FECSEntity::Get<FC_ProjectileStickDestroyWithSimpleDestructible>(local_50);
            this.Job_UpdateProjectileStickDestroyWithSimpleDestructibleLifeTime(local_194, local_52, local_58, local_14, local_16);
            local_66.opCall(local_58);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_11)
        {
            local_4.CommitViewCacheBuild(local_28);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_HandleProjectileHitStick() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorProjectileHitStickAttachOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_HandleProjectileHitStick(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorProjectileHitStickAttachOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_HandleProjectileHitStick(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitFXSurroundMaterialCheck() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSurroundingMaterialCheckConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InitFXSurroundMaterialCheck(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DoFXSurroundMaterialCheck() const
    {
        int local_36 = 0;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_56;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 2;
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
                this.Job_DoFXSurroundMaterialCheck(local_36, local_42, local_48);
                local_56.opCall(local_42);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_94).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            const FECSEntity& local_182 = local_146.Proceed();
            ++local_112;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_182.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_182);
            this.Job_DoFXSurroundMaterialCheck(local_36, local_42, local_48);
            local_56.opCall(local_42);
        }
        local_2.UpdateCachedEntityCount(local_112);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SpawnFXByMoveTrail() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        int local_66 = 0;
        int local_206 = 0;
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
                this.Job_SpawnFXByMoveTrail(local_40, local_42, local_48, local_54, local_60, local_66, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_108 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Include local_120;
        local_120.opCall();
        Include local_124;
        local_124.opCall();
        Include local_128;
        local_128.opCall();
        Exclude(local_108).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_134 = 0;
        FECSRuntimeViewIterator local_168 = local_108.Iterator();
        for (; local_168.CanProceed;)
        {
            local_40 = local_168.Proceed();
            ++local_134;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_SpawnFXByMoveTrail(local_206, local_42, local_48, local_54, local_60, local_66, local_6);
        }
        local_4.UpdateCachedEntityCount(local_134);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFXByMoveTrail() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_186 = 0;
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
                this.Job_UpdateFXByMoveTrail(local_36, local_38, local_44, local_50);
                local_58.opCall(local_38);
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
        Exclude(local_96).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_36 = local_148.Proceed();
            ++local_114;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdateFXByMoveTrail(local_186, local_38, local_44, local_50);
            local_58.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_114);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFXLifeTime() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        int local_56 = 0;
        int local_192 = 0;
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
                this.Job_UpdateFXLifeTime(local_36, local_38, local_44, local_50, local_56);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_120 = 0;
        FECSRuntimeViewIterator local_154 = local_98.Iterator();
        for (; local_154.CanProceed;)
        {
            local_36 = local_154.Proceed();
            ++local_120;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdateFXLifeTime(local_192, local_38, local_44, local_50, local_56);
        }
        local_2.UpdateCachedEntityCount(local_120);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnFXLifeTimeRemove() const
    {
        int local_50 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorProjectileFXLifeTimeOnInactiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnFXLifeTimeRemove(local_50);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateProjectileActorFXSurrounding() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_172 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 2;
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
                this.Job_UpdateProjectileActorFXSurrounding(local_36, local_38, local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_36 = local_134.Proceed();
            ++local_100;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdateProjectileActorFXSurrounding(local_172, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_100);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearSurroundingMaterialCheckUpdateMark() const
    {
        int local_36 = 0;
        MarkModifiedIfDirty local_44;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 2;
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
                this.Job_ClearSurroundingMaterialCheckUpdateMark(local_36);
                local_44.opCall(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Exclude(local_82).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_82.Iterator();
        for (; local_126.CanProceed;)
        {
            const FECSEntity& local_162 = local_126.Proceed();
            ++local_92;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_162.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_162);
            this.Job_ClearSurroundingMaterialCheckUpdateMark(local_36);
            local_44.opCall(local_36);
        }
        local_2.UpdateCachedEntityCount(local_92);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

