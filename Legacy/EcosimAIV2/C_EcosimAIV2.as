
enum EEcosimAIV2EntityRelation
{
    None,
    Ride,
    Chain,
    RideAsPassenger,
    TeamLeader,
    HitDamage,
}

enum EEcosimAIV2RelationType
{
    all_relation,
    actual_relation,
    plan_relation,
}

enum EEcosimAIV2EntityMark
{
    Human,
    Mount,
    Coach,
}

enum EEcosimAIV2ActionEventType
{
    ReachTeamTarget,
}

namespace __INTENRAL_FC_EcosimAIV2CreatureConfig_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2CreatureConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2CreatureConfig>();
    const FC_EcosimAIV2CreatureConfig DefaultValue = FC_EcosimAIV2CreatureConfig();
}
namespace __INTENRAL_FCS_EcosimAIV2GlobalData_NS
{
    const TECSComponentDerivedPtr<FCS_EcosimAIV2GlobalData> DerivedPtr = TECSComponentDerivedPtr<FCS_EcosimAIV2GlobalData>();
    const FCS_EcosimAIV2GlobalData DefaultValue = FCS_EcosimAIV2GlobalData();
}
namespace __INTENRAL_FC_EcosimAIV2EntityInfo_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2EntityInfo> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2EntityInfo>();
    const FC_EcosimAIV2EntityInfo DefaultValue = FC_EcosimAIV2EntityInfo();
}
namespace __INTENRAL_FC_EcosimAIV2RelationRider_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2RelationRider> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2RelationRider>();
    const FC_EcosimAIV2RelationRider DefaultValue = FC_EcosimAIV2RelationRider();
}
namespace __INTENRAL_FC_EcosimAIV2RelationMount_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2RelationMount> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2RelationMount>();
    const FC_EcosimAIV2RelationMount DefaultValue = FC_EcosimAIV2RelationMount();
}
namespace __INTENRAL_FC_EcosimAIV2GOAP_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2GOAP> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2GOAP>();
    const FC_EcosimAIV2GOAP DefaultValue = FC_EcosimAIV2GOAP();
}
namespace __INTENRAL_FC_EcosimAIV2EntityMark_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2EntityMark> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2EntityMark>();
    const FC_EcosimAIV2EntityMark DefaultValue = FC_EcosimAIV2EntityMark();
}
namespace __INTENRAL_FC_EcosimAIV2TimeCount_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2TimeCount> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2TimeCount>();
    const FC_EcosimAIV2TimeCount DefaultValue = FC_EcosimAIV2TimeCount();
}
namespace __INTENRAL_FC_EcosimAIV2LevelControl_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2LevelControl> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2LevelControl>();
    const FC_EcosimAIV2LevelControl DefaultValue = FC_EcosimAIV2LevelControl();
}
namespace __INTENRAL_FCE_EcosimAIV2ActionEvent_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2ActionEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2ActionEvent>();
}
namespace __INTENRAL_FCE_PlayerEnterCombatArea_NS
{
    const TECSEventDerivedPtr<FCE_PlayerEnterCombatArea> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerEnterCombatArea>();
}
namespace __INTENRAL_FCE_PlayerExitCombatArea_NS
{
    const TECSEventDerivedPtr<FCE_PlayerExitCombatArea> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerExitCombatArea>();

}
struct FC_EcosimAIV2CreatureConfig : FECSComponent
{
    UPROPERTY()
    FDataObjectPtr CreatureInfo;

    FC_EcosimAIV2CreatureConfig()
    {
        return;
    }
}

class UEcosimAIV2CreaturePrefabDataAsset : UDataAsset
{
    UPROPERTY()
    TArray<TSubclassOf<ACharacterPrefab>> CreaturePrefabList;

    UEcosimAIV2CreaturePrefabDataAsset()
    {
        return;
    }
}

struct FCS_EcosimAIV2GlobalData : FECSSingleton
{
    UPROPERTY()
    TArray<FECSEntity> CreatureEntityList;
    UPROPERTY()
    UDataTable EcosimAIV2UnitDataTable = nullptr;

