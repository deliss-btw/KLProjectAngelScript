
namespace UWidget_ForgeWeaponItemAttribute
{
    const int ViewID = 0;

}
class UWidget_ForgeWeaponItemAttribute : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ForgeWeaponItemAttribute> Attribute;
    UPROPERTY()
    FGetEUIModelRef AttributeDelegate;

    UWidget_ForgeWeaponItemAttribute()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Attribute.Initialize(this, FName("VM_ForgeWeaponItemAttribute"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AttributeDelegate.IsBound())
        {
            this.Attribute.SetRef(this.AttributeDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ForgeWeaponItemAttribute
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
