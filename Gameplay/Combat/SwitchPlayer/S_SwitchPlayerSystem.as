

class US_SwitchPlayerSystem : UECSScriptSystem
{
    UPROPERTY()
    TObjectPtr<UESMInputTriggerAsset> SwitchPlayerInput = nullptr;
    UPROPERTY()
    TObjectPtr<UESMInputTriggerAsset> SwitchPlayerNormalInput = nullptr;
    UPROPERTY()
    EESMBlackboardConditionTagQueryType CheckTagCondition = EESMBlackboardConditionTagQueryType(2);
    UPROPERTY()
    FGameplayTagContainer TagToCheck;
    UPROPERTY()
    float32 SkillReleaseDistance = 800.0f;
    UPROPERTY()
    FName InactiveStateName = n"Inactive";
    UPROPERTY()
    UAkAudioEvent SwithOffVOEvent;


    bool CanSwitch() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        if ((int(0.GetGameModeType())) != 0)
        {
            return false;
        }
        if (::FLevelUtils::GetCurrentLevelInfoConfig(nullptr).IsSet() && GetGameRuleConfig().IsSet() && (0 < 2))
        {
            return false;
        }
        return true;
    }
    UFUNCTION()
    void Job_HandleSwitchPlayerInput(const FECSEntity &inout Entity, FC_ControlledByPlayer &inout PlayerComp, const FC_Input &inout Input, const FCS_FixedTime &inout FixedTime, FC_ESMTrigger &inout ESMTrigger) const
    {
        UESMInputTriggerAsset local_12;
        UESMInputTriggerAsset local_14;
        if ((!((this.SwitchPlayerInput == nullptr))))
        {
            local_14 = this.SwitchPlayerInput;
            UESMInputTriggerAsset::TickCommonTriggers(local_14, local_12.OutputTrigger, Input.State, FixedTime.LastTime, FixedTime.Time, ESMTrigger.Storage);
        }
        if ((!((this.SwitchPlayerNormalInput == nullptr))))
        {
            local_14 = this.SwitchPlayerNormalInput;
            UESMInputTriggerAsset::TickCommonTriggers(local_14, local_12.OutputTrigger, Input.State, FixedTime.LastTime, FixedTime.Time, ESMTrigger.Storage);
        }
        if ((!((this.SwitchPlayerInput == nullptr))))
        {
            SendEvent local_32;
            FESMSimpleTrigger local_20 = ESMTrigger.Storage.GetTriggerByName(local_12.OutputTrigger);
            FFPTime local_22 = local_20.IsTriggered(FixedTime.LastTime, FixedTime.Time);
            if (local_22.opCmp(0.0) > 0 && ((FFPTime(local_20.TriggerTime).opCmp(FixedTime.LastTime) >= 0)))
            {
                if (this.SwitchPlayerConditions(Entity, FixedTime.Time))
                {
                    if (this.SwitchPlayerActionConditions(Entity, false))
                    {
                        this.SwitchPlayerAction(Entity, local_20.TriggerTime);
                    }
                    else
                    {
                        FECSWorldPtr local_28 = this.GetECSWorld();
                        local_32.opCall(Entity, local_20.TriggerTime);
                    }
                }
            }
        }
        if ((!((this.SwitchPlayerNormalInput == nullptr))))
        {
            SendEvent local_32;
            FESMSimpleTrigger local_20_2 = ESMTrigger.Storage.GetTriggerByName(local_14.OutputTrigger);
            FFPTime local_22_2 = local_20_2.IsTriggered(FixedTime.LastTime, FixedTime.Time);
            if (local_22_2.opCmp(0.0) > 0 && ((FFPTime(local_20_2.TriggerTime).opCmp(FixedTime.LastTime) >= 0)))
            {
                if (this.SwitchPlayerConditions(Entity, FixedTime.Time))
                {
                    if (this.SwitchPlayerActionConditions(Entity, true))
                    {
                        this.SwitchPlayerAction(Entity, local_20_2.TriggerTime);
                    }
                    else
                    {
                        FECSWorldPtr local_28_2 = this.GetECSWorld();
                        local_32.opCall(Entity, local_20_2.TriggerTime);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TickPowerSwitchEnergy(const FECSEntity &inout PlayerEntity, FC_SwitchPlayerInfo &inout SwitchPlayerInfo, const FCS_FixedTime &inout FixedTime) const
    {
        ::FSwitchPlayerUtils::GetSwitchPlayerNextEntity(::FASCommonUtils::GetControlledPawnEntity(PlayerEntity));
        return;
    }
    bool SwitchPlayerConditions(const FECSEntity &inout Entity, const FFPTime &inout Time) const
    {
        return (int((this.GetSwitchPlayerConditionsReason(Entity, Time))) == 0);
    }
    ESwitchPlayerBlockReason GetSwitchPlayerConditionsReason(const FECSEntity &inout Entity, const FFPTime &inout Time) const
    {
        int local_6 = 0;
        int local_8;
        int local_22 = 0;
        if (!(local_6))
        {
            return ESwitchPlayerBlockReason(4);
        }
        if (!(FECSEntity(local_6.GetOwnerEntity()).IsValid()))
        {
            return ESwitchPlayerBlockReason(5);
        }
        if (local_22 && (local_22.GetSwitchPlayerCD().Evaluate(Time) > 0.0f))
        {
            return ESwitchPlayerBlockReason(6);
        }
        Has local_30;
        bool local_25 = local_30.opCall();
        if (local_25)
        {
            return ESwitchPlayerBlockReason(7);
        }
        if ((int(this.CheckTagCondition) == 0 && Entity.MatchAnyGameplayTags(this.TagToCheck)) || (int(this.CheckTagCondition) == 2 && !(Entity.MatchAnyGameplayTags(this.TagToCheck))))
        {
            local_8 = 0;
        }
        else
        {
            local_8 = 8;
        }
        return ESwitchPlayerBlockReason(local_8);
    }
    bool SwitchPlayerActionConditions(const FECSEntity &inout Entity, const bool bForceNormalSwitch = false) const
    {
        bool local_1;
        FC_SwitchPlayerAvatarConfig local_16;
        int local_22 = 0;
        float32 local_36;
        int local_96 = 0;
        local_1 = false;
        FECSEntity local_10 = ::FSwitchPlayerUtils::GetSwitchPlayerNextEntity(Entity);
        FECSEntity local_6 = local_22.GetPlayerEntity();
        FECSEntity local_6_2 = local_22.GetPlayerEntity();
        bool local_35 = false;
        if (local_16)
        {
            bool local_2 = !(local_35);
            if (local_2 == !(false))
            {
                local_36 = local_16.SkillReleaseDistance;
            }
            else
            {
                local_36 = local_16.SkillPowerReleaseDistance;
            }
            local_2 = !(false);
            Has local_42;
            if (!(local_42.opCall()) == local_2)
            {
                if (!(::FASCommonUtils::IsInCombat(Entity)) == !(false))
                {
                    local_36 = local_16.SkillDistanceNoCombat;
                }
            }
            XLog(ELog(7), "Pick Soft LockTarget");
            FLockTargetOverrideInfo local_90 = ::FLockTargetUtils::GetInitOverrideInfo(Entity, this.GetECSWorld().GetFixedTime().Time);
            if (local_36 > 0.0f)
            {
                local_2 = true;
                local_90.bOverrideMaxLockDistance = local_2;
                local_90.MaxMaxLockDistance = local_36;
            }
            ::FLockTargetUtils::PickSoftLockTarget(Entity, this.GetECSWorld().GetFixedTime().Time, local_16.LockTargetConfig.Data, local_90, false);
            if (local_96)
            {
                Get local_100;
                Get local_104;
                local_1 = ((FVector(local_100.opCall().GetPosition()) - local_104.opCall().GetPosition()).Size() <= local_36);
            }
        }
        if (local_10.IsValid() && Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_Attack))
        {
            local_1 = true;
        }
        return local_1;
    }
    void SwitchPlayerNormal(const FECSEntity &inout PrevEntity, const FFPTime &inout StateTransitWorldTime) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            return;
        }
        FECSEntity local_14 = ::FSwitchPlayerUtils::SwitchToNextCharacter(PrevEntity, StateTransitWorldTime);
        if (!(local_14.IsValid()))
        {
            return;
        }
        ::FSwitchPlayerUtils::SwitchOutPlayer(PrevEntity);
        ::FSwitchPlayerUtils::CopyStatesForInplaceSwitch(PrevEntity, local_14, StateTransitWorldTime);
        if (!(::FASCommonUtils::GetUniquePlayerEntity(PrevEntity).IsValid()))
        {
            return;
        }
        Get local_22;
        const FC_SwitchPlayerConfig& local_24 = local_22.opCall();
        if (local_24)
        {
            ::FSwitchPlayerUtils::StartSwitchPlayerCD(local_14, ECS::GetContextTime(), local_24.SwitchPlayerNormalCD);
        }
        return;
    }
    void SwitchPlayerAction(const FECSEntity &inout PrevEntity, const FFPTime &inout TriggerTime) const
    {
        FESMTriggerUtils::ActivateESMTrigger(PrevEntity, n"SwitchPlayerActionTrigger", TriggerTime, FFPTime(3.0), 0);
        return;
    }
    UFUNCTION()
    void Job_TickNormalSwitchPlayerEvent(const FCE_SwitchPlayer &inout Event) const
    {
        this.SwitchPlayerNormal(Event.Sender, Event.Time);
        return;
    }
    UFUNCTION()
    void Job_DeferredApplySwitchSyncValues(const FECSEntity &inout Entity, const FC_PendingGameAttributeSwitchSync &inout PendingSwitchSync) const
    {
        FGameAttributeUtils::ApplySwitchSyncValues(Entity, PendingSwitchSync.GetSyncTime());
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_HandlePrevPlayerInactive(const FECSEntity &inout PrevEntity) const
    {
        Remove local_4;
        local_4.opCall();
        FESMTriggerUtils::ClearESMTrigger(PrevEntity, n"SwitchPlayerActionTrigger");
        ::FSwitchPlayerUtils::SetCharacterEntityActive(PrevEntity, false);
        return;
    }
    UFUNCTION()
    void Job_HandleNextPlayerActive(const FECSEntity &inout NextEntity) const
    {
        Remove local_4;
        local_4.opCall();
        ::FSwitchPlayerUtils::SetCharacterEntityActive(NextEntity, true);
        return;
    }
    UFUNCTION()
    void Job_TickInactiveAvatarMovement(const FECSEntity &inout Entity, const FC_PlayerController &inout C_PlayerController) const
    {
        int local_12 = 0;
        FECSEntity local_4 = C_PlayerController.GetPlayerPawnEntity();
        if (local_4.IsValid())
        {
            for (auto& local_26 : C_PlayerController.GetAllPlayerPawnEntities())
            {
                if ((!((local_26 == local_4))))
                {
                    local_26.MoveTo(local_12.GetPosition(), local_12.GetRotation(), FFPTime(-1));
                }
            }
            Get local_34;
            const FC_ControllerEquipMount& local_36 = local_34.opCall();
            if (local_36)
            {
                if (local_36.GetMountEntity().IsValid() && !(local_36.GetMountEntity().IsActive()))
                {
                    local_36.GetMountEntity().MoveTo(local_12.GetPosition(), local_12.GetRotation(), FFPTime(-1));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_SwitchOffPlayerAudio(const FCE_PlayerSwitchSuccess &inout Event) const
    {
        FGameAudioUtils::PlayEventOnEmitter(TSoftObjectPtr<UAkAudioEvent>(this.SwithOffVOEvent), Event.SwitchOutPawn, FLoadEventCallback(), EGameAudioEmitterPartType(0), true, false, false, FGameAudioUtils::GetCachedAudioWorld(), true);
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackerPlayerSwitchSuccess(const FCE_PlayerSwitchSuccess &inout Event) const
    {
        int local_2 = 0;
        int local_1 = 0;
        if (Event.SwitchOutPawn.IsValid())
        {
            if (::GetAvatarConfig(Event.SwitchOutPawn))
            {
                local_1 = local_2;
            }
        }
        int local_53 = 0;
        if (Event.SwitchInPawn.IsValid())
        {
            if (::GetAvatarConfig(Event.SwitchInPawn))
            {
                local_53 = local_2;
            }
        }
        FPbPlayerLogDsAvatarSwitch local_64;
        FPbPlayerLogDsCombatCommon local_74 = FPbPlayerLogDsCombatCommon(local_64.GetCommon());
        ::FCombatStateUtils::GetDataTrackPbCombatCommonData(Event.Sender, local_74);
        local_64.SetAvatarFrom(local_1);
        local_64.SetAvatarTo(local_53);
        ::ServerDataTrackerHelper::LogProtoMessage3WithPawn(Event.Sender, 102511, local_64.ToWrapper());
        return;
    }
    UFUNCTION()
    void Run_Job_HandleSwitchPlayerInput() const
    {
        int local_8 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        MarkModifiedIfDirty local_66;
        int local_198 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(this.CanSwitch()) == !(false))
        {
            return;
        }
        int local_10 = 0;
        int local_9 = local_10;
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
                this.Job_HandleSwitchPlayerInput(local_40, local_42, local_48, local_8, local_54);
                local_62.opCall(local_42);
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
        bool local_5 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_126 = 0;
        FECSRuntimeViewIterator local_160 = local_104.Iterator();
        for (; local_160.CanProceed;)
        {
            local_40 = local_160.Proceed();
            ++local_126;
            if (local_5)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_HandleSwitchPlayerInput(local_198, local_42, local_48, local_8, local_54);
            local_62.opCall(local_42);
            local_66.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_126);
        if (local_5)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickPowerSwitchEnergy() const
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
                this.Job_TickPowerSwitchEnergy(local_40, local_42, local_6);
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
            this.Job_TickPowerSwitchEnergy(local_174, local_42, local_6);
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
    void Run_Job_TickNormalSwitchPlayerEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SwitchPlayer> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SwitchPlayer& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_TickNormalSwitchPlayerEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DeferredApplySwitchSyncValues() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
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
                this.Job_DeferredApplySwitchSyncValues(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        local_84.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_DeferredApplySwitchSyncValues(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandlePrevPlayerInactive() const
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
                this.Job_HandlePrevPlayerInactive(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Include local_82;
        local_82.opCall();
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
            this.Job_HandlePrevPlayerInactive(local_160);
        }
        local_2.UpdateCachedEntityCount(local_88);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleNextPlayerActive() const
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
                this.Job_HandleNextPlayerActive(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Include local_82;
        local_82.opCall();
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
            this.Job_HandleNextPlayerActive(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickInactiveAvatarMovement() const
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
                this.Job_TickInactiveAvatarMovement(local_36, local_38);
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
            this.Job_TickInactiveAvatarMovement(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_SwitchOffPlayerAudio() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerSwitchSuccess> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerSwitchSuccess& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_SwitchOffPlayerAudio(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackerPlayerSwitchSuccess() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerSwitchSuccess> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerSwitchSuccess& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DataTrackerPlayerSwitchSuccess(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