    FCS_EcosimAIV2GlobalData()
    {
        return;
    }
}

struct FC_EcosimAIV2EntityInfo : FECSComponent
{
    UPROPERTY()
    FVector MoveToTargetLocation;
    UPROPERTY()
    bool bNeedMoveToTargetLocation = false;


}

struct FC_EcosimAIV2RelationRider : FECSComponent
{
    UPROPERTY()
    FECSEntity MountEnitty;

    FC_EcosimAIV2RelationRider()
    {
        return;
    }
}

struct FC_EcosimAIV2RelationMount : FECSComponent
{
    UPROPERTY()
    FECSEntity RiderEnitty;

    FC_EcosimAIV2RelationMount()
    {
        return;
    }
}

struct FC_EcosimAIV2GOAP : FECSComponent
{
    UPROPERTY()
    UECSGOAPEcosimAIV2InstanceBase Instance;

    FC_EcosimAIV2GOAP()
    {
        return;
    }
}

struct FC_EcosimAIV2EntityMark : FECSComponent
{
    UPROPERTY()
    TSet<EEcosimAIV2EntityMark> MarkSet;

    FC_EcosimAIV2EntityMark()
    {
        return;
    }
}

struct FC_EcosimAIV2TimeCount : FECSComponent
{
    UPROPERTY()
    TMap<FGameplayTag, float32> TimeCountByTagMap;

    FC_EcosimAIV2TimeCount()
    {
        return;
    }
}

struct FC_EcosimAIV2LevelControl : FECSComponent
{
    UPROPERTY()
    FName MoveToKeyName;
    UPROPERTY()
    bool bMoveToSpecifiedLocation;
    UPROPERTY()
    FVector MoveToSpecifiedLocation;
    UPROPERTY()
    bool bMoveToSpecifiedDirection;
    UPROPERTY()
    FVector MoveToSpecifiedDirection;


}

struct FEcosimAIV2LLMCallbackContext
{
    UPROPERTY()
    FString Query;
    UPROPERTY()
    FNPCInfoMapWrapper NPCInfoMap;

    FEcosimAIV2LLMCallbackContext()
    {
        return;
    }
}

struct FEcosimAIV2CreateEntityBatch
{
    UPROPERTY()
    TArray<TDataObjectPtr<FMonsterMainConfig>> MonsterConfigList;
    UPROPERTY()
    int MonsterNum;
    UPROPERTY()
    TArray<TDataObjectPtr<FNPCMainConfig>> NPCConfigList;
    UPROPERTY()
    int NPCNum;
    UPROPERTY()
    FName SpawnInitEntryName = NAME_None;


}

struct FCE_EcosimAIV2ActionEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    EEcosimAIV2ActionEventType ActionEventType;


}

struct FCE_PlayerEnterCombatArea : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity CombatAreaEntity;

    FCE_PlayerEnterCombatArea()
    {
        return;
    }
}

struct FCE_PlayerExitCombatArea : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity CombatAreaEntity;

    FCE_PlayerExitCombatArea()
    {
        return;
    }
}

