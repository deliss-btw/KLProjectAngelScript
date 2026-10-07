
namespace UWidget_EquipmentTraitInfoHover
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_EquipmentTraitInfoHover : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TraitInfoHover> TraitInfoHover;
    UPROPERTY()
    FGetEUIModelRef TraitInfoHoverDelegate;

    UWidget_EquipmentTraitInfoHover()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TraitInfoHover.Initialize(this, FName("VM_TraitInfoHover"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TraitInfoHoverDelegate.IsBound())
        {
            this.TraitInfoHover.SetRef(this.TraitInfoHoverDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_EquipmentTraitInfoHover
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
