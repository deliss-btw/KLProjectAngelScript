
namespace UWidget_PVX_Settlement_PhasePerformance
{
    const int ViewID = 0;

}
class UWidget_PVX_Settlement_PhasePerformance : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PVX_Settlement_PhasePerformance> PhasePerformance;
    UPROPERTY()
    FGetEUIModelRef PhasePerformanceDelegate;

    UWidget_PVX_Settlement_PhasePerformance()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PhasePerformance.Initialize(this, FName("VM_PVX_Settlement_PhasePerformance"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PhasePerformanceDelegate.IsBound())
        {
            this.PhasePerformance.SetRef(this.PhasePerformanceDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PVX_Settlement_PhasePerformance
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
