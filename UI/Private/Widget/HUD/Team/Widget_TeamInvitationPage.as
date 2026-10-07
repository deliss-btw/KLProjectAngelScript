
namespace UWidget_TeamInvitationPage
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TeamInvitationPage : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TeamInvitationPage> TeamInvitationPage;
    UPROPERTY()
    UEUICommonListView w_list_messages;
    FEUIModelWeakRef __TeamInvitationPage;
    UPROPERTY()
    FGetEUIModelRef TeamInvitationPageDelegate;

    UWidget_TeamInvitationPage()
    {
        return;
    }
    UFUNCTION()
    UWidget GetDesiredFocusWidget_Implementation() const
    {
        return this.w_list_messages;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.SyncMessageListSelectionAndFocus();
        return;
    }
    UFUNCTION()
    void OnFriendPlayerInfoListChanged()
    {
        this.SyncMessageListSelectionAndFocus();
        return;
    }
    UFUNCTION()
    void OnNearbyPlayerInfoListChanged()
    {
        this.SyncMessageListSelectionAndFocus();
        return;
    }
    void SyncMessageListSelectionAndFocus()
    {
        if (int(this.GetCurrentInputType()) != 1 || (this.w_list_messages == nullptr))
        {
            return;
        }
        if (this.w_list_messages.GetNumItems() <= 0)
        {
            return;
        }
        this.w_list_messages.SetSelectedIndex(0);
        this.w_list_messages.NavigateToIndex(0);
        this.RuleSetUserFocus(this.w_list_messages);
        return;
    }
    UFUNCTION()
    void TeamInvitationPage_SetMenuIndex(const int Index) const
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
    void TeamInvitationPage_NextMenu() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TeamInvitationPage_PrevMenu() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TeamInvitationPage_UpdateFriendPlayer() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TeamInvitationPage_FindNearbyPlayer() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_TeamInvitationPage& local_6;
        TEUIModelRef<FVM_TeamInvitationPage> local_2 = this.TeamInvitationPage.AsRef();
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
                    this.TeamInvitationPage.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TeamInvitationPage::__IndexOf_FriendPlayerInfoList());
                    }
                    if (local_6)
                    {
                        this.OnFriendPlayerInfoListChanged();
                    }
                    this.TeamInvitationPage.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TeamInvitationPage::__IndexOf_NearbyPlayerInfoList());
                    }
                    if (local_6)
                    {
                        this.OnNearbyPlayerInfoListChanged();
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
                XError(ELog(17), "Remaining observed model change: OnFriendPlayerInfoListChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnNearbyPlayerInfoListChanged");
            }
            return;
        }
        this.__TeamInvitationPage = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TeamInvitationPage.Initialize(this, FName("VM_TeamInvitationPage"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TeamInvitationPageDelegate.IsBound())
        {
            this.TeamInvitationPage.SetRef(this.TeamInvitationPageDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TeamInvitationPage
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnFriendPlayerInfoListChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnNearbyPlayerInfoListChanged"));
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
