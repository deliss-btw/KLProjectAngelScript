
namespace __INTENRAL_FCS_EntityDeathConditionManager_NS
{
    const TECSComponentDerivedPtr<FCS_EntityDeathConditionManager> DerivedPtr = TECSComponentDerivedPtr<FCS_EntityDeathConditionManager>();
    const FCS_EntityDeathConditionManager DefaultValue = FCS_EntityDeathConditionManager();

}
struct FEntityDeathMonitorConditions
{
    UPROPERTY()
    TArray<FConditionInstanceHandle> ConditionInstances;

    FEntityDeathMonitorConditions()
    {
        return;
    }
}

struct FCS_EntityDeathConditionManager : FECSSingleton
{
    UPROPERTY()
    TMap<TDataObjectPtr<FBasePrefabConfig>, FEntityDeathMonitorConditions> MonitoredPrefabs;

    FCS_EntityDeathConditionManager()
    {
        return;
    }
}

namespace ECSFunc_FCS_EntityDeathConditionManager
{
UFUNCTION()
bool HasEntityDeathConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EntityDeathConditionManager);
}
FCS_EntityDeathConditionManager& AssignEntityDeathConditionManager(const FECSWorldPtr &inout World, const FCS_EntityDeathConditionManager &inout DefaultValue = FCS_EntityDeathConditionManager())
{
    UScriptStruct local_6 = FCS_EntityDeathConditionManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEntityDeathConditionManager_BP(const FECSWorldPtr &inout World, const FCS_EntityDeathConditionManager &inout DefaultValue = FCS_EntityDeathConditionManager())
{
    ECSFunc_FCS_EntityDeathConditionManager::AssignEntityDeathConditionManager(World, DefaultValue);
    return;
}
FCS_EntityDeathConditionManager& ModifyEntityDeathConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EntityDeathConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EntityDeathConditionManager& ModifyOrAddEntityDeathConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EntityDeathConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EntityDeathConditionManager& GetEntityDeathConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EntityDeathConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EntityDeathConditionManager GetEntityDeathConditionManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EntityDeathConditionManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_EntityDeathConditionManager::GetEntityDeathConditionManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EntityDeathConditionManager GetDefaultedEntityDeathConditionManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EntityDeathConditionManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EntityDeathConditionManager);
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
FCS_EntityDeathConditionManager GetDefaultedEntityDeathConditionManager_BP(const FECSWorldPtr &inout World)
{
    FCS_EntityDeathConditionManager __r;
    return __r;
}
UFUNCTION()
bool RemoveEntityDeathConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EntityDeathConditionManager);
}
}
void __MonitorEntityDeathConditionManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EntityDeathConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityDeathConditionManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EntityDeathConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityDeathConditionManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EntityDeathConditionManager, bFixedFrame, Details);
    return;
}
