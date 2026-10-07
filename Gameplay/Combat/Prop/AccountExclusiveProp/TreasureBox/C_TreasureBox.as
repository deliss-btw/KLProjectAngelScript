
namespace __INTENRAL_FC_TreasureBoxConfig_NS
{
    const TECSComponentDerivedPtr<FC_TreasureBoxConfig> DerivedPtr = TECSComponentDerivedPtr<FC_TreasureBoxConfig>();
    const FC_TreasureBoxConfig DefaultValue = FC_TreasureBoxConfig();
}
namespace __INTENRAL_FC_TreasureBoxRuntime_NS
{
    const TECSComponentDerivedPtr<FC_TreasureBoxRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_TreasureBoxRuntime>();
    const FC_TreasureBoxRuntime DefaultValue = FC_TreasureBoxRuntime();
}
namespace __INTENRAL_FCS_TreasureBoxes_NS
{
    const TECSComponentDerivedPtr<FCS_TreasureBoxes> DerivedPtr = TECSComponentDerivedPtr<FCS_TreasureBoxes>();
    const FCS_TreasureBoxes DefaultValue = FCS_TreasureBoxes();
}
namespace __INTENRAL_FCS_TreasureDropItemsByPlayer_NS
{
    const TECSComponentDerivedPtr<FCS_TreasureDropItemsByPlayer> DerivedPtr = TECSComponentDerivedPtr<FCS_TreasureDropItemsByPlayer>();
    const FCS_TreasureDropItemsByPlayer DefaultValue = FCS_TreasureDropItemsByPlayer();
}
namespace __INTENRAL_FCE_TreasureBoxRefreshTargetTime_NS
{
    const TECSEventDerivedPtr<FCE_TreasureBoxRefreshTargetTime> DerivedPtr = TECSEventDerivedPtr<FCE_TreasureBoxRefreshTargetTime>();
}
namespace __INTENRAL_FCE_TreasureBoxStateChanged_NS
{
    const TECSEventDerivedPtr<FCE_TreasureBoxStateChanged> DerivedPtr = TECSEventDerivedPtr<FCE_TreasureBoxStateChanged>();
}
namespace __INTENRAL_FCE_AccountExclusiveTreasureBoxCollected_DataTracker_NS
{
    const TECSEventDerivedPtr<FCE_AccountExclusiveTreasureBoxCollected_DataTracker> DerivedPtr = TECSEventDerivedPtr<FCE_AccountExclusiveTreasureBoxCollected_DataTracker>();

}
struct FC_TreasureBoxConfig : FECSComponent
{
    UPROPERTY()
    ETreasureBoxState DefaultState = ETreasureBoxState(2);
    UPROPERTY()
    TDataObjectPtr<FTreasureBoxStateConfig> StateConfig;


    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        int local_6 = 0;
        int local_16 = 0;
        if (!(local_6) || !(local_6.LevelObjectStatConfig.IsSet()))
        {
            return;
        }
        bool local_8 = ECS::GetRuntimeInfo().IsServer;
        if (local_8)
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            TDataObjectPtr<FLevelObjectStatConfig> local_40;
            local_16.GetModify_TreasureBoxes().Add(Entity, local_40);
            local_16.GetModify_TreasureBoxStateConfigs().Add(Entity, this.StateConfig);
            ::AttributeSampleUtils::AddAttributeSample(Entity, EAttributeSampleType(3), EAttributeSampleRequester(0), ENTITY_NULL);
            ::AttributeSampleUtils::AddAttributeSample(Entity, EAttributeSampleType(12), EAttributeSampleRequester(0), ENTITY_NULL);
        }
        return;
    }
}

struct FC_TreasureBoxRuntime : FECSComponent
{
    UPROPERTY()
    FFPTime RefreshTargetTime;

    FC_TreasureBoxRuntime()
    {
        FFPTime local_2 = FFPTime(-1);
        return;
    }
}

struct FCE_TreasureBoxRefreshTargetTime : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TreasureBoxEntity;
    UPROPERTY()
    FFPTime RefreshTargetTime;

    FCE_TreasureBoxRefreshTargetTime()
    {
        return;
    }
}

