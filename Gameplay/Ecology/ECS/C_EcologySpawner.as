
namespace __INTENRAL_FC_EcologyRuntimeClassicFlockSpawner_NS
{
    const TECSComponentDerivedPtr<FC_EcologyRuntimeClassicFlockSpawner> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyRuntimeClassicFlockSpawner>();
    const FC_EcologyRuntimeClassicFlockSpawner DefaultValue = FC_EcologyRuntimeClassicFlockSpawner();
}
namespace __INTENRAL_FC_EcologyMixRandomBossSpawner_NS
{
    const TECSComponentDerivedPtr<FC_EcologyMixRandomBossSpawner> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyMixRandomBossSpawner>();
    const FC_EcologyMixRandomBossSpawner DefaultValue = FC_EcologyMixRandomBossSpawner();
}
namespace __INTENRAL_FC_EcologyRandomGenerator_NS
{
    const TECSComponentDerivedPtr<FC_EcologyRandomGenerator> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyRandomGenerator>();
    const FC_EcologyRandomGenerator DefaultValue = FC_EcologyRandomGenerator();
}
namespace __INTENRAL_FC_EcologyRuntimeSpanwerTag_NS
{
    const TECSComponentDerivedPtr<FC_EcologyRuntimeSpanwerTag> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyRuntimeSpanwerTag>();
    const FC_EcologyRuntimeSpanwerTag DefaultValue = FC_EcologyRuntimeSpanwerTag();
}
namespace __INTENRAL_FC_EcologyForceRefreshSpawnerTag_NS
{
    const TECSComponentDerivedPtr<FC_EcologyForceRefreshSpawnerTag> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyForceRefreshSpawnerTag>();
    const FC_EcologyForceRefreshSpawnerTag DefaultValue = FC_EcologyForceRefreshSpawnerTag();
}
namespace __INTENRAL_FC_SpawnerReadyTracker_NS
{
    const TECSComponentDerivedPtr<FC_SpawnerReadyTracker> DerivedPtr = TECSComponentDerivedPtr<FC_SpawnerReadyTracker>();
    const FC_SpawnerReadyTracker DefaultValue = FC_SpawnerReadyTracker();
}
namespace __INTENRAL_FC_EcologyRuntimeConstFlockSpawner_NS
{
    const TECSComponentDerivedPtr<FC_EcologyRuntimeConstFlockSpawner> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyRuntimeConstFlockSpawner>();
    const FC_EcologyRuntimeConstFlockSpawner DefaultValue = FC_EcologyRuntimeConstFlockSpawner();
}
namespace __INTENRAL_FC_EcologyRuntimeConstNPCSpawner_NS
{
    const TECSComponentDerivedPtr<FC_EcologyRuntimeConstNPCSpawner> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyRuntimeConstNPCSpawner>();
    const FC_EcologyRuntimeConstNPCSpawner DefaultValue = FC_EcologyRuntimeConstNPCSpawner();

}
struct FFlockSpawnerData
{
    UPROPERTY()
    FCreatureConfigProxy CreatureType;
    UPROPERTY()
    int MaxCount;
    UPROPERTY()
    int MinCount;
    UPROPERTY()
    int MaxBatch;
    UPROPERTY()
    bool bAcceptSpawnRatio;
    UPROPERTY()
    int FinalExceptBatch;
    UPROPERTY()
    TSet<FDelayTaskHandle> DelayTaskHadles;
    UPROPERTY()
    TArray<FECSEntity> FlockEntities;


}

struct FRuntimeTeamSpawnerDataHandle
{
    UPROPERTY()
    FECSEntityId Spawner;
    UPROPERTY()
    int SubIndex;


}

struct FC_EcologyRuntimeClassicFlockSpawner : FECSComponent
{
    UPROPERTY()
    TArray<FFlockSpawnerData> SpawnerData;
    UPROPERTY()
    TSoftObjectPtr<AECSRegionVolume> Region;
    UPROPERTY()
    TSoftObjectPtr<AECSRegionVolume> WeatherSource;

    FC_EcologyRuntimeClassicFlockSpawner()
    {
        return;
    }
}

struct FMixRandomBossSpawnResult
{
    UPROPERTY()
    int PoolIndex;
    UPROPERTY()
    int BossIndex;
    UPROPERTY()
    int RandomValue;


}

