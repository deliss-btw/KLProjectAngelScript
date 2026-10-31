namespace UWidget_CommonComponentSlider
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonComponentSlider : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonComponentSlider> ComponentSlider;
    UPROPERTY()
    UWidget_CommonSlider w_slider;
    UPROPERTY()
    FGetEUIModelRef ComponentSliderDelegate;

    UWidget_CommonComponentSlider()
    {
        return;
    }
    UFUNCTION()
    void OnIncrease()
    {
        if (this.ComponentSlider.IsValid() && this.ComponentSlider.Get().GetCommonSliderVM().IsValid())
        {
            this.ComponentSlider.Get().GetCommonSliderVM().Get().StepCurrentRatio(1.0f);
        }
        return;
    }
    UFUNCTION()
    void OnDecrease()
    {
        if (this.ComponentSlider.IsValid() && this.ComponentSlider.Get().GetCommonSliderVM().IsValid())
        {
            this.ComponentSlider.Get().GetCommonSliderVM().Get().StepCurrentRatio(-1.0f);
        }
        return;
    }
    UFUNCTION()
    void ComponentSlider_BroadcastCurrentValue() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ComponentSlider_SetCurrentValueByRatio(const float32 Ratio) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Ratio);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ComponentSlider.Initialize(this, FName("VM_CommonComponentSlider"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ComponentSliderDelegate.IsBound())
        {
            this.ComponentSlider.SetRef(this.ComponentSliderDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonComponentSlider
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_CommonComponentSlider;
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
