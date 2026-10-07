
namespace UWidget_CommissionTier
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionTier : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionTier> CommissionTier;
    UPROPERTY()
    FGetEUIModelRef CommissionTierDelegate;

    UWidget_CommissionTier()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionTier.Initialize(this, FName("VM_CommissionTier"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionTierDelegate.IsBound())
        {
            this.CommissionTier.SetRef(this.CommissionTierDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionTier
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
