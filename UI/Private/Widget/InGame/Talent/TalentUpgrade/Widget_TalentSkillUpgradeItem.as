
namespace UWidget_TalentUpgradeItem
{
    const int ViewID = 0;

}
class UWidget_TalentUpgradeItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentUpgradeItem> Item;
    UPROPERTY()
    UWidget w_img_Icon;
    UPROPERTY()
    UWidget w_btn_click;
    UPROPERTY()
    UWidget w_switcher_state;
    UPROPERTY()
    UWidget w_img_Icon_CanActived;
    UPROPERTY()
    UWidget w_img_IconActivated;
    UPROPERTY()
    UWidget w_img_IconGray;
    UPROPERTY()
    UWidgetAnimation Anim_Upgrade;
    FEUIModelWeakRef __Item;
    UPROPERTY()
    FGetEUIModelRef ItemDelegate;

    UWidget_TalentUpgradeItem()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UWidget GetAutoLineStateWidget()
    {
        UWidgetSwitcher local_2 = (Cast<UWidgetSwitcher>(this.w_switcher_state));
        if (local_2 != nullptr)
        {
            UWidget local_10 = local_2.GetActiveWidget();
            if (local_10 != nullptr)
            {
                return local_10;
            }
            if (local_2.GetNumWidgets() > 0)
            {
                UWidget local_16 = local_2.GetWidgetAtIndex(0);
                if (local_16 != nullptr)
                {
                    return local_16;
                }
            }
        }
        return nullptr;
    }
    UWidget GetAutoLineNodeWidget()
    {
        UWidget local_2 = this.GetAutoLineStateWidget();
        if (local_2 != nullptr)
        {
            return local_2;
        }
        if (this.w_btn_click != nullptr)
        {
            return this.w_btn_click;
        }
        if (this.w_switcher_state != nullptr)
        {
            return this.w_switcher_state;
        }
        return this.GetAutoLineAnchorWidget();
    }
    UWidget GetAutoLineStablePortWidget()
    {
        if (this.w_btn_click != nullptr)
        {
            return this.w_btn_click;
        }
        if (this.w_switcher_state != nullptr)
        {
            return this.w_switcher_state;
        }
        return this.GetAutoLineAnchorWidget();
    }
    UWidget GetAutoLineAnchorWidget()
    {
        UWidget local_2 = this.GetAutoLineStateWidget();
        if (local_2 != nullptr)
        {
            return local_2;
        }
        if (this.w_btn_click != nullptr)
        {
            return this.w_btn_click;
        }
        if (this.w_switcher_state != nullptr)
        {
            return this.w_switcher_state;
        }
        if (this.w_img_IconActivated != nullptr)
        {
            return this.w_img_IconActivated;
        }
        if (this.w_img_Icon_CanActived != nullptr)
        {
            return this.w_img_Icon_CanActived;
        }
        if (this.w_img_IconGray != nullptr)
        {
            return this.w_img_IconGray;
        }
        if (this.w_img_Icon != nullptr)
        {
            return this.w_img_Icon;
        }
        return this;
    }
    UFUNCTION()
    void OnUpgradeAnimIndexChanged()
    {
        if (GetUpgradeAnimIndex() > 0)
        {
            this.PlayAnimationForward(this.Anim_Upgrade, 1.0f, false);
        }
        return;
    }
    UFUNCTION()
    void Item_UnlockOrUpgradeTalent() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Item_ShowHover(const UWidget Widget) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Widget);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Item_OpenDetails() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Item_HideHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_TalentUpgradeItem& local_6;
        TEUIModelRef<FVM_TalentUpgradeItem> local_2 = this.Item.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.Item.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TalentUpgradeItem::__IndexOf_UpgradeAnimIndex());
                    }
                    if (local_6)
                    {
                        this.OnUpgradeAnimIndexChanged();
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
                XError(ELog(17), "Remaining observed model change: OnUpgradeAnimIndexChanged");
            }
            return;
        }
        this.__Item = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Item.Initialize(this, FName("VM_TalentUpgradeItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemDelegate.IsBound())
        {
            this.Item.SetRef(this.ItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentUpgradeItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnUpgradeAnimIndexChanged"));
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
