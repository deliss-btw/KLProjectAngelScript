

class US_MessageHintSystem : UECSScriptSystem
{
    US_MessageHintSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_HandelServerMessageHint(const FCE_ShowMessageHint_Server &inout Event) const
    {
        ::MessageHintUtils_Internal::ShowMessageHintInternal(Event.Params);
        return;
    }
    UFUNCTION()
    void ClientJob_HandelClientMessageHint(const FCE_ShowMessageHint_Client &inout Event) const
    {
        ::MessageHintUtils_Internal::ShowMessageHintInternal(Event.Params);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandelServerMessageHint() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ShowMessageHint_Server> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ShowMessageHint_Server& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandelServerMessageHint(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandelClientMessageHint() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ShowMessageHint_Client> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ShowMessageHint_Client& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandelClientMessageHint(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

