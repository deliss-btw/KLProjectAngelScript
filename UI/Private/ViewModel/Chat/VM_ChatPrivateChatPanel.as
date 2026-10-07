
namespace FVM_ChatPrivateChatPanel
{
    const int ModelId = 0;

}
struct FVM_ChatPrivateChatPanel : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FMS_ChatDataModel> m_ChatDataModel;
    UPROPERTY()
    TEUIModelRef<FMS_ChatRuntimeData> m_ChatRuntimeData;
    UPROPERTY()
    TArray<FEUIModelContainer> m_PrivatePeerItems;
    UPROPERTY()
    FEUIModelContainer m_SelectedPrivateChatPeerItem;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_FriendItem>> PrivatePeerFriendItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ChatMessage>> m_PanelMessages;
    UPROPERTY()
    TArray<TEUIModelRef<FM_ChatMessage>> m_VirtualTimeDividerModels;
    UPROPERTY()
    int m_SelectedPrivateChatPeerIndex;

    FVM_ChatPrivateChatPanel()
    {
        this.m_SelectedPrivateChatPeerIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_ChatPrivateChatPanel(const FVM_ChatPrivateChatPanel &inout Other)
    {
        this.m_SelectedPrivateChatPeerIndex = 0;
        this.m_ChatDataModel = Other.m_ChatDataModel;
        this.m_ChatRuntimeData = Other.m_ChatRuntimeData;
        this.m_PrivatePeerItems = Other.m_PrivatePeerItems;
        this.m_SelectedPrivateChatPeerItem = Other.m_SelectedPrivateChatPeerItem;
        this.m_PanelMessages = Other.m_PanelMessages;
        this.m_VirtualTimeDividerModels = Other.m_VirtualTimeDividerModels;
        this.m_SelectedPrivateChatPeerIndex = int(Other.m_SelectedPrivateChatPeerIndex);
        return;
    }
    FVM_ChatPrivateChatPanel opAssign(const FVM_ChatPrivateChatPanel &inout Other)
    {
        FVM_ChatPrivateChatPanel __r;
        this.m_ChatDataModel = Other.m_ChatDataModel;
        this.m_ChatRuntimeData = Other.m_ChatRuntimeData;
        this.m_PrivatePeerItems = Other.m_PrivatePeerItems;
        this.m_SelectedPrivateChatPeerItem = Other.m_SelectedPrivateChatPeerItem;
        this.m_PanelMessages = Other.m_PanelMessages;
        this.m_VirtualTimeDividerModels = Other.m_VirtualTimeDividerModels;
        this.m_SelectedPrivateChatPeerIndex = int(Other.m_SelectedPrivateChatPeerIndex);
        return __r;
    }
    void PostConstruct()
    {
        this.SetChatDataModel(TEUIModelRef<FMS_ChatDataModel>(::FMS_ChatDataModel::Get(this.GetContext().Manager)));
        this.SetChatRuntimeData(TEUIModelRef<FMS_ChatRuntimeData>(::FMS_ChatRuntimeData::Get(this.GetContext().Manager)));
        this.RebuildPrivatePeerList();
        this.SyncIndexByCachedPeerUid();
        this.OnSelectedPrivateChatPeerIndexChanged();
        return;
    }
    void OnPrivateChatPeerOrderChanged()
    {
        this.RebuildPrivatePeerList();
        this.SyncIndexByCachedPeerUid();
        return;
    }
    void OnSelectedPrivateChatPeerUidChanged()
    {
        this.SyncIndexByCachedPeerUid();
        return;
    }
    void OnPrivateChatUpdated(const FMsg_PrivateChatUpdated &inout Msg)
    {
        this.RefreshPanelMessages();
        return;
    }
    void TryConsumeRedDot(const uint PeerUid)
    {
        if (PeerUid == 0)
        {
            return;
        }
        int local_3 = 0;
        for (; local_3 < this.GetPanelMessages().Num(); ++local_3)
        {
            if (PeerUid.IsPlayerMsgUnRead())
            {
                break;
            }
        }
        XLog(ELog(74), FString().Append("Consume Red Dot: ").Append(PeerUid));
        int64 local_14 = PeerUid;
        ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(GameplayTags::RedDotSystem_Chat_PrivateMsg, local_14);
        return;
    }
    void RebuildPrivatePeerList()
    {
        int local_35;
        this.SetSelectedPrivateChatPeerIndex(this.GetChatDataModel().opArrow().GetPrivateChatPeerOrder().IndexOfByKey(this.GetChatRuntimeData().opArrow().GetSelectedPrivateChatPeerUid()));
        TMap<uint, TEUIModelRef<FVM_FriendItem>> local_26;
        int local_27 = 0;
        for (; local_27 < this.PrivatePeerFriendItems.Num(); )
        {
            local_26.Add(this.PrivatePeerFriendItems[local_27].opArrow().GetPlayerUid(), this.PrivatePeerFriendItems[local_27]);
            ++local_27;
        }
        this.GetModify_PrivatePeerItems().Empty(0);
        this.PrivatePeerFriendItems.Empty(0);
        TArray<uint> local_34 = this.GetChatDataModel().opArrow().GetPrivateChatPeerOrder();
        int local_27_2 = 0;
        for (; local_27_2 < local_34.Num(); )
        {
            local_35 = local_34[local_27_2];
            TEUIModelRef<FVM_FriendItem> local_38;
            if (local_26.Find(local_35, local_38))
            {
                SyncPrivateChatPeerDisplayFromModel();
            }
            else
            {
                FM_FriendRow& local_40 = ::FM_FriendRow::Create(this.GetContext().Manager);
                local_40.InitForPrivateChatPeer(local_35, this.GetChatDataModel().opArrow().GetPrivatePeerCachedBrief(local_35), this.GetContext().Manager);
                local_38 = TEUIModelRef<FVM_FriendItem>(::FVM_FriendItem::Create(this.GetContext().Manager, (TEUIModelRef<FM_FriendRow>(local_40))));
            }
            FVM_SelectableItem& local_64 = ::FVM_SelectableItem::Create(this.GetContext().Manager);
            local_64.SetbIsSelected((local_27_2 == this.GetSelectedPrivateChatPeerIndex()));
            FEUIModelContainer local_78;
            local_78.AddModel(FEUIModelRef(), false);
            local_78.AddModel(FEUIModelRef(local_64), false);
            this.GetModify_PrivatePeerItems().Add(local_78);
            this.PrivatePeerFriendItems.Add(local_38);
            ++local_27_2;
        }
        this.SyncSelectedPrivateChatPeerItem();
        return;
    }
    void SyncSelectedPrivateChatPeerItem()
    {
        FEUIModelContainer local_14;
        int local_15 = 0;
        for (; local_15 < this.GetPrivatePeerItems().Num(); ++local_15)
        {
            bool local_18 = (local_15 == this.GetSelectedPrivateChatPeerIndex());
            if (TEUIModelRef<FVM_SelectableItem>(FEUIModelContainer::GetModel(this.GetPrivatePeerItems()[local_15]).opCall()).IsValid())
            {
                local_18.SetbIsSelected();
            }
            if (local_18)
            {
                local_14 = this.GetPrivatePeerItems()[local_15];
            }
        }
        this.SetSelectedPrivateChatPeerItem(local_14);
        return;
    }
    void OnSelectedPrivateChatPeerIndexChanged()
    {
        this.RefreshPanelMessages();
        ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(GameplayTags::RedDotSystem_Chat_PrivateMsg, this.GetChatRuntimeData().opArrow().GetSelectedPrivateChatPeerUid());
        return;
    }
    void RefreshPanelMessages()
    {
        FM_ChatMessage& local_20;
        this.GetModify_PanelMessages().Empty(0);
        int local_2 = this.GetChatRuntimeData().opArrow().GetSelectedPrivateChatPeerUid();
        if (local_2 == 0)
        {
            return;
        }
        TArray<TEUIModelRef<FM_ChatMessage>> local_10;
        if (this.GetChatDataModel().opArrow().TryGetPrivateChatThreadMessages(local_2, local_10))
        {
            int local_13 = -1;
            int local_14 = 0;
            int local_15 = 0;
            for (; local_15 < local_10.Num(); )
            {
                TEUIModelRef<FM_ChatMessage> local_18 = local_10[local_15];
                int local_16 = ::ChatSystemUtil::GetUnixTimestampDisplayDayKey(::ChatSystemUtil::MsToUnixSeconds(local_20.GetSendTimeMs()));
                if (local_16 != local_13)
                {
                    this.EnsureVirtualTimeDividerAtIndex(local_14, local_20.GetChannelType(), local_20.GetSendTimeMs());
                    this.GetModify_PanelMessages().Add(TEUIModelRef<FVM_ChatMessage>(::FVM_ChatMessage::Create(this.GetContext().Manager, this.GetVirtualTimeDividerModels()[local_14])));
                    ++local_14;
                    local_13 = local_16;
                }
                this.GetModify_PanelMessages().Add(TEUIModelRef<FVM_ChatMessage>(::FVM_ChatMessage::Create(this.GetContext().Manager, local_18)));
                ++local_15;
            }
        }
        return;
    }
    void SelectPrivateChatPeerByIndex(const int Index)
    {
        if (Index < 0 || (Index >= this.PrivatePeerFriendItems.Num()))
        {
            return;
        }
        this.GetChatRuntimeData().opArrow().SetSelectedPrivateChatPeerUid(this.PrivatePeerFriendItems[Index].opArrow().GetPlayerUid());
        return;
    }
    void EnsureVirtualTimeDividerAtIndex(const int InIndex, const uint InChannelType, const uint64 InUnixTimestampMs)
    {
        while (this.GetVirtualTimeDividerModels().Num() <= InIndex)
        {
            this.GetModify_VirtualTimeDividerModels().Add(TEUIModelRef<FM_ChatMessage>(::FM_ChatMessage::Create(this.GetContext().Manager)));
        }
        this.GetVirtualTimeDividerModels()[InIndex].opArrow().FullToTimeSystemMessage(InChannelType, InUnixTimestampMs);
        return;
    }
    void SyncIndexByCachedPeerUid()
    {
        if (this.GetChatDataModel().opArrow().GetPrivateChatPeerOrder().Num() == 0)
        {
            this.SetSelectedPrivateChatPeerIndex(0);
            this.SyncSelectedPrivateChatPeerItem();
            return;
        }
        int local_9 = this.GetChatRuntimeData().opArrow().GetSelectedPrivateChatPeerUid();
        if (local_9 == 0 && (this.PrivatePeerFriendItems.Num() > 0))
        {
            this.GetChatRuntimeData().opArrow().SetSelectedPrivateChatPeerUid(this.PrivatePeerFriendItems[0].opArrow().GetPlayerUid());
        }
        this.SetSelectedPrivateChatPeerIndex(this.GetChatDataModel().opArrow().GetPrivateChatPeerOrder().IndexOfByKey(this.GetChatRuntimeData().opArrow().GetSelectedPrivateChatPeerUid()));
        this.SyncSelectedPrivateChatPeerItem();
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
    TArray<FEUIModelContainer> GetPrivatePeerItems() const property
    {
        TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_PrivatePeerItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPrivatePeerItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PrivatePeerItems = __Value;
        return;
    }
    const FEUIModelContainer GetSelectedPrivateChatPeerItem() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedPrivateChatPeerItem() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetSelectedPrivateChatPeerItem(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SelectedPrivateChatPeerItem = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_ChatMessage>> GetPanelMessages() const property
    {
        const TArray<TEUIModelRef<FVM_ChatMessage>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ChatMessage>> GetModify_PanelMessages() property
    {
        TArray<TEUIModelRef<FVM_ChatMessage>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetPanelMessages(const TArray<TEUIModelRef<FVM_ChatMessage>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PanelMessages = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_ChatMessage>> GetVirtualTimeDividerModels() const property
    {
        const TArray<TEUIModelRef<FM_ChatMessage>> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<TEUIModelRef<FM_ChatMessage>> GetModify_VirtualTimeDividerModels() property
    {
        TArray<TEUIModelRef<FM_ChatMessage>> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetVirtualTimeDividerModels(const TArray<TEUIModelRef<FM_ChatMessage>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_VirtualTimeDividerModels = __Value;
        return;
    }
    int GetSelectedPrivateChatPeerIndex() const property
    {
        this.TrackPropertyRead(6);
        return this.m_SelectedPrivateChatPeerIndex;
    }
    void SetSelectedPrivateChatPeerIndex(const int __Value) property
    {
        if (this.m_SelectedPrivateChatPeerIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SelectedPrivateChatPeerIndex = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ChatPrivateChatPanel
{
    UPROPERTY()
    TEUIModelRef<FVM_ChatPrivateChatPanel> Self;

    __GeneratedProperties_FVM_ChatPrivateChatPanel()
    {
        return;
    }
}

namespace FVM_ChatPrivateChatPanel
{
FVM_ChatPrivateChatPanel& Create(const UObject ContextObject)
{
    return FVM_ChatPrivateChatPanel::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ChatPrivateChatPanel CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_ChatPrivateChatPanel __r;
    TEUIModelRef<FVM_ChatPrivateChatPanel> local_6 = TEUIModelRef<FVM_ChatPrivateChatPanel>(EUIInternal::MakeModelWithManager(Manager, FVM_ChatPrivateChatPanel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_ChatPrivateChatPanel;
}
void __OnPrivateChatPeerOrderChanged(FVM_ChatPrivateChatPanel &inout Model)
{
    Model.OnPrivateChatPeerOrderChanged();
    return;
}
void __OnSelectedPrivateChatPeerUidChanged(FVM_ChatPrivateChatPanel &inout Model)
{
    Model.OnSelectedPrivateChatPeerUidChanged();
    return;
}
void __OnPrivateChatUpdated(FVM_ChatPrivateChatPanel &inout Model, const FMsg_PrivateChatUpdated &inout Message)
{
    Model.OnPrivateChatUpdated(Message);
    return;
}
void __OnSelectedPrivateChatPeerIndexChanged(FVM_ChatPrivateChatPanel &inout Model)
{
    Model.OnSelectedPrivateChatPeerIndexChanged();
    return;
}
TArray<FEUIModelContainer> __UIGetter_PrivatePeerItems(const FVM_ChatPrivateChatPanel &inout Model)
{
    return Model.GetPrivatePeerItems();
}
FEUIModelContainer __UIGetter_SelectedPrivateChatPeerItem(const FVM_ChatPrivateChatPanel &inout Model)
{
    return Model.GetSelectedPrivateChatPeerItem();
}
TArray<TEUIModelRef<FVM_ChatMessage>> __UIGetter_PanelMessages(const FVM_ChatPrivateChatPanel &inout Model)
{
    return Model.GetPanelMessages();
}
TEUIModelRef<FVM_ChatPrivateChatPanel> __UIGetter_Self(const FVM_ChatPrivateChatPanel &inout Model)
{
    return TEUIModelRef<FVM_ChatPrivateChatPanel>(Model);
}
int __IndexOf_ChatDataModel()
{
    return 0;
}
int __IndexOf_ChatRuntimeData()
{
    return 1;
}
int __IndexOf_PrivatePeerItems()
{
    return 2;
}
int __IndexOf_SelectedPrivateChatPeerItem()
{
    return 3;
}
int __IndexOf_PanelMessages()
{
    return 4;
}
int __IndexOf_VirtualTimeDividerModels()
{
    return 5;
}
int __IndexOf_SelectedPrivateChatPeerIndex()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_ChatPrivateChatPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