struct FC_EcologyMixRandomBossSpawner : FECSComponent
{
    UPROPERTY()
    TMap<FECSEntityId, FMixRandomBossSpawnResult> SpawnResult;

    FC_EcologyMixRandomBossSpawner()
    {
        return;
    }
}

struct FC_EcologyRandomGenerator : FECSComponent
{
    UPROPERTY()
    FRandomGenerator RandomGenerator;

    FC_EcologyRandomGenerator()
    {
        return;
    }
}

struct FC_EcologyRuntimeSpanwerTag : FECSComponent
{
    FC_EcologyRuntimeSpanwerTag()
    {
        return;
    }
}

struct FC_EcologyForceRefreshSpawnerTag : FECSComponent
{
    FC_EcologyForceRefreshSpawnerTag()
    {
        return;
    }
}

struct FC_SpawnerReadyTracker : FECSComponent
{
    UPROPERTY()
    int PendingReadyCount;
    UPROPERTY()
    bool bSpawnComplete;
    UPROPERTY()
    FECSEntityId LevelUnitEntity;


}

struct FC_EcologyRuntimeConstFlockSpawner : FECSComponent
{
    UPROPERTY()
    FECSEntityId FlockEntity;
    UPROPERTY()
    FECSEntityId InternalResourceEntity;
    UPROPERTY()
    FLevelUnitReference PendingExternalResourceUnitId = FLevelUnitReference();

    FC_EcologyRuntimeConstFlockSpawner()
    {
        return;
    }
}

struct FC_EcologyRuntimeConstNPCSpawner : FECSComponent
{
    UPROPERTY()
    FECSEntityId CreatureEntity;

    FC_EcologyRuntimeConstNPCSpawner()
    {
        return;
    }
}

