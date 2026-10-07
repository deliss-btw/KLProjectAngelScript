
namespace FM_CombatTeam
{
    const int ModelId = 0;

}
struct FMsg_CombatTeamMemberChanged : FEUIMessage
{
    FMsg_CombatTeamMemberChanged()
    {
        return;
    }
}

struct FM_CombatTeam : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    FECSEntity m_TeamEntity;
    UPROPERTY()
    FTeamCommonData m_TeamCommonData;

    FM_CombatTeam()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_CombatTeam' by default constructor.");
        return;
    }
    FM_CombatTeam(const FM_CombatTeam &inout Other)
    {
        this.m_TeamEntity = Other.m_TeamEntity;
        return;
    }
    FM_CombatTeam(const FECSEntity &inout InTeamEntity)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTeamEntity(InTeamEntity);
        return;
    }
    FM_CombatTeam& opAssign(const FM_CombatTeam &inout Other)
    {
        return Other.m_TeamEntity;
    }
    const TArray<TEUIModelRef<FM_TeamMember>> GetMembers() const property
    {
        const TArray<TEUIModelRef<FM_TeamMember>> __r;
        return __r;
    }
    float32 GetTeamLinkEnergy() const property
    {
        return 0.0f;
    }
    float32 GetTeamMaxLinkEnergy() const property
    {
        return 100.0f;
    }
    TArray<uint> CollectUiMemberPlayerUids() const
    {
        TEUIModelRef<FM_Player> local_12;
        TArray<uint> local_4;
        int local_5 = 0;
        for (; local_5 < this.GetTeamCommonData().Members.Num(); ++local_5)
        {
            const TEUIModelRef<FM_TeamMember>& local_10 = this.GetTeamCommonData().Members[local_5];
            bool local_8 = !(local_10.IsValid());
            if (local_8)
            {
                local_8 = true;
            }
            else
            {
                local_12.GetPlayer();
                local_8 = !(local_12.IsValid());
            }
            if (local_8)
            {
                continue;
            }
            local_12.GetPlayer();
            local_4.Add(local_12.opArrow().GetPlayerUid());
        }
        return local_4;
    }
    TArray<uint> CollectTeamInfoMemberPlayerUids(const FC_TeamInfo &inout Info) const
    {
        TArray<uint> local_4;
        int local_5 = 0;
        Has local_16;
        for (; local_5 < Info.GetMembers().Num(); ++local_5)
        {
            FECSEntity local_12 = FECSEntity(Info.GetMembers()[local_5].GetEntity());
            if (!(local_12.IsValid()) || !(local_16.opCall()))
            {
                continue;
            }
            local_4.Add(::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_12));
        }
        return local_4;
    }
    bool UidArrayContains(const TArray<uint> &inout Arr, const uint Uid) const
    {
        int local_1 = 0;
        for (; local_1 < Arr.Num(); ++local_1)
        {
            if (Arr[local_1] == Uid)
            {
                return true;
            }
        }
        return false;
    }
    void NotifyChatCombatTeamMemberDiff(const TArray<uint> &inout OldUids, const TArray<uint> &inout NewUids)
    {
        int local_7;
        FMS_ChatDataModel& local_2 = ::FMS_ChatDataModel::Get(this.GetContext().Manager);
        int local_3 = 0;
        for (; local_3 < NewUids.Num(); ++local_3)
        {
            local_7 = NewUids[local_3];
            if (!(this.UidArrayContains(OldUids, local_7)))
            {
                if (NewUids.Num() > 1)
                {
                    XLog(ELog(74), FString().Append("NotifyChatCombatTeamMemberDiff Join NewUids=").Append(local_7));
                    local_2.PublishCombatTeamMemberJoinOrLeaveSystemMsg(true, local_7);
                }
            }
        }
        int local_3_2 = 0;
        for (; local_3_2 < OldUids.Num(); ++local_3_2)
        {
            local_7 = OldUids[local_3_2];
            if (!(this.UidArrayContains(NewUids, local_7)))
            {
                XLog(ELog(74), FString().Append("NotifyChatCombatTeamMemberDiff Leave OldUids=").Append(local_7));
                local_2.PublishCombatTeamMemberJoinOrLeaveSystemMsg(false, local_7);
                ::FMS_LocalPlayerTeamData::Get(this.GetContext().Manager).ForgetMuteIfNotTeammate(local_7);
            }
        }
        return;
    }
    void DS_OnTeamInfoChanged(const FC_TeamInfo &inout C_TeamInfo)
    {
        TArray<uint> local_8 = this.CollectUiMemberPlayerUids();
        if (!(C_TeamInfo))
        {
            this.SetTeamCommonData(FTeamCommonData::Dummy);
            TArray<uint> local_4;
            this.NotifyChatCombatTeamMemberDiff(local_8, local_4);
            return;
        }
        bool local_10 = false;
        bool local_11 = false;
        int local_13 = C_TeamInfo.GetMembers().Num();
        for (; local_13 < this.GetMembers().Num(); )
        {
            this.GetTeamCommonData().Members[local_13].opArrow().RemoveFromTeam(false);
            local_11 = true;
            ++local_13;
        }
        if (local_11)
        {
            TEUIModelRef<FM_TeamMember> local_16 = TEUIModelRef<FM_TeamMember>(nullptr);
            local_10 = true;
        }
        int local_12 = this.GetMembers().Num();
        for (; local_12 < C_TeamInfo.GetMembers().Num(); )
        {
            FEUIModelWeakRef local_18 = FEUIModelWeakRef(FEUIModelRef(this));
            TEUIModelRef<FM_TeamMember> local_16_2 = TEUIModelRef<FM_TeamMember>(::FM_TeamMember::Create(this.GetContext().Manager, local_18));
            this.GetModify_TeamCommonData().Members.Add(local_16_2);
            local_10 = true;
            ++local_12;
        }
        int local_12_2 = 0;
        Has local_30;
        TEUIModelRef<FM_Player> local_34;
        for (; local_12_2 < this.GetMembers().Num(); ++local_12_2)
        {
            FECSEntity local_26 = FECSEntity(C_TeamInfo.GetMembers()[local_12_2].GetEntity());
            if (!(local_26.IsValid()) || !(local_30.opCall()))
            {
                this.GetTeamCommonData().Members[local_12_2].opArrow().SetPlayer(local_34);
                continue;
            }
            local_34 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetOrCreatePlayerByEntity(local_26);
            this.GetTeamCommonData().Members[local_12_2].opArrow().SetPlayer(local_34);
        }
        this.NotifyChatCombatTeamMemberDiff(local_8, this.CollectTeamInfoMemberPlayerUids(C_TeamInfo));
        if (local_10)
        {
            FEUIModelRef local_20 = FEUIModelRef(this);
            FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_20);
        }
        return;
    }
    const FECSEntity GetTeamEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_TeamEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTeamEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeamEntity = __Value;
        return;
    }
    FTeamCommonData GetTeamCommonData() const property
    {
        FTeamCommonData __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FTeamCommonData GetModify_TeamCommonData() property
    {
        FTeamCommonData __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTeamCommonData(const FTeamCommonData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
}

namespace FM_CombatTeam
{
FM_CombatTeam& Create(const UObject ContextObject, const FECSEntity &inout TeamEntity)
{
    return FM_CombatTeam::CreateByManager(EUIInternal::GetContextManager(ContextObject), TeamEntity);
}
FM_CombatTeam CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout TeamEntity)
{
    FM_CombatTeam __r;
    TEUIModelRef<FM_CombatTeam> local_6 = TEUIModelRef<FM_CombatTeam>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_CombatTeam::ModelId, 0, TeamEntity));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__DS_OnTeamInfoChanged";
    local_14.ComponentType = FC_TeamInfo;
    local_14.MonitorPropertyName = FName("TeamEntity");
    int local_2_2 = FM_CombatTeam::__IndexOf_TeamEntity();
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_CombatTeam;
}
void __DS_OnTeamInfoChanged(FM_CombatTeam &inout Model, const FECSEntity &inout Entity, const FC_TeamInfo &inout Component)
{
    Model.DS_OnTeamInfoChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_TeamEntity()
{
    return 0;
}
int __IndexOf_TeamCommonData()
{
    return 1;
}
}
