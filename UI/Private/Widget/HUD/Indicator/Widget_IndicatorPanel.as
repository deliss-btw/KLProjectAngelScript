
namespace UWidget_IndicatorPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_IndicatorPanel : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_IndicatorList> IndicatorList;
    UPROPERTY()
    FGetEUIModelRef IndicatorListDelegate;

    UWidget_IndicatorPanel()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.IndicatorList.Initialize(this, FName("VM_IndicatorList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.IndicatorListDelegate.IsBound())
        {
            this.IndicatorList.SetRef(this.IndicatorListDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_IndicatorPanel
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
