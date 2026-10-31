class US_UICameraModifierSystem : UECSScriptSystem
{
    US_UICameraModifierSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleRequestStartCameraModifier(const FCE_RequestStartCameraModifier &inout Event) const
    {
        FCameraUtils::StartModifier(Event.Sender, ECS::GetContextTime(), Event.SourceIdentifier, Event.ModifierConfig, Event.OverrideEnterDuration);
        return;
    }
    UFUNCTION()
    void Job_HandleRequestStopCameraModifier(const FCE_RequestStopCameraModifier &inout Event) const
    {
        FCameraUtils::StopModifier(Event.Sender, ECS::GetContextTime(), Event.SourceIdentifier, Event.ModifierConfig, Event.OverrideExitDuration, Event.bWarnIfNotExists);
        return;
    }
    UFUNCTION()
    void Run_Job_HandleRequestStartCameraModifier() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RequestStartCameraModifier> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RequestStartCameraModifier& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                XError(ELog(3), (FString("Validate Failed: FCE_RequestStartCameraModifier, sender") + local_60.Sender.ToString()));
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleRequestStartCameraModifier(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleRequestStopCameraModifier() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RequestStopCameraModifier> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RequestStopCameraModifier& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                XError(ELog(3), (FString("Validate Failed: FCE_RequestStopCameraModifier, sender") + local_60.Sender.ToString()));
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleRequestStopCameraModifier(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

