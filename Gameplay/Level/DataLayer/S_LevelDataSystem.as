

class US_LevelDataSystem : UECSScriptSystem
{
    US_LevelDataSystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return !(UGameplayConfigsManager::UseJsonConfig());
    }
    bool IsLevelGroupActive(const FCS_LevelDataManager &inout Manager, const FConfigGUID &inout GroupGUID) const
    {
        FECSEntityId local_1 = FECSEntityId(ENTITY_ID_NULL);
        if (Manager.ExitedLevelGroupInstance.Find(GroupGUID, local_1))
        {
            FECSEntity local_6 = FECSEntity(local_1);
            Get local_14;
            const FC_LevelGroupComponent& local_16 = local_14.opCall();
            if (local_16)
            {
                return (int(local_16.State) == 2);
            }
        }
        return false;
    }
    bool UpdateLevelGroupStateByDataLayers(FCS_LevelDataManager &inout Manager, const FCS_LevelActiveDataLayers &inout LevelActiveDataLayers) const
    {
        bool local_1 = true;
        const TArray<FConfigGUID>& local_4 = LevelConfig::GetAllLevelGroupConfigs(Manager.LevelName);
        for (auto& local_18 : local_4)
        {
            const FLevelGroupConfig& local_20 = LevelConfig::FindLevelGroupConfig(local_18);
            if (local_20.bIsDefaultGroup || LevelActiveDataLayers.GetEffectiveActiveDataLayers().Contains(local_20.GroupName))
            {
                if (!(this.IsLevelGroupActive(Manager, local_18)))
                {
                    if (!(local_20.bIsDefaultGroup) && ECS::GetRuntimeInfo().IsServer && !(KLDataLayer::IsDataLayerActivated(__GetWorldContext(), local_20.GroupName)))
                    {
                        local_1 = false;
                        continue;
                    }
                    XLog(ELog(22), FString().Append("SetGroupState: Activate ").Append(local_20.GroupName));
                    Manager.SetGroupState(ECS::GetECSWorld(), local_18, ELevelGroupState(2));
                }
                continue;
            }
            if (this.IsLevelGroupActive(Manager, local_18))
            {
                XLog(ELog(22), FString().Append("SetGroupState: Unload ").Append(local_20.GroupName));
                Manager.SetGroupState(ECS::GetECSWorld(), local_18, ELevelGroupState(0));
            }
        }
        return local_1;
    }
    void SetLevelUnitActive(const FECSEntity &inout Entity, const FC_LevelUnitComponent &inout Component, const bool bActive) const
    {
        const FLevelUnitConfig& local_2 = Component.GetLevelUnitConfig();
        FLevelUnitExecuteContext local_6;
        local_6.UnitInstanceEntity = Entity;
        if (bActive)
        {
            local_2.Activate(local_6);
        }
        else
        {
            local_2.Deactivate(local_6);
        }
        return;
    }
    void OnLevelUnitActivate(const FECSEntity &inout Entity, const FC_LevelUnitComponent &inout Component) const
    {
        int local_24 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_LevelDataManager& local_8 = local_6.opCall();
        if (local_8)
        {
            Entity.GetId();
            FConfigGUID local_10;
            local_8.RegisterUnitEntity(local_10, Component.TargetUnitConfig);
        }
        this.SetLevelUnitActive(Entity, Component, true);
        FECSEntity local_14 = FECSEntity(Component.ChildEntity);
        if (local_14)
        {
            FECSWorldPtr local_2_2 = ECS::GetECSWorld();
            FName local_32 = FName(Component.GetLevelUnitConfig().ActorPath.ToString());
            if (local_24.PathToEntity.Contains(local_32))
            {
                XWarning(ELog(22), FString().Append("there exited same path entity on Level unit activate"));
                local_24.PathToEntity[local_32] = local_14;
            }
            else
            {
                local_24.PathToEntity.Add(local_32, local_14);
            }
        }
        return;
    }
    void OnLevelUnitDeactivate(const FECSEntity &inout Entity, const FC_LevelUnitComponent &inout Component) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_LevelDataManager& local_8 = local_6.opCall();
        if (local_8)
        {
            Entity.GetId();
            FConfigGUID local_10;
            local_8.UnregisterUnitEntity(local_10, Component.TargetUnitConfig);
        }
        if (FECSEntity(Component.ChildEntity))
        {
            FECSWorldPtr local_2_2 = ECS::GetECSWorld();
            Modify local_22;
            FCS_InLevelPathToEntity& local_24 = local_22.opCall();
            if (local_24)
            {
                FName local_32 = FName(Component.GetLevelUnitConfig().ActorPath.ToString());
                if (local_24.PathToEntity.Contains(local_32) && (FECSEntity(local_24.PathToEntity[local_32]) == Component.ChildEntity))
                {
                }
            }
        }
        this.SetLevelUnitActive(Entity, Component, false);
        return;
    }
    UFUNCTION()
    void Job_LevelDataManager() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        0.LevelName = FName(WorldUtils::GetWorldPathName(this.GetWorld(), true));
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateLevelGroups(const FCS_GameStates &inout GameStates, const FCS_LevelActiveDataLayers &inout LevelActiveDataLayers, FCS_LevelDataManager &inout LevelDataManager) const
    {
        if ((int(GameStates.GetStageType())) < 2)
        {
            return;
        }
        if (this.UpdateLevelGroupStateByDataLayers(LevelDataManager, LevelActiveDataLayers))
        {
            FECSWorldPtr local_6 = this.GetECSWorld();
            Remove local_10;
            local_10.opCall();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_ProcessPendingLoadUnits(FCS_LevelDataManager &inout LevelDataManager) const
    {
        if (LevelDataManager.PendingLoadUnits.Num() > 0)
        {
            LevelDataManager.ProcessPendingLoadUnits(ECS::GetECSWorld());
        }
        return;
    }
    UFUNCTION()
    void ServerJob_CleanUpLevelUnit(const FECSEntity &inout Entity, const FC_LevelUnitComponent &inout Component) const
    {
        this.OnLevelUnitDeactivate(Entity, Component);
        return;
    }
    UFUNCTION()
    void Monitor_ServerLevelUnitAssign(const FECSEntity &inout Entity, const FC_LevelUnitComponent &inout Component) const
    {
        this.OnLevelUnitActivate(Entity, Component);
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateLevelGroups(const FCS_LevelActiveDataLayers &inout LevelActiveDataLayers, FCS_LevelDataManager &inout LevelDataManager) const
    {
        if (this.UpdateLevelGroupStateByDataLayers(LevelDataManager, LevelActiveDataLayers))
        {
            FECSWorldPtr local_4 = this.GetECSWorld();
            Remove local_8;
            local_8.opCall();
        }
        return;
    }
    UFUNCTION()
    void Monitor_ClientLevelUnitAssign(const FECSEntity &inout Entity, const FC_LevelUnitComponent &inout Component) const
    {
        this.OnLevelUnitActivate(Entity, Component);
        return;
    }
    UFUNCTION()
    void ClientJob_CleanUpLevelUnit(const FECSEntity &inout Entity, const FC_LevelUnitComponent &inout Component) const
    {
        this.OnLevelUnitDeactivate(Entity, Component);
        return;
    }
    UFUNCTION()
    void Run_Job_LevelDataManager() const
    {
        ECS::GetContextJob();
        this.Job_LevelDataManager();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateLevelGroups() const
    {
        int local_24 = 0;
        int local_30 = 0;
        int local_36 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        Has local_18;
        if (!(local_18.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        Has local_22;
        if (!(local_22.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_5 = this.GetECSWorld();
        FECSWorldPtr local_4_6 = this.GetECSWorld();
        FECSWorldPtr local_4_7 = this.GetECSWorld();
        this.ServerJob_UpdateLevelGroups(local_24, local_30, local_36);
        FECSWorldPtr local_4_8 = this.GetECSWorld();
        MarkModifiedIfDirty local_44;
        local_44.opCall(local_36);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ProcessPendingLoadUnits() const
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
        this.ServerJob_ProcessPendingLoadUnits(local_12);
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_20;
        local_20.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_CleanUpLevelUnit() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_168 = 0;
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
                this.ServerJob_CleanUpLevelUnit(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_82.Iterator();
        for (; local_130.CanProceed;)
        {
            local_38 = local_130.Proceed();
            ++local_96;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.ServerJob_CleanUpLevelUnit(local_168, local_40);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ServerLevelUnitAssign() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = this.GetECSWorld().__GetMonitorLevelUnitComponentOnAssignView(EECSRegType(2), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_ServerLevelUnitAssign(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateLevelGroups() const
    {
        int local_20 = 0;
        int local_26 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        Has local_18;
        if (!(local_18.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        FECSWorldPtr local_4_5 = this.GetECSWorld();
        this.ClientJob_UpdateLevelGroups(local_20, local_26);
        FECSWorldPtr local_4_6 = this.GetECSWorld();
        MarkModifiedIfDirty local_34;
        local_34.opCall(local_26);
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientLevelUnitAssign() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorLevelUnitComponentOnActiveView(EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientLevelUnitAssign(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_CleanUpLevelUnit() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
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
                this.ClientJob_CleanUpLevelUnit(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
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
            this.ClientJob_CleanUpLevelUnit(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

