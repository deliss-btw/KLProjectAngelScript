

class US_ESMToLevelEventSystem : UECSScriptSystem
{
    US_ESMToLevelEventSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_ForwardESMTriggerToLevel(const FECSEntity &inout Entity, const FC_ESMRespondedTrigger &inout RespondedTrigger) const
    {
        FCE_ESMTriggerResponded local_30;
        ULevelEventManager local_2 = ::ULevelEventManager::Get();
        for (auto& local_20 : RespondedTrigger.Triggers)
        {
            FFPTime local_26 = FFPTime(-1);
            local_30.Entity = Entity;
            local_30.TriggerName = local_20.GetTriggerName();
            local_30.StateMachineIndex = local_20.GetStateMachineIndex();
            local_2.NotifyESMTriggerResponded(Entity, local_20.GetTriggerName(), local_20.GetStateMachineIndex());
        }
        return;
    }
    UFUNCTION()
    void Monitor_ESMStateEntryHappenForLevel(const FECSEntity &inout Entity, const FC_ESMStateEntryHappen &inout StateEntryHappen) const
    {
        for (auto& local_16 : StateEntryHappen.Entries)
        {
            ::ULevelEventManager::Get().HandleESMStateEntryForEntity(Entity, int(local_16.StateMachineIndex), local_16.StateName);
        }
        return;
    }
    UFUNCTION()
    void Job_ForwardESMActionEventToLevel(const FCE_ESMLevelActionEvent &inout Event) const
    {
        ULevelEventManager local_2 = ::ULevelEventManager::Get();
        local_2.NotifyESMActionEvent(Event.Entity, Event.EventName, Event.bIsEnter);
        return;
    }
    UFUNCTION()
    void Run_Job_ForwardESMTriggerToLevel() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
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
                this.Job_ForwardESMTriggerToLevel(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ForwardESMTriggerToLevel(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ESMStateEntryHappenForLevel() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorESMStateEntryHappenOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ESMStateEntryHappenForLevel(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ForwardESMActionEventToLevel() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ESMLevelActionEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ESMLevelActionEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_ForwardESMActionEventToLevel(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

