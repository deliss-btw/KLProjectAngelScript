
namespace UWidget_PendingConfirmItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_PendingConfirmItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PendingConfirmItem> ItemVM;
    UPROPERTY()
    FEUIActionBinding OnAcceptAction;
    UPROPERTY()
    FEUIActionBinding OnRefuseAction;
    UPROPERTY()
    FGetEUIModelRef ItemVMDelegate;

    UWidget_PendingConfirmItem()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.OnAcceptAction.SetDisabled(true);
        this.OnRefuseAction.SetDisabled(true);
        return;
    }
    UFUNCTION()
    void OnActionButtonClicked(const EPendingConfirmAction Action)
    {
        if (!(this.ItemVM.IsValid()))
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void FouceEntry()
    {
        this.OnAcceptAction.SetDisabled(false);
        this.OnRefuseAction.SetDisabled(false);
        return;
    }
    UFUNCTION()
    void FouceOut()
    {
        this.OnAcceptAction.SetDisabled(true);
        this.OnRefuseAction.SetDisabled(true);
        return;
    }
    UFUNCTION()
    void ItemVM_OnConfirm() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ItemVM_OnCancel() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ItemVM.Initialize(this, FName("VM_PendingConfirmItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemVMDelegate.IsBound())
        {
            this.ItemVM.SetRef(this.ItemVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PendingConfirmItem
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
