

class US_LocalPlayerEffectSystem : UECSScriptSystem
{
    US_LocalPlayerEffectSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_OnLocalPlayerForceFeedbackEffect(const FCE_LocalPlayerForceFeedbackEffect &inout Event) const
    {
        bool local_5 = Event.bLooping;
        UForceFeedbackEffect local_2;
        ::LocalPlayerEffectUtils::LocalPlayForceFeedback(local_2, Event.Tag, local_5, Event.bIgnoreTimeDilation, Event.bPlayWhilePaused);
        return;
    }
    UFUNCTION()
    void Run_Job_OnLocalPlayerForceFeedbackEffect() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_LocalPlayerForceFeedbackEffect> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_LocalPlayerForceFeedbackEffect& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_OnLocalPlayerForceFeedbackEffect(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

