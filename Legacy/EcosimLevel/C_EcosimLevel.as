
enum EEcosimLevelSpawnPrefabType
{
    Default,
    FlyingInsect,
}

enum EEcosimLevelPointFeature
{
    wolf_rest,
    water,
    wolf_food,
    yak_rest,
    yak_food,
}

namespace __INTENRAL_FC_EcosimLevelSpawnerConfig_NS
{
    const TECSComponentDerivedPtr<FC_EcosimLevelSpawnerConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimLevelSpawnerConfig>();
    const FC_EcosimLevelSpawnerConfig DefaultValue = FC_EcosimLevelSpawnerConfig();
}
namespace __INTENRAL_FC_EcosimLevelSpawnPointConfig_NS
{
    const TECSComponentDerivedPtr<FC_EcosimLevelSpawnPointConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimLevelSpawnPointConfig>();
    const FC_EcosimLevelSpawnPointConfig DefaultValue = FC_EcosimLevelSpawnPointConfig();
}
namespace __INTENRAL_FC_EcosimLevelPointConfig_NS
{
    const TECSComponentDerivedPtr<FC_EcosimLevelPointConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimLevelPointConfig>();
    const FC_EcosimLevelPointConfig DefaultValue = FC_EcosimLevelPointConfig();

}
struct FEcosimLevelSpawnPrefabData
{
    UPROPERTY()
    TSubclassOf<AECSPrefab> Prefab;
    UPROPERTY()
    EEcosimLevelSpawnPrefabType SpawnPrefabType;


}

struct FEcosimLevelSpawnStrategy
{
    UPROPERTY()
    TArray<FEcosimLevelSpawnPrefabData> PrefabDataList;
    UPROPERTY()
    int SpawnTotalNumMin = 1;
    UPROPERTY()
    int SpawnTotalNumMax = 1;


    bool ContainsPrefab(const TSubclassOf<AECSPrefab> &inout Prefab) const
    {
        for (auto& local_16 : this)
        {
            TSubclassOf<AECSPrefab> local_18;
            local_18 = local_16.Prefab;
            if ((local_18 == Prefab))
            {
                return true;
            }
        }
        return false;
    }
}

struct FEcosimLevelSpawnPointData
{
    UPROPERTY()
    TArray<TSubclassOf<AECSPrefab>> SpawnList;

    FEcosimLevelSpawnPointData()
    {
        return;
    }
}

struct FC_EcosimLevelSpawnerConfig : FECSComponent
{
    UPROPERTY()
    float32 SpawnRange = 2000.0f;
    UPROPERTY()
    TArray<FEcosimLevelSpawnStrategy> SpawnStrategies;


}

struct FC_EcosimLevelSpawnPointConfig : FECSComponent
{
    UPROPERTY()
    FEcosimLevelSpawnPointData SpawnPointData;

    FC_EcosimLevelSpawnPointConfig()
    {
        return;
    }
}

struct FC_EcosimLevelPointConfig : FECSComponent
{
    UPROPERTY()
    TArray<EEcosimLevelPointFeature> Features;

