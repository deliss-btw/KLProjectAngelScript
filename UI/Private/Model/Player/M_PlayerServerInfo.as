
namespace FM_PlayerDSInfo
{
    const int ModelId = 0;

}
struct FM_PlayerDSInfo : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TEUIModelWeakRef<FM_Player> m_OwnerPlayer;
    UPROPERTY()
    FECSEntity m_PlayerEntity;
    UPROPERTY()
    FECSEntity m_PlayerPawnEntity;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_CachedAvatarConfig;

    FM_PlayerDSInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_PlayerDSInfo' by default constructor.");
        return;
    }
    FM_PlayerDSInfo(const FM_PlayerDSInfo &inout Other)
    {
        this.m_OwnerPlayer = Other.m_OwnerPlayer;
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        this.m_CachedAvatarConfig = Other.m_CachedAvatarConfig;
        return;
    }
    FM_PlayerDSInfo(const FECSEntity &inout InPlayerEntity)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetPlayerEntity(InPlayerEntity);
        return;
    }
    FM_PlayerDSInfo& opAssign(const FM_PlayerDSInfo &inout Other)
    {
        this.m_OwnerPlayer = Other.m_OwnerPlayer;
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        return Other.m_CachedAvatarConfig;
    }
    void SyncRealtimeToOwner()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void PostConstruct()
    {
        this.SetPlayerPawnEntity(::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetPlayerEntity()));
        this.SetCachedAvatarConfig(::GetAvatarConfig(this.GetPlayerPawnEntity()));
        this.SyncRealtimeToOwner();
        return;
    }
    void OnOwnerPlayerChanged()
    {
        this.SyncRealtimeToOwner();
        return;
    }
    void OnPlayerControllerChanged(const FC_PlayerController &inout PlayerController)
    {
        if (PlayerController)
        {
            if (PlayerController.GetAllPlayerPawnEntities().Contains(PlayerController.GetPlayerPawnEntity()))
            {
                this.SetPlayerPawnEntity(PlayerController.GetPlayerPawnEntity());
                this.SetCachedAvatarConfig(::GetAvatarConfig(this.GetPlayerPawnEntity()));
            }
        }
        else
        {
            this.SetPlayerPawnEntity(ENTITY_NULL);
        }
        this.SyncRealtimeToOwner();
        return;
    }
    void OnDSPlayerInfoChanged(const FC_DSPlayerInfo &inout DSPlayerInfo)
    {
        this.SyncRealtimeToOwner();
        return;
    }
    void OnPlayerInGameStateChanged(const FC_PlayerInGameState &inout PlayerInGameState)
    {
        this.SyncRealtimeToOwner();
        return;
    }
    void OnPlayerPawnEntityChanged(const FC_PrefabConfigOverride &inout PrefabConfigOverride)
    {
        if ((int(::GetPrefabType(this.GetPlayerPawnEntity()))) == 1)
        {
            this.SetCachedAvatarConfig(::GetAvatarConfig(this.GetPlayerPawnEntity()));
            this.SyncRealtimeToOwner();
        }
        return;
    }
    void OnPlayerPawnPrefabConfigChanged(const FC_PrefabConfig &inout PrefabConfig)
    {
        if ((int(::GetPrefabType(this.GetPlayerPawnEntity()))) == 1)
        {
            this.SetCachedAvatarConfig(::GetAvatarConfig(this.GetPlayerPawnEntity()));
            this.SyncRealtimeToOwner();
        }
        return;
    }
    void OnDivineSkillChanged(const FC_DivineSkill &inout DivineSkill)
    {
        this.SyncRealtimeToOwner();
        return;
    }
    void OnPlayerOwnerChanged()
    {
        this.SyncRealtimeToOwner();
        return;
    }
    TEUIModelWeakRef<FM_Player> GetOwnerPlayer() const property
    {
        this.TrackPropertyRead(0);
        return this.m_OwnerPlayer;
    }
    void SetOwnerPlayer(const TEUIModelWeakRef<FM_Player> &inout __Value) property
    {
        TEUIModelWeakRef<FM_Player> local_2;
        local_2 = this.m_OwnerPlayer;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_OwnerPlayer = __Value;
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
    FECSEntity GetPlayerPawnEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FECSEntity GetModify_PlayerPawnEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPlayerPawnEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PlayerPawnEntity = __Value;
        return;
    }
    const TDataObjectPtr<FAvatarPrefabConfig> GetCachedAvatarConfig() const property
    {
        const TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_CachedAvatarConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCachedAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CachedAvatarConfig = __Value;
        return;
    }
}

