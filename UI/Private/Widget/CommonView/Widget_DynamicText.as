
namespace UWidget_DynamicText
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_DynamicText : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Text> Text;
    UPROPERTY()
    FGetEUIModelRef TextDelegate;

    UWidget_DynamicText()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Text.Initialize(this, FName("VM_Text"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TextDelegate.IsBound())
        {
            this.Text.SetRef(this.TextDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_DynamicText
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
