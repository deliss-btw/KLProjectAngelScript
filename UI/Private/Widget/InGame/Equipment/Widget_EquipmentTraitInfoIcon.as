
namespace UWidget_EquipmentTraitInfoIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_EquipmentTraitInfoIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TraitInfoIcon> TraitInfoIcon;
    UPROPERTY()
    FGetEUIModelRef TraitInfoIconDelegate;

    UWidget_EquipmentTraitInfoIcon()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TraitInfoIcon.Initialize(this, FName("VM_TraitInfoIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TraitInfoIconDelegate.IsBound())
        {
            this.TraitInfoIcon.SetRef(this.TraitInfoIconDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_EquipmentTraitInfoIcon
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
