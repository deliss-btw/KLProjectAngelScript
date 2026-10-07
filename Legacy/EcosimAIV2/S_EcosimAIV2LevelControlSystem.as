

class US_EcosimAIV2LevelControlSystem : UECSScriptSystem
{
    US_EcosimAIV2LevelControlSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleLevelControlEventOnComplete(const FCE_EcosimAIV2LevelControlOnComplete &inout Event) const
    {
        Get local_6;
        const FC_EcosimAIV2LevelControlEvents& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.OnComplete.Broadcast();
        }
        return;
    }
    UFUNCTION()
    void Job_HandleLevelControlEventOnFailed(const FCE_EcosimAIV2LevelControlOnFailed &inout Event) const
    {
        Get local_6;
        const FC_EcosimAIV2LevelControlEvents& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.OnFailed.Broadcast();
        }
        return;
    }
    UFUNCTION()
    void Job_HandleLevelControlEventOnCancel(const FCE_EcosimAIV2LevelControlOnCancel &inout Event) const
    {
        Get local_6;
        const FC_EcosimAIV2LevelControlEvents& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.OnCancel.Broadcast();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleLevelControlEventOnComplete() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcosimAIV2LevelControlOnComplete> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcosimAIV2LevelControlOnComplete& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleLevelControlEventOnComplete(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleLevelControlEventOnFailed() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcosimAIV2LevelControlOnFailed> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcosimAIV2LevelControlOnFailed& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleLevelControlEventOnFailed(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleLevelControlEventOnCancel() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcosimAIV2LevelControlOnCancel> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcosimAIV2LevelControlOnCancel& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleLevelControlEventOnCancel(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

