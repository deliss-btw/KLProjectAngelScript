
namespace UWidget_ItemFeature_SpecialBg
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemFeature_SpecialBg : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemFeature_SpecialBg> SpecialBgFeature;
    UPROPERTY()
    FGetEUIModelRef SpecialBgFeatureDelegate;

    UWidget_ItemFeature_SpecialBg()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SpecialBgFeature.Initialize(this, FName("VM_ItemFeature_SpecialBg"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SpecialBgFeatureDelegate.IsBound())
        {
            this.SpecialBgFeature.SetRef(this.SpecialBgFeatureDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemFeature_SpecialBg
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
