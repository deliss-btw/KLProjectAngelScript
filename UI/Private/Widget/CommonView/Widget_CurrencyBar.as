
namespace UWidget_CurrencyBar
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CurrencyBar : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CurrencyBar> CurrencyBar;
    UPROPERTY()
    FConfigVM_CurrencyBar CurrencyBarConfig;
    UPROPERTY()
    FGetEUIModelRef CurrencyBarDelegate;

    UWidget_CurrencyBar()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CurrencyBar.Initialize(this, FName("VM_CurrencyBar"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CurrencyBarDelegate.IsBound())
        {
            this.CurrencyBar.SetRef(this.CurrencyBarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CurrencyBar
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
