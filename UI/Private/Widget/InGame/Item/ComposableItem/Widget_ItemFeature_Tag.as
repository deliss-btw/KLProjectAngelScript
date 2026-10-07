
namespace UWidget_ItemFeature_Tag
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemFeature_Tag : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemFeature_Tag> TagFeature;
    UPROPERTY()
    FGetEUIModelRef TagFeatureDelegate;

    UWidget_ItemFeature_Tag()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TagFeature.Initialize(this, FName("VM_ItemFeature_Tag"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TagFeatureDelegate.IsBound())
        {
            this.TagFeature.SetRef(this.TagFeatureDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemFeature_Tag
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
