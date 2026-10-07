
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
        bool local_1;
        if (!(this.ComponentSlider.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            TEUIModelRef<FVM_CommonSlider> local_4;
            local_4.GetCommonSliderVM();
            local_1 = local_4.IsValid();
        }
        if (local_1)
        {
            TEUIModelRef<FVM_CommonSlider> local_4;
            local_4.GetCommonSliderVM();
            1065353216.StepCurrentRatio();
        }
        return;
    }
    UFUNCTION()
    void OnDecrease()
    {
        bool local_1;
        if (!(this.ComponentSlider.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            TEUIModelRef<FVM_CommonSlider> local_4;
            local_4.GetCommonSliderVM();
            local_1 = local_4.IsValid();
        }
        if (local_1)
        {
            TEUIModelRef<FVM_CommonSlider> local_4;
            local_4.GetCommonSliderVM();
            -1082130432.StepCurrentRatio();
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