struct FCE_TreasureBoxStateChanged : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TreasureBoxEntity;
    UPROPERTY()
    ETreasureBoxState OldState;
    UPROPERTY()
    ETreasureBoxState NewState;


}

struct FCS_TreasureBoxes : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntity, TDataObjectPtr<FLevelObjectStatConfig>> m_TreasureBoxes;
    UPROPERTY()
    TMap<FECSEntity, TDataObjectPtr<FTreasureBoxStateConfig>> m_TreasureBoxStateConfigs;

    FCS_TreasureBoxes()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_TreasureBoxes(const FCS_TreasureBoxes &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_TreasureBoxes = Other.m_TreasureBoxes;
        this.m_TreasureBoxStateConfigs = Other.m_TreasureBoxStateConfigs;
        return;
    }
    FCS_TreasureBoxes opAssign(const FCS_TreasureBoxes &inout Other)
    {
        FCS_TreasureBoxes __r;
        this.SetTreasureBoxes(Other.GetTreasureBoxes());
        this.SetTreasureBoxStateConfigs(Other.GetTreasureBoxStateConfigs());
        return __r;
    }
    FECSEntity GetTreasureBox(const TDataObjectPtr<FLevelObjectStatConfig> &inout TreasureBoxConfig) const
    {
        if (!(TreasureBoxConfig))
        {
            return ENTITY_NULL;
        }
        for (auto& local_20 : this.GetTreasureBoxes())
        {
            TDataObjectPtr<FLevelObjectStatConfig> local_44;
            TDataObjectPtr<FLevelObjectStatConfig> local_68;
            local_44 = local_68;
            if ((local_44 == TreasureBoxConfig.opImplConv()))
            {
                return local_20.GetKey();
            }
        }
        return ENTITY_NULL;
    }
    const TMap<FECSEntity, TDataObjectPtr<FLevelObjectStatConfig>> GetTreasureBoxes() const property
    {
        const TMap<FECSEntity, TDataObjectPtr<FLevelObjectStatConfig>> __r;
        return __r;
    }
    TMap<FECSEntity, TDataObjectPtr<FLevelObjectStatConfig>> GetModify_TreasureBoxes() property
    {
        TMap<FECSEntity, TDataObjectPtr<FLevelObjectStatConfig>> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTreasureBoxes(const TMap<FECSEntity, TDataObjectPtr<FLevelObjectStatConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TreasureBoxes = __Value;
        return;
    }
    const TMap<FECSEntity, TDataObjectPtr<FTreasureBoxStateConfig>> GetTreasureBoxStateConfigs() const property
    {
        const TMap<FECSEntity, TDataObjectPtr<FTreasureBoxStateConfig>> __r;
        return __r;
    }
    TMap<FECSEntity, TDataObjectPtr<FTreasureBoxStateConfig>> GetModify_TreasureBoxStateConfigs() property
    {
        TMap<FECSEntity, TDataObjectPtr<FTreasureBoxStateConfig>> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetTreasureBoxStateConfigs(const TMap<FECSEntity, TDataObjectPtr<FTreasureBoxStateConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TreasureBoxStateConfigs = __Value;
        return;
    }
}

struct FTreasureDropItemRecord
{
    UPROPERTY()
    FECSEntity DropEntity;
    UPROPERTY()
    FECSEntity BoxEntity;

    FTreasureDropItemRecord()
    {
        return;
    }
}

struct FTreasureDropItemList
{
    UPROPERTY()
    TArray<FTreasureDropItemRecord> Records;

    FTreasureDropItemList()
    {
        return;
    }
}

struct FCS_TreasureDropItemsByPlayer : FECSSingleton
{
    UPROPERTY()
    TMap<int, FTreasureDropItemList> DropItemsByPlayerIndex;

    FCS_TreasureDropItemsByPlayer()
    {
        return;
    }
}

struct FCE_AccountExclusiveTreasureBoxCollected_DataTracker : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TreasureBoxEntity;
    UPROPERTY()
    FECSEntity InteractSourceEntity;
    UPROPERTY()
    TArray<FDropConfigItem> DropItems;
    UPROPERTY()
    uint DataId;


}

