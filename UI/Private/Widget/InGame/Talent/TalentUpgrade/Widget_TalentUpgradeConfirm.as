
namespace UWidget_TalentUpgradeConfirm
{
    const int ViewID = 0;

}
class UWidget_TalentUpgradeConfirm : UEUIActivatableWidget
{
    UPROPERTY()
    FEUIActionBinding ConfirmBtn;
    UPROPERTY()
    FEUIActionBinding CancelBtn;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentUpgradeConfirm> ConfirmVM;
    FEUIModelWeakRef __ConfirmVM;
    UPROPERTY()
    FGetEUIModelRef ConfirmVMDelegate;

    UWidget_TalentUpgradeConfirm()
    {
        return;
    }
    UFUNCTION()
    void OnPendingClose(const bool bPendingClose)
    {
        if (bPendingClose)
        {
            this.ClosePage(false);
        }
        return;
    }
    UFUNCTION()
    void OnCanUpgrade(const bool bCanUpgrade)
    {
        bool local_1 = !(bCanUpgrade);
        this.ConfirmBtn.SetDisabled(local_1);
        return;
    }
    UFUNCTION()
    void ConfirmVM_Confirm() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ConfirmVM_Cancel() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_TalentUpgradeConfirm& local_6;
        TEUIModelRef<FVM_TalentUpgradeConfirm> local_2 = this.ConfirmVM.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 1)
            {
                if (local_57 != 0)
                {
                    if (local_57 != 1)
                    {
                    }
                }
                else
                {
                    this.ConfirmVM.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TalentUpgradeConfirm::__IndexOf_bPendingClose());
                    }
                    if (local_6)
                    {
                        this.OnPendingClose(local_6.GetbPendingClose());
                    }
                    this.ConfirmVM.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TalentUpgradeConfirm::__IndexOf_bCanUpgrade());
                    }
                    if (local_6)
                    {
                        this.OnCanUpgrade(local_6.GetbCanUpgrade());
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
                XError(ELog(17), "Remaining observed model change: OnPendingClose");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnCanUpgrade");
            }
            return;
        }
        this.__ConfirmVM = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ConfirmVM.Initialize(this, FName("VM_TalentUpgradeConfirm"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ConfirmVMDelegate.IsBound())
        {
            this.ConfirmVM.SetRef(this.ConfirmVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentUpgradeConfirm
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnPendingClose"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCanUpgrade"));
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
