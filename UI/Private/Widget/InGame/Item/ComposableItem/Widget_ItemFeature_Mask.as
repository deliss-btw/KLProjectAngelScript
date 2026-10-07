
namespace UWidget_ItemFeature_Mask
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemFeature_Mask : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemFeature_Mask> MaskFeature;
    UPROPERTY()
    FGetEUIModelRef MaskFeatureDelegate;

    UWidget_ItemFeature_Mask()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MaskFeature.Initialize(this, FName("VM_ItemFeature_Mask"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MaskFeatureDelegate.IsBound())
        {
            this.MaskFeature.SetRef(this.MaskFeatureDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemFeature_Mask
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
