
namespace UWidget_ForgeWeaponItemMaterial
{
    const int ViewID = 0;

}
class UWidget_ForgeWeaponItemMaterial : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ForgeWeaponItemMaterial> Material;
    UPROPERTY()
    FGetEUIModelRef MaterialDelegate;

    UWidget_ForgeWeaponItemMaterial()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Material.Initialize(this, FName("VM_ForgeWeaponItemMaterial"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MaterialDelegate.IsBound())
        {
            this.Material.SetRef(this.MaterialDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ForgeWeaponItemMaterial
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
