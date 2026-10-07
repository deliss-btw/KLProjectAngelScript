
namespace FM_PlayerMarkSpotManager
{
    const int ModelId = 0;
}
namespace FMS_MarkSpotManager
{
    const int ModelId = 0;

}
struct FM_PlayerMarkSpotManager : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TEUIModelRef<FM_Player> m_Player;
    UPROPERTY()
    FECSEntity m_PlayerEntity;
    UPROPERTY()
    TEUIModelRef<FM_SpotRegistry> m_SpotRegistry;
    UPROPERTY()
    TMap<FECSEntityId, TEUIModelRef<FM_Spot>> m_MarkSpots;

    FM_PlayerMarkSpotManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_PlayerMarkSpotManager' by default constructor.");
        return;
    }
    FM_PlayerMarkSpotManager(const FM_PlayerMarkSpotManager &inout Other)
    {
        this.m_Player = Other.m_Player;
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_SpotRegistry = Other.m_SpotRegistry;
        this.m_MarkSpots = Other.m_MarkSpots;
        return;
    }
    FM_PlayerMarkSpotManager(const TEUIModelRef<FM_Player> &inout InPlayer)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetPlayer(InPlayer);
        return;
    }
    FM_PlayerMarkSpotManager& opAssign(const FM_PlayerMarkSpotManager &inout Other)
    {
        this.m_Player = Other.m_Player;
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_SpotRegistry = Other.m_SpotRegistry;
        return Other.m_MarkSpots;
    }
    void PostConstruct()
    {
        this.SetSpotRegistry(TEUIModelRef<FM_SpotRegistry>(::PresentationSpotUtils::GetDefaultRegistry(this.GetManager())));
        this.SetPlayerEntity(this.GetPlayer().opArrow().GetPlayerEntity());
        if (this.GetPlayerEntity())
        {
            Get local_16;
            this.UpdatePlayerMarks(local_16.opCall());
        }
        return;
    }
    void BeginDestroy()
    {
        for (auto& local_20 : this.GetMarkSpots())
        {
            local_20;
            FM_Spot local_22;
            this.RemovePlayerMarkData(local_22);
        }
        return;
    }
    void OnPlayerEntityChanged(const FMsg_PlayerEntityChanged &inout Msg)
    {
        this.SetPlayerEntity(Msg.PlayerEntity);
        return;
    }
    void OnPlayerMarksChanged(const FC_PlayerMarks &inout C_PlayerMarks)
    {
        this.UpdatePlayerMarks(C_PlayerMarks);
        return;
    }
    void UpdatePlayerMarks(const FC_PlayerMarks &inout C_PlayerMarks)
    {
        TEUIModelRef<FM_SpotRegistry> local_50;
        if (!(C_PlayerMarks))
        {
            for (auto& local_20 : this.GetMarkSpots())
            {
                FM_Spot local_22;
                this.RemovePlayerMarkData(local_22);
            }
            this.GetModify_MarkSpots().Empty(0);
            return;
        }
        for (auto& local_42 : C_PlayerMarks.GetAllMarks())
        {
            if (!(this.GetMarkSpots().Contains(local_42.GetKey())))
            {
                TEUIModelRef<FM_Spot> local_44;
                if ((FECSEntityId(GetMarkedEntityID()) == ENTITY_ID_NULL))
                {
                    local_44 = TEUIModelRef<FM_Spot>(::PresentationSpotUtils::RequireEntitySpot(this.GetContext().Manager, local_42.GetKey(), local_50));
                }
                else
                {
                    local_44 = TEUIModelRef<FM_Spot>(::PresentationSpotUtils::RequireEntitySpot(this.GetContext().Manager, GetMarkedEntityID(), local_50));
                }
                this.SavePlayerMarkData();
                this.GetModify_MarkSpots().Add(local_42.GetKey(), local_44);
            }
        }
        TArray<FECSEntityId> local_56;
        for (auto& local_20_2 : this.GetMarkSpots())
        {
            if (!(C_PlayerMarks.GetAllMarks().Contains(local_20_2.GetKey())))
            {
                local_56.Add(local_20_2.GetKey());
            }
        }
        for (auto& local_70 : local_56)
        {
            TEUIModelRef<FM_Spot> local_44;
            if (this.GetModify_MarkSpots().RemoveAndCopyValue(local_70, local_44))
            {
                this.RemovePlayerMarkData();
            }
        }
        return;
    }
    bool SpotIsMarkEntity(const FM_Spot &inout Spot)
    {
        FSpotViewAdapter local_8;
        TEUIModelRef<FM_PresentationData_Mark> local_10 = ::GetMarkData(Spot, local_8);
        if (local_10)
        {
            return local_10.opArrow().GetbIsPositionMark();
        }
        return false;
    }
    void SavePlayerMarkData(FM_Spot &inout Spot, const FMarkInfo &inout MarkInfo)
    {
        if ((FECSEntityId(MarkInfo.GetMarkedEntityID()) == ENTITY_ID_NULL))
        {
            if (!(Spot.GetTransform().GetPosition2D().Equals(FVector2D(MarkInfo.GetMarkPosition().X, MarkInfo.GetMarkPosition().Y), 1.0)))
            {
                ::FMS_PresentationSpotMinimapIconManager::Get(this.GetManager()).ForceUnregisterSpotIcon(TEUIModelRef<FM_Spot>(Spot));
            }
            Spot.GetModify_Transform().SetPosition(MarkInfo.GetMarkPosition());
        }
        FSpotViewAdapter local_28;
        TEUIModelRef<FM_PresentationData_Mark> local_30 = ::GetMarkData(Spot, local_28);
        TEUIModelRef<FM_SpotRegistry> local_34;
        if (!(local_30))
        {
            local_34 = this.GetSpotRegistry();
            local_30 = ::AddMarkData(Spot, (FECSEntityId(MarkInfo.GetMarkedEntityID()) == ENTITY_ID_NULL), local_34);
        }
        else
        {
            bool local_35 = !(local_30.opArrow().GetbIsPositionMark());
            bool local_2 = !((FECSEntityId(MarkInfo.GetMarkedEntityID()) == ENTITY_ID_NULL));
        }
        FPlayerMarkData local_62 = FPlayerMarkData(MarkInfo.GetMarkConfig(), MarkInfo.GetMarkTime());
        TEUIModelRef<FM_Player> local_64 = this.GetPlayer();
        local_30.opArrow().GetModify_PlayerMarkDataMap().Add(local_64, local_62);
        ::AddDecoractor(Spot, EPresentationSpotDecoractor(1), local_34);
        return;
    }
    void RemovePlayerMarkData(FM_Spot &inout Spot)
    {
        bool local_1 = false;
        TEUIModelRef<FM_PresentationData_Mark> local_14 = ::GetMarkData(Spot, FSpotViewAdapter(this.GetSpotRegistry()));
        if (local_14)
        {
            local_1 = local_14.opArrow().GetbIsPositionMark();
        }
        if (local_1)
        {
            ::FMS_PresentationSpotMinimapIconManager::Get(this.GetManager()).ForceUnregisterSpotIcon(TEUIModelRef<FM_Spot>(Spot));
        }
        TEUIModelRef<FM_SpotRegistry> local_12 = this.GetSpotRegistry();
        TEUIModelRef<FM_PresentationData_Mark> local_16 = ::GetMarkData(Spot, FSpotViewAdapter(local_12));
        if (local_16)
        {
            TEUIModelRef<FM_Player> local_22 = this.GetPlayer();
            if (local_16.opArrow().GetPlayerMarkDataMap().IsEmpty())
            {
                local_12 = this.GetSpotRegistry();
                ::RemoveMarkData(Spot, local_12);
                ::RemoveDecoractor(Spot, EPresentationSpotDecoractor(1), local_12);
            }
        }
        else
        {
            ::RemoveDecoractor(Spot, EPresentationSpotDecoractor(1), local_12);
        }
        return;
    }
    TEUIModelRef<FM_Player> GetPlayer() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Player;
    }
    void SetPlayer(const TEUIModelRef<FM_Player> &inout __Value) property
    {
        TEUIModelRef<FM_Player> local_2;
        local_2 = this.m_Player;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Player = __Value;
        return;
    }
    FECSEntity GetPlayerEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FECSEntity GetModify_PlayerEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetPlayerEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PlayerEntity = __Value;
        return;
    }
    TEUIModelRef<FM_SpotRegistry> GetSpotRegistry() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SpotRegistry;
    }
    void SetSpotRegistry(const TEUIModelRef<FM_SpotRegistry> &inout __Value) property
    {
        TEUIModelRef<FM_SpotRegistry> local_2;
        local_2 = this.m_SpotRegistry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SpotRegistry = __Value;
        return;
    }
    const TMap<FECSEntityId, TEUIModelRef<FM_Spot>> GetMarkSpots() const property
    {
        const TMap<FECSEntityId, TEUIModelRef<FM_Spot>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<FECSEntityId, TEUIModelRef<FM_Spot>> GetModify_MarkSpots() property
    {
        TMap<FECSEntityId, TEUIModelRef<FM_Spot>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetMarkSpots(const TMap<FECSEntityId, TEUIModelRef<FM_Spot>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_MarkSpots = __Value;
        return;
    }
}

struct FMS_MarkSpotManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<TEUIModelRef<FM_Player>, TEUIModelRef<FM_PlayerMarkSpotManager>> m_PlayerMarkSpotManagers;

    FMS_MarkSpotManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_MarkSpotManager(const FMS_MarkSpotManager &inout Other)
    {
        this.m_PlayerMarkSpotManagers = Other.m_PlayerMarkSpotManagers;
        return;
    }
    FMS_MarkSpotManager& opAssign(const FMS_MarkSpotManager &inout Other)
    {
        return Other.m_PlayerMarkSpotManagers;
    }
    void PostConstruct()
    {
        this.UpdateDisplayPlayers();
        return;
    }
    void OnTeamInfoChanged(const FMsg_CombatTeamChanged &inout Msg)
    {
        this.UpdateDisplayPlayers();
        return;
    }
    void OnTeamMemberChanged(const FMsg_CombatTeamMemberChanged &inout Msg)
    {
        this.UpdateDisplayPlayers();
        return;
    }
    void UpdateDisplayPlayers()
    {
        TArray<TEUIModelRef<FM_Player>> local_4;
        TEUIModelRef<FM_CombatTeam> local_6 = ::FMS_PlayerCombatTeamData::Get(this.GetContext().Manager).GetLocalPlayerCombatTeam();
        if (!(local_6))
        {
            local_4.Add(::FMS_PlayerData::Get(this.GetContext().Manager).GetLocalPlayerData());
        }
        else
        {
            for (auto& local_28 : local_6.opArrow().GetMembers())
            {
                if (local_28.opArrow().GetPlayer())
                {
                    local_4.Add(local_28.opArrow().GetPlayer());
                }
            }
        }
        this.UpdatePlayerMarkSpotManagers(local_4);
        return;
    }
    void UpdatePlayerMarkSpotManagers(const TArray<TEUIModelRef<FM_Player>> &inout DisplayPlayers)
    {
        for (auto local_16 : DisplayPlayers)
        {
            if (!(this.GetPlayerMarkSpotManagers().Contains(local_16)))
            {
                this.GetModify_PlayerMarkSpotManagers().Add(local_16, TEUIModelRef<FM_PlayerMarkSpotManager>(::FM_PlayerMarkSpotManager::Create(this.GetContext().Manager, local_16)));
            }
        }
        TArray<TEUIModelRef<FM_Player>> local_24;
        for (auto& local_42 : this.GetPlayerMarkSpotManagers())
        {
            if (!(DisplayPlayers.Contains(local_42.GetKey())))
            {
                local_24.Add(local_42.GetKey());
            }
        }
        for (auto local_16 : local_24)
        {
        }
        return;
    }
    const TMap<TEUIModelRef<FM_Player>, TEUIModelRef<FM_PlayerMarkSpotManager>> GetPlayerMarkSpotManagers() const property
    {
        const TMap<TEUIModelRef<FM_Player>, TEUIModelRef<FM_PlayerMarkSpotManager>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<TEUIModelRef<FM_Player>, TEUIModelRef<FM_PlayerMarkSpotManager>> GetModify_PlayerMarkSpotManagers() property
    {
        TMap<TEUIModelRef<FM_Player>, TEUIModelRef<FM_PlayerMarkSpotManager>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPlayerMarkSpotManagers(const TMap<TEUIModelRef<FM_Player>, TEUIModelRef<FM_PlayerMarkSpotManager>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerMarkSpotManagers = __Value;
        return;
    }
}

namespace FM_PlayerMarkSpotManager
{
FM_PlayerMarkSpotManager& Create(const UObject ContextObject, const TEUIModelRef<FM_Player> &inout Player)
{
    return FM_PlayerMarkSpotManager::CreateByManager(EUIInternal::GetContextManager(ContextObject), Player);
}
FM_PlayerMarkSpotManager CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Player> &inout Player)
{
    FM_PlayerMarkSpotManager __r;
    TEUIModelRef<FM_PlayerMarkSpotManager> local_6 = TEUIModelRef<FM_PlayerMarkSpotManager>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_PlayerMarkSpotManager::ModelId, 0, Player));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FM_PlayerMarkSpotManager;
}
void __OnPlayerEntityChanged(FM_PlayerMarkSpotManager &inout Model, const FMsg_PlayerEntityChanged &inout Message)
{
    Model.OnPlayerEntityChanged(Message);
    return;
}
void __OnPlayerMarksChanged(FM_PlayerMarkSpotManager &inout Model, const FECSEntity &inout Entity, const FC_PlayerMarks &inout Component)
{
    Model.OnPlayerMarksChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_Player()
{
    return 0;
}
int __IndexOf_PlayerEntity()
{
    return 1;
}
int __IndexOf_SpotRegistry()
{
    return 2;
}
int __IndexOf_MarkSpots()
{
    return 3;
}
}
namespace FMS_MarkSpotManager
{
FMS_MarkSpotManager& Get(const UObject ContextObject)
{
    return FMS_MarkSpotManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_MarkSpotManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_MarkSpotManager __r;
    TEUIModelRef<FMS_MarkSpotManager> local_6 = TEUIModelRef<FMS_MarkSpotManager>(EUIInternal::MakeModelWithManager(Manager, FMS_MarkSpotManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__OnTeamInfoChanged";
    local_14.MessageTypeName = "Msg_CombatTeamChanged";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnTeamMemberChanged";
    local_14.MessageTypeName = "Msg_CombatTeamMemberChanged";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_MarkSpotManager;
}
void __OnTeamInfoChanged(FMS_MarkSpotManager &inout Model, const FMsg_CombatTeamChanged &inout Message)
{
    Model.OnTeamInfoChanged(Message);
    return;
}
void __OnTeamMemberChanged(FMS_MarkSpotManager &inout Model, const FMsg_CombatTeamMemberChanged &inout Message)
{
    Model.OnTeamMemberChanged(Message);
    return;
}
int __IndexOf_PlayerMarkSpotManagers()
{
    return 0;
}
}
