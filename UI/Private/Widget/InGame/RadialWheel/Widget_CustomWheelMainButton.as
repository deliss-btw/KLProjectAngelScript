
namespace UWidget_CustomWheelMainButton
{
    const int ViewID = 0;

}
class UWidget_CustomWheelMainButton : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CustomWheelOptionButton> OptionButton;
    UPROPERTY()
    FGetEUIModelRef OptionButtonDelegate;

    UWidget_CustomWheelMainButton()
    {
        return;
    }
    UFUNCTION()
    void OptionButton_OnButtonClicked() const
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
        this.OptionButton.Initialize(this, FName("VM_CustomWheelOptionButton"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.OptionButtonDelegate.IsBound())
        {
            this.OptionButton.SetRef(this.OptionButtonDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CustomWheelMainButton
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
