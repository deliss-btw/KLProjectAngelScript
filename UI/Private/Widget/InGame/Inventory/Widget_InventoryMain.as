namespace UWidget_InventoryMain
{
    const int ViewID = 0;
}
namespace UWidget_InventoryMainItem
{
    const int ViewID = 0;

}
class UWidget_InventoryMain : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_InventoryMain> InventoryMain;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CloseVisibilityState> VisibilityState;
    UPROPERTY()
    FEUIActionBinding CloseBinding;
    UPROPERTY()
    FEUIActionBinding SwitchFocusActionBinding;
    UPROPERTY()
    FEUIActionBinding ConfirmSortActionBinding;
    UPROPERTY()
    UEUICommonListView w_list_tab;
    UPROPERTY()
    UEUICommonListView w_tile_Item;
    UPROPERTY()
    UEUIDynamicEntryBox w_entry_CurrencyColumn;
    UPROPERTY()
    UWidget HorizontalBox_0;
    UPROPERTY()
    UWidget UI_Inventory_Main_PropsQuickAssembly;
    UPROPERTY()
    UWidget UI_Common_Hover_ItemTips;
    UPROPERTY()
    UWidget w_anchor_ItemTip;
    UPROPERTY()
    ECommonHoverLayout SharedItemAndCurrencyHoverLayout = ECommonHoverLayout(1);
    FEUIModelWeakRef __InventoryMain;
    FEUIModelWeakRef __VisibilityState;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef InventoryMainDelegate;
    UPROPERTY()
    FGetEUIModelRef VisibilityStateDelegate;

    UFUNCTION()
    void OnInitialized_Implementation()
    {
        if (this.w_list_tab != nullptr)
        {
            this.w_list_tab.BP_OnItemClicked.AddUFunction(this, n"OnRootCategoryClicked");
            this.w_list_tab.BP_OnItemSelectionChanged.AddUFunction(this, n"OnRootCategorySelectionChanged");
        }
        if (this.w_tile_Item != nullptr)
        {
            this.w_tile_Item.BP_OnItemSelectionChanged.AddUFunction(this, n"OnItemSelectionChanged");
        }
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.RefreshCloseBindingVisibility();
        if (this.InventoryMain.IsValid())
        {
            this.InventoryMain.Get().SetupQuickSlots(this);
        }
        this.ApplySharedHoverAnchorToItemModels();
        this.ApplySharedHoverAnchorToCurrencyModels();
        this.ApplySharedHoverAnchorToExistingItemWidgets();
        this.ApplySharedHoverAnchorToExistingCurrencyWidgets();
        this.SyncItemTileSelectionAndFocus();
        this.RefreshInventoryActionBindings();
        return;
    }
    UFUNCTION()
    void HandleRelatedFocusChanged_Implementation()
    {
        if (!(this.IsInFocusPath()))
        {
            return;
        }
        this.ClearItemSelectionForExternalFocus();
        this.RefreshInventoryActionBindings();
        return;
    }
    UFUNCTION()
    void OnSelectListOpenChanged(const bool bIsOpen)
    {
        this.RefreshCloseBindingVisibility();
        return;
    }
    UFUNCTION()
    void OnSwitchFocusAction()
    {
        UWidget local_6;
        if ((this.w_tile_Item == nullptr || ((this.HorizontalBox_0 == nullptr))))
        {
            return;
        }
        if (this.IsPartOfFocusPath(this.w_tile_Item))
        {
            local_6 = this.HorizontalBox_0;
        }
        else
        {
            local_6 = this.w_tile_Item;
        }
        this.RuleSetUserFocus(local_6);
        this.RefreshInventoryActionBindings();
        return;
    }
    UFUNCTION()
    void OnConfirmSortAction()
    {
        if (this.InventoryMain.IsValid() && this.InventoryMain.Get().ShouldShowFilterAndSorter())
        {
            this.InventoryMain.Get().ConfirmSort();
        }
        return;
    }
    void RefreshInventoryActionBindings()
    {
        bool local_2 = this.InventoryMain.IsValid() && this.InventoryMain.Get().ShouldShowFilterAndSorter();
        this.SwitchFocusActionBinding.SetCollapsed(!(local_2));
        this.ConfirmSortActionBinding.SetCollapsed(!(local_2));
        bool local_3 = (this.HorizontalBox_0 != nullptr) && this.IsPartOfFocusPath(this.HorizontalBox_0);
        bool local_1 = (this.w_tile_Item != nullptr) && this.IsPartOfFocusPath(this.w_tile_Item);
        if (!(local_1) && !(local_3) && !(this.IsInFocusPath()))
        {
            local_1 = true;
        }
        FText local_22 = local_1 ? NSLOCTEXT("InventoryMain", "SwitchFocusToFilterSorter", "筛选排序") : NSLOCTEXT("InventoryMain", "SwitchFocusToItemList", "道具列表");
        this.SwitchFocusActionBinding.SetOverrideDisplayText(local_22);
        return;
    }
    UFUNCTION()
    void OnCurrentDisplayItemsChanged()
    {
        this.ApplySharedHoverAnchorToItemModels();
        this.ApplySharedHoverAnchorToExistingItemWidgets();
        this.SyncItemTileSelectionAndFocus();
        this.RefreshInventoryActionBindings();
        return;
    }
    UFUNCTION()
    void OnSelectedItemIndexChanged()
    {
        this.SyncItemTileSelectionAndFocus();
        return;
    }
    UFUNCTION()
    void OnItemBarItemsChanged()
    {
        this.ApplySharedHoverAnchorToCurrencyModels();
        this.ApplySharedHoverAnchorToExistingCurrencyWidgets();
        return;
    }
    UFUNCTION()
    void OnRootCategoryClicked(const FEUIModelContainer &inout Item)
    {
        FVM_InventoryMainRootCategory& local_6 = FEUIModelContainer::GetModel(Item).opCall();
        if (local_6)
        {
            local_6.Select();
        }
        return;
    }
    UFUNCTION()
    void OnRootCategorySelectionChanged(const FEUIModelContainer &inout Item, const bool bIsSelected)
    {
        if (!(bIsSelected))
        {
            return;
        }
        this.OnRootCategoryClicked(Item);
        return;
    }
    UFUNCTION()
    void OnItemSelectionChanged(const FEUIModelContainer &inout Item, const bool bIsSelected)
    {
        if (!(bIsSelected) || !(this.InventoryMain.IsValid()))
        {
            return;
        }
        TEUIModelRef<FVM_InventoryMainItem> local_4 = TEUIModelRef<FVM_InventoryMainItem>(FEUIModelContainer::GetModel(Item).opCall());
        if (!(local_4.IsValid()))
        {
            this.InventoryMain.Get().ClearSelection();
            return;
        }
        this.InventoryMain.Get().SelectItemIndex(this.InventoryMain.Get().GetCurrentDisplayItems().IndexOfByKey(local_4));
        return;
    }
    UFUNCTION()
    void ApplyCurrencyBarHoverAnchor(const UWidget_CommonItemBar ItemBar)
    {
        if (ItemBar != nullptr)
        {
            ItemBar.ApplySharedHoverAnchor(this.GetSharedHoverAnchor(), this.SharedItemAndCurrencyHoverLayout);
        }
        return;
    }
    UFUNCTION()
    void ApplyItemHoverAnchor(const UWidget_InventoryMainItem ItemWidget)
    {
        if (ItemWidget != nullptr)
        {
            ItemWidget.ApplySharedHoverAnchor(this.GetSharedHoverAnchor(), this.SharedItemAndCurrencyHoverLayout);
        }
        return;
    }
    void ApplySharedHoverAnchorToItemModels()
    {
        if (!(this.InventoryMain.IsValid()))
        {
            return;
        }
        UWidget local_4 = this.GetSharedHoverAnchor();
        for (auto& local_20 : this.InventoryMain.Get().GetCurrentDisplayItems())
        {
            if (local_20.IsValid())
            {
                local_20.Get().SetSharedHoverAnchor(local_4, this.SharedItemAndCurrencyHoverLayout);
            }
        }
        return;
    }
    void SyncItemTileSelectionAndFocus()
    {
        int local_5;
        if (this.w_tile_Item == nullptr || !(this.InventoryMain.IsValid()))
        {
            return;
        }
        local_5 = this.InventoryMain.Get().GetSelectedItemIndex();
        if (!(this.InventoryMain.Get().GetCurrentDisplayItems().IsValidIndex(local_5)))
        {
            this.w_tile_Item.SetSelectedIndex(INDEX_NONE);
            return;
        }
        this.w_tile_Item.SetSelectedIndex(local_5);
        if (int(this.GetCurrentInputType()) != 1)
        {
            return;
        }
        this.w_tile_Item.NavigateToIndex(local_5);
        this.RuleSetUserFocus(this.w_tile_Item);
        return;
    }
    void ClearItemSelectionForExternalFocus()
    {
        if (!(this.IsItemSelectionClearFocusTarget()))
        {
            return;
        }
        if (this.InventoryMain.IsValid())
        {
            this.InventoryMain.Get().ClearSelection();
        }
        if (this.w_tile_Item != nullptr)
        {
            this.w_tile_Item.SetSelectedIndex(INDEX_NONE);
        }
        return;
    }
    bool IsItemSelectionClearFocusTarget()
    {
        return ((this.HorizontalBox_0 != nullptr && this.IsPartOfFocusPath(this.HorizontalBox_0)) || (this.UI_Inventory_Main_PropsQuickAssembly != nullptr && this.IsPartOfFocusPath(this.UI_Inventory_Main_PropsQuickAssembly))) || (this.w_entry_CurrencyColumn != nullptr && this.IsPartOfFocusPath(this.w_entry_CurrencyColumn));
    }
    void ApplySharedHoverAnchorToCurrencyModels()
    {
        if (!(this.InventoryMain.IsValid()))
        {
            return;
        }
        UWidget local_4 = this.GetSharedHoverAnchor();
        for (auto& local_20 : this.InventoryMain.Get().GetItemBarItems())
        {
            if (local_20.IsValid())
            {
                local_20.Get().SetSharedHoverAnchor(local_4, this.SharedItemAndCurrencyHoverLayout);
            }
        }
        return;
    }
    void ApplySharedHoverAnchorToExistingItemWidgets()
    {
        if (this.w_tile_Item == nullptr)
        {
            return;
        }
        for (auto local_18 : this.w_tile_Item.GetDisplayedEntryWidgets())
        {
            this.ApplyGeneratedItemWidgetAnchor(local_18);
        }
        return;
    }
    void ApplySharedHoverAnchorToExistingCurrencyWidgets()
    {
        UWidget_CommonItemBar local_20;
        if (this.w_entry_CurrencyColumn == nullptr)
        {
            return;
        }
        for (auto local_18 : this.w_entry_CurrencyColumn.GetAllEntries())
        {
            local_20 = Cast<UWidget_CommonItemBar>(local_18);
            if (local_20 != nullptr)
            {
                this.ApplyCurrencyBarHoverAnchor(local_20);
            }
        }
        return;
    }
    void ApplyGeneratedItemWidgetAnchor(const UUserWidget Widget)
    {
        UWidget_InventoryMainItem local_2 = (Cast<UWidget_InventoryMainItem>(Widget));
        if (local_2 == nullptr)
        {
            return;
        }
        this.ApplyItemHoverAnchor(local_2);
        local_2.RefreshChildVisibility();
        return;
    }
    UFUNCTION()
    void OnClosePressed()
    {
        this.ClosePage(false);
        return;
    }
    UWidget GetSharedHoverAnchor()
    {
        UWidget local_6;
        if (this.w_anchor_ItemTip != nullptr)
        {
            return this.w_anchor_ItemTip;
        }
        if (this.UI_Common_Hover_ItemTips != nullptr)
        {
            local_6 = this.UI_Common_Hover_ItemTips;
        }
        else
        {
        }
        return local_6;
    }
    void RefreshCloseBindingVisibility()
    {
        bool local_4;
        if (this.VisibilityState)
        {
            local_4 = this.VisibilityState.opArrow().GetbIsSelectListOpen();
        }
        else
        {
            local_4 = false;
        }
        this.CloseBinding.SetCollapsed(local_4);
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
    TArray<FEUIModelWeakRef> InventoryMain_RootCategories() const
    {
        FVM_InventoryMain& local_2 = this.InventoryMain.Get();
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetRootCategories());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> InventoryMain_RedDots() const
    {
        FVM_InventoryMain& local_2 = this.InventoryMain.Get();
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetRedDots());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelContainer> InventoryMain_RootCategoryListItems() const
    {
        FVM_InventoryMain& local_2 = this.InventoryMain.Get();
        TArray<FEUIModelContainer> local_12;
        if (local_2)
        {
            local_12 = local_2.GetRootCategoryListItems();
        }
        else
        {
            local_12 = TArray<FEUIModelContainer>();
        }
        return local_12;
    }
    UFUNCTION()
    FEUIModelContainer InventoryMain_SelectedRootCategoryItem() const
    {
        FVM_InventoryMain& local_2 = this.InventoryMain.Get();
        FEUIModelContainer local_32 = local_2 ? local_2.GetSelectedRootCategoryItem() : FEUIModelContainer();
        return local_32;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> InventoryMain_Categories() const
    {
        FVM_InventoryMain& local_2 = this.InventoryMain.Get();
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetCategories());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> InventoryMain_CurrentDisplayItems() const
    {
        FVM_InventoryMain& local_2 = this.InventoryMain.Get();
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetCurrentDisplayItems());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    FEUIModelContainer InventoryMain_SelectedItem() const
    {
        FVM_InventoryMain& local_2 = this.InventoryMain.Get();
        FEUIModelContainer local_32;
        if (local_2)
        {
            local_32 = local_2.GetSelectedItem();
        }
        else
        {
            local_32 = FEUIModelContainer();
        }
        return local_32;
    }
    UFUNCTION()
    void InventoryMain_SelectRootCategory(const int Index) const
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
    void InventoryMain_SelectCategory(const int Index) const
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
    void InventoryMain_PrevRootCategory() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void InventoryMain_NextRootCategory() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void InventoryMain_PrevCategory() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void InventoryMain_NextCategory() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void InventoryMain_ConfirmSort() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void InventoryMain_OnFilterSelected(const int Index) const
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
    void InventoryMain_OnSorterSelected(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        TEUIModelRef<FVM_InventoryMain> local_2 = this.InventoryMain.AsRef();
        FVM_InventoryMain& local_6 = local_2.Get();
        TEUIModelRef<FVM_CloseVisibilityState> local_8 = this.VisibilityState.AsRef();
        FVM_CloseVisibilityState& local_12 = local_8.Get();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_62 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.VisibilityState.TrackRead();
                if (local_12)
                {
                    local_12.TrackPropertyRead(::FVM_CloseVisibilityState::__IndexOf_bIsSelectListOpen());
                }
                if (local_12)
                {
                    this.OnSelectListOpenChanged(local_12.GetbIsSelectListOpen());
                }
                break;
            }
            case 1:
            {
                this.InventoryMain.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_InventoryMain::__IndexOf_CurrentDisplayItems());
                }
                if (local_6)
                {
                    this.OnCurrentDisplayItemsChanged();
                }
                break;
            }
            case 2:
            {
                this.InventoryMain.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_InventoryMain::__IndexOf_SelectedItemIndex());
                }
                if (local_6)
                {
                    this.OnSelectedItemIndexChanged();
                }
                break;
            }
            case 3:
            {
                this.InventoryMain.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_InventoryMain::__IndexOf_ItemBarItems());
                }
                if (local_6)
                {
                    this.OnItemBarItemsChanged();
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
                XError(ELog(17), "Remaining observed model change: OnSelectListOpenChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnCurrentDisplayItemsChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnSelectedItemIndexChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnItemBarItemsChanged");
            }
            return;
        }
        this.__InventoryMain = local_2.opImplConv();
        this.__VisibilityState = local_8.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.InventoryMain.Initialize(this, FName("VM_InventoryMain"), EEUIWidgetRefModelCreationType(0), false);
        this.VisibilityState.Initialize(this, FName("VM_CloseVisibilityState"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.InventoryMainDelegate.IsBound())
        {
            this.InventoryMain.SetRef(this.InventoryMainDelegate.Execute());
        }
        if (this.VisibilityStateDelegate.IsBound())
        {
            this.VisibilityState.SetRef(this.VisibilityStateDelegate.Execute());
        }
        return;
    }
}

