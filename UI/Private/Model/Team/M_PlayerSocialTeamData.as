
namespace FMS_PlayerSocialTeamData
{
    const int ModelId = 0;

}
struct FMsg_SocialTeamChanged : FEUIMessage
{
    FMsg_SocialTeamChanged()
    {
        return;
    }
}

struct FMsg_SocialTeamMemberChanged : FEUIMessage
{
    FMsg_SocialTeamMemberChanged()
    {
        return;
    }
}

struct FMS_PlayerSocialTeamData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    FECSEntity m_LocalPlayerTeamEntity;
    UPROPERTY()
    TEUIModelRef<FM_SocialTeam> m_MyTeam;

    FMS_PlayerSocialTeamData()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_PlayerSocialTeamData(const FMS_PlayerSocialTeamData &inout Other)
    {
        this.m_LocalPlayerTeamEntity = Other.m_LocalPlayerTeamEntity;
        this.m_MyTeam = Other.m_MyTeam;
        return;
    }
    FMS_PlayerSocialTeamData& opAssign(const FMS_PlayerSocialTeamData &inout Other)
    {
        this.m_LocalPlayerTeamEntity = Other.m_LocalPlayerTeamEntity;
        return Other.m_MyTeam;
    }
    TEUIModelRef<FM_SocialTeam> GetLocalPlayerTeam() const
    {
        return this.GetMyTeam();
    }
    bool IsLocalPlayerInTeam() const
    {
        return this.GetMyTeam().IsValid();
    }
    TEUIModelRef<FM_TeamMember> FindTeamMemberByPlayer(const TEUIModelRef<FM_Player> &inout Player) const
    {
        if (this.GetMyTeam())
        {
            for (auto& local_18 : this.GetMyTeam().opArrow().GetMembers())
            {
                if ((local_18.opArrow().GetPlayer() == Player.opImplConv()))
                {
                    return local_18;
                }
            }
        }
        return TEUIModelRef<FM_TeamMember>();
    }
    void GS_OnSocialTeamInfoNotify(const FPbSocialTeamInfoNotify &inout Notify)
    {
        bool local_24;
        int local_134 = 0;
        XLog(ELog(16), FString().Append("[SocialTeam] OnSocialTeamInfoNotify: IsInTeam=").Append(Notify.GetIsInTeam()).Append(", TeamId=").Append(Notify.GetTeamInfo().GetTeamId()).Append(", MemberCount=").Append(Notify.GetTeamInfo().GetUidList_Num()).Append(", CaptainUid=").Append(Notify.GetTeamInfo().GetCaptainUid()));
        bool local_22 = false;
        bool local_23 = false;
        local_24 = Notify.GetIsInTeam();
        TArray<uint> local_28;
        bool local_5 = this.GetMyTeam();
        if (local_5)
        {
            TEUIModelRef<FM_Player> local_46;
            for (auto& local_44 : this.GetMyTeam().opArrow().GetMembers())
            {
                if (!(local_44.IsValid()))
                {
                    local_5 = false;
                }
                else
                {
                    local_46.GetPlayer();
                    local_5 = local_46.IsValid();
                }
                if (local_5)
                {
                    local_46.GetPlayer();
                    local_28.Add(local_46.opArrow().GetPlayerUid());
                }
            }
        }
        TEUIModelRef<FM_Player> local_148;
        if (local_24)
        {
            FCommonTipsParam local_164;
            FEUIModelRef local_132;
            TEUIModelRef<FM_Player> local_46;
            bool local_111;
            int local_99;
            int local_77;
            if (!(this.GetMyTeam()) || (this.GetMyTeam().opArrow().GetTeamId() != Notify.GetTeamInfo().GetTeamId()))
            {
                this.SetMyTeam(TEUIModelRef<FM_SocialTeam>(::FM_SocialTeam::Create(this.GetContext().Manager, Notify.GetTeamInfo().GetTeamId())));
                local_22 = true;
            }
            int local_51 = 0;
            if (this.GetMyTeam().opArrow().GetTeamCommonData().Captain.IsValid() && this.GetMyTeam().opArrow().GetTeamCommonData().Captain.opArrow().GetPlayer().IsValid())
            {
                local_51 = this.GetMyTeam().opArrow().GetTeamCommonData().Captain.opArrow().GetPlayer().opArrow().GetPlayerUid();
            }
            TArray<int> local_56;
            TMap<uint, int> local_76;
            local_77 = 0;
            for (; local_77 < this.GetMyTeam().opArrow().GetTeamCommonData().Members.Num(); )
            {
                local_76.Add(this.GetMyTeam().opArrow().GetTeamCommonData().Members[local_77].opArrow().GetPlayer().opArrow().GetPlayerUid(), local_77);
                ++local_77;
            }
            TSet<uint> local_98;
            local_99 = 0;
            for (; local_99 < Notify.GetTeamInfo().GetUidList_Num(); ++local_99)
            {
                local_98.Add(Notify.GetTeamInfo().GetUidList_Index(local_99).GetUid());
                if (!(local_76.Contains(Notify.GetTeamInfo().GetUidList_Index(local_99).GetUid())))
                {
                    local_56.Add(local_99);
                }
            }
            local_111 = false;
            local_77 = Notify.GetTeamInfo().GetUidList_Num();
            for (; local_77 < this.GetMyTeam().opArrow().GetTeamCommonData().Members.Num(); )
            {
                this.GetMyTeam().opArrow().GetTeamCommonData().Members[local_77].opArrow().RemoveFromTeam(false);
                local_111 = true;
                ++local_77;
            }
            if (local_111)
            {
                TEUIModelRef<FM_TeamMember> local_114 = TEUIModelRef<FM_TeamMember>(nullptr);
                TEUIModelRef<FM_SocialTeam> local_30 = this.GetMyTeam();
                local_23 = true;
            }
            local_77 = 0;
            for (; local_77 < this.GetMyTeam().opArrow().GetTeamCommonData().Members.Num(); )
            {
                local_46 = ::FMS_PlayerData::Get(this.GetContext().Manager).UpdateOrCreatePlayerByGSData(Notify.GetTeamInfo().GetUidList_Index(local_77));
                TEUIModelRef<FM_TeamMember>(this.GetMyTeam().opArrow().GetTeamCommonData().Members[local_77]).opArrow().SetPlayer(local_46);
                ++local_77;
            }
            int local_48 = this.GetMyTeam().opArrow().GetTeamCommonData().Members.Num();
            TEUIModelRef<FM_SocialTeam> local_128;
            for (; local_48 < Notify.GetTeamInfo().GetUidList_Num(); )
            {
                FPbOnlinePlayerInfo local_124 = Notify.GetTeamInfo().GetUidList_Index(local_48);
                local_128 = this.GetMyTeam();
                FEUIModelWeakRef local_130 = FEUIModelWeakRef(local_132);
                local_46 = ::FMS_PlayerData::Get(this.GetContext().Manager).UpdateOrCreatePlayerByGSData(local_124);
                local_134.SetPlayer(local_46);
                local_128 = this.GetMyTeam();
                local_128.opArrow().GetModify_TeamCommonData().Members.Add(TEUIModelRef<FM_TeamMember>(local_134));
                local_23 = true;
                ++local_48;
            }
            if (!(local_22))
            {
                auto local_140 = local_56.Iterator();
                for (; local_140.CanProceed;)
                {
                    local_46 = this.GetMyTeam().opArrow().GetTeamCommonData().Members[local_140.Proceed()].opArrow().GetPlayer();
                    if (local_148 && !(local_148.opArrow().IsLocalPlayer()))
                    {
                        ::CommonPopup::Tips(FText::Format(NSLOCTEXT("MemberJoined", "{0} е·ІеЉ е…ҐйџдјЌ"), FText::FromString(local_148.opArrow().GetNickName())), local_164);
                    }
                }
            }
            for (auto& local_44 : this.GetMyTeam().opArrow().GetMembers())
            {
                if (local_44.opArrow().GetPlayer() && (local_44.opArrow().GetPlayer().opArrow().GetPlayerUid() == Notify.GetTeamInfo().GetCaptainUid()))
                {
                    if (!(local_22))
                    {
                        if (!((this.GetMyTeam().opArrow().GetTeamCommonData().Captain == local_44.opImplConv())))
                        {
                            if (local_44.opArrow().GetPlayer().opArrow().IsLocalPlayer())
                            {
                                ::CommonPopup::Tips(NSLOCTEXT("CaptainChangeToSelf", "е·Іж€ђдёєйџй•ї"), local_164);
                            }
                            else
                            {
                                ::CommonPopup::Tips(FText::Format(NSLOCTEXT("CaptainChange", "{0} е·Іж€ђдёєйџй•ї"), FText::FromString(local_44.opArrow().GetPlayer().opArrow().GetNickName())), local_164);
                            }
                        }
                    }
                    local_128 = this.GetMyTeam();
                    local_128.opArrow().GetModify_TeamCommonData().Captain = local_44;
                    break;
                }
            }
            if (local_51 != Notify.GetTeamInfo().GetCaptainUid())
            {
                local_23 = true;
            }
            int local_19 = Notify.GetReason();
            if (local_19 != 0)
            {
                if (Notify.GetTargetUid() > 0)
                {
                    local_46 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerData(Notify.GetTargetUid());
                    if (local_46.IsValid())
                    {
                        FText local_152 = FText::FromString(local_46.opArrow().GetNickName());
                        if (Notify.GetReason() == 1)
                        {
                            ::CommonPopup::Tips(FText::Format(NSLOCTEXT("OtherTeamSelfLeave", "{0} е·Із¦»ејЂйџдјЌ"), local_152), local_164);
                        }
                        else
                        {
                            if (Notify.GetReason() == 2)
                            {
                                ::CommonPopup::Tips(FText::Format(NSLOCTEXT("OtherTeamKicked", "{0} е·Іиў«иЇ·з¦»йџдјЌ"), local_152), local_164);
                            }
                            else
                            {
                                if (Notify.GetReason() == 3)
                                {
                                    ::CommonPopup::Tips(FText::Format(NSLOCTEXT("OtherTeamDisbanded", "{0} е·Іи§Јж•ЈйџдјЌ"), local_152), local_164);
                                }
                            }
                        }
                    }
                }
            }
        }
        else
        {
            FCommonTipsParam local_164;
            TEUIModelRef<FM_SocialTeam> local_128;
            if (Notify.GetReason() == 1)
            {
                ::CommonPopup::Tips(NSLOCTEXT("TeamSelfLeave", "дЅ е·Із¦»ејЂйџдјЌ"), local_164);
            }
            else
            {
                if (Notify.GetReason() == 2)
                {
                    ::CommonPopup::Tips(NSLOCTEXT("TeamKicked", "дЅ е·Іиў«иЇ·з¦»йџдјЌ"), local_164);
                }
                else
                {
                    if (Notify.GetReason() == 3)
                    {
                        ::CommonPopup::Tips(NSLOCTEXT("TeamDisbanded", "йџдјЌе·Іи§Јж•Ј"), local_164);
                    }
                }
            }
            if (this.GetMyTeam())
            {
                this.SetMyTeam(local_128);
                local_22 = true;
            }
        }
        if (!(local_28.IsEmpty()))
        {
            FMS_LocalPlayerTeamData& local_172 = ::FMS_LocalPlayerTeamData::Get(this.GetContext().Manager);
            auto local_178 = local_28.Iterator();
            for (; local_178.CanProceed;)
            {
                local_172.ForgetMuteIfNotTeammate(local_178.Proceed());
            }
        }
        if (local_22)
        {
            FCE_CombatHUD local_198;
            FEUIModelRef local_132 = FEUIModelRef(this);
            FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_132);
            FECSEntity local_192 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
            if (local_192.IsValid())
            {
                FFPTime local_204 = FFPTime(-1);
                local_198.CombatHUDReason = ECombatHUDReason(12);
                bool local_5_2 = true;
                local_198.bEnabled = local_5_2;
            }
        }
        else
        {
            FCE_CombatHUD local_198;
            FEUIModelRef local_132;
            if (local_23)
            {
                local_132 = FEUIModelRef(this);
                FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_132);
                FECSEntity local_196 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
                if (local_196.IsValid())
                {
                    FFPTime local_204_2 = FFPTime(-1);
                    local_198.CombatHUDReason = ECombatHUDReason(12);
                    local_198.bEnabled = true;
                }
            }
        }
        return;
    }
    void GS_QueryTargetTeamStatusReq(const uint TargetPlayerUid)
    {
        FPbQueryTargetTeamStatusReq local_4;
        local_4.SetTargetUid(TargetPlayerUid);
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void GS_OnQueryTargetTeamStatusRsp(const FPbQueryTargetTeamStatusRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() == 0)
        {
            FMsg_QueryTargetTeamStatusRsp local_12;
            FEUIModelRef local_10 = FEUIModelRef(this);
            FEUIMessageBus::PublishOrPatch(EUIMessageBus);
            local_12.bHasTeam = Rsp.GetHasTeam();
            local_12.TargetPlayerUid = Rsp.GetTargetUid();
        }
        return;
    }
    void GS_OnTeamInviteNotify(const FPbTeamInviteNotify &inout Notify)
    {
        int local_2 = 0;
        FEUIModelRef local_8 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus);
        local_2.Data.SetMessageId(Notify.GetTeamId());
        local_2.Data.SetFeature(EPendingConfirmFeature(2));
        FPlayerBriefInfo local_30 = FPlayerBriefInfo(local_2.Data.GetSenderPlayerInfo());
        ::PlayerBriefInfoBuild::ApplyFromProto(local_30, Notify.GetSourceBrief());
        local_2.Data.SetSenderPlayerInfo(local_30);
        int local_41 = local_30.GetUid();
        if (local_41 != 0 && !(local_30.GetNickname().IsEmpty()))
        {
            ::FMS_PlayerData::Get(this.GetContext().Manager).UpdateOrCreateByBriefInfo(local_30, EPlayerInfoTrust(1));
        }
        return;
    }
    void GS_OnTeamInviteResultNotify(const FPbTeamInviteResultNotify &inout Notify)
    {
        if (Notify.GetAccepted())
        {
            FCommonTipsParam local_10;
            ::CommonPopup::Tips(NSLOCTEXT("InviteAccepted", "еЇ№ж–№е·ІжЋҐеЏ—й‚ЂиЇ·"), local_10);
        }
        else
        {
            FCommonTipsParam local_10;
            if (Notify.GetResult() == 3)
            {
                ::CommonPopup::Tips(NSLOCTEXT("ApplyTimeOutRejected", "з»„йџй‚ЂиЇ·е·Іи¶…ж—¶"), local_10);
            }
            else
            {
                ::CommonPopup::Tips(NSLOCTEXT("InviteRejected", "еЇ№ж–№ж‹’з»ќдє†й‚ЂиЇ·"), local_10);
            }
        }
        FMsg_TeamInviteResult local_20;
        local_20 = FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(FEUIModelRef(this));
        local_20.InviteeUid = Notify.GetInviteeUid();
        local_20.bAccepted = Notify.GetAccepted();
        return;
    }
    void GS_OnTeamApplyNotify(const FPbTeamApplyNotify &inout Notify)
    {
        int local_2 = 0;
        FEUIModelRef local_8 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus);
        local_2.Data.SetMessageId(Notify.GetTeamId());
        local_2.Data.SetFeature(EPendingConfirmFeature(1));
        FPlayerBriefInfo local_30 = FPlayerBriefInfo(local_2.Data.GetSenderPlayerInfo());
        ::PlayerBriefInfoBuild::ApplyFromProto(local_30, Notify.GetSourceBrief());
        local_2.Data.SetSenderPlayerInfo(local_30);
        int local_41 = local_30.GetUid();
        if (local_41 != 0 && !(local_30.GetNickname().IsEmpty()))
        {
            ::FMS_PlayerData::Get(this.GetContext().Manager).UpdateOrCreateByBriefInfo(local_30, EPlayerInfoTrust(1));
        }
        return;
    }
    void GS_OnTeamApplyResultNotify(const FPbTeamApplyResultNotify &inout Notify)
    {
        if (Notify.GetAccepted())
        {
            FCommonTipsParam local_10;
            ::CommonPopup::Tips(NSLOCTEXT("ApplyAccepted", "йџй•їеђЊж„Џдє†дЅ зљ„е…Ґйџз”іиЇ·"), local_10);
        }
        else
        {
            FCommonTipsParam local_10;
            if (Notify.GetResult() == 4)
            {
                ::CommonPopup::Tips(NSLOCTEXT("ApplyTimeOutRejected", "е…Ґйџз”іиЇ·е·Іи¶…ж—¶"), local_10);
            }
            else
            {
                ::CommonPopup::Tips(NSLOCTEXT("ApplyRejected", "йџй•їж‹’з»ќдє†дЅ зљ„е…Ґйџз”іиЇ·"), local_10);
            }
        }
        FMsg_TeamApplyResult local_22;
        local_22 = FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(FEUIModelRef(this));
        local_22.TeamId = Notify.GetTeamId();
        local_22.bAccepted = Notify.GetAccepted();
        return;
    }
    const FECSEntity GetLocalPlayerTeamEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_LocalPlayerTeamEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetLocalPlayerTeamEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LocalPlayerTeamEntity = __Value;
        return;
    }
    TEUIModelRef<FM_SocialTeam> GetMyTeam() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MyTeam;
    }
    void SetMyTeam(const TEUIModelRef<FM_SocialTeam> &inout __Value) property
    {
        TEUIModelRef<FM_SocialTeam> local_2;
        local_2 = this.m_MyTeam;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MyTeam = __Value;
        return;
    }
}

