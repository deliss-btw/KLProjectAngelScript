
namespace UWidget_ItemFeature_Grade
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemFeature_Grade : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemFeature_Grade> GradeFeature;
    UPROPERTY()
    FGetEUIModelRef GradeFeatureDelegate;

    UWidget_ItemFeature_Grade()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.GradeFeature.Initialize(this, FName("VM_ItemFeature_Grade"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.GradeFeatureDelegate.IsBound())
        {
            this.GradeFeature.SetRef(this.GradeFeatureDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemFeature_Grade
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
