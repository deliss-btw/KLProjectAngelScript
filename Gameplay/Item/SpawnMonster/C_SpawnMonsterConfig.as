
namespace __INTENRAL_FC_SpawnMonsterOnDeathTag_NS
{
    const TECSComponentDerivedPtr<FC_SpawnMonsterOnDeathTag> DerivedPtr = TECSComponentDerivedPtr<FC_SpawnMonsterOnDeathTag>();
    const FC_SpawnMonsterOnDeathTag DefaultValue = FC_SpawnMonsterOnDeathTag();
}
namespace __INTENRAL_FC_SpawnMonsterOnSpawnTag_NS
{
    const TECSComponentDerivedPtr<FC_SpawnMonsterOnSpawnTag> DerivedPtr = TECSComponentDerivedPtr<FC_SpawnMonsterOnSpawnTag>();
    const FC_SpawnMonsterOnSpawnTag DefaultValue = FC_SpawnMonsterOnSpawnTag();
}
namespace __INTENRAL_FC_SpawnMonsterConfig_NS
{
    const TECSComponentDerivedPtr<FC_SpawnMonsterConfig> DerivedPtr = TECSComponentDerivedPtr<FC_SpawnMonsterConfig>();
    const FC_SpawnMonsterConfig DefaultValue = FC_SpawnMonsterConfig();

}
struct FSpawnMonsterConfigItem
{
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> MonsterConfig;
    UPROPERTY()
    float32 SpawnProbability = 1.0f;
    UPROPERTY()
    uint8 OverrideESMEntryStateMachineIndex = false;
    UPROPERTY()
    FName OverrideESMEntryStateName = NAME_None;
    UPROPERTY()
    FVector LocationOffset;
    UPROPERTY()
    FRotator RotationOffset;
    UPROPERTY()
    float32 MaxNearbyRadius = 500.0f;
    UPROPERTY()
    float32 StepLength = 50.0f;


}

struct FC_SpawnMonsterOnDeathTag : FECSComponent
{
    FC_SpawnMonsterOnDeathTag()
    {
        return;
    }
}

struct FC_SpawnMonsterOnSpawnTag : FECSComponent
{
    FC_SpawnMonsterOnSpawnTag()
    {
        return;
    }
}

struct FC_SpawnMonsterConfig : FECSComponent
{
    UPROPERTY()
    bool bAutoSpawnOnDeath = false;
    UPROPERTY()
    bool bAutoSpawnOnSpawn = false;
    UPROPERTY()
    TArray<FSpawnMonsterConfigItem> SpawnMonsterConfigs;


    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        if (this.bAutoSpawnOnDeath)
        {
            FC_SpawnMonsterOnDeathTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
        }
        if (this.bAutoSpawnOnSpawn)
        {
            FC_SpawnMonsterOnSpawnTag local_14;
            Assign local_12;
            local_12.opCall(local_14);
        }
        return;
    }
}

