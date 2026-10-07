
namespace UWidget_AvatarEquipmentMain
{
    const int ViewID = 0;

}
class UWidget_AvatarEquipmentMain : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarEquipmentMain> AvatarEquipMainVM;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarShowcase> Showcase;
    UPROPERTY()
    UEUICommonListViewBase w_list_tab;
    UPROPERTY()
    UEUICommonListViewBase w_tile_Item;
    UPROPERTY()
    UHorizontalBox HorizontalBox_Dropdown;
    UPROPERTY()
    UWidget_AvatarEquipmentItemInfoCompare UI_Equipment_InfoCompare;
    UPROPERTY()
    FEUIActionBinding EquipmentListPrevActionBinding;
    UPROPERTY()
    FEUIActionBinding EquipmentListNextActionBinding;
    UPROPERTY()
    FEUIActionBinding CloseActionBinding;
    UPROPERTY()
    FEUIActionBinding EquipActionBinding;
    UPROPERTY()
    FEUIActionBinding UnEquipActionBinding;
    UPROPERTY()
    FEUIActionBinding CompareActionBinding;
    UPROPERTY()
    FEUIActionBinding DecomposeActionBinding;
    UPROPERTY()
    FEUIActionBinding BatchDecomposeActionBinding;
    UPROPERTY()
    FEUIActionBinding ConfirmBatchDecomposeActionBinding;
    UPROPERTY()
    FEUIActionBinding BatchDecomposeSelectActionBinding;
    UPROPERTY()
    FEUIInputActionDataRow EquipIARow;
    UPROPERTY()
    FEUIInputActionDataRow ReplaceEquipIARow;
    UPROPERTY()
    FEUIInputActionDataRow CompareIARow;
    UPROPERTY()
    FEUIInputActionDataRow CancelCompareIARow;
    UPROPERTY()
    FEUIInputActionDataRow BatchDecomposeIARow;
    UPROPERTY()
    FEUIInputActionDataRow CancelBatchDecomposeIARow;
    UPROPERTY()
    FEUIInputActionDataRow SelectIARow;
    UPROPERTY()
    FEUIInputActionDataRow UnSelectIARow;
    UPROPERTY()
    FEUIActionBinding GamepadNextActionBinding;
    UPROPERTY()
    FConfigVM_AvatarEquipmentMain AvatarEquipMainVMConfig;
    UPROPERTY()
    FConfigVM_AvatarShowcase ShowcaseConfig;
    FEUIModelWeakRef __AvatarEquipMainVM;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef AvatarEquipMainVMDelegate;
    UPROPERTY()
    FGetEUIModelRef ShowcaseDelegate;

    UWidget_AvatarEquipmentMain()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.w_list_tab != nullptr)
        {
            int local_4 = 0;
            if ((int(GetFilterByIllustrate())) != 0)
            {
                int local_7 = int(GetFilterByIllustrate());
                local_4 = local_7 - 1;
            }
            int local_7_2 = GetIllustrateTypes().IsValidIndex() ? local_4 : 0;
            this.w_list_tab.SetSelectedIndex(local_7_2);
            TWeakObjectPtr<UEUICommonListViewBase>(this.w_list_tab).SetIllustrateFilterListWidget();
        }
        TEUIModelRef<FVM_AvatarShowcase> local_12;
        local_12;
        local_12.SetCurrentShowcase();
        return;
    }
    UFUNCTION()
    void HandleRelatedFocusChanged_Implementation()
    {
        if (this.AvatarEquipMainVM.IsValid())
        {
            this.GamepadNextActionBinding.SetCollapsed(GetbBatchDecompose() || !(this.IsPartOfFocusPath(this.w_tile_Item)));
        }
        return;
    }
    UFUNCTION()
    void OnEquipmentTypeListGoPrev()
    {
        if (this.w_list_tab != nullptr)
        {
            this.w_list_tab.SetSelectedIndex(FMath::WrapIndex((GetSelectedIllustrateFilterItemIndex() - 1), 0, ::FMS_Talisman::Get(this).GetUnlockSlotCount() + 1));
        }
        return;
    }
    UFUNCTION()
    void OnEquipmentTypeListGoNext()
    {
        if (this.w_list_tab != nullptr)
        {
            this.w_list_tab.SetSelectedIndex(FMath::WrapIndex((GetSelectedIllustrateFilterItemIndex() + 1), 0, ::FMS_Talisman::Get(this).GetUnlockSlotCount() + 1));
        }
        return;
    }
    UFUNCTION()
    void OnGamepadExchangeSelectionFocus()
    {
        if (this.IsPartOfFocusPath(this.HorizontalBox_Dropdown))
        {
            this.RuleSetUserFocus(this.w_tile_Item);
            return;
        }
        this.RuleSetUserFocus(this.HorizontalBox_Dropdown);
        return;
    }
    UFUNCTION()
    void OnGamepadNextAction()
    {
        if (this.UI_Equipment_InfoCompare != nullptr && !(this.IsPartOfFocusPath(this.UI_Equipment_InfoCompare)))
        {
            this.RuleSetUserFocus(this.UI_Equipment_InfoCompare);
        }
        return;
    }
    UFUNCTION()
    void HandleSelectedItemsChanged(const TEUIModelRef<FVM_AvatarEquipmentItem> &inout InSelectedItems)
    {
        this.RefreshActionBinding();
        if (this.w_tile_Item != nullptr)
        {
            this.w_tile_Item.ScrollIndexIntoView(GetSelectedItemIndex());
            this.w_tile_Item.NavigateToIndex(GetSelectedItemIndex());
        }
        return;
    }
    UFUNCTION()
    void HandleCurSlotEquipedItemUIdChanged(const uint64 CurSlotEquipedItemUId)
    {
        this.RefreshActionBinding();
        if (CurSlotEquipedItemUId != 0)
        {
        }
        else
        {
        }
        this.EquipActionBinding.SetInputAction();
        return;
    }
    UFUNCTION()
    void HandleItemComparedChanged(const bool bItemCompared)
    {
        if (bItemCompared)
        {
        }
        else
        {
        }
        this.CompareActionBinding.SetInputAction();
        return;
    }
    UFUNCTION()
    void HandleBatchDecomposeChanged(const bool bBatchDecompose)
    {
        this.RefreshActionBinding();
        this.CloseActionBinding.SetCollapsed(bBatchDecompose);
        if (bBatchDecompose)
        {
        }
        else
        {
        }
        this.BatchDecomposeActionBinding.SetInputAction();
        this.GamepadNextActionBinding.SetCollapsed(GetbBatchDecompose() || !(this.IsPartOfFocusPath(this.w_tile_Item)));
        return;
    }
    UFUNCTION()
    void HandleBatchDecomposeEquipmentSetChanged(const TSet<TEUIModelRef<FM_Equipment>> &inout InBatchDecomposeEquipmentSet)
    {
        bool local_1 = InBatchDecomposeEquipmentSet.IsEmpty();
        this.ConfirmBatchDecomposeActionBinding.SetCollapsed(local_1);
        if (!(this.AvatarEquipMainVM.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            TEUIModelRef<FVM_AvatarEquipmentItem> local_4;
            local_4.GetSelectedItems();
            local_1 = local_4.IsValid();
        }
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            TEUIModelRef<FVM_ComposableItem> local_8;
            TEUIModelRef<FVM_AvatarEquipmentItem> local_4;
            local_4.GetSelectedItems();
            local_8.GetComposableItemVM();
            local_1 = local_8.IsValid();
        }
        if (local_1)
        {
            TEUIModelRef<FVM_ComposableItem> local_8;
            TEUIModelRef<FVM_AvatarEquipmentItem> local_4;
            local_4.GetSelectedItems();
            local_8.GetComposableItemVM();
            if (::ComposableItemUtility::GetItemEquipMarkIsCheckableSelected())
            {
            }
            else
            {
            }
            this.BatchDecomposeSelectActionBinding.SetInputAction();
        }
        return;
    }
    void RefreshActionBinding()
    {
        bool local_1 = false;
        bool local_3 = false;
        bool local_4 = false;
        bool local_5 = false;
        bool local_6 = false;
        bool local_2 = !(GetBatchDecomposeEquipmentSet().IsEmpty());
        TEUIModelRef<FVM_AvatarEquipmentItem> local_10;
        local_10.GetSelectedItems();
        bool local_7 = local_10.IsValid();
        if (!(local_7))
        {
            local_7 = false;
        }
        else
        {
            TEUIModelRef<FVM_ComposableItem> local_12;
            local_10.GetSelectedItems();
            local_12.GetComposableItemVM();
            local_7 = local_12.IsValid();
        }
        if (local_7)
        {
            TEUIModelRef<FVM_ComposableItem> local_12;
            TEUIModelRef<FM_Equipment> local_22;
            bool local_20;
            int64 local_16 = GetCurSlotEquipedItemUId();
            local_1 = (local_16 != 0);
            local_10.GetSelectedItems();
            local_12.GetComposableItemVM();
            bool local_13 = ::ComposableItemUtility::GetItemEquipMarkIsCheckableSelected();
            local_20 = false;
            local_10.GetSelectedItems();
            local_22.GetEquipment();
            if (local_22.IsValid())
            {
                local_10.GetSelectedItems();
                local_22.GetEquipment();
                local_20 = ::FEquipmentUtils::CanDecompose(GetEquipmentConfig());
            }
            if (GetbBatchDecompose())
            {
                local_3 = false;
                local_4 = false;
                local_5 = false;
                local_10.GetSelectedItems();
                local_12.GetComposableItemVM();
                local_6 = !(::ComposableItemUtility::IsItemEquipped()) && local_20;
                if (local_13)
                {
                }
                else
                {
                }
                this.BatchDecomposeSelectActionBinding.SetInputAction();
            }
            else
            {
                local_10.GetSelectedItems();
                local_12.GetComposableItemVM();
                if (::ComposableItemUtility::IsItemEquipBySelf())
                {
                    local_3 = false;
                    local_4 = true;
                    local_5 = false;
                }
                else
                {
                    local_10.GetSelectedItems();
                    local_12.GetComposableItemVM();
                    if (::ComposableItemUtility::IsItemEquipByOther())
                    {
                        local_3 = true;
                        local_4 = false;
                        local_5 = false;
                    }
                    else
                    {
                        local_3 = true;
                        local_4 = false;
                        local_5 = local_20;
                    }
                }
            }
        }
        this.CompareActionBinding.SetCollapsed(!(local_1));
        this.EquipActionBinding.SetCollapsed(!(local_3));
        this.UnEquipActionBinding.SetCollapsed(!(local_4 && CanShowUnEquipAction()));
        this.DecomposeActionBinding.SetCollapsed(!(local_5));
        this.BatchDecomposeSelectActionBinding.SetCollapsed(!(local_6));
        this.ConfirmBatchDecomposeActionBinding.SetCollapsed(!(local_2));
        return;
    }
    UFUNCTION()
    void OnCloseAction()
    {
        bool local_1 = true;
        if ((int(this.GetCurrentInputType())) == 1)
        {
            if (this.UI_Equipment_InfoCompare != nullptr && this.IsPartOfFocusPath(this.UI_Equipment_InfoCompare))
            {
                this.RuleSetUserFocus(this.w_tile_Item);
                local_1 = false;
            }
        }
        if (local_1)
        {
            if (this.Page.IsValid())
            {
                ClosePage();
            }
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
    void AvatarEquipMainVM_OnSelectIllustrateFilter(const int IllustrateFilterItemIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(IllustrateFilterItemIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void AvatarEquipMainVM_OnSelectItem(const int ItemIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(ItemIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void AvatarEquipMainVM_OnRarityFilterSelected(const int Index) const
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
    void AvatarEquipMainVM_OnTraitFilterSelected(const int Index) const
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
    void AvatarEquipMainVM_OnItemEquip() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void AvatarEquipMainVM_OnItemUnEquip() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void AvatarEquipMainVM_SwitchItemCompare() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void AvatarEquipMainVM_SwitchBatchDecomposeItemSelect() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void AvatarEquipMainVM_SwitchBatchDecomposeState() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void AvatarEquipMainVM_OnItemDecompose() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void AvatarEquipMainVM_ConfirmBatchDecompose() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_AvatarEquipmentMain& local_6;
        TEUIModelRef<FVM_AvatarEquipmentMain> local_2 = this.AvatarEquipMainVM.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.AvatarEquipMainVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_AvatarEquipmentMain::__IndexOf_SelectedItems());
                }
                if (local_6)
                {
                    this.HandleSelectedItemsChanged(local_6.GetSelectedItems());
                }
                break;
            }
            case 1:
            {
                this.AvatarEquipMainVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_AvatarEquipmentMain::__IndexOf_CurSlotEquipedItemUId());
                }
                if (local_6)
                {
                    this.HandleCurSlotEquipedItemUIdChanged(local_6.GetCurSlotEquipedItemUId());
                }
                break;
            }
            case 2:
            {
                this.AvatarEquipMainVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_AvatarEquipmentMain::__IndexOf_bItemCompared());
                }
                if (local_6)
                {
                    this.HandleItemComparedChanged(local_6.GetbItemCompared());
                }
                break;
            }
            case 3:
            {
                this.AvatarEquipMainVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_AvatarEquipmentMain::__IndexOf_bBatchDecompose());
                }
                if (local_6)
                {
                    this.HandleBatchDecomposeChanged(local_6.GetbBatchDecompose());
                }
                break;
            }
            case 4:
            {
                this.AvatarEquipMainVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_AvatarEquipmentMain::__IndexOf_BatchDecomposeEquipmentSet());
                }
                if (local_6)
                {
                    this.HandleBatchDecomposeEquipmentSetChanged(local_6.GetBatchDecomposeEquipmentSet());
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
                XError(ELog(17), "Remaining observed model change: HandleSelectedItemsChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: HandleCurSlotEquipedItemUIdChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: HandleItemComparedChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: HandleBatchDecomposeChanged");
            }
            if (It.IsDirty(4))
            {
                XError(ELog(17), "Remaining observed model change: HandleBatchDecomposeEquipmentSetChanged");
            }
            return;
        }
        this.__AvatarEquipMainVM = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.AvatarEquipMainVM.Initialize(this, FName("VM_AvatarEquipmentMain"), EEUIWidgetRefModelCreationType(0), false);
        this.Showcase.Initialize(this, FName("VM_AvatarShowcase"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.AvatarEquipMainVMDelegate.IsBound())
        {
            this.AvatarEquipMainVM.SetRef(this.AvatarEquipMainVMDelegate.Execute());
        }
        if (this.ShowcaseDelegate.IsBound())
        {
            this.Showcase.SetRef(this.ShowcaseDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarEquipmentMain
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleSelectedItemsChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleCurSlotEquipedItemUIdChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleItemComparedChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleBatchDecomposeChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleBatchDecomposeEquipmentSetChanged"));
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
