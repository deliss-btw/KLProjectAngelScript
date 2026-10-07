
namespace UWidget_AvatarEquipmentCompareItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarEquipmentCompareItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarEquipmentCompareItem> CompareItem;
    UPROPERTY()
    FGetEUIModelRef CompareItemDelegate;

    UWidget_AvatarEquipmentCompareItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CompareItem.Initialize(this, FName("VM_AvatarEquipmentCompareItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CompareItemDelegate.IsBound())
        {
            this.CompareItem.SetRef(this.CompareItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarEquipmentCompareItem
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
