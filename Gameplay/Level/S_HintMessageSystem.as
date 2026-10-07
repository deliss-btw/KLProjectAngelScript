

class US_HintMessageSystemAS : UECSScriptSystem
{
    US_HintMessageSystemAS()
    {
        return;
    }
    UFUNCTION()
    void Job_UpdateSideHint(const FCE_ShowSideHint &inout Event) const
    {
        if (!((Event.SpecifiedShowEntity == ENTITY_NULL)) && !((::FASCommonUtils::GetLocalPlayerPawnEntity() == Event.SpecifiedShowEntity)))
        {
            return;
        }
        AAS_ECSPlayerController local_8 = ::FASCommonUtils::GetASECSProxyPlayerController();
        if (local_8 != nullptr)
        {
            local_8.ShowSideHint.Execute(Event.ShowContent, Event.SideHintType, Event.HintTarget, int(Event.ShowCount));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_UpdatCustomWheelOptionRequest(const FCE_ShowCustomWheelOptionRequest &inout Event) const
    {
        int local_12 = 0;
        FFPTime local_8 = FFPTime(-1);
        FECSWorldPtr local_2 = this.GetECSWorld();
        local_12.OptionConfig = Event.OptionConfig;
        local_12.SetbPredictable(false);
        this.ReportWheelEmojiUse(Event.Sender, Event.OptionConfig);
        return;
    }
    void ReportWheelEmojiUse(const FECSEntity &inout PawnEntity, const TDataObjectPtr<FCustomWheelOptionConfig> &inout OptionConfig) const
    {
        const FCustomWheelOptionConfig& local_4;
        if (!(OptionConfig.IsSet()))
        {
            return;
        }
        if (int(local_4.OptionType) != 0)
        {
            return;
        }
        if (!(local_4.GetDefaultEmojiData().IsSet()))
        {
            return;
        }
        FPbPlayerLogDsWheelEmojiUse local_20;
        FEmojiData local_10;
        local_20.SetEmojiId(local_10.GetUniqueID());
        local_20.SetEmojiType(int(local_10.EmojiType));
        XLog(ELog(22), FString().Append("PLAYER_ACTION_DS_WHEEL_EMOJI_USE Wheel Emoji Use: ").Append(local_10.GetUniqueID()).Append(" ").Append(local_10.EmojiType));
        ::ServerDataTrackerHelper::LogProtoMessage3WithPawn(PawnEntity, 105002, local_20.ToWrapper());
        return;
    }
    UFUNCTION()
    void ClientJob_ShowCustomWheelOption(const FCE_ShowCustomWheelOption &inout Event) const
    {
        FECSEntity local_4 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        Get local_12;
        Get local_16;
        if (local_12.opCall().GetPosition().Distance(local_16.opCall().GetPosition()) > 2500.0)
        {
            return;
        }
        AAS_ECSPlayerController local_24 = ::FASCommonUtils::GetASECSProxyPlayerController();
        if (local_24 != nullptr)
        {
            const FCustomWheelOptionConfig& local_28;
            if (!(Event.OptionConfig.IsSet()))
            {
                return;
            }
            if (int(local_28.OptionType) != 0)
            {
                local_24.ShowCustomWheelOption.Execute(Event);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_UpdatHeadBubbleRequest(const FCE_ShowHeadBubbleRequest &inout Event) const
    {
        int local_12 = 0;
        FFPTime local_8 = FFPTime(-1);
        FECSWorldPtr local_2 = this.GetECSWorld();
        local_12.EmojiData = Event.EmojiData;
        local_12.SetbPredictable(false);
        XLog(ELog(0), "Wheel Button Sever Get!");
        return;
    }
    UFUNCTION()
    void ClientJob_ShowHeadBubble(const FCE_ShowHeadBubble &inout Event) const
    {
        XLog(ELog(0), "Wheel Button Client Show!");
        FECSEntity local_6 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        Get local_14;
        Get local_18;
        if (local_14.opCall().GetPosition().Distance(local_18.opCall().GetPosition()) > 2500.0)
        {
            return;
        }
        AAS_ECSPlayerController local_26 = ::FASCommonUtils::GetASECSProxyPlayerController();
        if (local_26 != nullptr)
        {
            local_26.ShowHeadBubble.Execute(Event, false);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateSideHint() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ShowSideHint> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ShowSideHint& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_UpdateSideHint(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdatCustomWheelOptionRequest() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ShowCustomWheelOptionRequest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ShowCustomWheelOptionRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_ShowCustomWheelOptionRequest, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_UpdatCustomWheelOptionRequest(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ShowCustomWheelOption() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ShowCustomWheelOption> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ShowCustomWheelOption& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_ShowCustomWheelOption(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdatHeadBubbleRequest() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ShowHeadBubbleRequest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ShowHeadBubbleRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_ShowHeadBubbleRequest, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_UpdatHeadBubbleRequest(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ShowHeadBubble() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ShowHeadBubble> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ShowHeadBubble& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_ShowHeadBubble(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

