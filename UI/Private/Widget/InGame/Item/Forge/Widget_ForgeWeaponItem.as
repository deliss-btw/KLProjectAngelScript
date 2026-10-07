
namespace UWidget_ForgeWeaponItem
{
    const int ViewID = 0;

}
class UWidget_ForgeWeaponItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ForgeWeaponItem> Item;
    UPROPERTY()
    UWidget_ComposableItem UI_Common_ComposableItem;
    FEUIModelWeakRef __Item;
    UPROPERTY()
    FGetEUIModelRef ItemDelegate;

    UWidget_ForgeWeaponItem()
    {
        return;
    }
    UFUNCTION()
    void OnAddedToFocusPath_Implementation(const FFocusEvent &inout InFocusEvent)
    {
        if (int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer())) != 1)
        {
            return;
        }
        if (int(InFocusEvent.GetCause()) != 1)
        {
            return;
        }
        if (!(this.Item.IsValid()) || GetbSelected())
        {
            return;
        }
        OnItemClicked();
        return;
    }
    UWidget GetAutoLineAnchorWidget()
    {
        if (this.UI_Common_ComposableItem != nullptr)
        {
            return this.UI_Common_ComposableItem;
        }
        return this;
    }
    UFUNCTION()
    void HandleItemSelectedChanged(const bool bSelected)
    {
        bool local_1;
        if (!(this.Item.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            TEUIModelRef<FVM_ComposableItem> local_4;
            local_4.GetComposableItemVM();
            local_1 = local_4.IsValid();
        }
        if (local_1)
        {
            TEUIModelRef<FVM_ComposableItem> local_4;
            local_4.GetComposableItemVM();
            ::ComposableItemUtility::SetItemCustomSelection(FEUIModelContainer(), bSelected);
        }
        return;
    }
    UFUNCTION()
    void Item_OnItemClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_ForgeWeaponItem& local_6;
        TEUIModelRef<FVM_ForgeWeaponItem> local_2 = this.Item.AsRef();
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
                        local_6.TrackPropertyRead(::FVM_ForgeWeaponItem::__IndexOf_bSelected());
                    }
                    if (local_6)
                    {
                        this.HandleItemSelectedChanged(local_6.GetbSelected());
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
                XError(ELog(17), "Remaining observed model change: HandleItemSelectedChanged");
            }
            return;
        }
        this.__Item = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Item.Initialize(this, FName("VM_ForgeWeaponItem"), EEUIWidgetRefModelCreationType(0), false);
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

namespace UWidget_ForgeWeaponItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleItemSelectedChanged"));
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
