
namespace FM_PlayerSpotUpdater
{
    const int ModelId = 0;
}
namespace FMS_PlayerSpotManager
{
    const int ModelId = 0;

}
struct FM_PlayerSpotUpdater : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TEUIModelRef<FM_SpotRegistry> m_SpotRegistry;
    UPROPERTY()
    FECSEntity m_PlayerEntity;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    FECSEntity m_PlayerPawnEntity;
    UPROPERTY()
    FECSEntity m_PlayerTeamEntity;
    UPROPERTY()
    bool m_bUpdatingTransformFromActor;
    UPROPERTY()
    bool m_bDEBUG_ForceUseTransformFromTeam;

    FM_PlayerSpotUpdater()
    {
        this.m_bUpdatingTransformFromActor = false;
        this.m_bDEBUG_ForceUseTransformFromTeam = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_PlayerSpotUpdater' by default constructor.");
        return;
    }
    FM_PlayerSpotUpdater(const FM_PlayerSpotUpdater &inout Other)
    {
        this.m_bUpdatingTransformFromActor = false;
        this.m_bDEBUG_ForceUseTransformFromTeam = false;
        this.m_SpotRegistry = Other.m_SpotRegistry;
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_Spot = Other.m_Spot;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        this.m_PlayerTeamEntity = Other.m_PlayerTeamEntity;
        this.m_bUpdatingTransformFromActor = Other.m_bUpdatingTransformFromActor;
        this.m_bDEBUG_ForceUseTransformFromTeam = Other.m_bDEBUG_ForceUseTransformFromTeam;
        return;
    }
    FM_PlayerSpotUpdater(const TEUIModelRef<FM_SpotRegistry> &inout InSpotRegistry, const FECSEntity &inout InPlayerEntity)
    {
        this.m_bUpdatingTransformFromActor = false;
        this.m_bDEBUG_ForceUseTransformFromTeam = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpotRegistry(InSpotRegistry);
        this.SetPlayerEntity(InPlayerEntity);
        return;
    }
    FM_PlayerSpotUpdater opAssign(const FM_PlayerSpotUpdater &inout Other)
    {
        FM_PlayerSpotUpdater __r;
        this.m_SpotRegistry = Other.m_SpotRegistry;
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_Spot = Other.m_Spot;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        this.m_PlayerTeamEntity = Other.m_PlayerTeamEntity;
        this.m_bUpdatingTransformFromActor = Other.m_bUpdatingTransformFromActor;
        this.m_bDEBUG_ForceUseTransformFromTeam = Other.m_bDEBUG_ForceUseTransformFromTeam;
        return __r;
    }
    void PostConstruct()
    {
        FEUIModelRef local_2;
        TEUIModelRef<FM_SpotRegistry> local_4 = TEUIModelRef<FM_SpotRegistry>(local_2);
        TEUIModelRef<FM_Spot> local_8 = TEUIModelRef<FM_Spot>(::PresentationSpotUtils::RequireEntitySpot(this.GetContext().Manager, this.GetPlayerEntity().GetId(), local_4));
        this.SetSpot(local_8);
        TEUIModelRef<FM_Player> local_10 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetOrCreatePlayerByEntity(this.GetPlayerEntity());
        TEUIModelRef<FM_Spot> local_8_2 = this.GetSpot();
        ::SetPlayer(local_8_2.opArrow(), local_10);
        Get local_14;
        this.UpdatePawnEntity(local_14.opCall());
        Get local_18;
        this.UpdateTeamEntity(local_18.opCall());
        this.UpdateSpotPresentationConfig();
        return;
    }
    void BeginDestroy()
    {
        this.RemoveSpotFromRegistry();
        return;
    }
    void UpdateTransformFromActor()
    {
        const AActor local_8;
        int local_10 = 0;
        if (!(!(this.GetSpot())) && this.GetPlayerPawnEntity())
        {
            local_8 = this.GetPlayerPawnEntity().GetActor();
            if (local_8 != nullptr)
            {
                TEUIModelRef<FM_Spot> local_2 = this.GetSpot();
                local_10.SetPosition(local_8.GetActorLocation());
                local_10.SetEulerRotation(FVector3f(local_8.GetActorRotation().Euler()));
                this.SetbUpdatingTransformFromActor(true);
                return;
            }
        }
        this.SetbUpdatingTransformFromActor(false);
        return;
    }
    void OnPlayerControllerChanged(const FC_PlayerController &inout PlayerController)
    {
        this.UpdatePawnEntity(PlayerController);
        return;
    }
    void OnPlayerInTeamChanged(const FC_PlayerInTeam &inout PlayerInTeam)
    {
        this.UpdateTeamEntity(PlayerInTeam);
        return;
    }
    void OnPlayerTransformChanged(const FC_Transform &inout C_Transform)
    {
        int local_8 = 0;
        if (this.GetbDEBUG_ForceUseTransformFromTeam())
        {
            return;
        }
        if (this.GetbUpdatingTransformFromActor())
        {
            return;
        }
        bool local_1 = this.GetSpot();
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            local_1 = C_Transform;
        }
        if (local_1)
        {
            TEUIModelRef<FM_Spot> local_4 = this.GetSpot();
            FTransform local_32 = FTransformUtils::GetTransform(this.GetPlayerPawnEntity(), this.GetContext().Time);
            local_8.SetPosition(local_32.GetLocation());
            local_8.SetEulerRotation(FVector3f(local_32.GetRotation().Euler()));
        }
        return;
    }
    void OnPlayerTeamInfoChanged(const FC_TeamInfo &inout C_TeamInfo)
    {
        bool local_3 = this.GetSpot();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            local_3 = C_TeamInfo;
        }
        if (local_3)
        {
            this.UpdateSpotPresentationConfig();
            if (!(this.GetPlayerPawnEntity()) || this.GetbDEBUG_ForceUseTransformFromTeam())
            {
                FTeamMemberInfo local_42;
                if (::FTeamUtils::FindTeamMemberInfo(this.GetPlayerEntity(), local_42))
                {
                    FVector2D local_46 = this.GetSpot().opArrow().GetTransform().GetPosition2D();
                    this.GetSpot().opArrow().GetModify_Transform().SetPosition(local_42.GetPosition());
                    FVector2D local_54 = (this.GetSpot().opArrow().GetTransform().GetPosition2D() - local_46);
                    if (!(local_54.IsNearlyZero(9.999999747378752e-5)))
                    {
                        FVector2D local_58 = local_54.GetSafeNormal(9.99999993922529e-9);
                        this.GetSpot().opArrow().GetModify_Transform().SetAngle(float32((FMath::RadiansToDegrees(FMath::Atan2(local_58.Y, local_58.X)))));
                    }
                }
            }
        }
        return;
    }
    void OnLocalPlayerTeamMemberChanged(const FMsg_CombatTeamMemberChanged &inout Message)
    {
        this.UpdateSpotPresentationConfig();
        return;
    }
    void OnLocalPlayerTeamChanged(const FC_PlayerInTeam &inout C_PlayerInTeam)
    {
        this.UpdateSpotPresentationConfig();
        return;
    }
    void OnFriendDataUpdated(const FMsg_FriendDataUpdated &inout Message)
    {
        this.UpdateSpotPresentationConfig();
        return;
    }
    void RemoveSpotFromRegistry()
    {
        if (this.GetSpot())
        {
            this.GetSpotRegistry().opArrow().RemoveSpot(this.GetSpot());
        }
        return;
    }
    void UpdatePawnEntity(const FC_PlayerController &inout PlayerController)
    {
        int local_8 = 0;
        if (PlayerController)
        {
            this.SetPlayerPawnEntity(PlayerController.GetPlayerPawnEntity());
            if (!(!(this.GetSpot())) && this.GetPlayerPawnEntity())
            {
                TEUIModelRef<FM_Spot> local_4 = this.GetSpot();
                FTransform local_32 = FTransformUtils::GetTransform(this.GetPlayerPawnEntity(), this.GetContext().Time);
                local_8.SetPosition(local_32.GetLocation());
                local_8.SetEulerRotation(FVector3f(local_32.GetRotation().Euler()));
            }
            return;
        }
        this.SetPlayerPawnEntity(ENTITY_NULL);
        return;
    }
    void UpdateTeamEntity(const FC_PlayerInTeam &inout PlayerInTeam)
    {
        if (PlayerInTeam)
        {
            this.SetPlayerTeamEntity(PlayerInTeam.GetTeamEntity());
            return;
        }
        this.SetPlayerTeamEntity(ENTITY_NULL);
        return;
    }
    void UpdateSpotPresentationConfig()
    {
        const UPresentationSpotSettings local_10;
        if (!(this.GetSpot()))
        {
            return;
        }
        TEUIModelRef<FM_Player> local_6 = ::GetPlayer(this.GetSpot().opArrow());
        if (!(local_6))
        {
            return;
        }
        GetGameplaySettings<UPresentationSpotSettings> local_12;
        local_10 = local_12;
        ::SetPresentationConfig(this.GetSpot().opArrow(), local_10.PlayerPresentationConfig, TEUIModelRef<FM_SpotRegistry>());
        if (local_6.opArrow().IsLocalPlayer())
        {
            TEUIModelRef<FM_Spot> local_2 = this.GetSpot();
        }
        else
        {
            if (::FTeamUtils::IsInSameTeam(this.GetContext().GetLocalPlayer(), this.GetPlayerEntity()))
            {
                TEUIModelRef<FM_Spot> local_2_2 = this.GetSpot();
            }
            else
            {
                GetDefaulted local_26;
                if ((int(local_26.opCall().GetGameModeType())) != 0)
                {
                    TEUIModelRef<FM_Spot> local_2_3 = this.GetSpot();
                }
                else
                {
                    if (local_6.opArrow().IsFriendWithLocalPlayer())
                    {
                        TEUIModelRef<FM_Spot> local_2_4 = this.GetSpot();
                    }
                    else
                    {
                        TEUIModelRef<FM_Spot> local_2_5 = this.GetSpot();
                    }
                }
            }
        }
        return;
    }
    TEUIModelRef<FM_SpotRegistry> GetSpotRegistry() const property
    {
        this.TrackPropertyRead(0);
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
        this.MarkPropertyDirty(0);
        this.m_SpotRegistry = __Value;
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
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(2);
        return this.m_Spot;
    }
    void SetSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_Spot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Spot = __Value;
        return;
    }
    FECSEntity GetPlayerPawnEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FECSEntity GetModify_PlayerPawnEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetPlayerPawnEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PlayerPawnEntity = __Value;
        return;
    }
    const FECSEntity GetPlayerTeamEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FECSEntity GetModify_PlayerTeamEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetPlayerTeamEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PlayerTeamEntity = __Value;
        return;
    }
    bool GetbUpdatingTransformFromActor() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bUpdatingTransformFromActor;
    }
    void SetbUpdatingTransformFromActor(const bool __Value) property
    {
        if (!(this.m_bUpdatingTransformFromActor) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bUpdatingTransformFromActor = __Value;
        return;
    }
    bool GetbDEBUG_ForceUseTransformFromTeam() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bDEBUG_ForceUseTransformFromTeam;
    }
    void SetbDEBUG_ForceUseTransformFromTeam(const bool __Value) property
    {
        if (!(this.m_bDEBUG_ForceUseTransformFromTeam) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bDEBUG_ForceUseTransformFromTeam = __Value;
        return;
    }
}

