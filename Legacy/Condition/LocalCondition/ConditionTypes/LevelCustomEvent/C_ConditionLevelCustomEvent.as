
namespace __INTENRAL_FCS_LevelCustomEventConditionManager_NS
{
    const TECSComponentDerivedPtr<FCS_LevelCustomEventConditionManager> DerivedPtr = TECSComponentDerivedPtr<FCS_LevelCustomEventConditionManager>();
    const FCS_LevelCustomEventConditionManager DefaultValue = FCS_LevelCustomEventConditionManager();

}
struct FLevelCustomEventMonitorConditions
{
    UPROPERTY()
    TArray<FConditionInstanceHandle> ConditionInstances;

    FLevelCustomEventMonitorConditions()
    {
        return;
    }
}

struct FCS_LevelCustomEventConditionManager : FECSSingleton
{
    UPROPERTY()
    TMap<FName, FLevelCustomEventMonitorConditions> MonitoredEvents;

    FCS_LevelCustomEventConditionManager()
    {
        return;
    }
}

namespace ECSFunc_FCS_LevelCustomEventConditionManager
{
UFUNCTION()
bool HasLevelCustomEventConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LevelCustomEventConditionManager);
}
FCS_LevelCustomEventConditionManager& AssignLevelCustomEventConditionManager(const FECSWorldPtr &inout World, const FCS_LevelCustomEventConditionManager &inout DefaultValue = FCS_LevelCustomEventConditionManager())
{
    UScriptStruct local_6 = FCS_LevelCustomEventConditionManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLevelCustomEventConditionManager_BP(const FECSWorldPtr &inout World, const FCS_LevelCustomEventConditionManager &inout DefaultValue = FCS_LevelCustomEventConditionManager())
{
    ECSFunc_FCS_LevelCustomEventConditionManager::AssignLevelCustomEventConditionManager(World, DefaultValue);
    return;
}
FCS_LevelCustomEventConditionManager& ModifyLevelCustomEventConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelCustomEventConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LevelCustomEventConditionManager& ModifyOrAddLevelCustomEventConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelCustomEventConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LevelCustomEventConditionManager& GetLevelCustomEventConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelCustomEventConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LevelCustomEventConditionManager GetLevelCustomEventConditionManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_LevelCustomEventConditionManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_LevelCustomEventConditionManager::GetLevelCustomEventConditionManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_LevelCustomEventConditionManager GetDefaultedLevelCustomEventConditionManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LevelCustomEventConditionManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LevelCustomEventConditionManager);
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
FCS_LevelCustomEventConditionManager GetDefaultedLevelCustomEventConditionManager_BP(const FECSWorldPtr &inout World)
{
    FCS_LevelCustomEventConditionManager __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelCustomEventConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LevelCustomEventConditionManager);
}
}
void __MonitorLevelCustomEventConditionManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LevelCustomEventConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelCustomEventConditionManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LevelCustomEventConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelCustomEventConditionManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LevelCustomEventConditionManager, bFixedFrame, Details);
    return;
}
