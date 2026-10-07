

class US_AccountExclusivePropSystem : UECSScriptSystem
{
    US_AccountExclusivePropSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_ClientAssignLevelObjectStatNeedInitTag(const FECSEntity &inout Entity, const FC_LevelObjectStatConfig &inout LevelObjectStatConfig) const
    {
        FC_LevelObjectStatNeedInitTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        return;
    }
    UFUNCTION()
    void Monitor_ClientProcessLocalEntityWhenDefaultEntitySpawn(const FECSEntity &inout Entity, const FC_AccountExclusivePropConfig &inout AccountExclusivePropConfig) const
    {
        int local_18 = 0;
        int local_52 = 0;
        if (!(FSoftClassPath(AccountExclusivePropConfig.LocalRegEntityPrefabClass).IsValid()))
        {
            return;
        }
        if (local_18)
        {
            FECSEntityId local_23;
            Entity.GetEntityName();
            Entity.GetId();
            FName local_27 = FName(FString().Append("LocalEntityOfDefaultEntity_Id_").Append(local_23).Append(local_23).Append("_Name_"));
            FECSWorldPtr local_30 = Entity.GetWorld();
            local_18.LocalEntityId = local_23;
            if (FECSEntity(local_18.LocalEntityId).IsValid())
            {
                Assign local_42;
                local_42.opCall(FC_LocalTag());
                if (local_52)
                {
                    Entity.GetId();
                    local_52.DefaultEntityId = local_23;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_ClientProcessLocalEntityWhenDefaultEntityDestroy(const FECSEntity &inout Entity, const FC_DefaultToLocal &inout DefaultToLocal) const
    {
        FECSEntity local_4 = FECSEntity(DefaultToLocal.LocalEntityId);
        if (local_4)
        {
            local_4.DestroyDeferred();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientAssignLevelObjectStatNeedInitTag() const
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
            this.Monitor_ClientAssignLevelObjectStatNeedInitTag(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientProcessLocalEntityWhenDefaultEntitySpawn() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAccountExclusivePropConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientProcessLocalEntityWhenDefaultEntitySpawn(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientProcessLocalEntityWhenDefaultEntityDestroy() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorDefaultToLocalOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientProcessLocalEntityWhenDefaultEntityDestroy(local_46, local_52);
        }
        return;
    }
}

