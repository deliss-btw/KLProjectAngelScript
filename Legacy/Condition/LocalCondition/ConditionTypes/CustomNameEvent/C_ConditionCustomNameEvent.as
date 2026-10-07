
namespace __INTENRAL_FCS_CustomNameEventConditionManager_NS
{
    const TECSComponentDerivedPtr<FCS_CustomNameEventConditionManager> DerivedPtr = TECSComponentDerivedPtr<FCS_CustomNameEventConditionManager>();
    const FCS_CustomNameEventConditionManager DefaultValue = FCS_CustomNameEventConditionManager();

}
struct FCustomNameEventMonitorConditions
{
    UPROPERTY()
    TArray<FConditionInstanceHandle> ConditionInstances;

    FCustomNameEventMonitorConditions()
    {
        return;
    }
}

struct FCS_CustomNameEventConditionManager : FECSSingleton
{
    UPROPERTY()
    TMap<FName, FCustomNameEventMonitorConditions> MonitoredEvents;

    FCS_CustomNameEventConditionManager()
    {
        return;
    }
}

namespace ECSFunc_FCS_CustomNameEventConditionManager
{
UFUNCTION()
bool HasCustomNameEventConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CustomNameEventConditionManager);
}
FCS_CustomNameEventConditionManager& AssignCustomNameEventConditionManager(const FECSWorldPtr &inout World, const FCS_CustomNameEventConditionManager &inout DefaultValue = FCS_CustomNameEventConditionManager())
{
    UScriptStruct local_6 = FCS_CustomNameEventConditionManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCustomNameEventConditionManager_BP(const FECSWorldPtr &inout World, const FCS_CustomNameEventConditionManager &inout DefaultValue = FCS_CustomNameEventConditionManager())
{
    ECSFunc_FCS_CustomNameEventConditionManager::AssignCustomNameEventConditionManager(World, DefaultValue);
    return;
}
FCS_CustomNameEventConditionManager& ModifyCustomNameEventConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CustomNameEventConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CustomNameEventConditionManager& ModifyOrAddCustomNameEventConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CustomNameEventConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CustomNameEventConditionManager& GetCustomNameEventConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CustomNameEventConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CustomNameEventConditionManager GetCustomNameEventConditionManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_CustomNameEventConditionManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_CustomNameEventConditionManager::GetCustomNameEventConditionManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_CustomNameEventConditionManager GetDefaultedCustomNameEventConditionManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CustomNameEventConditionManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CustomNameEventConditionManager);
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
FCS_CustomNameEventConditionManager GetDefaultedCustomNameEventConditionManager_BP(const FECSWorldPtr &inout World)
{
    FCS_CustomNameEventConditionManager __r;
    return __r;
}
UFUNCTION()
bool RemoveCustomNameEventConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CustomNameEventConditionManager);
}
}
void __MonitorCustomNameEventConditionManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CustomNameEventConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCustomNameEventConditionManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CustomNameEventConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCustomNameEventConditionManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CustomNameEventConditionManager, bFixedFrame, Details);
    return;
}
