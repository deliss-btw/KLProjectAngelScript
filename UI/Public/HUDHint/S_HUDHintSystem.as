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
        ::CommonPopup::SmallHintCustom(local_112.BuffSmallSideHintTitle, local_130.opImplConv(), 0);
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
        bool local_37;
        OutFormatted = Input;
        int local_1 = 0;
        int local_3 = 0;
        int local_4 = 0;
        while (OutFormatted.FindChar(int16(123), local_3))
        {
            int local_2 = OutFormatted.Find("{", ESearchCase(1), ESearchDir(0), local_3);
            if (local_2 == INDEX_NONE)
            {
                break;
            }
            int local_7 = OutFormatted.Find("}", ESearchCase(1), ESearchDir(0), local_2);
            if (local_7 == INDEX_NONE)
            {
                break;
            }
            FGameAttributeRef local_34 = FGameAttributeRef(FName(OutFormatted.Mid(local_2 + 1, ((local_7 - local_2) - 1))));
            local_37 = false;
            for (auto& local_52 : AttrValues)
            {
                if (local_52.Attribute.GetGlobalIndex() == local_34.GetGlobalIndex())
                {
                    FString local_56;
                    if (int(local_52.ValueShowType) == 0)
                    {
                        local_56 = FText::Format(FText::FromString("{0}%"), FText::AsNumber((local_52.Value * 100.0f), FNumberFormattingOptions())).ToString();
                    }
                    else
                    {
                        if (int(local_52.ValueShowType) == 1)
                        {
                            local_56 = FText::Format(FText::FromString("{0}"), FText::AsNumber(local_52.Value, FNumberFormattingOptions())).ToString();
                        }
                    }
                    OutFormatted = ((OutFormatted.Left(local_2) + local_56) + OutFormatted.Mid(local_7 + 1, 2147483647));
                    local_3 = local_2 + local_56.Len();
                    local_37 = true;
                    break;
                }
            }
            if (!(local_37))
            {
                break;
            }
        }
        Input.FindChar(int16(125), local_3);
        return;
    }
    UFUNCTION()
    void ClientJob_HandleBuffHints(const FCE_HUDBuffAddHintEvent &inout Event) const
    {
        bool local_69;
        TArray<FBuffModifierAttributeDescriptionInfos> local_4;
        int local_100 = 0;
        const UAttributeSettingsSettings local_330;
        int local_440 = 0;
        float32 local_653;
        const UUtilitySettings local_658;
        TArray<FTextArgument> local_8;
        Has local_12;
        Has local_98;
        if (!(local_12.opCall()))
        {
            if (FDataObjectPtr(TDataObjectPtr<FBuffConfig>(Event.BuffConfig).opArrow().PresentationConfig))
            {
                int local_76;
                int local_64;
                local_4.Empty(0);
                local_64 = 0;
                Has local_68;
                if (!(Event.BuffEntity.IsValid()) || !(local_68.opCall()))
                {
                    return;
                }
                for (auto& local_90 : local_76.GetBuffData())
                {
                    if (!(FECSEntity(local_90.BuffEntityId).IsValid()) || !(local_98.opCall()))
                    {
                        continue;
                    }
                    if (!(local_100.GetConfig().IsValid()))
                    {
                        continue;
                    }
                    if ((local_100.GetConfig().GetBuffName() == Event.BuffConfig.GetBuffName()))
                    {
                        local_64 = local_100.GetStackCount();
                        Make local_114;
                        local_8.Add(local_114.opImplConv());
                        local_4 = FBuffUtils::GetBuffModifierAttributeDescriptionInfos(TDataObjectPtr<FBuffConfig>(Event.BuffConfig).Get(), local_64);
                        break;
                    }
                }
                if (Event.bMetaBuff)
                {
                    TArray<uint> local_128;
                    if (!(::FASCommonUtils::GetUniquePlayerEntity(Event.BuffEntity).IsValid()))
                    {
                        local_69 = false;
                    }
                    else
                    {
                        Has local_136;
                        local_69 = local_136.opCall();
                    }
                    if (local_69)
                    {
                        int local_138;
                        for (auto& local_156 : local_138.GetMetaBuffs())
                        {
                            if (local_156.GetMetaBuffConfig().Get().BuffConfig.GetUniqueID() == Event.BuffConfig.GetUniqueID())
                            {
                                local_128 = local_156.GetModifiersDataIDs();
                            }
                        }
                        TArray<TDataObjectPtr<FGameplayModifierConfig>> local_164;
                        for (auto local_177 : local_128)
                        {
                            TDataObjectPtr<FGameplayModifierConfig> local_202 = ::FGameplayModifier::GetByDataId(local_177);
                            if (!((local_202 == nullptr)))
                            {
                                local_164.Add(local_202);
                            }
                        }
                        local_4.Append(FGameplayModifierUtils::GetModifierAttributeDescriptionBGameplayModifierConfig(local_164));
                    }
                }
                TDataObjectPtr<FBuffConfig> local_38 = TDataObjectPtr<FBuffConfig>(Event.BuffConfig);
                Make local_232;
                local_8.Add(local_232.opImplConv());
                TDataObjectPtr<FBuffPresentationConfig> local_256;
                FSoftBrush local_324 = FSoftBrush(local_256.opArrow().IconBrush);
                TArray<FBuffHintDescParamItem> local_328;
                GetGameplaySettings<UAttributeSettingsSettings> local_332;
                local_330 = local_332;
                if (!(local_256.opArrow().HintDescAdditional.IsEmpty()))
                {
                    FBuffHintDescParamItem local_388;
                    local_388.Icon = local_256.opArrow().HintDescAdditionalIcon;
                    FString local_392;
                    FBuffUtils::ParseModifierAttributeFormattedString(local_256.opArrow().HintDescAdditional.ToString(), local_392, TDataObjectPtr<FBuffConfig>(Event.BuffConfig).Get(), local_64);
                    local_388.Desc = FText::FromString(local_392);
                    local_388.bAdditional = true;
                    local_328.Add(local_388);
                }
                for (auto& local_414 : local_4)
                {
                    if (local_414.bUseDefaultDescription)
                    {
                        if (local_330.GetAttributeConfig(local_414.Attribute))
                        {
                            FBuffHintDescParamItem local_388;
                            TDataObjectPtr<FAttributeConfig> local_438 = local_330.GetAttributeConfig(local_414.Attribute);
                            if (UICommonUtil::CVar_UI_UseAttributePresentation.GetBool())
                            {
                                local_388.Icon = local_440.Presentation.GetIcon();
                            }
                            else
                            {
                                local_388.Icon = local_440.AttributeIcon;
                            }
                            TArray<FTextArgument> local_488;
                            FDataObjectPtr local_518 = local_330.GetAttributeConfig(local_414.Attribute).opImplConv();
                            Make local_494;
                            local_488.Add(local_494.opImplConv());
                            FInstancedStruct local_526 = FInstancedStruct::Make(local_414);
                            if (local_526.IsValid())
                            {
                                local_488.Add(FTextArgument(local_526));
                                local_388.Desc = ::MessageHintUtils::ParseText(local_256.opArrow().DefaultAttributeDesc, local_488);
                                local_328.Add(local_388);
                            }
                        }
                    }
                }
                FText local_400 = ::MessageHintUtils::ParseText(local_256.opArrow().DefaultLargeHintTile, local_8);
                FText local_542 = local_256.opArrow().bSmallSideHint ? ::MessageHintUtils::ParseText(local_256.opArrow().DefaultSmallHintTile, local_8) : FText();
                FBuffHintDescParamItemListParam local_648;
                local_648._base_FCommonLargeSideHintData = local_324;
                if (local_400.IsEmpty())
                {
                }
                else
                {
                }
                if (local_256.opArrow().HintLifeTimeOverride > 0.0f)
                {
                    local_653 = local_256.opArrow().HintLifeTimeOverride;
                }
                else
                {
                    local_653 = ::CommonPopupSettings::Get().DefaultLargeSideHintLifetime;
                }
                local_648.Lifetime = local_653;
                local_648.DescList.BuffHintDescParamItem = local_328;
                if (local_256.opArrow().bLargeSideHint)
                {
                    GetGameplaySettings<UUtilitySettings> local_660;
                    local_658 = local_660;
                    Make local_676;
                    ::CommonPopup::LargeHintCustom(local_658.BuffLargeSideHint, local_676.opImplConv(), 0);
                }
                FCommonHintParam local_692;
                local_692.LifetimeOverride = float32(local_648.Lifetime.ToSeconds());
                bool local_13 = local_256.opArrow().bSmallSideHint;
                if (local_13)
                {
                    if (int((TDataObjectPtr<FBuffConfig>(Event.BuffConfig)).opArrow().ClientPresentationType) == 2)
                    {
                        this.SmallHintWithBuffStack(local_648._base_FCommonLargeSideHintData._base_FCommonSideHintData.Icon, local_542, int(TDataObjectPtr<FBuffConfig>(Event.BuffConfig).opArrow().MaxBuffCount), local_64, local_692);
                    }
                    for (auto& local_708 : local_648.DescList.BuffHintDescParamItem)
                    {
                        ::CommonPopup::SmallHint(local_708.Icon, local_708.Desc, local_692, 0);
                    }
                }
                FCommonTipsParam local_712;
                local_712.LifetimeOverride = float32(local_648.Lifetime.ToSeconds());
                if (local_256.opArrow().bTipsHint)
                {
                    ::CommonPopup::Tips(local_648.Title, local_712);
                }
            }
        }
        return;
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

