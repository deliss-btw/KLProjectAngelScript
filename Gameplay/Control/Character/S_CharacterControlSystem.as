

class US_CharacterControlSystemAS : UECSScriptSystem
{
    US_CharacterControlSystemAS()
    {
        return;
    }
    UFUNCTION()
    void Monitor_OnControlledByPlayerAdd(const FECSEntity &inout Entity, const FC_ControlledByPlayer &inout ControlledByPlayer) const
    {
        ECS::GetContextTime();
        FCE_ControlledByPlayerChanged local_8;
        local_8.bAdd = true;
        return;
    }
    UFUNCTION()
    void Monitor_OnControlledByPlayerRemove(const FECSEntity &inout Entity, const FC_ControlledByPlayer &inout ControlledByPlayer) const
    {
        ECS::GetContextTime();
        FCE_ControlledByPlayerChanged local_8;
        local_8.bAdd = false;
        return;
    }
    UFUNCTION()
    void Job_HandleControlledByPlayer(const FCE_ControlledByPlayerChanged &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (Event.bAdd)
        {
            local_4.AddGameplayTagDetermined(GameplayTags::Control_ControlledByPlayer, NAME_None);
        }
        else
        {
            local_4.RemoveGameplayTagDetermined(GameplayTags::Control_ControlledByPlayer, NAME_None);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnControlledByPlayerAdd() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorControlledByPlayerOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnControlledByPlayerAdd(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnControlledByPlayerRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorControlledByPlayerOnRemoveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnControlledByPlayerRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleControlledByPlayer() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ControlledByPlayerChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ControlledByPlayerChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleControlledByPlayer(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

