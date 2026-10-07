
namespace UWidget_ShopGoodsItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ShopGoodsItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ShopGoodsItem> ShopGoodsItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Item> Item;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonItem> CommonItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> SelectableItem;
    FEUIModelWeakRef __ShopGoodsItem;
    UPROPERTY()
    FGetEUIModelRef ShopGoodsItemDelegate;
    UPROPERTY()
    FGetEUIModelRef ItemDelegate;
    UPROPERTY()
    FGetEUIModelRef CommonItemDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectableItemDelegate;

    UWidget_ShopGoodsItem()
    {
        return;
    }
    UFUNCTION()
    void SyncItemModel(const TEUIModelRef<FVM_Item> &inout InItem)
    {
        this.Item.SetRef(InItem);
        return;
    }
    UFUNCTION()
    void SyncCommonItemModel(const TEUIModelRef<FM_ItemData> &inout InItemData)
    {
        if (InItemData.IsValid())
        {
            this.CommonItem.SetRef(TEUIModelRef<FVM_CommonItem>(::FVM_CommonItem::Create(this, InItemData)));
        }
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
        FVM_ShopGoodsItem& local_6;
        TEUIModelRef<FVM_ShopGoodsItem> local_2 = this.ShopGoodsItem.AsRef();
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
                    this.ShopGoodsItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_ShopGoodsItem::__IndexOf_Item());
                    }
                    if (local_6)
                    {
                        this.SyncItemModel(local_6.GetItem());
                    }
                    this.ShopGoodsItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_ShopGoodsItem::__IndexOf_ItemData());
                    }
                    if (local_6)
                    {
                        this.SyncCommonItemModel(local_6.GetItemData());
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
                XError(ELog(17), "Remaining observed model change: SyncItemModel");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: SyncCommonItemModel");
            }
            return;
        }
        this.__ShopGoodsItem = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ShopGoodsItem.Initialize(this, FName("VM_ShopGoodsItem"), EEUIWidgetRefModelCreationType(0), false);
        this.Item.Initialize(this, FName("VM_Item"), EEUIWidgetRefModelCreationType(0), true);
        this.CommonItem.Initialize(this, FName("VM_CommonItem"), EEUIWidgetRefModelCreationType(0), true);
        this.SelectableItem.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ShopGoodsItemDelegate.IsBound())
        {
            this.ShopGoodsItem.SetRef(this.ShopGoodsItemDelegate.Execute());
        }
        if (this.ItemDelegate.IsBound())
        {
            this.Item.SetRef(this.ItemDelegate.Execute());
        }
        if (this.CommonItemDelegate.IsBound())
        {
            this.CommonItem.SetRef(this.CommonItemDelegate.Execute());
        }
        if (this.SelectableItemDelegate.IsBound())
        {
            this.SelectableItem.SetRef(this.SelectableItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ShopGoodsItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("SyncItemModel"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("SyncCommonItemModel"));
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
