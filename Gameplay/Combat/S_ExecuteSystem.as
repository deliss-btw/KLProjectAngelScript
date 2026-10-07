

class US_ExecuteSystem : UECSScriptSystem
{
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> JointExecutionMessageHintConfig;
    UPROPERTY()
    float32 DelayRemoveEntityNoExecutingTagTime = 0.4f;
    UPROPERTY()
    float32 DelayRecoverExecuteStateFromExecutedTime = 0.1f;
    FName InterruptExecutePrepareTriggerName = n"InterruptExecuteTrigger";


    UFUNCTION()
    void Monitor_OnExecutedConfigAssigned(const FECSEntity &inout Entity, const FC_ExecutedConfig &inout ExecutedConfig) const
    {
        const FExecutionConfigDataObject& local_4;
        if (!(ExecutedConfig.ExecutionConfigData))
        {
            return;
        }
        TArray<FSoftObjectPath> local_8;
        if (!(local_4.ChaosKnotFX.IsNull()))
        {
            local_8.Add(local_4.ChaosKnotFX.ToSoftObjectPath());
        }
        if (!(local_4.ChaosKnotBreakFX.IsNull()))
        {
            local_8.Add(local_4.ChaosKnotBreakFX.ToSoftObjectPath());
        }
        if (!(local_4.BuffBallPrefab.IsNull()))
        {
            local_8.Add(local_4.BuffBallPrefab.ToSoftObjectPath());
        }
        if (local_8.Num() > 0)
        {
            FComponentAssetPoolHelper::RequestAsyncLoadAssetsForEntity(Entity, n"FC_ExecutedConfig", local_8);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnExecutedConfigRemoved(const FECSEntity &inout Entity, const FC_ExecutedConfig &inout ExecutedConfig) const
    {
        FComponentAssetPoolHelper::ReleaseEntityComponentAssets(Entity, n"FC_ExecutedConfig");
        return;
    }
    UFUNCTION()
    void Job_HandleExecutionStateChangedEvent(const FCE_ExecutionStateChangedEvent &inout Event) const
    {
        Has local_4;
        FC_ExecutedConfig local_12;
        int local_18 = 0;
        bool local_81 = false;
        if (!(local_4.opCall()))
        {
            return;
        }
        bool local_5 = !(local_12) || !(local_12.ExecutionConfigData) || !(local_18);
        if (local_5)
        {
            return;
        }
        bool local_19 = (int(local_18.GetExecutionState())) == 1 && !(local_18.GetChaosKnotFXEntity().IsValid());
        if (!(local_19))
        {
            local_19 = false;
        }
        else
        {
            local_5 = !local_5;
            local_19 = local_5;
        }
        if (local_19)
        {
            local_81 = true;
            TDataObjectPtr<FGameSocketPath> local_110 = TDataObjectPtr<FGameSocketPath>(nullptr);
            FECSEntityAdapter local_118 = FECSEntityAdapter(Event.Sender);
            FECSEntity local_122;
            local_18.SetChaosKnotFXEntity(local_122);
            return;
        }
        if ((int(local_18.GetExecutionState())) == 0 && local_18.GetChaosKnotFXEntity().IsValid())
        {
            ::BlueprintFunctions_Common::StopFX(FECSEntityAdapter(local_18.GetChaosKnotFXEntity()), false, false, 0.0f);
            local_18.SetChaosKnotFXEntity(ENTITY_NULL);
        }
        return;
    }
    UFUNCTION()
    void Job_ServerHandleStartMultiExecutionEvent(const FCE_StartMultiExecution &inout Event) const
    {
        int local_18 = 0;
        int local_30 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        FFPTime local_10 = FFPTime(this.GetECSWorld().GetFixedTime().Time);
        if (!(local_18))
        {
            this.InterruptEntityExecutePrepare(local_4, local_10);
            return;
        }
        if (int(local_18.GetExecutionState()) != 1 && (int(local_18.GetExecutionState()) != 2))
        {
            this.CheckExecutedInfoAndInterruptPrepare(local_18, local_4, local_10);
            return;
        }
        if (local_18.GetExecuteEntityArray().Contains(local_4))
        {
            local_18.SetLastAddPlayerTime(Event.Time);
            return;
        }
        if (!(local_18.CheckCanAddNotExceedConfigMax(local_4, local_30)))
        {
            this.CheckExecutedInfoAndInterruptPrepare(local_18, local_4, local_10);
            return;
        }
        bool local_23 = local_18.GetExecuteEntityArray().IsEmpty();
        FECSEntity local_40 = ::FTeamUtils::GetTeamEntityForPawn(local_4);
        int local_41 = 1;
        Get local_46;
        const FC_TeamInfo& local_48 = local_46.opCall();
        if (local_48)
        {
            local_41 = local_48.GetMembers().Num();
        }
        if (local_23)
        {
            local_18.SetExecutionState(EExecutionState(EExecutionState(2)));
            SendEvent local_52;
            local_52.opCall(this.GetECSWorld().GetFixedTime().Time);
            local_18.SetExecuteTeamEntity(local_40);
            FC_WaitPlayerReadyForExecutionTag local_58;
            Assign local_56;
            local_56.opCall(local_58);
            local_18.SetCurrentMaxPlayerNum(this.CalcExecutedMaxPlayerNum(local_18.GetExecuteTeamEntity(), local_30));
        }
        FNameHandle_EntityBBVarEntity local_62;
        local_62;
        local_18.SetbQTESuccess(false);
        local_18.GetModify_ExecuteEntityArray().AddUnique(local_4);
        local_18.SetLastAddPlayerTime(Event.Time);
        if (local_41 > 1)
        {
            FCE_DoExecutionVo local_68;
            FECSWorldPtr local_12 = this.GetECSWorld();
            local_68.Executor = local_4;
            local_68.bIsMainExecutor = local_23;
        }
        return;
    }
    void InterruptEntityExecutePrepare(const FECSEntity &inout Entity, const FFPTime &inout Time) const
    {
        FESMTriggerUtils::ActivateESMTrigger(Entity, this.InterruptExecutePrepareTriggerName, Time, FFPTime(0.2), 0);
        return;
    }
    void CheckExecutedInfoAndInterruptPrepare(const FC_ExecutedInfo &inout ExecutedInfo, const FECSEntity &inout Entity, const FFPTime &inout Time) const
    {
        if (!(ExecutedInfo.GetExecuteEntityArray().Contains(Entity)))
        {
            this.InterruptEntityExecutePrepare(Entity, Time);
        }
        return;
    }
    int CalcExecutedMaxPlayerNum(const FECSEntity &inout TeamEntity, const FC_ExecutedConfig &inout ExecutedConfig) const
    {
        int local_1 = 1;
        Get local_6;
        const FC_TeamInfo& local_8 = local_6.opCall();
        if (local_8)
        {
            local_1 = local_8.GetMembers().Num();
        }
        return FMath::Min(local_1, ExecutedConfig.GetMaxExecutedNum());
    }
    UFUNCTION()
    void Job_HandleMonsterDeathClearEffect(const FCE_DeathEvent &inout Event) const
    {
        Has local_4;
        int local_12 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        if (local_12.GetChaosKnotFXEntity().IsValid())
        {
            ::BlueprintFunctions_Common::StopFX(FECSEntityAdapter(local_12.GetChaosKnotFXEntity()), false, false, 0.0f);
            local_12.SetChaosKnotFXEntity(ENTITY_NULL);
        }
        return;
    }
    UFUNCTION()
    void Job_HandleMonsterDeathInWaitingExecution(const FECSEntity &inout Entity, FC_ExecutedInfo &inout ExecutedInfo, const FC_ExecutedConfig &inout ExecutedConfig) const
    {
        const TArray<FECSEntity>& local_2 = ExecutedInfo.GetExecuteEntityArray();
        if (ExecutedConfig.ExecutionConfigData)
        {
            for (auto& local_20 : local_2)
            {
                FName local_5;
                FESMTriggerUtils::ActivateESMTrigger(local_20, local_5, this.GetECSWorld().GetFixedTime().Time, FFPTime(0), 0);
            }
        }
        ExecutedInfo.GetModify_ExecuteEntityArray().Reset(0);
        ExecutedInfo.SetExecutionState(EExecutionState(0));
        Remove local_32;
        local_32.opCall();
        SendEvent local_36;
        local_36.opCall(this.GetECSWorld().GetFixedTime().Time);
        return;
    }
    UFUNCTION()
    void Job_WaitAllPlayerReadyForExecution(const FECSEntity &inout Entity, FC_ExecutedInfo &inout ExecutedInfo, const FC_ExecutedConfig &inout ExecutedConfig, const FCS_FixedTime &inout FixedTime) const
    {
        Remove local_56;
        SendEvent local_60;
        if (int(ExecutedInfo.GetExecutionState()) != 2)
        {
            return;
        }
        int local_5 = 0;
        bool local_6 = true;
        bool local_4 = (FFPTime(FixedTime.Time).opCmp((FFPTime(ExecutedInfo.GetLastAddPlayerTime()) + FFPTime(this.DelayRemoveEntityNoExecutingTagTime))) > 0);
        TArray<FECSEntity> local_24;
        for (auto local_38 : ExecutedInfo.GetExecuteEntityArray())
        {
            if (!(local_38.IsValid()))
            {
                local_24.Add(local_38);
                continue;
            }
            if (local_38.MatchGameplayTag(GameplayTags::ESM_CombatFlag_ExecutionReady))
            {
                ++local_5;
                continue;
            }
            if (local_4 && !(local_38.MatchGameplayTag(GameplayTags::ESM_CombatFlag_Executing)))
            {
                local_24.Add(local_38);
                continue;
            }
            local_6 = false;
        }
        for (auto local_38 : local_24)
        {
            FESMTriggerUtils::ActivateESMTrigger(local_38, this.InterruptExecutePrepareTriggerName, FixedTime.Time, FFPTime(0.01), 0);
        }
        if (ExecutedInfo.GetExecuteEntityArray().IsEmpty())
        {
            ExecutedInfo.SetExecutionState(EExecutionState(EExecutionState(1)));
            ExecutedInfo.SetExecuteTeamEntity(ENTITY_NULL);
            local_56.opCall();
            local_60.opCall(FixedTime.Time);
            return;
        }
        ExecutedInfo.SetCurrentMaxPlayerNum(this.CalcExecutedMaxPlayerNum(ExecutedInfo.GetExecuteTeamEntity(), ExecutedConfig));
        bool local_39 = false;
        if (local_39)
        {
            local_39 = true;
        }
        else
        {
            bool local_7;
            local_7 = local_5 >= ExecutedInfo.GetCurrentMaxPlayerNum() && local_6;
            local_39 = local_7;
        }
        bool local_61 = local_39;
        Get local_66;
        const FC_WaitHitBreakRecover& local_68 = local_66.opCall();
        if (local_68)
        {
            bool local_7;
            local_61 = local_61 || (local_6 && (FFPTime(FixedTime.Time).opCmp(local_68.GetRecoverTime()) >= 0));
        }
        else
        {
            local_61 = local_61 || local_6;
        }
        if (!(local_61))
        {
            return;
        }
        FECSEntity local_72 = FECSEntity(ExecutedInfo.GetExecuteEntityArray()[0]);
        ExecutedInfo.SetExecutionState(EExecutionState(EExecutionState(3)));
        ExecutedInfo.SetCanRecoverFromExecutedTime((FFPTime(FixedTime.Time) + FFPTime(this.DelayRecoverExecuteStateFromExecutedTime)));
        local_60.opCall(FixedTime.Time);
        local_56.opCall();
        FESMExternalTransitHandle local_80 = Entity.ESMExternalTransitMainSM(n"HitBreak_Executed", NAME_None);
        FNameHandle_EntityBBVarEntity local_84;
        local_84;
        for (auto local_38 : ExecutedInfo.GetExecuteEntityArray())
        {
            FECSEntity local_88 = FECSEntity(ENTITY_NULL);
            Get local_92;
            const FC_LockTarget& local_94 = local_92.opCall();
            if (local_94)
            {
                local_88 = local_94.GetTargetEntity();
            }
            else
            {
                local_88 = ENTITY_NULL;
            }
            FESMExternalTransitHandle local_80_2 = local_38.ESMExternalTransitMainSM(ExecutedConfig.GetExecuterAnimKey(), NAME_None);
            ::FLockTargetUtils::DisposeChangeLockTarget(local_38, Entity, local_88, -1, true, EPreChangeTargetReason(3), ELockTargetType(2));
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnExecutedConfigAssigned() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorExecutedConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnExecutedConfigAssigned(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnExecutedConfigRemoved() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorExecutedConfigOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnExecutedConfigRemoved(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleExecutionStateChangedEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ExecutionStateChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ExecutionStateChangedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleExecutionStateChangedEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ServerHandleStartMultiExecutionEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_StartMultiExecution> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_StartMultiExecution& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_ServerHandleStartMultiExecutionEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleMonsterDeathClearEffect() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleMonsterDeathClearEffect(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleMonsterDeathInWaitingExecution() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_188 = 0;
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
                this.Job_HandleMonsterDeathInWaitingExecution(local_36, local_38, local_44);
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
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_90).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_90.Iterator();
        for (; local_150.CanProceed;)
        {
            local_36 = local_150.Proceed();
            ++local_116;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_HandleMonsterDeathInWaitingExecution(local_188, local_38, local_44);
            local_52.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_116);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_WaitAllPlayerReadyForExecution() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
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
                this.Job_WaitAllPlayerReadyForExecution(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_ExecutedInfo> local_56;
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
        Include local_110;
        local_110.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_94.Iterator();
        for (; local_150.CanProceed;)
        {
            local_40 = local_150.Proceed();
            ++local_116;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_WaitAllPlayerReadyForExecution(local_188, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_ExecutedInfo>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

