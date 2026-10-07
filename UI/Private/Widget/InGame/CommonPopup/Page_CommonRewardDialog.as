
namespace UPage_CommonRewardDialog
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UPage_CommonRewardDialog : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonRewardDialog> Dialog;
    UPROPERTY()
    FEUIActionBinding ConfirmActionBinding;
    UPROPERTY()
    FEUIActionBinding CancelActionBinding;
    UPROPERTY()
    FGetEUIModelRef DialogDelegate;

    UPage_CommonRewardDialog()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        GetModify_CloseDelegate().BindUFunction(this, n"ClosePage");
        bool local_2 = false;
        for (auto& local_18 : GetOptions())
        {
            if (int(local_18.OptionType) == 1)
            {
                this.ConfirmActionBinding.SetInputAction(local_18.OptionAction.EnhancedAction);
                this.ConfirmActionBinding.SetOverrideDisplayText(local_18.OptionTextOverride);
                this.ConfirmActionBinding.Register(this);
                continue;
            }
            if (int(local_18.OptionType) == 2)
            {
                this.CancelActionBinding.SetInputAction(local_18.OptionAction.EnhancedAction);
                this.CancelActionBinding.SetOverrideDisplayText(local_18.OptionTextOverride);
                this.CancelActionBinding.Register(this);
                local_2 = true;
            }
        }
        if (!(local_2))
        {
            this.CancelActionBinding.SetCollapsed(true);
        }
        return;
    }
    UFUNCTION()
    void Dialog_OnConfirm() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Dialog_OnCancel() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Dialog_OnClose() const
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
        this.Dialog.Initialize(this, FName("VM_CommonRewardDialog"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DialogDelegate.IsBound())
        {
            this.Dialog.SetRef(this.DialogDelegate.Execute());
        }
        return;
    }
}

namespace UPage_CommonRewardDialog
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
