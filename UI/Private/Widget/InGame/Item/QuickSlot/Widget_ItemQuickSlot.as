
namespace UWidget_ItemQuickSlot
{
    const int ViewID = 0;

}
class UWidget_ItemQuickSlot : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemQuickSlot> QuickSlot;
    UPROPERTY()
    UWidget_ItemIcon UI_Common_Item;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Item> Item;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DisplayItem> DisplayItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonItem> CommonItem;
    FEUIModelWeakRef __QuickSlot;
    UPROPERTY()
    FGetEUIModelRef QuickSlotDelegate;
    UPROPERTY()
    FGetEUIModelRef ItemDelegate;
    UPROPERTY()
    FGetEUIModelRef DisplayItemDelegate;
    UPROPERTY()
    FGetEUIModelRef CommonItemDelegate;

    UWidget_ItemQuickSlot()
    {
        return;
    }
    bool IsSlot(const TDataObjectPtr<FItemQuickSlotConfig> &inout InQuickSlot) const
    {
        bool local_74;
        if (!(this.QuickSlot))
        {
            local_74 = false;
        }
        else
        {
            TDataObjectPtr<FItemQuickSlotConfig> local_24;
            local_24 = this.QuickSlot.opArrow().GetQuickSlot();
            local_74 = (local_24 == InQuickSlot.opImplConv());
        }
        return local_74;
    }
    UFUNCTION()
    void SetupOwnerUserWidget()
    {
        this.QuickSlot.opArrow().SetOwnerUserWidget(this);
        return;
    }
    UFUNCTION()
    void SetupItem()
    {
        this.Item.SetRef(this.QuickSlot.opArrow().GetItem());
        this.SyncCommonItemIconSources();
        return;
    }
    UFUNCTION()
    void SetupDisplayItem()
    {
        this.DisplayItem.SetRef(this.QuickSlot.opArrow().GetDisplayItem());
        this.SyncCommonItemIconSources();
        return;
    }
    UFUNCTION()
    void SetupCommonItem()
    {
        this.CommonItem.SetRef(this.QuickSlot.opArrow().GetCommonItem());
        this.SyncCommonItemIconSources();
        return;
    }
    void SyncCommonItemIconSources()
    {
        if (this.UI_Common_Item == nullptr)
        {
            return;
        }
        TEUIModelRef<FVM_Item> local_6;
        local_6;
        this.UI_Common_Item.SetItemSource(local_6);
        TEUIModelRef<FVM_DisplayItem> local_8;
        local_8;
        this.UI_Common_Item.SetDisplayItemSource(local_8);
        TEUIModelRef<FVM_CommonItem> local_10;
        local_10;
        this.UI_Common_Item.SetCommonItemSource(local_10);
        return;
    }
    UFUNCTION()
    void QuickSlot_OpenSelectList() const
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
        FVM_Item& local_2;
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
        FVM_Item& local_2;
        int local_5;
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
        FVM_Item& local_2;
        return local_2 ? local_2.GetOptionalNum() : 0;
    }
    UFUNCTION()
    FText Item_ItemCategory() const
    {
        FVM_Item& local_2;
        FText local_16 = local_2 ? local_2.GetItemCategory() : FText();
        return local_16;
    }
    UFUNCTION()
    FSlateBrush Item_ItemIcon() const
    {
        FVM_Item& local_2;
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
        FVM_Item& local_2;
        FText local_16 = local_2 ? local_2.GetItemOwnLimit() : FText();
        return local_16;
    }
    UFUNCTION()
    bool Item_ShouldShowNum() const
    {
        FVM_Item& local_2;
        bool local_5;
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
        FVM_Item& local_2;
        bool local_5;
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
        FVM_Item& local_2;
        bool local_5;
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
        FVM_Item& local_2;
        bool local_5;
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
        FVM_Item& local_2;
        FSlateColor local_18 = local_2 ? local_2.GetNumTextColor() : FSlateColor();
        return local_18;
    }
    UFUNCTION()
    bool Item_HasOwnLimit() const
    {
        FVM_Item& local_2;
        bool local_5;
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
        FVM_ItemQuickSlot& local_6;
        TEUIModelRef<FVM_ItemQuickSlot> local_2 = this.QuickSlot.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.QuickSlot.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_ItemQuickSlot::__IndexOf_QuickSlot());
                }
                if (local_6)
                {
                    this.SetupOwnerUserWidget();
                }
                break;
            }
            case 1:
            {
                this.QuickSlot.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_ItemQuickSlot::__IndexOf_Item());
                }
                if (local_6)
                {
                    this.SetupItem();
                }
                break;
            }
            case 2:
            {
                this.QuickSlot.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_ItemQuickSlot::__IndexOf_DisplayItem());
                }
                if (local_6)
                {
                    this.SetupDisplayItem();
                }
                break;
            }
            case 3:
            {
                this.QuickSlot.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_ItemQuickSlot::__IndexOf_CommonItem());
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
                XError(ELog(17), "Remaining observed model change: SetupOwnerUserWidget");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: SetupItem");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: SetupDisplayItem");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: SetupCommonItem");
            }
            return;
        }
        this.__QuickSlot = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.QuickSlot.Initialize(this, FName("VM_ItemQuickSlot"), EEUIWidgetRefModelCreationType(0), false);
        this.Item.Initialize(this, FName("VM_Item"), EEUIWidgetRefModelCreationType(1), true);
        this.DisplayItem.Initialize(this, FName("VM_DisplayItem"), EEUIWidgetRefModelCreationType(1), true);
        this.CommonItem.Initialize(this, FName("VM_CommonItem"), EEUIWidgetRefModelCreationType(1), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.QuickSlotDelegate.IsBound())
        {
            this.QuickSlot.SetRef(this.QuickSlotDelegate.Execute());
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
        return;
    }
}

namespace UWidget_ItemQuickSlot
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("SetupOwnerUserWidget"));
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
