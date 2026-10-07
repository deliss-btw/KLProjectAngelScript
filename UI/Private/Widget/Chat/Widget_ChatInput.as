
namespace UWidget_ChatInput
{
    const int ViewID = 0;

}
class UWidget_ChatInput : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ChatInputPanel> ChatInputPanel;
    UPROPERTY()
    UEditableTextBox EditInput;
    UPROPERTY()
    FEUIActionBinding AB_EnterInput;
    float ChatSubmitSameContentCooldownSec = 0.35;
    float LastChatSubmitSuccessGameTime = -10000000000.0;
    FString LastSubmittedTrimmedForCooldown;
    FTimerHandle ChatInputWeakTipDeferTimerHandle;
    FText PendingChatLengthWeakTipText;
    bool bChatCharLimitCacheValid = false;
    bool bChatCharNumCheckEnabled = false;
    int CachedChatCharNumMax = 0;
    int CachedChatNonAsciiWeight = 2;
    FText CachedChatLargerThanMaxTip;
    bool bApplyingCharLimitClamp = false;
    bool bCharNumOverLimitWeakTipIssued = false;
    FEUIModelWeakRef __ChatInputPanel;
    UPROPERTY()
    FGetEUIModelRef ChatInputPanelDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.SetInputFocus();
        this.RefreshEnterInputActionVisibility();
        if (!(this.ChatInputPanel.IsValid()) || (!((this.EditInput != nullptr))))
        {
            return;
        }
        this.RefreshChatCharNumLimitCache();
        this.bCharNumOverLimitWeakTipIssued = false;
        this.EditInput.SetText(FText::FromString(GetTempInputText()));
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.ChatInputWeakTipDeferTimerHandle);
        this.bChatCharLimitCacheValid = false;
        this.bCharNumOverLimitWeakTipIssued = false;
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        this.RefreshEnterInputActionVisibility();
        return;
    }
    UFUNCTION()
    void OnInputStateIndexChanged(const int Idx)
    {
        this.SetInputFocus();
        return;
    }
    UFUNCTION()
    void OnChatInputFocusRequested()
    {
        this.SetInputFocus();
        return;
    }
    UFUNCTION()
    void OnAlreadyInputTextChanged()
    {
        if (!(this.ChatInputPanel.IsValid()) || (!((this.EditInput != nullptr))))
        {
            return;
        }
        this.EditInput.SetText(FText::FromString(GetTempInputText()));
        return;
    }
    UFUNCTION()
    void OnInputTextChanged(const FText &inout Text)
    {
        if (!(this.ChatInputPanel.IsValid()))
        {
            return;
        }
        if (this.bApplyingCharLimitClamp)
        {
            this.ChatInputPanel.opArrow().OnInputTextChanged(Text);
            this.bApplyingCharLimitClamp = false;
            return;
        }
        if (!(this.bChatCharLimitCacheValid))
        {
            this.RefreshChatCharNumLimitCache();
        }
        FString local_10 = Text.ToString();
        FString local_14 = local_10;
        if (this.bChatCharNumCheckEnabled)
        {
            local_14 = this.ClampRawToChatCharLimit(local_10);
        }
        if ((!((local_14 == local_10))))
        {
            if (!(this.bCharNumOverLimitWeakTipIssued) && !(this.CachedChatLargerThanMaxTip.IsEmpty()))
            {
                this.PendingChatLengthWeakTipText = this.CachedChatLargerThanMaxTip;
                System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.ChatInputWeakTipDeferTimerHandle);
                this.ChatInputWeakTipDeferTimerHandle = System::SetTimer(this, n"PublishDeferredChatLengthWeakTip", 0.001f, false, false, 0.0f, 0.0f);
                this.bCharNumOverLimitWeakTipIssued = true;
            }
            this.bApplyingCharLimitClamp = true;
            if (this.EditInput != nullptr)
            {
                this.EditInput.SetText(FText::FromString(local_14));
            }
            if (this.bApplyingCharLimitClamp)
            {
                this.ChatInputPanel.opArrow().OnInputTextChanged(FText::FromString(local_14));
                this.bApplyingCharLimitClamp = false;
            }
            return;
        }
        if (this.bChatCharNumCheckEnabled && this.IsRawWithinChatCharNumLimit(local_10))
        {
            this.bCharNumOverLimitWeakTipIssued = false;
        }
        this.ChatInputPanel.opArrow().OnInputTextChanged(FText::FromString(local_14));
        return;
    }
    UFUNCTION()
    void PublishDeferredChatLengthWeakTip()
    {
        int local_12 = 0;
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.ChatInputWeakTipDeferTimerHandle);
        if (!(this.ChatInputPanel.IsValid()))
        {
            return;
        }
        FEUIModelRef local_10;
        local_10;
        FEUIMessageBus::Publish(EUIMessageBus);
        local_12.Content = this.PendingChatLengthWeakTipText;
        return;
    }
    UFUNCTION()
    void OnInputTextCommitted(const FText &in Text, const ETextCommit CommitMethod)
    {
        bool local_1 = !(this.ChatInputPanel.IsValid());
        if (local_1)
        {
            return;
        }
        if (int(CommitMethod) == 1)
        {
            FString local_12 = Text.ToString();
            this.ChatInputPanel.opArrow().SetTempInputText(local_12);
            FString local_8 = local_12.TrimStartAndEnd();
            FText local_20;
            bool local_1_2 = !(::ChatSystemUtil::TryValidateChatTextForSend(local_8, local_20));
            if (local_1_2)
            {
                this.PendingChatLengthWeakTipText = local_20;
                System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.ChatInputWeakTipDeferTimerHandle);
                this.ChatInputWeakTipDeferTimerHandle = System::SetTimer(this, n"PublishDeferredChatLengthWeakTip", 0.001f, false, false, 0.0f, 0.0f);
                return;
            }
            UWorld local_30 = this.GetWorld();
            bool local_1_3 = !((local_30 != nullptr));
            if (local_1_3)
            {
                return;
            }
            float local_36 = local_30.GetTimeSeconds();
            if ((local_8 == this.LastSubmittedTrimmedForCooldown) && ((local_36 - this.LastChatSubmitSuccessGameTime) < this.ChatSubmitSameContentCooldownSec))
            {
                return;
            }
            bool local_1_4 = this.ChatInputPanel.opArrow().TryCommitInputText();
            if (local_1_4)
            {
                this.LastChatSubmitSuccessGameTime = local_36;
                this.LastSubmittedTrimmedForCooldown = local_8;
                this.OnAlreadyInputTextChanged();
                this.SetInputFocus();
                return;
            }
        }
        return;
    }
    void InputCommitThenFocusInput()
    {
        if (this.ChatInputPanel.IsValid() && (GetInputStateIndex() == 0))
        {
            if (this.EditInput != nullptr && (int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer())) != 1))
            {
                this.RuleSetUserFocus(this.EditInput);
            }
        }
        return;
    }
    UFUNCTION()
    void OnChatEnterInput()
    {
        this.InputCommitThenFocusInput();
        return;
    }
    void RefreshEnterInputActionVisibility()
    {
        this.AB_EnterInput.SetCollapsed((this.EditInput != nullptr) && this.EditInput.HasKeyboardFocus());
        return;
    }
    void RefreshChatCharNumLimitCache()
    {
        const UChatSettings local_8;
        this.bChatCharLimitCacheValid = true;
        this.bChatCharNumCheckEnabled = false;
        this.CachedChatCharNumMax = 0;
        this.CachedChatNonAsciiWeight = 2;
        FText local_6;
        this.CachedChatLargerThanMaxTip = local_6;
        GetGameplaySettings<UChatSettings> local_10;
        local_8 = local_10;
        FStringCheckerConfig local_56;
        if (!(::ChatSystemUtil::TryGetChatStringCheckerFromSettings(local_8, local_56)) || !(local_56.CharNum.bEnable))
        {
            return;
        }
        FStringCheckerCharNumConfig local_60 = local_56.CharNum;
        this.bChatCharNumCheckEnabled = true;
        this.CachedChatCharNumMax = int(local_60.MaxNum);
        this.CachedChatNonAsciiWeight = int(local_60.NonAsciiCharCountNum);
        this.CachedChatLargerThanMaxTip = ::ChatSystemUtil::FormatCharNumCheckerError(local_60.LargerThanMaxNumErrorMessage, int(local_60.MinNum), int(local_60.MaxNum));
        return;
    }
    bool IsRawWithinChatCharNumLimit(const FString &inout Raw)
    {
        if (!(this.bChatCharNumCheckEnabled))
        {
            return true;
        }
        if (String::Len(Raw) > this.CachedChatCharNumMax)
        {
            return false;
        }
        return (::ChatSystemUtil::GetChatWeightedCharLength(Raw, this.CachedChatNonAsciiWeight) <= this.CachedChatCharNumMax);
    }
    FString ClampRawToChatCharLimit(const FString &inout Raw)
    {
        int local_12;
        if (!(this.bChatCharNumCheckEnabled) || ((this.CachedChatCharNumMax <= 0)))
        {
            return Raw;
        }
        int local_2 = String::Len(Raw);
        int local_6 = 0;
        int local_7 = 0;
        int local_8 = 0;
        int local_9 = 0;
        for (; local_9 < local_2; ++local_9)
        {
            int local_3 = String::GetCharacterAsNumber(Raw, local_9);
            local_12 = local_3 > 255 ? this.CachedChatNonAsciiWeight : 1;
            if ((local_7 + 1) > this.CachedChatCharNumMax || (((local_8 + local_12) > this.CachedChatCharNumMax)))
            {
                break;
            }
            local_6 = local_9 + 1;
            ++local_7;
            local_8 = local_8 + local_12;
            if (local_3 >= 55296 && (local_3 <= 56319) && ((local_9 + 1) < local_2))
            {
                ++local_9;
                local_6 = local_9 + 1;
            }
        }
        if (local_6 >= local_2)
        {
            return Raw;
        }
        return Raw.Mid(0, local_6);
    }
    void SetInputFocus()
    {
        if (this.ChatInputPanel.IsValid() && (GetInputStateIndex() == 0))
        {
            if (this.EditInput != nullptr && (int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer())) != 1))
            {
                return;
            }
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_ChatInputPanel& local_6;
        TEUIModelRef<FVM_ChatInputPanel> local_2 = this.ChatInputPanel.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.ChatInputPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_ChatInputPanel::__IndexOf_InputStateIndex());
                }
                if (local_6)
                {
                    this.OnInputStateIndexChanged(local_6.GetInputStateIndex());
                }
                break;
            }
            case 1:
            {
                this.ChatInputPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_ChatInputPanel::__IndexOf_InputFocusRequestNonce());
                }
                if (local_6)
                {
                    this.OnChatInputFocusRequested();
                }
                break;
            }
            case 2:
            {
                this.ChatInputPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_ChatInputPanel::__IndexOf_AlreadyInputText());
                }
                if (local_6)
                {
                    this.OnAlreadyInputTextChanged();
                }
            }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnInputStateIndexChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnChatInputFocusRequested");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnAlreadyInputTextChanged");
            }
            return;
        }
        this.__ChatInputPanel = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ChatInputPanel.Initialize(this, FName("VM_ChatInputPanel"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ChatInputPanelDelegate.IsBound())
        {
            this.ChatInputPanel.SetRef(this.ChatInputPanelDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ChatInput
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnInputStateIndexChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnChatInputFocusRequested"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnAlreadyInputTextChanged"));
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
