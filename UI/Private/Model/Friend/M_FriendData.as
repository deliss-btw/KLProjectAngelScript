
enum EFriendRowType
{
    Friend,
    FriendApply,
    FriendSearch,
    PrivateChatPeer,
}

enum EPlayerRelationship
{
    Stranger,
    Friend,
}

namespace FM_FriendRow
{
    const int ModelId = 0;
}
namespace FMS_FriendDataModel
{
    const int ModelId = 0;

}
struct FMsg_FriendDataUpdated : FEUIMessage
{
    FMsg_FriendDataUpdated()
    {
        return;
    }
}

struct FMsg_FriendSearchResultUpdated : FEUIMessage
{
    FMsg_FriendSearchResultUpdated()
    {
        return;
    }
}

struct FMsg_AddFriendRequest : FEUIMessage
{
    UPROPERTY()
    uint PlayerUid;
    UPROPERTY()
    FString ApplyMsg;


}

struct FMsg_AddFriendRsp : FEUIMessage
{
    UPROPERTY()
    uint TargetUid;


}

struct FMsg_HandleFriendApply : FEUIMessage
{
    UPROPERTY()
    uint FriendUid;
    UPROPERTY()
    bool bAccept;


}

struct FMsg_AddNewFriendSuccess : FEUIMessage
{
    UPROPERTY()
    uint FriendUid;


}

struct FMsg_SearchFriendRequest : FEUIMessage
{
    UPROPERTY()
    FString SearchText;

    FMsg_SearchFriendRequest()
    {
        return;
    }
}

struct FMsg_FriendUtilDeferredPopup : FEUIMessage
{
    UPROPERTY()
    bool bWeakTips = true;
    UPROPERTY()
    FText Content;


}

