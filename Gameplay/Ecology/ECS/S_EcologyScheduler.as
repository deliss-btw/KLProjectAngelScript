

class US_EcologyScheduler : UECSScriptSystem
{
    US_EcologyScheduler()
    {
        return;
    }
    UFUNCTION()
    void Job_Init() const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        0.Setup();
        return;
    }
    UFUNCTION()
    void Monitor_OnRemove(const FECSEntity &inout Entity, const FC_EcologySchedulerUnit &inout Unit) const
    {
        int local_2 = 0;
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        if (int(Unit.CurrentScedulerLevel) == 4)
        {
            return;
        }
        ::FEcologySchedulerUtils::RemoveEntityFromScheduler(Entity, Unit.CurrentScedulerLevel, local_2);
        return;
    }
    UFUNCTION()
    void Job_ClearUpdateTag(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_ApplyUpdateTagByMannual(const FECSEntity &inout Entity) const
    {
        FC_EcologyAllowedToUpdateThisFrameTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        Remove local_10;
        local_10.opCall();
        return;
    }
    UFUNCTION()
    void Job_ProcessScheduler(FCS_EcologyScheduler &inout Scheduler) const
    {
        int local_13;
        this.Run_Job_ClearUpdateTag();
        this.Run_Job_ApplyUpdateTagByMannual();
        Scheduler.CurrentFrameUpdateEntity.Empty(0);
        Scheduler.CurrentFrameUpdateEntity.Append(Scheduler.AllUnits[0].GetAllEntity());
        FEntitySchedulerContainer& local_4 = Scheduler.AllUnits[1];
        if (local_4.AllNum() > 0)
        {
            int local_5 = FMath::Max(1, (FMath::CeilToInt((local_4.AllNum() / 10.0f))));
            this.ProcessContainer(Scheduler, local_4, local_5);
        }
        FEntitySchedulerContainer& local_12 = Scheduler.AllUnits[2];
        if (local_12.AllNum() > 0)
        {
            local_13 = FMath::IntegerDivisionTrunc(local_12.AllNum(), 60);
            local_13 = FMath::Max(1, local_13);
            this.ProcessContainer(Scheduler, local_12, local_13);
        }
        local_13 = 1;
        this.ProcessContainer(Scheduler, Scheduler.AllUnits[3], local_13);
        return;
    }
    void ProcessContainer(FCS_EcologyScheduler &inout Scheduler, FEntitySchedulerContainer &inout Container, int &inout Count) const
    {
        while (Count > 0 && !(Container.IsEmpty()))
        {
            FECSEntityId local_5 = Container.Current();
            Has local_18;
            if (!(FECSEntity(local_5).IsValid()) || !(local_18.opCall()))
            {
                Container.MoveNext();
                continue;
            }
            FC_EcologyAllowedToUpdateThisFrameTag local_24;
            Assign local_22;
            local_22.opCall(local_24);
            Scheduler.CurrentFrameUpdateEntity.Add(local_5);
            --Count;
            Container.MoveNext();
        }
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
    void Run_Monitor_OnRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcologySchedulerUnitOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearUpdateTag() const
    {
        int local_136 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_EcologyScheduler::Job_ClearUpdateTag"));
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_94 = local_48.Iterator();
        for (; local_94.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_133 = FECSEntityScopeCycleCounter(local_94.Proceed());
            this.Job_ClearUpdateTag(local_136);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ApplyUpdateTagByMannual() const
    {
        int local_136 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_EcologyScheduler::Job_ApplyUpdateTagByMannual"));
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_94 = local_48.Iterator();
        for (; local_94.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_133 = FECSEntityScopeCycleCounter(local_94.Proceed());
            this.Job_ApplyUpdateTagByMannual(local_136);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ProcessScheduler() const
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
        this.Job_ProcessScheduler(local_12);
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_20;
        local_20.opCall(local_12);
        return;
    }
}

