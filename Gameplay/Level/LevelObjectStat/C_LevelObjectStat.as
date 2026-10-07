
namespace __INTENRAL_FC_LevelObjectStatConfig_NS
{
    const TECSComponentDerivedPtr<FC_LevelObjectStatConfig> DerivedPtr = TECSComponentDerivedPtr<FC_LevelObjectStatConfig>();
    const FC_LevelObjectStatConfig DefaultValue = FC_LevelObjectStatConfig();
}
namespace __INTENRAL_FCS_LevelObjectStatIdToEntityMap_NS
{
    const TECSComponentDerivedPtr<FCS_LevelObjectStatIdToEntityMap> DerivedPtr = TECSComponentDerivedPtr<FCS_LevelObjectStatIdToEntityMap>();
    const FCS_LevelObjectStatIdToEntityMap DefaultValue = FCS_LevelObjectStatIdToEntityMap();
}
namespace __INTENRAL_FC_LevelObjectStatNeedInitTag_NS
{
    const TECSComponentDerivedPtr<FC_LevelObjectStatNeedInitTag> DerivedPtr = TECSComponentDerivedPtr<FC_LevelObjectStatNeedInitTag>();
    const FC_LevelObjectStatNeedInitTag DefaultValue = FC_LevelObjectStatNeedInitTag();

}
struct FC_LevelObjectStatConfig : FECSComponent
{
    UPROPERTY()
    TDataObjectPtr<FLevelObjectStatConfig> LevelObjectStatConfig;

    FC_LevelObjectStatConfig()
    {
        return;
    }
}

struct FCS_LevelObjectStatIdToEntityMap : FECSSingleton
{
    UPROPERTY()
    TMap<int, FECSEntityId> LevelObjectStatIdToEntityMap;

    FCS_LevelObjectStatIdToEntityMap()
    {
        return;
    }
}

struct FC_LevelObjectStatNeedInitTag : FECSComponent
{
    FC_LevelObjectStatNeedInitTag()
    {
        return;
    }
}

