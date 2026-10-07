
namespace __INTENRAL_FCS_PlayerStatsConditionManager_NS
{
    const TECSComponentDerivedPtr<FCS_PlayerStatsConditionManager> DerivedPtr = TECSComponentDerivedPtr<FCS_PlayerStatsConditionManager>();
    const FCS_PlayerStatsConditionManager DefaultValue = FCS_PlayerStatsConditionManager();

}
struct FPlayerStatsMonitorConditions
{
    UPROPERTY()
    TArray<FConditionInstanceHandle> ConditionInstances;

    FPlayerStatsMonitorConditions()
    {
        return;
    }
}

struct FCS_PlayerStatsConditionManager : FECSSingleton
{
    UPROPERTY()
    TMap<ECommissionPlayerStatsType, FPlayerStatsMonitorConditions> MonitoredStats;

    FCS_PlayerStatsConditionManager()
    {
        return;
    }
}

namespace ECSFunc_FCS_PlayerStatsConditionManager
{
UFUNCTION()
bool HasPlayerStatsConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PlayerStatsConditionManager);
}
FCS_PlayerStatsConditionManager& AssignPlayerStatsConditionManager(const FECSWorldPtr &inout World, const FCS_PlayerStatsConditionManager &inout DefaultValue = FCS_PlayerStatsConditionManager())
{
    UScriptStruct local_6 = FCS_PlayerStatsConditionManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPlayerStatsConditionManager_BP(const FECSWorldPtr &inout World, const FCS_PlayerStatsConditionManager &inout DefaultValue = FCS_PlayerStatsConditionManager())
{
    ECSFunc_FCS_PlayerStatsConditionManager::AssignPlayerStatsConditionManager(World, DefaultValue);
    return;
}
FCS_PlayerStatsConditionManager& ModifyPlayerStatsConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PlayerStatsConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PlayerStatsConditionManager& ModifyOrAddPlayerStatsConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PlayerStatsConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PlayerStatsConditionManager& GetPlayerStatsConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PlayerStatsConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PlayerStatsConditionManager GetPlayerStatsConditionManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_PlayerStatsConditionManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_PlayerStatsConditionManager::GetPlayerStatsConditionManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_PlayerStatsConditionManager GetDefaultedPlayerStatsConditionManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PlayerStatsConditionManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PlayerStatsConditionManager);
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
FCS_PlayerStatsConditionManager GetDefaultedPlayerStatsConditionManager_BP(const FECSWorldPtr &inout World)
{
    FCS_PlayerStatsConditionManager __r;
    return __r;
}
UFUNCTION()
bool RemovePlayerStatsConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PlayerStatsConditionManager);
}
}
void __MonitorPlayerStatsConditionManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PlayerStatsConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerStatsConditionManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PlayerStatsConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerStatsConditionManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PlayerStatsConditionManager, bFixedFrame, Details);
    return;
}