namespace FM_PlayerDSInfo
{
FM_PlayerDSInfo& Create(const UObject ContextObject, const FECSEntity &inout PlayerEntity)
{
    return FM_PlayerDSInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), PlayerEntity);
}
FM_PlayerDSInfo CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout PlayerEntity)
{
    FM_PlayerDSInfo __r;
    TEUIModelRef<FM_PlayerDSInfo> local_6 = TEUIModelRef<FM_PlayerDSInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_PlayerDSInfo::ModelId, 0, PlayerEntity));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    FEUIModelDirtyDefine local_12;
    local_12.FunctionName = "__OnOwnerPlayerChanged";
    local_12.DirtyFlags.Set(FM_PlayerDSInfo::__IndexOf_OwnerPlayer());
    Result.DirtyFunctions.Add(local_12);
    FEUIModelMonitorDefine local_22;
    local_22.FunctionName = "__OnPlayerControllerChanged";
    local_22.ComponentType = FC_PlayerController;
    local_22.MonitorPropertyName = FName("PlayerEntity");
    int local_2_2 = FM_PlayerDSInfo::__IndexOf_PlayerEntity();
    Result.MonitorFunctions.Add(local_22);
    local_22.FunctionName = "__OnDSPlayerInfoChanged";
    local_22.ComponentType = FC_DSPlayerInfo;
    local_22.MonitorPropertyName = FName("PlayerEntity");
    int local_2_3 = FM_PlayerDSInfo::__IndexOf_PlayerEntity();
    Result.MonitorFunctions.Add(local_22);
    local_22.FunctionName = "__OnPlayerInGameStateChanged";
    local_22.ComponentType = FC_PlayerInGameState;
    local_22.MonitorPropertyName = FName("PlayerEntity");
    int local_2_4 = FM_PlayerDSInfo::__IndexOf_PlayerEntity();
    Result.MonitorFunctions.Add(local_22);
    local_22.FunctionName = "__OnPlayerPawnEntityChanged";
    local_22.ComponentType = FC_PrefabConfigOverride;
    local_22.MonitorPropertyName = FName("PlayerPawnEntity");
    int local_2_5 = FM_PlayerDSInfo::__IndexOf_PlayerPawnEntity();
    Result.MonitorFunctions.Add(local_22);
    local_22.FunctionName = "__OnPlayerPawnPrefabConfigChanged";
    local_22.ComponentType = FC_PrefabConfig;
    local_22.MonitorPropertyName = FName("PlayerPawnEntity");
    int local_2_6 = FM_PlayerDSInfo::__IndexOf_PlayerPawnEntity();
    Result.MonitorFunctions.Add(local_22);
    local_22.FunctionName = "__OnDivineSkillChanged";
    local_22.ComponentType = FC_DivineSkill;
    local_22.MonitorPropertyName = FName("PlayerEntity");
    int local_2_7 = FM_PlayerDSInfo::__IndexOf_PlayerEntity();
    Result.MonitorFunctions.Add(local_22);
    local_12.FunctionName = "__OnPlayerOwnerChanged";
    local_12.DirtyFlags.Set(FM_PlayerDSInfo::__IndexOf_OwnerPlayer());
    Result.DirtyFunctions.Add(local_12);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_PlayerDSInfo;
}
void __OnOwnerPlayerChanged(FM_PlayerDSInfo &inout Model)
{
    Model.OnOwnerPlayerChanged();
    return;
}
void __OnPlayerControllerChanged(FM_PlayerDSInfo &inout Model, const FECSEntity &inout Entity, const FC_PlayerController &inout Component)
{
    Model.OnPlayerControllerChanged(Component);
    return;
}
void __OnDSPlayerInfoChanged(FM_PlayerDSInfo &inout Model, const FECSEntity &inout Entity, const FC_DSPlayerInfo &inout Component)
{
    Model.OnDSPlayerInfoChanged(Component);
    return;
}
void __OnPlayerInGameStateChanged(FM_PlayerDSInfo &inout Model, const FECSEntity &inout Entity, const FC_PlayerInGameState &inout Component)
{
    Model.OnPlayerInGameStateChanged(Component);
    return;
}
void __OnPlayerPawnEntityChanged(FM_PlayerDSInfo &inout Model, const FECSEntity &inout Entity, const FC_PrefabConfigOverride &inout Component)
{
    Model.OnPlayerPawnEntityChanged(Component);
    return;
}
void __OnPlayerPawnPrefabConfigChanged(FM_PlayerDSInfo &inout Model, const FECSEntity &inout Entity, const FC_PrefabConfig &inout Component)
{
    Model.OnPlayerPawnPrefabConfigChanged(Component);
    return;
}
void __OnDivineSkillChanged(FM_PlayerDSInfo &inout Model, const FECSEntity &inout Entity, const FC_DivineSkill &inout Component)
{
    Model.OnDivineSkillChanged(Component);
    return;
}
void __OnPlayerOwnerChanged(FM_PlayerDSInfo &inout Model)
{
    Model.OnPlayerOwnerChanged();
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_OwnerPlayer()
{
    return 0;
}
int __IndexOf_PlayerEntity()
{
    return 1;
}
int __IndexOf_PlayerPawnEntity()
{
    return 2;
}
int __IndexOf_CachedAvatarConfig()
{
    return 3;
}
}
