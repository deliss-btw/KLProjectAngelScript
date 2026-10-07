
const FConsoleVariable CVar_ShowESMTriggers = FConsoleVariable();

class US_ESMLowCostSystem : UECSScriptSystem
{
    US_ESMLowCostSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_EnterCombat(const FCE_AIEnterCombat &inout Event) const
    {
        0.RuntimeInfo.PushDisableLowCost();
        return;
    }
    UFUNCTION()
    void Job_QuitCombat(const FCE_AIQuitCombat &inout Event) const
    {
        0.RuntimeInfo.PopDisableLowCost();
        return;
    }
    UFUNCTION()
    void Job_ExitLowCostFreezeOnTimeExceed(const FECSEntity &inout Entity, FC_ESMLowCostFreeze &inout LowCost) const
    {
        FESMLowCostUtils::ResumeESMLowCostFreeze(Entity);
        return;
    }
    UFUNCTION()
    void Run_Job_EnterCombat() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AIEnterCombat> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AIEnterCombat& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_EnterCombat(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_QuitCombat() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AIQuitCombat> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AIQuitCombat& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_QuitCombat(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_ExitLowCostFreezeOnTimeExceed(const FC_ESMLowCostFreeze &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.NextTickTime);
        FName local_8 = FName("S_ESMLowCostSystem::Job_ExitLowCostFreezeOnTimeExceed");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_ExitLowCostFreezeOnTimeExceed(const FC_ESMLowCostFreeze &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.NextTickTime);
        FName local_8 = FName("S_ESMLowCostSystem::Job_ExitLowCostFreezeOnTimeExceed");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_ExitLowCostFreezeOnTimeExceed(const FC_ESMLowCostFreeze &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.NextTickTime);
        FName local_8 = FName("S_ESMLowCostSystem::Job_ExitLowCostFreezeOnTimeExceed");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_ExitLowCostFreezeOnTimeExceed() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = this.GetECSWorld().__GetMonitorESMLowCostFreezeOnModifyView(EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_ExitLowCostFreezeOnTimeExceed(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = this.GetECSWorld().__GetMonitorESMLowCostFreezeOnActiveView(EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_ExitLowCostFreezeOnTimeExceed(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_ExitLowCostFreezeOnTimeExceed() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = this.GetECSWorld().__GetMonitorESMLowCostFreezeOnModifyView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_ExitLowCostFreezeOnTimeExceed(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = this.GetECSWorld().__GetMonitorESMLowCostFreezeOnActiveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_ExitLowCostFreezeOnTimeExceed(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_ExitLowCostFreezeOnTimeExceed() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = this.GetECSWorld().__GetMonitorESMLowCostFreezeOnModifyView(EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_ExitLowCostFreezeOnTimeExceed(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = this.GetECSWorld().__GetMonitorESMLowCostFreezeOnActiveView(EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_ExitLowCostFreezeOnTimeExceed(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ExitLowCostFreezeOnTimeExceed() const
    {
        bool local_30;
        int local_38 = 0;
        int local_68 = 0;
        int local_70 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        local_2.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_10 = local_2.GetExternalEntityList();
        FECSEntity local_28;
        Has local_48;
        Has local_66;
        for (auto& local_24 : local_10)
        {
            local_24;
            FECSEntityScopeCycleCounter local_29 = FECSEntityScopeCycleCounter(local_28);
            local_30 = false;
            bool local_31 = !(false);
            if (!(local_28.IsActive()) == local_31)
            {
                continue;
            }
            if (!(local_38))
            {
                continue;
            }
            FFPTime local_40 = FFPTime(local_38.NextTickTime);
            if (local_40.opCmp(0.0) < 0 || (FFPTime(local_38.NextTickTime) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_48.opCall()) == !(false))
            {
                XLog(ELog(2), (FString("Timer job error: 'FC_LocalTag' included by job but not exist on ") + local_28.ToString()));
                local_30 = true;
            }
            if (!(local_66.opCall()) == !(false))
            {
                XLog(ELog(2), (FString("Timer job error: 'FC_ESMDurationFreezeTag' included by job but not exist on ") + local_28.ToString()));
                local_30 = true;
            }
            if (local_30)
            {
                continue;
            }
            this.Job_ExitLowCostFreezeOnTimeExceed(local_68, local_70);
            MarkModifiedIfDirty local_78;
            local_78.opCall(local_70);
        }
        local_2.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
}

