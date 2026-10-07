
namespace UWidget_ItemTooltip
{
    const int ViewID = 0;

}
class UWidget_ItemTooltip : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Item> Item;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemAction> ItemAction;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemOperationList> ItemOperationList;
    UPROPERTY()
    FGetEUIModelRef ItemDelegate;
    UPROPERTY()
    FGetEUIModelRef ItemActionDelegate;
    UPROPERTY()
    FGetEUIModelRef ItemOperationListDelegate;

    UWidget_ItemTooltip()
    {
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
    TArray<FEUIModelWeakRef> ItemAction_ItemActionButtons() const
    {
        FVM_ItemAction& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetItemActionButtons());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void ItemAction_UseItem() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ItemAction_DropItem() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ItemAction_DestroyItem() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ItemAction_EquipItem() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ItemAction_OnMainAction() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ItemOperationList_OnItemClicked(const FEUIModelContainer &inout ListItem) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(ListItem);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ItemOperationList_HideList() const
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
        this.Item.Initialize(this, FName("VM_Item"), EEUIWidgetRefModelCreationType(0), false);
        this.ItemAction.Initialize(this, FName("VM_ItemAction"), EEUIWidgetRefModelCreationType(0), false);
        this.ItemOperationList.Initialize(this, FName("VM_ItemOperationList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemDelegate.IsBound())
        {
            this.Item.SetRef(this.ItemDelegate.Execute());
        }
        if (this.ItemActionDelegate.IsBound())
        {
            this.ItemAction.SetRef(this.ItemActionDelegate.Execute());
        }
        if (this.ItemOperationListDelegate.IsBound())
        {
            this.ItemOperationList.SetRef(this.ItemOperationListDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemTooltip
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
