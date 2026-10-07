
namespace __INTENRAL_FCS_GameplayTagChangedConditionManager_NS
{
    const TECSComponentDerivedPtr<FCS_GameplayTagChangedConditionManager> DerivedPtr = TECSComponentDerivedPtr<FCS_GameplayTagChangedConditionManager>();
    const FCS_GameplayTagChangedConditionManager DefaultValue = FCS_GameplayTagChangedConditionManager();

}
struct FGameplayTagChangedMonitorConditions
{
    UPROPERTY()
    TArray<FConditionInstanceHandle> ConditionInstances;

    FGameplayTagChangedMonitorConditions()
    {
        return;
    }
}

struct FCS_GameplayTagChangedConditionManager : FECSSingleton
{
    UPROPERTY()
    TMap<FGameplayTag, FGameplayTagChangedMonitorConditions> MonitoredTags;

    FCS_GameplayTagChangedConditionManager()
    {
        return;
    }
}

namespace ECSFunc_FCS_GameplayTagChangedConditionManager
{
UFUNCTION()
bool HasGameplayTagChangedConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GameplayTagChangedConditionManager);
}
FCS_GameplayTagChangedConditionManager& AssignGameplayTagChangedConditionManager(const FECSWorldPtr &inout World, const FCS_GameplayTagChangedConditionManager &inout DefaultValue = FCS_GameplayTagChangedConditionManager())
{
    UScriptStruct local_6 = FCS_GameplayTagChangedConditionManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGameplayTagChangedConditionManager_BP(const FECSWorldPtr &inout World, const FCS_GameplayTagChangedConditionManager &inout DefaultValue = FCS_GameplayTagChangedConditionManager())
{
    ECSFunc_FCS_GameplayTagChangedConditionManager::AssignGameplayTagChangedConditionManager(World, DefaultValue);
    return;
}
FCS_GameplayTagChangedConditionManager& ModifyGameplayTagChangedConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameplayTagChangedConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GameplayTagChangedConditionManager& ModifyOrAddGameplayTagChangedConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameplayTagChangedConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GameplayTagChangedConditionManager& GetGameplayTagChangedConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameplayTagChangedConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GameplayTagChangedConditionManager GetGameplayTagChangedConditionManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_GameplayTagChangedConditionManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_GameplayTagChangedConditionManager::GetGameplayTagChangedConditionManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_GameplayTagChangedConditionManager GetDefaultedGameplayTagChangedConditionManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GameplayTagChangedConditionManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GameplayTagChangedConditionManager);
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
FCS_GameplayTagChangedConditionManager GetDefaultedGameplayTagChangedConditionManager_BP(const FECSWorldPtr &inout World)
{
    FCS_GameplayTagChangedConditionManager __r;
    return __r;
}
UFUNCTION()
bool RemoveGameplayTagChangedConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GameplayTagChangedConditionManager);
}
}
void __MonitorGameplayTagChangedConditionManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GameplayTagChangedConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameplayTagChangedConditionManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GameplayTagChangedConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameplayTagChangedConditionManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GameplayTagChangedConditionManager, bFixedFrame, Details);
    return;
}
