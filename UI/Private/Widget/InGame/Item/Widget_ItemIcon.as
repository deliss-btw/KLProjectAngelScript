
namespace UWidget_ItemIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemIcon : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Item> Item;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DisplayItem> DisplayItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonItem> CommonItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemIconAdapter> Adapter;
    FEUIModelWeakRef __Item;
    FEUIModelWeakRef __DisplayItem;
    FEUIModelWeakRef __CommonItem;
    UPROPERTY()
    FGetEUIModelRef ItemDelegate;
    UPROPERTY()
    FGetEUIModelRef DisplayItemDelegate;
    UPROPERTY()
    FGetEUIModelRef CommonItemDelegate;
    UPROPERTY()
    FGetEUIModelRef AdapterDelegate;

    UWidget_ItemIcon()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.RefreshAdapter();
        return;
    }
    void SetItemSource(const TEUIModelRef<FVM_Item> &inout InItem)
    {
        this.Item.SetRef(InItem);
        this.RefreshAdapter();
        return;
    }
    void SetDisplayItemSource(const TEUIModelRef<FVM_DisplayItem> &inout InDisplayItem)
    {
        this.DisplayItem.SetRef(InDisplayItem);
        this.RefreshAdapter();
        return;
    }
    void SetCommonItemSource(const TEUIModelRef<FVM_CommonItem> &inout InCommonItem)
    {
        this.CommonItem.SetRef(InCommonItem);
        this.RefreshAdapter();
        return;
    }
    UFUNCTION()
    void RefreshAdapter()
    {
        this.EnsureAdapter();
        if (!(this.Adapter.IsValid()))
        {
            return;
        }
        if (this.DisplayItem.IsValid())
        {
            TEUIModelRef<FVM_DisplayItem> local_4;
            local_4;
            local_4.SetupFromDisplayItem();
            return;
        }
        if (this.CommonItem.IsValid())
        {
            TEUIModelRef<FVM_CommonItem> local_6;
            local_6;
            local_6.SetupFromCommonItem();
            return;
        }
        if (this.Item.IsValid())
        {
            TEUIModelRef<FVM_Item> local_8;
            local_8;
            local_8.SetupFromItem();
            return;
        }
        return;
    }
    void EnsureAdapter()
    {
        if (!(this.Adapter.IsValid()))
        {
            this.Adapter.SetRef(TEUIModelRef<FVM_ItemIconAdapter>(::FVM_ItemIconAdapter::Create(this)));
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
        FVM_Item& local_6;
        FVM_DisplayItem& local_12;
        FVM_CommonItem& local_18;
        bool local_19;
        TEUIModelRef<FVM_Item> local_2 = this.Item.AsRef();
        TEUIModelRef<FVM_DisplayItem> local_8 = this.DisplayItem.AsRef();
        TEUIModelRef<FVM_CommonItem> local_14 = this.CommonItem.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_68 = FEUIReactiveSubscriberTrackScope(It);
            int local_69 = It.GetIndex();
            if (local_69 <= 0)
            {
                if (local_69 != 0)
                {
                }
                else
                {
                    this.Item.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_Item::__IndexOf_ItemConfig());
                        local_6.TrackPropertyRead(::FVM_Item::__IndexOf_Num());
                        local_6.TrackPropertyRead(::FVM_Item::__IndexOf_OptionalNum());
                        local_6.TrackPropertyRead(::FVM_Item::__IndexOf_NumStyle());
                    }
                    this.DisplayItem.TrackRead();
                    if (local_12)
                    {
                        local_12.TrackPropertyRead(::FVM_DisplayItem::__IndexOf_CommonItemVM());
                        local_12.TrackPropertyRead(::FVM_DisplayItem::__IndexOf_ItemImage());
                        local_12.TrackPropertyRead(::FVM_DisplayItem::__IndexOf_ItemImageTemp());
                        local_12.TrackPropertyRead(::FVM_DisplayItem::__IndexOf_CurDisplayState());
                    }
                    this.CommonItem.TrackRead();
                    if (local_18)
                    {
                        local_18.TrackPropertyRead(::FVM_CommonItem::__IndexOf_ItemImage());
                        local_18.TrackPropertyRead(::FVM_CommonItem::__IndexOf_ItemImageTemp());
                        local_18.TrackPropertyRead(::FVM_CommonItem::__IndexOf_CurDisplayState());
                    }
                    if (!(local_6))
                    {
                        local_19 = false;
                    }
                    else
                    {
                        local_19 = local_12;
                    }
                    if (!(!(local_19)) && local_18)
                    {
                        this.RefreshAdapter();
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
                XError(ELog(17), "Remaining observed model change: RefreshAdapter");
            }
            return;
        }
        this.__Item = local_2.opImplConv();
        this.__DisplayItem = local_8.opImplConv();
        this.__CommonItem = local_14.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Item.Initialize(this, FName("VM_Item"), EEUIWidgetRefModelCreationType(1), true);
        this.DisplayItem.Initialize(this, FName("VM_DisplayItem"), EEUIWidgetRefModelCreationType(1), true);
        this.CommonItem.Initialize(this, FName("VM_CommonItem"), EEUIWidgetRefModelCreationType(1), true);
        this.Adapter.Initialize(this, FName("VM_ItemIconAdapter"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
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
        if (this.AdapterDelegate.IsBound())
        {
            this.Adapter.SetRef(this.AdapterDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemIcon
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("RefreshAdapter"));
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
