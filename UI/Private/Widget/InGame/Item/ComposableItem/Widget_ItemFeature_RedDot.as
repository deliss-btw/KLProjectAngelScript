
namespace UWidget_ItemFeature_RedDot
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemFeature_RedDot : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemFeature_RedDot> RedDotFeature;
    UPROPERTY()
    FGetEUIModelRef RedDotFeatureDelegate;

    UWidget_ItemFeature_RedDot()
    {
        return;
    }
    UFUNCTION()
    void RedDotFeature_OnRedDotClicked() const
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
        this.RedDotFeature.Initialize(this, FName("VM_ItemFeature_RedDot"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.RedDotFeatureDelegate.IsBound())
        {
            this.RedDotFeature.SetRef(this.RedDotFeatureDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemFeature_RedDot
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
