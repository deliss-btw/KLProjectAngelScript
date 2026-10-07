
namespace UWidget_CommonSlider
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonSlider : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonSlider> CommonSliderVM;
    UPROPERTY()
    FGetEUIModelRef CommonSliderVMDelegate;

    UWidget_CommonSlider()
    {
        return;
    }
    UFUNCTION()
    void CommonSliderVM_SetCurrentRatio(const float32 NewRatio) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(NewRatio);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CommonSliderVM_SetCurrentStep(const float32 NewStep) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(NewStep);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonSliderVM.Initialize(this, FName("VM_CommonSlider"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonSliderVMDelegate.IsBound())
        {
            this.CommonSliderVM.SetRef(this.CommonSliderVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonSlider
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
