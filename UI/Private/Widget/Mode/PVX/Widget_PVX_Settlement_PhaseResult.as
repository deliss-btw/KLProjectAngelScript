
namespace UWidget_PVX_Settlement_PhaseResult
{
    const int ViewID = 0;

}
class UWidget_PVX_Settlement_PhaseResult : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PVX_Settlement_PhaseResult> PhaseResult;
    UPROPERTY()
    FGetEUIModelRef PhaseResultDelegate;

    UWidget_PVX_Settlement_PhaseResult()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PhaseResult.Initialize(this, FName("VM_PVX_Settlement_PhaseResult"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PhaseResultDelegate.IsBound())
        {
            this.PhaseResult.SetRef(this.PhaseResultDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PVX_Settlement_PhaseResult
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