struct FMS_PlayerSpotManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_SpotRegistry> m_SpotRegistry;
    UPROPERTY()
    TMap<uint, TEUIModelRef<FM_PlayerSpotUpdater>> m_PlayerUpdaters;

    FMS_PlayerSpotManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_PlayerSpotManager(const FMS_PlayerSpotManager &inout Other)
    {
        this.m_SpotRegistry = Other.m_SpotRegistry;
        this.m_PlayerUpdaters = Other.m_PlayerUpdaters;
        return;
    }
    FMS_PlayerSpotManager& opAssign(const FMS_PlayerSpotManager &inout Other)
    {
        this.m_SpotRegistry = Other.m_SpotRegistry;
        return Other.m_PlayerUpdaters;
    }
    void PostConstruct()
    {
        this.SetSpotRegistry(TEUIModelRef<FM_SpotRegistry>(::PresentationSpotUtils::GetDefaultRegistry(this.GetManager())));
        return;
    }
    void OnPlayerEntitiesChanged(const FCS_PlayerEntitySummary &inout C_PlayerEntitySummary)
    {
        int local_24 = 0;
        if (!(C_PlayerEntitySummary))
        {
            this.GetModify_PlayerUpdaters().Reset();
            return;
        }
        for (auto& local_20 : C_PlayerEntitySummary.GetPlayerEntities())
        {
            if (!(this.GetPlayerUpdaters().Contains(local_20.GetKey())))
            {
                TEUIModelRef<FM_SpotRegistry> local_22 = this.GetSpotRegistry();
                this.GetModify_PlayerUpdaters().Add(local_20.GetKey(), TEUIModelRef<FM_PlayerSpotUpdater>(local_24));
            }
        }
        TArray<uint> local_30;
        for (auto& local_48 : this.GetPlayerUpdaters())
        {
            if (!(C_PlayerEntitySummary.GetPlayerEntities().Contains(local_48.GetKey())))
            {
                local_30.Add(local_48.GetKey());
            }
        }
        for (auto local_63 : local_30)
        {
            TEUIModelRef<FM_PlayerSpotUpdater> local_66;
            if (this.GetModify_PlayerUpdaters().RemoveAndCopyValue(local_63, local_66))
            {
                local_66.opArrow().RemoveSpotFromRegistry();
            }
        }
        return;
    }
    void InvalidateEntityCache()
    {
        for (auto& local_20 : this.GetPlayerUpdaters())
        {
            local_20;
            opArrow().RemoveSpotFromRegistry();
        }
        this.GetModify_PlayerUpdaters().Empty(0);
        return;
    }
    TEUIModelRef<FM_SpotRegistry> GetSpotRegistry() const property
    {
        this.TrackPropertyRead(0);
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
        this.MarkPropertyDirty(0);
        this.m_SpotRegistry = __Value;
        return;
    }
    const TMap<uint, TEUIModelRef<FM_PlayerSpotUpdater>> GetPlayerUpdaters() const property
    {
        const TMap<uint, TEUIModelRef<FM_PlayerSpotUpdater>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<uint, TEUIModelRef<FM_PlayerSpotUpdater>> GetModify_PlayerUpdaters() property
    {
        TMap<uint, TEUIModelRef<FM_PlayerSpotUpdater>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetPlayerUpdaters(const TMap<uint, TEUIModelRef<FM_PlayerSpotUpdater>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PlayerUpdaters = __Value;
        return;
    }
}

namespace FM_PlayerSpotUpdater
{
FM_PlayerSpotUpdater& Create(const UObject ContextObject, const TEUIModelRef<FM_SpotRegistry> &inout SpotRegistry, const FECSEntity &inout PlayerEntity)
{
    return FM_PlayerSpotUpdater::CreateByManager(EUIInternal::GetContextManager(ContextObject), SpotRegistry, PlayerEntity);
}
FM_PlayerSpotUpdater CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_SpotRegistry> &inout SpotRegistry, const FECSEntity &inout PlayerEntity)
{
    FM_PlayerSpotUpdater __r;
    TEUIModelRef<FM_PlayerSpotUpdater> local_6 = TEUIModelRef<FM_PlayerSpotUpdater>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_PlayerSpotUpdater::ModelId, 0, SpotRegistry, PlayerEntity));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.TickFunction.FunctionName = "__UpdateTransformFromActor";
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnPlayerControllerChanged";
    local_14.ComponentType = FC_PlayerController;
    local_14.MonitorPropertyName = FName("PlayerEntity");
    int local_2_2 = FM_PlayerSpotUpdater::__IndexOf_PlayerEntity();
    Result.MonitorFunctions.Add(local_14);
    local_14.FunctionName = "__OnPlayerInTeamChanged";
    local_14.ComponentType = FC_PlayerInTeam;
    local_14.MonitorPropertyName = FName("PlayerEntity");
    int local_2_3 = FM_PlayerSpotUpdater::__IndexOf_PlayerEntity();
    Result.MonitorFunctions.Add(local_14);
    local_14.FunctionName = "__OnPlayerTransformChanged";
    local_14.ComponentType = FC_Transform;
    local_14.MonitorPropertyName = FName("PlayerPawnEntity");
    int local_2_4 = FM_PlayerSpotUpdater::__IndexOf_PlayerPawnEntity();
    Result.MonitorFunctions.Add(local_14);
    local_14.FunctionName = "__OnPlayerTeamInfoChanged";
    local_14.ComponentType = FC_TeamInfo;
    local_14.MonitorPropertyName = FName("PlayerTeamEntity");
    int local_2_5 = FM_PlayerSpotUpdater::__IndexOf_PlayerTeamEntity();
    Result.MonitorFunctions.Add(local_14);
    FEUIModelMsgHandleDefine local_32;
    local_32.FunctionName = "__OnLocalPlayerTeamMemberChanged";
    local_32.MessageTypeName = "Msg_CombatTeamMemberChanged";
    local_32.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_32);
    local_14.FunctionName = "__OnLocalPlayerTeamChanged";
    local_14.ComponentType = FC_PlayerInTeam;
    Result.MonitorFunctions.Add(local_14);
    local_32.FunctionName = "__OnFriendDataUpdated";
    local_32.MessageTypeName = "Msg_FriendDataUpdated";
    local_32.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_32);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_PlayerSpotUpdater;
}
void __UpdateTransformFromActor(FM_PlayerSpotUpdater &inout Model)
{
    Model.UpdateTransformFromActor();
    return;
}
void __OnPlayerControllerChanged(FM_PlayerSpotUpdater &inout Model, const FECSEntity &inout Entity, const FC_PlayerController &inout Component)
{
    Model.OnPlayerControllerChanged(Component);
    return;
}
void __OnPlayerInTeamChanged(FM_PlayerSpotUpdater &inout Model, const FECSEntity &inout Entity, const FC_PlayerInTeam &inout Component)
{
    Model.OnPlayerInTeamChanged(Component);
    return;
}
void __OnPlayerTransformChanged(FM_PlayerSpotUpdater &inout Model, const FECSEntity &inout Entity, const FC_Transform &inout Component)
{
    Model.OnPlayerTransformChanged(Component);
    return;
}
void __OnPlayerTeamInfoChanged(FM_PlayerSpotUpdater &inout Model, const FECSEntity &inout Entity, const FC_TeamInfo &inout Component)
{
    Model.OnPlayerTeamInfoChanged(Component);
    return;
}
void __OnLocalPlayerTeamMemberChanged(FM_PlayerSpotUpdater &inout Model, const FMsg_CombatTeamMemberChanged &inout Message)
{
    Model.OnLocalPlayerTeamMemberChanged(Message);
    return;
}
void __OnLocalPlayerTeamChanged(FM_PlayerSpotUpdater &inout Model, const FECSEntity &inout Entity, const FC_PlayerInTeam &inout Component)
{
    Model.OnLocalPlayerTeamChanged(Component);
    return;
}
void __OnFriendDataUpdated(FM_PlayerSpotUpdater &inout Model, const FMsg_FriendDataUpdated &inout Message)
{
    Model.OnFriendDataUpdated(Message);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_SpotRegistry()
{
    return 0;
}
int __IndexOf_PlayerEntity()
{
    return 1;
}
int __IndexOf_Spot()
{
    return 2;
}
int __IndexOf_PlayerPawnEntity()
{
    return 3;
}
int __IndexOf_PlayerTeamEntity()
{
    return 4;
}
int __IndexOf_bUpdatingTransformFromActor()
{
    return 5;
}
int __IndexOf_bDEBUG_ForceUseTransformFromTeam()
{
    return 6;
}
}
namespace FMS_PlayerSpotManager
{
FMS_PlayerSpotManager& Get(const UObject ContextObject)
{
    return FMS_PlayerSpotManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_PlayerSpotManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_PlayerSpotManager __r;
    TEUIModelRef<FMS_PlayerSpotManager> local_6 = TEUIModelRef<FMS_PlayerSpotManager>(EUIInternal::MakeModelWithManager(Manager, FMS_PlayerSpotManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnPlayerEntitiesChanged";
    local_14.ComponentType = FCS_PlayerEntitySummary;
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_PlayerSpotManager;
}
void __OnPlayerEntitiesChanged(FMS_PlayerSpotManager &inout Model, const FECSEntity &inout Entity, const FCS_PlayerEntitySummary &inout Component)
{
    Get local_4;
    Model.OnPlayerEntitiesChanged(local_4.opCall());
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_SpotRegistry()
{
    return 0;
}
int __IndexOf_PlayerUpdaters()
{
    return 1;
}
}