namespace ECSFunc_FC_LevelObjectStatConfig
{
UFUNCTION()
bool HasLevelObjectStatConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatConfig);
}
FC_LevelObjectStatConfig& AssignLevelObjectStatConfig(const FECSEntity &inout Entity, const FC_LevelObjectStatConfig &inout DefaultValue = FC_LevelObjectStatConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelObjectStatConfig_BP(const FECSEntity &inout Entity, const FC_LevelObjectStatConfig &inout DefaultValue = FC_LevelObjectStatConfig())
{
    ECSFunc_FC_LevelObjectStatConfig::AssignLevelObjectStatConfig(Entity, DefaultValue);
    return;
}
FC_LevelObjectStatConfig& ModifyLevelObjectStatConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatConfig));
    return local_12.GetComp();
}
FC_LevelObjectStatConfig& ModifyOrAddLevelObjectStatConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatConfig));
    return local_12.GetComp();
}
const FC_LevelObjectStatConfig& GetLevelObjectStatConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelObjectStatConfig GetLevelObjectStatConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LevelObjectStatConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_LevelObjectStatConfig::GetLevelObjectStatConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LevelObjectStatConfig GetDefaultedLevelObjectStatConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelObjectStatConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatConfig);
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
FC_LevelObjectStatConfig GetDefaultedLevelObjectStatConfig_BP(const FECSEntity &inout Entity)
{
    FC_LevelObjectStatConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelObjectStatConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatConfig);
}
}
FECSMonitorRuntimeView __GetMonitorLevelObjectStatConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelObjectStatConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelObjectStatConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelObjectStatConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelObjectStatConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelObjectStatConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelObjectStatConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelObjectStatConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelObjectStatConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelObjectStatConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelObjectStatConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelObjectStatConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelObjectStatConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelObjectStatConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelObjectStatConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelObjectStatConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_LevelObjectStatIdToEntityMap
{
UFUNCTION()
bool HasLevelObjectStatIdToEntityMap(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LevelObjectStatIdToEntityMap);
}
FCS_LevelObjectStatIdToEntityMap& AssignLevelObjectStatIdToEntityMap(const FECSWorldPtr &inout World, const FCS_LevelObjectStatIdToEntityMap &inout DefaultValue = FCS_LevelObjectStatIdToEntityMap())
{
    UScriptStruct local_6 = FCS_LevelObjectStatIdToEntityMap;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLevelObjectStatIdToEntityMap_BP(const FECSWorldPtr &inout World, const FCS_LevelObjectStatIdToEntityMap &inout DefaultValue = FCS_LevelObjectStatIdToEntityMap())
{
    ECSFunc_FCS_LevelObjectStatIdToEntityMap::AssignLevelObjectStatIdToEntityMap(World, DefaultValue);
    return;
}
FCS_LevelObjectStatIdToEntityMap& ModifyLevelObjectStatIdToEntityMap(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelObjectStatIdToEntityMap;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LevelObjectStatIdToEntityMap& ModifyOrAddLevelObjectStatIdToEntityMap(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelObjectStatIdToEntityMap;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LevelObjectStatIdToEntityMap& GetLevelObjectStatIdToEntityMap(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelObjectStatIdToEntityMap;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LevelObjectStatIdToEntityMap GetLevelObjectStatIdToEntityMap_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_LevelObjectStatIdToEntityMap __r;
    bValid = false;
    bValid = ECSFunc_FCS_LevelObjectStatIdToEntityMap::GetLevelObjectStatIdToEntityMap(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_LevelObjectStatIdToEntityMap GetDefaultedLevelObjectStatIdToEntityMap(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LevelObjectStatIdToEntityMap __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LevelObjectStatIdToEntityMap);
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
FCS_LevelObjectStatIdToEntityMap GetDefaultedLevelObjectStatIdToEntityMap_BP(const FECSWorldPtr &inout World)
{
    FCS_LevelObjectStatIdToEntityMap __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelObjectStatIdToEntityMap(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LevelObjectStatIdToEntityMap);
}
}
void __MonitorLevelObjectStatIdToEntityMapLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LevelObjectStatIdToEntityMap, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelObjectStatIdToEntityMapActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LevelObjectStatIdToEntityMap, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelObjectStatIdToEntityMapModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LevelObjectStatIdToEntityMap, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelObjectStatNeedInitTag
{
UFUNCTION()
bool HasLevelObjectStatNeedInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatNeedInitTag);
}
FC_LevelObjectStatNeedInitTag& AssignLevelObjectStatNeedInitTag(const FECSEntity &inout Entity, const FC_LevelObjectStatNeedInitTag &inout DefaultValue = FC_LevelObjectStatNeedInitTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatNeedInitTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelObjectStatNeedInitTag_BP(const FECSEntity &inout Entity, const FC_LevelObjectStatNeedInitTag &inout DefaultValue = FC_LevelObjectStatNeedInitTag())
{
    ECSFunc_FC_LevelObjectStatNeedInitTag::AssignLevelObjectStatNeedInitTag(Entity, DefaultValue);
    return;
}
FC_LevelObjectStatNeedInitTag& ModifyLevelObjectStatNeedInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatNeedInitTag));
    return local_12.GetComp();
}
FC_LevelObjectStatNeedInitTag& ModifyOrAddLevelObjectStatNeedInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatNeedInitTag));
    return local_12.GetComp();
}
const FC_LevelObjectStatNeedInitTag& GetLevelObjectStatNeedInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatNeedInitTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelObjectStatNeedInitTag GetLevelObjectStatNeedInitTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LevelObjectStatNeedInitTag& local_4 = ECSFunc_FC_LevelObjectStatNeedInitTag::GetLevelObjectStatNeedInitTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LevelObjectStatNeedInitTag();
}
const FC_LevelObjectStatNeedInitTag GetDefaultedLevelObjectStatNeedInitTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelObjectStatNeedInitTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatNeedInitTag);
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
FC_LevelObjectStatNeedInitTag GetDefaultedLevelObjectStatNeedInitTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LevelObjectStatNeedInitTag::GetDefaultedLevelObjectStatNeedInitTag(Entity);
}
UFUNCTION()
bool RemoveLevelObjectStatNeedInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatNeedInitTag);
}
}
FECSMonitorRuntimeView __GetMonitorLevelObjectStatNeedInitTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelObjectStatNeedInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelObjectStatNeedInitTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelObjectStatNeedInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelObjectStatNeedInitTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelObjectStatNeedInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelObjectStatNeedInitTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelObjectStatNeedInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelObjectStatNeedInitTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelObjectStatNeedInitTag, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelObjectStatNeedInitTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelObjectStatNeedInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelObjectStatNeedInitTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelObjectStatNeedInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelObjectStatNeedInitTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelObjectStatNeedInitTag, bFixedFrame, Details);
    return;
}
