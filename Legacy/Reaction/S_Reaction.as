

class US_ReactionSystem : UECSScriptSystem
{
    UPROPERTY()
    UDataTable PromptDataTable;
    UPROPERTY()
    UDataTable GeneratedReactionDataTable;

    US_ReactionSystem()
    {
        return;
    }
    UFUNCTION()
    void HandleQuestForGPTCallBack(const FECSEntity &inout PawnEntity, const FString &inout CallBackContent) const
    {
        int local_18 = 0;
        XError(ELog(0), (((FString("HandleQuestForGPTCallBack: ") + PawnEntity.GetEntityName()) + "\n") + CallBackContent));
        local_18.SetInfoOnHead(CallBackContent);
        FString local_22;
        ::FLLMUtils::GetLLMCallBackValueByKey(CallBackContent, "зЋ©е®¶иЎЊдёєзљ„ж„Џе›ѕ", local_22);
        if (!(local_22.IsEmpty()))
        {
            FString local_6_2 = (local_22 + "\n");
            ::FLLMUtils::AppendCandidateDataTo("PlayerIntensionCandidate", local_6_2, true);
        }
        FString local_28;
        ::FLLMUtils::GetLLMCallBackValueByKey(CallBackContent, "е•†дєєзљ„еЏЌеє”жЂ»з»“", local_28);
        if (!(local_28.IsEmpty()))
        {
            FString local_10_2 = (local_28 + "\n");
            ::FLLMUtils::AppendCandidateDataTo("TraderReactionCandidate", local_10_2, true);
        }
        FFPTime local_42 = (FFPTime(PawnEntity.GetWorld().GetLocalTime().Time) + FFPTime(5));
        FECSWorldPtr local_30 = PawnEntity.GetWorld();
        SendEvent local_34;
        local_34.opCall(PawnEntity, local_42);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleClearReactionInfoOnHead(const FCE_ClearReactionInfoOnHead &inout Event) const
    {
        int local_10 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        local_10.SetInfoOnHead("");
        return;
    }
    UFUNCTION()
    void ServerJob_HandleClearAIGeneratingReactionTag(const FCE_ClearAIGeneratingReactionTag &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        Remove local_8;
        local_8.opCall();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleClearReactionInfoOnHead() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClearReactionInfoOnHead> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClearReactionInfoOnHead& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleClearReactionInfoOnHead(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleClearAIGeneratingReactionTag() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClearAIGeneratingReactionTag> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClearAIGeneratingReactionTag& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleClearAIGeneratingReactionTag(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

