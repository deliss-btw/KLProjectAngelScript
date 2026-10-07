
namespace __INTENRAL_FCS_BodyPartDestroyConditionManager_NS
{
    const TECSComponentDerivedPtr<FCS_BodyPartDestroyConditionManager> DerivedPtr = TECSComponentDerivedPtr<FCS_BodyPartDestroyConditionManager>();
    const FCS_BodyPartDestroyConditionManager DefaultValue = FCS_BodyPartDestroyConditionManager();

}
struct FBodyPartDestroyMonitorConditions
{
    UPROPERTY()
    TArray<FConditionInstanceHandle> ConditionInstances;

    FBodyPartDestroyMonitorConditions()
    {
        return;
    }
}

struct FCS_BodyPartDestroyConditionManager : FECSSingleton
{
    UPROPERTY()
    TMap<FName, FBodyPartDestroyMonitorConditions> MonitoredBodyParts;

    FCS_BodyPartDestroyConditionManager()
    {
        return;
    }
}

namespace ECSFunc_FCS_BodyPartDestroyConditionManager
{
UFUNCTION()
bool HasBodyPartDestroyConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_BodyPartDestroyConditionManager);
}
FCS_BodyPartDestroyConditionManager& AssignBodyPartDestroyConditionManager(const FECSWorldPtr &inout World, const FCS_BodyPartDestroyConditionManager &inout DefaultValue = FCS_BodyPartDestroyConditionManager())
{
    UScriptStruct local_6 = FCS_BodyPartDestroyConditionManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignBodyPartDestroyConditionManager_BP(const FECSWorldPtr &inout World, const FCS_BodyPartDestroyConditionManager &inout DefaultValue = FCS_BodyPartDestroyConditionManager())
{
    ECSFunc_FCS_BodyPartDestroyConditionManager::AssignBodyPartDestroyConditionManager(World, DefaultValue);
    return;
}
FCS_BodyPartDestroyConditionManager& ModifyBodyPartDestroyConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_BodyPartDestroyConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_BodyPartDestroyConditionManager& ModifyOrAddBodyPartDestroyConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_BodyPartDestroyConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_BodyPartDestroyConditionManager& GetBodyPartDestroyConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_BodyPartDestroyConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_BodyPartDestroyConditionManager GetBodyPartDestroyConditionManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_BodyPartDestroyConditionManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_BodyPartDestroyConditionManager::GetBodyPartDestroyConditionManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_BodyPartDestroyConditionManager GetDefaultedBodyPartDestroyConditionManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_BodyPartDestroyConditionManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_BodyPartDestroyConditionManager);
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
FCS_BodyPartDestroyConditionManager GetDefaultedBodyPartDestroyConditionManager_BP(const FECSWorldPtr &inout World)
{
    FCS_BodyPartDestroyConditionManager __r;
    return __r;
}
UFUNCTION()
bool RemoveBodyPartDestroyConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_BodyPartDestroyConditionManager);
}
}
void __MonitorBodyPartDestroyConditionManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_BodyPartDestroyConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBodyPartDestroyConditionManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_BodyPartDestroyConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBodyPartDestroyConditionManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_BodyPartDestroyConditionManager, bFixedFrame, Details);
    return;
}
