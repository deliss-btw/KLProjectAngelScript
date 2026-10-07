
namespace FMS_DraftData
{
    const int ModelId = 0;

}
struct FMsg_DraftInviteStart : FEUIMessage
{
    UPROPERTY()
    TEUIModelRef<FM_Draft> Draft;

    FMsg_DraftInviteStart()
    {
        return;
    }
}

struct FMsg_DraftInviteReplyChanged : FEUIMessage
{
    UPROPERTY()
    TEUIModelRef<FM_Draft> Draft;

    FMsg_DraftInviteReplyChanged()
    {
        return;
    }
}

struct FMS_DraftData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TArray<TEUIModelRef<FM_Draft>> m_PendingDrafts;
    UPROPERTY()
    FEUIWidgetRef m_DraftConfirmWidget;

    FMS_DraftData()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_DraftData(const FMS_DraftData &inout Other)
    {
        this.m_PendingDrafts = Other.m_PendingDrafts;
        this.m_DraftConfirmWidget = Other.m_DraftConfirmWidget;
        return;
    }
    FMS_DraftData& opAssign(const FMS_DraftData &inout Other)
    {
        this.m_PendingDrafts = Other.m_PendingDrafts;
        return Other.m_DraftConfirmWidget;
    }
    void GS_RequestReplyDraftInvite(const TEUIModelRef<FM_Draft> &inout Draft, const uint DraftInviteReplyType)
    {
        FPbDraftInviteReplyReq local_4;
        local_4.SetReply(DraftInviteReplyType);
        local_4.SetInstId(Draft.opArrow().GetInstId());
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void DeleteDraft(const TEUIModelRef<FM_Draft> &inout Draft)
    {
        this.GetModify_PendingDrafts().RemoveSwap(Draft);
        return;
    }
    int AutoReplyAllPendingDrafts(const bool bAgree)
    {
        int local_1 = 0;
        TArray<TEUIModelRef<FM_Draft>> local_6 = this.GetPendingDrafts();
        for (auto& local_22 : local_6)
        {
            bool local_19 = !(local_22.IsValid());
            if (local_19)
            {
                continue;
            }
            TEUIModelRef<FM_DraftPlayer> local_24 = local_22.opArrow().GetLocalDraftPlayer();
            if (!(local_24.IsValid()))
            {
                local_19 = false;
            }
            else
            {
                int local_27 = local_24.opArrow().GetDraftInviteReply();
                local_19 = (local_27 != 0);
            }
            if (local_19)
            {
                continue;
            }
            local_22.opArrow().RequestReplyDraftInvite(bAgree);
            local_1 = local_1 + 1;
        }
        return local_1;
    }
    void ShowDraftInviteResultPopup(const FMsg_DraftInviteStart &inout Msg)
    {
        FEUIModelRef local_2;
        local_2;
        FEUIModelRef local_4;
        this.SetDraftConfirmWidget(FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_TeamMemberConfirm, local_4));
        return;
    }
    void OnECSWorldBegin(const FMsg_ECSWorldBegin &inout Msg)
    {
        this.CleanupDraftConfirmOnWorldSwitch();
        return;
    }
    void InvalidateEntityCache()
    {
        this.CleanupDraftConfirmOnWorldSwitch();
        return;
    }
    void CleanupDraftConfirmOnWorldSwitch()
    {
        if (this.GetDraftConfirmWidget().IsValid())
        {
            FEUIWidget::RemoveWidget(this.GetDraftConfirmWidget());
        }
        return;
    }
    void GS_OnDraftInviteNotify(const FPbDraftInviteNotify &inout Notify)
    {
        TEUIModelRef<FM_Draft> local_2;
        int local_56 = 0;
        TEUIModelRef<FM_Draft> local_6 = this.FindDraftByInstId(Notify.GetInstId());
        if (local_6)
        {
            XWarning(ELog(27), FString().Append("Draft with inst id ").Append(Notify.GetInstId()).Append(" already exists."));
            local_2 = local_6;
        }
        else
        {
            local_2 = TEUIModelRef<FM_Draft>(::FM_Draft::Create(this.GetContext().Manager, Notify.GetInstId()));
        }
        local_2.opArrow().SetDraftInviteResult(0);
        local_2.opArrow().SetDraftPlayers(this.GetDraftPlayers(Notify));
        const UDraftTypeAdapterBase local_36 = this.GetDraftTypeAdapter(Notify.GetInfo().GetType());
        if (local_36 != nullptr)
        {
            local_2.opArrow().SetTypedDraftData(local_36.GetTypedDraftData(this.GetContext(), Notify.GetInfo()));
        }
        this.GetModify_PendingDrafts().Add(local_2);
        FEUIModelRef local_48 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus);
        local_56.Draft = local_2;
        return;
    }
    void GS_OnDraftInviteReplyRsp(const FPbDraftInviteReplyRsp &inout Rsp)
    {
        int local_28 = 0;
        TEUIModelRef<FM_Draft> local_4 = this.FindDraftByInstId(Rsp.GetInstId());
        if (!(local_4.IsValid()))
        {
            XError(ELog(27), FString().Append("Draft with inst id ").Append(Rsp.GetInstId()).Append(" not found."));
            return;
        }
        TEUIModelRef<FM_DraftPlayer> local_16 = local_4.opArrow().GetLocalDraftPlayer();
        if (!(local_16.IsValid()))
        {
            XError(ELog(27), FString().Append("Local draft player not found in draft with inst id ").Append(Rsp.GetInstId()).Append("."));
            return;
        }
        local_16.opArrow().SetDraftInviteReply(Rsp.GetReply());
        FEUIModelRef local_26 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus);
        local_28.Draft = local_4;
        return;
    }
    void GS_OnDraftInviteReplyNotify(const FPbDraftInviteReplyNotify &inout Notify)
    {
        FCommonTipsParam local_50;
        int local_58 = 0;
        TEUIModelRef<FM_Draft> local_4 = this.FindDraftByInstId(Notify.GetInstId());
        if (!(local_4.IsValid()))
        {
            XError(ELog(27), FString().Append("Draft with inst id ").Append(Notify.GetInstId()).Append(" not found."));
            return;
        }
        int local_14 = 0;
        for (; local_14 < Notify.GetTeamReplyList_Num(); ++local_14)
        {
            FPbDraftReplyInfo local_26 = Notify.GetTeamReplyList_Index(local_14);
            TEUIModelRef<FM_DraftPlayer> local_38 = this.FindDraftPlayerByUID(local_4, local_26.GetUid());
            if (local_38)
            {
                local_38.opArrow().SetDraftInviteReply(local_26.GetReply());
            }
            else
            {
                if (local_26.GetReply() == 3)
                {
                    ::CommonPopup::Tips(NSLOCTEXT("DraftInviteReply_InCommission", "жњ‰зЋ©е®¶е·ІењЁе§”ж‰дё­пјЊж— жі•еЉ е…ҐеЊ№й…Ќ"), local_50);
                }
                else
                {
                    if (local_26.GetReply() == 4)
                    {
                        ::CommonPopup::Tips(NSLOCTEXT("DraftInviteReply_CommissionNotActive", "жњ‰зЋ©е®¶е§”ж‰жњЄжїЂжґ»пјЊж— жі•еЉ е…ҐеЊ№й…Ќ"), local_50);
                    }
                    else
                    {
                        XError(ELog(27), FString().Append("Draft player with uid ").Append(local_26.GetUid()).Append(" not found in current draft."));
                        continue;
                    }
                }
            }
        }
        FEUIModelRef local_56 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus);
        local_58.Draft = local_4;
        return;
    }
    void GS_OnDraftInviteResultNotify(const FPbDraftInviteResultNotify &inout Notify)
    {
        const UDraftTypeAdapterBase local_16 = this.GetDraftTypeAdapter(Notify.GetInfo().GetType());
        if ((!((local_16 != nullptr))))
        {
            XError(ELog(27), FString().Append("Draft type adapter not found for draft type ").Append(Notify.GetInfo().GetType()).Append("."));
            return;
        }
        TEUIModelRef<FM_Draft> local_28 = this.FindDraftByInstId(Notify.GetInstId());
        if (local_28)
        {
            local_28.opArrow().SetDraftInviteResult(Notify.GetResult());
            local_28.opArrow().SetTypedDraftData(local_16.GetTypedDraftData(this.GetContext(), Notify.GetInfo()));
            return;
        }
        FM_Draft& local_34 = ::FM_Draft::Create(this.GetContext().Manager, Notify.GetInstId());
        local_34.SetDraftInviteResult(Notify.GetResult());
        int local_35 = 0;
        for (; local_35 < Notify.GetTeamReplyList_Num(); )
        {
            FPbDraftReplyInfo local_46 = Notify.GetTeamReplyList_Index(local_35);
            FM_DraftPlayer& local_58 = ::FM_DraftPlayer::Create(this.GetContext().Manager);
            local_58.SetPlayer(::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerData(local_46.GetUid()));
            local_58.SetDraftInviteReply(local_46.GetReply());
            local_34.GetModify_DraftPlayers().Add(TEUIModelRef<FM_DraftPlayer>(local_58));
            ++local_35;
        }
        local_34.SetTypedDraftData(local_16.GetTypedDraftData(this.GetContext(), Notify.GetInfo()));
        if (!(local_16.HandleDraftInviteFail(this.GetContext(), TEUIModelRef<FM_Draft>(local_34))))
        {
            FCommonTipsParam local_72;
            ::CommonPopup::Tips(NSLOCTEXT("DraftInviteFail_Default", "еЊ№й…Ќе¤±иґҐ"), local_72);
        }
        return;
    }
    const const UDraftTypeAdapterBase GetDraftTypeAdapter(const uint DraftType) const
    {
        const UDraftSettings local_2;
        GetGameplaySettings<UDraftSettings> local_4;
        local_2 = local_4;
        const UDraftTypeAdapterBase local_8 = local_2.GetDraftTypeAdapterByServerDraftType(DraftType);
        return local_8;
    }
    TEUIModelRef<FM_DraftPlayer> FindDraftPlayerByUID(const TEUIModelRef<FM_Draft> &inout Draft, const uint UID) const
    {
        for (auto& local_16 : Draft.opArrow().GetDraftPlayers())
        {
            if (local_16.opArrow().GetPlayer().opArrow().GetPlayerUid() == UID)
            {
                return local_16;
            }
        }
        return TEUIModelRef<FM_DraftPlayer>();
    }
    TEUIModelRef<FM_Draft> FindDraftByInstId(const uint64 InstId) const
    {
        for (auto& local_16 : this.GetPendingDrafts())
        {
            if (local_16.opArrow().GetInstId() == InstId)
            {
                return local_16;
            }
        }
        return TEUIModelRef<FM_Draft>();
    }
    TArray<TEUIModelRef<FM_DraftPlayer>> GetDraftPlayers(const FPbDraftInviteNotify &inout Notify) const
    {
        TArray<TEUIModelRef<FM_DraftPlayer>> local_4;
        int local_5 = 0;
        for (; local_5 < Notify.GetTeamReplyList_Num(); )
        {
            FPbDraftReplyInfo local_18 = Notify.GetTeamReplyList_Index(local_5);
            FM_DraftPlayer& local_30 = ::FM_DraftPlayer::Create(this.GetContext().Manager);
            local_30.SetPlayer(::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerData(local_18.GetUid()));
            local_30.SetDraftInviteReply(local_18.GetReply());
            local_4.Add(TEUIModelRef<FM_DraftPlayer>(local_30));
            ++local_5;
        }
        return local_4;
    }
    const TArray<TEUIModelRef<FM_Draft>> GetPendingDrafts() const property
    {
        const TArray<TEUIModelRef<FM_Draft>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FM_Draft>> GetModify_PendingDrafts() property
    {
        TArray<TEUIModelRef<FM_Draft>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPendingDrafts(const TArray<TEUIModelRef<FM_Draft>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PendingDrafts = __Value;
        return;
    }
    const FEUIWidgetRef GetDraftConfirmWidget() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIWidgetRef GetModify_DraftConfirmWidget() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDraftConfirmWidget(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DraftConfirmWidget = __Value;
        return;
    }
}

namespace FMS_DraftData
{
FMS_DraftData& Get(const UObject ContextObject)
{
    return FMS_DraftData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_DraftData GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_DraftData __r;
    TEUIModelRef<FMS_DraftData> local_6 = TEUIModelRef<FMS_DraftData>(EUIInternal::MakeModelWithManager(Manager, FMS_DraftData::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__ShowDraftInviteResultPopup";
    local_14.MessageTypeName = "Msg_DraftInviteStart";
    local_14.SourcePropertyModelRefs = FBitSet64(-1);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnECSWorldBegin";
    local_14.MessageTypeName = "Msg_ECSWorldBegin";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    FEUIModelProtoRspDefine local_24;
    local_24.FunctionName = "__GS_OnDraftInviteNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnDraftInviteReplyRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnDraftInviteReplyNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnDraftInviteResultNotify";
    Result.ProtoRspDefines.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_DraftData;
}
void __ShowDraftInviteResultPopup(FMS_DraftData &inout Model, const FMsg_DraftInviteStart &inout Message)
{
    Model.ShowDraftInviteResultPopup(Message);
    return;
}
void __OnECSWorldBegin(FMS_DraftData &inout Model, const FMsg_ECSWorldBegin &inout Message)
{
    Model.OnECSWorldBegin(Message);
    return;
}
void __GS_OnDraftInviteNotify(FMS_DraftData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnDraftInviteNotify(FPbDraftInviteNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnDraftInviteReplyRsp(FMS_DraftData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnDraftInviteReplyRsp(FPbDraftInviteReplyRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnDraftInviteReplyNotify(FMS_DraftData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnDraftInviteReplyNotify(FPbDraftInviteReplyNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnDraftInviteResultNotify(FMS_DraftData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnDraftInviteResultNotify(FPbDraftInviteResultNotify::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_PendingDrafts()
{
    return 0;
}
int __IndexOf_DraftConfirmWidget()
{
    return 1;
}
}
