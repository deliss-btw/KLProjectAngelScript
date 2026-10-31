class US_EcologyResourceSystem : UECSScriptSystem
{
    US_EcologyResourceSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_Init() const
    {
        XLog(ELog(0), "aaaaa");
        return;
    }
    UFUNCTION()
    void Monitor_InitResource(const FECSEntity &inout Entity, const FC_EcologyResourceProviderSummary &inout Resource) const
    {
        int local_2 = 0;
        int local_10 = 0;
        int local_86 = 0;
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        FVoxelPosition local_20 = FVoxelPosition(local_2.GetPosition());
        FEcologyVoxelSceneRegion& local_32 = local_10.VoxelScene.FindOrAddRegion(local_20);
        FEcologyVoxelSceneUnitSummary local_50;
        local_50.UnitEntity = Entity.GetId();
        local_32.Add(local_20, local_50, EEcologyVoxelUnitSlot(0));
        for (auto& local_72 : local_32.VolumeData)
        {
            if (local_72.GetValue().bHasEcologyModifier)
            {
                FECSEntity local_80 = FECSEntity(local_72.GetKey());
                if (!(local_86))
                {
                    continue;
                }
                for (auto& local_104 : local_86.Modifiers)
                {
                    ::FEcologyModifierUtils::TryAddModifierToEntity(local_104.GetValue(), Entity);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_RemoveResource(const FECSEntity &inout Entity, const FC_EcologyResourceProviderSummary &inout Resource) const
    {
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        FVoxelPosition local_20 = FVoxelPosition(0.GetPosition());
        0.VoxelScene.FindOrAddRegion(local_20).Remove(local_20, Entity.GetId(), EEcologyVoxelUnitSlot(0));
        ::FEcologyResourceUtils::NotifyResourceUserRefresh(Resource);
        return;
    }
    UFUNCTION()
    void Run_Job_Init() const
    {
        ECS::GetContextJob();
        this.Job_Init();
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitResource_StaticReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        int local_6 = int(this.GetECSRuntime().IsClient);
        if (local_6 == 0)
        {
            local_6 = 0;
        }
        else
        {
            bool local_5 = !(local_2.bFirstTimeTick);
            local_6 = local_5;
        }
        if (local_6 != 0)
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyResourceProviderSummaryOnActiveView(this.GetECSWorld(), EECSRegType(1), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_InitResource(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitResource_DefaultReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyResourceProviderSummaryOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_InitResource(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitResource_LocalReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        int local_6 = int(this.GetECSRuntime().IsClient);
        if (local_6 == 0)
        {
            local_6 = 0;
        }
        else
        {
            bool local_5 = !(local_2.bFirstTimeTick);
            local_6 = local_5;
        }
        if (local_6 != 0)
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyResourceProviderSummaryOnActiveView(this.GetECSWorld(), EECSRegType(2), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_InitResource(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_RemoveResource_StaticReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        int local_6 = int(this.GetECSRuntime().IsClient);
        if (local_6 == 0)
        {
            local_6 = 0;
        }
        else
        {
            bool local_5 = !(local_2.bFirstTimeTick);
            local_6 = local_5;
        }
        if (local_6 != 0)
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyResourceProviderSummaryOnInactiveView(this.GetECSWorld(), EECSRegType(1), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_RemoveResource(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_RemoveResource_DefaultReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyResourceProviderSummaryOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_RemoveResource(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_RemoveResource_LocalReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        int local_6 = int(this.GetECSRuntime().IsClient);
        if (local_6 == 0)
        {
            local_6 = 0;
        }
        else
        {
            bool local_5 = !(local_2.bFirstTimeTick);
            local_6 = local_5;
        }
        if (local_6 != 0)
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyResourceProviderSummaryOnInactiveView(this.GetECSWorld(), EECSRegType(2), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_RemoveResource(local_48, local_54);
        }
        return;
    }
}

