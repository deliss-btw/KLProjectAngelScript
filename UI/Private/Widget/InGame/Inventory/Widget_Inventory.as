
namespace UWidget_Inventory
{
    const int ViewID = 0;

}
class UWidget_Inventory : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Inventory> Inventory;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CloseVisibilityState> VisibilityState;
    UPROPERTY()
    FEUIActionBinding CloseBinding;
    FEUIModelWeakRef __VisibilityState;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef InventoryDelegate;
    UPROPERTY()
    FGetEUIModelRef VisibilityStateDelegate;

    UWidget_Inventory()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.RefreshCloseBindingVisibility();
        return;
    }
    UFUNCTION()
    void OnSelectListOpenChanged(const bool bIsOpen)
    {
        this.RefreshCloseBindingVisibility();
        return;
    }
    UFUNCTION()
    void OnClosePressed()
    {
        this.ClosePage(false);
        return;
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
    TArray<FEUIModelWeakRef> Inventory_RootCategories() const
    {
        FVM_Inventory& local_2;
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
    TArray<FEUIModelWeakRef> Inventory_Categories() const
    {
        FVM_Inventory& local_2;
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
    TArray<FEUIModelWeakRef> Inventory_CurrentDisplayItems() const
    {
        FVM_Inventory& local_2;
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
    void Inventory_PrevRootCategory() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Inventory_NextRootCategory() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Inventory_PrevCategory() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Inventory_NextCategory() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Inventory_ConfirmSort() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Inventory_OnFilterDropdownSelected(const int Index) const
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
    void Inventory_OnSorterDropdownSelected(const int Index) const
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
    void Inventory_OnSelectedIndexChanged(const int Index) const
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
        FVM_CloseVisibilityState& local_6;
        TEUIModelRef<FVM_CloseVisibilityState> local_2 = this.VisibilityState.AsRef();
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
                    this.VisibilityState.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CloseVisibilityState::__IndexOf_bIsSelectListOpen());
                    }
                    if (local_6)
                    {
                        this.OnSelectListOpenChanged(local_6.GetbIsSelectListOpen());
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
            return;
        }
        this.__VisibilityState = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.Inventory.Initialize(this, FName("VM_Inventory"), EEUIWidgetRefModelCreationType(0), false);
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
        if (this.InventoryDelegate.IsBound())
        {
            this.Inventory.SetRef(this.InventoryDelegate.Execute());
        }
        if (this.VisibilityStateDelegate.IsBound())
        {
            this.VisibilityState.SetRef(this.VisibilityStateDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_Inventory
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectListOpenChanged"));
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