class UWidget_InventoryMainItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_InventoryMainItem> InventoryMainItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> SelectableItem;
    UPROPERTY()
    UWidget_CommonHoverProvider UI_Common_HoverProvider;
    UPROPERTY()
    UWidget_ComposableItem UI_Common_ComposableItem;
    UPROPERTY()
    int LastHandledPinnedTipRequestVersion = 0;
    FEUIModelWeakRef __InventoryMainItem;
    FEUIModelWeakRef __SelectableItem;
    UPROPERTY()
    FGetEUIModelRef InventoryMainItemDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectableItemDelegate;

    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.LastHandledPinnedTipRequestVersion = this.InventoryMainItem.IsValid() ? this.InventoryMainItem.Get().GetPinnedTipRequestVersion() : 0;
        this.BindHoverProviderHoverIntent();
        this.RefreshChildVisibility();
        this.ApplyConfiguredSharedHoverAnchor();
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        if (this.UI_Common_HoverProvider != nullptr)
        {
            this.UI_Common_HoverProvider.OnHoverIntent.Unbind(this, n"OnHoverProviderHoverIntent");
        }
        return;
    }
    void BindHoverProviderHoverIntent()
    {
        if (this.UI_Common_HoverProvider == nullptr)
        {
            return;
        }
        this.UI_Common_HoverProvider.OnHoverIntent.Unbind(this, n"OnHoverProviderHoverIntent");
        this.UI_Common_HoverProvider.OnHoverIntent.AddUFunction(this, n"OnHoverProviderHoverIntent");
        return;
    }
    UFUNCTION()
    void OnPinnedTipRequestChanged()
    {
        int local_3;
        if (!(this.InventoryMainItem.IsValid()))
        {
            this.LastHandledPinnedTipRequestVersion = 0;
            return;
        }
        local_3 = this.InventoryMainItem.Get().GetPinnedTipRequestVersion();
        if (local_3 <= this.LastHandledPinnedTipRequestVersion)
        {
            return;
        }
        this.LastHandledPinnedTipRequestVersion = local_3;
        if (!(this.InventoryMainItem.Get().GetbHasItem()) || ((this.UI_Common_HoverProvider == nullptr)))
        {
            return;
        }
        this.UI_Common_HoverProvider.SetHoverModels(this.InventoryMainItem.Get().GetTipHoverModels());
        this.UI_Common_HoverProvider.PinOrOpenPinnedPassThrough();
        if (this.UI_Common_HoverProvider.HoverProvider.IsValid())
        {
            this.InventoryMainItem.Get().UpdatePinnedTipHoverHandle(this.UI_Common_HoverProvider.HoverProvider.Get().GetHoverHandle());
        }
        return;
    }
    UFUNCTION()
    void OnSelectableItemSelectionChanged(const bool bIsSelected)
    {
        if (this.UI_Common_HoverProvider == nullptr)
        {
            return;
        }
        if (!(bIsSelected))
        {
            if (this.InventoryMainItem.IsValid())
            {
                this.InventoryMainItem.Get().ClosePinnedTipHover();
            }
            return;
        }
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) != 1)
        {
            return;
        }
        this.UI_Common_HoverProvider.NotifyGamepadFocusReceiveFromOwner();
        return;
    }
    UFUNCTION()
    void ApplySharedHoverAnchor(const UWidget InHoverAnchor, const ECommonHoverLayout InHoverLayout)
    {
        if (this.InventoryMainItem.IsValid())
        {
            this.InventoryMainItem.Get().SetSharedHoverAnchor(InHoverAnchor, ECommonHoverLayout(InHoverLayout));
        }
        if (this.UI_Common_HoverProvider == nullptr)
        {
            return;
        }
        this.UI_Common_HoverProvider.SetHoverForWidgetOverride(InHoverAnchor);
        if (this.UI_Common_HoverProvider.HoverProvider.IsValid())
        {
            this.UI_Common_HoverProvider.HoverProvider.Get().SetHoverPosition(ECommonHoverLayout(InHoverLayout));
        }
        return;
    }
    void ApplyConfiguredSharedHoverAnchor()
    {
        if (!(this.InventoryMainItem.IsValid()))
        {
            return;
        }
        UWidget local_4 = this.InventoryMainItem.Get().ResolveSharedHoverAnchorWidget();
        if (!(IsValid(local_4)))
        {
            return;
        }
        this.ApplySharedHoverAnchor(local_4, this.InventoryMainItem.Get().ResolveSharedHoverLayout());
        return;
    }
    UFUNCTION()
    void OnHoverProviderHoverIntent()
    {
        if (!(this.InventoryMainItem.IsValid()) || ((this.UI_Common_HoverProvider == nullptr)))
        {
            return;
        }
        if (!(this.InventoryMainItem.Get().GetbHasItem()))
        {
            this.UI_Common_HoverProvider.SetHoverModels(FEUIModelContainer());
            return;
        }
        if (this.UI_Common_HoverProvider.IsHoverDisplayed())
        {
            return;
        }
        this.InventoryMainItem.Get().PrepareHoverPreview();
        this.UI_Common_HoverProvider.SetHoverModels(this.InventoryMainItem.Get().GetTipHoverModels());
        return;
    }
    void RefreshChildVisibility()
    {
        int local_5;
        if (!(this.InventoryMainItem.IsValid()))
        {
            this.ClearChildVisibility();
            return;
        }
        if (this.UI_Common_ComposableItem != nullptr)
        {
            this.UI_Common_ComposableItem.SetVisibility(ESlateVisibility(4));
        }
        if (this.UI_Common_HoverProvider != nullptr)
        {
            if (this.InventoryMainItem.Get().GetbHasItem())
            {
                local_5 = 0;
            }
            else
            {
                local_5 = 4;
            }
            this.UI_Common_HoverProvider.SetVisibility(ESlateVisibility(local_5));
            if (!(this.InventoryMainItem.Get().GetbHasItem()))
            {
                this.UI_Common_HoverProvider.SetHoverModels(FEUIModelContainer());
            }
        }
        return;
    }
    void ClearChildVisibility()
    {
        if (this.UI_Common_ComposableItem != nullptr)
        {
            this.UI_Common_ComposableItem.SetVisibility(ESlateVisibility(4));
        }
        if (this.UI_Common_HoverProvider != nullptr)
        {
            this.UI_Common_HoverProvider.SetVisibility(ESlateVisibility(1));
        }
        return;
    }
    UFUNCTION()
    void InventoryMainItem_PinAndOpenOperations() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void InventoryMainItem_HandleCommonItemClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        TEUIModelRef<FVM_InventoryMainItem> local_2 = this.InventoryMainItem.AsRef();
        FVM_InventoryMainItem& local_6 = local_2.Get();
        TEUIModelRef<FVM_SelectableItem> local_8 = this.SelectableItem.AsRef();
        FVM_SelectableItem& local_12 = local_8.Get();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_62 = FEUIReactiveSubscriberTrackScope(It);
            int local_63 = It.GetIndex();
            if (local_63 <= 1)
            {
                if (local_63 != 0)
                {
                    if (local_63 != 1)
                    {
                    }
                }
                else
                {
                    this.InventoryMainItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_InventoryMainItem::__IndexOf_PinnedTipRequestVersion());
                    }
                    if (local_6)
                    {
                        this.OnPinnedTipRequestChanged();
                    }
                    this.SelectableItem.TrackRead();
                    if (local_12)
                    {
                        local_12.TrackPropertyRead(::FVM_SelectableItem::__IndexOf_bIsSelected());
                    }
                    if (local_12)
                    {
                        this.OnSelectableItemSelectionChanged(local_12.GetbIsSelected());
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
                XError(ELog(17), "Remaining observed model change: OnPinnedTipRequestChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnSelectableItemSelectionChanged");
            }
            return;
        }
        this.__InventoryMainItem = local_2.opImplConv();
        this.__SelectableItem = local_8.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.InventoryMainItem.Initialize(this, FName("VM_InventoryMainItem"), EEUIWidgetRefModelCreationType(0), false);
        this.SelectableItem.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.InventoryMainItemDelegate.IsBound())
        {
            this.InventoryMainItem.SetRef(this.InventoryMainItemDelegate.Execute());
        }
        if (this.SelectableItemDelegate.IsBound())
        {
            this.SelectableItem.SetRef(this.SelectableItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_InventoryMain
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_InventoryMain;
    Result.ObservedModelChangesSubscriberCount = 4;
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectListOpenChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCurrentDisplayItemsChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedItemIndexChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnItemBarItemsChanged"));
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
namespace UWidget_InventoryMainItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_InventoryMainItem;
    Result.ObservedModelChangesSubscriberCount = 2;
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnPinnedTipRequestChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectableItemSelectionChanged"));
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
