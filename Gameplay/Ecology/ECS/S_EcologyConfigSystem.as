

class US_EcologyConfigSystem : UECSScriptSystem
{
    US_EcologyConfigSystem()
    {
        return;
    }
    bool UseLegacyConfig() const
    {
        if (UGameplayConfigsManager::UseJsonConfig())
        {
            return false;
        }
        return true;
    }
    UFUNCTION()
    void Monitor_ClientInactiveEcologyUnit(const FECSEntity &inout Entity, const FC_PrefabUID &inout PrefabUID) const
    {
        int local_4 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (!(local_4))
        {
            XError(ELog(30), "FCS_EcologyConfigContext is nulll");
            return;
        }
        if (local_4.EntityConfigMap.Contains(PrefabUID.UID))
        {
            (FECSEntityId(local_4.EntityConfigMap[PrefabUID.UID]) == Entity.GetId());
        }
        return;
    }
    UFUNCTION()
    void Monitor_ClientInitEcologyUnit(const FECSEntity &inout Entity, const FC_PrefabUID &inout PrefabUID) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        0.EntityConfigMap.Add(PrefabUID.UID, Entity.GetId());
        return;
    }
    UFUNCTION()
    void Monitor_ServerInactiveEcologyUnit(const FECSEntity &inout Entity, const FC_PrefabUID &inout PrefabUID) const
    {
        int local_4 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (local_4.EntityConfigMap.Contains(PrefabUID.UID))
        {
            (FECSEntityId(local_4.EntityConfigMap[PrefabUID.UID]) == Entity.GetId());
        }
        return;
    }
    UFUNCTION()
    void Monitor_ServerInitEcologyUnit(const FECSEntity &inout Entity, const FC_PrefabUID &inout PrefabUID) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        0.EntityConfigMap.Add(PrefabUID.UID, Entity.GetId());
        return;
    }
    UFUNCTION()
    void Monitor_ActivityEcologyConfig(const FECSEntity &inout Entity, const FC_EcologyTestConfig &inout Config) const
    {
        int local_28 = 0;
        if (!(this.UseLegacyConfig()))
        {
            return;
        }
        ::FEcologyLifeCycleUtils::RegisterEcologyRuntimeEntity(Entity, ECS::GetECSWorld().Create(EECSRegType(2), EEntityType(9), n"EcologyRuntimeName"), true);
        FEcologyConfigGenerateContext local_60;
        local_60.SetupByConfigOuter(Entity);
        for (auto& local_74 : Config.ConfigList)
        {
            if (FInstancedStruct::GetPtr(local_74.GetConfigData()).opCall())
            {
                FECSEntity local_16;
                local_16.GenerateRuntimeEntity(local_60);
                local_28.TargetEntityId.Add(local_16.GetId());
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_InactiveEcologyConfig(const FECSEntity &inout Entity, const FC_EcologyTestConfig &inout Config) const
    {
        ::FEcologyLifeCycleUtils::DestroyEcologyRuntimeEntity(Entity);
        return;
    }
    UFUNCTION()
    void Monitor_ActivityResourceConfig(const FECSEntity &inout Entity, const FC_EcologyResourceConfig &inout Config) const
    {
        if (!(this.UseLegacyConfig()))
        {
            return;
        }
        FEcologyConfigGenerateContext local_36;
        local_36.SetupByConfigOuter(Entity);
        if (FInstancedStruct::GetPtr(Config.ResourceConfig.GetConfigData()).opCall())
        {
            FECSEntity local_48;
            local_48.GenerateRuntimeEntity(local_36);
            ::FEcologyLifeCycleUtils::RegisterEcologyRuntimeEntity(Entity, local_48, true);
        }
        return;
    }
    UFUNCTION()
    void Monitor_InactiveResourceConfig(const FECSEntity &inout Entity, const FC_EcologyResourceConfig &inout Config) const
    {
        ::FEcologyLifeCycleUtils::DestroyEcologyRuntimeEntity(Entity);
        return;
    }
    UFUNCTION()
    void Monitor_ActivitySpawnerConfig(const FECSEntity &inout Entity, const FC_EcologySpawnerConfig &inout Config) const
    {
        if (!(this.UseLegacyConfig()))
        {
            return;
        }
        FEcologyConfigGenerateContext local_36;
        local_36.SetupByConfigOuter(Entity);
        if (FInstancedStruct::GetPtr(Config.SpawnerConfig.GetConfigData()).opCall())
        {
            FECSEntity local_48;
            local_48.GenerateRuntimeEntity(local_36);
            ::FEcologyLifeCycleUtils::RegisterEcologyRuntimeEntity(Entity, local_48, true);
        }
        return;
    }
    UFUNCTION()
    void Monitor_InactiveSpanwerConfig(const FECSEntity &inout Entity, const FC_EcologySpawnerConfig &inout Config) const
    {
        ::FEcologyLifeCycleUtils::DestroyEcologyRuntimeEntity(Entity);
        return;
    }
    UFUNCTION()
    void Monitor_ActivityModifierConfig(const FECSEntity &inout Entity, const FC_EcologyResourceModifierConfig &inout Config) const
    {
        AECSRegionVolume local_6;
        int local_24 = 0;
        if (!(this.UseLegacyConfig()))
        {
            return;
        }
        if (Config.Scope.IsNull())
        {
            return;
        }
        if (!(local_6.GetRegionEntity().IsValid()))
        {
            XError(ELog(30), FString().Append("Region Entity Has not Init"));
        }
        FEcologyModifierSummary local_14;
        local_14.ConfigRef = Entity.GetId();
        local_24.Modifiers.Add(Entity.GetId(), local_14);
        ::FEcologyModifierUtils::UpdateModifiersForRegion(local_6, local_14, Config, true);
        return;
    }
    UFUNCTION()
    void Monitor_InactiveModifierConfig(const FECSEntity &inout Entity, const FC_EcologyResourceModifierConfig &inout Config) const
    {
        AECSRegionVolume local_6;
        int local_18 = 0;
        int local_22 = 0;
        if (!(this.UseLegacyConfig()))
        {
            return;
        }
        if (Config.Scope.IsNull())
        {
            return;
        }
        if (!(local_6.GetRegionEntity().IsValid()))
        {
            XError(ELog(30), FString().Append("Region Entity Has not Init"));
        }
        if (local_18.Modifiers.Contains(Entity.GetId()))
        {
            FECSEntityId local_19 = Entity.GetId();
            ::FEcologyModifierUtils::UpdateModifiersForRegion(local_6, local_22, Config, false);
            FECSEntityId local_19_2 = Entity.GetId();
        }
        return;
    }
    UFUNCTION()
    void Monitor_ActivityConstSpawnerConfig(const FECSEntity &inout Entity, const FC_ConstMonsterSpawnerConfig &inout Config) const
    {
        if (!(this.UseLegacyConfig()))
        {
            return;
        }
        FEcologyConfigGenerateContext local_36;
        local_36.SetupByConfigOuter(Entity);
        if (FInstancedStruct::GetPtr(Config.Config.GetConfigData()).opCall())
        {
            FECSEntity local_48;
            local_48.GenerateRuntimeEntity(local_36);
            if (local_48)
            {
                ::FEcologyLifeCycleUtils::RegisterEcologyRuntimeEntity(Entity, local_48, true);
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_InactiveConstSpanwerConfig(const FECSEntity &inout Entity, const FC_ConstMonsterSpawnerConfig &inout Config) const
    {
        ::FEcologyLifeCycleUtils::DestroyEcologyRuntimeEntity(Entity);
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientInactiveEcologyUnit() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPrefabUIDOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientInactiveEcologyUnit(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientInitEcologyUnit() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPrefabUIDOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientInitEcologyUnit(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ServerInactiveEcologyUnit() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPrefabUIDOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ServerInactiveEcologyUnit(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ServerInitEcologyUnit() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPrefabUIDOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ServerInitEcologyUnit(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ActivityEcologyConfig() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcologyTestConfigOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ActivityEcologyConfig(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InactiveEcologyConfig() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcologyTestConfigOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InactiveEcologyConfig(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ActivityResourceConfig() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcologyResourceConfigOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ActivityResourceConfig(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InactiveResourceConfig() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcologyResourceConfigOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InactiveResourceConfig(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ActivitySpawnerConfig() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcologySpawnerConfigOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ActivitySpawnerConfig(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InactiveSpanwerConfig() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcologySpawnerConfigOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InactiveSpanwerConfig(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ActivityModifierConfig() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcologyResourceModifierConfigOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ActivityModifierConfig(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InactiveModifierConfig() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcologyResourceModifierConfigOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InactiveModifierConfig(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ActivityConstSpawnerConfig() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorConstMonsterSpawnerConfigOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ActivityConstSpawnerConfig(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InactiveConstSpanwerConfig() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorConstMonsterSpawnerConfigOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InactiveConstSpanwerConfig(local_46, local_52);
        }
        return;
    }
}

