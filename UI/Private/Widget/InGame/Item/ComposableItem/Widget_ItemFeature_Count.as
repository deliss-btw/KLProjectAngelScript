
namespace UWidget_ItemFeature_Count
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemFeature_Count : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemFeature_Count> CountFeature;
    UPROPERTY()
    FGetEUIModelRef CountFeatureDelegate;

    UWidget_ItemFeature_Count()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CountFeature.Initialize(this, FName("VM_ItemFeature_Count"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CountFeatureDelegate.IsBound())
        {
            this.CountFeature.SetRef(this.CountFeatureDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemFeature_Count
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
