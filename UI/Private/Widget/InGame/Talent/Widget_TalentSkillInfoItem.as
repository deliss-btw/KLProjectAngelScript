
namespace UWidget_TalentSkillInfoItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TalentSkillInfoItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentSkillInfoItem> TalentSkillInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> SelectableItem;
    UPROPERTY()
    UScrollBox ContextScrollBox;
    UPROPERTY()
    UWidget_TalentSkillEditPage OwnerEditPage;
    UPROPERTY()
    bool bNeedAutoPlay;
    UPROPERTY()
    UEUIVideoPlayer VideoPlayer;
    UPROPERTY()
    UWidget ContentRoot;
    UPROPERTY()
    UTextBlock DebugStateText;
    UPROPERTY()
    UWidget_CommonBigItemBg UI_Common_Comp_BigItem_Bg;
    bool bDesiredPlaying = false;
    FEUIModelWeakRef __TalentSkillInfo;
    FEUIModelWeakRef __SelectableItem;
    UPROPERTY()
    FGetEUIModelRef TalentSkillInfoDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectableItemDelegate;


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
        if (UICommonUtil::CVar_UI_DebugSkillVideoPlayer.GetBool() && GetbIsSelected())
        {
            bool local_1;
            const UMediaPlayer local_6 = this.VideoPlayer.GetMediaPlayerScript();
            if (local_6 == nullptr)
            {
                return;
            }
            FText local_14 = local_6.GetMediaName();
            FName local_18 = local_6.GetPlayerName();
            int local_20 = local_6.GetPlaylistIndex();
            float32 local_22 = local_6.GetRate();
            local_1 = local_6.HasError();
            bool local_2 = local_6.IsBuffering();
            bool local_23 = local_6.IsLooping();
            bool local_24 = local_6.IsPlaying();
            bool local_25 = local_6.IsClosed();
            bool local_26 = local_6.IsReady();
            FString local_40 = (FString("MediaName: ") + local_14);
            FString local_40_2 = ((local_40 + " ViedoPlayerName: ") + local_18);
            FString local_36_2 = (local_40_2 + "  PlayListIndex:");
            FString local_40_3 = (local_36_2 + local_20);
            FString local_36_3 = (local_40_3 + "  Rate:");
            FString local_40_4 = (local_36_3 + local_22);
            FString local_36_4 = (local_40_4 + " bHasError:");
            FString local_40_5 = (local_36_4 + local_1);
            FString local_36_5 = (local_40_5 + "  bIsBuffering:");
            FString local_40_6 = (local_36_5 + local_2);
            FString local_36_6 = (local_40_6 + " bIsLooping:");
            FString local_40_7 = (local_36_6 + local_23);
            FString local_36_7 = (local_40_7 + "  bIsPlaying:");
            FString local_40_8 = (local_36_7 + local_24);
            FString local_36_8 = (local_40_8 + "   bIsClosed: ");
            FString local_40_9 = (local_36_8 + local_25);
            FString local_36_9 = (local_40_9 + "   bIsReady: ");
            System::PrintString(__GetWorldContext(), (local_36_9 + local_26), true, false, FLinearColor::Green, -1.0f, n"Debug_VideoPlayerWidget");
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
    UScrollBox GetContextScrollBox()
    {
        return this.ContextScrollBox;
    }
    void SetOwnerEditPage(const UWidget_TalentSkillEditPage InOwnerEditPage)
    {
        return;
    }
    void RefreshVideoPlayback(const bool bRestart)
    {
        if (this.VideoPlayer == nullptr)
        {
            return;
        }
        bool local_5 = this.bNeedAutoPlay || (this.SelectableItem.IsValid() && GetbIsSelected());
        if (local_5)
        {
            if ((bRestart || !(this.bDesiredPlaying)))
            {
                this.VideoPlayer.PlayFromStart();
            }
        }
        else
        {
            if (this.bDesiredPlaying)
            {
                this.VideoPlayer.Pause();
            }
        }
        this.bDesiredPlaying = local_5;
        return;
    }
    UFUNCTION()
    void OnSkillChanged()
    {
        UMediaSource local_4 = GetSkillPreviewMovie();
        if (local_4 != nullptr)
        {
            this.VideoPlayer.SetVideo(local_4);
            this.RefreshVideoPlayback(true);
        }
        return;
    }
    UFUNCTION()
    void OnHoverTalentDetailsChange(const bool bVisible)
    {
        int local_1;
        if (bVisible)
        {
            int local_2;
            local_2 = 0;
            local_1 = local_2;
        }
        else
        {
            int local_2;
            local_2 = 1;
            local_1 = local_2;
        }
        this.ContentRoot.SetVisibility(ESlateVisibility(local_1));
        return;
    }
    UFUNCTION()
    void OnSelectChanged(const bool bSelect)
    {
        if (bSelect && this.TalentSkillInfo.IsValid())
        {
            ConsumeRedDot();
        }
        if (this.UI_Common_Comp_BigItem_Bg != nullptr)
        {
            this.UI_Common_Comp_BigItem_Bg.SetSelected(bSelect);
        }
        this.RefreshVideoPlayback(false);
        if (this.OwnerEditPage != nullptr && ((this.ContextScrollBox != nullptr)))
        {
            if (bSelect)
            {
                this.OwnerEditPage.OnItemSelected(this.ContextScrollBox);
                return;
            }
            this.OwnerEditPage.OnItemDeselected(this.ContextScrollBox);
        }
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
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_TalentSkillInfoItem& local_6;
        FVM_SelectableItem& local_12;
        TEUIModelRef<FVM_TalentSkillInfoItem> local_2 = this.TalentSkillInfo.AsRef();
        TEUIModelRef<FVM_SelectableItem> local_8 = this.SelectableItem.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_62 = FEUIReactiveSubscriberTrackScope(It);
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
                    local_6.TrackPropertyRead(::FVM_TalentSkillInfoItem::__IndexOf_bVisible());
                }
                if (local_6)
                {
                    this.OnHoverTalentDetailsChange(local_6.GetbVisible());
                }
                break;
            }
            case 2:
            {
                this.SelectableItem.TrackRead();
                if (local_12)
                {
                    local_12.TrackPropertyRead(::FVM_SelectableItem::__IndexOf_bIsSelected());
                }
                if (local_12)
                {
                    this.OnSelectChanged(local_12.GetbIsSelected());
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
                XError(ELog(17), "Remaining observed model change: OnHoverTalentDetailsChange");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnSelectChanged");
            }
            return;
        }
        this.__TalentSkillInfo = local_2.opImplConv();
        this.__SelectableItem = local_8.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TalentSkillInfo.Initialize(this, FName("VM_TalentSkillInfoItem"), EEUIWidgetRefModelCreationType(0), false);
        this.SelectableItem.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TalentSkillInfoDelegate.IsBound())
        {
            this.TalentSkillInfo.SetRef(this.TalentSkillInfoDelegate.Execute());
        }
        if (this.SelectableItemDelegate.IsBound())
        {
            this.SelectableItem.SetRef(this.SelectableItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentSkillInfoItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSkillChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnHoverTalentDetailsChange"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectChanged"));
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
