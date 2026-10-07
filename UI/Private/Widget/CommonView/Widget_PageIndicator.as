
namespace UWidget_PageIndicator
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_PageIndicator : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PageIndicator> IndicatorVM;
    UPROPERTY()
    FGetEUIModelRef IndicatorVMDelegate;

    UWidget_PageIndicator()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.IndicatorVM.Initialize(this, FName("VM_PageIndicator"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.IndicatorVMDelegate.IsBound())
        {
            this.IndicatorVM.SetRef(this.IndicatorVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PageIndicator
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
