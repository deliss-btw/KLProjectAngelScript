
namespace UWidget_EscapeButton
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_EscapeButton : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_EscapeButton> EscapeButton;
    UPROPERTY()
    FGetEUIModelRef EscapeButtonDelegate;

    UWidget_EscapeButton()
    {
        return;
    }
    UFUNCTION()
    void EscapeButton_OnClickEscapeButton() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.EscapeButton.Initialize(this, FName("VM_EscapeButton"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EscapeButtonDelegate.IsBound())
        {
            this.EscapeButton.SetRef(this.EscapeButtonDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_EscapeButton
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