namespace ECSFunc_FC_EcologyRuntimeClassicFlockSpawner
{
UFUNCTION()
bool HasEcologyRuntimeClassicFlockSpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeClassicFlockSpawner);
}
FC_EcologyRuntimeClassicFlockSpawner& AssignEcologyRuntimeClassicFlockSpawner(const FECSEntity &inout Entity, const FC_EcologyRuntimeClassicFlockSpawner &inout DefaultValue = FC_EcologyRuntimeClassicFlockSpawner())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeClassicFlockSpawner, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyRuntimeClassicFlockSpawner_BP(const FECSEntity &inout Entity, const FC_EcologyRuntimeClassicFlockSpawner &inout DefaultValue = FC_EcologyRuntimeClassicFlockSpawner())
{
    ECSFunc_FC_EcologyRuntimeClassicFlockSpawner::AssignEcologyRuntimeClassicFlockSpawner(Entity, DefaultValue);
    return;
}
FC_EcologyRuntimeClassicFlockSpawner& ModifyEcologyRuntimeClassicFlockSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeClassicFlockSpawner));
    return local_12.GetComp();
}
FC_EcologyRuntimeClassicFlockSpawner& ModifyOrAddEcologyRuntimeClassicFlockSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeClassicFlockSpawner));
    return local_12.GetComp();
}
const FC_EcologyRuntimeClassicFlockSpawner& GetEcologyRuntimeClassicFlockSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeClassicFlockSpawner));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyRuntimeClassicFlockSpawner GetEcologyRuntimeClassicFlockSpawner_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyRuntimeClassicFlockSpawner __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyRuntimeClassicFlockSpawner::GetEcologyRuntimeClassicFlockSpawner(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyRuntimeClassicFlockSpawner GetDefaultedEcologyRuntimeClassicFlockSpawner(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyRuntimeClassicFlockSpawner __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeClassicFlockSpawner);
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
FC_EcologyRuntimeClassicFlockSpawner GetDefaultedEcologyRuntimeClassicFlockSpawner_BP(const FECSEntity &inout Entity)
{
    FC_EcologyRuntimeClassicFlockSpawner __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyRuntimeClassicFlockSpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeClassicFlockSpawner);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeClassicFlockSpawnerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyRuntimeClassicFlockSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeClassicFlockSpawnerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyRuntimeClassicFlockSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeClassicFlockSpawnerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyRuntimeClassicFlockSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeClassicFlockSpawnerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyRuntimeClassicFlockSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeClassicFlockSpawnerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyRuntimeClassicFlockSpawner, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyRuntimeClassicFlockSpawnerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyRuntimeClassicFlockSpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyRuntimeClassicFlockSpawnerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyRuntimeClassicFlockSpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyRuntimeClassicFlockSpawnerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyRuntimeClassicFlockSpawner, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyMixRandomBossSpawner
{
UFUNCTION()
bool HasEcologyMixRandomBossSpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyMixRandomBossSpawner);
}
FC_EcologyMixRandomBossSpawner& AssignEcologyMixRandomBossSpawner(const FECSEntity &inout Entity, const FC_EcologyMixRandomBossSpawner &inout DefaultValue = FC_EcologyMixRandomBossSpawner())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyMixRandomBossSpawner, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyMixRandomBossSpawner_BP(const FECSEntity &inout Entity, const FC_EcologyMixRandomBossSpawner &inout DefaultValue = FC_EcologyMixRandomBossSpawner())
{
    ECSFunc_FC_EcologyMixRandomBossSpawner::AssignEcologyMixRandomBossSpawner(Entity, DefaultValue);
    return;
}
FC_EcologyMixRandomBossSpawner& ModifyEcologyMixRandomBossSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyMixRandomBossSpawner));
    return local_12.GetComp();
}
FC_EcologyMixRandomBossSpawner& ModifyOrAddEcologyMixRandomBossSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyMixRandomBossSpawner));
    return local_12.GetComp();
}
const FC_EcologyMixRandomBossSpawner& GetEcologyMixRandomBossSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyMixRandomBossSpawner));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyMixRandomBossSpawner GetEcologyMixRandomBossSpawner_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyMixRandomBossSpawner __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyMixRandomBossSpawner::GetEcologyMixRandomBossSpawner(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyMixRandomBossSpawner GetDefaultedEcologyMixRandomBossSpawner(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyMixRandomBossSpawner __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyMixRandomBossSpawner);
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
FC_EcologyMixRandomBossSpawner GetDefaultedEcologyMixRandomBossSpawner_BP(const FECSEntity &inout Entity)
{
    FC_EcologyMixRandomBossSpawner __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyMixRandomBossSpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyMixRandomBossSpawner);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyMixRandomBossSpawnerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyMixRandomBossSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyMixRandomBossSpawnerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyMixRandomBossSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyMixRandomBossSpawnerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyMixRandomBossSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyMixRandomBossSpawnerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyMixRandomBossSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyMixRandomBossSpawnerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyMixRandomBossSpawner, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyMixRandomBossSpawnerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyMixRandomBossSpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyMixRandomBossSpawnerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyMixRandomBossSpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyMixRandomBossSpawnerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyMixRandomBossSpawner, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyRandomGenerator
{
UFUNCTION()
bool HasEcologyRandomGenerator(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyRandomGenerator);
}
FC_EcologyRandomGenerator& AssignEcologyRandomGenerator(const FECSEntity &inout Entity, const FC_EcologyRandomGenerator &inout DefaultValue = FC_EcologyRandomGenerator())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyRandomGenerator, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyRandomGenerator_BP(const FECSEntity &inout Entity, const FC_EcologyRandomGenerator &inout DefaultValue = FC_EcologyRandomGenerator())
{
    ECSFunc_FC_EcologyRandomGenerator::AssignEcologyRandomGenerator(Entity, DefaultValue);
    return;
}
FC_EcologyRandomGenerator& ModifyEcologyRandomGenerator(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyRandomGenerator));
    return local_12.GetComp();
}
FC_EcologyRandomGenerator& ModifyOrAddEcologyRandomGenerator(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyRandomGenerator));
    return local_12.GetComp();
}
const FC_EcologyRandomGenerator& GetEcologyRandomGenerator(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyRandomGenerator));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyRandomGenerator GetEcologyRandomGenerator_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyRandomGenerator __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyRandomGenerator::GetEcologyRandomGenerator(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyRandomGenerator GetDefaultedEcologyRandomGenerator(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyRandomGenerator __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyRandomGenerator);
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
FC_EcologyRandomGenerator GetDefaultedEcologyRandomGenerator_BP(const FECSEntity &inout Entity)
{
    FC_EcologyRandomGenerator __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyRandomGenerator(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyRandomGenerator);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyRandomGeneratorOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyRandomGenerator, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRandomGeneratorOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyRandomGenerator, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRandomGeneratorOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyRandomGenerator, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRandomGeneratorOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyRandomGenerator, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRandomGeneratorOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyRandomGenerator, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyRandomGeneratorLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyRandomGenerator, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyRandomGeneratorActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyRandomGenerator, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyRandomGeneratorModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyRandomGenerator, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyRuntimeSpanwerTag
{
UFUNCTION()
bool HasEcologyRuntimeSpanwerTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeSpanwerTag);
}
FC_EcologyRuntimeSpanwerTag& AssignEcologyRuntimeSpanwerTag(const FECSEntity &inout Entity, const FC_EcologyRuntimeSpanwerTag &inout DefaultValue = FC_EcologyRuntimeSpanwerTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeSpanwerTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyRuntimeSpanwerTag_BP(const FECSEntity &inout Entity, const FC_EcologyRuntimeSpanwerTag &inout DefaultValue = FC_EcologyRuntimeSpanwerTag())
{
    ECSFunc_FC_EcologyRuntimeSpanwerTag::AssignEcologyRuntimeSpanwerTag(Entity, DefaultValue);
    return;
}
FC_EcologyRuntimeSpanwerTag& ModifyEcologyRuntimeSpanwerTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeSpanwerTag));
    return local_12.GetComp();
}
FC_EcologyRuntimeSpanwerTag& ModifyOrAddEcologyRuntimeSpanwerTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeSpanwerTag));
    return local_12.GetComp();
}
const FC_EcologyRuntimeSpanwerTag& GetEcologyRuntimeSpanwerTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeSpanwerTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyRuntimeSpanwerTag GetEcologyRuntimeSpanwerTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcologyRuntimeSpanwerTag& local_4 = ECSFunc_FC_EcologyRuntimeSpanwerTag::GetEcologyRuntimeSpanwerTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcologyRuntimeSpanwerTag();
}
const FC_EcologyRuntimeSpanwerTag GetDefaultedEcologyRuntimeSpanwerTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyRuntimeSpanwerTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeSpanwerTag);
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
FC_EcologyRuntimeSpanwerTag GetDefaultedEcologyRuntimeSpanwerTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcologyRuntimeSpanwerTag::GetDefaultedEcologyRuntimeSpanwerTag(Entity);
}
UFUNCTION()
bool RemoveEcologyRuntimeSpanwerTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeSpanwerTag);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeSpanwerTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyRuntimeSpanwerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeSpanwerTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyRuntimeSpanwerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeSpanwerTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyRuntimeSpanwerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeSpanwerTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyRuntimeSpanwerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeSpanwerTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyRuntimeSpanwerTag, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyRuntimeSpanwerTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyRuntimeSpanwerTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyRuntimeSpanwerTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyRuntimeSpanwerTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyRuntimeSpanwerTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyRuntimeSpanwerTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyForceRefreshSpawnerTag
{
UFUNCTION()
bool HasEcologyForceRefreshSpawnerTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyForceRefreshSpawnerTag);
}
FC_EcologyForceRefreshSpawnerTag& AssignEcologyForceRefreshSpawnerTag(const FECSEntity &inout Entity, const FC_EcologyForceRefreshSpawnerTag &inout DefaultValue = FC_EcologyForceRefreshSpawnerTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyForceRefreshSpawnerTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyForceRefreshSpawnerTag_BP(const FECSEntity &inout Entity, const FC_EcologyForceRefreshSpawnerTag &inout DefaultValue = FC_EcologyForceRefreshSpawnerTag())
{
    ECSFunc_FC_EcologyForceRefreshSpawnerTag::AssignEcologyForceRefreshSpawnerTag(Entity, DefaultValue);
    return;
}
FC_EcologyForceRefreshSpawnerTag& ModifyEcologyForceRefreshSpawnerTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyForceRefreshSpawnerTag));
    return local_12.GetComp();
}
FC_EcologyForceRefreshSpawnerTag& ModifyOrAddEcologyForceRefreshSpawnerTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyForceRefreshSpawnerTag));
    return local_12.GetComp();
}
const FC_EcologyForceRefreshSpawnerTag& GetEcologyForceRefreshSpawnerTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyForceRefreshSpawnerTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyForceRefreshSpawnerTag GetEcologyForceRefreshSpawnerTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcologyForceRefreshSpawnerTag& local_4 = ECSFunc_FC_EcologyForceRefreshSpawnerTag::GetEcologyForceRefreshSpawnerTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcologyForceRefreshSpawnerTag();
}
const FC_EcologyForceRefreshSpawnerTag GetDefaultedEcologyForceRefreshSpawnerTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyForceRefreshSpawnerTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyForceRefreshSpawnerTag);
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
FC_EcologyForceRefreshSpawnerTag GetDefaultedEcologyForceRefreshSpawnerTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcologyForceRefreshSpawnerTag::GetDefaultedEcologyForceRefreshSpawnerTag(Entity);
}
UFUNCTION()
bool RemoveEcologyForceRefreshSpawnerTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyForceRefreshSpawnerTag);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyForceRefreshSpawnerTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyForceRefreshSpawnerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyForceRefreshSpawnerTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyForceRefreshSpawnerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyForceRefreshSpawnerTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyForceRefreshSpawnerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyForceRefreshSpawnerTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyForceRefreshSpawnerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyForceRefreshSpawnerTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyForceRefreshSpawnerTag, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyForceRefreshSpawnerTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyForceRefreshSpawnerTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyForceRefreshSpawnerTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyForceRefreshSpawnerTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyForceRefreshSpawnerTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyForceRefreshSpawnerTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SpawnerReadyTracker
{
UFUNCTION()
bool HasSpawnerReadyTracker(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SpawnerReadyTracker);
}
FC_SpawnerReadyTracker& AssignSpawnerReadyTracker(const FECSEntity &inout Entity, const FC_SpawnerReadyTracker &inout DefaultValue = FC_SpawnerReadyTracker())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SpawnerReadyTracker, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSpawnerReadyTracker_BP(const FECSEntity &inout Entity, const FC_SpawnerReadyTracker &inout DefaultValue = FC_SpawnerReadyTracker())
{
    ECSFunc_FC_SpawnerReadyTracker::AssignSpawnerReadyTracker(Entity, DefaultValue);
    return;
}
FC_SpawnerReadyTracker& ModifySpawnerReadyTracker(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SpawnerReadyTracker));
    return local_12.GetComp();
}
FC_SpawnerReadyTracker& ModifyOrAddSpawnerReadyTracker(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SpawnerReadyTracker));
    return local_12.GetComp();
}
const FC_SpawnerReadyTracker& GetSpawnerReadyTracker(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SpawnerReadyTracker));
    return local_12.GetComp();
}
UFUNCTION()
FC_SpawnerReadyTracker GetSpawnerReadyTracker_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SpawnerReadyTracker __r;
    bValid = false;
    bValid = ECSFunc_FC_SpawnerReadyTracker::GetSpawnerReadyTracker(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SpawnerReadyTracker GetDefaultedSpawnerReadyTracker(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SpawnerReadyTracker __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SpawnerReadyTracker);
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
FC_SpawnerReadyTracker GetDefaultedSpawnerReadyTracker_BP(const FECSEntity &inout Entity)
{
    FC_SpawnerReadyTracker __r;
    return __r;
}
UFUNCTION()
bool RemoveSpawnerReadyTracker(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SpawnerReadyTracker);
}
}
FECSMonitorRuntimeView __GetMonitorSpawnerReadyTrackerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SpawnerReadyTracker, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnerReadyTrackerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SpawnerReadyTracker, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnerReadyTrackerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SpawnerReadyTracker, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnerReadyTrackerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SpawnerReadyTracker, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnerReadyTrackerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SpawnerReadyTracker, bFixedFrame, bMustHandleAll);
}
void __MonitorSpawnerReadyTrackerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SpawnerReadyTracker, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnerReadyTrackerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SpawnerReadyTracker, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnerReadyTrackerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SpawnerReadyTracker, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyRuntimeConstFlockSpawner
{
UFUNCTION()
bool HasEcologyRuntimeConstFlockSpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeConstFlockSpawner);
}
FC_EcologyRuntimeConstFlockSpawner& AssignEcologyRuntimeConstFlockSpawner(const FECSEntity &inout Entity, const FC_EcologyRuntimeConstFlockSpawner &inout DefaultValue = FC_EcologyRuntimeConstFlockSpawner())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeConstFlockSpawner, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyRuntimeConstFlockSpawner_BP(const FECSEntity &inout Entity, const FC_EcologyRuntimeConstFlockSpawner &inout DefaultValue = FC_EcologyRuntimeConstFlockSpawner())
{
    ECSFunc_FC_EcologyRuntimeConstFlockSpawner::AssignEcologyRuntimeConstFlockSpawner(Entity, DefaultValue);
    return;
}
FC_EcologyRuntimeConstFlockSpawner& ModifyEcologyRuntimeConstFlockSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeConstFlockSpawner));
    return local_12.GetComp();
}
FC_EcologyRuntimeConstFlockSpawner& ModifyOrAddEcologyRuntimeConstFlockSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeConstFlockSpawner));
    return local_12.GetComp();
}
const FC_EcologyRuntimeConstFlockSpawner& GetEcologyRuntimeConstFlockSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeConstFlockSpawner));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyRuntimeConstFlockSpawner GetEcologyRuntimeConstFlockSpawner_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyRuntimeConstFlockSpawner __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyRuntimeConstFlockSpawner::GetEcologyRuntimeConstFlockSpawner(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyRuntimeConstFlockSpawner GetDefaultedEcologyRuntimeConstFlockSpawner(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyRuntimeConstFlockSpawner __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeConstFlockSpawner);
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
FC_EcologyRuntimeConstFlockSpawner GetDefaultedEcologyRuntimeConstFlockSpawner_BP(const FECSEntity &inout Entity)
{
    FC_EcologyRuntimeConstFlockSpawner __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyRuntimeConstFlockSpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeConstFlockSpawner);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeConstFlockSpawnerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyRuntimeConstFlockSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeConstFlockSpawnerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyRuntimeConstFlockSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeConstFlockSpawnerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyRuntimeConstFlockSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeConstFlockSpawnerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyRuntimeConstFlockSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeConstFlockSpawnerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyRuntimeConstFlockSpawner, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyRuntimeConstFlockSpawnerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyRuntimeConstFlockSpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyRuntimeConstFlockSpawnerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyRuntimeConstFlockSpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyRuntimeConstFlockSpawnerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyRuntimeConstFlockSpawner, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyRuntimeConstNPCSpawner
{
UFUNCTION()
bool HasEcologyRuntimeConstNPCSpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeConstNPCSpawner);
}
FC_EcologyRuntimeConstNPCSpawner& AssignEcologyRuntimeConstNPCSpawner(const FECSEntity &inout Entity, const FC_EcologyRuntimeConstNPCSpawner &inout DefaultValue = FC_EcologyRuntimeConstNPCSpawner())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeConstNPCSpawner, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyRuntimeConstNPCSpawner_BP(const FECSEntity &inout Entity, const FC_EcologyRuntimeConstNPCSpawner &inout DefaultValue = FC_EcologyRuntimeConstNPCSpawner())
{
    ECSFunc_FC_EcologyRuntimeConstNPCSpawner::AssignEcologyRuntimeConstNPCSpawner(Entity, DefaultValue);
    return;
}
FC_EcologyRuntimeConstNPCSpawner& ModifyEcologyRuntimeConstNPCSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeConstNPCSpawner));
    return local_12.GetComp();
}
FC_EcologyRuntimeConstNPCSpawner& ModifyOrAddEcologyRuntimeConstNPCSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeConstNPCSpawner));
    return local_12.GetComp();
}
const FC_EcologyRuntimeConstNPCSpawner& GetEcologyRuntimeConstNPCSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeConstNPCSpawner));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyRuntimeConstNPCSpawner GetEcologyRuntimeConstNPCSpawner_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyRuntimeConstNPCSpawner __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyRuntimeConstNPCSpawner::GetEcologyRuntimeConstNPCSpawner(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyRuntimeConstNPCSpawner GetDefaultedEcologyRuntimeConstNPCSpawner(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyRuntimeConstNPCSpawner __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeConstNPCSpawner);
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
FC_EcologyRuntimeConstNPCSpawner GetDefaultedEcologyRuntimeConstNPCSpawner_BP(const FECSEntity &inout Entity)
{
    FC_EcologyRuntimeConstNPCSpawner __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyRuntimeConstNPCSpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyRuntimeConstNPCSpawner);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeConstNPCSpawnerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyRuntimeConstNPCSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeConstNPCSpawnerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyRuntimeConstNPCSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeConstNPCSpawnerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyRuntimeConstNPCSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeConstNPCSpawnerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyRuntimeConstNPCSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyRuntimeConstNPCSpawnerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyRuntimeConstNPCSpawner, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyRuntimeConstNPCSpawnerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyRuntimeConstNPCSpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyRuntimeConstNPCSpawnerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyRuntimeConstNPCSpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyRuntimeConstNPCSpawnerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyRuntimeConstNPCSpawner, bFixedFrame, Details);
    return;
}
