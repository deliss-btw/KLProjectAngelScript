
namespace UWidget_AttributeDisplay
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AttributeDisplay : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AttributeDisplay> AttributeDisplay;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AttributeDisplayExtend> AttributeDisplayExtend;
    UPROPERTY()
    FGetEUIModelRef AttributeDisplayDelegate;
    UPROPERTY()
    FGetEUIModelRef AttributeDisplayExtendDelegate;

    UWidget_AttributeDisplay()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.AttributeDisplay.Initialize(this, FName("VM_AttributeDisplay"), EEUIWidgetRefModelCreationType(0), false);
        this.AttributeDisplayExtend.Initialize(this, FName("VM_AttributeDisplayExtend"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AttributeDisplayDelegate.IsBound())
        {
            this.AttributeDisplay.SetRef(this.AttributeDisplayDelegate.Execute());
        }
        if (this.AttributeDisplayExtendDelegate.IsBound())
        {
            this.AttributeDisplayExtend.SetRef(this.AttributeDisplayExtendDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AttributeDisplay
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
