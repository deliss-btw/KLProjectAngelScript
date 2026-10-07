
namespace __INTENRAL_FCS_LevelRandomEventData_NS
{
    const TECSComponentDerivedPtr<FCS_LevelRandomEventData> DerivedPtr = TECSComponentDerivedPtr<FCS_LevelRandomEventData>();
    const FCS_LevelRandomEventData DefaultValue = FCS_LevelRandomEventData();

}
struct FRuntimeEventPointData
{
    UPROPERTY()
    ALevelRandomEventPoint RandomEventPoint;
    UPROPERTY()
    int SelectedLBPIndex = -1;
    UPROPERTY()
    FVector Location;
    UPROPERTY()
    TArray<TSoftClassPtr<AKLLevelScriptAreaEventBase>> LBPs;
    UPROPERTY()
    TArray<TDataObjectPtr<FLevelEventInfoConfigBase>> EventInfoConfigs;
    UPROPERTY()
    float32 DistToNearestResource = -1.0f;


}

struct FCS_LevelRandomEventData : FECSSingleton
{
    UPROPERTY()
    TArray<FRuntimeEventPointData> RandomLevelEventPointData;
    UPROPERTY()
    TArray<int> SelectedEventPointIndexes;
    UPROPERTY()
    int MaxEventCount;
    UPROPERTY()
    int CurrentEventCount;
    UPROPERTY()
    TMap<ELevelRandomEventType, int> EventTypeCountMap;


}

struct FEventScoreContext
{
    UPROPERTY()
    TDataObjectPtr<FWeatherConfig> CurrentWeather;
    UPROPERTY()
    TArray<TDataObjectPtr<FMonsterMainConfig>> TargetMonsters;
    UPROPERTY()
    TDataObjectPtr<FCommissionTimeConfig> CurrentTimeConfig;

    FEventScoreContext()
    {
        return;
    }
}

namespace ECSFunc_FCS_LevelRandomEventData
{
UFUNCTION()
bool HasLevelRandomEventData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LevelRandomEventData);
}
FCS_LevelRandomEventData& AssignLevelRandomEventData(const FECSWorldPtr &inout World, const FCS_LevelRandomEventData &inout DefaultValue = FCS_LevelRandomEventData())
{
    UScriptStruct local_6 = FCS_LevelRandomEventData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLevelRandomEventData_BP(const FECSWorldPtr &inout World, const FCS_LevelRandomEventData &inout DefaultValue = FCS_LevelRandomEventData())
{
    ECSFunc_FCS_LevelRandomEventData::AssignLevelRandomEventData(World, DefaultValue);
    return;
}
FCS_LevelRandomEventData& ModifyLevelRandomEventData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelRandomEventData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LevelRandomEventData& ModifyOrAddLevelRandomEventData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelRandomEventData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LevelRandomEventData& GetLevelRandomEventData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelRandomEventData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LevelRandomEventData GetLevelRandomEventData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_LevelRandomEventData __r;
    bValid = false;
    bValid = ECSFunc_FCS_LevelRandomEventData::GetLevelRandomEventData(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_LevelRandomEventData GetDefaultedLevelRandomEventData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LevelRandomEventData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LevelRandomEventData);
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
FCS_LevelRandomEventData GetDefaultedLevelRandomEventData_BP(const FECSWorldPtr &inout World)
{
    FCS_LevelRandomEventData __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelRandomEventData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LevelRandomEventData);
}
}
void __MonitorLevelRandomEventDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LevelRandomEventData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelRandomEventDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LevelRandomEventData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelRandomEventDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LevelRandomEventData, bFixedFrame, Details);
    return;
}
