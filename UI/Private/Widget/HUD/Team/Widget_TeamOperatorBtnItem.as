
namespace UWidget_TeamOperatorBtnItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TeamOperatorBtnItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TeamOperatorBtnItem> BunttonItem;
    UPROPERTY()
    UEUIImage w_img_Icon;
    UPROPERTY()
    UEUIImage w_img_hover;
    UPROPERTY()
    UWidget w_size_name;
    UPROPERTY()
    UEUITextBlock w_txt_name;
    FEUIModelWeakRef __BunttonItem;
    UPROPERTY()
    FGetEUIModelRef BunttonItemDelegate;

    UWidget_TeamOperatorBtnItem()
    {
        return;
    }
    UFUNCTION()
    void OnButtonTypeChanged()
    {
        this.UpdateButtonImage();
        return;
    }
    UFUNCTION()
    void OnButtonStateVersionChanged()
    {
        this.UpdateButtonImage();
        return;
    }
    UFUNCTION()
    void OnHover()
    {
        if ((this.w_img_hover != nullptr && ((this.w_size_name != nullptr))))
        {
            this.w_img_hover.SetVisibility(ESlateVisibility(0));
            this.w_size_name.SetVisibility(ESlateVisibility(0));
        }
        return;
    }
    UFUNCTION()
    void OnUnhover()
    {
        if ((this.w_img_hover != nullptr && ((this.w_size_name != nullptr))))
        {
            this.w_img_hover.SetVisibility(ESlateVisibility(1));
            this.w_size_name.SetVisibility(ESlateVisibility(1));
        }
        return;
    }
    void SetIconAndHover(const FOperatorBtnData &inout Data)
    {
        this.w_img_Icon.SetBrush(Data.Icon.LoadBrush());
        this.w_img_hover.SetBrush(Data.BtnHoverIcon.LoadBrush());
        this.w_txt_name.SetText(Data.ButtonText);
        return;
    }
    void UpdateButtonImage()
    {
        const UTeamSettings local_2;
        int local_21;
        GetGameplaySettings<UTeamSettings> local_4;
        local_2 = local_4;
        if (local_2 == nullptr)
        {
            return;
        }
        else
        {
            ETeamOperatorBtnType local_8;
            local_8 = GetButtonType();
            if (local_2.OperatorPlayerIconConfigs.Contains(local_8))
            {
                this.SetIconAndHover(local_2.OperatorPlayerIconConfigs[local_8]);
            }
            int local_10 = int(local_8);
            if (local_10 <= 2)
            {
                if (local_10 != 1)
                {
                    if (local_10 != 2)
                    {
                        return;
                    }
                }
                else
                {
                    TEUIModelWeakRef<FVM_TeamPanel> local_14;
                    TEUIModelWeakRef<FVM_TeamPanel> local_16;
                    local_16.GetTeamPanel();
                    if (!(local_14.IsValid()))
                    {
                        return;
                    }
                    else
                    {
                        ETeamListenState local_17;
                        int local_18 = int(GetListenState());
                        local_17 = ETeamListenState(local_18);
                        bool local_7 = IsSpecialMapForVoice();
                        if (local_7 && (int(local_17) != 0))
                        {
                            if (::FTeamUtils::GetIsInCityTeamState() || !(HasSocialTeam()))
                            {
                                local_18 = 3;
                                local_21 = local_18;
                            }
                            else
                            {
                                local_21 = local_17;
                            }
                            if (local_2.OperatorTeamMuteIconConfigs.Contains(ETeamListenState(local_21)))
                            {
                                this.SetIconAndHover(local_2.OperatorTeamMuteIconConfigs[ETeamListenState(local_21)]);
                            }
                        }
                        else
                        {
                            if (local_2.OperatorTeamMuteIconConfigs.Contains(local_17))
                            {
                                this.SetIconAndHover(local_2.OperatorTeamMuteIconConfigs[local_17]);
                            }
                        }
                        return;
                    }
                }
            }
        }
    }
    UFUNCTION()
    void BunttonItem_OnButtonClick(const UWidget Widget) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Widget);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_TeamOperatorBtnItem& local_6;
        TEUIModelRef<FVM_TeamOperatorBtnItem> local_2 = this.BunttonItem.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 1)
            {
                if (local_57 != 0)
                {
                    if (local_57 != 1)
                    {
                    }
                }
                else
                {
                    this.BunttonItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TeamOperatorBtnItem::__IndexOf_ButtonType());
                    }
                    if (local_6)
                    {
                        this.OnButtonTypeChanged();
                    }
                    this.BunttonItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TeamOperatorBtnItem::__IndexOf_VoiceStateVersion());
                    }
                    if (local_6)
                    {
                        this.OnButtonStateVersionChanged();
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
                XError(ELog(17), "Remaining observed model change: OnButtonTypeChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnButtonStateVersionChanged");
            }
            return;
        }
        this.__BunttonItem = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.BunttonItem.Initialize(this, FName("VM_TeamOperatorBtnItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.BunttonItemDelegate.IsBound())
        {
            this.BunttonItem.SetRef(this.BunttonItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TeamOperatorBtnItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnButtonTypeChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnButtonStateVersionChanged"));
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