struct FMsg_QueryTargetTeamStatusRsp : FEUIMessage
{
    UPROPERTY()
    uint TargetPlayerUid;
    UPROPERTY()
    bool bHasTeam;


}

struct FMsg_TeamInviteReceived : FEUIMessage
{
    UPROPERTY()
    uint SourceUid;
    UPROPERTY()
    uint64 TeamId;
    UPROPERTY()
    uint ExpireSeconds;


}

struct FMsg_TeamInviteResult : FEUIMessage
{
    UPROPERTY()
    uint InviteeUid;
    UPROPERTY()
    bool bAccepted;


}

struct FMsg_TeamApplyReceived : FEUIMessage
{
    UPROPERTY()
    uint SourceUid;
    UPROPERTY()
    uint64 TeamId;
    UPROPERTY()
    uint ExpireSeconds;


}

struct FMsg_TeamApplyResult : FEUIMessage
{
    UPROPERTY()
    uint64 TeamId;
    UPROPERTY()
    bool bAccepted;


}

namespace FMS_PlayerSocialTeamData
{
FMS_PlayerSocialTeamData& Get(const UObject ContextObject)
{
    return FMS_PlayerSocialTeamData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_PlayerSocialTeamData GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_PlayerSocialTeamData __r;
    TEUIModelRef<FMS_PlayerSocialTeamData> local_6 = TEUIModelRef<FMS_PlayerSocialTeamData>(EUIInternal::MakeModelWithManager(Manager, FMS_PlayerSocialTeamData::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnSocialTeamInfoNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnQueryTargetTeamStatusRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnTeamInviteNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnTeamInviteResultNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnTeamApplyNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnTeamApplyResultNotify";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_PlayerSocialTeamData;
}
void __GS_OnSocialTeamInfoNotify(FMS_PlayerSocialTeamData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnSocialTeamInfoNotify(FPbSocialTeamInfoNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnQueryTargetTeamStatusRsp(FMS_PlayerSocialTeamData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnQueryTargetTeamStatusRsp(FPbQueryTargetTeamStatusRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnTeamInviteNotify(FMS_PlayerSocialTeamData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnTeamInviteNotify(FPbTeamInviteNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnTeamInviteResultNotify(FMS_PlayerSocialTeamData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnTeamInviteResultNotify(FPbTeamInviteResultNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnTeamApplyNotify(FMS_PlayerSocialTeamData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnTeamApplyNotify(FPbTeamApplyNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnTeamApplyResultNotify(FMS_PlayerSocialTeamData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnTeamApplyResultNotify(FPbTeamApplyResultNotify::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_LocalPlayerTeamEntity()
{
    return 0;
}
int __IndexOf_MyTeam()
{
    return 1;
}
}
