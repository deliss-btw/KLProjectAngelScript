
enum EAutoTrackTurretTargetingMode
{
    FilterMonster,
}

enum EAutoTrackTurretRankingMode
{
    Closest,
    Furthest,
}

enum EAutoTrackTurretTargetingConditionType_Monster
{
    SpecificMonster,
    MonsterRank,
}

namespace __INTENRAL_FC_AutoTrackTurretConfig_NS
{
    const TECSComponentDerivedPtr<FC_AutoTrackTurretConfig> DerivedPtr = TECSComponentDerivedPtr<FC_AutoTrackTurretConfig>();
    const FC_AutoTrackTurretConfig DefaultValue = FC_AutoTrackTurretConfig();
}
namespace __INTENRAL_FC_AutoTrackTurretActiveTag_NS
{
    const TECSComponentDerivedPtr<FC_AutoTrackTurretActiveTag> DerivedPtr = TECSComponentDerivedPtr<FC_AutoTrackTurretActiveTag>();
    const FC_AutoTrackTurretActiveTag DefaultValue = FC_AutoTrackTurretActiveTag();
}
namespace __INTENRAL_FC_AutoTrackTurretClientRuntime_NS
{
    const TECSComponentDerivedPtr<FC_AutoTrackTurretClientRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_AutoTrackTurretClientRuntime>();
    const FC_AutoTrackTurretClientRuntime DefaultValue = FC_AutoTrackTurretClientRuntime();
}
namespace __INTENRAL_FC_AutoTrackTurretServerCache_NS
{
    const TECSComponentDerivedPtr<FC_AutoTrackTurretServerCache> DerivedPtr = TECSComponentDerivedPtr<FC_AutoTrackTurretServerCache>();
    const FC_AutoTrackTurretServerCache DefaultValue = FC_AutoTrackTurretServerCache();
}
namespace __INTENRAL_FC_AutoTrackTurretClientCache_NS
{
    const TECSComponentDerivedPtr<FC_AutoTrackTurretClientCache> DerivedPtr = TECSComponentDerivedPtr<FC_AutoTrackTurretClientCache>();
    const FC_AutoTrackTurretClientCache DefaultValue = FC_AutoTrackTurretClientCache();

}
struct FAutoTrackTurretTargetingConditionBase
{
    UPROPERTY()
    float32 MaxDistance = 3000.0f;
    UPROPERTY()
    float32 MaxAngle = 120.0f;
    UPROPERTY()
    bool bFilterByFaction = false;
    UPROPERTY()
    int FactionRelation = 0;
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForTargetEntity;


}

struct FAutoTrackTurretTargetingCondition_Monster : FAutoTrackTurretTargetingConditionBase
{
    FAutoTrackTurretTargetingConditionBase _base_FAutoTrackTurretTargetingConditionBase;
    UPROPERTY()
    EAutoTrackTurretTargetingConditionType_Monster ConditionType = EAutoTrackTurretTargetingConditionType_Monster(0);
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> SpecificMonsterConfig;
    UPROPERTY()
    EMonsterRank MonsterRank = EMonsterRank(0);


}

