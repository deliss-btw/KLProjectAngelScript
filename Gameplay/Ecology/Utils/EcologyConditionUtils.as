
namespace FEcologyConditionUtils
{
bool CheckDOTCondition(const FEcologyDOTCondition &inout Condition, const FName &inout Weather, const int DaySegment, FCS_EcologyDataCacheContext &inout CacheContext = FEcologyUtils::ModifyDataCacheContext())
{
    if (!(FEcologySceneInfoUtils::FindDOTTagBitContainer(CacheContext, Weather, DaySegment)))
    {
        return false;
    }
    return Condition.DOTConditionQuery.MatchesQuery();
}
bool SetupConditionComponent(const FECSEntity &inout Entity, const FEcologyDOTCondition &inout DOTCondition)
{
    if (DOTCondition.Enable())
    {
        FC_EcologyWithDOTConditionTag local_8;
        Assign local_6;
        local_6.opCall(local_8);
        return true;
    }
    return false;
}
bool UpdateEntityConditionResultAboutDOT(const FECSEntity &inout Entity, FC_EcologyConditionComponent &inout ConditionComponent, const FName &inout WeatherName, const int DaySegment, FCS_EcologyDataCacheContext &inout CacheContext = FEcologyUtils::ModifyDataCacheContext())
{
    if (!(ConditionComponent.DOTCondition.Enable()))
    {
        ConditionComponent.bLastDOTConditionResult = true;
    }
    else
    {
        ConditionComponent.bLastDOTConditionResult = FEcologyConditionUtils::CheckDOTCondition(ConditionComponent.DOTCondition, WeatherName, DaySegment, CacheContext);
    }
    return FEcologyConditionUtils::UpdateEntityConditionState(Entity, ConditionComponent);
}
bool UpdateEntityConditionState(const FECSEntity &inout Entity, FC_EcologyConditionComponent &inout ConditionComponent)
{
    bool local_1 = ConditionComponent.CalFinalResult();
    if (!(local_1) != !(ConditionComponent.bLastFinalResult))
    {
        if (local_1)
        {
            Remove local_8;
            local_8.opCall();
        }
        else
        {
            FC_InactiveByConditionTag local_14;
            Assign local_12;
            local_12.opCall(local_14);
        }
        ConditionComponent.bLastFinalResult = local_1;
        return true;
    }
    return false;
}
bool CheckCreatureCanDoActivity(const FECSEntity &inout Creature, const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout ActivityDefine, const FEcologyConditionWorldContext &inout WorldContext)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
}