    FC_EcosimLevelPointConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_EcosimLevelSpawnerConfig
{
UFUNCTION()
bool HasEcosimLevelSpawnerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelSpawnerConfig);
}
FC_EcosimLevelSpawnerConfig& AssignEcosimLevelSpawnerConfig(const FECSEntity &inout Entity, const FC_EcosimLevelSpawnerConfig &inout DefaultValue = FC_EcosimLevelSpawnerConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelSpawnerConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimLevelSpawnerConfig_BP(const FECSEntity &inout Entity, const FC_EcosimLevelSpawnerConfig &inout DefaultValue = FC_EcosimLevelSpawnerConfig())
{
    ECSFunc_FC_EcosimLevelSpawnerConfig::AssignEcosimLevelSpawnerConfig(Entity, DefaultValue);
    return;
}
FC_EcosimLevelSpawnerConfig& ModifyEcosimLevelSpawnerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelSpawnerConfig));
    return local_12.GetComp();
}
FC_EcosimLevelSpawnerConfig& ModifyOrAddEcosimLevelSpawnerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelSpawnerConfig));
    return local_12.GetComp();
}
const FC_EcosimLevelSpawnerConfig& GetEcosimLevelSpawnerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelSpawnerConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimLevelSpawnerConfig GetEcosimLevelSpawnerConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimLevelSpawnerConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimLevelSpawnerConfig::GetEcosimLevelSpawnerConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimLevelSpawnerConfig GetDefaultedEcosimLevelSpawnerConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimLevelSpawnerConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelSpawnerConfig);
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
FC_EcosimLevelSpawnerConfig GetDefaultedEcosimLevelSpawnerConfig_BP(const FECSEntity &inout Entity)
{
    FC_EcosimLevelSpawnerConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimLevelSpawnerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelSpawnerConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimLevelSpawnerConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimLevelSpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimLevelSpawnerConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimLevelSpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimLevelSpawnerConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimLevelSpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimLevelSpawnerConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimLevelSpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimLevelSpawnerConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimLevelSpawnerConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimLevelSpawnerConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimLevelSpawnerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimLevelSpawnerConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimLevelSpawnerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimLevelSpawnerConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimLevelSpawnerConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimLevelSpawnPointConfig
{
UFUNCTION()
bool HasEcosimLevelSpawnPointConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelSpawnPointConfig);
}
FC_EcosimLevelSpawnPointConfig& AssignEcosimLevelSpawnPointConfig(const FECSEntity &inout Entity, const FC_EcosimLevelSpawnPointConfig &inout DefaultValue = FC_EcosimLevelSpawnPointConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelSpawnPointConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimLevelSpawnPointConfig_BP(const FECSEntity &inout Entity, const FC_EcosimLevelSpawnPointConfig &inout DefaultValue = FC_EcosimLevelSpawnPointConfig())
{
    ECSFunc_FC_EcosimLevelSpawnPointConfig::AssignEcosimLevelSpawnPointConfig(Entity, DefaultValue);
    return;
}
FC_EcosimLevelSpawnPointConfig& ModifyEcosimLevelSpawnPointConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelSpawnPointConfig));
    return local_12.GetComp();
}
FC_EcosimLevelSpawnPointConfig& ModifyOrAddEcosimLevelSpawnPointConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelSpawnPointConfig));
    return local_12.GetComp();
}
const FC_EcosimLevelSpawnPointConfig& GetEcosimLevelSpawnPointConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelSpawnPointConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimLevelSpawnPointConfig GetEcosimLevelSpawnPointConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimLevelSpawnPointConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimLevelSpawnPointConfig::GetEcosimLevelSpawnPointConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimLevelSpawnPointConfig GetDefaultedEcosimLevelSpawnPointConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimLevelSpawnPointConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelSpawnPointConfig);
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
FC_EcosimLevelSpawnPointConfig GetDefaultedEcosimLevelSpawnPointConfig_BP(const FECSEntity &inout Entity)
{
    FC_EcosimLevelSpawnPointConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimLevelSpawnPointConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelSpawnPointConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimLevelSpawnPointConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimLevelSpawnPointConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimLevelSpawnPointConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimLevelSpawnPointConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimLevelSpawnPointConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimLevelSpawnPointConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimLevelSpawnPointConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimLevelSpawnPointConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimLevelSpawnPointConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimLevelSpawnPointConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimLevelSpawnPointConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimLevelSpawnPointConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimLevelSpawnPointConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimLevelSpawnPointConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimLevelSpawnPointConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimLevelSpawnPointConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimLevelPointConfig
{
UFUNCTION()
bool HasEcosimLevelPointConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelPointConfig);
}
FC_EcosimLevelPointConfig& AssignEcosimLevelPointConfig(const FECSEntity &inout Entity, const FC_EcosimLevelPointConfig &inout DefaultValue = FC_EcosimLevelPointConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelPointConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimLevelPointConfig_BP(const FECSEntity &inout Entity, const FC_EcosimLevelPointConfig &inout DefaultValue = FC_EcosimLevelPointConfig())
{
    ECSFunc_FC_EcosimLevelPointConfig::AssignEcosimLevelPointConfig(Entity, DefaultValue);
    return;
}
FC_EcosimLevelPointConfig& ModifyEcosimLevelPointConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelPointConfig));
    return local_12.GetComp();
}
FC_EcosimLevelPointConfig& ModifyOrAddEcosimLevelPointConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelPointConfig));
    return local_12.GetComp();
}
const FC_EcosimLevelPointConfig& GetEcosimLevelPointConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelPointConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimLevelPointConfig GetEcosimLevelPointConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimLevelPointConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimLevelPointConfig::GetEcosimLevelPointConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimLevelPointConfig GetDefaultedEcosimLevelPointConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimLevelPointConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelPointConfig);
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
FC_EcosimLevelPointConfig GetDefaultedEcosimLevelPointConfig_BP(const FECSEntity &inout Entity)
{
    FC_EcosimLevelPointConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimLevelPointConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimLevelPointConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimLevelPointConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimLevelPointConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimLevelPointConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimLevelPointConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimLevelPointConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimLevelPointConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimLevelPointConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimLevelPointConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimLevelPointConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimLevelPointConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimLevelPointConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimLevelPointConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimLevelPointConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimLevelPointConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimLevelPointConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimLevelPointConfig, bFixedFrame, Details);
    return;
}