struct FC_AutoTrackTurretConfig : FECSComponent
{
    UPROPERTY()
    FName StaticComponentLogicName;
    UPROPERTY()
    bool bTrackYaw = true;
    UPROPERTY()
    FName YawAxisMeshLogicName;
    UPROPERTY()
    bool bTrackPitch = true;
    UPROPERTY()
    FName PitchAxisMeshLogicName;
    UPROPERTY()
    bool bLimitYaw = true;
    UPROPERTY()
    float32 MinYaw = -90.0f;
    UPROPERTY()
    float32 MaxYaw = 90.0f;
    UPROPERTY()
    bool bLimitPitch = true;
    UPROPERTY()
    float32 MinPitch = -90.0f;
    UPROPERTY()
    float32 MaxPitch = 90.0f;
    UPROPERTY()
    float32 MaxYawAngularVelocity = 90.0f;
    UPROPERTY()
    float32 MaxPitchAngularVelocity = 90.0f;
    UPROPERTY()
    EAutoTrackTurretRankingMode RankingMode = EAutoTrackTurretRankingMode(0);
    UPROPERTY()
    bool bCheckVisibility = false;
    UPROPERTY()
    ETraceTypeQuery VisibilityTraceChannel = ETraceTypeQuery(5);
    UPROPERTY()
    FVector VisibilityTraceOriginOffset = FVector(0.0, 0.0, 50.0);
    UPROPERTY()
    EAutoTrackTurretTargetingMode TargetingMode = EAutoTrackTurretTargetingMode(0);
    UPROPERTY()
    TArray<FAutoTrackTurretTargetingCondition_Monster> TargetingConditionsForMonster;
    UPROPERTY()
    FNameHandle_ESMBBTrigger ActivateESMTriggerName_FoundTarget;
    UPROPERTY()
    float32 ActivateESMTriggerTime_FoundTarget = 0.2f;
    UPROPERTY()
    FNameHandle_ESMBBTrigger ActivateESMTriggerName_LostTarget;
    UPROPERTY()
    float32 ActivateESMTriggerTime_LostTarget = 0.2f;


    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        if (ECS::GetRuntimeInfo().IsServer)
        {
            FC_AutoTrackTurretClientRuntime local_14;
            Assign local_6;
            local_6.opCall(local_14);
            FC_AutoTrackTurretServerCache local_32;
            Assign local_18;
            local_18.opCall(local_32);
            return;
        }
        FC_AutoTrackTurretClientCache local_96;
        Assign local_36;
        local_36.opCall(local_96);
        return;
    }
}

struct FC_AutoTrackTurretActiveTag : FECSComponent
{
    FC_AutoTrackTurretActiveTag()
    {
        return;
    }
}

