
namespace UWidget_BuffHoverDialogRowInfo
{
    const int ViewID = 0;

}
class UWidget_BuffHoverDialogRowInfo : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BuffHoverDialogAttrItem> BuffHoverDialogRowInfo;
    UPROPERTY()
    FGetEUIModelRef BuffHoverDialogRowInfoDelegate;

    UWidget_BuffHoverDialogRowInfo()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.BuffHoverDialogRowInfo.Initialize(this, FName("VM_BuffHoverDialogAttrItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.BuffHoverDialogRowInfoDelegate.IsBound())
        {
            this.BuffHoverDialogRowInfo.SetRef(this.BuffHoverDialogRowInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_BuffHoverDialogRowInfo
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
