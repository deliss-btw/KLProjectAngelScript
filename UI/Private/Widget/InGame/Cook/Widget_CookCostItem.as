
namespace UWidget_CookCostItem
{
    const int ViewID = 0;
}
namespace UWidget_WaitCookItem
{
    const int ViewID = 0;

}
class UWidget_CookCostItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CookCostItem> CookCostItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Item> ItemModels;
    FEUIModelWeakRef __CookCostItem;
    UPROPERTY()
    FGetEUIModelRef CookCostItemDelegate;
    UPROPERTY()
    FGetEUIModelRef ItemModelsDelegate;

    UWidget_CookCostItem()
    {
        return;
    }
    UFUNCTION()
    void OnCookCostItemModulesChanged(const TEUIModelRef<FVM_Item> &inout ChangedItemModel)
    {
        this.ItemModels.SetRef(ChangedItemModel);
        return;
    }
    UFUNCTION()
    void CookCostItem_SetItemSelected(const bool bSelected) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(bSelected);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CookCostItem_OnHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CookCostItem_OnLossHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    TDataObjectPtr<FItemConfig> ItemModels_ItemConfig() const
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
    int ItemModels_Num() const
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
    int ItemModels_OptionalNum() const
    {
        FVM_Item& local_2;
        return local_2 ? local_2.GetOptionalNum() : 0;
    }
    UFUNCTION()
    FText ItemModels_ItemCategory() const
    {
        FVM_Item& local_2;
        FText local_16 = local_2 ? local_2.GetItemCategory() : FText();
        return local_16;
    }
    UFUNCTION()
    FSlateBrush ItemModels_ItemIcon() const
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
    FText ItemModels_ItemOwnLimit() const
    {
        FVM_Item& local_2;
        FText local_16 = local_2 ? local_2.GetItemOwnLimit() : FText();
        return local_16;
    }
    UFUNCTION()
    bool ItemModels_ShouldShowNum() const
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
    bool ItemModels_ShouldShowOptionalNum() const
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
    bool ItemModels_ShouldShowOfMark() const
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
    bool ItemModels_ShouldShowRangeMark() const
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
    FSlateColor ItemModels_NumTextColor() const
    {
        FVM_Item& local_2;
        FSlateColor local_18 = local_2 ? local_2.GetNumTextColor() : FSlateColor();
        return local_18;
    }
    UFUNCTION()
    bool ItemModels_HasOwnLimit() const
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
    void ItemModels_OnCustomSelected() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CookCostItem& local_6;
        TEUIModelRef<FVM_CookCostItem> local_2 = this.CookCostItem.AsRef();
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
                    this.CookCostItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CookCostItem::__IndexOf_ItemModels());
                    }
                    if (local_6)
                    {
                        this.OnCookCostItemModulesChanged(local_6.GetItemModels());
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
                XError(ELog(17), "Remaining observed model change: OnCookCostItemModulesChanged");
            }
            return;
        }
        this.__CookCostItem = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CookCostItem.Initialize(this, FName("VM_CookCostItem"), EEUIWidgetRefModelCreationType(0), false);
        this.ItemModels.Initialize(this, FName("VM_Item"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CookCostItemDelegate.IsBound())
        {
            this.CookCostItem.SetRef(this.CookCostItemDelegate.Execute());
        }
        if (this.ItemModelsDelegate.IsBound())
        {
            this.ItemModels.SetRef(this.ItemModelsDelegate.Execute());
        }
        return;
    }
}

class UWidget_WaitCookItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Item> CookCostItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_WaitCookItem> WaitCookItem;
    UPROPERTY()
    FGetEUIModelRef CookCostItemDelegate;
    UPROPERTY()
    FGetEUIModelRef WaitCookItemDelegate;

    UWidget_WaitCookItem()
    {
        return;
    }
    UFUNCTION()
    TDataObjectPtr<FItemConfig> CookCostItem_ItemConfig() const
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
    int CookCostItem_Num() const
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
    int CookCostItem_OptionalNum() const
    {
        FVM_Item& local_2;
        return local_2 ? local_2.GetOptionalNum() : 0;
    }
    UFUNCTION()
    FText CookCostItem_ItemCategory() const
    {
        FVM_Item& local_2;
        FText local_16 = local_2 ? local_2.GetItemCategory() : FText();
        return local_16;
    }
    UFUNCTION()
    FSlateBrush CookCostItem_ItemIcon() const
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
    FText CookCostItem_ItemOwnLimit() const
    {
        FVM_Item& local_2;
        FText local_16 = local_2 ? local_2.GetItemOwnLimit() : FText();
        return local_16;
    }
    UFUNCTION()
    bool CookCostItem_ShouldShowNum() const
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
    bool CookCostItem_ShouldShowOptionalNum() const
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
    bool CookCostItem_ShouldShowOfMark() const
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
    bool CookCostItem_ShouldShowRangeMark() const
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
    FSlateColor CookCostItem_NumTextColor() const
    {
        FVM_Item& local_2;
        FSlateColor local_18 = local_2 ? local_2.GetNumTextColor() : FSlateColor();
        return local_18;
    }
    UFUNCTION()
    bool CookCostItem_HasOwnLimit() const
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
    void CookCostItem_OnCustomSelected() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void WaitCookItem_SetItemSelected(const bool bSelected) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(bSelected);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void WaitCookItem_OnHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void WaitCookItem_OnLossHover() const
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
        this.CookCostItem.Initialize(this, FName("VM_Item"), EEUIWidgetRefModelCreationType(0), false);
        this.WaitCookItem.Initialize(this, FName("VM_WaitCookItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CookCostItemDelegate.IsBound())
        {
            this.CookCostItem.SetRef(this.CookCostItemDelegate.Execute());
        }
        if (this.WaitCookItemDelegate.IsBound())
        {
            this.WaitCookItem.SetRef(this.WaitCookItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CookCostItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCookCostItemModulesChanged"));
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
namespace UWidget_WaitCookItem
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
