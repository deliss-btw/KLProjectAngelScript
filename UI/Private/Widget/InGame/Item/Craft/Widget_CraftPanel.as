
namespace UWidget_CraftableItem
{
    const int ViewID = 0;
}
namespace UWidget_CraftPanel
{
    const int ViewID = 0;

}
class UWidget_CraftableItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CraftableItem> Craft;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_RedDot> RedDot;
    UPROPERTY()
    FConfigVM_RedDot RedDotConfig;
    UPROPERTY()
    FGetEUIModelRef CraftDelegate;
    UPROPERTY()
    FGetEUIModelRef RedDotDelegate;

    UWidget_CraftableItem()
    {
        return;
    }
    UFUNCTION()
    TEUIModelRef<FVM_Item> Craft_Item() const
    {
        FVM_CraftableItem& local_2;
        TEUIModelRef<FVM_Item> local_10;
        if (local_2)
        {
            local_10 = local_2.GetItem();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_Item>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_ComposableItem> Craft_ComposableItem() const
    {
        FVM_CraftableItem& local_2;
        TEUIModelRef<FVM_ComposableItem> local_10;
        if (local_2)
        {
            local_10 = local_2.GetComposableItem();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_ComposableItem>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_SelectableItem> Craft_SelectableItem() const
    {
        FVM_CraftableItem& local_2;
        TEUIModelRef<FVM_SelectableItem> local_10;
        if (local_2)
        {
            local_10 = local_2.GetSelectableItem();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_SelectableItem>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_EquipmentInfo> Craft_Equipment() const
    {
        FVM_CraftableItem& local_2;
        TEUIModelRef<FVM_EquipmentInfo> local_10;
        if (local_2)
        {
            local_10 = local_2.GetEquipment();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_EquipmentInfo>();
        }
        return local_10;
    }
    UFUNCTION()
    void Craft_OnSelected() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Craft.Initialize(this, FName("VM_CraftableItem"), EEUIWidgetRefModelCreationType(0), false);
        this.RedDot.Initialize(this, FName("VM_RedDot"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CraftDelegate.IsBound())
        {
            this.Craft.SetRef(this.CraftDelegate.Execute());
        }
        if (this.RedDotDelegate.IsBound())
        {
            this.RedDot.SetRef(this.RedDotDelegate.Execute());
        }
        return;
    }
}

class UWidget_CraftPanel : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MenuPage> MenuPage;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemCraft> Craft;
    UPROPERTY()
    FEUIActionBinding CraftConfirmAS;
    UPROPERTY()
    FEUIActionBinding GamepadConfirmAS;
    UPROPERTY()
    UWidget_CommonConsume UI_Common_Consume;
    UPROPERTY()
    UEUICommonListView w_tile_Item;
    UPROPERTY()
    FConfigVM_MenuPage MenuPageConfig;
    UPROPERTY()
    FConfigVM_ItemCraft CraftConfig;
    FEUIModelWeakRef __Craft;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef MenuPageDelegate;
    UPROPERTY()
    FGetEUIModelRef CraftDelegate;

    UWidget_CraftPanel()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.Craft.IsValid() && ((this.w_tile_Item != nullptr)))
        {
            this.w_tile_Item.SetSelectedIndex(this.Craft.opArrow().GetRestoreSelectedCraftIndex());
        }
        return;
    }
    UFUNCTION()
    void OnSelectedCraftTypeIndexChanged()
    {
        if (this.Craft.IsValid() && ((this.w_tile_Item != nullptr)))
        {
            this.w_tile_Item.SetSelectedIndex(this.Craft.opArrow().GetRestoreSelectedCraftIndex());
        }
        return;
    }
    UFUNCTION()
    void RefreshCraftConfirmAction()
    {
        bool local_1 = false;
        bool local_3 = false;
        if (this.Craft.IsValid() && this.Craft.opArrow().GetCurrentCraft().IsValid())
        {
            local_1 = this.Craft.opArrow().GetbCurrentCraftUnlocked();
            local_3 = this.Craft.opArrow().GetbCanDoCurrentCraft();
        }
        this.CraftConfirmAS.SetCollapsed(!(local_1));
        this.CraftConfirmAS.SetDisabled(!(local_3));
        return;
    }
    UFUNCTION()
    void RefreshGamepadConfirmAction()
    {
        bool local_1 = false;
        if (this.Craft.IsValid() && this.Craft.opArrow().GetCurrentCraft().IsValid())
        {
            local_1 = this.Craft.opArrow().GetbCurrentCraftUnlocked();
        }
        this.GamepadConfirmAS.SetCollapsed(!(local_1));
        return;
    }
    UFUNCTION()
    void SwitchFocus()
    {
        if (this.Craft.IsValid() && (this.Craft.opArrow().GetSwitchFocusTrigger() > 0) && ((this.UI_Common_Consume != nullptr)))
        {
            this.RuleSetUserFocus(this.UI_Common_Consume);
        }
        return;
    }
    UFUNCTION()
    void Page_ClosePage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Page_CloseGroup() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    TEUIModelRef<FVM_QualitySelector> Craft_CraftQuality() const
    {
        FVM_ItemCraft& local_2;
        TEUIModelRef<FVM_QualitySelector> local_10;
        if (local_2)
        {
            local_10 = local_2.GetCraftQuality();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_QualitySelector>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_CraftableItem> Craft_CurrentCraft() const
    {
        FVM_ItemCraft& local_2;
        TEUIModelRef<FVM_CraftableItem> local_10;
        if (local_2)
        {
            local_10 = local_2.GetCurrentCraft();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_CraftableItem>();
        }
        return local_10;
    }
    UFUNCTION()
    TDataObjectPtr<FItemConfig> Craft_CurrentCraftItemConfig() const
    {
        FVM_ItemCraft& local_2;
        TDataObjectPtr<FItemConfig> local_52;
        if (local_2)
        {
            local_52 = local_2.GetCurrentCraftItemConfig();
        }
        else
        {
            local_52 = TDataObjectPtr<FItemConfig>();
        }
        return local_52;
    }
    UFUNCTION()
    bool Craft_bCanDoCurrentCraft() const
    {
        FVM_ItemCraft& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbCanDoCurrentCraft();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool Craft_bCurrentCraftUnlocked() const
    {
        FVM_ItemCraft& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbCurrentCraftUnlocked();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> Craft_AllCraftableItems() const
    {
        FVM_ItemCraft& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetAllCraftableItems());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> Craft_CraftConsumeRewards() const
    {
        FVM_ItemCraft& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetCraftConsumeRewards());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TEUIModelRef<FVM_CommonItem> Craft_CurrentCommonItem() const
    {
        FVM_ItemCraft& local_2;
        TEUIModelRef<FVM_CommonItem> local_10;
        if (local_2)
        {
            local_10 = local_2.GetCurrentCommonItem();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_CommonItem>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_CommonConsume> Craft_CurrentCommonConsume() const
    {
        FVM_ItemCraft& local_2;
        TEUIModelRef<FVM_CommonConsume> local_10;
        if (local_2)
        {
            local_10 = local_2.GetCurrentCommonConsume();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_CommonConsume>();
        }
        return local_10;
    }
    UFUNCTION()
    FSlateBrush Craft_CurrentCraftItemIcon() const
    {
        FVM_ItemCraft& local_2;
        FSlateBrush local_136 = local_2 ? local_2.CurrentCraftItemIcon() : FSlateBrush();
        return local_136;
    }
    UFUNCTION()
    bool Craft_CurrentCraftIsLocked() const
    {
        FVM_ItemCraft& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetCurrentCraftIsLocked();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    int Craft_CurrentCraftSwitcherIndex() const
    {
        FVM_ItemCraft& local_2;
        return local_2 ? local_2.GetCurrentCraftSwitcherIndex() : 0;
    }
    UFUNCTION()
    void Craft_DoCraft() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Craft_SetCurrentCraftTypeIndex(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Craft_SwitchFocus() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_ItemCraft& local_6;
        TEUIModelRef<FVM_ItemCraft> local_2 = this.Craft.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.Craft.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_ItemCraft::__IndexOf_SelectedCraftTypeIndex());
                }
                if (local_6)
                {
                    this.OnSelectedCraftTypeIndexChanged();
                }
                break;
            }
            case 1:
            {
                this.Craft.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_ItemCraft::__IndexOf_bCanDoCurrentCraft());
                    local_6.TrackPropertyRead(::FVM_ItemCraft::__IndexOf_bCurrentCraftUnlocked());
                }
                if (local_6)
                {
                    this.RefreshCraftConfirmAction();
                }
                break;
            }
            case 2:
            {
                this.Craft.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_ItemCraft::__IndexOf_bCurrentCraftUnlocked());
                }
                if (local_6)
                {
                    this.RefreshGamepadConfirmAction();
                }
                break;
            }
            case 3:
            {
                this.Craft.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_ItemCraft::__IndexOf_SwitchFocusTrigger());
                }
                if (local_6)
                {
                    this.SwitchFocus();
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
                XError(ELog(17), "Remaining observed model change: OnSelectedCraftTypeIndexChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: RefreshCraftConfirmAction");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: RefreshGamepadConfirmAction");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: SwitchFocus");
            }
            return;
        }
        this.__Craft = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.MenuPage.Initialize(this, FName("VM_MenuPage"), EEUIWidgetRefModelCreationType(0), false);
        this.Craft.Initialize(this, FName("VM_ItemCraft"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.MenuPageDelegate.IsBound())
        {
            this.MenuPage.SetRef(this.MenuPageDelegate.Execute());
        }
        if (this.CraftDelegate.IsBound())
        {
            this.Craft.SetRef(this.CraftDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CraftableItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
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
namespace UWidget_CraftPanel
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedCraftTypeIndexChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("RefreshCraftConfirmAction"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("RefreshGamepadConfirmAction"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("SwitchFocus"));
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
