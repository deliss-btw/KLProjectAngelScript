
namespace UWidget_BuffHoverDialog
{
    const int ViewID = 0;

}
class UWidget_BuffHoverDialog : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BuffHoverDialog> BuffHoverDialog;
    UPROPERTY()
    FGetEUIModelRef BuffHoverDialogDelegate;

    UWidget_BuffHoverDialog()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.BuffHoverDialog.Initialize(this, FName("VM_BuffHoverDialog"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.BuffHoverDialogDelegate.IsBound())
        {
            this.BuffHoverDialog.SetRef(this.BuffHoverDialogDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_BuffHoverDialog
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