namespace ECSFunc_FC_EcosimAIV2CreatureConfig
{
UFUNCTION()
bool HasEcosimAIV2CreatureConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2CreatureConfig);
}
FC_EcosimAIV2CreatureConfig& AssignEcosimAIV2CreatureConfig(const FECSEntity &inout Entity, const FC_EcosimAIV2CreatureConfig &inout DefaultValue = FC_EcosimAIV2CreatureConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2CreatureConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2CreatureConfig_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2CreatureConfig &inout DefaultValue = FC_EcosimAIV2CreatureConfig())
{
    ECSFunc_FC_EcosimAIV2CreatureConfig::AssignEcosimAIV2CreatureConfig(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2CreatureConfig& ModifyEcosimAIV2CreatureConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2CreatureConfig));
    return local_12.GetComp();
}
FC_EcosimAIV2CreatureConfig& ModifyOrAddEcosimAIV2CreatureConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2CreatureConfig));
    return local_12.GetComp();
}
const FC_EcosimAIV2CreatureConfig& GetEcosimAIV2CreatureConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2CreatureConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2CreatureConfig GetEcosimAIV2CreatureConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2CreatureConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2CreatureConfig::GetEcosimAIV2CreatureConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2CreatureConfig GetDefaultedEcosimAIV2CreatureConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2CreatureConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2CreatureConfig);
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
FC_EcosimAIV2CreatureConfig GetDefaultedEcosimAIV2CreatureConfig_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2CreatureConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2CreatureConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2CreatureConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2CreatureConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2CreatureConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2CreatureConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2CreatureConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2CreatureConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2CreatureConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2CreatureConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2CreatureConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2CreatureConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2CreatureConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2CreatureConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2CreatureConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2CreatureConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2CreatureConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2CreatureConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2CreatureConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_EcosimAIV2GlobalData
{
UFUNCTION()
bool HasEcosimAIV2GlobalData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EcosimAIV2GlobalData);
}
FCS_EcosimAIV2GlobalData& AssignEcosimAIV2GlobalData(const FECSWorldPtr &inout World, const FCS_EcosimAIV2GlobalData &inout DefaultValue = FCS_EcosimAIV2GlobalData())
{
    UScriptStruct local_6 = FCS_EcosimAIV2GlobalData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2GlobalData_BP(const FECSWorldPtr &inout World, const FCS_EcosimAIV2GlobalData &inout DefaultValue = FCS_EcosimAIV2GlobalData())
{
    ECSFunc_FCS_EcosimAIV2GlobalData::AssignEcosimAIV2GlobalData(World, DefaultValue);
    return;
}
FCS_EcosimAIV2GlobalData& ModifyEcosimAIV2GlobalData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2GlobalData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EcosimAIV2GlobalData& ModifyOrAddEcosimAIV2GlobalData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2GlobalData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EcosimAIV2GlobalData& GetEcosimAIV2GlobalData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2GlobalData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EcosimAIV2GlobalData GetEcosimAIV2GlobalData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EcosimAIV2GlobalData __r;
    bValid = false;
    bValid = ECSFunc_FCS_EcosimAIV2GlobalData::GetEcosimAIV2GlobalData(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EcosimAIV2GlobalData GetDefaultedEcosimAIV2GlobalData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EcosimAIV2GlobalData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EcosimAIV2GlobalData);
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
FCS_EcosimAIV2GlobalData GetDefaultedEcosimAIV2GlobalData_BP(const FECSWorldPtr &inout World)
{
    FCS_EcosimAIV2GlobalData __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2GlobalData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EcosimAIV2GlobalData);
}
}
void __MonitorEcosimAIV2GlobalDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EcosimAIV2GlobalData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2GlobalDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EcosimAIV2GlobalData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2GlobalDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EcosimAIV2GlobalData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2EntityInfo
{
UFUNCTION()
bool HasEcosimAIV2EntityInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityInfo);
}
FC_EcosimAIV2EntityInfo& AssignEcosimAIV2EntityInfo(const FECSEntity &inout Entity, const FC_EcosimAIV2EntityInfo &inout DefaultValue = FC_EcosimAIV2EntityInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2EntityInfo_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2EntityInfo &inout DefaultValue = FC_EcosimAIV2EntityInfo())
{
    ECSFunc_FC_EcosimAIV2EntityInfo::AssignEcosimAIV2EntityInfo(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2EntityInfo& ModifyEcosimAIV2EntityInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityInfo));
    return local_12.GetComp();
}
FC_EcosimAIV2EntityInfo& ModifyOrAddEcosimAIV2EntityInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityInfo));
    return local_12.GetComp();
}
const FC_EcosimAIV2EntityInfo& GetEcosimAIV2EntityInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2EntityInfo GetEcosimAIV2EntityInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcosimAIV2EntityInfo& local_4 = ECSFunc_FC_EcosimAIV2EntityInfo::GetEcosimAIV2EntityInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcosimAIV2EntityInfo();
}
const FC_EcosimAIV2EntityInfo GetDefaultedEcosimAIV2EntityInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2EntityInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityInfo);
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
FC_EcosimAIV2EntityInfo GetDefaultedEcosimAIV2EntityInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcosimAIV2EntityInfo::GetDefaultedEcosimAIV2EntityInfo(Entity);
}
UFUNCTION()
bool RemoveEcosimAIV2EntityInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityInfo);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2EntityInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2EntityInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2EntityInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2EntityInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2EntityInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2EntityInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2EntityInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2EntityInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2EntityInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2EntityInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2EntityInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2RelationRider
{
UFUNCTION()
bool HasEcosimAIV2RelationRider(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2RelationRider);
}
FC_EcosimAIV2RelationRider& AssignEcosimAIV2RelationRider(const FECSEntity &inout Entity, const FC_EcosimAIV2RelationRider &inout DefaultValue = FC_EcosimAIV2RelationRider())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2RelationRider, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2RelationRider_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2RelationRider &inout DefaultValue = FC_EcosimAIV2RelationRider())
{
    ECSFunc_FC_EcosimAIV2RelationRider::AssignEcosimAIV2RelationRider(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2RelationRider& ModifyEcosimAIV2RelationRider(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2RelationRider));
    return local_12.GetComp();
}
FC_EcosimAIV2RelationRider& ModifyOrAddEcosimAIV2RelationRider(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2RelationRider));
    return local_12.GetComp();
}
const FC_EcosimAIV2RelationRider& GetEcosimAIV2RelationRider(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2RelationRider));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2RelationRider GetEcosimAIV2RelationRider_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2RelationRider __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2RelationRider::GetEcosimAIV2RelationRider(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2RelationRider GetDefaultedEcosimAIV2RelationRider(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2RelationRider __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2RelationRider);
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
FC_EcosimAIV2RelationRider GetDefaultedEcosimAIV2RelationRider_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2RelationRider __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2RelationRider(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2RelationRider);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2RelationRiderOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2RelationRider, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2RelationRiderOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2RelationRider, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2RelationRiderOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2RelationRider, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2RelationRiderOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2RelationRider, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2RelationRiderOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2RelationRider, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2RelationRiderLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2RelationRider, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2RelationRiderActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2RelationRider, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2RelationRiderModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2RelationRider, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2RelationMount
{
UFUNCTION()
bool HasEcosimAIV2RelationMount(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2RelationMount);
}
FC_EcosimAIV2RelationMount& AssignEcosimAIV2RelationMount(const FECSEntity &inout Entity, const FC_EcosimAIV2RelationMount &inout DefaultValue = FC_EcosimAIV2RelationMount())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2RelationMount, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2RelationMount_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2RelationMount &inout DefaultValue = FC_EcosimAIV2RelationMount())
{
    ECSFunc_FC_EcosimAIV2RelationMount::AssignEcosimAIV2RelationMount(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2RelationMount& ModifyEcosimAIV2RelationMount(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2RelationMount));
    return local_12.GetComp();
}
FC_EcosimAIV2RelationMount& ModifyOrAddEcosimAIV2RelationMount(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2RelationMount));
    return local_12.GetComp();
}
const FC_EcosimAIV2RelationMount& GetEcosimAIV2RelationMount(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2RelationMount));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2RelationMount GetEcosimAIV2RelationMount_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2RelationMount __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2RelationMount::GetEcosimAIV2RelationMount(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2RelationMount GetDefaultedEcosimAIV2RelationMount(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2RelationMount __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2RelationMount);
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
FC_EcosimAIV2RelationMount GetDefaultedEcosimAIV2RelationMount_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2RelationMount __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2RelationMount(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2RelationMount);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2RelationMountOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2RelationMount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2RelationMountOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2RelationMount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2RelationMountOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2RelationMount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2RelationMountOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2RelationMount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2RelationMountOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2RelationMount, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2RelationMountLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2RelationMount, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2RelationMountActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2RelationMount, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2RelationMountModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2RelationMount, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2GOAP
{
UFUNCTION()
bool HasEcosimAIV2GOAP(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2GOAP);
}
FC_EcosimAIV2GOAP& AssignEcosimAIV2GOAP(const FECSEntity &inout Entity, const FC_EcosimAIV2GOAP &inout DefaultValue = FC_EcosimAIV2GOAP())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2GOAP, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2GOAP_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2GOAP &inout DefaultValue = FC_EcosimAIV2GOAP())
{
    ECSFunc_FC_EcosimAIV2GOAP::AssignEcosimAIV2GOAP(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2GOAP& ModifyEcosimAIV2GOAP(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2GOAP));
    return local_12.GetComp();
}
FC_EcosimAIV2GOAP& ModifyOrAddEcosimAIV2GOAP(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2GOAP));
    return local_12.GetComp();
}
const FC_EcosimAIV2GOAP& GetEcosimAIV2GOAP(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2GOAP));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2GOAP GetEcosimAIV2GOAP_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcosimAIV2GOAP& local_4 = ECSFunc_FC_EcosimAIV2GOAP::GetEcosimAIV2GOAP(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcosimAIV2GOAP();
}
const FC_EcosimAIV2GOAP GetDefaultedEcosimAIV2GOAP(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2GOAP __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2GOAP);
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
FC_EcosimAIV2GOAP GetDefaultedEcosimAIV2GOAP_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcosimAIV2GOAP::GetDefaultedEcosimAIV2GOAP(Entity);
}
UFUNCTION()
bool RemoveEcosimAIV2GOAP(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2GOAP);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2GOAPOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2GOAP, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2GOAPOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2GOAP, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2GOAPOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2GOAP, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2GOAPOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2GOAP, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2GOAPOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2GOAP, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2GOAPLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2GOAP, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2GOAPActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2GOAP, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2GOAPModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2GOAP, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2EntityMark
{
UFUNCTION()
bool HasEcosimAIV2EntityMark(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityMark);
}
FC_EcosimAIV2EntityMark& AssignEcosimAIV2EntityMark(const FECSEntity &inout Entity, const FC_EcosimAIV2EntityMark &inout DefaultValue = FC_EcosimAIV2EntityMark())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityMark, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2EntityMark_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2EntityMark &inout DefaultValue = FC_EcosimAIV2EntityMark())
{
    ECSFunc_FC_EcosimAIV2EntityMark::AssignEcosimAIV2EntityMark(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2EntityMark& ModifyEcosimAIV2EntityMark(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityMark));
    return local_12.GetComp();
}
FC_EcosimAIV2EntityMark& ModifyOrAddEcosimAIV2EntityMark(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityMark));
    return local_12.GetComp();
}
const FC_EcosimAIV2EntityMark& GetEcosimAIV2EntityMark(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityMark));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2EntityMark GetEcosimAIV2EntityMark_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2EntityMark __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2EntityMark::GetEcosimAIV2EntityMark(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2EntityMark GetDefaultedEcosimAIV2EntityMark(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2EntityMark __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityMark);
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
FC_EcosimAIV2EntityMark GetDefaultedEcosimAIV2EntityMark_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2EntityMark __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2EntityMark(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityMark);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityMarkOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2EntityMark, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityMarkOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2EntityMark, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityMarkOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2EntityMark, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityMarkOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2EntityMark, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityMarkOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2EntityMark, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2EntityMarkLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2EntityMark, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2EntityMarkActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2EntityMark, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2EntityMarkModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2EntityMark, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2TimeCount
{
UFUNCTION()
bool HasEcosimAIV2TimeCount(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TimeCount);
}
FC_EcosimAIV2TimeCount& AssignEcosimAIV2TimeCount(const FECSEntity &inout Entity, const FC_EcosimAIV2TimeCount &inout DefaultValue = FC_EcosimAIV2TimeCount())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TimeCount, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2TimeCount_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2TimeCount &inout DefaultValue = FC_EcosimAIV2TimeCount())
{
    ECSFunc_FC_EcosimAIV2TimeCount::AssignEcosimAIV2TimeCount(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2TimeCount& ModifyEcosimAIV2TimeCount(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TimeCount));
    return local_12.GetComp();
}
FC_EcosimAIV2TimeCount& ModifyOrAddEcosimAIV2TimeCount(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TimeCount));
    return local_12.GetComp();
}
const FC_EcosimAIV2TimeCount& GetEcosimAIV2TimeCount(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TimeCount));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2TimeCount GetEcosimAIV2TimeCount_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2TimeCount __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2TimeCount::GetEcosimAIV2TimeCount(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2TimeCount GetDefaultedEcosimAIV2TimeCount(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2TimeCount __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TimeCount);
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
FC_EcosimAIV2TimeCount GetDefaultedEcosimAIV2TimeCount_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2TimeCount __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2TimeCount(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TimeCount);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TimeCountOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2TimeCount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TimeCountOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2TimeCount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TimeCountOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2TimeCount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TimeCountOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2TimeCount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TimeCountOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2TimeCount, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2TimeCountLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2TimeCount, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2TimeCountActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2TimeCount, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2TimeCountModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2TimeCount, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2LevelControl
{
UFUNCTION()
bool HasEcosimAIV2LevelControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelControl);
}
FC_EcosimAIV2LevelControl& AssignEcosimAIV2LevelControl(const FECSEntity &inout Entity, const FC_EcosimAIV2LevelControl &inout DefaultValue = FC_EcosimAIV2LevelControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2LevelControl_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2LevelControl &inout DefaultValue = FC_EcosimAIV2LevelControl())
{
    ECSFunc_FC_EcosimAIV2LevelControl::AssignEcosimAIV2LevelControl(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2LevelControl& ModifyEcosimAIV2LevelControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelControl));
    return local_12.GetComp();
}
FC_EcosimAIV2LevelControl& ModifyOrAddEcosimAIV2LevelControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelControl));
    return local_12.GetComp();
}
const FC_EcosimAIV2LevelControl& GetEcosimAIV2LevelControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2LevelControl GetEcosimAIV2LevelControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcosimAIV2LevelControl& local_4 = ECSFunc_FC_EcosimAIV2LevelControl::GetEcosimAIV2LevelControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcosimAIV2LevelControl();
}
const FC_EcosimAIV2LevelControl GetDefaultedEcosimAIV2LevelControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2LevelControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelControl);
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
FC_EcosimAIV2LevelControl GetDefaultedEcosimAIV2LevelControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcosimAIV2LevelControl::GetDefaultedEcosimAIV2LevelControl(Entity);
}
UFUNCTION()
bool RemoveEcosimAIV2LevelControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelControl);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LevelControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2LevelControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LevelControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2LevelControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LevelControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2LevelControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LevelControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2LevelControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LevelControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2LevelControl, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2LevelControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2LevelControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2LevelControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2LevelControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2LevelControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2LevelControl, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_EcosimAIV2LevelControl_bMoveToSpecifiedLocation(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().bMoveToSpecifiedLocation;
    return;
}
void GetEntityBBVar_EcosimAIV2LevelControl_MoveToSpecifiedLocation(const FECSEntity &inout Entity, FVector &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FVector(local_4.opCall().MoveToSpecifiedLocation);
    return;
}
void GetEntityBBVar_EcosimAIV2LevelControl_bMoveToSpecifiedDirection(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().bMoveToSpecifiedDirection;
    return;
}
void GetEntityBBVar_EcosimAIV2LevelControl_MoveToSpecifiedDirection(const FECSEntity &inout Entity, FVector &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FVector(local_4.opCall().MoveToSpecifiedDirection);
    return;
}
}
