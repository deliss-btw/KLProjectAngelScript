
namespace UWidget_ForgeWeaponItemMaterialItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ForgeWeaponItemMaterialItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ForgeWeaponItemMaterialItem> Item;
    UPROPERTY()
    FGetEUIModelRef ItemDelegate;

    UWidget_ForgeWeaponItemMaterialItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Item.Initialize(this, FName("VM_ForgeWeaponItemMaterialItem"), EEUIWidgetRefModelCreationType(0), false);
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

namespace UWidget_ForgeWeaponItemMaterialItem
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
