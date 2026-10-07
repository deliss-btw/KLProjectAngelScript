
namespace UWidget_TeamMemberConfirmPopup
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TeamMemberConfirmPopup : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TeamMemberConfirm> ConfirmVM;
    UPROPERTY()
    FEUIActionBinding AgreeBinding;
    UPROPERTY()
    FEUIActionBinding RejectBinding;
    FEUIModelWeakRef __ConfirmVM;
    UPROPERTY()
    FGetEUIModelRef ConfirmVMDelegate;

    UWidget_TeamMemberConfirmPopup()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.PlayAnimation(this.Anim_In, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        return;
    }
    UFUNCTION()
    void OnReplyCountdownSecondsChanged(const int Seconds)
    {
        this.RejectBinding.SetOverrideDisplayText(FText::Format(NSLOCTEXT("DraftRejectCountdown", "ж‹’з»ќ({0}з§’)"), Seconds));
        return;
    }
    UFUNCTION()
    void OnIsOpenChanged(const bool bIsOpen)
    {
        if (!(bIsOpen))
        {
            this.RemoveFromLayout();
        }
        return;
    }
    UFUNCTION()
    void OnReplyStatusChanged(const int ReplyStatusIndex)
    {
        bool local_3 = (ReplyStatusIndex == 0);
        this.AgreeBinding.SetCollapsed(!(local_3));
        this.RejectBinding.SetCollapsed(!(local_3));
        return;
    }
    UFUNCTION()
    void ConfirmVM_OnAgree() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ConfirmVM_OnReject() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ConfirmVM_OnCancel() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_TeamMemberConfirm& local_6;
        TEUIModelRef<FVM_TeamMemberConfirm> local_2 = this.ConfirmVM.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.ConfirmVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_TeamMemberConfirm::__IndexOf_ReplyCountdownSeconds());
                }
                if (local_6)
                {
                    this.OnReplyCountdownSecondsChanged(local_6.GetReplyCountdownSeconds());
                }
                break;
            }
            case 1:
            {
                this.ConfirmVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_TeamMemberConfirm::__IndexOf_bIsOpen());
                }
                if (local_6)
                {
                    this.OnIsOpenChanged(local_6.GetbIsOpen());
                }
                break;
            }
            case 2:
            {
                this.ConfirmVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_TeamMemberConfirm::__IndexOf_ReplyStatusIndex());
                }
                if (local_6)
                {
                    this.OnReplyStatusChanged(local_6.GetReplyStatusIndex());
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
                XError(ELog(17), "Remaining observed model change: OnReplyCountdownSecondsChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnIsOpenChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnReplyStatusChanged");
            }
            return;
        }
        this.__ConfirmVM = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ConfirmVM.Initialize(this, FName("VM_TeamMemberConfirm"), EEUIWidgetRefModelCreationType(0), false);
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

namespace UWidget_TeamMemberConfirmPopup
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnReplyCountdownSecondsChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnIsOpenChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnReplyStatusChanged"));
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
