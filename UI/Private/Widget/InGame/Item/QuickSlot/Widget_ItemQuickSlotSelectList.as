namespace UWidget_ItemQuickSlotSelectListEntry
{
    const int ViewID = 0;
}
namespace UWidget_ItemQuickSlotSelectList
{
    const int ViewID = 0;

}
class UWidget_ItemQuickSlotSelectListEntry : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemQuickSlotSelectListEntry> ItemQuickSlotSelectListEntry;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Item> Item;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DisplayItem> DisplayItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonItem> CommonItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemIconAdapter> DisplayAdapter;
    FEUIModelWeakRef __ItemQuickSlotSelectListEntry;
    UPROPERTY()
    FGetEUIModelRef ItemQuickSlotSelectListEntryDelegate;
    UPROPERTY()
    FGetEUIModelRef ItemDelegate;
    UPROPERTY()
    FGetEUIModelRef DisplayItemDelegate;
    UPROPERTY()
    FGetEUIModelRef CommonItemDelegate;
    UPROPERTY()
    FGetEUIModelRef DisplayAdapterDelegate;

    UWidget_ItemQuickSlotSelectListEntry()
    {
        return;
    }
    UFUNCTION()
    void SetupItem()
    {
        this.Item.SetRef(this.ItemQuickSlotSelectListEntry.opArrow().GetItem());
        this.RefreshDisplayAdapter();
        return;
    }
    UFUNCTION()
    void SetupDisplayItem()
    {
        this.DisplayItem.SetRef(this.ItemQuickSlotSelectListEntry.opArrow().GetDisplayItem());
        this.RefreshDisplayAdapter();
        return;
    }
    UFUNCTION()
    void SetupCommonItem()
    {
        this.CommonItem.SetRef(this.ItemQuickSlotSelectListEntry.opArrow().GetCommonItem());
        this.RefreshDisplayAdapter();
        return;
    }
    void RefreshDisplayAdapter()
    {
        this.EnsureDisplayAdapter();
        if (!(this.DisplayAdapter.IsValid()))
        {
            return;
        }
        if (this.DisplayItem.IsValid())
        {
            TEUIModelRef<FVM_DisplayItem> local_4;
            local_4;
            this.DisplayAdapter.Get().SetupFromDisplayItem(local_4);
            return;
        }
        if (this.CommonItem.IsValid())
        {
            TEUIModelRef<FVM_CommonItem> local_6;
            local_6;
            this.DisplayAdapter.Get().SetupFromCommonItem(local_6);
            return;
        }
        if (this.Item.IsValid())
        {
            TEUIModelRef<FVM_Item> local_8;
            local_8;
            this.DisplayAdapter.Get().SetupFromItem(local_8);
            return;
        }
        this.DisplayAdapter.Get().Clear();
        return;
    }
    void EnsureDisplayAdapter()
    {
        if (!(this.DisplayAdapter.IsValid()))
        {
            this.DisplayAdapter.SetRef(TEUIModelRef<FVM_ItemIconAdapter>(::FVM_ItemIconAdapter::Create(this)));
        }
        return;
    }
    UFUNCTION()
    FEUIModelRef ItemQuickSlotSelectListEntry_Item() const
    {
        FVM_ItemQuickSlotSelectListEntry& local_2 = this.ItemQuickSlotSelectListEntry.Get();
        FEUIModelRef local_8;
        if (local_2)
        {
            local_8 = local_2.GetItem();
        }
        else
        {
            local_8 = FEUIModelRef();
        }
        return local_8;
    }
    UFUNCTION()
    void ItemQuickSlotSelectListEntry_OnClick() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    TDataObjectPtr<FItemConfig> Item_ItemConfig() const
    {
        FVM_Item& local_2 = this.Item.Get();
        TDataObjectPtr<FItemConfig> local_52;
        if (local_2)
        {
            local_52 = local_2.GetItemConfig();
        }
        else
        {
            local_52 = TDataObjectPtr<FItemConfig>();
        }
        return local_52;
    }
    UFUNCTION()
    int Item_Num() const
    {
        int local_5;
        FVM_Item& local_2 = this.Item.Get();
        if (local_2)
        {
            local_5 = local_2.GetNum();
        }
        else
        {
            local_5 = 0;
        }
        return local_5;
    }
    UFUNCTION()
    int Item_OptionalNum() const
    {
        FVM_Item& local_2 = this.Item.Get();
        return local_2 ? local_2.GetOptionalNum() : 0;
    }
    UFUNCTION()
    FText Item_ItemCategory() const
    {
        FVM_Item& local_2 = this.Item.Get();
        FText local_16 = local_2 ? local_2.GetItemCategory() : FText();
        return local_16;
    }
    UFUNCTION()
    FSlateBrush Item_ItemIcon() const
    {
        FVM_Item& local_2 = this.Item.Get();
        FSlateBrush local_136;
        if (local_2)
        {
            local_136 = local_2.GetItemIcon();
        }
        else
        {
            local_136 = FSlateBrush();
        }
        return local_136;
    }
    UFUNCTION()
    FText Item_ItemOwnLimit() const
    {
        FVM_Item& local_2 = this.Item.Get();
        FText local_16 = local_2 ? local_2.GetItemOwnLimit() : FText();
        return local_16;
    }
    UFUNCTION()
    bool Item_ShouldShowNum() const
    {
        bool local_5;
        FVM_Item& local_2 = this.Item.Get();
        if (local_2)
        {
            local_5 = local_2.GetShouldShowNum();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool Item_ShouldShowOptionalNum() const
    {
        bool local_5;
        FVM_Item& local_2 = this.Item.Get();
        if (local_2)
        {
            local_5 = local_2.GetShouldShowOptionalNum();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool Item_ShouldShowOfMark() const
    {
        bool local_5;
        FVM_Item& local_2 = this.Item.Get();
        if (local_2)
        {
            local_5 = local_2.GetShouldShowOfMark();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool Item_ShouldShowRangeMark() const
    {
        bool local_5;
        FVM_Item& local_2 = this.Item.Get();
        if (local_2)
        {
            local_5 = local_2.GetShouldShowRangeMark();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    FSlateColor Item_NumTextColor() const
    {
        FVM_Item& local_2 = this.Item.Get();
        FSlateColor local_18 = local_2 ? local_2.GetNumTextColor() : FSlateColor();
        return local_18;
    }
    UFUNCTION()
    bool Item_HasOwnLimit() const
    {
        bool local_5;
        FVM_Item& local_2 = this.Item.Get();
        if (local_2)
        {
            local_5 = local_2.HasOwnLimit();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void Item_OnCustomSelected() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CommonItem_HandleCommonItemClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        TEUIModelRef<FVM_ItemQuickSlotSelectListEntry> local_2 = this.ItemQuickSlotSelectListEntry.AsRef();
        FVM_ItemQuickSlotSelectListEntry& local_6 = local_2.Get();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.ItemQuickSlotSelectListEntry.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_ItemQuickSlotSelectListEntry::__IndexOf_Item());
                }
                if (local_6)
                {
                    this.SetupItem();
                }
                break;
            }
            case 1:
            {
                this.ItemQuickSlotSelectListEntry.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_ItemQuickSlotSelectListEntry::__IndexOf_DisplayItem());
                }
                if (local_6)
                {
                    this.SetupDisplayItem();
                }
                break;
            }
            case 2:
            {
                this.ItemQuickSlotSelectListEntry.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_ItemQuickSlotSelectListEntry::__IndexOf_CommonItem());
                }
                if (local_6)
                {
                    this.SetupCommonItem();
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
                XError(ELog(17), "Remaining observed model change: SetupItem");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: SetupDisplayItem");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: SetupCommonItem");
            }
            return;
        }
        this.__ItemQuickSlotSelectListEntry = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ItemQuickSlotSelectListEntry.Initialize(this, FName("VM_ItemQuickSlotSelectListEntry"), EEUIWidgetRefModelCreationType(0), false);
        this.Item.Initialize(this, FName("VM_Item"), EEUIWidgetRefModelCreationType(1), true);
        this.DisplayItem.Initialize(this, FName("VM_DisplayItem"), EEUIWidgetRefModelCreationType(1), true);
        this.CommonItem.Initialize(this, FName("VM_CommonItem"), EEUIWidgetRefModelCreationType(1), true);
        this.DisplayAdapter.Initialize(this, FName("VM_ItemIconAdapter"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemQuickSlotSelectListEntryDelegate.IsBound())
        {
            this.ItemQuickSlotSelectListEntry.SetRef(this.ItemQuickSlotSelectListEntryDelegate.Execute());
        }
        if (this.ItemDelegate.IsBound())
        {
            this.Item.SetRef(this.ItemDelegate.Execute());
        }
        if (this.DisplayItemDelegate.IsBound())
        {
            this.DisplayItem.SetRef(this.DisplayItemDelegate.Execute());
        }
        if (this.CommonItemDelegate.IsBound())
        {
            this.CommonItem.SetRef(this.CommonItemDelegate.Execute());
        }
        if (this.DisplayAdapterDelegate.IsBound())
        {
            this.DisplayAdapter.SetRef(this.DisplayAdapterDelegate.Execute());
        }
        return;
    }
}

class UWidget_ItemQuickSlotSelectList : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemQuickSlotSelectList> SelectList;
    UPROPERTY()
    FGetEUIModelRef SelectListDelegate;

    UWidget_ItemQuickSlotSelectList()
    {
        return;
    }
    UFUNCTION()
    void SelectList_CloseSelectList() const
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
        this.SelectList.Initialize(this, FName("VM_ItemQuickSlotSelectList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SelectListDelegate.IsBound())
        {
            this.SelectList.SetRef(this.SelectListDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemQuickSlotSelectListEntry
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_ItemQuickSlotSelectListEntry;
    Result.ObservedModelChangesSubscriberNames.Add(FString("SetupItem"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("SetupDisplayItem"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("SetupCommonItem"));
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
namespace UWidget_ItemQuickSlotSelectList
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_ItemQuickSlotSelectList;
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
