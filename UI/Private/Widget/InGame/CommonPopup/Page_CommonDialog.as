
namespace UPage_CommonDialog
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UPage_CommonDialog : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonDialog> Dialog;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_InputActionList> ActionList;
    FEUIModelWeakRef __Dialog;
    UPROPERTY()
    FGetEUIModelRef DialogDelegate;
    UPROPERTY()
    FGetEUIModelRef ActionListDelegate;

    UPage_CommonDialog()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.ActionList = this.Dialog.opArrow().GetActionList().opImplConv();
        return;
    }
    UFUNCTION()
    void OnDialogShouldCloseChanged(const bool bShouldClose)
    {
        if (bShouldClose)
        {
            this.RemoveFromLayout();
        }
        return;
    }
    UFUNCTION()
    void Dialog_OnActionListCallback(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Dialog_CloseDialogWithoutOption() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CommonDialog& local_6;
        TEUIModelRef<FVM_CommonDialog> local_2 = this.Dialog.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.Dialog.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CommonDialog::__IndexOf_bShouldClose());
                    }
                    if (local_6)
                    {
                        this.OnDialogShouldCloseChanged(local_6.GetbShouldClose());
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnDialogShouldCloseChanged");
            }
            return;
        }
        this.__Dialog = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Dialog.Initialize(this, FName("VM_CommonDialog"), EEUIWidgetRefModelCreationType(0), false);
        this.ActionList.Initialize(this, FName("VM_InputActionList"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DialogDelegate.IsBound())
        {
            this.Dialog.SetRef(this.DialogDelegate.Execute());
        }
        if (this.ActionListDelegate.IsBound())
        {
            this.ActionList.SetRef(this.ActionListDelegate.Execute());
        }
        return;
    }
}

namespace UPage_CommonDialog
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnDialogShouldCloseChanged"));
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
