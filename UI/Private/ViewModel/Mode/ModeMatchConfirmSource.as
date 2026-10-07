
namespace FM_ModeMatchConfirm
{
    const int ModelId = 0;

}
struct FM_ModeMatchConfirm : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    uint m_MatchId;
    UPROPERTY()
    uint m_MatchMode;
    UPROPERTY()
    uint m_CommissionId;
    UPROPERTY()
    uint m_ConfirmPlayerNum;
    UPROPERTY()
    uint m_TotalPlayerNum;
    UPROPERTY()
    TMap<uint, uint> m_PlayerStatus;
    UPROPERTY()
    bool m_bHasReject;
    UPROPERTY()
    bool m_bConfirmSent;

    FM_ModeMatchConfirm()
    {
        this.m_MatchId = 0;
        this.m_MatchMode = 0;
        this.m_CommissionId = 0;
        this.m_ConfirmPlayerNum = 0;
        this.m_TotalPlayerNum = 0;
        this.m_bHasReject = false;
        this.m_bConfirmSent = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_ModeMatchConfirm' by default constructor.");
        return;
    }
    FM_ModeMatchConfirm(const FM_ModeMatchConfirm &inout Other)
    {
        this.m_MatchId = 0;
        this.m_MatchMode = 0;
        this.m_CommissionId = 0;
        this.m_ConfirmPlayerNum = 0;
        this.m_TotalPlayerNum = 0;
        this.m_bHasReject = false;
        this.m_bConfirmSent = false;
        this.m_MatchId = int(Other.m_MatchId);
        this.m_MatchMode = int(Other.m_MatchMode);
        this.m_CommissionId = int(Other.m_CommissionId);
        this.m_ConfirmPlayerNum = int(Other.m_ConfirmPlayerNum);
        this.m_TotalPlayerNum = int(Other.m_TotalPlayerNum);
        this.m_PlayerStatus = Other.m_PlayerStatus;
        this.m_bHasReject = Other.m_bHasReject;
        this.m_bConfirmSent = Other.m_bConfirmSent;
        return;
    }
    FM_ModeMatchConfirm(const uint InMatchId)
    {
        this.m_MatchId = 0;
        this.m_MatchMode = 0;
        this.m_CommissionId = 0;
        this.m_ConfirmPlayerNum = 0;
        this.m_TotalPlayerNum = 0;
        this.m_bHasReject = false;
        this.m_bConfirmSent = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMatchId(InMatchId);
        return;
    }
    FM_ModeMatchConfirm opAssign(const FM_ModeMatchConfirm &inout Other)
    {
        FM_ModeMatchConfirm __r;
        this.m_MatchId = int(Other.m_MatchId);
        this.m_MatchMode = int(Other.m_MatchMode);
        this.m_CommissionId = int(Other.m_CommissionId);
        this.m_ConfirmPlayerNum = int(Other.m_ConfirmPlayerNum);
        this.m_TotalPlayerNum = int(Other.m_TotalPlayerNum);
        this.m_PlayerStatus = Other.m_PlayerStatus;
        this.m_bHasReject = Other.m_bHasReject;
        this.m_bConfirmSent = Other.m_bConfirmSent;
        return __r;
    }
    void UpdateStatus(const TMap<uint, uint> &inout InPlayerStatus, const uint InConfirmNum, const uint InTotalNum)
    {
        this.SetPlayerStatus(InPlayerStatus);
        this.SetConfirmPlayerNum(InConfirmNum);
        this.SetTotalPlayerNum(InTotalNum);
        this.SetbHasReject(false);
        for (auto& local_20 : this.GetPlayerStatus())
        {
            local_20;
            if (0 == 2)
            {
                this.SetbHasReject(true);
                break;
            }
        }
        return;
    }
    void SetConfirmSent()
    {
        this.SetbConfirmSent(true);
        return;
    }
    uint GetMatchId() const property
    {
        this.TrackPropertyRead(0);
        return this.m_MatchId;
    }
    void SetMatchId(const uint __Value) property
    {
        if (this.m_MatchId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MatchId = __Value;
        return;
    }
    uint GetMatchMode() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MatchMode;
    }
    void SetMatchMode(const uint __Value) property
    {
        if (this.m_MatchMode == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MatchMode = __Value;
        return;
    }
    uint GetCommissionId() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CommissionId;
    }
    void SetCommissionId(const uint __Value) property
    {
        if (this.m_CommissionId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CommissionId = __Value;
        return;
    }
    uint GetConfirmPlayerNum() const property
    {
        this.TrackPropertyRead(3);
        return this.m_ConfirmPlayerNum;
    }
    void SetConfirmPlayerNum(const uint __Value) property
    {
        if (this.m_ConfirmPlayerNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ConfirmPlayerNum = __Value;
        return;
    }
    uint GetTotalPlayerNum() const property
    {
        this.TrackPropertyRead(4);
        return this.m_TotalPlayerNum;
    }
    void SetTotalPlayerNum(const uint __Value) property
    {
        if (this.m_TotalPlayerNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TotalPlayerNum = __Value;
        return;
    }
    const TMap<uint, uint> GetPlayerStatus() const property
    {
        const TMap<uint, uint> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TMap<uint, uint> GetModify_PlayerStatus() property
    {
        TMap<uint, uint> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetPlayerStatus(const TMap<uint, uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_PlayerStatus = __Value;
        return;
    }
    bool GetbHasReject() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bHasReject;
    }
    void SetbHasReject(const bool __Value) property
    {
        if (!(this.m_bHasReject) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bHasReject = __Value;
        return;
    }
    bool GetbConfirmSent() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bConfirmSent;
    }
    void SetbConfirmSent(const bool __Value) property
    {
        if (!(this.m_bConfirmSent) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bConfirmSent = __Value;
        return;
    }
}

class UModeMatchConfirmSource : UTeamMemberConfirmSourceBase
{
    UModeMatchConfirmSource()
    {
        super();
        return;
    }
    FText GetTitleName(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        FText __return;
        if (!(TEUIModelRef<FM_ModeMatchConfirm>(Business).IsValid()))
        {
            return FText();
        }
        if (GetMatchMode() == 2)
        {
            UObject local_16;
            int local_12 = GetCommissionId();
            ::FMS_CommissionData::Get(Context.Manager).FindCommissionByConfigDataId(local_16);
            if (local_16.IsValid() && GetCommissionConfig().IsSet())
            {
            }
            else
            {
                GetDataObjectByGSDataId<FCommissionConfig> local_68;
                if (local_68.opImplConv().IsSet())
                {
                }
                else
                {
                    __return = FText();
                }
            }
        }
        else
        {
            FM_ModeItem& local_118 = ::FM_ModeItem::Create(Context.Manager, GetMatchId());
            if (local_118.GetMatchConfig().IsSet())
            {
            }
            else
            {
                __return = FText();
            }
        }
        return __return;
    }
    float32 GetReplyTimeout(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        int local_105 = 0;
        if (!(TEUIModelRef<FM_ModeMatchConfirm>(Business).IsValid()))
        {
            return 0.0f;
        }
        if (GetMatchMode() == 2)
        {
            int local_8 = GetMatchId();
            GetDataObjectByGSDataId<FPveCommissionMatchConfig> local_56;
            if (local_56.opImplConv().IsSet())
            {
                return local_105;
            }
            return 0.0f;
        }
        FM_ModeItem& local_108 = ::FM_ModeItem::Create(Context.Manager, GetMatchId());
        if (local_108.GetMatchConfig().IsSet())
        {
            return local_105;
        }
        return 0.0f;
    }
    TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> BuildMembers(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> local_4;
        TEUIModelRef<FM_ModeMatchConfirm> local_6 = TEUIModelRef<FM_ModeMatchConfirm>(Business);
        if (!(local_6.IsValid()))
        {
            return local_4;
        }
        for (auto& local_28 : this.CollectPlayers(Context))
        {
            local_4.Add(this.BuildMemberItem(Context, local_28, local_6));
        }
        return local_4;
    }
    void RefreshMembers(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business, const TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> &inout Members) const
    {
        TEUIModelRef<FVM_TeammateInfo> local_22;
        TEUIModelRef<FM_Player> local_28;
        TEUIModelRef<FM_ModeMatchConfirm> local_2 = TEUIModelRef<FM_ModeMatchConfirm>(Business);
        if (!(local_2.IsValid()))
        {
            return;
        }
        for (auto& local_20 : Members)
        {
            local_22.GetTeammateInfo();
            if (!(local_22.IsValid()))
            {
                continue;
            }
            local_22.GetTeammateInfo();
            TEUIModelRef<FM_TeamMember> local_26;
            local_26.GetTeamMember();
            TEUIModelRef<FM_TeamMember> local_24;
            bool local_5 = !(local_24.IsValid());
            if (local_5)
            {
                local_5 = true;
            }
            else
            {
                local_28.GetPlayer();
                local_5 = !(local_28.IsValid());
            }
            if (local_5)
            {
                continue;
            }
            local_28.GetPlayer();
            this.ApplyMemberStatus(local_20, GetPlayerUid(), local_2);
        }
        return;
    }
    int GetReplyStatusIndex(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        if (!(TEUIModelRef<FM_ModeMatchConfirm>(Business).IsValid()))
        {
            return 0;
        }
        if (GetbHasReject())
        {
            return 2;
        }
        if (GetbConfirmSent())
        {
            return 1;
        }
        return 0;
    }
    FText GetReplyProgressText(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        bool local_5 = !(TEUIModelRef<FM_ModeMatchConfirm>(Business).IsValid());
        if (local_5)
        {
            local_5 = true;
        }
        else
        {
            int local_6 = GetTotalPlayerNum();
            local_5 = (local_6 == 0);
        }
        if (local_5)
        {
            return FText();
        }
        return FText::Format(FText::AsCultureInvariant("{0}/{1}"), GetConfirmPlayerNum(), GetTotalPlayerNum());
    }
    FText GetWarningText(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        if (!(TEUIModelRef<FM_ModeMatchConfirm>(Business).IsValid()) || (GetMatchMode() != 2))
        {
            return FText();
        }
        return ::TeamMemberConfirmUtils::BuildMissingIllustrateWarning(this.CollectPlayers(Context));
    }
    bool IsNoneReject(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        bool local_7;
        if (TEUIModelRef<FM_ModeMatchConfirm>(Business).IsValid())
        {
            local_7 = !(GetbHasReject());
        }
        else
        {
            local_7 = true;
        }
        return local_7;
    }
    TSoftClassPtr<UEUIUserWidget> GetContentWidgetClass(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        const UDraftSettings local_28;
        const UModeMatchContentSettings local_36;
        TEUIModelRef<FM_ModeMatchConfirm> local_2 = TEUIModelRef<FM_ModeMatchConfirm>(Business);
        if (!(local_2.IsValid()))
        {
            return TSoftClassPtr<UEUIUserWidget>();
        }
        if (GetMatchMode() == 2)
        {
            TEUIModelRef<FM_Commission> local_20 = this.ResolveCommission(Context, local_2);
            if (!(local_20.IsValid()))
            {
                return TSoftClassPtr<UEUIUserWidget>();
            }
            FEUIModelRef local_26 = local_20.opImplConv();
            GetGameplaySettings<UDraftSettings> local_30;
            local_28 = local_30;
            return local_28.GetDraftTypeAdapterWidgetClass(local_26.GetStructType());
        }
        GetGameplaySettings<UModeMatchContentSettings> local_38;
        local_36 = local_38;
        return local_36.GetContentWidgetClass(GetMatchMode());
    }
    FEUIModelContainer GetContentModel(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        const UDraftSettings local_32;
        const UModeMatchContentSettings local_44;
        TEUIModelRef<FM_ModeMatchConfirm> local_2 = TEUIModelRef<FM_ModeMatchConfirm>(Business);
        if (!(local_2.IsValid()))
        {
            return FEUIModelContainer();
        }
        if (GetMatchMode() == 2)
        {
            TEUIModelRef<FM_Commission> local_24 = this.ResolveCommission(Context, local_2);
            if (!(local_24.IsValid()))
            {
                return FEUIModelContainer();
            }
            FEUIModelRef local_28 = local_24.opImplConv();
            GetGameplaySettings<UDraftSettings> local_34;
            local_32 = local_34;
            const UDraftTypeAdapterBase local_42 = local_32.GetDraftTypeAdapter(local_28.GetStructType());
            if (local_42 != nullptr)
            {
                return local_42.MakeViewModels(Context, local_28);
            }
            return FEUIModelContainer();
        }
        GetGameplaySettings<UModeMatchContentSettings> local_46;
        local_44 = local_46;
        const UModeMatchContentAdapterBase local_52 = local_44.GetContentAdapter(GetMatchMode());
        if (local_52 != nullptr)
        {
            return local_52.MakeViewModels(Context, Business);
        }
        return FEUIModelContainer();
    }
    void OnAgree(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        ::FMS_Mode::Get(Context.Manager).GS_RequestMatchConfirm(true);
        return;
    }
    void OnReject(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        ::FMS_Mode::Get(Context.Manager).GS_RequestMatchConfirm(false);
        return;
    }
    TArray<TEUIModelRef<FM_Player>> CollectPlayers(const FEUIModelContext &inout Context) const
    {
        TArray<TEUIModelRef<FM_Player>> local_4;
        UObject local_8;
        ::FMS_PlayerSocialTeamData::Get(Context.Manager).GetLocalPlayerTeam();
        if (local_8.IsValid() && !(GetMembers().IsEmpty()))
        {
            TEUIModelRef<FM_Player> local_26;
            for (auto& local_24 : GetMembers())
            {
                local_24;
                local_26.GetPlayer();
                if (local_26.IsValid())
                {
                    local_26.GetPlayer();
                    local_4.Add(local_26);
                }
            }
        }
        else
        {
            TEUIModelRef<FM_Player> local_26;
            local_26 = ::FMS_PlayerData::Get(Context.Manager).GetLocalPlayerData();
            if (local_26.IsValid())
            {
                local_4.Add(local_26);
            }
        }
        return local_4;
    }
    TEUIModelRef<FM_Commission> ResolveCommission(const FEUIModelContext &inout Context, const TEUIModelRef<FM_ModeMatchConfirm> &inout Data) const
    {
        if (!(Data.IsValid()) || (GetMatchMode() != 2))
        {
            return TEUIModelRef<FM_Commission>();
        }
        int local_2 = GetCommissionId();
        return ::FMS_CommissionData::Get(Context.Manager).FindCommissionByConfigDataId();
    }
    TEUIModelRef<FVM_TeamMemberPrepareItem> BuildMemberItem(const FEUIModelContext &inout Context, const TEUIModelRef<FM_Player> &inout Player, const TEUIModelRef<FM_ModeMatchConfirm> &inout Data) const
    {
        TEUIModelRef<FVM_TeammateInfo> local_2;
        int local_14 = 0;
        UObject local_4;
        ::FMS_LocalPlayerTeamData::Get(Context.Manager).GetTeamMemberInAnyTeam(local_4);
        if (local_4.IsValid())
        {
            local_2 = TEUIModelRef<FVM_TeammateInfo>(::FVM_TeammateInfo::Create(local_4, Context.Manager));
        }
        else
        {
            local_14.SetPlayer(Player);
            local_2 = TEUIModelRef<FVM_TeammateInfo>(::FVM_TeammateInfo::Create(Context.Manager, (TEUIModelRef<FM_TeamMember>(local_14))));
        }
        TEUIModelRef<FVM_TeamMemberPrepareItem> local_16 = TEUIModelRef<FVM_TeamMemberPrepareItem>(::FVM_TeamMemberPrepareItem::Create(Context.Manager, local_2));
        ::FMS_PlayerData::Get(Context.Manager).GetLocalPlayerData();
        int local_23 = GetPlayerUid();
        (GetPlayerUid() == local_23).SetbSelf();
        this.ApplyMemberStatus(local_16, GetPlayerUid(), Data);
        return local_16;
    }
    void ApplyMemberStatus(const TEUIModelRef<FVM_TeamMemberPrepareItem> &inout Item, const uint Uid, const TEUIModelRef<FM_ModeMatchConfirm> &inout Data) const
    {
        int local_1 = 0;
        (GetPlayerStatus().Find(Uid, local_1)).SetbReady();
        (local_1 == 2).SetbReject();
        return;
    }
}

namespace FM_ModeMatchConfirm
{
FM_ModeMatchConfirm& Create(const UObject ContextObject, const uint MatchId)
{
    return FM_ModeMatchConfirm::CreateByManager(EUIInternal::GetContextManager(ContextObject), MatchId);
}
FM_ModeMatchConfirm CreateByManager(const UEUIManagerSubsystem Manager, const uint MatchId)
{
    FM_ModeMatchConfirm __r;
    TEUIModelRef<FM_ModeMatchConfirm> local_6 = TEUIModelRef<FM_ModeMatchConfirm>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_ModeMatchConfirm::ModelId, 0, MatchId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_ModeMatchConfirm;
}
int __IndexOf_MatchId()
{
    return 0;
}
int __IndexOf_MatchMode()
{
    return 1;
}
int __IndexOf_CommissionId()
{
    return 2;
}
int __IndexOf_ConfirmPlayerNum()
{
    return 3;
}
int __IndexOf_TotalPlayerNum()
{
    return 4;
}
int __IndexOf_PlayerStatus()
{
    return 5;
}
int __IndexOf_bHasReject()
{
    return 6;
}
int __IndexOf_bConfirmSent()
{
    return 7;
}
}
