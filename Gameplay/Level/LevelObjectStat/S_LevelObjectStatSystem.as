

class US_LevelObjectStatSystem : UECSScriptSystem
{
    US_LevelObjectStatSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_InitLevelObjectStatIdToEntityMap() const
    {
        FCS_LevelObjectStatIdToEntityMap local_26;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Assign local_6;
        local_6.opCall(local_26);
        return;
    }
    UFUNCTION()
    void Monitor_RegisterLevelObjectStatObject(const FECSEntity &inout Entity, const FC_LevelObjectStatConfig &inout LevelObjectStatConfig) const
    {
        int local_11 = 0;
        if (!(LevelObjectStatConfig.LevelObjectStatConfig.IsSet()))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        Modify local_8;
        FCS_LevelObjectStatIdToEntityMap& local_10 = local_8.opCall();
        if (local_10)
        {
            local_10.LevelObjectStatIdToEntityMap.Add(local_11, Entity.GetId());
        }
        return;
    }
    UFUNCTION()
    void Monitor_UnregisterLevelObjectStatObject(const FECSEntity &inout Entity, const FC_LevelObjectStatConfig &inout LevelObjectStatConfig) const
    {
        int local_11 = 0;
        if (!(LevelObjectStatConfig.LevelObjectStatConfig.IsSet()))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        Modify local_8;
        FCS_LevelObjectStatIdToEntityMap& local_10 = local_8.opCall();
        if (local_10)
        {
            if (local_10.LevelObjectStatIdToEntityMap.Contains(local_11))
            {
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickESMExternalTransitOnLocalReg(const FECSEntity &inout Entity, const FC_ESMExternalTransitOnLocalReg &inout ESMExternalTransitOnLocalReg) const
    {
        FName local_6 = FName(FString().Append("Init ESM Transit to SMName[").Append(ESMExternalTransitOnLocalReg.SMName).Append("] StateName[").Append(ESMExternalTransitOnLocalReg.StateName).Append("]"));
        FESMExternalTransitHandle local_14 = Entity.ESMExternalTransit(ESMExternalTransitOnLocalReg.SMName, ESMExternalTransitOnLocalReg.StateName, local_6);
        Remove local_18;
        local_18.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_TickESMTriggerOnLocalReg(const FECSEntity &inout Entity, const FC_ActivateESMTriggerOnLocalReg &inout ActivateESMTriggerOnLocalReg) const
    {
        for (auto& local_16 : ActivateESMTriggerOnLocalReg.TriggerDatas)
        {
            ::FESMUtils::ActivateESMTrigger(Entity, local_16.TriggerName, local_16.ValidTime);
        }
        Remove local_22;
        local_22.opCall();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitLevelObjectStatIdToEntityMap() const
    {
        ECS::GetContextJob();
        this.ClientJob_InitLevelObjectStatIdToEntityMap();
        return;
    }
    UFUNCTION()
    void Run_Monitor_RegisterLevelObjectStatObject() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLevelObjectStatConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_RegisterLevelObjectStatObject(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UnregisterLevelObjectStatObject() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLevelObjectStatConfigOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UnregisterLevelObjectStatObject(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickESMExternalTransitOnLocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_164 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.ClientJob_TickESMExternalTransitOnLocalReg(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Exclude(local_82).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_82.Iterator();
        for (; local_126.CanProceed;)
        {
            local_38 = local_126.Proceed();
            ++local_92;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.ClientJob_TickESMExternalTransitOnLocalReg(local_164, local_40);
        }
        local_4.UpdateCachedEntityCount(local_92);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickESMTriggerOnLocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_164 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.ClientJob_TickESMTriggerOnLocalReg(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Exclude(local_82).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_82.Iterator();
        for (; local_126.CanProceed;)
        {
            local_38 = local_126.Proceed();
            ++local_92;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.ClientJob_TickESMTriggerOnLocalReg(local_164, local_40);
        }
        local_4.UpdateCachedEntityCount(local_92);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
}