struct FC_AutoTrackTurretClientRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    bool m_bHasTarget;

    FC_AutoTrackTurretClientRuntime()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AutoTrackTurretClientRuntime(const FC_AutoTrackTurretClientRuntime &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AutoTrackTurretClientRuntime opAssign(const FC_AutoTrackTurretClientRuntime &inout Other)
    {
        FC_AutoTrackTurretClientRuntime __r;
        this.SetTargetEntity(Other.GetTargetEntity());
        this.SetbHasTarget(Other.GetbHasTarget());
        return __r;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TargetEntity = __Value;
        return;
    }
    bool GetbHasTarget() const property
    {
        return this.m_bHasTarget;
    }
    void SetbHasTarget(const bool __Value) property
    {
        if (!(this.m_bHasTarget) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bHasTarget = __Value;
        return;
    }
}

struct FC_AutoTrackTurretServerCache : FECSComponent
{
    UPROPERTY()
    FQuat InitialEntityRotation;
    UPROPERTY()
    float32 CurrentEntityYaw = 0.0f;
    UPROPERTY()
    float32 CurrentEntityPitch = 0.0f;


}

struct FC_AutoTrackTurretClientCache : FECSComponent
{
    UPROPERTY()
    bool bInitialized = false;
    UPROPERTY()
    FQuat CachedInitialEntityRotation = FQuat::Identity;
    UPROPERTY()
    TArray<FQuat> StaticComponentInitialWorldRotations;
    UPROPERTY()
    TArray<FVector> StaticComponentInitialRelativeLocations;
    UPROPERTY()
    TArray<FVector> StaticComponentInitialRelativeScales;
    UPROPERTY()
    TArray<FName> CachedStaticCompFNames;
    UPROPERTY()
    TArray<FVector> YawComponentInitialRelativeLocations;
    UPROPERTY()
    TArray<FVector> YawComponentInitialRelativeScales;
    UPROPERTY()
    TArray<FName> CachedYawCompFNames;
    UPROPERTY()
    TArray<FName> CachedYawParentFNames;
    UPROPERTY()
    TArray<FVector> PitchComponentInitialRelativeLocations;
    UPROPERTY()
    TArray<FVector> PitchComponentInitialRelativeScales;
    UPROPERTY()
    TArray<FName> CachedPitchCompFNames;
    UPROPERTY()
    TArray<FName> CachedPitchParentFNames;


}

namespace ECSFunc_FC_AutoTrackTurretConfig
{
UFUNCTION()
bool HasAutoTrackTurretConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretConfig);
}
FC_AutoTrackTurretConfig& AssignAutoTrackTurretConfig(const FECSEntity &inout Entity, const FC_AutoTrackTurretConfig &inout DefaultValue = FC_AutoTrackTurretConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAutoTrackTurretConfig_BP(const FECSEntity &inout Entity, const FC_AutoTrackTurretConfig &inout DefaultValue = FC_AutoTrackTurretConfig())
{
    ECSFunc_FC_AutoTrackTurretConfig::AssignAutoTrackTurretConfig(Entity, DefaultValue);
    return;
}
FC_AutoTrackTurretConfig& ModifyAutoTrackTurretConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretConfig));
    return local_12.GetComp();
}
FC_AutoTrackTurretConfig& ModifyOrAddAutoTrackTurretConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretConfig));
    return local_12.GetComp();
}
const FC_AutoTrackTurretConfig& GetAutoTrackTurretConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_AutoTrackTurretConfig GetAutoTrackTurretConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AutoTrackTurretConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_AutoTrackTurretConfig::GetAutoTrackTurretConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AutoTrackTurretConfig GetDefaultedAutoTrackTurretConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AutoTrackTurretConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretConfig);
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
FC_AutoTrackTurretConfig GetDefaultedAutoTrackTurretConfig_BP(const FECSEntity &inout Entity)
{
    FC_AutoTrackTurretConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveAutoTrackTurretConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretConfig);
}
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AutoTrackTurretConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AutoTrackTurretConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AutoTrackTurretConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AutoTrackTurretConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AutoTrackTurretConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorAutoTrackTurretConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AutoTrackTurretConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoTrackTurretConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AutoTrackTurretConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoTrackTurretConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AutoTrackTurretConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AutoTrackTurretActiveTag
{
UFUNCTION()
bool HasAutoTrackTurretActiveTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretActiveTag);
}
FC_AutoTrackTurretActiveTag& AssignAutoTrackTurretActiveTag(const FECSEntity &inout Entity, const FC_AutoTrackTurretActiveTag &inout DefaultValue = FC_AutoTrackTurretActiveTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretActiveTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAutoTrackTurretActiveTag_BP(const FECSEntity &inout Entity, const FC_AutoTrackTurretActiveTag &inout DefaultValue = FC_AutoTrackTurretActiveTag())
{
    ECSFunc_FC_AutoTrackTurretActiveTag::AssignAutoTrackTurretActiveTag(Entity, DefaultValue);
    return;
}
FC_AutoTrackTurretActiveTag& ModifyAutoTrackTurretActiveTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretActiveTag));
    return local_12.GetComp();
}
FC_AutoTrackTurretActiveTag& ModifyOrAddAutoTrackTurretActiveTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretActiveTag));
    return local_12.GetComp();
}
const FC_AutoTrackTurretActiveTag& GetAutoTrackTurretActiveTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretActiveTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AutoTrackTurretActiveTag GetAutoTrackTurretActiveTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AutoTrackTurretActiveTag& local_4 = ECSFunc_FC_AutoTrackTurretActiveTag::GetAutoTrackTurretActiveTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AutoTrackTurretActiveTag();
}
const FC_AutoTrackTurretActiveTag GetDefaultedAutoTrackTurretActiveTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AutoTrackTurretActiveTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretActiveTag);
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
FC_AutoTrackTurretActiveTag GetDefaultedAutoTrackTurretActiveTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AutoTrackTurretActiveTag::GetDefaultedAutoTrackTurretActiveTag(Entity);
}
UFUNCTION()
bool RemoveAutoTrackTurretActiveTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretActiveTag);
}
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretActiveTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AutoTrackTurretActiveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretActiveTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AutoTrackTurretActiveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretActiveTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AutoTrackTurretActiveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretActiveTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AutoTrackTurretActiveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretActiveTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AutoTrackTurretActiveTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAutoTrackTurretActiveTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AutoTrackTurretActiveTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoTrackTurretActiveTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AutoTrackTurretActiveTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoTrackTurretActiveTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AutoTrackTurretActiveTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AutoTrackTurretClientRuntime
{
UFUNCTION()
bool HasAutoTrackTurretClientRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretClientRuntime);
}
FC_AutoTrackTurretClientRuntime& AssignAutoTrackTurretClientRuntime(const FECSEntity &inout Entity, const FC_AutoTrackTurretClientRuntime &inout DefaultValue = FC_AutoTrackTurretClientRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretClientRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAutoTrackTurretClientRuntime_BP(const FECSEntity &inout Entity, const FC_AutoTrackTurretClientRuntime &inout DefaultValue = FC_AutoTrackTurretClientRuntime())
{
    ECSFunc_FC_AutoTrackTurretClientRuntime::AssignAutoTrackTurretClientRuntime(Entity, DefaultValue);
    return;
}
FC_AutoTrackTurretClientRuntime& ModifyAutoTrackTurretClientRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretClientRuntime));
    return local_12.GetComp();
}
FC_AutoTrackTurretClientRuntime& ModifyOrAddAutoTrackTurretClientRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretClientRuntime));
    return local_12.GetComp();
}
const FC_AutoTrackTurretClientRuntime& GetAutoTrackTurretClientRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretClientRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_AutoTrackTurretClientRuntime GetAutoTrackTurretClientRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AutoTrackTurretClientRuntime& local_4 = ECSFunc_FC_AutoTrackTurretClientRuntime::GetAutoTrackTurretClientRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AutoTrackTurretClientRuntime();
}
const FC_AutoTrackTurretClientRuntime GetDefaultedAutoTrackTurretClientRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AutoTrackTurretClientRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretClientRuntime);
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
FC_AutoTrackTurretClientRuntime GetDefaultedAutoTrackTurretClientRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AutoTrackTurretClientRuntime::GetDefaultedAutoTrackTurretClientRuntime(Entity);
}
UFUNCTION()
bool RemoveAutoTrackTurretClientRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretClientRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretClientRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AutoTrackTurretClientRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretClientRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AutoTrackTurretClientRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretClientRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AutoTrackTurretClientRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretClientRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AutoTrackTurretClientRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretClientRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AutoTrackTurretClientRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorAutoTrackTurretClientRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AutoTrackTurretClientRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoTrackTurretClientRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AutoTrackTurretClientRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoTrackTurretClientRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AutoTrackTurretClientRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AutoTrackTurretServerCache
{
UFUNCTION()
bool HasAutoTrackTurretServerCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretServerCache);
}
FC_AutoTrackTurretServerCache& AssignAutoTrackTurretServerCache(const FECSEntity &inout Entity, const FC_AutoTrackTurretServerCache &inout DefaultValue = FC_AutoTrackTurretServerCache())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretServerCache, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAutoTrackTurretServerCache_BP(const FECSEntity &inout Entity, const FC_AutoTrackTurretServerCache &inout DefaultValue = FC_AutoTrackTurretServerCache())
{
    ECSFunc_FC_AutoTrackTurretServerCache::AssignAutoTrackTurretServerCache(Entity, DefaultValue);
    return;
}
FC_AutoTrackTurretServerCache& ModifyAutoTrackTurretServerCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretServerCache));
    return local_12.GetComp();
}
FC_AutoTrackTurretServerCache& ModifyOrAddAutoTrackTurretServerCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretServerCache));
    return local_12.GetComp();
}
const FC_AutoTrackTurretServerCache& GetAutoTrackTurretServerCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretServerCache));
    return local_12.GetComp();
}
UFUNCTION()
FC_AutoTrackTurretServerCache GetAutoTrackTurretServerCache_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AutoTrackTurretServerCache& local_4 = ECSFunc_FC_AutoTrackTurretServerCache::GetAutoTrackTurretServerCache(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AutoTrackTurretServerCache();
}
const FC_AutoTrackTurretServerCache GetDefaultedAutoTrackTurretServerCache(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AutoTrackTurretServerCache __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretServerCache);
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
FC_AutoTrackTurretServerCache GetDefaultedAutoTrackTurretServerCache_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AutoTrackTurretServerCache::GetDefaultedAutoTrackTurretServerCache(Entity);
}
UFUNCTION()
bool RemoveAutoTrackTurretServerCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretServerCache);
}
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretServerCacheOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AutoTrackTurretServerCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretServerCacheOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AutoTrackTurretServerCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretServerCacheOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AutoTrackTurretServerCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretServerCacheOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AutoTrackTurretServerCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretServerCacheOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AutoTrackTurretServerCache, bFixedFrame, bMustHandleAll);
}
void __MonitorAutoTrackTurretServerCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AutoTrackTurretServerCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoTrackTurretServerCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AutoTrackTurretServerCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoTrackTurretServerCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AutoTrackTurretServerCache, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AutoTrackTurretClientCache
{
UFUNCTION()
bool HasAutoTrackTurretClientCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretClientCache);
}
FC_AutoTrackTurretClientCache& AssignAutoTrackTurretClientCache(const FECSEntity &inout Entity, const FC_AutoTrackTurretClientCache &inout DefaultValue = FC_AutoTrackTurretClientCache())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretClientCache, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAutoTrackTurretClientCache_BP(const FECSEntity &inout Entity, const FC_AutoTrackTurretClientCache &inout DefaultValue = FC_AutoTrackTurretClientCache())
{
    ECSFunc_FC_AutoTrackTurretClientCache::AssignAutoTrackTurretClientCache(Entity, DefaultValue);
    return;
}
FC_AutoTrackTurretClientCache& ModifyAutoTrackTurretClientCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretClientCache));
    return local_12.GetComp();
}
FC_AutoTrackTurretClientCache& ModifyOrAddAutoTrackTurretClientCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretClientCache));
    return local_12.GetComp();
}
const FC_AutoTrackTurretClientCache& GetAutoTrackTurretClientCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretClientCache));
    return local_12.GetComp();
}
UFUNCTION()
FC_AutoTrackTurretClientCache GetAutoTrackTurretClientCache_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AutoTrackTurretClientCache __r;
    bValid = false;
    bValid = ECSFunc_FC_AutoTrackTurretClientCache::GetAutoTrackTurretClientCache(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AutoTrackTurretClientCache GetDefaultedAutoTrackTurretClientCache(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AutoTrackTurretClientCache __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretClientCache);
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
FC_AutoTrackTurretClientCache GetDefaultedAutoTrackTurretClientCache_BP(const FECSEntity &inout Entity)
{
    FC_AutoTrackTurretClientCache __r;
    return __r;
}
UFUNCTION()
bool RemoveAutoTrackTurretClientCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AutoTrackTurretClientCache);
}
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretClientCacheOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AutoTrackTurretClientCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretClientCacheOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AutoTrackTurretClientCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretClientCacheOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AutoTrackTurretClientCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretClientCacheOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AutoTrackTurretClientCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoTrackTurretClientCacheOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AutoTrackTurretClientCache, bFixedFrame, bMustHandleAll);
}
void __MonitorAutoTrackTurretClientCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AutoTrackTurretClientCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoTrackTurretClientCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AutoTrackTurretClientCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoTrackTurretClientCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AutoTrackTurretClientCache, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AutoTrackTurretClientRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AutoTrackTurretClientRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AutoTrackTurretClientRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AutoTrackTurretClientRuntime
{
int __IndexOf_TargetEntity()
{
    return 0;
}
int __IndexOf_bHasTarget()
{
    return 1;
}
}
