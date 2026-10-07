
namespace FVMS_ChatMain
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectPrivateChatPeer = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SetCurrentChatChannelTab = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SetCurrentChatFriendTab = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SetCurrentChatMainTab = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SubmitChatText = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature BeginChatWithAddedFriend = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature BeginChatWithPlayer = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ClearPendingChatListScroll = FEUIModelCallbackSignature();

}
struct FVMS_ChatMain : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TEUIModelRef<FMS_ChatDataModel> m_ChatDataModel;
    UPROPERTY()
    TEUIModelRef<FMS_ChatRuntimeData> m_ChatRuntimeData;
    UPROPERTY()
    TEUIModelRef<FVM_ChatChannelPanel> m_ChannelPanel;
    UPROPERTY()
    TEUIModelRef<FVM_ChatPrivateChatPanel> m_PrivateChatPanel;
    UPROPERTY()
    TEUIModelRef<FVM_ChatFriendPanel> m_FriendPanel;
    UPROPERTY()
    TEUIModelRef<FVM_ChatUnReadTips> m_UnReadTips;
    UPROPERTY()
    float32 m_MainTabWidthSize;
    UPROPERTY()
    TArray<FEUIModelContainer> m_MainTabs;
    UPROPERTY()
    FEUIModelContainer m_SelectedMainTabItem;
    UPROPERTY()
    TArray<EChatMainTab> MainTabTypes;
    UPROPERTY()
    TEUIModelRef<FVM_ChatInputPanel> m_ChatInputPanel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ChatMessage>> m_CurrentMessages;
    UPROPERTY()
    int m_PendingChatScrollToItemIndex;
    UPROPERTY()
    EChatMainTab m_SelectedMainTab;
    UPROPERTY()
    int m_SelectMainTabIndex;
    UPROPERTY()
    int m_InnerMainContextStateIndex;
    UPROPERTY()
    TEUIModelRef<FVM_CommonHoverProvider> m_ItemHoverProvider;

    FVMS_ChatMain()
    {
        this.m_MainTabWidthSize = 36.0f;
        this.m_PendingChatScrollToItemIndex = -1;
        this.m_SelectedMainTab = EChatMainTab(0);
        this.m_SelectMainTabIndex = 0;
        this.m_InnerMainContextStateIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_ChatMain(const FVMS_ChatMain &inout Other)
    {
        this.m_MainTabWidthSize = 36.0f;
        this.m_PendingChatScrollToItemIndex = -1;
        this.m_SelectedMainTab = EChatMainTab(0);
        this.m_SelectMainTabIndex = 0;
        this.m_InnerMainContextStateIndex = 0;
        this.m_ChatDataModel = Other.m_ChatDataModel;
        this.m_ChatRuntimeData = Other.m_ChatRuntimeData;
        this.m_ChannelPanel = Other.m_ChannelPanel;
        this.m_PrivateChatPanel = Other.m_PrivateChatPanel;
        this.m_FriendPanel = Other.m_FriendPanel;
        this.m_UnReadTips = Other.m_UnReadTips;
        this.m_MainTabWidthSize = Other.m_MainTabWidthSize;
        this.m_MainTabs = Other.m_MainTabs;
        this.m_SelectedMainTabItem = Other.m_SelectedMainTabItem;
        this.m_ChatInputPanel = Other.m_ChatInputPanel;
        this.m_CurrentMessages = Other.m_CurrentMessages;
        this.m_PendingChatScrollToItemIndex = int(Other.m_PendingChatScrollToItemIndex);
        this.m_SelectedMainTab = Other.m_SelectedMainTab;
        this.m_SelectMainTabIndex = int(Other.m_SelectMainTabIndex);
        this.m_InnerMainContextStateIndex = int(Other.m_InnerMainContextStateIndex);
        this.m_ItemHoverProvider = Other.m_ItemHoverProvider;
        return;
    }
    FVMS_ChatMain& opAssign(const FVMS_ChatMain &inout Other)
    {
        this.m_ChatDataModel = Other.m_ChatDataModel;
        this.m_ChatRuntimeData = Other.m_ChatRuntimeData;
        this.m_ChannelPanel = Other.m_ChannelPanel;
        this.m_PrivateChatPanel = Other.m_PrivateChatPanel;
        this.m_FriendPanel = Other.m_FriendPanel;
        this.m_UnReadTips = Other.m_UnReadTips;
        this.m_MainTabWidthSize = Other.m_MainTabWidthSize;
        this.m_MainTabs = Other.m_MainTabs;
        this.m_SelectedMainTabItem = Other.m_SelectedMainTabItem;
        this.m_ChatInputPanel = Other.m_ChatInputPanel;
        this.m_CurrentMessages = Other.m_CurrentMessages;
        this.m_PendingChatScrollToItemIndex = int(Other.m_PendingChatScrollToItemIndex);
        this.m_SelectedMainTab = Other.m_SelectedMainTab;
        this.m_SelectMainTabIndex = int(Other.m_SelectMainTabIndex);
        this.m_InnerMainContextStateIndex = int(Other.m_InnerMainContextStateIndex);
        return Other.m_ItemHoverProvider;
    }
    void PostConstruct()
    {
        this.SetChatDataModel(TEUIModelRef<FMS_ChatDataModel>(::FMS_ChatDataModel::Get(this.GetContext().Manager)));
        this.SetChatRuntimeData(TEUIModelRef<FMS_ChatRuntimeData>(::FMS_ChatRuntimeData::Get(this.GetContext().Manager)));
        this.SetChannelPanel(TEUIModelRef<FVM_ChatChannelPanel>(::FVM_ChatChannelPanel::Create(this.GetContext().Manager)));
        this.SetPrivateChatPanel(TEUIModelRef<FVM_ChatPrivateChatPanel>(::FVM_ChatPrivateChatPanel::Create(this.GetContext().Manager)));
        this.SetFriendPanel(TEUIModelRef<FVM_ChatFriendPanel>(::FVM_ChatFriendPanel::Create(this.GetContext().Manager)));
        this.SetChatInputPanel(TEUIModelRef<FVM_ChatInputPanel>(::FVM_ChatInputPanel::Create(this.GetContext().Manager)));
        this.SetUnReadTips(TEUIModelRef<FVM_ChatUnReadTips>(::FVM_ChatUnReadTips::Create(this.GetContext().Manager)));
        this.RefreshMainContextStateIndex();
        this.RebuildMainTabViewModels();
        this.SyncMainTabVisualFromRuntime();
        this.RefreshAggregatedCurrentMessages();
        return;
    }
    void OnChatMainOpened()
    {
        if (this.GetChannelPanel().IsValid())
        {
            TEUIModelRef<FVM_ChatChannelPanel> local_2 = this.GetChannelPanel();
            TryRebuildChannelTabs();
        }
        return;
    }
    int GetMainContextStateIndex() const
    {
        return this.GetInnerMainContextStateIndex();
    }
    int GetChatContextStateIndex() const
    {
        return (int(this.GetSelectedMainTab())) == 2 ? 1 : 0;
    }
    int GetFriendContextStateIndex() const
    {
        return this.GetFriendPanel().opArrow().GetFriendContextStateIndex();
    }
    FText GetNoFriendTipsTips() const
    {
        return this.GetFriendPanel().opArrow().GetNoFriendTipsTips();
    }
    bool GetIsShowFriendNum() const
    {
        return this.GetFriendPanel().opArrow().GetbIsShowFriendNum();
    }
    bool GetIsShowSearchFriendResult() const
    {
        return this.GetFriendPanel().opArrow().GetIsShowSearchFriendResult();
    }
    int GetFriendSearchContextStateIndex() const
    {
        return this.GetFriendPanel().opArrow().GetSearchFriendContextStateIndex();
    }
    bool ShowChatUnread() const
    {
        if (this.GetUnReadTips().IsValid())
        {
            TEUIModelRef<FVM_ChatUnReadTips> local_2 = this.GetUnReadTips();
            return GetbIsShowUnReadMessageTips();
        }
        return false;
    }
    FText GetFriendSystemOpenTips() const
    {
        return this.GetFriendPanel().opArrow().GetFriendSystemOpenTips();
    }
    TArray<TEUIModelRef<FVM_ChatChannelTab>> GetChannelTabs() const
    {
        return this.GetChannelPanel().opArrow().GetChannelTabs();
    }
    FEUIModelContainer GetSelectedChannelTabItem() const
    {
        int local_8 = 0;
        EChatChannelTab local_5 = this.GetChatRuntimeData().opArrow().GetSelectChannelTab();
        int local_6 = int(local_5);
        TEUIModelRef<FVM_ChatChannelPanel> local_10 = this.GetChannelPanel();
        int local_11 = 0;
        for (; local_11 < local_8.Num(); ++local_11)
        {
            if (local_8[local_11].IsValid() && (GetTabChannelID() == local_6))
            {
                FEUIModelRef local_30;
                local_30;
                return FEUIModelContainer(local_30);
            }
        }
        return FEUIModelContainer();
    }
    TArray<FEUIModelContainer> GetPrivatePeerItems() const
    {
        return this.GetPrivateChatPanel().opArrow().GetPrivatePeerItems();
    }
    FEUIModelContainer GetSelectedPrivatePeerItem() const
    {
        return this.GetPrivateChatPanel().opArrow().GetSelectedPrivateChatPeerItem();
    }
    TArray<TEUIModelRef<FVM_ChatChannelTab>> GetFriendTabs() const
    {
        return this.GetFriendPanel().opArrow().GetFriendTabs();
    }
    TArray<TEUIModelRef<FVM_FriendItem>> GetFriendItemList() const
    {
        return this.GetFriendPanel().opArrow().GetContextFriendItemList();
    }
    FEUIModelContainer GetSelectedFriendTabItem() const
    {
        int local_8 = 0;
        EChatFriendTab local_5 = this.GetChatRuntimeData().opArrow().GetSelectFriendTab();
        int local_6 = int(local_5);
        TEUIModelRef<FVM_ChatFriendPanel> local_10 = this.GetFriendPanel();
        int local_11 = 0;
        for (; local_11 < local_8.Num(); ++local_11)
        {
            if (local_8[local_11].IsValid() && (GetTabChannelID() == local_6))
            {
                FEUIModelRef local_30;
                local_30;
                return FEUIModelContainer(local_30);
            }
        }
        return FEUIModelContainer();
    }
    TArray<TEUIModelRef<FVM_FriendItem>> GetSearchFriendItemList() const
    {
        return this.GetFriendPanel().opArrow().GetSearchFriendItemList();
    }
    void OnChatMainTabSelectedChange()
    {
        TEUIModelRef<FMS_ChatRuntimeData> local_6 = this.GetChatRuntimeData();
        XLog(ELog(74), FString().Append("OnChatMainTabSelectedChange: ").Append(int(GetSelectMainTab())));
        this.SyncMainTabVisualFromRuntime();
        this.RefreshMainContextStateIndex();
        this.RefreshAggregatedCurrentMessages();
        return;
    }
    void OnSystemUnlockFromGS(const FMsg_SystemUnlockFromGS &inout Msg)
    {
        this.RebuildMainTabViewModels();
        return;
    }
    void OnOpenPlayerBasicInfo(const FMsg_OpenPlayerBasicInfo &inout Msg)
    {
        if (int(Msg.PlayerUid) == 0)
        {
            return;
        }
        this.OpenPlayerBasicInfo(int(Msg.PlayerUid));
        return;
    }
    void OnPersistenceBoundPlayerChanged(const FMsg_ChatPersistenceBoundPlayerChanged &inout Msg)
    {
        this.SyncMainTabVisualFromRuntime();
        if (this.GetChannelPanel().IsValid())
        {
            TEUIModelRef<FVM_ChatChannelPanel> local_2 = this.GetChannelPanel();
            RefreshChannelTab();
        }
        if (this.GetPrivateChatPanel().IsValid())
        {
            TEUIModelRef<FVM_ChatPrivateChatPanel> local_6 = this.GetPrivateChatPanel();
            RebuildPrivatePeerList();
            TEUIModelRef<FVM_ChatPrivateChatPanel> local_6_2 = this.GetPrivateChatPanel();
            RefreshPanelMessages();
        }
        this.RefreshAggregatedCurrentMessages();
        this.RefreshMainContextStateIndex();
        this.SetPendingChatScrollToItemIndex(-1);
        return;
    }
    void HandleAddNewFriendSuccess(const FMsg_AddNewFriendSuccess &inout Msg)
    {
        const UChatSettings local_6;
        int local_1 = int(Msg.FriendUid);
        if (local_1 == 0)
        {
            return;
        }
        GetGameplaySettings<UChatSettings> local_8;
        local_6 = local_8;
        if ((!((local_6 != nullptr))))
        {
            return;
        }
        FPlayerBriefInfo local_28;
        if (::FriendUtil::TryGetFriendBrief(local_1, local_28))
        {
            int local_39;
            this.GetChatRuntimeData().opArrow().SetSuccAddFriendUid(local_1);
            FString local_34 = FString(local_28.GetNickname());
            local_39 = local_28.GetCurAvatarId();
            FSoftBrush local_84;
            if (::FAvatarPrefabConfig::GetByDataId(local_39).IsSet())
            {
            }
            FText local_148 = FText::Format(::ChatSystemUtil::ResolveKLTextData(local_6.AddFriendSuccessContentFormatTextData), FText::FromString(local_34));
            FSimpleModelEvent local_170;
            local_170.Add(this, FVMS_ChatMain::BeginChatWithAddedFriend);
            FInputActionListConstructParam local_174;
            local_174.InputActionListConstructParamItems.Add(FInputActionListConstructParamItem(FEUIInputAction(local_6.AddFriendSuccessConfirmAction), local_170));
            FCommonHintParam local_304;
            local_304.LifetimeOverride = local_6.AddFriendSuccessTimeDuration;
            FText local_136 = ::ChatSystemUtil::ResolveKLTextData(local_6.AddFriendSuccessTitleTextData);
            ::CommonPopup::LargeHintWithAction(local_84, local_136, local_148, local_174, local_304, 0);
        }
        return;
    }
    void OnChatWithPlayerByMsg(const FMsg_ChatWithPlayer &inout Msg)
    {
        if (int(Msg.PlayerUid) == 0)
        {
            return;
        }
        this.BeginChatWithPlayer(int(Msg.PlayerUid));
        return;
    }
    void OnChatSystemItemHyperlinkClicked(const FMsg_ChatSystemItemHyperlinkClicked &inout Msg)
    {
        int local_56 = 0;
        if (int(Msg.ItemDataId) == 0)
        {
            return;
        }
        TDataObjectPtr<FItemConfig> local_52 = ::FItemConfig::GetByDataId(int(Msg.ItemDataId));
        if (!(local_52))
        {
            return;
        }
        if (this.GetItemHoverProvider().IsValid())
        {
            TEUIModelRef<FVM_CommonHoverProvider> local_54 = this.GetItemHoverProvider();
            local_56.SetHoverModels(::CommonItemTip::MakeModels(this.GetContext().Manager, ::CommonItemTip::MakeSimpleFromItemConfig(local_52, 1)));
            if (local_56.GetHoverHandle().IsValid())
            {
                ::CommonPopup::SetHover(local_56.GetHoverHandle(), local_56.GetHoverModels(), this.GetContext().Manager);
            }
            else
            {
                UWidget local_142 = local_56.GetHoverForWidget();
                if (!(IsValid(local_142)))
                {
                    return;
                }
                bool local_3 = false;
                int local_146 = int(local_56.GetHoverLayout());
                local_56.SetHoverHandle(::CommonPopup::HoverCustom(local_142, local_56.GetHoverWidgetClass(), local_56.GetHoverModels(), true, false, ECommonHoverLayout(0), local_3));
            }
        }
        return;
    }
    void SelectPrivateChatPeer(const int Index)
    {
        this.GetPrivateChatPanel().opArrow().SelectPrivateChatPeerByIndex(Index);
        return;
    }
    void ApplyTabIndexSelected(const int Index, const TArray<TEUIModelRef<FVM_ChatChannelTab>> &inout Tabs) const
    {
        if (Tabs.IsValidIndex(Index))
        {
            const TEUIModelRef<FVM_ChatChannelTab>& local_4 = Tabs[Index];
            if (local_4.IsValid())
            {
                FMsg_ChatChannelTabSelected local_12;
                FEUIModelRef local_10 = local_4.opImplConv();
                FEUIMessageBus::Publish(EUIMessageBus);
                local_12.ParentType = local_4.opArrow().GetParentType();
                local_12.SelectChannelID = local_4.opArrow().GetTabChannelID();
            }
        }
        return;
    }
    void SetCurrentChatChannelTab(const int Index)
    {
        if (this.GetChannelPanel())
        {
            this.ApplyTabIndexSelected(Index, this.GetChannelPanel().opArrow().GetChannelTabs());
        }
        return;
    }
    void SetCurrentChatFriendTab(const int Index)
    {
        if (this.GetFriendPanel())
        {
            this.ApplyTabIndexSelected(Index, this.GetFriendPanel().opArrow().GetFriendTabs());
        }
        return;
    }
    void SetCurrentChatMainTab(const int Index)
    {
        if (this.MainTabTypes.IsValidIndex(Index))
        {
            FEUIModelRef local_8 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            EChatMainTab local_11 = this.MainTabTypes[Index];
            FMsg_ChatMainTabSelected local_10;
            local_10.SelectTab = EChatMainTab(local_11);
        }
        return;
    }
    void SubmitChatText(const FString &inout Text)
    {
        if (Text.IsEmpty())
        {
            return;
        }
        int local_2 = 0;
        int local_4 = 0;
        this.ResolveSendChannelAndTarget(local_2, local_4);
        if (local_2 == 0)
        {
            return;
        }
        if (::ChatSystemUtil::IsPrivateChatPbChannel(local_2) && (local_4 == 0))
        {
            return;
        }
        FEUIModelRef local_14 = this.GetChatDataModel().opImplConv();
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_SubmitChatText local_16;
        local_16.ChannelType = local_2;
        local_16.TargetUid = local_4;
        local_16.Text = Text;
        return;
    }
    bool CanSendChat() const
    {
        if (int(this.GetChatRuntimeData().opArrow().GetSelectMainTab()) == 0)
        {
            return this.GetChannelPanel().opArrow().CanSendOnChannelTab();
        }
        if (int(this.GetChatRuntimeData().opArrow().GetSelectMainTab()) == 1)
        {
            int local_9 = this.GetChatRuntimeData().opArrow().GetSelectedPrivateChatPeerUid();
            return (local_9 != 0);
        }
        return false;
    }
    void OnChannelPanelMessagesUpdated()
    {
        this.RefreshChannelPanelMessages();
        return;
    }
    void OnPrivateChatPanelMessagesUpdated()
    {
        this.RefreshPrivateChatPanelMessages();
        return;
    }
    void BeginChatWithAddedFriend()
    {
        this.BeginChatWithPlayer(this.GetChatRuntimeData().opArrow().GetSuccAddFriendUid());
        return;
    }
    void BeginChatWithPlayer(const uint PlayerUid)
    {
        if (PlayerUid == 0)
        {
            return;
        }
        this.TryOpenChatWidget();
        this.GetChatDataModel().opArrow().EnsurePrivatePeerThreadForPlayerEntry(PlayerUid);
        this.GetChatRuntimeData().opArrow().SetSelectedPrivateChatPeerUid(PlayerUid);
        TEUIModelRef<FMS_ChatRuntimeData> local_6 = this.GetChatRuntimeData();
        1.SetSelectMainTab();
        this.GetPrivateChatPanel().opArrow().RebuildPrivatePeerList();
        this.GetPrivateChatPanel().opArrow().RefreshPanelMessages();
        this.RefreshAggregatedCurrentMessages();
        this.RefreshMainContextStateIndex();
        if (this.GetChatInputPanel().IsValid())
        {
            TEUIModelRef<FVM_ChatInputPanel> local_12 = this.GetChatInputPanel();
            RequestChatInputFocus();
        }
        return;
    }
    void ClearPendingChatListScroll()
    {
        this.SetPendingChatScrollToItemIndex(-1);
        return;
    }
    void TryConsumeRedDot(const uint PeerUid)
    {
        if (PeerUid == 0)
        {
            return;
        }
        TEUIModelRef<FVM_ChatPrivateChatPanel> local_4 = this.GetPrivateChatPanel();
        PeerUid.TryConsumeRedDot();
        return;
    }
    void NavigateOpenAndScrollToHudMessage(const TEUIModelRef<FM_ChatMessage> &inout SourceMessage)
    {
        int local_5;
        bool local_1 = !(SourceMessage.IsValid());
        if (local_1)
        {
            return;
        }
        FM_ChatMessage local_4;
        local_5 = local_4.GetChannelType();
        if (local_5 == 0)
        {
            return;
        }
        this.TryOpenChatWidget();
        bool local_1_2 = ::ChatSystemUtil::IsPrivateChatPbChannel(local_5);
        if (local_1_2)
        {
            TEUIModelRef<FMS_ChatDataModel> local_10 = this.GetChatDataModel();
            int local_6 = local_4.GetResolvedPrivateChatPeerUidForNavigation();
            if (local_6 == 0)
            {
                return;
            }
            TEUIModelRef<FMS_ChatDataModel> local_10_2 = this.GetChatDataModel();
            local_6.EnsurePrivatePeerThreadForPlayerEntry();
            TEUIModelRef<FMS_ChatRuntimeData> local_12 = this.GetChatRuntimeData();
            local_6.SetSelectedPrivateChatPeerUid();
            int local_13 = 1;
            TEUIModelRef<FMS_ChatRuntimeData> local_12_2 = this.GetChatRuntimeData();
            local_13.SetSelectMainTab();
            TEUIModelRef<FVM_ChatPrivateChatPanel> local_16 = this.GetPrivateChatPanel();
            RebuildPrivatePeerList();
            TEUIModelRef<FVM_ChatPrivateChatPanel> local_16_2 = this.GetPrivateChatPanel();
            RefreshPanelMessages();
        }
        else
        {
            FMsg_ChatChannelTabSelected local_28;
            EChatChannelTab local_18 = ::ChatSystemUtil::TryPbChannelToChannelTab(local_5);
            if (int(local_18) == 0)
            {
                return;
            }
            int local_13_2 = 0;
            TEUIModelRef<FMS_ChatRuntimeData> local_12_3 = this.GetChatRuntimeData();
            local_13_2.SetSelectMainTab();
            FEUIModelRef local_26 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_28.ParentType = EChatChannelParentType(0);
            local_28.SelectChannelID = int(local_18);
            TEUIModelRef<FVM_ChatChannelPanel> local_32 = this.GetChannelPanel();
            RefreshChannelTab();
        }
        this.SetPendingChatScrollToItemIndex(this.FindPanelRowIndexForSourceMessage(SourceMessage, local_1_2));
        this.RefreshAggregatedCurrentMessages();
        this.RefreshMainContextStateIndex();
        return;
    }
    int FindPanelRowIndexForSourceMessage(const TEUIModelRef<FM_ChatMessage> &inout SourceMessage, const bool bPrivatePanel)
    {
        TEUIModelRef<FM_ChatMessage> local_18;
        TArray<TEUIModelRef<FVM_ChatMessage>> local_12;
        if (bPrivatePanel)
        {
            TEUIModelRef<FVM_ChatPrivateChatPanel> local_6 = this.GetPrivateChatPanel();
            local_12 = GetPanelMessages();
        }
        else
        {
            TEUIModelRef<FVM_ChatChannelPanel> local_8 = this.GetChannelPanel();
            local_12 = GetPanelMessages();
        }
        int local_13 = 0;
        for (; local_13 < local_12.Num(); ++local_13)
        {
            local_18.GetMessage();
            if (!(local_18.IsValid()))
            {
                continue;
            }
            local_18.GetMessage();
            if ((local_18 == SourceMessage.opImplConv()))
            {
                return local_13;
            }
        }
        return -1;
    }
    void TryOpenChatWidget()
    {
        FGameplayTag local_2 = FGameplayTag(GameplayTags::UI_Type_ChatMain);
        if (!(FEUIWidget::FindWidget(this.GetContext().UELocalPlayer, local_2)))
        {
            FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, local_2);
        }
        return;
    }
    void RefreshMainContextStateIndex()
    {
        int local_1 = 0;
        if (int(this.GetSelectedMainTab()) == 0)
        {
            local_1 = 0;
        }
        else
        {
            if (int(this.GetSelectedMainTab()) == 1)
            {
                if ((this.GetPrivateChatPanel().opArrow().GetPrivatePeerItems().Num()) == 0)
                {
                    local_1 = 1;
                }
            }
            else
            {
                if (int(this.GetSelectedMainTab()) == 2)
                {
                    bool local_5 = ::FriendUtil::IsFriendSystemOpen();
                    if (!(local_5))
                    {
                        local_1 = 2;
                    }
                }
            }
        }
        this.SetInnerMainContextStateIndex(local_1);
        return;
    }
    void RefreshAggregatedCurrentMessages()
    {
        this.RefreshChannelPanelMessages();
        this.RefreshPrivateChatPanelMessages();
        return;
    }
    void RefreshChannelPanelMessages()
    {
        if ((int(this.GetSelectedMainTab())) == 0)
        {
            this.GetModify_CurrentMessages().Empty(0);
            this.GetModify_CurrentMessages().Append(this.GetChannelPanel().opArrow().GetPanelMessages());
        }
        return;
    }
    void RefreshPrivateChatPanelMessages()
    {
        if ((int(this.GetSelectedMainTab())) == 1)
        {
            this.GetModify_CurrentMessages().Empty(0);
            this.GetModify_CurrentMessages().Append(this.GetPrivateChatPanel().opArrow().GetPanelMessages());
        }
        return;
    }
    void RebuildMainTabViewModels()
    {
        const UChatSettings local_4;
        EChatMainTab local_15;
        float32 local_60;
        this.GetModify_MainTabs().Empty(0);
        this.MainTabTypes.Empty(0);
        GetGameplaySettings<UChatSettings> local_6;
        local_4 = local_6;
        if ((!((local_4 != nullptr))))
        {
            return;
        }
        if (this.GetChatRuntimeData().IsValid())
        {
            local_15 = this.GetChatRuntimeData().opArrow().GetSelectMainTab();
        }
        else
        {
            local_15 = this.GetSelectedMainTab();
        }
        int local_16 = 0;
        for (; local_16 < local_4.ChatTabInfoConfigs.Num(); ++local_16)
        {
            FChatTabInfoConfig& local_20 = local_4.ChatTabInfoConfigs[local_16];
            if (local_20.bHide)
            {
                continue;
            }
            if (!(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(local_20.SystemModule), false)))
            {
                continue;
            }
            FVM_SelectableItem& local_24 = ::FVM_SelectableItem::Create(this.GetContext().Manager);
            local_24.SetbIsSelected((int(local_20.ChatMainTabType) == int(local_15)));
            FVM_CommonTabItem& local_28 = ::FVM_CommonTabItem::Create(this.GetContext().Manager);
            local_28.SetTitleText(::ChatSystemUtil::ResolveKLTextData(local_20.TabNameTextData));
            FEUIModelContainer local_46;
            FEUIModelRef local_48 = FEUIModelRef(local_24);
            local_46.AddModel(local_48, false);
            local_46.AddModel(local_48, false);
            local_48 = FEUIModelRef(local_28);
            local_46.AddModel(local_48, false);
            if (local_20.RedDotTabTag.IsValid())
            {
                FRedDotNodeData local_52 = FRedDotNodeData(local_20.RedDotTabTag, 0);
                local_46.AddModel(local_48, false);
            }
            this.MainTabTypes.Add(this.GetModify_MainTabs().Add(local_46));
        }
        int local_55 = 1119879168;
        int local_57 = 1108344832;
        int local_25 = this.GetMainTabs().Num();
        if (local_25 > 0)
        {
            local_60 = (local_25 * 96.0f) + (float32(local_25 - 1) * 36.0f);
        }
        else
        {
            local_60 = 0.0f;
        }
        this.SetMainTabWidthSize(local_60);
        return;
    }
    void SyncMainTabVisualFromRuntime()
    {
        this.SetSelectedMainTab(EChatMainTab(this.GetChatRuntimeData().opArrow().GetSelectMainTab()));
        FEUIModelContainer local_18;
        int local_19 = 0;
        for (; local_19 < this.MainTabTypes.Num(); ++local_19)
        {
            if (!(this.GetMainTabs().IsValidIndex(local_19)))
            {
                continue;
            }
            bool local_22 = (int(this.MainTabTypes[local_19]) == int(this.GetSelectedMainTab()));
            if (TEUIModelRef<FVM_SelectableItem>(FEUIModelContainer::GetModel(this.GetMainTabs()[local_19]).opCall()).IsValid())
            {
                local_22.SetbIsSelected();
            }
            if (local_22)
            {
                this.SetSelectMainTabIndex(local_19);
                local_18 = this.GetMainTabs()[local_19];
            }
        }
        this.SetSelectedMainTabItem(local_18);
        return;
    }
    void ResolveSendChannelAndTarget(uint &out OutChannel, uint &out OutTarget)
    {
        OutChannel = 0;
        OutTarget = 0;
        OutChannel = 0;
        OutTarget = 0;
        if (int(this.GetChatRuntimeData().opArrow().GetSelectMainTab()) == 0)
        {
            OutChannel = this.GetChannelPanel().opArrow().GetProtoChannelTypeForRuntimeSelection();
            return;
        }
        if (int(this.GetChatRuntimeData().opArrow().GetSelectMainTab()) == 1)
        {
            OutTarget = this.GetChatRuntimeData().opArrow().GetSelectedPrivateChatPeerUid();
            OutChannel = 6;
        }
        return;
    }
    void OpenPlayerBasicInfo(const uint PlayerUid)
    {
        const UChatSettings local_6;
        TEUIModelRef<FMS_ChatDataModel> local_2 = this.GetChatDataModel();
        if (PlayerUid == GetPersistedBoundPlayerUid())
        {
            GetGameplaySettings<UChatSettings> local_8;
            local_6 = local_8;
            if ((!((local_6 != nullptr))))
            {
                return;
            }
            FText local_18 = ::ChatSystemUtil::ResolveKLTextData(local_6.SelfBriefTipsTextData);
            if (local_18.IsEmpty())
            {
                return;
            }
            FCommonTipsParam local_22;
            ::CommonPopup::WeakTips(local_18, local_22);
            return;
        }
        FMS_PlayerBriefInfo& local_26 = ::FMS_PlayerBriefInfo::Get(this.GetManager());
        FPlayerBriefInfo local_62 = local_26.GetPlayerBriefInfo(PlayerUid);
        TEUIModelRef<FM_Player> local_68 = ::FMS_PlayerData::Get(this.GetManager()).UpdateOrCreateByBriefInfo(local_62, EPlayerInfoTrust(1));
        if (::FLevelUtils::GetCurrentLevelInfoConfig(nullptr))
        {
            ELevelType local_119;
            ELevelType local_120;
            local_119 = local_120;
            if (int(local_119) == 2)
            {
            }
            else
            {
                if (int(local_119) == 1)
                {
                }
                else
                {
                    if ((int(local_119) == 3 || (int(local_119) == 5)))
                    {
                    }
                }
            }
        }
        ::FVM_SocialViewPage::GotoPage(this.GetContext().UELocalPlayer, local_68, ESocialViewPageOpenType(0));
        return;
    }
    TEUIModelRef<FMS_ChatDataModel> GetChatDataModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ChatDataModel;
    }
    void SetChatDataModel(const TEUIModelRef<FMS_ChatDataModel> &inout __Value) property
    {
        TEUIModelRef<FMS_ChatDataModel> local_2;
        local_2 = this.m_ChatDataModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ChatDataModel = __Value;
        return;
    }
    TEUIModelRef<FMS_ChatRuntimeData> GetChatRuntimeData() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ChatRuntimeData;
    }
    void SetChatRuntimeData(const TEUIModelRef<FMS_ChatRuntimeData> &inout __Value) property
    {
        TEUIModelRef<FMS_ChatRuntimeData> local_2;
        local_2 = this.m_ChatRuntimeData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ChatRuntimeData = __Value;
        return;
    }
    TEUIModelRef<FVM_ChatChannelPanel> GetChannelPanel() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ChannelPanel;
    }
    void SetChannelPanel(const TEUIModelRef<FVM_ChatChannelPanel> &inout __Value) property
    {
        TEUIModelRef<FVM_ChatChannelPanel> local_2;
        local_2 = this.m_ChannelPanel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ChannelPanel = __Value;
        return;
    }
    TEUIModelRef<FVM_ChatPrivateChatPanel> GetPrivateChatPanel() const property
    {
        this.TrackPropertyRead(3);
        return this.m_PrivateChatPanel;
    }
    void SetPrivateChatPanel(const TEUIModelRef<FVM_ChatPrivateChatPanel> &inout __Value) property
    {
        TEUIModelRef<FVM_ChatPrivateChatPanel> local_2;
        local_2 = this.m_PrivateChatPanel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PrivateChatPanel = __Value;
        return;
    }
    TEUIModelRef<FVM_ChatFriendPanel> GetFriendPanel() const property
    {
        this.TrackPropertyRead(4);
        return this.m_FriendPanel;
    }
    void SetFriendPanel(const TEUIModelRef<FVM_ChatFriendPanel> &inout __Value) property
    {
        TEUIModelRef<FVM_ChatFriendPanel> local_2;
        local_2 = this.m_FriendPanel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_FriendPanel = __Value;
        return;
    }
    TEUIModelRef<FVM_ChatUnReadTips> GetUnReadTips() const property
    {
        this.TrackPropertyRead(5);
        return this.m_UnReadTips;
    }
    void SetUnReadTips(const TEUIModelRef<FVM_ChatUnReadTips> &inout __Value) property
    {
        TEUIModelRef<FVM_ChatUnReadTips> local_2;
        local_2 = this.m_UnReadTips;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_UnReadTips = __Value;
        return;
    }
    const float32 GetMainTabWidthSize() const property
    {
        const float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_MainTabWidthSize() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetMainTabWidthSize(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_MainTabWidthSize = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetMainTabs() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_MainTabs() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetMainTabs(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_MainTabs = __Value;
        return;
    }
    const FEUIModelContainer GetSelectedMainTabItem() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedMainTabItem() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetSelectedMainTabItem(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_SelectedMainTabItem = __Value;
        return;
    }
    TEUIModelRef<FVM_ChatInputPanel> GetChatInputPanel() const property
    {
        this.TrackPropertyRead(9);
        return this.m_ChatInputPanel;
    }
    void SetChatInputPanel(const TEUIModelRef<FVM_ChatInputPanel> &inout __Value) property
    {
        TEUIModelRef<FVM_ChatInputPanel> local_2;
        local_2 = this.m_ChatInputPanel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_ChatInputPanel = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_ChatMessage>> GetCurrentMessages() const property
    {
        const TArray<TEUIModelRef<FVM_ChatMessage>> __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ChatMessage>> GetModify_CurrentMessages() property
    {
        TArray<TEUIModelRef<FVM_ChatMessage>> __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetCurrentMessages(const TArray<TEUIModelRef<FVM_ChatMessage>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_CurrentMessages = __Value;
        return;
    }
    int GetPendingChatScrollToItemIndex() const property
    {
        this.TrackPropertyRead(11);
        return this.m_PendingChatScrollToItemIndex;
    }
    void SetPendingChatScrollToItemIndex(const int __Value) property
    {
        if (this.m_PendingChatScrollToItemIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_PendingChatScrollToItemIndex = __Value;
        return;
    }
    EChatMainTab GetSelectedMainTab() const property
    {
        this.TrackPropertyRead(12);
        return this.m_SelectedMainTab;
    }
    void SetSelectedMainTab(const EChatMainTab __Value) property
    {
        if (int(this.m_SelectedMainTab) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_SelectedMainTab = __Value;
        return;
    }
    int GetSelectMainTabIndex() const property
    {
        this.TrackPropertyRead(13);
        return this.m_SelectMainTabIndex;
    }
    void SetSelectMainTabIndex(const int __Value) property
    {
        if (this.m_SelectMainTabIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_SelectMainTabIndex = __Value;
        return;
    }
    int GetInnerMainContextStateIndex() const property
    {
        this.TrackPropertyRead(14);
        return this.m_InnerMainContextStateIndex;
    }
    void SetInnerMainContextStateIndex(const int __Value) property
    {
        if (this.m_InnerMainContextStateIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_InnerMainContextStateIndex = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonHoverProvider> GetItemHoverProvider() const property
    {
        this.TrackPropertyRead(15);
        return this.m_ItemHoverProvider;
    }
    void SetItemHoverProvider(const TEUIModelRef<FVM_CommonHoverProvider> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonHoverProvider> local_2;
        local_2 = this.m_ItemHoverProvider;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_ItemHoverProvider = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_ChatMain
{
    UPROPERTY()
    int MainContextStateIndex;
    UPROPERTY()
    int ChatContextStateIndex;
    UPROPERTY()
    int FriendContextStateIndex;
    UPROPERTY()
    FText NoFriendTipsTips;
    UPROPERTY()
    bool IsShowFriendNum;
    UPROPERTY()
    bool IsShowSearchFriendResult;
    UPROPERTY()
    int FriendSearchContextStateIndex;
    UPROPERTY()
    bool ShowChatUnread;
    UPROPERTY()
    FText FriendSystemOpenTips;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ChatChannelTab>> ChannelTabs;
    UPROPERTY()
    FEUIModelContainer SelectedChannelTabItem;
    UPROPERTY()
    TArray<FEUIModelContainer> PrivatePeerItems;
    UPROPERTY()
    FEUIModelContainer SelectedPrivatePeerItem;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ChatChannelTab>> FriendTabs;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_FriendItem>> FriendItemList;
    UPROPERTY()
    FEUIModelContainer SelectedFriendTabItem;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_FriendItem>> SearchFriendItemList;
    UPROPERTY()
    bool CanSendChat;
    UPROPERTY()
    TEUIModelRef<FVMS_ChatMain> Self;


}

namespace FVMS_ChatMain
{
FVMS_ChatMain& Get(const UObject ContextObject)
{
    return FVMS_ChatMain::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_ChatMain GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_ChatMain __r;
    TEUIModelRef<FVMS_ChatMain> local_6 = TEUIModelRef<FVMS_ChatMain>(EUIInternal::MakeModelWithManager(Manager, FVMS_ChatMain::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVMS_ChatMain;
}
void __OnChatMainTabSelectedChange(FVMS_ChatMain &inout Model)
{
    Model.OnChatMainTabSelectedChange();
    return;
}
void __OnSystemUnlockFromGS(FVMS_ChatMain &inout Model, const FMsg_SystemUnlockFromGS &inout Message)
{
    Model.OnSystemUnlockFromGS(Message);
    return;
}
void __OnOpenPlayerBasicInfo(FVMS_ChatMain &inout Model, const FMsg_OpenPlayerBasicInfo &inout Message)
{
    Model.OnOpenPlayerBasicInfo(Message);
    return;
}
void __OnPersistenceBoundPlayerChanged(FVMS_ChatMain &inout Model, const FMsg_ChatPersistenceBoundPlayerChanged &inout Message)
{
    Model.OnPersistenceBoundPlayerChanged(Message);
    return;
}
void __HandleAddNewFriendSuccess(FVMS_ChatMain &inout Model, const FMsg_AddNewFriendSuccess &inout Message)
{
    Model.HandleAddNewFriendSuccess(Message);
    return;
}
void __OnChatWithPlayerByMsg(FVMS_ChatMain &inout Model, const FMsg_ChatWithPlayer &inout Message)
{
    Model.OnChatWithPlayerByMsg(Message);
    return;
}
void __OnChatSystemItemHyperlinkClicked(FVMS_ChatMain &inout Model, const FMsg_ChatSystemItemHyperlinkClicked &inout Message)
{
    Model.OnChatSystemItemHyperlinkClicked(Message);
    return;
}
void __OnChannelPanelMessagesUpdated(FVMS_ChatMain &inout Model)
{
    Model.OnChannelPanelMessagesUpdated();
    return;
}
void __OnPrivateChatPanelMessagesUpdated(FVMS_ChatMain &inout Model)
{
    Model.OnPrivateChatPanelMessagesUpdated();
    return;
}
TEUIModelRef<FVM_ChatChannelPanel> __UIGetter_ChannelPanel(const FVMS_ChatMain &inout Model)
{
    return Model.GetChannelPanel();
}
TEUIModelRef<FVM_ChatPrivateChatPanel> __UIGetter_PrivateChatPanel(const FVMS_ChatMain &inout Model)
{
    return Model.GetPrivateChatPanel();
}
TEUIModelRef<FVM_ChatFriendPanel> __UIGetter_FriendPanel(const FVMS_ChatMain &inout Model)
{
    return Model.GetFriendPanel();
}
TEUIModelRef<FVM_ChatUnReadTips> __UIGetter_UnReadTips(const FVMS_ChatMain &inout Model)
{
    return Model.GetUnReadTips();
}
float32 __UIGetter_MainTabWidthSize(const FVMS_ChatMain &inout Model)
{
    return Model.GetMainTabWidthSize();
}
TArray<FEUIModelContainer> __UIGetter_MainTabs(const FVMS_ChatMain &inout Model)
{
    return Model.GetMainTabs();
}
FEUIModelContainer __UIGetter_SelectedMainTabItem(const FVMS_ChatMain &inout Model)
{
    return Model.GetSelectedMainTabItem();
}
TEUIModelRef<FVM_ChatInputPanel> __UIGetter_ChatInputPanel(const FVMS_ChatMain &inout Model)
{
    return Model.GetChatInputPanel();
}
TArray<TEUIModelRef<FVM_ChatMessage>> __UIGetter_CurrentMessages(const FVMS_ChatMain &inout Model)
{
    return Model.GetCurrentMessages();
}
int __UIGetter_SelectMainTabIndex(const FVMS_ChatMain &inout Model)
{
    return Model.GetSelectMainTabIndex();
}
int __UIGetter_MainContextStateIndex(const FVMS_ChatMain &inout Model)
{
    return Model.GetMainContextStateIndex();
}
int __UIGetter_ChatContextStateIndex(const FVMS_ChatMain &inout Model)
{
    return Model.GetChatContextStateIndex();
}
int __UIGetter_FriendContextStateIndex(const FVMS_ChatMain &inout Model)
{
    return Model.GetFriendContextStateIndex();
}
FText __UIGetter_NoFriendTipsTips(const FVMS_ChatMain &inout Model)
{
    return Model.GetNoFriendTipsTips();
}
bool __UIGetter_IsShowFriendNum(const FVMS_ChatMain &inout Model)
{
    return Model.GetIsShowFriendNum();
}
bool __UIGetter_IsShowSearchFriendResult(const FVMS_ChatMain &inout Model)
{
    return Model.GetIsShowSearchFriendResult();
}
int __UIGetter_FriendSearchContextStateIndex(const FVMS_ChatMain &inout Model)
{
    return Model.GetFriendSearchContextStateIndex();
}
bool __UIGetter_ShowChatUnread(const FVMS_ChatMain &inout Model)
{
    return Model.ShowChatUnread();
}
FText __UIGetter_FriendSystemOpenTips(const FVMS_ChatMain &inout Model)
{
    return Model.GetFriendSystemOpenTips();
}
TArray<TEUIModelRef<FVM_ChatChannelTab>> __UIGetter_ChannelTabs(const FVMS_ChatMain &inout Model)
{
    return Model.GetChannelTabs();
}
FEUIModelContainer __UIGetter_SelectedChannelTabItem(const FVMS_ChatMain &inout Model)
{
    return Model.GetSelectedChannelTabItem();
}
TArray<FEUIModelContainer> __UIGetter_PrivatePeerItems(const FVMS_ChatMain &inout Model)
{
    return Model.GetPrivatePeerItems();
}
FEUIModelContainer __UIGetter_SelectedPrivatePeerItem(const FVMS_ChatMain &inout Model)
{
    return Model.GetSelectedPrivatePeerItem();
}
TArray<TEUIModelRef<FVM_ChatChannelTab>> __UIGetter_FriendTabs(const FVMS_ChatMain &inout Model)
{
    return Model.GetFriendTabs();
}
TArray<TEUIModelRef<FVM_FriendItem>> __UIGetter_FriendItemList(const FVMS_ChatMain &inout Model)
{
    return Model.GetFriendItemList();
}
FEUIModelContainer __UIGetter_SelectedFriendTabItem(const FVMS_ChatMain &inout Model)
{
    return Model.GetSelectedFriendTabItem();
}
TArray<TEUIModelRef<FVM_FriendItem>> __UIGetter_SearchFriendItemList(const FVMS_ChatMain &inout Model)
{
    return Model.GetSearchFriendItemList();
}
bool __UIGetter_CanSendChat(const FVMS_ChatMain &inout Model)
{
    return Model.CanSendChat();
}
TEUIModelRef<FVMS_ChatMain> __UIGetter_Self(const FVMS_ChatMain &inout Model)
{
    return TEUIModelRef<FVMS_ChatMain>(Model);
}
int __IndexOf_ChatDataModel()
{
    return 0;
}
int __IndexOf_ChatRuntimeData()
{
    return 1;
}
int __IndexOf_ChannelPanel()
{
    return 2;
}
int __IndexOf_PrivateChatPanel()
{
    return 3;
}
int __IndexOf_FriendPanel()
{
    return 4;
}
int __IndexOf_UnReadTips()
{
    return 5;
}
int __IndexOf_MainTabWidthSize()
{
    return 6;
}
int __IndexOf_MainTabs()
{
    return 7;
}
int __IndexOf_SelectedMainTabItem()
{
    return 8;
}
int __IndexOf_ChatInputPanel()
{
    return 9;
}
int __IndexOf_CurrentMessages()
{
    return 10;
}
int __IndexOf_PendingChatScrollToItemIndex()
{
    return 11;
}
int __IndexOf_SelectedMainTab()
{
    return 12;
}
int __IndexOf_SelectMainTabIndex()
{
    return 13;
}
int __IndexOf_InnerMainContextStateIndex()
{
    return 14;
}
int __IndexOf_ItemHoverProvider()
{
    return 15;
}
}
namespace __GeneratedProperties_FVMS_ChatMain
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