struct FM_FriendRow : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    EFriendRowType m_RowType;
    UPROPERTY()
    FPlayerBriefInfo m_Brief;
    UPROPERTY()
    uint m_CreateTime;
    UPROPERTY()
    FString m_ApplyMsg;
    UPROPERTY()
    uint m_ExpireTime;
    UPROPERTY()
    uint m_SearchTime;
    UPROPERTY()
    EPlayerRelationship m_PlayerRelationship;

    FM_FriendRow()
    {
        this.m_RowType = EFriendRowType(0);
        this.m_CreateTime = 0;
        this.m_ExpireTime = 0;
        this.m_SearchTime = 0;
        this.m_PlayerRelationship = EPlayerRelationship(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_FriendRow(const FM_FriendRow &inout Other)
    {
        this.m_RowType = EFriendRowType(0);
        this.m_CreateTime = 0;
        this.m_ExpireTime = 0;
        this.m_SearchTime = 0;
        this.m_PlayerRelationship = EPlayerRelationship(0);
        this.m_RowType = Other.m_RowType;
        this.m_Brief = Other.m_Brief;
        this.m_CreateTime = int(Other.m_CreateTime);
        this.m_ApplyMsg = Other.m_ApplyMsg;
        this.m_ExpireTime = int(Other.m_ExpireTime);
        this.m_SearchTime = int(Other.m_SearchTime);
        this.m_PlayerRelationship = Other.m_PlayerRelationship;
        return;
    }
    FM_FriendRow opAssign(const FM_FriendRow &inout Other)
    {
        FM_FriendRow __r;
        this.m_RowType = Other.m_RowType;
        this.m_Brief = Other.m_Brief;
        this.m_CreateTime = int(Other.m_CreateTime);
        this.m_ApplyMsg = Other.m_ApplyMsg;
        this.m_ExpireTime = int(Other.m_ExpireTime);
        this.m_SearchTime = int(Other.m_SearchTime);
        this.m_PlayerRelationship = Other.m_PlayerRelationship;
        return __r;
    }
    uint GetFriendUid() const
    {
        return this.GetBrief().GetUid();
    }
    void FillFromFriendEntry(const FPbFriendEntry &inout E, const UObject ContextManager)
    {
        this.SetRowType(EFriendRowType(0));
        this.SetPlayerRelationship(EPlayerRelationship(1));
        this.SetCreateTime(E.GetCreateTime());
        FPbPlayerBriefInfo local_24 = E.GetBrief();
        FPlayerBriefInfo local_42;
        if (local_24.IsValid())
        {
            local_42 = ::FMS_PlayerBriefInfo::Get(ContextManager).CacheFromProto(local_24);
        }
        this.SetBrief(local_42);
        return;
    }
    void FillFromFriendApplyEntry(const FPbFriendApplyEntry &inout E, const UObject ContextManager)
    {
        int local_67;
        this.SetRowType(EFriendRowType(1));
        this.SetApplyMsg(E.GetApplyMsg());
        this.SetCreateTime(E.GetCreatedTime());
        this.SetExpireTime(E.GetExpireTime());
        FPbPlayerBriefInfo local_28 = E.GetApplicantBrief();
        FPlayerBriefInfo local_46;
        if (local_28.IsValid())
        {
            local_46 = ::FMS_PlayerBriefInfo::Get(ContextManager).CacheFromProto(local_28);
        }
        this.SetBrief(local_46);
        if (::FriendUtil::IsFriend(this.GetBrief().GetUid()))
        {
            int local_68;
            local_68 = 1;
            local_67 = local_68;
        }
        else
        {
            int local_68;
            local_68 = 0;
            local_67 = local_68;
        }
        this.SetPlayerRelationship(EPlayerRelationship(local_67));
        return;
    }
    void FillFromSearchResult(const FPbPlayerSearchEntry &inout E, const UObject ContextManager)
    {
        int local_51;
        this.SetRowType(EFriendRowType(2));
        this.SetSearchTime(E.GetApplyTime());
        FPlayerBriefInfo local_20;
        if (E.GetBrief().IsValid())
        {
            local_20 = ::FMS_PlayerBriefInfo::Get(ContextManager).CacheFromProto(E.GetBrief());
        }
        this.SetBrief(local_20);
        if (::FriendUtil::IsFriend(this.GetBrief().GetUid()))
        {
            int local_52;
            local_52 = 1;
            local_51 = local_52;
        }
        else
        {
            int local_52;
            local_52 = 0;
            local_51 = local_52;
        }
        this.SetPlayerRelationship(EPlayerRelationship(local_51));
        return;
    }
    void InitForPrivateChatPeer(const uint PeerUid, const FPlayerBriefInfo &inout InBrief, const UObject ContextManager)
    {
        int local_24;
        this.SetRowType(EFriendRowType(3));
        FPlayerBriefInfo local_20 = InBrief;
        int local_21 = local_20.GetUid();
        if (local_21 == 0)
        {
            local_20.SetUid(PeerUid);
        }
        this.SetBrief(local_20);
        int local_21_2 = this.GetBrief().GetUid();
        if (local_21_2 != 0)
        {
            ::FMS_PlayerBriefInfo::Get(ContextManager).UpsertPlayerBrief(this.GetBrief());
        }
        if (::FriendUtil::IsFriend(this.GetBrief().GetUid()))
        {
            int local_25;
            local_25 = 1;
            local_24 = local_25;
        }
        else
        {
            int local_25;
            local_25 = 0;
            local_24 = local_25;
        }
        this.SetPlayerRelationship(EPlayerRelationship(local_24));
        return;
    }
    void ResetOnlineState(const bool bOnline)
    {
        FPlayerBriefInfo local_18 = FPlayerBriefInfo(this.GetBrief());
        local_18.SetbIsOnline(bOnline);
        this.SetBrief(local_18);
        return;
    }
    EFriendRowType GetRowType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_RowType;
    }
    void SetRowType(const EFriendRowType __Value) property
    {
        if (int(this.m_RowType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_RowType = __Value;
        return;
    }
    FPlayerBriefInfo GetBrief() const property
    {
        FPlayerBriefInfo __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FPlayerBriefInfo GetModify_Brief() property
    {
        FPlayerBriefInfo __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetBrief(const FPlayerBriefInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Brief = __Value;
        return;
    }
    uint GetCreateTime() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CreateTime;
    }
    void SetCreateTime(const uint __Value) property
    {
        if (this.m_CreateTime == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CreateTime = __Value;
        return;
    }
    const FString GetApplyMsg() const property
    {
        const FString __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FString GetModify_ApplyMsg() property
    {
        FString __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetApplyMsg(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ApplyMsg = __Value;
        return;
    }
    uint GetExpireTime() const property
    {
        this.TrackPropertyRead(4);
        return this.m_ExpireTime;
    }
    void SetExpireTime(const uint __Value) property
    {
        if (this.m_ExpireTime == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ExpireTime = __Value;
        return;
    }
    uint GetSearchTime() const property
    {
        this.TrackPropertyRead(5);
        return this.m_SearchTime;
    }
    void SetSearchTime(const uint __Value) property
    {
        if (this.m_SearchTime == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SearchTime = __Value;
        return;
    }
    EPlayerRelationship GetPlayerRelationship() const property
    {
        this.TrackPropertyRead(6);
        return this.m_PlayerRelationship;
    }
    void SetPlayerRelationship(const EPlayerRelationship __Value) property
    {
        if (int(this.m_PlayerRelationship) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_PlayerRelationship = __Value;
        return;
    }
}

struct FMS_FriendDataModel : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    bool m_FriendListMsgGet;
    UPROPERTY()
    bool m_FriendApplyListMsgGet;
    UPROPERTY()
    bool m_bIsInit;
    UPROPERTY()
    uint m_PendingAssembleTargetUid;
    UPROPERTY()
    uint m_PendingAssembleAssemblerUid;
    UPROPERTY()
    uint64 m_PendingAssembleTargetDsId;
    UPROPERTY()
    uint m_PendingAssembleTargetLevelKey;
    UPROPERTY()
    uint m_PendingTeamAssembleAssemblerUid;
    UPROPERTY()
    uint64 m_PendingTeamAssembleDsId;
    UPROPERTY()
    uint m_PendingTeamAssembleLevelKey;
    UPROPERTY()
    TArray<TEUIModelRef<FM_FriendRow>> m_FriendList;
    UPROPERTY()
    TMap<uint, int> m_FriendUidToIndex;
    UPROPERTY()
    TArray<TEUIModelRef<FM_FriendRow>> m_ApplyList;
    UPROPERTY()
    TMap<uint, int> m_ApplyUidToIndex;
    UPROPERTY()
    TArray<TEUIModelRef<FM_FriendRow>> m_SearchResults;
    UPROPERTY()
    uint m_LoginFriendCount;
    UPROPERTY()
    uint m_LoginPendingApplyCount;

    FMS_FriendDataModel()
    {
        this.m_FriendListMsgGet = false;
        this.m_FriendApplyListMsgGet = false;
        this.m_bIsInit = false;
        this.m_PendingAssembleTargetUid = 0;
        this.m_PendingAssembleAssemblerUid = 0;
        this.m_PendingAssembleTargetDsId = 0;
        this.m_PendingAssembleTargetLevelKey = 0;
        this.m_PendingTeamAssembleAssemblerUid = 0;
        this.m_PendingTeamAssembleDsId = 0;
        this.m_PendingTeamAssembleLevelKey = 0;
        this.m_LoginFriendCount = 0;
        this.m_LoginPendingApplyCount = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_FriendDataModel(const FMS_FriendDataModel &inout Other)
    {
        this.m_FriendListMsgGet = false;
        this.m_FriendApplyListMsgGet = false;
        this.m_bIsInit = false;
        this.m_PendingAssembleTargetUid = 0;
        this.m_PendingAssembleAssemblerUid = 0;
        this.m_PendingAssembleTargetDsId = 0;
        this.m_PendingAssembleTargetLevelKey = 0;
        this.m_PendingTeamAssembleAssemblerUid = 0;
        this.m_PendingTeamAssembleDsId = 0;
        this.m_PendingTeamAssembleLevelKey = 0;
        this.m_LoginFriendCount = 0;
        this.m_LoginPendingApplyCount = 0;
        this.m_FriendListMsgGet = Other.m_FriendListMsgGet;
        this.m_FriendApplyListMsgGet = Other.m_FriendApplyListMsgGet;
        this.m_bIsInit = Other.m_bIsInit;
        this.m_PendingAssembleTargetUid = int(Other.m_PendingAssembleTargetUid);
        this.m_PendingAssembleAssemblerUid = int(Other.m_PendingAssembleAssemblerUid);
        this.m_PendingAssembleTargetDsId = Other.m_PendingAssembleTargetDsId;
        this.m_PendingAssembleTargetLevelKey = int(Other.m_PendingAssembleTargetLevelKey);
        this.m_PendingTeamAssembleAssemblerUid = int(Other.m_PendingTeamAssembleAssemblerUid);
        this.m_PendingTeamAssembleDsId = Other.m_PendingTeamAssembleDsId;
        this.m_PendingTeamAssembleLevelKey = int(Other.m_PendingTeamAssembleLevelKey);
        this.m_FriendList = Other.m_FriendList;
        this.m_FriendUidToIndex = Other.m_FriendUidToIndex;
        this.m_ApplyList = Other.m_ApplyList;
        this.m_ApplyUidToIndex = Other.m_ApplyUidToIndex;
        this.m_SearchResults = Other.m_SearchResults;
        this.m_LoginFriendCount = int(Other.m_LoginFriendCount);
        this.m_LoginPendingApplyCount = int(Other.m_LoginPendingApplyCount);
        return;
    }
    FMS_FriendDataModel opAssign(const FMS_FriendDataModel &inout Other)
    {
        FMS_FriendDataModel __r;
        this.m_FriendListMsgGet = Other.m_FriendListMsgGet;
        this.m_FriendApplyListMsgGet = Other.m_FriendApplyListMsgGet;
        this.m_bIsInit = Other.m_bIsInit;
        this.m_PendingAssembleTargetUid = int(Other.m_PendingAssembleTargetUid);
        this.m_PendingAssembleAssemblerUid = int(Other.m_PendingAssembleAssemblerUid);
        this.m_PendingAssembleTargetDsId = Other.m_PendingAssembleTargetDsId;
        this.m_PendingAssembleTargetLevelKey = int(Other.m_PendingAssembleTargetLevelKey);
        this.m_PendingTeamAssembleAssemblerUid = int(Other.m_PendingTeamAssembleAssemblerUid);
        this.m_PendingTeamAssembleDsId = Other.m_PendingTeamAssembleDsId;
        this.m_PendingTeamAssembleLevelKey = int(Other.m_PendingTeamAssembleLevelKey);
        this.m_FriendList = Other.m_FriendList;
        this.m_FriendUidToIndex = Other.m_FriendUidToIndex;
        this.m_ApplyList = Other.m_ApplyList;
        this.m_ApplyUidToIndex = Other.m_ApplyUidToIndex;
        this.m_SearchResults = Other.m_SearchResults;
        this.m_LoginFriendCount = int(Other.m_LoginFriendCount);
        this.m_LoginPendingApplyCount = int(Other.m_LoginPendingApplyCount);
        return __r;
    }
    void HandleSearchFriendRequest(const FMsg_SearchFriendRequest &inout Msg)
    {
        this.GS_SearchPlayer(Msg.SearchText);
        return;
    }
    void OnFriendUtilDeferredPopup(const FMsg_FriendUtilDeferredPopup &inout Msg)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void ClearFriendSearchResultsList()
    {
        this.GetModify_SearchResults().Empty(0);
        return;
    }
    void HandleAddFriendRequest(const FMsg_AddFriendRequest &inout Msg)
    {
        if (int(Msg.PlayerUid) == 0)
        {
            return;
        }
        if (int(Msg.PlayerUid) == ::FASCommonUtils::GetPlayerUidFromPlayerEntity(this.GetContext().GetLocalPlayer()))
        {
            ::FriendUtil::ShowAddSelfAsFriendTips();
            return;
        }
        this.GS_SendFriendApply(int(Msg.PlayerUid), Msg.ApplyMsg);
        return;
    }
    void HandleHandleFriendApply(const FMsg_HandleFriendApply &inout Msg)
    {
        this.GS_HandleFriendApply(int(Msg.FriendUid), Msg.bAccept);
        return;
    }
    void GS_OnGetFriendListRsp(const FPbGetFriendListRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] GetFriendList failed retcode=").Append(Rsp.GetRetcode()));
            return;
        }
        this.ReplaceFriendListFromRsp(Rsp);
        this.SetFriendListMsgGet(true);
        this.SetbIsInit((this.GetbIsInit() || (this.GetFriendListMsgGet() && this.GetFriendApplyListMsgGet())));
        return;
    }
    void GS_OnGetFriendApplyListRsp(const FPbGetFriendApplyListRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] GetFriendApplyList failed retcode=").Append(Rsp.GetRetcode()));
            return;
        }
        this.ReplaceApplyListFromRsp(Rsp);
        this.SetFriendApplyListMsgGet(true);
        this.SetbIsInit((this.GetbIsInit() || (this.GetFriendListMsgGet() && this.GetFriendApplyListMsgGet())));
        return;
    }
    void GS_OnSendFriendApplyRsp(const FPbSendFriendApplyRsp &inout Rsp)
    {
        int local_11;
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] SendFriendApply failed retcode=").Append(Rsp.GetRetcode()).Append(" target=").Append(Rsp.GetTargetUid()));
            return;
        }
        local_11 = Rsp.GetTargetUid();
        if (local_11 == 0)
        {
            return;
        }
        FEUIModelRef local_18 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_AddFriendRsp local_20;
        local_20.TargetUid = local_11;
        return;
    }
    void GS_OnHandleFriendApplyRsp(const FPbHandleFriendApplyRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] HandleFriendApply failed retcode=").Append(Rsp.GetRetcode()).Append(" uid=").Append(Rsp.GetUid()));
            return;
        }
        this.RemoveApplyByUid(Rsp.GetUid());
        return;
    }
    void GS_OnDeleteFriendRsp(const FPbDeleteFriendRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] DeleteFriend failed retcode=").Append(Rsp.GetRetcode()).Append(" target=").Append(Rsp.GetTargetUid()));
            return;
        }
        this.RemoveFriendByUid(Rsp.GetTargetUid());
        this.NotifyFriendDataUpdated();
        return;
    }
    void GS_OnSearchPlayerRsp(const FPbSearchPlayerRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] SearchPlayer failed retcode=").Append(Rsp.GetRetcode()));
            this.GetModify_SearchResults().Empty(0);
            this.NotifySearchUpdated();
            return;
        }
        this.ReplaceSearchResultsFromRsp(Rsp);
        this.NotifySearchUpdated();
        return;
    }
    void GS_OnFriendLoginDataNotify(const FPbFriendLoginDataNotify &inout N)
    {
        this.SetLoginFriendCount(N.GetFriendCount());
        this.SetLoginPendingApplyCount(N.GetPendingApplyCount());
        this.RequestInitialFriendDataFromLoginCounts(N.GetFriendCount(), N.GetPendingApplyCount());
        if (N.GetPendingApplyCount() > 0)
        {
            this.ShowApplyRedDotHud();
        }
        return;
    }
    void GS_OnFriendApplyNotify(const FPbFriendApplyNotify &inout N)
    {
        int local_24;
        int local_108 = 0;
        FPbFriendApplyEntry local_20 = N.GetApply();
        this.InsertApplyListFromEntry(local_20);
        int local_21 = N.GetRemovedApplyUid();
        if (local_21 != 0)
        {
            this.RemoveApplyByUid(N.GetRemovedApplyUid());
        }
        local_24 = local_20.GetApplicantBrief().GetUid();
        if (local_24 != 0)
        {
            this.ShowApplyRedDotHud();
            FPendingConfirmHintData local_62;
            FPlayerBriefInfo local_98 = ::FMS_PlayerBriefInfo::Get(this.GetContext().Manager).GetPlayerBriefInfo(local_24);
            local_62.SetFeature(EPendingConfirmFeature(0));
            local_62.SetSenderPlayerInfo(local_98);
            FEUIModelRef local_106 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_108.Data = local_62;
        }
        return;
    }
    void GS_OnFriendListChangeNotify(const FPbFriendListChangeNotify &inout N)
    {
        int local_1;
        local_1 = N.GetOpType();
        if (local_1 == 1)
        {
            this.AddFriendFromEntry(N.GetFriendEntry());
            return;
        }
        if (local_1 == 2)
        {
            this.RemoveFriendByUid(N.GetTargetUid());
            return;
        }
        if (local_1 == 3)
        {
            this.UpdateFriendFromEntry(N.GetFriendEntry());
        }
        return;
    }
    void GS_OnFriendAssembleRsp(const FPbFriendAssembleRsp &inout Rsp)
    {
        FCommonTipsParam local_18;
        if (Rsp.GetRetcode() == 2408)
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] FriendAssemble DS capacity full, need switch line"));
            ::FVMS_FriendAssemble::Get(this.GetContext().Manager).ShowFriendSwitchLineDialog();
            return;
        }
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] FriendAssemble failed retcode=").Append(Rsp.GetRetcode()));
            ::CommonPopup::Tips(NSLOCTEXT("FriendAssemble", "AssembleReqFailed", "й‚ЂиЇ·иЇ·ж±‚е¤±иґҐ"), local_18);
            return;
        }
        ::CommonPopup::Tips(NSLOCTEXT("FriendAssemble", "AssembleReqSent", "й‚ЂиЇ·иЇ·ж±‚е·ІеЏ‘йЂЃ"), local_18);
        return;
    }
    void GS_OnFriendAssembleConfirmRsp(const FPbFriendAssembleConfirmRsp &inout Rsp)
    {
        FCommonTipsParam local_18;
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] FriendAssembleConfirm failed retcode=").Append(Rsp.GetRetcode()));
            ::CommonPopup::Tips(NSLOCTEXT("FriendAssemble", "AssembleConfirmFailed", "жЌўзєїе¤±иґҐ"), local_18);
            return;
        }
        ::CommonPopup::Tips(NSLOCTEXT("FriendAssemble", "AssembleConfirmSuccess", "жЌўзєїж€ђеЉџ"), local_18);
        return;
    }
    void GS_OnFriendAssembleNotify(const FPbFriendAssembleNotify &inout N)
    {
        FCommonTipsParam local_26;
        int local_27;
        int local_102 = 0;
        if (!(::TeleporterUtils::IsTeleportAllowed(FECSEntity(this.GetContext().GetLocalPlayerPawn()))))
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] FriendAssembleNotify rejected, local player ban teleport, assembler=").Append(N.GetAssemblerUid()));
            this.SetPendingAssembleAssemblerUid(N.GetAssemblerUid());
            this.SetPendingAssembleTargetDsId(N.GetTargetDsId());
            this.SetPendingAssembleTargetLevelKey(N.GetTargetLevelKey());
            this.GS_FriendAssembleReplyReq(false);
            ::CommonPopup::Tips(NSLOCTEXT("FriendAssemble", "AssembleBanTeleport", "еЅ“е‰ЌзЉ¶жЂЃж— жі•жЋҐеЏ—еЏ¬й›†й‚ЂиЇ·пјЊе·Іи‡ЄеЉЁж‹’з»ќ"), local_26);
            return;
        }
        ::CommonPopup::Tips(NSLOCTEXT("FriendAssemble", "AssembleInviteNotice", "ж”¶е€°еҐЅеЏ‹й‚ЂиЇ·еЉ е…ҐиЇ·ж±‚"), local_26);
        XLog(ELog(27), FString().Append("[FMS_FriendDataModel] FriendAssembleNotify received, assembler=").Append(N.GetAssemblerUid()));
        local_27 = N.GetAssemblerUid();
        if (local_27 != 0)
        {
            this.SetPendingAssembleAssemblerUid(local_27);
            this.SetPendingAssembleTargetDsId(N.GetTargetDsId());
            this.SetPendingAssembleTargetLevelKey(N.GetTargetLevelKey());
            FPendingConfirmHintData local_56;
            FPlayerBriefInfo local_92 = ::FMS_PlayerBriefInfo::Get(this.GetContext().Manager).GetPlayerBriefInfo(local_27);
            local_56.SetFeature(EPendingConfirmFeature(3));
            local_56.SetSenderPlayerInfo(local_92);
            FEUIModelRef local_100 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_102.Data = local_56;
        }
        return;
    }
    void GS_OnFriendAssembleReplyRsp(const FPbFriendAssembleReplyRsp &inout Rsp)
    {
        FCommonTipsParam local_18;
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] FriendAssembleReply failed retcode=").Append(Rsp.GetRetcode()));
            ::CommonPopup::Tips(NSLOCTEXT("FriendAssemble", "AssembleReplyFailed", "е›ће¤Ќе¤±иґҐ"), local_18);
            return;
        }
        ::CommonPopup::Tips(NSLOCTEXT("FriendAssemble", "AssembleReplySent", "е·Іе›ће¤Ќй‚ЂиЇ·"), local_18);
        return;
    }
    void GS_OnFriendAssembleResultNotify(const FPbFriendAssembleResultNotify &inout N)
    {
        FCommonTipsParam local_16;
        XLog(ELog(27), FString().Append("[FMS_FriendDataModel] FriendAssembleResultNotify retcode=").Append(N.GetRetcode()));
        if (N.GetRetcode() != 0)
        {
            ::CommonPopup::Tips(NSLOCTEXT("FriendAssemble", "AssembleResultFailed", "еЏ¬й›†й‚ЂиЇ·е¤±иґҐ"), local_16);
            return;
        }
        ::CommonPopup::Tips(NSLOCTEXT("FriendAssemble", "AssembleResultSuccess", "еЏ¬й›†й‚ЂиЇ·ж€ђеЉџ"), local_16);
        return;
    }
    void GS_OnTeamAssembleRsp(const FPbTeamAssembleRsp &inout Rsp)
    {
        FCommonTipsParam local_18;
        if (Rsp.GetRetcode() == 2408)
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] TeamAssemble DS capacity full, need switch line"));
            ::FVMS_FriendAssemble::Get(this.GetContext().Manager).ShowTeamSwitchLineDialog();
            return;
        }
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] TeamAssemble failed retcode=").Append(Rsp.GetRetcode()));
            ::CommonPopup::Tips(NSLOCTEXT("TeamAssemble", "AssembleReqFailed", "еЏ¬й›†иЇ·ж±‚е¤±иґҐ"), local_18);
            return;
        }
        ::CommonPopup::Tips(NSLOCTEXT("TeamAssemble", "AssembleReqSent", "еЏ¬й›†иЇ·ж±‚е·ІеЏ‘йЂЃ"), local_18);
        return;
    }
    void GS_OnTeamAssembleConfirmRsp(const FPbTeamAssembleConfirmRsp &inout Rsp)
    {
        FCommonTipsParam local_18;
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] TeamAssembleConfirm failed retcode=").Append(Rsp.GetRetcode()));
            ::CommonPopup::Tips(NSLOCTEXT("TeamAssemble", "AssembleConfirmFailed", "жЌўзєїе¤±иґҐ"), local_18);
            return;
        }
        ::CommonPopup::Tips(NSLOCTEXT("TeamAssemble", "AssembleConfirmSuccess", "жЌўзєїж€ђеЉџ"), local_18);
        return;
    }
    void GS_OnTeamAssembleNotify(const FPbTeamAssembleNotify &inout N)
    {
        int local_27;
        int local_102 = 0;
        if (!(::TeleporterUtils::IsTeleportAllowed(FECSEntity(this.GetContext().GetLocalPlayerPawn()))))
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] TeamAssembleNotify rejected, local player cannot teleport (ban teleport or in combat), assembler=").Append(N.GetAssemblerUid()));
            this.SetPendingTeamAssembleAssemblerUid(N.GetAssemblerUid());
            this.SetPendingTeamAssembleDsId(N.GetTargetDsId());
            this.SetPendingTeamAssembleLevelKey(N.GetTargetLevelKey());
            this.GS_TeamAssembleReplyReq(false);
            FCommonTipsParam local_26;
            ::CommonPopup::Tips(NSLOCTEXT("TeamAssemble", "AssembleBanTeleport", "еЅ“е‰ЌзЉ¶жЂЃж— жі•жЋҐеЏ—еЏ¬й›†й‚ЂиЇ·пјЊе·Іи‡ЄеЉЁж‹’з»ќ"), local_26);
            return;
        }
        XLog(ELog(27), FString().Append("[FMS_FriendDataModel] TeamAssembleNotify received, assembler=").Append(N.GetAssemblerUid()));
        local_27 = N.GetAssemblerUid();
        if (local_27 != 0)
        {
            this.SetPendingTeamAssembleAssemblerUid(local_27);
            this.SetPendingTeamAssembleDsId(N.GetTargetDsId());
            this.SetPendingTeamAssembleLevelKey(N.GetTargetLevelKey());
            FPendingConfirmHintData local_56;
            FPlayerBriefInfo local_92 = ::FMS_PlayerBriefInfo::Get(this.GetContext().Manager).GetPlayerBriefInfo(local_27);
            local_56.SetFeature(EPendingConfirmFeature(4));
            local_56.SetSenderPlayerInfo(local_92);
            FEUIModelRef local_100 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_102.Data = local_56;
        }
        return;
    }
    void GS_OnTeamAssembleReplyRsp(const FPbTeamAssembleReplyRsp &inout Rsp)
    {
        FCommonTipsParam local_18;
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(27), FString().Append("[FMS_FriendDataModel] TeamAssembleReply failed retcode=").Append(Rsp.GetRetcode()));
            ::CommonPopup::Tips(NSLOCTEXT("TeamAssemble", "AssembleReplyFailed", "е›ће¤Ќе¤±иґҐ"), local_18);
            return;
        }
        ::CommonPopup::Tips(NSLOCTEXT("TeamAssemble", "AssembleReplySent", "е·Іе›ће¤ЌеЏ¬й›†"), local_18);
        return;
    }
    void GS_OnTeamAssembleResultNotify(const FPbTeamAssembleResultNotify &inout N)
    {
        XLog(ELog(27), FString().Append("[FMS_FriendDataModel] TeamAssembleResultNotify member=").Append(N.GetMemberUid()).Append(" accept=").Append(N.GetAccept()));
        FPlayerBriefInfo local_44 = ::FMS_PlayerBriefInfo::Get(this.GetContext().Manager).GetPlayerBriefInfo(N.GetMemberUid());
        if (N.GetAccept())
        {
            FCommonTipsParam local_64;
            FText local_52;
            FString local_4 = local_44.GetNickname();
            FText::FromString(local_52);
            ::CommonPopup::Tips(FText::Format(NSLOCTEXT("TeamAssemble", "MemberAccepted", "{0} жЋҐеЏ—дє†еЏ¬й›†"), local_52), local_64);
        }
        else
        {
            FCommonTipsParam local_64;
            FText local_52;
            FString local_4_2 = local_44.GetNickname();
            FText::FromString(local_52);
            ::CommonPopup::Tips(FText::Format(NSLOCTEXT("TeamAssemble", "MemberRejected", "{0} ж‹’з»ќдє†еЏ¬й›†"), local_52), local_64);
        }
        return;
    }
    void GS_RequestFriendList()
    {
        FPbGetFriendListReq local_4;
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void GS_RequestFriendApplyList()
    {
        FPbGetFriendApplyListReq local_4;
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void GS_SendFriendApply(const uint TargetUid, const FString &inout ApplyMsg)
    {
        if (TargetUid == 0)
        {
            return;
        }
        FPbSendFriendApplyReq local_6;
        local_6.SetTargetUid(TargetUid);
        local_6.SetApplyMsg(ApplyMsg);
        this.SendProto(local_6.ToWrapper());
        return;
    }
    void GS_HandleFriendApply(const uint TargetUid, const bool bAccept)
    {
        if (TargetUid == 0)
        {
            return;
        }
        FPbHandleFriendApplyReq local_6;
        local_6.SetUid(TargetUid);
        local_6.SetIsAccept(bAccept);
        this.SendProto(local_6.ToWrapper());
        return;
    }
    void GS_DeleteFriend(const uint TargetUid)
    {
        if (TargetUid == 0)
        {
            return;
        }
        FPbDeleteFriendReq local_6;
        local_6.SetTargetUid(TargetUid);
        this.SendProto(local_6.ToWrapper());
        return;
    }
    void GS_SearchPlayer(const FString &inout SearchText)
    {
        FPbSearchPlayerReq local_4;
        local_4.SetSearchText(SearchText);
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void GS_FriendAssembleReq(const uint TargetUid)
    {
        if (TargetUid == 0)
        {
            return;
        }
        this.SetPendingAssembleTargetUid(TargetUid);
        FPbFriendAssembleReq local_6;
        local_6.SetTargetUid(TargetUid);
        this.SendProto(local_6.ToWrapper());
        return;
    }
    void GS_AllTeammerAssembleReq()
    {
        if (!(::FMS_LocalPlayerTeamData::Get(this.GetManager()).IsInTeam(ETeamType(1))))
        {
            FCommonTipsParam local_12;
            ::CommonPopup::Tips(NSLOCTEXT("TeamAssemble", "NotInTeam", "еЅ“е‰ЌжњЄењЁз¤ѕдє¤йџдјЌдё­"), local_12);
            return;
        }
        FPbTeamAssembleReq local_16;
        this.SendProto(local_16.ToWrapper());
        return;
    }
    void GS_TeamAssembleConfirmReq(const bool bAccept)
    {
        FPbTeamAssembleConfirmReq local_4;
        local_4.SetAccept(bAccept);
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void GS_TeamAssembleReplyReq(const bool bAccept)
    {
        FPbTeamAssembleReplyReq local_4;
        local_4.SetAccept(bAccept);
        local_4.SetTargetDsId(this.GetPendingTeamAssembleDsId());
        local_4.SetTargetLevelKey(this.GetPendingTeamAssembleLevelKey());
        local_4.SetAssemblerUid(this.GetPendingTeamAssembleAssemblerUid());
        this.SendProto(local_4.ToWrapper());
        this.SetPendingTeamAssembleAssemblerUid(0);
        this.SetPendingTeamAssembleDsId(0);
        this.SetPendingTeamAssembleLevelKey(0);
        return;
    }
    void GS_FriendAssembleConfirmReq(const uint TargetUid, const bool bAccept)
    {
        FPbFriendAssembleConfirmReq local_4;
        local_4.SetTargetUid(TargetUid);
        local_4.SetAccept(bAccept);
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void GS_FriendAssembleReplyReq(const bool bAccept)
    {
        FPbFriendAssembleReplyReq local_4;
        local_4.SetAssemblerUid(this.GetPendingAssembleAssemblerUid());
        local_4.SetAccept(bAccept);
        local_4.SetTargetDsId(this.GetPendingAssembleTargetDsId());
        local_4.SetTargetLevelKey(this.GetPendingAssembleTargetLevelKey());
        this.SendProto(local_4.ToWrapper());
        this.SetPendingAssembleAssemblerUid(0);
        this.SetPendingAssembleTargetDsId(0);
        this.SetPendingAssembleTargetLevelKey(0);
        return;
    }
    void ModifyFriendOnlineState(const uint Uid, const bool bOnline)
    {
        if (this.GetFriendUidToIndex().Contains(Uid))
        {
            int local_2 = this.GetFriendUidToIndex()[Uid];
            bOnline.ResetOnlineState();
            this.SortFriendListByOnlineThenCreateTimeAsc();
            this.NotifyFriendDataUpdated();
        }
        return;
    }
    void PatchFriendUidIndexAfterRemoveAt(const int Idx)
    {
        int local_4;
        int local_1 = Idx;
        for (; local_1 < this.GetFriendList().Num(); ++local_1)
        {
            local_4 = GetBrief().GetUid();
            if (local_4 != 0)
            {
                this.GetModify_FriendUidToIndex().Add(local_4, local_1);
            }
        }
        return;
    }
    void PatchApplyUidIndexAfterRemoveAt(const int Idx)
    {
        int local_4;
        int local_1 = Idx;
        for (; local_1 < this.GetApplyList().Num(); ++local_1)
        {
            local_4 = GetBrief().GetUid();
            if (local_4 != 0)
            {
                this.GetModify_ApplyUidToIndex().Add(local_4, local_1);
            }
        }
        if (this.GetApplyList().Num() > 0)
        {
            this.ShowApplyRedDot(0);
            return;
        }
        this.ClearApplyRedDot(0);
        this.ClearApplyRedDotHud();
        return;
    }
    void SortApplyListByCreatedTimeDesc()
    {
        int local_7;
        this.GetModify_ApplyUidToIndex().Empty(0);
        int local_4 = 0;
        for (; local_4 < this.GetApplyList().Num(); ++local_4)
        {
            local_7 = GetBrief().GetUid();
            if (local_7 != 0)
            {
                this.GetModify_ApplyUidToIndex().Add(local_7, local_4);
            }
        }
        if (this.GetApplyList().Num() > 0)
        {
            this.ShowApplyRedDot(0);
            return;
        }
        this.ClearApplyRedDot(0);
        this.ClearApplyRedDotHud();
        return;
    }
    void SortFriendListByOnlineThenCreateTimeAsc()
    {
        int local_7;
        this.GetModify_FriendUidToIndex().Empty(0);
        int local_4 = 0;
        for (; local_4 < this.GetFriendList().Num(); ++local_4)
        {
            local_7 = GetBrief().GetUid();
            if (local_7 != 0)
            {
                this.GetModify_FriendUidToIndex().Add(local_7, local_4);
            }
        }
        return;
    }
    void AddFriendFromEntry(const FPbFriendEntry &inout E)
    {
        int local_1 = E.GetBrief().GetUid();
        bool local_14 = false;
        if (this.GetFriendUidToIndex().Contains(local_1))
        {
            this.UpdateFriendFromEntry(E);
        }
        else
        {
            local_14 = true;
            FM_FriendRow& local_18 = ::FM_FriendRow::Create(this.GetContext().Manager);
            local_18.FillFromFriendEntry(E, this.GetContext().Manager);
            this.GetModify_FriendList().Add(TEUIModelRef<FM_FriendRow>(local_18));
            this.GetModify_FriendUidToIndex().Add(local_18.GetBrief().GetUid(), (this.GetFriendList().Num() - 1));
        }
        if (local_14)
        {
            this.SortFriendListByOnlineThenCreateTimeAsc();
            this.NotifyFriendDataUpdated();
        }
        this.RemoveApplyByUid(local_1);
        FEUIModelRef local_28 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_AddNewFriendSuccess local_30;
        local_30.FriendUid = local_1;
        return;
    }
    void RemoveFriendByUid(const uint Uid)
    {
        if (Uid == 0 || !(this.GetFriendUidToIndex().Contains(Uid)))
        {
            return;
        }
        int local_4 = this.GetFriendUidToIndex()[Uid];
        this.GetModify_FriendList().RemoveAt(local_4);
        this.PatchFriendUidIndexAfterRemoveAt(local_4);
        this.NotifyFriendDataUpdated();
        return;
    }
    void UpdateFriendFromEntry(const FPbFriendEntry &inout E)
    {
        int local_35;
        FPbPlayerBriefInfo local_20 = E.GetBrief();
        XLog(ELog(74), FString().Append("[FMS_FriendDataModel] UpdateFriendFromEntry Uid=").Append(local_20.GetUid()).Append(" Nickname=").Append(local_20.GetNickname()).Append(" IsOnline=").Append(local_20.GetIsOnline()));
        bool local_31 = !(local_20.IsValid());
        if (local_31)
        {
            local_31 = true;
        }
        else
        {
            int local_25 = local_20.GetUid();
            local_31 = (local_25 == 0);
        }
        if (local_31)
        {
            return;
        }
        local_35 = local_20.GetUid();
        if (this.GetFriendUidToIndex().Contains(local_35))
        {
            int local_37 = this.GetFriendUidToIndex()[local_35];
            E.FillFromFriendEntry(this.GetContext().Manager);
        }
        else
        {
            FM_FriendRow& local_40 = ::FM_FriendRow::Create(this.GetContext().Manager);
            local_40.FillFromFriendEntry(E, this.GetContext().Manager);
            this.GetModify_FriendList().Add(TEUIModelRef<FM_FriendRow>(local_40));
            this.GetModify_FriendUidToIndex().Add(local_35, (this.GetFriendList().Num() - 1));
        }
        this.SortFriendListByOnlineThenCreateTimeAsc();
        this.NotifyFriendDataUpdated();
        return;
    }
    void ReplaceFriendListFromRsp(const FPbGetFriendListRsp &inout Rsp)
    {
        bool local_24;
        int local_25;
        TMap<uint, TEUIModelRef<FM_FriendRow>> local_20;
        int local_21 = 0;
        for (; local_21 < this.GetFriendList().Num(); ++local_21)
        {
            int local_26 = GetBrief().GetUid();
            local_25 = local_26;
            if (local_25 != 0)
            {
                local_20.Add(local_25, this.GetFriendList()[local_21]);
            }
        }
        this.GetModify_FriendList().Empty(0);
        this.GetModify_FriendUidToIndex().Empty(0);
        int local_26_2 = Rsp.GetFriendList_Num();
        int local_27 = 0;
        for (; local_27 < local_26_2; ++local_27)
        {
            FPbFriendEntry local_48 = Rsp.GetFriendList_Index(local_27);
            FPbPlayerBriefInfo local_68 = local_48.GetBrief();
            TEUIModelRef<FM_FriendRow> local_70;
            if (!(local_68.IsValid()))
            {
                local_24 = false;
            }
            else
            {
                int local_71 = local_68.GetUid();
                local_24 = (local_71 != 0);
            }
            if (!(local_24))
            {
                local_24 = false;
            }
            else
            {
                local_24 = local_20.Find(local_68.GetUid(), local_70);
            }
            if (local_24)
            {
                int local_72 = local_68.GetUid();
                local_48.FillFromFriendEntry(this.GetContext().Manager);
                this.GetModify_FriendList().Add(local_70);
                continue;
            }
            FM_FriendRow& local_76 = ::FM_FriendRow::Create(this.GetContext().Manager);
            local_76.FillFromFriendEntry(local_48, this.GetContext().Manager);
            this.GetModify_FriendList().Add(TEUIModelRef<FM_FriendRow>(local_76));
        }
        this.SortFriendListByOnlineThenCreateTimeAsc();
        this.NotifyFriendDataUpdated();
        return;
    }
    void InsertApplyListFromEntry(const FPbFriendApplyEntry &inout E)
    {
        int local_25;
        FPbPlayerBriefInfo local_20 = E.GetApplicantBrief();
        bool local_21 = !(local_20.IsValid());
        if (local_21)
        {
            local_21 = true;
        }
        else
        {
            int local_22 = local_20.GetUid();
            local_21 = (local_22 == 0);
        }
        if (local_21)
        {
            return;
        }
        local_25 = local_20.GetUid();
        if (this.GetApplyUidToIndex().Contains(local_25))
        {
            int local_27 = this.GetApplyUidToIndex()[local_25];
            E.FillFromFriendApplyEntry(this.GetContext().Manager);
        }
        else
        {
            FM_FriendRow& local_30 = ::FM_FriendRow::Create(this.GetContext().Manager);
            local_30.FillFromFriendApplyEntry(E, this.GetContext().Manager);
            this.GetModify_ApplyList().Add(TEUIModelRef<FM_FriendRow>(local_30));
        }
        this.SortApplyListByCreatedTimeDesc();
        return;
    }
    void RemoveApplyByUid(const uint Uid)
    {
        XLog(ELog(74), FString().Append("[FMS_FriendDataModel] RemoveApplyByUid Uid=").Append(Uid));
        if (Uid == 0 || !(this.GetApplyUidToIndex().Contains(Uid)))
        {
            return;
        }
        XLog(ELog(74), FString().Append("[FMS_FriendDataModel] RemoveApplyByUid Uid=").Append(Uid).Append(" Index=").Append(this.GetApplyUidToIndex()[Uid]));
        int local_9 = this.GetApplyUidToIndex()[Uid];
        this.GetModify_ApplyList().RemoveAt(local_9);
        this.PatchApplyUidIndexAfterRemoveAt(local_9);
        return;
    }
    void ReplaceApplyListFromRsp(const FPbGetFriendApplyListRsp &inout Rsp)
    {
        this.GetModify_ApplyList().Empty(0);
        this.GetModify_ApplyUidToIndex().Empty(0);
        int local_3 = Rsp.GetApplyList_Num();
        int local_4 = 0;
        for (; local_4 < local_3; )
        {
            FPbFriendApplyEntry local_26 = Rsp.GetApplyList_Index(local_4);
            FM_FriendRow& local_28 = ::FM_FriendRow::Create(this.GetContext().Manager);
            local_28.FillFromFriendApplyEntry(local_26, this.GetContext().Manager);
            this.GetModify_ApplyList().Add(TEUIModelRef<FM_FriendRow>(local_28));
            ++local_4;
        }
        this.SortApplyListByCreatedTimeDesc();
        return;
    }
    void ReplaceSearchResultsFromRsp(const FPbSearchPlayerRsp &inout Rsp)
    {
        this.GetModify_SearchResults().Empty(0);
        int local_3 = Rsp.GetPlayerSearchList_Num();
        int local_4 = 0;
        for (; local_4 < local_3; ++local_4)
        {
            FPbPlayerSearchEntry local_26 = Rsp.GetPlayerSearchList_Index(local_4);
            if (local_26.IsValid())
            {
                FM_FriendRow& local_28 = ::FM_FriendRow::Create(this.GetContext().Manager);
                local_28.FillFromSearchResult(local_26, this.GetContext().Manager);
                this.GetModify_SearchResults().Add(TEUIModelRef<FM_FriendRow>(local_28));
            }
        }
        return;
    }
    void NotifyFriendDataUpdated()
    {
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_6);
        return;
    }
    void NotifySearchUpdated()
    {
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_6);
        return;
    }
    void RequestInitialFriendDataFromLoginCounts(const uint FriendCount, const uint PendingApplyCount)
    {
        if (FriendCount > 0)
        {
            this.SetFriendListMsgGet(false);
            this.GS_RequestFriendList();
        }
        else
        {
            this.SetFriendListMsgGet(true);
            this.GetModify_FriendList().Empty(0);
            this.GetModify_FriendUidToIndex().Empty(0);
        }
        if (PendingApplyCount > 0)
        {
            this.SetFriendApplyListMsgGet(false);
            this.GS_RequestFriendApplyList();
            return;
        }
        this.SetFriendApplyListMsgGet(true);
        this.GetModify_ApplyList().Empty(0);
        this.GetModify_ApplyUidToIndex().Empty(0);
        return;
    }
    void ShowApplyRedDot(const uint Uid)
    {
        XLog(ELog(74), FString().Append("[FMS_FriendDataModel] ShowApplyRedDot Uid=").Append(Uid));
        int64 local_10 = Uid;
        ::FMS_RedDotSystem::Get(this.GetManager()).GenerateSpecificRedDot(GameplayTags::RedDotSystem_Friend_NewFriendInvitation, local_10, 1, false);
        return;
    }
    void ClearApplyRedDot(const uint Uid)
    {
        XLog(ELog(74), FString().Append("[FMS_FriendDataModel] ClearApplyRedDot Uid=").Append(Uid));
        int64 local_10 = Uid;
        ::FMS_RedDotSystem::Get(this.GetManager()).ConsumeRedDot(GameplayTags::RedDotSystem_Friend_NewFriendInvitation, local_10);
        return;
    }
    void ShowApplyRedDotHud()
    {
        if (::FMS_RedDotSystem::Get(this.GetManager()).HasRedDot(GameplayTags::RedDotSystem_Friend_NewFriendInvitationHud, 0))
        {
            return;
        }
        XLog(ELog(74), FString().Append("[FMS_FriendDataModel] ShowApplyRedDotHud"));
        ::FMS_RedDotSystem::Get(this.GetManager()).GenerateSpecificRedDot(GameplayTags::RedDotSystem_Friend_NewFriendInvitationHud, 0, 1, false);
        return;
    }
    void ClearApplyRedDotHud()
    {
        XLog(ELog(74), FString().Append("[FMS_FriendDataModel] ClearApplyRedDotHud"));
        ::FMS_RedDotSystem::Get(this.GetManager()).ConsumeRedDot(GameplayTags::RedDotSystem_Friend_NewFriendInvitationHud, 0);
        return;
    }
    bool GetFriendListMsgGet() const property
    {
        this.TrackPropertyRead(0);
        return this.m_FriendListMsgGet;
    }
    void SetFriendListMsgGet(const bool __Value) property
    {
        if (!(this.m_FriendListMsgGet) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_FriendListMsgGet = __Value;
        return;
    }
    bool GetFriendApplyListMsgGet() const property
    {
        this.TrackPropertyRead(1);
        return this.m_FriendApplyListMsgGet;
    }
    void SetFriendApplyListMsgGet(const bool __Value) property
    {
        if (!(this.m_FriendApplyListMsgGet) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_FriendApplyListMsgGet = __Value;
        return;
    }
    bool GetbIsInit() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsInit;
    }
    void SetbIsInit(const bool __Value) property
    {
        if (!(this.m_bIsInit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsInit = __Value;
        return;
    }
    uint GetPendingAssembleTargetUid() const property
    {
        this.TrackPropertyRead(3);
        return this.m_PendingAssembleTargetUid;
    }
    void SetPendingAssembleTargetUid(const uint __Value) property
    {
        if (this.m_PendingAssembleTargetUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PendingAssembleTargetUid = __Value;
        return;
    }
    uint GetPendingAssembleAssemblerUid() const property
    {
        this.TrackPropertyRead(4);
        return this.m_PendingAssembleAssemblerUid;
    }
    void SetPendingAssembleAssemblerUid(const uint __Value) property
    {
        if (this.m_PendingAssembleAssemblerUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PendingAssembleAssemblerUid = __Value;
        return;
    }
    uint64 GetPendingAssembleTargetDsId() const property
    {
        this.TrackPropertyRead(5);
        return this.m_PendingAssembleTargetDsId;
    }
    void SetPendingAssembleTargetDsId(const uint64 __Value) property
    {
        if (this.m_PendingAssembleTargetDsId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_PendingAssembleTargetDsId = __Value;
        return;
    }
    uint GetPendingAssembleTargetLevelKey() const property
    {
        this.TrackPropertyRead(6);
        return this.m_PendingAssembleTargetLevelKey;
    }
    void SetPendingAssembleTargetLevelKey(const uint __Value) property
    {
        if (this.m_PendingAssembleTargetLevelKey == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_PendingAssembleTargetLevelKey = __Value;
        return;
    }
    uint GetPendingTeamAssembleAssemblerUid() const property
    {
        this.TrackPropertyRead(7);
        return this.m_PendingTeamAssembleAssemblerUid;
    }
    void SetPendingTeamAssembleAssemblerUid(const uint __Value) property
    {
        if (this.m_PendingTeamAssembleAssemblerUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_PendingTeamAssembleAssemblerUid = __Value;
        return;
    }
    uint64 GetPendingTeamAssembleDsId() const property
    {
        this.TrackPropertyRead(8);
        return this.m_PendingTeamAssembleDsId;
    }
    void SetPendingTeamAssembleDsId(const uint64 __Value) property
    {
        if (this.m_PendingTeamAssembleDsId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_PendingTeamAssembleDsId = __Value;
        return;
    }
    uint GetPendingTeamAssembleLevelKey() const property
    {
        this.TrackPropertyRead(9);
        return this.m_PendingTeamAssembleLevelKey;
    }
    void SetPendingTeamAssembleLevelKey(const uint __Value) property
    {
        if (this.m_PendingTeamAssembleLevelKey == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_PendingTeamAssembleLevelKey = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_FriendRow>> GetFriendList() const property
    {
        const TArray<TEUIModelRef<FM_FriendRow>> __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    TArray<TEUIModelRef<FM_FriendRow>> GetModify_FriendList() property
    {
        TArray<TEUIModelRef<FM_FriendRow>> __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetFriendList(const TArray<TEUIModelRef<FM_FriendRow>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_FriendList = __Value;
        return;
    }
    const TMap<uint, int> GetFriendUidToIndex() const property
    {
        const TMap<uint, int> __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    TMap<uint, int> GetModify_FriendUidToIndex() property
    {
        TMap<uint, int> __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetFriendUidToIndex(const TMap<uint, int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_FriendUidToIndex = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_FriendRow>> GetApplyList() const property
    {
        const TArray<TEUIModelRef<FM_FriendRow>> __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    TArray<TEUIModelRef<FM_FriendRow>> GetModify_ApplyList() property
    {
        TArray<TEUIModelRef<FM_FriendRow>> __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetApplyList(const TArray<TEUIModelRef<FM_FriendRow>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_ApplyList = __Value;
        return;
    }
    const TMap<uint, int> GetApplyUidToIndex() const property
    {
        const TMap<uint, int> __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    TMap<uint, int> GetModify_ApplyUidToIndex() property
    {
        TMap<uint, int> __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetApplyUidToIndex(const TMap<uint, int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_ApplyUidToIndex = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_FriendRow>> GetSearchResults() const property
    {
        const TArray<TEUIModelRef<FM_FriendRow>> __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    TArray<TEUIModelRef<FM_FriendRow>> GetModify_SearchResults() property
    {
        TArray<TEUIModelRef<FM_FriendRow>> __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetSearchResults(const TArray<TEUIModelRef<FM_FriendRow>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_SearchResults = __Value;
        return;
    }
    uint GetLoginFriendCount() const property
    {
        this.TrackPropertyRead(15);
        return this.m_LoginFriendCount;
    }
    void SetLoginFriendCount(const uint __Value) property
    {
        if (this.m_LoginFriendCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_LoginFriendCount = __Value;
        return;
    }
    uint GetLoginPendingApplyCount() const property
    {
        this.TrackPropertyRead(16);
        return this.m_LoginPendingApplyCount;
    }
    void SetLoginPendingApplyCount(const uint __Value) property
    {
        if (this.m_LoginPendingApplyCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_LoginPendingApplyCount = __Value;
        return;
    }
}

struct __Lambda_UI_Private_Model_Friend_M_FriendData_792
{
    __Lambda_UI_Private_Model_Friend_M_FriendData_792()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FM_FriendRow> &inout A, const TEUIModelRef<FM_FriendRow> &inout B)
    {
        int local_1;
        int local_3;
        local_1 = GetCreateTime();
        local_3 = GetCreateTime();
        if (local_1 != local_3)
        {
            return (local_1 > local_3);
        }
        int local_2 = GetBrief().GetUid();
        return (local_2 > GetBrief().GetUid());
    }
}

struct __Lambda_UI_Private_Model_Friend_M_FriendData_817
{
    __Lambda_UI_Private_Model_Friend_M_FriendData_817()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FM_FriendRow> &inout A, const TEUIModelRef<FM_FriendRow> &inout B)
    {
        bool local_1;
        bool local_3;
        int local_5;
        int local_7;
        int local_8;
        int local_9;
        local_1 = GetBrief().GetbIsOnline();
        local_3 = GetBrief().GetbIsOnline();
        bool local_2 = !(local_1);
        if (local_2 != !(local_3))
        {
            return local_1;
        }
        local_5 = GetCreateTime();
        local_7 = GetCreateTime();
        if (local_5 != local_7)
        {
            return (local_5 < local_7);
        }
        local_8 = GetBrief().GetUid();
        local_9 = GetBrief().GetUid();
        return (local_8 < local_9);
    }
}

namespace FM_FriendRow
{
FM_FriendRow& Create(const UObject ContextObject)
{
    return FM_FriendRow::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_FriendRow CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_FriendRow __r;
    TEUIModelRef<FM_FriendRow> local_6 = TEUIModelRef<FM_FriendRow>(EUIInternal::MakeModelWithManager(Manager, FM_FriendRow::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_FriendRow;
}
int __IndexOf_RowType()
{
    return 0;
}
int __IndexOf_Brief()
{
    return 1;
}
int __IndexOf_CreateTime()
{
    return 2;
}
int __IndexOf_ApplyMsg()
{
    return 3;
}
int __IndexOf_ExpireTime()
{
    return 4;
}
int __IndexOf_SearchTime()
{
    return 5;
}
int __IndexOf_PlayerRelationship()
{
    return 6;
}
}
namespace FMS_FriendDataModel
{
FMS_FriendDataModel& Get(const UObject ContextObject)
{
    return FMS_FriendDataModel::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_FriendDataModel GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_FriendDataModel __r;
    TEUIModelRef<FMS_FriendDataModel> local_6 = TEUIModelRef<FMS_FriendDataModel>(EUIInternal::MakeModelWithManager(Manager, FMS_FriendDataModel::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__HandleSearchFriendRequest";
    local_14.MessageTypeName = "Msg_SearchFriendRequest";
    local_14.SourcePropertyModelRefs = FBitSet64(-1);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnFriendUtilDeferredPopup";
    local_14.MessageTypeName = "Msg_FriendUtilDeferredPopup";
    local_14.SourcePropertyModelRefs = FBitSet64(-1);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__HandleAddFriendRequest";
    local_14.MessageTypeName = "Msg_AddFriendRequest";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__HandleHandleFriendApply";
    local_14.MessageTypeName = "Msg_HandleFriendApply";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    FEUIModelProtoRspDefine local_24;
    local_24.FunctionName = "__GS_OnGetFriendListRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnGetFriendApplyListRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnSendFriendApplyRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnHandleFriendApplyRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnDeleteFriendRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnSearchPlayerRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnFriendLoginDataNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnFriendApplyNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnFriendListChangeNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnFriendAssembleRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnFriendAssembleConfirmRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnFriendAssembleNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnFriendAssembleReplyRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnFriendAssembleResultNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnTeamAssembleRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnTeamAssembleConfirmRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnTeamAssembleNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnTeamAssembleReplyRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnTeamAssembleResultNotify";
    Result.ProtoRspDefines.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_FriendDataModel;
}
void __HandleSearchFriendRequest(FMS_FriendDataModel &inout Model, const FMsg_SearchFriendRequest &inout Message)
{
    Model.HandleSearchFriendRequest(Message);
    return;
}
void __OnFriendUtilDeferredPopup(FMS_FriendDataModel &inout Model, const FMsg_FriendUtilDeferredPopup &inout Message)
{
    Model.OnFriendUtilDeferredPopup(Message);
    return;
}
void __HandleAddFriendRequest(FMS_FriendDataModel &inout Model, const FMsg_AddFriendRequest &inout Message)
{
    Model.HandleAddFriendRequest(Message);
    return;
}
void __HandleHandleFriendApply(FMS_FriendDataModel &inout Model, const FMsg_HandleFriendApply &inout Message)
{
    Model.HandleHandleFriendApply(Message);
    return;
}
void __GS_OnGetFriendListRsp(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnGetFriendListRsp(FPbGetFriendListRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnGetFriendApplyListRsp(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnGetFriendApplyListRsp(FPbGetFriendApplyListRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnSendFriendApplyRsp(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnSendFriendApplyRsp(FPbSendFriendApplyRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnHandleFriendApplyRsp(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnHandleFriendApplyRsp(FPbHandleFriendApplyRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnDeleteFriendRsp(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnDeleteFriendRsp(FPbDeleteFriendRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnSearchPlayerRsp(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnSearchPlayerRsp(FPbSearchPlayerRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnFriendLoginDataNotify(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnFriendLoginDataNotify(FPbFriendLoginDataNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnFriendApplyNotify(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnFriendApplyNotify(FPbFriendApplyNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnFriendListChangeNotify(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnFriendListChangeNotify(FPbFriendListChangeNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnFriendAssembleRsp(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnFriendAssembleRsp(FPbFriendAssembleRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnFriendAssembleConfirmRsp(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnFriendAssembleConfirmRsp(FPbFriendAssembleConfirmRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnFriendAssembleNotify(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnFriendAssembleNotify(FPbFriendAssembleNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnFriendAssembleReplyRsp(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnFriendAssembleReplyRsp(FPbFriendAssembleReplyRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnFriendAssembleResultNotify(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnFriendAssembleResultNotify(FPbFriendAssembleResultNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnTeamAssembleRsp(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnTeamAssembleRsp(FPbTeamAssembleRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnTeamAssembleConfirmRsp(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnTeamAssembleConfirmRsp(FPbTeamAssembleConfirmRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnTeamAssembleNotify(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnTeamAssembleNotify(FPbTeamAssembleNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnTeamAssembleReplyRsp(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnTeamAssembleReplyRsp(FPbTeamAssembleReplyRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnTeamAssembleResultNotify(FMS_FriendDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnTeamAssembleResultNotify(FPbTeamAssembleResultNotify::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_FriendListMsgGet()
{
    return 0;
}
int __IndexOf_FriendApplyListMsgGet()
{
    return 1;
}
int __IndexOf_bIsInit()
{
    return 2;
}
int __IndexOf_PendingAssembleTargetUid()
{
    return 3;
}
int __IndexOf_PendingAssembleAssemblerUid()
{
    return 4;
}
int __IndexOf_PendingAssembleTargetDsId()
{
    return 5;
}
int __IndexOf_PendingAssembleTargetLevelKey()
{
    return 6;
}
int __IndexOf_PendingTeamAssembleAssemblerUid()
{
    return 7;
}
int __IndexOf_PendingTeamAssembleDsId()
{
    return 8;
}
int __IndexOf_PendingTeamAssembleLevelKey()
{
    return 9;
}
int __IndexOf_FriendList()
{
    return 10;
}
int __IndexOf_FriendUidToIndex()
{
    return 11;
}
int __IndexOf_ApplyList()
{
    return 12;
}
int __IndexOf_ApplyUidToIndex()
{
    return 13;
}
int __IndexOf_SearchResults()
{
    return 14;
}
int __IndexOf_LoginFriendCount()
{
    return 15;
}
int __IndexOf_LoginPendingApplyCount()
{
    return 16;
}
}