namespace ECSFunc_FC_TreasureBoxConfig
{
UFUNCTION()
bool HasTreasureBoxConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxConfig);
}
FC_TreasureBoxConfig& AssignTreasureBoxConfig(const FECSEntity &inout Entity, const FC_TreasureBoxConfig &inout DefaultValue = FC_TreasureBoxConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTreasureBoxConfig_BP(const FECSEntity &inout Entity, const FC_TreasureBoxConfig &inout DefaultValue = FC_TreasureBoxConfig())
{
    ECSFunc_FC_TreasureBoxConfig::AssignTreasureBoxConfig(Entity, DefaultValue);
    return;
}
FC_TreasureBoxConfig& ModifyTreasureBoxConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxConfig));
    return local_12.GetComp();
}
FC_TreasureBoxConfig& ModifyOrAddTreasureBoxConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxConfig));
    return local_12.GetComp();
}
const FC_TreasureBoxConfig& GetTreasureBoxConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_TreasureBoxConfig GetTreasureBoxConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TreasureBoxConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_TreasureBoxConfig::GetTreasureBoxConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TreasureBoxConfig GetDefaultedTreasureBoxConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TreasureBoxConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxConfig);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_TreasureBoxConfig GetDefaultedTreasureBoxConfig_BP(const FECSEntity &inout Entity)
{
    FC_TreasureBoxConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveTreasureBoxConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxConfig);
}
}
FECSMonitorRuntimeView __GetMonitorTreasureBoxConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TreasureBoxConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureBoxConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TreasureBoxConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureBoxConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TreasureBoxConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureBoxConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TreasureBoxConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureBoxConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TreasureBoxConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorTreasureBoxConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TreasureBoxConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTreasureBoxConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TreasureBoxConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTreasureBoxConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TreasureBoxConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TreasureBoxRuntime
{
UFUNCTION()
bool HasTreasureBoxRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxRuntime);
}
FC_TreasureBoxRuntime& AssignTreasureBoxRuntime(const FECSEntity &inout Entity, const FC_TreasureBoxRuntime &inout DefaultValue = FC_TreasureBoxRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTreasureBoxRuntime_BP(const FECSEntity &inout Entity, const FC_TreasureBoxRuntime &inout DefaultValue = FC_TreasureBoxRuntime())
{
    ECSFunc_FC_TreasureBoxRuntime::AssignTreasureBoxRuntime(Entity, DefaultValue);
    return;
}
FC_TreasureBoxRuntime& ModifyTreasureBoxRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxRuntime));
    return local_12.GetComp();
}
FC_TreasureBoxRuntime& ModifyOrAddTreasureBoxRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxRuntime));
    return local_12.GetComp();
}
const FC_TreasureBoxRuntime& GetTreasureBoxRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_TreasureBoxRuntime GetTreasureBoxRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TreasureBoxRuntime __r;
    bValid = false;
    bValid = ECSFunc_FC_TreasureBoxRuntime::GetTreasureBoxRuntime(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TreasureBoxRuntime GetDefaultedTreasureBoxRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TreasureBoxRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxRuntime);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_TreasureBoxRuntime GetDefaultedTreasureBoxRuntime_BP(const FECSEntity &inout Entity)
{
    FC_TreasureBoxRuntime __r;
    return __r;
}
UFUNCTION()
bool RemoveTreasureBoxRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorTreasureBoxRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TreasureBoxRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureBoxRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TreasureBoxRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureBoxRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TreasureBoxRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureBoxRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TreasureBoxRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureBoxRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TreasureBoxRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorTreasureBoxRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TreasureBoxRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTreasureBoxRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TreasureBoxRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTreasureBoxRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TreasureBoxRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_TreasureBoxes
{
UFUNCTION()
bool HasTreasureBoxes(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TreasureBoxes);
}
FCS_TreasureBoxes& AssignTreasureBoxes(const FECSWorldPtr &inout World, const FCS_TreasureBoxes &inout DefaultValue = FCS_TreasureBoxes())
{
    UScriptStruct local_6 = FCS_TreasureBoxes;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTreasureBoxes_BP(const FECSWorldPtr &inout World, const FCS_TreasureBoxes &inout DefaultValue = FCS_TreasureBoxes())
{
    ECSFunc_FCS_TreasureBoxes::AssignTreasureBoxes(World, DefaultValue);
    return;
}
FCS_TreasureBoxes& ModifyTreasureBoxes(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TreasureBoxes;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TreasureBoxes& ModifyOrAddTreasureBoxes(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TreasureBoxes;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TreasureBoxes& GetTreasureBoxes(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TreasureBoxes;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TreasureBoxes GetTreasureBoxes_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_TreasureBoxes& local_4 = ECSFunc_FCS_TreasureBoxes::GetTreasureBoxes(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_TreasureBoxes();
}
const FCS_TreasureBoxes GetDefaultedTreasureBoxes(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TreasureBoxes __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TreasureBoxes);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_TreasureBoxes GetDefaultedTreasureBoxes_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_TreasureBoxes::GetDefaultedTreasureBoxes(World);
}
UFUNCTION()
bool RemoveTreasureBoxes(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TreasureBoxes);
}
}
void __MonitorTreasureBoxesLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TreasureBoxes, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTreasureBoxesActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TreasureBoxes, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTreasureBoxesModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TreasureBoxes, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_TreasureDropItemsByPlayer
{
UFUNCTION()
bool HasTreasureDropItemsByPlayer(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TreasureDropItemsByPlayer);
}
FCS_TreasureDropItemsByPlayer& AssignTreasureDropItemsByPlayer(const FECSWorldPtr &inout World, const FCS_TreasureDropItemsByPlayer &inout DefaultValue = FCS_TreasureDropItemsByPlayer())
{
    UScriptStruct local_6 = FCS_TreasureDropItemsByPlayer;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTreasureDropItemsByPlayer_BP(const FECSWorldPtr &inout World, const FCS_TreasureDropItemsByPlayer &inout DefaultValue = FCS_TreasureDropItemsByPlayer())
{
    ECSFunc_FCS_TreasureDropItemsByPlayer::AssignTreasureDropItemsByPlayer(World, DefaultValue);
    return;
}
FCS_TreasureDropItemsByPlayer& ModifyTreasureDropItemsByPlayer(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TreasureDropItemsByPlayer;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TreasureDropItemsByPlayer& ModifyOrAddTreasureDropItemsByPlayer(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TreasureDropItemsByPlayer;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TreasureDropItemsByPlayer& GetTreasureDropItemsByPlayer(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TreasureDropItemsByPlayer;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TreasureDropItemsByPlayer GetTreasureDropItemsByPlayer_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_TreasureDropItemsByPlayer __r;
    bValid = false;
    bValid = ECSFunc_FCS_TreasureDropItemsByPlayer::GetTreasureDropItemsByPlayer(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_TreasureDropItemsByPlayer GetDefaultedTreasureDropItemsByPlayer(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TreasureDropItemsByPlayer __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TreasureDropItemsByPlayer);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_TreasureDropItemsByPlayer GetDefaultedTreasureDropItemsByPlayer_BP(const FECSWorldPtr &inout World)
{
    FCS_TreasureDropItemsByPlayer __r;
    return __r;
}
UFUNCTION()
bool RemoveTreasureDropItemsByPlayer(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TreasureDropItemsByPlayer);
}
}
void __MonitorTreasureDropItemsByPlayerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TreasureDropItemsByPlayer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTreasureDropItemsByPlayerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TreasureDropItemsByPlayer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTreasureDropItemsByPlayerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TreasureDropItemsByPlayer, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_TreasureBoxes &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_TreasureBoxes &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_TreasureBoxes &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_TreasureBoxes
{
int __IndexOf_TreasureBoxes()
{
    return 0;
}
int __IndexOf_TreasureBoxStateConfigs()
{
    return 1;
}
}
