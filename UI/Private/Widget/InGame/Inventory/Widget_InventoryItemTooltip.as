
namespace UWidget_InventoryItemTooltip
{
    const int ViewID = 0;

}
class UWidget_InventoryItemTooltip : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_InventoryItem> Item;
    UPROPERTY()
    FGetEUIModelRef ItemDelegate;

    UWidget_InventoryItemTooltip()
    {
        return;
    }
    UFUNCTION()
    void Item_FixItem() const
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
        this.Item.Initialize(this, FName("VM_InventoryItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemDelegate.IsBound())
        {
            this.Item.SetRef(this.ItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_InventoryItemTooltip
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
