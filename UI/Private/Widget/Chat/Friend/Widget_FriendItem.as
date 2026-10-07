
namespace UWidget_FriendItem
{
    const int ViewID = 0;

}
class UWidget_FriendItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_FriendItem> FriendRow;
    UPROPERTY()
    FEUIActionBinding Action_AcceptFriend;
    UPROPERTY()
    FEUIActionBinding Action_RefuseFriend;
    UPROPERTY()
    FEUIActionBinding Action_PrivateMsg;
    UPROPERTY()
    FEUIActionBinding Action_AddFriend;
    FEUIModelWeakRef __FriendRow;
    UPROPERTY()
    FGetEUIModelRef FriendRowDelegate;

    UWidget_FriendItem()
    {
        this.Action_AcceptFriend.SetbCollapseWhenUnfocused(true);
        this.Action_RefuseFriend.SetbCollapseWhenUnfocused(true);
        this.Action_PrivateMsg.SetbCollapseWhenUnfocused(true);
        this.Action_AddFriend.SetbCollapseWhenUnfocused(true);
        this.Action_AcceptFriend.ActionDisplay = true;
        this.Action_RefuseFriend.ActionDisplay = true;
        this.Action_PrivateMsg.ActionDisplay = true;
        this.Action_AddFriend.ActionDisplay = true;
        return;
    }
    UFUNCTION()
    void HandleActionState(const EFriendActionState ActionState)
    {
        this.Action_AcceptFriend.SetCollapsed((int(ActionState) != 3));
        this.Action_RefuseFriend.SetCollapsed((int(ActionState) != 3));
        this.Action_PrivateMsg.SetCollapsed((int(ActionState) != 2));
        this.Action_AddFriend.SetCollapsed((int(ActionState) != 0));
        return;
    }
    UFUNCTION()
    void FriendRow_OnRedDotClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void FriendRow_ChatWithPlayer() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void FriendRow_AddFriend() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void FriendRow_RefuseApplyFriend() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void FriendRow_AcceptApplyFriend() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_FriendItem& local_6;
        TEUIModelRef<FVM_FriendItem> local_2 = this.FriendRow.AsRef();
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
                    this.FriendRow.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_FriendItem::__IndexOf_ActionState());
                    }
                    if (local_6)
                    {
                        this.HandleActionState(local_6.GetActionState());
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
                XError(ELog(17), "Remaining observed model change: HandleActionState");
            }
            return;
        }
        this.__FriendRow = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.FriendRow.Initialize(this, FName("VM_FriendItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.FriendRowDelegate.IsBound())
        {
            this.FriendRow.SetRef(this.FriendRowDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_FriendItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleActionState"));
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
