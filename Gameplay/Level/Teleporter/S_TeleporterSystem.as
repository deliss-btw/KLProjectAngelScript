

class US_TeleporterSystem : UECSScriptSystem
{
    US_TeleporterSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_AccountExclusiveTeleporterActive(const FECSEntity &inout Entity, const FC_AccountExclusiveTeleporterConfig &inout TeleporterConfig) const
    {
        if (Entity.IsActive())
        {
            FECSWorldPtr local_4 = this.GetECSWorld();
            ModifyOrAdd local_8;
            local_8.opCall().GetModify_Teleporters().Add(Entity, TeleporterConfig.TeleporterConfig);
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        Modify local_12;
        if (local_12.opCall())
        {
        }
        return;
    }
    UFUNCTION()
    void Monitor_AccountExclusiveTeleporterRemove(const FECSEntity &inout Entity, const FC_AccountExclusiveTeleporterConfig &inout TeleporterConfig) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Modify local_6;
        if (local_6.opCall())
        {
        }
        return;
    }
    UFUNCTION()
    void Monitor_ClientAssignLevelObjectStatNeedInitTag(const FECSEntity &inout Entity, const FC_AccountExclusiveTeleporterConfig &inout TeleporterConfig) const
    {
        FC_LevelObjectStatNeedInitTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        return;
    }
    UFUNCTION()
    void ClientJob_InitAccountExclusiveTeleporterState(const FECSEntity &inout Entity, const FC_AccountExclusiveTeleporterConfig &inout TeleporterConfig) const
    {
        int local_26 = 0;
        ModifyOrAdd local_32;
        Remove local_4;
        local_4.opCall();
        if (!(TeleporterConfig.TeleporterConfig.IsSet()))
        {
            return;
        }
        FECSEntity local_14 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (!(local_14.IsValid()))
        {
            return;
        }
        Get local_18;
        const FC_DefaultToLocal& local_20 = local_18.opCall();
        if (local_20)
        {
            if (FECSEntity(local_20.LocalEntityId).IsValid())
            {
                bool local_5 = ::TeleporterUtils::IsTeleporterUnlocked(local_14, local_26, Entity);
                bool local_25 = ::TeleporterUtils::IsTeleporterActive(local_14, local_26, Entity);
                if (local_5)
                {
                    FC_ESMExternalTransitOnLocalReg& local_34 = local_32.opCall();
                    if (local_34)
                    {
                        local_34.SMName = TeleporterConfig.StateConfig.Unlocked.StateMachineName;
                        local_34.StateName = TeleporterConfig.StateConfig.Unlocked.StateName;
                    }
                }
                else
                {
                    if (local_25)
                    {
                        FC_ESMExternalTransitOnLocalReg& local_34_2 = local_32.opCall();
                        if (local_34_2)
                        {
                            local_34_2.SMName = TeleporterConfig.StateConfig.Active.StateMachineName;
                            local_34_2.StateName = TeleporterConfig.StateConfig.Active.StateName;
                        }
                    }
                    else
                    {
                        FC_ESMExternalTransitOnLocalReg& local_34_3 = local_32.opCall();
                        if (local_34_3)
                        {
                            local_34_3.SMName = TeleporterConfig.StateConfig.Unlocked.StateMachineName;
                            local_34_3.StateName = TeleporterConfig.StateConfig.Unlocked.StateName;
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleTeleporterStateChanged(const FCE_TeleporterStateChanged &inout Event) const
    {
        int local_8 = 0;
        int local_14 = 0;
        if (!(Event.TeleporterEntity.IsValid()))
        {
            return;
        }
        if (!(local_8))
        {
            return;
        }
        if (!(local_14))
        {
            return;
        }
        if (!(FECSEntity(local_14.LocalEntityId).IsValid()))
        {
            return;
        }
        if ((int(Event.OldState) != 2 && (int(Event.NewState) == 2)))
        {
            ModifyOrAdd local_30;
            FC_ESMExternalTransitOnLocalReg& local_32 = local_30.opCall();
            if (local_32)
            {
                local_32.SMName = local_8.StateConfig.Activating.StateMachineName;
                local_32.StateName = local_8.StateConfig.Activating.StateName;
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_AccountExclusiveTeleporterActive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAccountExclusiveTeleporterConfigOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_AccountExclusiveTeleporterActive(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorAccountExclusiveTeleporterConfigOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_AccountExclusiveTeleporterActive(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_AccountExclusiveTeleporterRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAccountExclusiveTeleporterConfigOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_AccountExclusiveTeleporterRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientAssignLevelObjectStatNeedInitTag() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAccountExclusiveTeleporterConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientAssignLevelObjectStatNeedInitTag(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitAccountExclusiveTeleporterState() const
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
                this.ClientJob_InitAccountExclusiveTeleporterState(local_36, local_38);
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
            this.ClientJob_InitAccountExclusiveTeleporterState(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleTeleporterStateChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TeleporterStateChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TeleporterStateChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleTeleporterStateChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

