
namespace UWidget_BuffHoverStackCount
{
    const int ViewID = 0;

}
class UWidget_BuffHoverStackCount : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BuffHoverStackCount> BuffHoverDialogStackCount;
    UPROPERTY()
    FGetEUIModelRef BuffHoverDialogStackCountDelegate;

    UWidget_BuffHoverStackCount()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.BuffHoverDialogStackCount.Initialize(this, FName("VM_BuffHoverStackCount"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.BuffHoverDialogStackCountDelegate.IsBound())
        {
            this.BuffHoverDialogStackCount.SetRef(this.BuffHoverDialogStackCountDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_BuffHoverStackCount
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
