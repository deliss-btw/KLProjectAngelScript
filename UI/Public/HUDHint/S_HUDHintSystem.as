

class US_HUDHintSystem : UECSScriptSystem
{
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> HealTeammateSuccessMessageHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> RescueTeammateSuccessMessageHint;
    UPROPERTY()
    UCameraPostProcessAnimConfig HealTeammateSuccessPostProcess;

    US_HUDHintSystem()
    {
        return;
    }
    void SmallHintWithBuffStack(const FSoftBrush &inout Icon, const FText &inout Content, const int MaxStack, const int CurStack, const FCommonHintParam &inout ExtraParam = FCommonHintParam()) const
    {
        float32 local_107;
        const UUtilitySettings local_112;
        FSmallSideHintDataWithBuffStack local_100;
        local_100._base_FCommonSideHintData = Icon;
        local_100.Content = Content;
        if (ExtraParam.LifetimeOverride > 0.0f)
        {
            local_107 = ExtraParam.LifetimeOverride;
        }
        else
        {
            local_107 = ::CommonPopupSettings::Get().DefaultSmallSideHintLifetime;
        }
        local_100.Lifetime = local_107;
        local_100.MaxStack = MaxStack;
        local_100.CurStack = CurStack;
        GetGameplaySettings<UUtilitySettings> local_114;
        local_112 = local_114;
        Make local_130;
        local_130;
        return;
    }
    UFUNCTION()
    void ServerJob_HandleBuffAddedEvent(const FCE_BuffAddedEvent &inout Event) const
    {
        Has local_4;
        int local_64 = 0;
        if (!(local_4.opCall()))
        {
            if (FDataObjectPtr(TDataObjectPtr<FBuffConfig>(Event.BuffConfig).opArrow().PresentationConfig))
            {
                if (::FMetaBuffUtils::IsMetaBuff(Event.Sender, Event.BuffConfig))
                {
                    return;
                }
                FFPTime local_60 = FFPTime(-1);
                local_64.BuffConfig = Event.BuffConfig;
                local_64.BuffFromEntity = Event.BuffFromEntity;
                local_64.BuffEntity = Event.Sender;
            }
        }
        return;
    }
    void ParseAttributeFormattedString(const FString &inout Input, FString &inout OutFormatted, TArray<FBuffModifierAttributeDescriptionInfos> &inout AttrValues) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void ClientJob_HandleBuffHints(const FCE_HUDBuffAddHintEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_HandleHealHPEvent(const FCE_HealHpAudioVo &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        FECSEntity local_8 = Event.FromEntity;
        if (Event.HealHp <= 0.0f)
        {
            return;
        }
        bool local_11 = !(::FASCommonUtils::IsAvatarPrefab(local_4));
        bool local_12 = !(false);
        local_11 = local_11 == local_12 || (local_8 == local_4);
        if (local_11)
        {
            return;
        }
        TArray<FECSEntity> local_20 = ::FTeamUtils::GetTeammates(Event.Sender);
        TArray<FTextArgument> local_24;
        Make local_30;
        local_24.Add(local_30.opImplConv());
        local_24.Add(local_30.opImplConv());
        for (auto& local_52 : local_20)
        {
            ::MessageHintUtils::ShowMessageHint(local_52, this.HealTeammateSuccessMessageHint, local_24);
        }
        ::PostProcessUtils::PlayCameraPostProcessAnim(Event.Sender, Event.Sender, false, this.HealTeammateSuccessPostProcess, 1.5f, NAME_None, FVector::ZeroVector);
        return;
    }
    UFUNCTION()
    void Job_HandleRebornEvent(const FCE_Reborn &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        bool local_9 = !(::FASCommonUtils::IsAvatarPrefab(local_4));
        bool local_10 = !(false);
        local_9 = local_9 == local_10 || (Event.RebornByEntity == local_4);
        if (local_9)
        {
            return;
        }
        TArray<FECSEntity> local_18 = ::FTeamUtils::GetTeammates(Event.Sender);
        TArray<FTextArgument> local_22;
        Make local_28;
        local_22.Add(local_28.opImplConv());
        local_22.Add(local_28.opImplConv());
        for (auto& local_50 : local_18)
        {
            ::MessageHintUtils::ShowMessageHint(local_50, this.RescueTeammateSuccessMessageHint, local_22);
        }
        ::PostProcessUtils::PlayCameraPostProcessAnim(Event.Sender, Event.Sender, false, this.HealTeammateSuccessPostProcess, 1.5f, NAME_None, FVector::ZeroVector);
        return;
    }
    UFUNCTION()
    void Job_HandleRescuedByTeammateEvent(const FCE_RescuedFromNearDeathEvent &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        TArray<FECSEntity> local_16 = ::FTeamUtils::GetTeammates(local_4);
        TArray<FTextArgument> local_20;
        Make local_26;
        local_20.Add(local_26.opImplConv());
        local_20.Add(local_26.opImplConv());
        for (auto& local_50 : local_16)
        {
            ::MessageHintUtils::ShowMessageHint(local_50, this.RescueTeammateSuccessMessageHint, local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleBuffAddedEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BuffAddedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BuffAddedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleBuffAddedEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleBuffHints() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HUDBuffAddHintEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HUDBuffAddHintEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleBuffHints(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleHealHPEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HealHpAudioVo> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HealHpAudioVo& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleHealHPEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleRebornEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_Reborn> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_Reborn& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleRebornEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleRescuedByTeammateEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RescuedFromNearDeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RescuedFromNearDeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleRescuedByTeammateEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

