

class US_EcosimLevelSystem : UECSScriptSystem
{
    US_EcosimLevelSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_InitLevelSpawner(const FECSEntity &inout Entity, const FC_EcosimLevelSpawnerConfig &inout EcosimLevelSpawnerConfig) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Run_Monitor_InitLevelSpawner() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcosimLevelSpawnerConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InitLevelSpawner(local_46, local_52);
        }
        return;
    }
}

