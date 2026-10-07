
namespace FAIPerceptionUtils
{
TDataObjectPtr<FAIPerceptionConfig> GetPerceptionConfig(const FECSEntity &inout Entity)
{
    if (!((FASCommonUtils::GetCombatUnitBaseConfig(Entity) == nullptr)) && !((GetPerceptionConfig() == nullptr)))
    {
        return GetPerceptionConfig();
    }
    return (TDataObjectPtr<FAIPerceptionConfig>(nullptr));
}
FSightPerceptionConfig GetCurrentSightConfig(const FECSEntity &inout Entity, const FC_AIKnowledge &inout AIKnowledge)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FSightPerceptionConfig __r; return __r;
}
UAIAlertnessConfigDataAsset GetCurrentAlertConfig(const FECSEntity &inout Entity, const FC_AIKnowledge &inout AIKnowledge)
{
    UAIAlertnessConfigDataAsset local_52;
    if ((!((FAIPerceptionUtils::GetPerceptionConfig(Entity) == nullptr))))
    {
        FName local_54;
        if (AIKnowledge.CurrentOverrideAlertConfigKey.IsNone())
        {
            return local_52;
        }
        if (unresolved.OverrideAlertConfigMap.Find(AIKnowledge.CurrentOverrideAlertConfigKey, local_54))
        {
            return local_54;
        }
        return local_52;
    }
    return nullptr;
}
float32 GetOutOfCombatDistance(const FECSEntity &inout Entity)
{
    float32 local_8 = 0.0f;
    Get local_4;
    const FC_AIKnowledge& local_6 = local_4.opCall();
    if (local_6)
    {
        local_8 = local_6.OutOfCombatDistanceOverride;
        if (local_8 >= 0.0f)
        {
            return local_6.OutOfCombatDistanceOverride;
        }
    }
    if ((!((FAIPerceptionUtils::GetPerceptionConfig(Entity) == nullptr))))
    {
        return local_8;
    }
    return 5000.0f;
}
float32 GetOutOfCombatDelay(const FECSEntity &inout Entity)
{
    float32 local_50 = 0.0f;
    if ((!((FAIPerceptionUtils::GetPerceptionConfig(Entity) == nullptr))))
    {
        return local_50;
    }
    return 10.0f;
}
float32 GetOutOfCombatMaxDistance(const FECSEntity &inout Entity)
{
    float32 local_8 = 0.0f;
    Get local_4;
    const FC_AIKnowledge& local_6 = local_4.opCall();
    if (local_6)
    {
        local_8 = local_6.OutOfCombatMaxDistanceOverride;
        if (local_8 >= 0.0f)
        {
            return local_6.OutOfCombatMaxDistanceOverride;
        }
    }
    if ((!((FAIPerceptionUtils::GetPerceptionConfig(Entity) == nullptr))))
    {
        return local_8;
    }
    return 10000.0f;
}
float32 GetMeleeRange(const FECSEntity &inout Entity)
{
    float32 local_50 = 0.0f;
    if ((!((FAIPerceptionUtils::GetPerceptionConfig(Entity) == nullptr))))
    {
        return local_50;
    }
    return 400.0f;
}
float32 GetHostilityAccumulationTime(const FECSEntity &inout Entity)
{
    float32 local_50 = 0.0f;
    if ((!((FAIPerceptionUtils::GetPerceptionConfig(Entity) == nullptr))))
    {
        return local_50;
    }
    return 30.0f;
}
float32 GetHostilityRemainTime(const FECSEntity &inout Entity)
{
    float32 local_50 = 0.0f;
    if ((!((FAIPerceptionUtils::GetPerceptionConfig(Entity) == nullptr))))
    {
        return local_50;
    }
    return 1.0f;
}
}
