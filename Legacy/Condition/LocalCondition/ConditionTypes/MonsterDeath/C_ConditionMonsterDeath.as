
namespace __INTENRAL_FCS_ConditionMonsterDeathManager_NS
{
    const TECSComponentDerivedPtr<FCS_ConditionMonsterDeathManager> DerivedPtr = TECSComponentDerivedPtr<FCS_ConditionMonsterDeathManager>();
    const FCS_ConditionMonsterDeathManager DefaultValue = FCS_ConditionMonsterDeathManager();

}
struct FMonsterDeathMonitorConditions
{
    UPROPERTY()
    TArray<FConditionInstanceHandle> ConditionInstances;

    FMonsterDeathMonitorConditions()
    {
        return;
    }
}

struct FCS_ConditionMonsterDeathManager : FECSSingleton
{
    UPROPERTY()
    TMap<TDataObjectPtr<FMonsterMainConfig>, FMonsterDeathMonitorConditions> MonitoredMonsters;

    FCS_ConditionMonsterDeathManager()
    {
        return;
    }
}

namespace ECSFunc_FCS_ConditionMonsterDeathManager
{
UFUNCTION()
bool HasConditionMonsterDeathManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_ConditionMonsterDeathManager);
}
FCS_ConditionMonsterDeathManager& AssignConditionMonsterDeathManager(const FECSWorldPtr &inout World, const FCS_ConditionMonsterDeathManager &inout DefaultValue = FCS_ConditionMonsterDeathManager())
{
    UScriptStruct local_6 = FCS_ConditionMonsterDeathManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignConditionMonsterDeathManager_BP(const FECSWorldPtr &inout World, const FCS_ConditionMonsterDeathManager &inout DefaultValue = FCS_ConditionMonsterDeathManager())
{
    ECSFunc_FCS_ConditionMonsterDeathManager::AssignConditionMonsterDeathManager(World, DefaultValue);
    return;
}
FCS_ConditionMonsterDeathManager& ModifyConditionMonsterDeathManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ConditionMonsterDeathManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_ConditionMonsterDeathManager& ModifyOrAddConditionMonsterDeathManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ConditionMonsterDeathManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_ConditionMonsterDeathManager& GetConditionMonsterDeathManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ConditionMonsterDeathManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_ConditionMonsterDeathManager GetConditionMonsterDeathManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_ConditionMonsterDeathManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_ConditionMonsterDeathManager::GetConditionMonsterDeathManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_ConditionMonsterDeathManager GetDefaultedConditionMonsterDeathManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_ConditionMonsterDeathManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_ConditionMonsterDeathManager);
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
FCS_ConditionMonsterDeathManager GetDefaultedConditionMonsterDeathManager_BP(const FECSWorldPtr &inout World)
{
    FCS_ConditionMonsterDeathManager __r;
    return __r;
}
UFUNCTION()
bool RemoveConditionMonsterDeathManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_ConditionMonsterDeathManager);
}
}
void __MonitorConditionMonsterDeathManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_ConditionMonsterDeathManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorConditionMonsterDeathManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_ConditionMonsterDeathManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorConditionMonsterDeathManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_ConditionMonsterDeathManager, bFixedFrame, Details);
    return;
}
