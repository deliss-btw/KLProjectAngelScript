
namespace UWidget_ChatMain
{
    const int ViewID = 0;

}
class UWidget_ChatMain : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ChatMain> ChatMain;
    UPROPERTY()
    UEUICommonListView ChatList;
    UPROPERTY()
    UScrollBox FriendScroll;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonHoverProvider> ItemTipsProvider;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> HoverWidgetClass;
    UPROPERTY()
    UEUIImage ForItemTipsWidget;
    UPROPERTY()
    UWidget_ChatInput UI_Chat_Comp_InputBox;
    UPROPERTY()
    FConfigVM_CommonHoverProvider ItemTipsProviderConfig;
    FEUIModelWeakRef __ChatMain;
    UPROPERTY()
    FGetEUIModelRef ItemTipsProviderDelegate;

    UWidget_ChatMain()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.RegisterScrollRecipientExternal(this.ChatList);
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        this.UnregisterScrollRecipientExternal(this.ChatList);
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.ChatMain.IsValid())
        {
            OnChatMainOpened();
        }
        if (this.ChatList != nullptr)
        {
            this.ChatList.ScrollToBottom();
        }
        if (this.FriendScroll != nullptr)
        {
            this.FriendScroll.ScrollToEnd();
        }
        if (::FriendUtil::IsFriendSystemOpen())
        {
            ::FMS_FriendDataModel::Get(this).GS_RequestFriendList();
        }
        ::FMS_ChatDataModel::Get(this).GS_RequestOfflineChatMsg();
        if (this.ItemTipsProvider)
        {
            this.ForItemTipsWidget.SetHoverForWidget();
            this.HoverWidgetClass.SetHoverWidgetClass();
        }
        TEUIModelRef<FVM_CommonHoverProvider> local_8;
        local_8;
        local_8.SetItemHoverProvider();
        return;
    }
    UFUNCTION()
    void OnViewUnBind_Implementation()
    {
        if (this.ChatMain.IsValid())
        {
            TEUIModelRef<FVM_CommonHoverProvider>(nullptr).SetItemHoverProvider();
        }
        return;
    }
    UFUNCTION()
    FEventReply OnPreviewKeyDown_Implementation(const FGeometry &inout MyGeometry, const FKeyEvent &inout InKeyEvent)
    {
        if ((InKeyEvent.GetKey() == EKeys::Escape))
        {
            this.ClosePage(false);
            return FEventReply::Handled();
        }
        return FEventReply::Unhandled();
    }
    UFUNCTION()
    void OnCurrentMessagesUpdated()
    {
        int local_4;
        if ((!((this.ChatList != nullptr))))
        {
            return;
        }
        local_4 = GetPendingChatScrollToItemIndex();
        if (local_4 >= 0 && (local_4 < GetCurrentMessages().Num()))
        {
            FEUIModelRef local_22;
            local_22;
            this.ChatList.ScrollItemIntoView(FEUIModelContainer(local_22));
            ClearPendingChatListScroll();
            return;
        }
        this.ChatList.ScrollToBottom();
        return;
    }
    UFUNCTION()
    void OnChatEnterInput()
    {
        if (this.UI_Chat_Comp_InputBox != nullptr)
        {
            this.UI_Chat_Comp_InputBox.InputCommitThenFocusInput();
        }
        return;
    }
    UFUNCTION()
    void ChatMain_SelectPrivateChatPeer(const int Index) const
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
    void ChatMain_SetCurrentChatChannelTab(const int Index) const
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
    void ChatMain_SetCurrentChatFriendTab(const int Index) const
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
    void ChatMain_SetCurrentChatMainTab(const int Index) const
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
    void ChatMain_SubmitChatText(const FString &inout Text) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Text);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ChatMain_BeginChatWithAddedFriend() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ChatMain_BeginChatWithPlayer(const uint PlayerUid) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(PlayerUid);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ChatMain_ClearPendingChatListScroll() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ItemTipsProvider_NotifyMouseEnter() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ItemTipsProvider_NotifyMouseLeave() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ItemTipsProvider_NotifyGamepadFocusReceive() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ItemTipsProvider_NotifyGamepadFocusLoss() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ItemTipsProvider_NotifyClick() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ItemTipsProvider_PinCurrentHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ItemTipsProvider_PinOrOpenPinnedPassThrough() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_ChatMain& local_6;
        TEUIModelRef<FVMS_ChatMain> local_2 = this.ChatMain.AsRef();
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
                    this.ChatMain.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_ChatMain::__IndexOf_CurrentMessages());
                    }
                    if (local_6)
                    {
                        this.OnCurrentMessagesUpdated();
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
                XError(ELog(17), "Remaining observed model change: OnCurrentMessagesUpdated");
            }
            return;
        }
        this.__ChatMain = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ChatMain.Initialize(this, FName("VMS_ChatMain"), EEUIWidgetRefModelCreationType(0), false);
        this.ItemTipsProvider.Initialize(this, FName("VM_CommonHoverProvider"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemTipsProviderDelegate.IsBound())
        {
            this.ItemTipsProvider.SetRef(this.ItemTipsProviderDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ChatMain
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCurrentMessagesUpdated"));
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
