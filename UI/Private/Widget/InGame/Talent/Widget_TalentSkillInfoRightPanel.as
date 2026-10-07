
namespace UWidget_TalentSkillInfoRightPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TalentSkillInfoRightPanel : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentSkillInfoItem> TalentSkillInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentUpgradeConfirm> ConfirmVM;
    UPROPERTY()
    UScrollBox ContextScrollBox;
    UPROPERTY()
    bool bNeedAutoPlay;
    UPROPERTY()
    UEUIVideoPlayer VideoPlayer;
    UPROPERTY()
    UEUITextBlock DebugStateText;
    UPROPERTY()
    FEUIActionBinding UpgradeActionBinding;
    UPROPERTY()
    FEUIActionBinding ChangeChooseActionBinding;
    FEUIModelWeakRef __TalentSkillInfo;
    UPROPERTY()
    FGetEUIModelRef TalentSkillInfoDelegate;
    UPROPERTY()
    FGetEUIModelRef ConfirmVMDelegate;

    UWidget_TalentSkillInfoRightPanel()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.VideoPlayer != nullptr)
        {
            this.VideoPlayer.SetIsMuted(true);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (UICommonUtil::CVar_UI_DebugSkillVideoPlayer.GetBool())
        {
            const UMediaPlayer local_6 = this.VideoPlayer.GetMediaPlayerScript();
            if (local_6 == nullptr)
            {
                return;
            }
            FText local_14 = local_6.GetMediaName();
            FName local_18 = local_6.GetPlayerName();
            int local_20 = local_6.GetPlaylistIndex();
            float32 local_22 = local_6.GetRate();
            bool local_1 = local_6.HasError();
            bool local_23 = local_6.IsBuffering();
            bool local_24 = local_6.IsLooping();
            bool local_25 = local_6.IsPlaying();
            bool local_26 = local_6.IsClosed();
            bool local_27 = local_6.IsReady();
            FString local_40 = (FString("MediaName: ") + local_14);
            FString local_36 = (local_40 + " ViedoPlayerName: ");
            FString local_40_2 = (local_36 + local_18);
            FString local_36_2 = (local_40_2 + "  PlayListIndex:");
            FString local_40_3 = (local_36_2 + local_20);
            FString local_36_3 = (local_40_3 + "  Rate:");
            FString local_40_4 = (local_36_3 + local_22);
            FString local_36_4 = (local_40_4 + " bHasError:");
            FString local_40_5 = (local_36_4 + local_1);
            FString local_36_5 = (local_40_5 + "  bIsBuffering:");
            FString local_40_6 = (local_36_5 + local_23);
            FString local_36_6 = (local_40_6 + " bIsLooping:");
            FString local_40_7 = (local_36_6 + local_24);
            FString local_36_7 = (local_40_7 + "  bIsPlaying:");
            FString local_40_8 = (local_36_7 + local_25);
            FString local_36_8 = (local_40_8 + "   bIsClosed: ");
            FString local_40_9 = (local_36_8 + local_26);
            FString local_36_9 = (local_40_9 + "   bIsReady: ");
            System::PrintString(__GetWorldContext(), (local_36_9 + local_27), true, false, FLinearColor::Green, -1.0f, n"Debug_VideoPlayerWidget");
        }
        if (UICommonUtil::CVar_UI_DebugSkillVideoPlayer.GetBool())
        {
            this.DebugStateText.SetText(FText::FromString(this.VideoPlayer.GetPlaybackState()));
            this.DebugStateText.SetVisibility(ESlateVisibility(0));
            return;
        }
        this.DebugStateText.SetVisibility(ESlateVisibility(1));
        return;
    }
    UFUNCTION()
    void OnSkillChanged()
    {
        UMediaSource local_4 = GetSkillPreviewMovie();
        if (local_4 != nullptr)
        {
            this.VideoPlayer.SetVideo(local_4);
            if (this.bNeedAutoPlay)
            {
                this.VideoPlayer.PlayFromStart();
            }
        }
        this.RefreshUpgradeBtn();
        return;
    }
    UFUNCTION()
    void OnSkillLevelChanged()
    {
        this.RefreshUpgradeBtn();
        return;
    }
    UFUNCTION()
    void OnEquipChoiceChanged()
    {
        this.RefreshUpgradeBtn();
        return;
    }
    void RefreshUpgradeBtn()
    {
        bool local_8;
        if (GetIsUnlocked())
        {
            this.UpgradeActionBinding.SetOverrideDisplayText(NSLOCTEXT("Talent", "TalentUpgradeBtn", "й•їжЊ‰еЌ‡зє§жЉЂиѓЅ"));
        }
        else
        {
            this.UpgradeActionBinding.SetOverrideDisplayText(NSLOCTEXT("Talent", "TalentUnlockBtn", "й•їжЊ‰и§Јй”ЃжЉЂиѓЅ"));
        }
        bool local_1 = GetShowUpgradeBtn();
        this.UpgradeActionBinding.SetCollapsed(!(local_1));
        if (local_1)
        {
            bool local_7;
            local_7 = GetUpgradeBtnCostEnough();
            local_8 = !(local_7);
            this.UpgradeActionBinding.SetDisabled(local_8);
        }
        local_8 = GetIsUnlockedAndChoice() && GetIsUnequippedChoice();
        this.ChangeChooseActionBinding.SetCollapsed(!(local_8));
        return;
    }
    UFUNCTION()
    void TalentSkillInfo_ToggleDoubleStateTalent() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentSkillInfo_ConsumeRedDot() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentSkillInfo_OnAvatarSkillDetialSelect() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentSkillInfo_UnlockOrUpgradeTalent() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentSkillInfo_SwitchActiveChoiceTalent() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentSkillInfo_SwitchActiveSlot() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ConfirmVM_Confirm() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ConfirmVM_Cancel() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_TalentSkillInfoItem& local_6;
        TEUIModelRef<FVM_TalentSkillInfoItem> local_2 = this.TalentSkillInfo.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.TalentSkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_TalentSkillInfoItem::__IndexOf_TalentNode());
                }
                if (local_6)
                {
                    this.OnSkillChanged();
                }
                break;
            }
            case 1:
            {
                this.TalentSkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_TalentSkillInfoItem::__IndexOf_CurLevelForWidget());
                }
                if (local_6)
                {
                    this.OnSkillLevelChanged();
                }
                break;
            }
            case 2:
            {
                this.TalentSkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_TalentSkillInfoItem::__IndexOf_bIsShownChoiceEquipped());
                }
                if (local_6)
                {
                    this.OnEquipChoiceChanged();
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
                XError(ELog(17), "Remaining observed model change: OnSkillChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnSkillLevelChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnEquipChoiceChanged");
            }
            return;
        }
        this.__TalentSkillInfo = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TalentSkillInfo.Initialize(this, FName("VM_TalentSkillInfoItem"), EEUIWidgetRefModelCreationType(0), false);
        this.ConfirmVM.Initialize(this, FName("VM_TalentUpgradeConfirm"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TalentSkillInfoDelegate.IsBound())
        {
            this.TalentSkillInfo.SetRef(this.TalentSkillInfoDelegate.Execute());
        }
        if (this.ConfirmVMDelegate.IsBound())
        {
            this.ConfirmVM.SetRef(this.ConfirmVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentSkillInfoRightPanel
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSkillChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSkillLevelChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnEquipChoiceChanged"));
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
