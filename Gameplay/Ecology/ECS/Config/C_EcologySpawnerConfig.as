
namespace __INTENRAL_FC_EcologySpawnerConfig_NS
{
    const TECSComponentDerivedPtr<FC_EcologySpawnerConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EcologySpawnerConfig>();
    const FC_EcologySpawnerConfig DefaultValue = FC_EcologySpawnerConfig();
}
namespace __INTENRAL_FC_EntitySpawnInitEntryConfig_NS
{
    const TECSComponentDerivedPtr<FC_EntitySpawnInitEntryConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EntitySpawnInitEntryConfig>();
    const FC_EntitySpawnInitEntryConfig DefaultValue = FC_EntitySpawnInitEntryConfig();

}
struct FC_EcologySpawnerConfig : FECSComponent
{
    UPROPERTY()
    FVirtualConfigData SpawnerConfig;

    FC_EcologySpawnerConfig()
    {
        return;
    }
}

struct FEntitySpawnInitEntry
{
    UPROPERTY()
    FName InitEntryName;
    UPROPERTY()
    FESMEntryStateOverrideParam ESMEntryStateOverride;

    FEntitySpawnInitEntry()
    {
        return;
    }
    bool HasESMOverride() const
    {
        return (!((FName(this.ESMEntryStateOverride.EntryState) == NAME_None)));
    }
}

struct FC_EntitySpawnInitEntryConfig : FECSComponent
{
    UPROPERTY()
    TArray<FEntitySpawnInitEntry> SpawnInitEntries;

    FC_EntitySpawnInitEntryConfig()
    {
        return;
    }
}

struct FT_EntitySpawnInit : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EntitySpawnInitEntryConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EntitySpawnInitEntryConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_EntitySpawnInitEntryConfig = false;
    UPROPERTY()
    FC_EntitySpawnInitEntryConfig Config_FC_EntitySpawnInitEntryConfig;


}

namespace ECSFunc_FC_EcologySpawnerConfig
{
UFUNCTION()
bool HasEcologySpawnerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologySpawnerConfig);
}
FC_EcologySpawnerConfig& AssignEcologySpawnerConfig(const FECSEntity &inout Entity, const FC_EcologySpawnerConfig &inout DefaultValue = FC_EcologySpawnerConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologySpawnerConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologySpawnerConfig_BP(const FECSEntity &inout Entity, const FC_EcologySpawnerConfig &inout DefaultValue = FC_EcologySpawnerConfig())
{
    ECSFunc_FC_EcologySpawnerConfig::AssignEcologySpawnerConfig(Entity, DefaultValue);
    return;
}
FC_EcologySpawnerConfig& ModifyEcologySpawnerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologySpawnerConfig));
    return local_12.GetComp();
}
FC_EcologySpawnerConfig& ModifyOrAddEcologySpawnerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologySpawnerConfig));
    return local_12.GetComp();
}
const FC_EcologySpawnerConfig& GetEcologySpawnerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologySpawnerConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologySpawnerConfig GetEcologySpawnerConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologySpawnerConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologySpawnerConfig::GetEcologySpawnerConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologySpawnerConfig GetDefaultedEcologySpawnerConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologySpawnerConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologySpawnerConfig);
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
FC_EcologySpawnerConfig GetDefaultedEcologySpawnerConfig_BP(const FECSEntity &inout Entity)
{
    FC_EcologySpawnerConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologySpawnerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologySpawnerConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEcologySpawnerConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologySpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologySpawnerConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologySpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologySpawnerConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologySpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologySpawnerConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologySpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologySpawnerConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologySpawnerConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologySpawnerConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologySpawnerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologySpawnerConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologySpawnerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologySpawnerConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologySpawnerConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EntitySpawnInitEntryConfig
{
UFUNCTION()
bool HasEntitySpawnInitEntryConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EntitySpawnInitEntryConfig);
}
FC_EntitySpawnInitEntryConfig& AssignEntitySpawnInitEntryConfig(const FECSEntity &inout Entity, const FC_EntitySpawnInitEntryConfig &inout DefaultValue = FC_EntitySpawnInitEntryConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EntitySpawnInitEntryConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEntitySpawnInitEntryConfig_BP(const FECSEntity &inout Entity, const FC_EntitySpawnInitEntryConfig &inout DefaultValue = FC_EntitySpawnInitEntryConfig())
{
    ECSFunc_FC_EntitySpawnInitEntryConfig::AssignEntitySpawnInitEntryConfig(Entity, DefaultValue);
    return;
}
FC_EntitySpawnInitEntryConfig& ModifyEntitySpawnInitEntryConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EntitySpawnInitEntryConfig));
    return local_12.GetComp();
}
FC_EntitySpawnInitEntryConfig& ModifyOrAddEntitySpawnInitEntryConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EntitySpawnInitEntryConfig));
    return local_12.GetComp();
}
const FC_EntitySpawnInitEntryConfig& GetEntitySpawnInitEntryConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EntitySpawnInitEntryConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EntitySpawnInitEntryConfig GetEntitySpawnInitEntryConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EntitySpawnInitEntryConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EntitySpawnInitEntryConfig::GetEntitySpawnInitEntryConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EntitySpawnInitEntryConfig GetDefaultedEntitySpawnInitEntryConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EntitySpawnInitEntryConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EntitySpawnInitEntryConfig);
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
FC_EntitySpawnInitEntryConfig GetDefaultedEntitySpawnInitEntryConfig_BP(const FECSEntity &inout Entity)
{
    FC_EntitySpawnInitEntryConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEntitySpawnInitEntryConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EntitySpawnInitEntryConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEntitySpawnInitEntryConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EntitySpawnInitEntryConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntitySpawnInitEntryConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EntitySpawnInitEntryConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntitySpawnInitEntryConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EntitySpawnInitEntryConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntitySpawnInitEntryConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EntitySpawnInitEntryConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntitySpawnInitEntryConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EntitySpawnInitEntryConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEntitySpawnInitEntryConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EntitySpawnInitEntryConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntitySpawnInitEntryConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EntitySpawnInitEntryConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntitySpawnInitEntryConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EntitySpawnInitEntryConfig, bFixedFrame, Details);
    return;
}
