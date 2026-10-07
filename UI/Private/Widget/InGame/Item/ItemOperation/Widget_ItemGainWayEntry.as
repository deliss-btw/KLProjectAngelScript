
namespace UWidget_ItemGainWayEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemGainWayEntry : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemGainWayItem> ItemGainWayItem;
    UPROPERTY()
    FGetEUIModelRef ItemGainWayItemDelegate;

    UWidget_ItemGainWayEntry()
    {
        return;
    }
    UFUNCTION()
    void ItemGainWayItem_OnClick() const
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
        this.ItemGainWayItem.Initialize(this, FName("VM_ItemGainWayItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemGainWayItemDelegate.IsBound())
        {
            this.ItemGainWayItem.SetRef(this.ItemGainWayItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemGainWayEntry
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
