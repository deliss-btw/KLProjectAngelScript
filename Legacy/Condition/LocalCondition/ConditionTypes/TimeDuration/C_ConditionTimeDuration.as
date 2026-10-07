
namespace __INTENRAL_FCS_TimeDurationConditionManager_NS
{
    const TECSComponentDerivedPtr<FCS_TimeDurationConditionManager> DerivedPtr = TECSComponentDerivedPtr<FCS_TimeDurationConditionManager>();
    const FCS_TimeDurationConditionManager DefaultValue = FCS_TimeDurationConditionManager();

}
struct FCS_TimeDurationConditionManager : FECSSingleton
{
    UPROPERTY()
    TArray<FConditionInstanceHandle> ConditionInstances;

    FCS_TimeDurationConditionManager()
    {
        return;
    }
}

namespace ECSFunc_FCS_TimeDurationConditionManager
{
UFUNCTION()
bool HasTimeDurationConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TimeDurationConditionManager);
}
FCS_TimeDurationConditionManager& AssignTimeDurationConditionManager(const FECSWorldPtr &inout World, const FCS_TimeDurationConditionManager &inout DefaultValue = FCS_TimeDurationConditionManager())
{
    UScriptStruct local_6 = FCS_TimeDurationConditionManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTimeDurationConditionManager_BP(const FECSWorldPtr &inout World, const FCS_TimeDurationConditionManager &inout DefaultValue = FCS_TimeDurationConditionManager())
{
    ECSFunc_FCS_TimeDurationConditionManager::AssignTimeDurationConditionManager(World, DefaultValue);
    return;
}
FCS_TimeDurationConditionManager& ModifyTimeDurationConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TimeDurationConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TimeDurationConditionManager& ModifyOrAddTimeDurationConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TimeDurationConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TimeDurationConditionManager& GetTimeDurationConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TimeDurationConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TimeDurationConditionManager GetTimeDurationConditionManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_TimeDurationConditionManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_TimeDurationConditionManager::GetTimeDurationConditionManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_TimeDurationConditionManager GetDefaultedTimeDurationConditionManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TimeDurationConditionManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TimeDurationConditionManager);
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
FCS_TimeDurationConditionManager GetDefaultedTimeDurationConditionManager_BP(const FECSWorldPtr &inout World)
{
    FCS_TimeDurationConditionManager __r;
    return __r;
}
UFUNCTION()
bool RemoveTimeDurationConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TimeDurationConditionManager);
}
}
void __MonitorTimeDurationConditionManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TimeDurationConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTimeDurationConditionManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TimeDurationConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTimeDurationConditionManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TimeDurationConditionManager, bFixedFrame, Details);
    return;
}
