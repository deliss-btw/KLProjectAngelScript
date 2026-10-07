
namespace FMS_ChatRuntimeData
{
    const int ModelId = 0;

}
struct FMsg_ChatMainTabSelected : FEUIMessage
{
    UPROPERTY()
    EChatMainTab SelectTab;


}

struct FMsg_ChatChannelTabSelected : FEUIMessage
{
    UPROPERTY()
    EChatChannelParentType ParentType;
    UPROPERTY()
    int SelectChannelID = 0;


}

struct FMsg_ChatInputDeferredWeakTips : FEUIMessage
{
    UPROPERTY()
    FText Content;

    FMsg_ChatInputDeferredWeakTips()
    {
        return;
    }
}

struct FMS_ChatRuntimeData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    EChatMainTab m_SelectMainTab;
    UPROPERTY()
    EChatChannelTab m_SelectChannelTab;
    UPROPERTY()
    ELevelType m_LastChannelTabsLevelType;
    UPROPERTY()
    EChatFriendTab m_SelectFriendTab;
    UPROPERTY()
    uint m_SelectedPrivateChatPeerUid;
    UPROPERTY()
    uint m_SelectedFriendUid;
    UPROPERTY()
    TMap<EChatChannelTab, FString> m_ChannelTabInputDraft;
    UPROPERTY()
    TMap<uint, FString> m_PrivateChatPeerInputDraft;
    UPROPERTY()
    FString m_CachedSearchFriendInputText;
    UPROPERTY()
    bool m_bShowFriendSearchResult;
    UPROPERTY()
    uint m_SuccAddFriendUid;

    FMS_ChatRuntimeData()
    {
        this.m_SelectMainTab = EChatMainTab(0);
        this.m_SelectChannelTab = EChatChannelTab(1);
        this.m_LastChannelTabsLevelType = ELevelType(0);
        this.m_SelectFriendTab = EChatFriendTab(0);
        this.m_SelectedPrivateChatPeerUid = 0;
        this.m_SelectedFriendUid = 0;
        this.m_bShowFriendSearchResult = false;
        this.m_SuccAddFriendUid = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_ChatRuntimeData(const FMS_ChatRuntimeData &inout Other)
    {
        this.m_SelectMainTab = EChatMainTab(0);
        this.m_SelectChannelTab = EChatChannelTab(1);
        this.m_LastChannelTabsLevelType = ELevelType(0);
        this.m_SelectFriendTab = EChatFriendTab(0);
        this.m_SelectedPrivateChatPeerUid = 0;
        this.m_SelectedFriendUid = 0;
        this.m_bShowFriendSearchResult = false;
        this.m_SuccAddFriendUid = 0;
        this.m_SelectMainTab = Other.m_SelectMainTab;
        this.m_SelectChannelTab = Other.m_SelectChannelTab;
        this.m_LastChannelTabsLevelType = Other.m_LastChannelTabsLevelType;
        this.m_SelectFriendTab = Other.m_SelectFriendTab;
        this.m_SelectedPrivateChatPeerUid = int(Other.m_SelectedPrivateChatPeerUid);
        this.m_SelectedFriendUid = int(Other.m_SelectedFriendUid);
        this.m_ChannelTabInputDraft = Other.m_ChannelTabInputDraft;
        this.m_PrivateChatPeerInputDraft = Other.m_PrivateChatPeerInputDraft;
        this.m_CachedSearchFriendInputText = Other.m_CachedSearchFriendInputText;
        this.m_bShowFriendSearchResult = Other.m_bShowFriendSearchResult;
        this.m_SuccAddFriendUid = int(Other.m_SuccAddFriendUid);
        return;
    }
    FMS_ChatRuntimeData opAssign(const FMS_ChatRuntimeData &inout Other)
    {
        FMS_ChatRuntimeData __r;
        this.m_SelectMainTab = Other.m_SelectMainTab;
        this.m_SelectChannelTab = Other.m_SelectChannelTab;
        this.m_LastChannelTabsLevelType = Other.m_LastChannelTabsLevelType;
        this.m_SelectFriendTab = Other.m_SelectFriendTab;
        this.m_SelectedPrivateChatPeerUid = int(Other.m_SelectedPrivateChatPeerUid);
        this.m_SelectedFriendUid = int(Other.m_SelectedFriendUid);
        this.m_ChannelTabInputDraft = Other.m_ChannelTabInputDraft;
        this.m_PrivateChatPeerInputDraft = Other.m_PrivateChatPeerInputDraft;
        this.m_CachedSearchFriendInputText = Other.m_CachedSearchFriendInputText;
        this.m_bShowFriendSearchResult = Other.m_bShowFriendSearchResult;
        this.m_SuccAddFriendUid = int(Other.m_SuccAddFriendUid);
        return __r;
    }
    void CacheCurrentChannelInputText(const FString &inout Text)
    {
        bool local_4;
        if (int(this.GetSelectMainTab()) == 0)
        {
            FString& local_6 = this.GetModify_ChannelTabInputDraft().FindOrAdd(EChatChannelTab(this.GetSelectChannelTab()));
            FString& local_6_2 = Text;
            return;
        }
        if (int(this.GetSelectMainTab()) != 1)
        {
            local_4 = false;
        }
        else
        {
            int local_8 = this.GetSelectedPrivateChatPeerUid();
            local_4 = (local_8 != 0);
        }
        if (local_4)
        {
            FString& local_6_3 = this.GetModify_PrivateChatPeerInputDraft().FindOrAdd(this.GetSelectedPrivateChatPeerUid());
            FString& local_6_4 = Text;
        }
        return;
    }
    void CacheSearchFriendInputText(const FString &inout Text)
    {
        if ((int(this.GetSelectMainTab())) == 2)
        {
            this.SetCachedSearchFriendInputText(Text);
        }
        return;
    }
    FString GetCachedInputTextForCurrentSelection() const
    {
        bool local_4;
        if (int(this.GetSelectMainTab()) == 0)
        {
            if (this.GetChannelTabInputDraft().Contains(EChatChannelTab(this.GetSelectChannelTab())))
            {
                return this.GetChannelTabInputDraft()[this.GetSelectChannelTab()];
            }
            return "";
        }
        if (int(this.GetSelectMainTab()) != 1)
        {
            local_4 = false;
        }
        else
        {
            int local_6 = this.GetSelectedPrivateChatPeerUid();
            local_4 = (local_6 != 0);
        }
        if (local_4)
        {
            if (this.GetPrivateChatPeerInputDraft().Contains(this.GetSelectedPrivateChatPeerUid()))
            {
                int local_7 = this.GetSelectedPrivateChatPeerUid();
                return this.GetPrivateChatPeerInputDraft()[local_7];
            }
            return "";
        }
        return "";
    }
    void ResetForLocalPlayerContextChange()
    {
        this.SetSelectMainTab(EChatMainTab(0));
        this.SetSelectChannelTab(EChatChannelTab(1));
        this.SetSelectFriendTab(EChatFriendTab(0));
        this.SetSelectedPrivateChatPeerUid(0);
        this.SetSelectedFriendUid(0);
        this.GetModify_ChannelTabInputDraft().Empty(0);
        this.GetModify_PrivateChatPeerInputDraft().Empty(0);
        this.SetCachedSearchFriendInputText("");
        this.SetbShowFriendSearchResult(false);
        this.SetSuccAddFriendUid(0);
        return;
    }
    void OnChatMainTabSelected(const FMsg_ChatMainTabSelected &inout Msg)
    {
        this.SetSelectMainTab(Msg.SelectTab);
        return;
    }
    void OnChatChannelTabSelected(const FMsg_ChatChannelTabSelected &inout Msg)
    {
        if (int(Msg.ParentType) == 0)
        {
            this.SetSelectChannelTab(EChatChannelTab(Msg.SelectChannelID));
            return;
        }
        this.SetSelectFriendTab(EChatFriendTab(Msg.SelectChannelID));
        return;
    }
    void OnFriendSearchResultUpdated(const FMsg_FriendSearchResultUpdated &inout Msg)
    {
        this.SetbShowFriendSearchResult(true);
        return;
    }
    EChatMainTab GetSelectMainTab() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SelectMainTab;
    }
    void SetSelectMainTab(const EChatMainTab __Value) property
    {
        if (int(this.m_SelectMainTab) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SelectMainTab = __Value;
        return;
    }
    EChatChannelTab GetSelectChannelTab() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SelectChannelTab;
    }
    void SetSelectChannelTab(const EChatChannelTab __Value) property
    {
        if (int(this.m_SelectChannelTab) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SelectChannelTab = __Value;
        return;
    }
    ELevelType GetLastChannelTabsLevelType() const property
    {
        this.TrackPropertyRead(2);
        return this.m_LastChannelTabsLevelType;
    }
    void SetLastChannelTabsLevelType(const ELevelType __Value) property
    {
        if (int(this.m_LastChannelTabsLevelType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_LastChannelTabsLevelType = __Value;
        return;
    }
    EChatFriendTab GetSelectFriendTab() const property
    {
        this.TrackPropertyRead(3);
        return this.m_SelectFriendTab;
    }
    void SetSelectFriendTab(const EChatFriendTab __Value) property
    {
        if (int(this.m_SelectFriendTab) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SelectFriendTab = __Value;
        return;
    }
    uint GetSelectedPrivateChatPeerUid() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SelectedPrivateChatPeerUid;
    }
    void SetSelectedPrivateChatPeerUid(const uint __Value) property
    {
        if (this.m_SelectedPrivateChatPeerUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SelectedPrivateChatPeerUid = __Value;
        return;
    }
    uint GetSelectedFriendUid() const property
    {
        this.TrackPropertyRead(5);
        return this.m_SelectedFriendUid;
    }
    void SetSelectedFriendUid(const uint __Value) property
    {
        if (this.m_SelectedFriendUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SelectedFriendUid = __Value;
        return;
    }
    const TMap<EChatChannelTab, FString> GetChannelTabInputDraft() const property
    {
        const TMap<EChatChannelTab, FString> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TMap<EChatChannelTab, FString> GetModify_ChannelTabInputDraft() property
    {
        TMap<EChatChannelTab, FString> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetChannelTabInputDraft(const TMap<EChatChannelTab, FString> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ChannelTabInputDraft = __Value;
        return;
    }
    const TMap<uint, FString> GetPrivateChatPeerInputDraft() const property
    {
        const TMap<uint, FString> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TMap<uint, FString> GetModify_PrivateChatPeerInputDraft() property
    {
        TMap<uint, FString> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetPrivateChatPeerInputDraft(const TMap<uint, FString> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_PrivateChatPeerInputDraft = __Value;
        return;
    }
    const FString GetCachedSearchFriendInputText() const property
    {
        const FString __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FString GetModify_CachedSearchFriendInputText() property
    {
        FString __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetCachedSearchFriendInputText(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CachedSearchFriendInputText = __Value;
        return;
    }
    bool GetbShowFriendSearchResult() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bShowFriendSearchResult;
    }
    void SetbShowFriendSearchResult(const bool __Value) property
    {
        if (!(this.m_bShowFriendSearchResult) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bShowFriendSearchResult = __Value;
        return;
    }
    uint GetSuccAddFriendUid() const property
    {
        this.TrackPropertyRead(10);
        return this.m_SuccAddFriendUid;
    }
    void SetSuccAddFriendUid(const uint __Value) property
    {
        if (this.m_SuccAddFriendUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_SuccAddFriendUid = __Value;
        return;
    }
}

namespace FMS_ChatRuntimeData
{
FMS_ChatRuntimeData& Get(const UObject ContextObject)
{
    return FMS_ChatRuntimeData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_ChatRuntimeData GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_ChatRuntimeData __r;
    TEUIModelRef<FMS_ChatRuntimeData> local_6 = TEUIModelRef<FMS_ChatRuntimeData>(EUIInternal::MakeModelWithManager(Manager, FMS_ChatRuntimeData::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__OnChatMainTabSelected";
    local_14.MessageTypeName = "Msg_ChatMainTabSelected";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnChatChannelTabSelected";
    local_14.MessageTypeName = "Msg_ChatChannelTabSelected";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnFriendSearchResultUpdated";
    local_14.MessageTypeName = "Msg_FriendSearchResultUpdated";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_ChatRuntimeData;
}
void __OnChatMainTabSelected(FMS_ChatRuntimeData &inout Model, const FMsg_ChatMainTabSelected &inout Message)
{
    Model.OnChatMainTabSelected(Message);
    return;
}
void __OnChatChannelTabSelected(FMS_ChatRuntimeData &inout Model, const FMsg_ChatChannelTabSelected &inout Message)
{
    Model.OnChatChannelTabSelected(Message);
    return;
}
void __OnFriendSearchResultUpdated(FMS_ChatRuntimeData &inout Model, const FMsg_FriendSearchResultUpdated &inout Message)
{
    Model.OnFriendSearchResultUpdated(Message);
    return;
}
int __IndexOf_SelectMainTab()
{
    return 0;
}
int __IndexOf_SelectChannelTab()
{
    return 1;
}
int __IndexOf_LastChannelTabsLevelType()
{
    return 2;
}
int __IndexOf_SelectFriendTab()
{
    return 3;
}
int __IndexOf_SelectedPrivateChatPeerUid()
{
    return 4;
}
int __IndexOf_SelectedFriendUid()
{
    return 5;
}
int __IndexOf_ChannelTabInputDraft()
{
    return 6;
}
int __IndexOf_PrivateChatPeerInputDraft()
{
    return 7;
}
int __IndexOf_CachedSearchFriendInputText()
{
    return 8;
}
int __IndexOf_bShowFriendSearchResult()
{
    return 9;
}
int __IndexOf_SuccAddFriendUid()
{
    return 10;
}
}
