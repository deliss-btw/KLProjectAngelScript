
namespace __INTENRAL_FCS_LevelCustomValueEventConditionManager_NS
{
    const TECSComponentDerivedPtr<FCS_LevelCustomValueEventConditionManager> DerivedPtr = TECSComponentDerivedPtr<FCS_LevelCustomValueEventConditionManager>();
    const FCS_LevelCustomValueEventConditionManager DefaultValue = FCS_LevelCustomValueEventConditionManager();

}
struct FLevelCustomValueEventMonitorConditions
{
    UPROPERTY()
    TArray<FConditionInstanceHandle> ConditionInstances;

    FLevelCustomValueEventMonitorConditions()
    {
        return;
    }
}

struct FCS_LevelCustomValueEventConditionManager : FECSSingleton
{
    UPROPERTY()
    TMap<FName, FLevelCustomValueEventMonitorConditions> MonitoredEvents;

    FCS_LevelCustomValueEventConditionManager()
    {
        return;
    }
}

namespace ECSFunc_FCS_LevelCustomValueEventConditionManager
{
UFUNCTION()
bool HasLevelCustomValueEventConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LevelCustomValueEventConditionManager);
}
FCS_LevelCustomValueEventConditionManager& AssignLevelCustomValueEventConditionManager(const FECSWorldPtr &inout World, const FCS_LevelCustomValueEventConditionManager &inout DefaultValue = FCS_LevelCustomValueEventConditionManager())
{
    UScriptStruct local_6 = FCS_LevelCustomValueEventConditionManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLevelCustomValueEventConditionManager_BP(const FECSWorldPtr &inout World, const FCS_LevelCustomValueEventConditionManager &inout DefaultValue = FCS_LevelCustomValueEventConditionManager())
{
    ECSFunc_FCS_LevelCustomValueEventConditionManager::AssignLevelCustomValueEventConditionManager(World, DefaultValue);
    return;
}
FCS_LevelCustomValueEventConditionManager& ModifyLevelCustomValueEventConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelCustomValueEventConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LevelCustomValueEventConditionManager& ModifyOrAddLevelCustomValueEventConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelCustomValueEventConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LevelCustomValueEventConditionManager& GetLevelCustomValueEventConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelCustomValueEventConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LevelCustomValueEventConditionManager GetLevelCustomValueEventConditionManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_LevelCustomValueEventConditionManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_LevelCustomValueEventConditionManager::GetLevelCustomValueEventConditionManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_LevelCustomValueEventConditionManager GetDefaultedLevelCustomValueEventConditionManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LevelCustomValueEventConditionManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LevelCustomValueEventConditionManager);
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
FCS_LevelCustomValueEventConditionManager GetDefaultedLevelCustomValueEventConditionManager_BP(const FECSWorldPtr &inout World)
{
    FCS_LevelCustomValueEventConditionManager __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelCustomValueEventConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LevelCustomValueEventConditionManager);
}
}
void __MonitorLevelCustomValueEventConditionManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LevelCustomValueEventConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelCustomValueEventConditionManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LevelCustomValueEventConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelCustomValueEventConditionManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LevelCustomValueEventConditionManager, bFixedFrame, Details);
    return;
}
