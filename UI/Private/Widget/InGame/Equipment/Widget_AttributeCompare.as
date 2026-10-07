
namespace UWidget_AttributeCompare
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AttributeCompare : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AttributeCompare> AttributeCompare;
    UPROPERTY()
    FGetEUIModelRef AttributeCompareDelegate;

    UWidget_AttributeCompare()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.AttributeCompare.Initialize(this, FName("VM_AttributeCompare"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AttributeCompareDelegate.IsBound())
        {
            this.AttributeCompare.SetRef(this.AttributeCompareDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AttributeCompare
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
