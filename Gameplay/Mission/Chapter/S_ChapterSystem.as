

class US_ChapterSystem : UECSScriptSystem
{
    US_ChapterSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_HandleChapterNotifyStart(const FCE_ChapterNotifyStart &inout Event) const
    {
        const UMissionSettings local_2;
        GetGameplaySettings<UMissionSettings> local_4;
        local_2 = local_4;
        if (!(local_2.ChapterStartHint.IsSet()))
        {
            XError(ELog(63), FString().Append("ChapterStartHint is not set, ChapterNotifyStart Event is invalid"));
            return;
        }
        TArray<FTextArgument> local_18;
        Make local_24;
        local_18.Add(local_24.opImplConv());
        ::MessageHintUtils::ShowMessageHint(Event.Sender, local_2.ChapterStartHint, local_18);
        return;
    }
    UFUNCTION()
    void ClientJob_HandleChapterNotifyEnd(const FCE_ChapterNotifyEnd &inout Event) const
    {
        const UMissionSettings local_2;
        GetGameplaySettings<UMissionSettings> local_4;
        local_2 = local_4;
        if (!(local_2.ChapterEndHint.IsSet()))
        {
            XError(ELog(63), FString().Append("ChapterEndHint is not set, ChapterNotifyEnd Event is invalid"));
            return;
        }
        TArray<FTextArgument> local_18;
        Make local_24;
        local_18.Add(local_24.opImplConv());
        ::MessageHintUtils::ShowMessageHint(Event.Sender, local_2.ChapterEndHint, local_18);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleChapterNotifyStart() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ChapterNotifyStart> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ChapterNotifyStart& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleChapterNotifyStart(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleChapterNotifyEnd() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ChapterNotifyEnd> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ChapterNotifyEnd& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleChapterNotifyEnd(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

