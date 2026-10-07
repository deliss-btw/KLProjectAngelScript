
namespace FMS_PlayerCombatTeamData
{
    const int ModelId = 0;

}
struct FMsg_CombatTeamChanged : FEUIMessage
{
    FMsg_CombatTeamChanged()
    {
        return;
    }
}

struct FMS_PlayerCombatTeamData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_CombatTeam> m_LocalPlayerCombatTeamPrivate;

    FMS_PlayerCombatTeamData()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_PlayerCombatTeamData(const FMS_PlayerCombatTeamData &inout Other)
    {
        this.m_LocalPlayerCombatTeamPrivate = Other.m_LocalPlayerCombatTeamPrivate;
        return;
    }
    FMS_PlayerCombatTeamData& opAssign(const FMS_PlayerCombatTeamData &inout Other)
    {
        return Other.m_LocalPlayerCombatTeamPrivate;
    }
    TEUIModelRef<FM_CombatTeam> GetLocalPlayerCombatTeam() const property
    {
        return this.GetLocalPlayerCombatTeamPrivate();
    }
    TEUIModelRef<FM_TeamMember> FindTeamMemberByPlayer(const TEUIModelRef<FM_Player> &inout Player) const
    {
        if (this.GetLocalPlayerCombatTeam())
        {
            for (auto& local_18 : this.GetLocalPlayerCombatTeam().opArrow().GetMembers())
            {
                if ((local_18.opArrow().GetPlayer() == Player.opImplConv()))
                {
                    return local_18;
                }
            }
        }
        return TEUIModelRef<FM_TeamMember>();
    }
    void PostConstruct()
    {
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        Get local_8;
        const FC_PlayerInTeam& local_10 = local_8.opCall();
        if (local_10)
        {
            this.SetLocalPlayerCombatTeamPrivate(TEUIModelRef<FM_CombatTeam>(::FM_CombatTeam::Create(this.GetContext().Manager, local_10.GetTeamEntity())));
        }
        return;
    }
    void DS_OnLocalPlayerCombatTeamChanged(const FC_PlayerInTeam &inout C_PlayerInTeam)
    {
        if (!(C_PlayerInTeam) || !(C_PlayerInTeam.GetTeamEntity()))
        {
            if (this.GetLocalPlayerCombatTeamPrivate())
            {
                this.SetLocalPlayerCombatTeamPrivate(TEUIModelRef<FM_CombatTeam>());
                FEUIModelRef local_10 = FEUIModelRef(this);
                FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_10);
            }
            return;
        }
        if (!(this.GetLocalPlayerCombatTeamPrivate()) || !((FECSEntity(this.GetLocalPlayerCombatTeamPrivate().opArrow().GetTeamEntity()) == C_PlayerInTeam.GetTeamEntity())))
        {
            this.SetLocalPlayerCombatTeamPrivate(TEUIModelRef<FM_CombatTeam>(::FM_CombatTeam::Create(this.GetContext().Manager, C_PlayerInTeam.GetTeamEntity())));
            FEUIModelRef local_10_2 = FEUIModelRef(this);
            FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_10_2);
        }
        return;
    }
    void InvalidateEntityCache()
    {
        this.SetLocalPlayerCombatTeamPrivate(TEUIModelRef<FM_CombatTeam>());
        FEUIModelRef local_8 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_8);
        return;
    }
    TEUIModelRef<FM_CombatTeam> GetLocalPlayerCombatTeamPrivate() const property
    {
        this.TrackPropertyRead(0);
        return this.m_LocalPlayerCombatTeamPrivate;
    }
    void SetLocalPlayerCombatTeamPrivate(const TEUIModelRef<FM_CombatTeam> &inout __Value) property
    {
        TEUIModelRef<FM_CombatTeam> local_2;
        local_2 = this.m_LocalPlayerCombatTeamPrivate;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LocalPlayerCombatTeamPrivate = __Value;
        return;
    }
}

namespace FMS_PlayerCombatTeamData
{
FMS_PlayerCombatTeamData& Get(const UObject ContextObject)
{
    return FMS_PlayerCombatTeamData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_PlayerCombatTeamData GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_PlayerCombatTeamData __r;
    TEUIModelRef<FMS_PlayerCombatTeamData> local_6 = TEUIModelRef<FMS_PlayerCombatTeamData>(EUIInternal::MakeModelWithManager(Manager, FMS_PlayerCombatTeamData::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__DS_OnLocalPlayerCombatTeamChanged";
    local_14.ComponentType = FC_PlayerInTeam;
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_PlayerCombatTeamData;
}
void __DS_OnLocalPlayerCombatTeamChanged(FMS_PlayerCombatTeamData &inout Model, const FECSEntity &inout Entity, const FC_PlayerInTeam &inout Component)
{
    Model.DS_OnLocalPlayerCombatTeamChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_LocalPlayerCombatTeamPrivate()
{
    return 0;
}
}
