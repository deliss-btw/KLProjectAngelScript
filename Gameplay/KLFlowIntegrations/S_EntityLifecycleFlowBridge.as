

class US_EntityLifecycleFlowBridge : UECSScriptSystem
{
    US_EntityLifecycleFlowBridge()
    {
        return;
    }
    UFUNCTION()
    void Job_BridgeEntityOnReady(const FCE_EntityOnReady &inout Event) const
    {
        FKLFlowEvent_EntityLifecycle local_2;
        local_2.TargetEntityId = FKLFlowECSEntityId(Event.EntityId);
        ::KLFlowLibrary::PostFlowEvent(KLFlowEventTags::ECS_EntityOnReady, FInstancedStruct::Make(local_2));
        return;
    }
    UFUNCTION()
    void Job_BridgeEntityOnDie(const FCE_EntityOnDie &inout Event) const
    {
        FKLFlowEvent_EntityLifecycle local_2;
        local_2.TargetEntityId = FKLFlowECSEntityId(Event.EntityId);
        ::KLFlowLibrary::PostFlowEvent(KLFlowEventTags::ECS_EntityOnDie, FInstancedStruct::Make(local_2));
        return;
    }
    UFUNCTION()
    void Job_BridgeEntityOnDestroy(const FCE_EntityOnPendingDestroy &inout Event) const
    {
        FKLFlowEvent_EntityLifecycle local_2;
        local_2.TargetEntityId = FKLFlowECSEntityId(Event.EntityId);
        ::KLFlowLibrary::PostFlowEvent(KLFlowEventTags::ECS_EntityOnDestroy, FInstancedStruct::Make(local_2));
        return;
    }
    UFUNCTION()
    void Run_Job_BridgeEntityOnReady() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityOnReady> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityOnReady& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_BridgeEntityOnReady(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BridgeEntityOnDie() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityOnDie> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityOnDie& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_BridgeEntityOnDie(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BridgeEntityOnDestroy() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityOnPendingDestroy> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityOnPendingDestroy& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_BridgeEntityOnDestroy(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

