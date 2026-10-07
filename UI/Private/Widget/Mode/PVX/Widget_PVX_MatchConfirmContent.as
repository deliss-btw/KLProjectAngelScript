
namespace UWidget_PVX_MatchConfirmContent
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_PVX_MatchConfirmContent : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PVX_MatchConfirmContent> ContentVM;
    UPROPERTY()
    FGetEUIModelRef ContentVMDelegate;

    UWidget_PVX_MatchConfirmContent()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ContentVM.Initialize(this, FName("VM_PVX_MatchConfirmContent"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ContentVMDelegate.IsBound())
        {
            this.ContentVM.SetRef(this.ContentVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PVX_MatchConfirmContent
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
