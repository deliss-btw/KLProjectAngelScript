
namespace UWidget_ItemFeature_Level
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemFeature_Level : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemFeature_Level> LevelFeature;
    UPROPERTY()
    FGetEUIModelRef LevelFeatureDelegate;

    UWidget_ItemFeature_Level()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.LevelFeature.Initialize(this, FName("VM_ItemFeature_Level"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.LevelFeatureDelegate.IsBound())
        {
            this.LevelFeature.SetRef(this.LevelFeatureDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemFeature_Level
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