namespace ECSFunc_FC_SpawnMonsterOnDeathTag
{
UFUNCTION()
bool HasSpawnMonsterOnDeathTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterOnDeathTag);
}
FC_SpawnMonsterOnDeathTag& AssignSpawnMonsterOnDeathTag(const FECSEntity &inout Entity, const FC_SpawnMonsterOnDeathTag &inout DefaultValue = FC_SpawnMonsterOnDeathTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterOnDeathTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSpawnMonsterOnDeathTag_BP(const FECSEntity &inout Entity, const FC_SpawnMonsterOnDeathTag &inout DefaultValue = FC_SpawnMonsterOnDeathTag())
{
    ECSFunc_FC_SpawnMonsterOnDeathTag::AssignSpawnMonsterOnDeathTag(Entity, DefaultValue);
    return;
}
FC_SpawnMonsterOnDeathTag& ModifySpawnMonsterOnDeathTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterOnDeathTag));
    return local_12.GetComp();
}
FC_SpawnMonsterOnDeathTag& ModifyOrAddSpawnMonsterOnDeathTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterOnDeathTag));
    return local_12.GetComp();
}
const FC_SpawnMonsterOnDeathTag& GetSpawnMonsterOnDeathTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterOnDeathTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_SpawnMonsterOnDeathTag GetSpawnMonsterOnDeathTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SpawnMonsterOnDeathTag& local_4 = ECSFunc_FC_SpawnMonsterOnDeathTag::GetSpawnMonsterOnDeathTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SpawnMonsterOnDeathTag();
}
const FC_SpawnMonsterOnDeathTag GetDefaultedSpawnMonsterOnDeathTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SpawnMonsterOnDeathTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterOnDeathTag);
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
FC_SpawnMonsterOnDeathTag GetDefaultedSpawnMonsterOnDeathTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SpawnMonsterOnDeathTag::GetDefaultedSpawnMonsterOnDeathTag(Entity);
}
UFUNCTION()
bool RemoveSpawnMonsterOnDeathTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterOnDeathTag);
}
}
FECSMonitorRuntimeView __GetMonitorSpawnMonsterOnDeathTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SpawnMonsterOnDeathTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnMonsterOnDeathTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SpawnMonsterOnDeathTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnMonsterOnDeathTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SpawnMonsterOnDeathTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnMonsterOnDeathTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SpawnMonsterOnDeathTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnMonsterOnDeathTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SpawnMonsterOnDeathTag, bFixedFrame, bMustHandleAll);
}
void __MonitorSpawnMonsterOnDeathTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SpawnMonsterOnDeathTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnMonsterOnDeathTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SpawnMonsterOnDeathTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnMonsterOnDeathTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SpawnMonsterOnDeathTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SpawnMonsterOnSpawnTag
{
UFUNCTION()
bool HasSpawnMonsterOnSpawnTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterOnSpawnTag);
}
FC_SpawnMonsterOnSpawnTag& AssignSpawnMonsterOnSpawnTag(const FECSEntity &inout Entity, const FC_SpawnMonsterOnSpawnTag &inout DefaultValue = FC_SpawnMonsterOnSpawnTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterOnSpawnTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSpawnMonsterOnSpawnTag_BP(const FECSEntity &inout Entity, const FC_SpawnMonsterOnSpawnTag &inout DefaultValue = FC_SpawnMonsterOnSpawnTag())
{
    ECSFunc_FC_SpawnMonsterOnSpawnTag::AssignSpawnMonsterOnSpawnTag(Entity, DefaultValue);
    return;
}
FC_SpawnMonsterOnSpawnTag& ModifySpawnMonsterOnSpawnTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterOnSpawnTag));
    return local_12.GetComp();
}
FC_SpawnMonsterOnSpawnTag& ModifyOrAddSpawnMonsterOnSpawnTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterOnSpawnTag));
    return local_12.GetComp();
}
const FC_SpawnMonsterOnSpawnTag& GetSpawnMonsterOnSpawnTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterOnSpawnTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_SpawnMonsterOnSpawnTag GetSpawnMonsterOnSpawnTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SpawnMonsterOnSpawnTag& local_4 = ECSFunc_FC_SpawnMonsterOnSpawnTag::GetSpawnMonsterOnSpawnTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SpawnMonsterOnSpawnTag();
}
const FC_SpawnMonsterOnSpawnTag GetDefaultedSpawnMonsterOnSpawnTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SpawnMonsterOnSpawnTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterOnSpawnTag);
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
FC_SpawnMonsterOnSpawnTag GetDefaultedSpawnMonsterOnSpawnTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SpawnMonsterOnSpawnTag::GetDefaultedSpawnMonsterOnSpawnTag(Entity);
}
UFUNCTION()
bool RemoveSpawnMonsterOnSpawnTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterOnSpawnTag);
}
}
FECSMonitorRuntimeView __GetMonitorSpawnMonsterOnSpawnTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SpawnMonsterOnSpawnTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnMonsterOnSpawnTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SpawnMonsterOnSpawnTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnMonsterOnSpawnTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SpawnMonsterOnSpawnTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnMonsterOnSpawnTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SpawnMonsterOnSpawnTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnMonsterOnSpawnTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SpawnMonsterOnSpawnTag, bFixedFrame, bMustHandleAll);
}
void __MonitorSpawnMonsterOnSpawnTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SpawnMonsterOnSpawnTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnMonsterOnSpawnTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SpawnMonsterOnSpawnTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnMonsterOnSpawnTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SpawnMonsterOnSpawnTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SpawnMonsterConfig
{
UFUNCTION()
bool HasSpawnMonsterConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterConfig);
}
FC_SpawnMonsterConfig& AssignSpawnMonsterConfig(const FECSEntity &inout Entity, const FC_SpawnMonsterConfig &inout DefaultValue = FC_SpawnMonsterConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSpawnMonsterConfig_BP(const FECSEntity &inout Entity, const FC_SpawnMonsterConfig &inout DefaultValue = FC_SpawnMonsterConfig())
{
    ECSFunc_FC_SpawnMonsterConfig::AssignSpawnMonsterConfig(Entity, DefaultValue);
    return;
}
FC_SpawnMonsterConfig& ModifySpawnMonsterConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterConfig));
    return local_12.GetComp();
}
FC_SpawnMonsterConfig& ModifyOrAddSpawnMonsterConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterConfig));
    return local_12.GetComp();
}
const FC_SpawnMonsterConfig& GetSpawnMonsterConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_SpawnMonsterConfig GetSpawnMonsterConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SpawnMonsterConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_SpawnMonsterConfig::GetSpawnMonsterConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SpawnMonsterConfig GetDefaultedSpawnMonsterConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SpawnMonsterConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterConfig);
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
FC_SpawnMonsterConfig GetDefaultedSpawnMonsterConfig_BP(const FECSEntity &inout Entity)
{
    FC_SpawnMonsterConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveSpawnMonsterConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SpawnMonsterConfig);
}
}
FECSMonitorRuntimeView __GetMonitorSpawnMonsterConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SpawnMonsterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnMonsterConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SpawnMonsterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnMonsterConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SpawnMonsterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnMonsterConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SpawnMonsterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnMonsterConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SpawnMonsterConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorSpawnMonsterConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SpawnMonsterConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnMonsterConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SpawnMonsterConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnMonsterConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SpawnMonsterConfig, bFixedFrame, Details);
    return;
}
