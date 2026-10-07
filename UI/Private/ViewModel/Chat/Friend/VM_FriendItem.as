
enum EFriendActionState
{
    AddFriend,
    IsFriend,
    Chat,
    Apply,
}

namespace FVM_FriendItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnRedDotClicked = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ChatWithPlayer = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature AddFriend = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature RefuseApplyFriend = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature AcceptApplyFriend = FEUIModelCallbackSignature();

}
struct FVM_FriendItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_FriendRow> m_FriendRow;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerBasicItem> m_PlayerBasicItem;
    UPROPERTY()
    TEUIModelRef<FMS_ChatDataModel> m_ChatDataModel;
    UPROPERTY()
    TEUIModelRef<FMS_ChatRuntimeData> m_ChatRuntimeData;
    UPROPERTY()
    uint m_PlayerUid;
    UPROPERTY()
    FText m_TipsContextText;
    UPROPERTY()
    int m_TipsContextIndex;
    UPROPERTY()
    EFriendActionState m_ActionState;
    UPROPERTY()
    int m_ActionStateIndex;
    UPROPERTY()
    int m_OnlineStatusCache;
    UPROPERTY()
    FText m_IsFriendTipsText;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;

    FVM_FriendItem()
    {
        this.m_PlayerUid = 0;
        this.m_TipsContextIndex = 0;
        this.m_ActionState = EFriendActionState(0);
        this.m_ActionStateIndex = 0;
        this.m_OnlineStatusCache = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_FriendItem' by default constructor.");
        return;
    }
    FVM_FriendItem(const FVM_FriendItem &inout Other)
    {
        this.m_PlayerUid = 0;
        this.m_TipsContextIndex = 0;
        this.m_ActionState = EFriendActionState(0);
        this.m_ActionStateIndex = 0;
        this.m_OnlineStatusCache = 0;
        this.m_FriendRow = Other.m_FriendRow;
        this.m_PlayerBasicItem = Other.m_PlayerBasicItem;
        this.m_ChatDataModel = Other.m_ChatDataModel;
        this.m_ChatRuntimeData = Other.m_ChatRuntimeData;
        this.m_PlayerUid = int(Other.m_PlayerUid);
        this.m_TipsContextText = Other.m_TipsContextText;
        this.m_TipsContextIndex = int(Other.m_TipsContextIndex);
        this.m_ActionState = Other.m_ActionState;
        this.m_ActionStateIndex = int(Other.m_ActionStateIndex);
        this.m_OnlineStatusCache = int(Other.m_OnlineStatusCache);
        this.m_IsFriendTipsText = Other.m_IsFriendTipsText;
        this.m_RedDotVM = Other.m_RedDotVM;
        return;
    }
    FVM_FriendItem(const TEUIModelRef<FM_FriendRow> &inout InFriendRow)
    {
        this.m_PlayerUid = 0;
        this.m_TipsContextIndex = 0;
        this.m_ActionState = EFriendActionState(0);
        this.m_ActionStateIndex = 0;
        this.m_OnlineStatusCache = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetFriendRow(InFriendRow);
        return;
    }
    FVM_FriendItem& opAssign(const FVM_FriendItem &inout Other)
    {
        this.m_FriendRow = Other.m_FriendRow;
        this.m_PlayerBasicItem = Other.m_PlayerBasicItem;
        this.m_ChatDataModel = Other.m_ChatDataModel;
        this.m_ChatRuntimeData = Other.m_ChatRuntimeData;
        this.m_PlayerUid = int(Other.m_PlayerUid);
        this.m_TipsContextText = Other.m_TipsContextText;
        this.m_TipsContextIndex = int(Other.m_TipsContextIndex);
        this.m_ActionState = Other.m_ActionState;
        this.m_ActionStateIndex = int(Other.m_ActionStateIndex);
        this.m_OnlineStatusCache = int(Other.m_OnlineStatusCache);
        this.m_IsFriendTipsText = Other.m_IsFriendTipsText;
        return Other.m_RedDotVM;
    }
    void PostConstruct()
    {
        this.SetChatDataModel(TEUIModelRef<FMS_ChatDataModel>(::FMS_ChatDataModel::Get(this.GetContext().Manager)));
        this.SetChatRuntimeData(TEUIModelRef<FMS_ChatRuntimeData>(::FMS_ChatRuntimeData::Get(this.GetContext().Manager)));
        this.SetPlayerUid(this.GetFriendRow().opArrow().GetFriendUid());
        FText local_12;
        this.SetTipsContextText(local_12);
        if ((int(this.GetFriendRow().opArrow().GetRowType())) == 3)
        {
            this.SetPlayerBasicItem(TEUIModelRef<FVM_PlayerBasicItem>(::FVM_PlayerBasicItem::Create(this.GetContext().Manager, this.GetChatDataModel().opArrow().GetPrivatePeerCachedBrief(this.GetPlayerUid()))));
        }
        else
        {
            this.SetPlayerBasicItem(TEUIModelRef<FVM_PlayerBasicItem>(::FVM_PlayerBasicItem::Create(this.GetContext().Manager, this.GetFriendRow().opArrow().GetBrief())));
        }
        this.SetIsFriendTipsText(NSLOCTEXT("Friend", "IsFriendTipsText", "е·ІжЇеҐЅеЏ‹"));
        this.RefreshTipsContext();
        this.RefreshActionState();
        this.RefreshOnlineStatus();
        this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_Chat_PrivateMsg, this.GetPlayerUid()))));
        return;
    }
    int GetRelationshipIndex() const
    {
        if (this.GetFriendRow().IsValid())
        {
            return int(this.GetFriendRow().opArrow().GetPlayerRelationship());
        }
        return 0;
    }
    bool GetIsShowFriendTag() const
    {
        if (this.GetFriendRow().IsValid())
        {
            return (int(this.GetFriendRow().opArrow().GetPlayerRelationship()) == 1);
        }
        return false;
    }
    int GetOnlineStatus() const
    {
        return this.GetOnlineStatusCache();
    }
    float32 GetPlayerItemAlpha() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        float32 __r; return __r;
    }
    void OnFriendBriefChanged_RefreshOnline()
    {
        this.RefreshOnlineStatus();
        return;
    }
    void RefreshOnlineStatus()
    {
        int local_5 = this.GetFriendRow().IsValid() && this.GetFriendRow().opArrow().GetBrief().GetbIsOnline() ? 1 : 0;
        this.SetOnlineStatusCache(local_5);
        return;
    }
    void OnRedDotClicked()
    {
        if (!(this.GetFriendRow().IsValid()) || (int(this.GetFriendRow().opArrow().GetRowType()) != 3))
        {
            return;
        }
        ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(GameplayTags::RedDotSystem_Chat_PrivateMsg, this.GetPlayerUid());
        return;
    }
    void SyncPrivateChatPeerDisplayFromModel()
    {
        if (!(this.GetFriendRow().IsValid()) || (int(this.GetFriendRow().opArrow().GetRowType()) != 3))
        {
            return;
        }
        FPlayerBriefInfo local_48 = this.GetChatDataModel().opArrow().GetPrivatePeerCachedBrief(this.GetPlayerUid());
        TEUIModelRef<FM_FriendRow> local_2 = this.GetFriendRow();
        this.GetPlayerUid().InitForPrivateChatPeer(local_48, this.GetContext().Manager);
        if (this.GetPlayerBasicItem().IsValid())
        {
            TEUIModelRef<FVM_PlayerBasicItem> local_50 = this.GetPlayerBasicItem();
            local_48.RefreshFromBrief();
        }
        this.RefreshTipsContext();
        this.RefreshActionState();
        return;
    }
    void OnChatMainTabChanged_RefreshTips()
    {
        if (!(this.GetFriendRow().IsValid()))
        {
            return;
        }
        if (int(this.GetFriendRow().opArrow().GetRowType()) == 3)
        {
            this.RefreshTipsContext();
            return;
        }
        if ((int(this.GetFriendRow().opArrow().GetRowType())) == 1)
        {
            if (this.GetChatRuntimeData().IsValid() && (int(this.GetChatRuntimeData().opArrow().GetSelectMainTab()) == 2))
            {
                this.RefreshTipsContext();
            }
        }
        return;
    }
    void OnSelectFriendTabChanged_RefreshFriendApplyTips()
    {
        if (!(this.GetFriendRow().IsValid()) || (int(this.GetFriendRow().opArrow().GetRowType()) != 1))
        {
            return;
        }
        this.RefreshTipsContext();
        return;
    }
    void OnPrivateChatUpdatedForTips(const FMsg_PrivateChatUpdated &inout Msg)
    {
        if (!(this.GetFriendRow().IsValid()) || (int(this.GetFriendRow().opArrow().GetRowType()) != 3))
        {
            return;
        }
        if (int(Msg.PeerUid) != this.GetPlayerUid())
        {
            return;
        }
        this.RefreshTipsContext();
        return;
    }
    FString GetFriendName() const
    {
        if (!(this.GetFriendRow().IsValid()))
        {
            return FString();
        }
        if ((int(this.GetFriendRow().opArrow().GetRowType())) == 3)
        {
            return this.GetChatDataModel().opArrow().GetPrivatePeerCachedBrief(this.GetPlayerUid()).GetNickname();
        }
        return this.GetFriendRow().opArrow().GetBrief().GetNickname();
    }
    bool IsCurrentPeer() const
    {
        int local_1 = this.GetPlayerUid();
        return local_1 != 0 && (this.GetChatRuntimeData().opArrow().GetSelectedPrivateChatPeerUid() == this.GetPlayerUid());
    }
    FText GetPeerTitle() const
    {
        if (this.GetFriendRow().IsValid() && (int(this.GetFriendRow().opArrow().GetRowType()) == 3))
        {
            FText local_64;
            FPlayerBriefInfo local_48 = this.GetChatDataModel().opArrow().GetPrivatePeerCachedBrief(this.GetPlayerUid());
            if (local_48.GetNickname().IsEmpty())
            {
                FText::AsCultureInvariant(FString().Append(this.GetPlayerUid()));
                NSLOCTEXT("Friend", "PeerTitleUidFallback", "UID:{0}");
                FText::Format(local_64);
                return local_64;
            }
            FString local_52 = local_48.GetNickname();
            FText::FromString(local_64);
            return local_64;
        }
        TEUIModelRef<FM_FriendRow> local_2 = this.GetFriendRow();
        FPlayerBriefInfo local_48_2 = FPlayerBriefInfo(GetBrief());
        if (local_48_2.GetNickname().IsEmpty())
        {
            FText local_64;
            int local_29 = this.GetPlayerUid();
            FString local_52_2 = FString();
            FText::AsCultureInvariant(local_64);
            return FText::Format(NSLOCTEXT("Friend", "PeerTitleUidFallback", "UID:{0}"), local_64);
        }
        return FText::FromString(local_48_2.GetNickname());
    }
    FString GetPeerPreviewText() const
    {
        return this.GetChatDataModel().opArrow().GetPrivatePeerCachedPreview(this.GetPlayerUid());
    }
    void ChatWithPlayer()
    {
        if (!(this.GetFriendRow().IsValid()))
        {
            return;
        }
        TEUIModelRef<FM_FriendRow> local_2 = this.GetFriendRow();
        if ((int(GetRowType())) != 0)
        {
            return;
        }
        FEUIModelRef local_12 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_ChatWithPlayer local_14;
        local_14.PlayerUid = this.GetPlayerUid();
        return;
    }
    void AddFriend()
    {
        if (!(this.GetFriendRow().IsValid()) || (int(this.GetFriendRow().opArrow().GetRowType()) == 3))
        {
            return;
        }
        FEUIModelRef local_14 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_AddFriendRequest local_16;
        local_16.PlayerUid = this.GetPlayerUid();
        return;
    }
    void RefuseApplyFriend()
    {
        if (!(this.GetFriendRow().IsValid()) || (int(this.GetFriendRow().opArrow().GetRowType()) == 3))
        {
            return;
        }
        FEUIModelRef local_14 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_HandleFriendApply local_16;
        local_16.FriendUid = this.GetPlayerUid();
        local_16.bAccept = false;
        return;
    }
    void AcceptApplyFriend()
    {
        if (!(this.GetFriendRow().IsValid()) || (int(this.GetFriendRow().opArrow().GetRowType()) == 3))
        {
            return;
        }
        FEUIModelRef local_14 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_HandleFriendApply local_16;
        local_16.FriendUid = this.GetPlayerUid();
        local_16.bAccept = true;
        return;
    }
    FText BuildFriendApplyTipsText(const uint CreatedUnixSec) const
    {
        int local_17;
        if (CreatedUnixSec == 0)
        {
            return FText();
        }
        int local_1 = FDateTime::UtcNow().ToUnixTimestamp();
        if (local_1 < CreatedUnixSec)
        {
            return FText();
        }
        int local_7 = local_1 - CreatedUnixSec;
        int local_14 = 60;
        int local_15 = 3600;
        int local_16 = 86400;
        if (local_7 < 3600)
        {
            local_17 = FMath::IntegerDivisionTrunc(local_7, 60);
            if (local_17 < 1)
            {
                local_17 = 1;
            }
            if (local_17 > 59)
            {
                local_17 = 59;
            }
            return FText::Format(NSLOCTEXT("Friend", "FriendApplyTipsMinutes", "{0}е€†й’џе‰Ќз”іиЇ·"), local_17);
        }
        if (local_7 < 86400)
        {
            local_17 = FMath::IntegerDivisionTrunc(local_7, 3600);
            if (local_17 < 1)
            {
                local_17 = 1;
            }
            if (local_17 > 23)
            {
                local_17 = 23;
            }
            return FText::Format(NSLOCTEXT("Friend", "FriendApplyTipsHours", "{0}е°Џж—¶е‰Ќз”іиЇ·"), local_17);
        }
        local_17 = FMath::IntegerDivisionTrunc(local_7, 86400);
        if (local_17 < 1)
        {
            local_17 = 1;
        }
        return FText::Format(NSLOCTEXT("Friend", "FriendApplyTipsDays", "{0}е¤©е‰Ќз”іиЇ·"), local_17);
    }
    void RefreshTipsContext()
    {
        if (int(this.GetFriendRow().opArrow().GetRowType()) == 3)
        {
            if (this.GetChatRuntimeData().IsValid() && (int(this.GetChatRuntimeData().opArrow().GetSelectMainTab()) == 1))
            {
                FString local_22 = this.GetChatDataModel().opArrow().GetPrivatePeerCachedPreview(this.GetPlayerUid());
                if (!(local_22.IsEmpty()))
                {
                    this.SetTipsContextIndex(1);
                    this.SetTipsContextText(FText::FromString(local_22));
                    return;
                }
            }
            this.SetTipsContextIndex(1);
            this.SetTipsContextText(FText());
            return;
        }
        else
        {
            if (int(this.GetFriendRow().opArrow().GetRowType()) == 0 || (int(this.GetFriendRow().opArrow().GetRowType()) == 2))
            {
                this.SetTipsContextIndex(0);
                this.SetTipsContextText(FText());
                return;
            }
            else
            {
                if (int(this.GetFriendRow().opArrow().GetRowType()) == 1)
                {
                    this.SetTipsContextIndex(1);
                    TEUIModelRef<FM_FriendRow> local_2 = this.GetFriendRow();
                    this.SetTipsContextText(this.BuildFriendApplyTipsText(GetCreateTime()));
                    return;
                }
            }
        }
    }
    void RefreshActionState()
    {
        int local_1;
        local_1 = int(this.GetFriendRow().opArrow().GetRowType());
        if (local_1 == 2)
        {
            bool local_8 = ::FriendUtil::IsFriend(this.GetPlayerUid());
            if (local_8)
            {
                this.SetActionState(EFriendActionState(EFriendActionState(1)));
            }
            else
            {
                this.SetActionState(EFriendActionState(EFriendActionState(0)));
            }
        }
        else
        {
            int local_6 = local_1;
            if (local_6 == 0)
            {
                this.SetActionState(EFriendActionState(EFriendActionState(2)));
            }
            else
            {
                if (local_1 == 1)
                {
                    this.SetActionState(EFriendActionState(EFriendActionState(3)));
                }
                else
                {
                    if (local_1 == 3)
                    {
                        this.SetActionState(EFriendActionState(EFriendActionState(2)));
                    }
                }
            }
        }
        this.SetActionStateIndex(int(this.GetActionState()));
        return;
    }
    TEUIModelRef<FM_FriendRow> GetFriendRow() const property
    {
        this.TrackPropertyRead(0);
        return this.m_FriendRow;
    }
    void SetFriendRow(const TEUIModelRef<FM_FriendRow> &inout __Value) property
    {
        TEUIModelRef<FM_FriendRow> local_2;
        local_2 = this.m_FriendRow;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_FriendRow = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerBasicItem> GetPlayerBasicItem() const property
    {
        this.TrackPropertyRead(1);
        return this.m_PlayerBasicItem;
    }
    void SetPlayerBasicItem(const TEUIModelRef<FVM_PlayerBasicItem> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerBasicItem> local_2;
        local_2 = this.m_PlayerBasicItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PlayerBasicItem = __Value;
        return;
    }
    TEUIModelRef<FMS_ChatDataModel> GetChatDataModel() const property
    {
        this.TrackPropertyRead(2);
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
        this.MarkPropertyDirty(2);
        this.m_ChatDataModel = __Value;
        return;
    }
    TEUIModelRef<FMS_ChatRuntimeData> GetChatRuntimeData() const property
    {
        this.TrackPropertyRead(3);
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
        this.MarkPropertyDirty(3);
        this.m_ChatRuntimeData = __Value;
        return;
    }
    uint GetPlayerUid() const property
    {
        this.TrackPropertyRead(4);
        return this.m_PlayerUid;
    }
    void SetPlayerUid(const uint __Value) property
    {
        if (this.m_PlayerUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PlayerUid = __Value;
        return;
    }
    const FText GetTipsContextText() const property
    {
        const FText __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FText GetModify_TipsContextText() property
    {
        FText __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetTipsContextText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_TipsContextText = __Value;
        return;
    }
    int GetTipsContextIndex() const property
    {
        this.TrackPropertyRead(6);
        return this.m_TipsContextIndex;
    }
    void SetTipsContextIndex(const int __Value) property
    {
        if (this.m_TipsContextIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_TipsContextIndex = __Value;
        return;
    }
    EFriendActionState GetActionState() const property
    {
        this.TrackPropertyRead(7);
        return this.m_ActionState;
    }
    void SetActionState(const EFriendActionState __Value) property
    {
        if (int(this.m_ActionState) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ActionState = __Value;
        return;
    }
    int GetActionStateIndex() const property
    {
        this.TrackPropertyRead(8);
        return this.m_ActionStateIndex;
    }
    void SetActionStateIndex(const int __Value) property
    {
        if (this.m_ActionStateIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_ActionStateIndex = __Value;
        return;
    }
    int GetOnlineStatusCache() const property
    {
        this.TrackPropertyRead(9);
        return this.m_OnlineStatusCache;
    }
    void SetOnlineStatusCache(const int __Value) property
    {
        if (this.m_OnlineStatusCache == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_OnlineStatusCache = __Value;
        return;
    }
    const FText GetIsFriendTipsText() const property
    {
        const FText __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FText GetModify_IsFriendTipsText() property
    {
        FText __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetIsFriendTipsText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_IsFriendTipsText = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(11);
        return this.m_RedDotVM;
    }
    void SetRedDotVM(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDotVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_RedDotVM = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_FriendItem
{
    UPROPERTY()
    int RelationshipIndex;
    UPROPERTY()
    bool IsShowFriendTag;
    UPROPERTY()
    int OnlineStatus;
    UPROPERTY()
    float32 PlayerItemAlpha;
    UPROPERTY()
    FString FriendName;
    UPROPERTY()
    bool IsCurrentPeer;
    UPROPERTY()
    FText PeerTitle;
    UPROPERTY()
    FString PeerPreviewText;
    UPROPERTY()
    TEUIModelRef<FVM_FriendItem> Self;


}

namespace FVM_FriendItem
{
FVM_FriendItem& Create(const UObject ContextObject, const TEUIModelRef<FM_FriendRow> &inout FriendRow)
{
    return FVM_FriendItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), FriendRow);
}
FVM_FriendItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_FriendRow> &inout FriendRow)
{
    FVM_FriendItem __r;
    TEUIModelRef<FVM_FriendItem> local_6 = TEUIModelRef<FVM_FriendItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_FriendItem::ModelId, 0, FriendRow));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_FriendItem;
}
void __OnFriendBriefChanged_RefreshOnline(FVM_FriendItem &inout Model)
{
    Model.OnFriendBriefChanged_RefreshOnline();
    return;
}
void __OnChatMainTabChanged_RefreshTips(FVM_FriendItem &inout Model)
{
    Model.OnChatMainTabChanged_RefreshTips();
    return;
}
void __OnSelectFriendTabChanged_RefreshFriendApplyTips(FVM_FriendItem &inout Model)
{
    Model.OnSelectFriendTabChanged_RefreshFriendApplyTips();
    return;
}
void __OnPrivateChatUpdatedForTips(FVM_FriendItem &inout Model, const FMsg_PrivateChatUpdated &inout Message)
{
    Model.OnPrivateChatUpdatedForTips(Message);
    return;
}
TEUIModelRef<FVM_PlayerBasicItem> __UIGetter_PlayerBasicItem(const FVM_FriendItem &inout Model)
{
    return Model.GetPlayerBasicItem();
}
FText __UIGetter_TipsContextText(const FVM_FriendItem &inout Model)
{
    return Model.GetTipsContextText();
}
int __UIGetter_TipsContextIndex(const FVM_FriendItem &inout Model)
{
    return Model.GetTipsContextIndex();
}
int __UIGetter_ActionStateIndex(const FVM_FriendItem &inout Model)
{
    return Model.GetActionStateIndex();
}
FText __UIGetter_IsFriendTipsText(const FVM_FriendItem &inout Model)
{
    return Model.GetIsFriendTipsText();
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_FriendItem &inout Model)
{
    return Model.GetRedDotVM();
}
int __UIGetter_RelationshipIndex(const FVM_FriendItem &inout Model)
{
    return Model.GetRelationshipIndex();
}
bool __UIGetter_IsShowFriendTag(const FVM_FriendItem &inout Model)
{
    return Model.GetIsShowFriendTag();
}
int __UIGetter_OnlineStatus(const FVM_FriendItem &inout Model)
{
    return Model.GetOnlineStatus();
}
float32 __UIGetter_PlayerItemAlpha(const FVM_FriendItem &inout Model)
{
    return Model.GetPlayerItemAlpha();
}
FString __UIGetter_FriendName(const FVM_FriendItem &inout Model)
{
    return Model.GetFriendName();
}
bool __UIGetter_IsCurrentPeer(const FVM_FriendItem &inout Model)
{
    return Model.IsCurrentPeer();
}
FText __UIGetter_PeerTitle(const FVM_FriendItem &inout Model)
{
    return Model.GetPeerTitle();
}
FString __UIGetter_PeerPreviewText(const FVM_FriendItem &inout Model)
{
    return Model.GetPeerPreviewText();
}
TEUIModelRef<FVM_FriendItem> __UIGetter_Self(const FVM_FriendItem &inout Model)
{
    return TEUIModelRef<FVM_FriendItem>(Model);
}
int __IndexOf_FriendRow()
{
    return 0;
}
int __IndexOf_PlayerBasicItem()
{
    return 1;
}
int __IndexOf_ChatDataModel()
{
    return 2;
}
int __IndexOf_ChatRuntimeData()
{
    return 3;
}
int __IndexOf_PlayerUid()
{
    return 4;
}
int __IndexOf_TipsContextText()
{
    return 5;
}
int __IndexOf_TipsContextIndex()
{
    return 6;
}
int __IndexOf_ActionState()
{
    return 7;
}
int __IndexOf_ActionStateIndex()
{
    return 8;
}
int __IndexOf_OnlineStatusCache()
{
    return 9;
}
int __IndexOf_IsFriendTipsText()
{
    return 10;
}
int __IndexOf_RedDotVM()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_FriendItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
