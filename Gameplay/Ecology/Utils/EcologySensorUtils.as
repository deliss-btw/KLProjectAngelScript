
namespace FEcologySensorUtils
{
bool UpdateDOTSensorUnit(const FECSEntity &inout Entity, FC_EcologyDOTSensor &inout DOTSensor, FEcologyDOTSensorUnit &inout UnitRef, const FEcologyConditionWorldContext &inout WorldContext, FCS_EcologyDataCacheContext &inout CacheContext = FEcologyUtils::ModifyDataCacheContext())
{
    bool local_1 = UnitRef.bIsEnter;
    bool local_3 = false;
    if (UnitRef.Condition.Enable())
    {
        local_3 = FEcologyConditionUtils::CheckDOTCondition(UnitRef.Condition, WorldContext.WeatherName, int(WorldContext.TimeSegments), CacheContext);
    }
    UnitRef.bIsEnter = local_3;
    bool local_2 = !(local_1);
    if (local_2 != !(local_3))
    {
        return true;
    }
    bool local_2_2 = (!(local_1) != !(local_3));
    return local_2_2;
}
void UpdateAllDOTSensorUnit(const FECSEntity &inout Entity, FC_EcologyDOTSensor &inout DOTSensor, const FEcologyConditionWorldContext &inout WorldContext, FCS_EcologyDataCacheContext &inout CacheContext = FEcologyUtils::ModifyDataCacheContext())
{
    FEcologyDOTSensorUnit& local_42;
    TMap<FName, bool> local_20;
    bool local_43 = false;
    int local_62 = 0;
    for (auto& local_40 : DOTSensor.DOTSensorMap)
    {
        local_40;
        bool local_37 = FEcologySensorUtils::UpdateDOTSensorUnit(Entity, DOTSensor, local_42, WorldContext, CacheContext);
        if (local_37)
        {
            Entity.GetEntityName();
            FString local_48 = FString();
            local_43 = local_42.bIsEnter;
            local_20.FindOrAdd(local_42.SensorName) = local_43;
        }
    }
    if (local_20.Num() > 0)
    {
        FFPTime local_60 = FFPTime(-1);
        for (auto& local_80 : local_20)
        {
            local_62.ChangedState.FindOrAdd(local_80.GetKey()) = local_43;
        }
    }
    return;
}
void RegisterDOTSensor(const FECSEntity &inout Entity, FC_EcologyDOTSensor &inout DOTSensor, const FName &inout SensorName, const FEcologyDOTSensorConfig &inout Config)
{
    int local_12 = 0;
    int local_48 = 0;
    int local_90 = 0;
    if (SensorName.IsNone())
    {
        XError(ELog(30), "FEcologySensorUtils.AddDOTSensor: SensorName is None");
        return;
    }
    if (DOTSensor.DOTSensorMap.Contains(SensorName))
    {
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            XError(ELog(30), FString().Append("FEcologySensorUtils.RegisterDOTSensor: Sensor with the same name already exists:").Append(SensorName).Append(" by ").Append(local_12.CreatureConfigProxy.GetMonsterConfig().ToString()));
        }
        else
        {
            XError(ELog(30), FString().Append("FEcologySensorUtils.RegisterDOTSensor: Sensor with the same name already exists:").Append(SensorName).Append(" By unknow monster"));
        }
        return;
    }
    FEcologyDOTSensorUnit& local_46 = DOTSensor.DOTSensorMap.FindOrAdd(SensorName);
    local_46.SensorName = SensorName;
    local_46.Condition.bEnable = !(Config.DOTConditionQuery.IsEmpty());
    local_46.Condition.DOTConditionQuery = Config.DOTConditionQuery;
    local_46.bIsEnter = false;
    FECSWorldPtr local_50 = ECS::GetECSWorld();
    if (FEcologySensorUtils::UpdateDOTSensorUnit(Entity, DOTSensor, local_46, FEcologyConditionWorldContext(Entity, FEcologyUtils::GetGlobalContext(ECS::GetECSWorld())), local_48))
    {
        FFPTime local_86 = FFPTime(-1);
        local_90.ChangedState.FindOrAdd(local_46.SensorName) = local_46.bIsEnter;
    }
    return;
}
void UnRegister(const FECSEntity &inout Entity, FC_EcologyDOTSensor &inout DOTSensor, const FName &inout DOTSensorName, const bool bWithEvent)
{
    if (DOTSensor.DOTSensorMap.Contains(DOTSensorName))
    {
        return;
    }
    XWarning(ELog(30), FString().Append("FEcologySensorUtils.UnRegister: Tried to remove non-existent sensor: ").Append(DOTSensorName));
    return;
}
}
