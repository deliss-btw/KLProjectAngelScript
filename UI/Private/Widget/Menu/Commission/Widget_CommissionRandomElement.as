
namespace UWidget_CommissionRandomElement
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionRandomElement : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionRandomElement> CommissionRandomElement;
    UPROPERTY()
    FGetEUIModelRef CommissionRandomElementDelegate;

    UWidget_CommissionRandomElement()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionRandomElement.Initialize(this, FName("VM_CommissionRandomElement"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionRandomElementDelegate.IsBound())
        {
            this.CommissionRandomElement.SetRef(this.CommissionRandomElementDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionRandomElement
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
