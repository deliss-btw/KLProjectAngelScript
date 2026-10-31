namespace FAIPerceptionUtils
{
TDataObjectPtr<FAIPerceptionConfig> GetPerceptionConfig(const FECSEntity &inout Entity)
{
    TDataObjectPtr<FCombatUnitBaseConfig> local_24 = FASCommonUtils::GetCombatUnitBaseConfig(Entity);
    if (!((local_24 == nullptr)) && !((local_24.Get().GetPerceptionConfig() == nullptr)))
    {
        return local_24.Get().GetPerceptionConfig();
    }
    return (TDataObjectPtr<FAIPerceptionConfig>(nullptr));
}
FSightPerceptionConfig GetCurrentSightConfig(const FECSEntity &inout Entity, const FC_AIKnowledge &inout AIKnowledge)
{
    FSightPerceptionConfig __r;
    TDataObjectPtr<FAIPerceptionConfig> local_24 = FAIPerceptionUtils::GetPerceptionConfig(Entity);
    if ((!((local_24 == nullptr))))
    {
        if (AIKnowledge.CurrentOverrideSightConfigKey.IsNone())
        {
        }
        else
        {
            FSightPerceptionConfig local_56;
            if (local_24.Get().OverrideSightConfigMap.Find(AIKnowledge.CurrentOverrideSightConfigKey, local_56))
            {
            }
            else
            {
            }
        }
    }
    else
    {
    }
    return __r;
}
UAIAlertnessConfigDataAsset GetCurrentAlertConfig(const FECSEntity &inout Entity, const FC_AIKnowledge &inout AIKnowledge)
{
    TDataObjectPtr<FAIPerceptionConfig> local_24 = FAIPerceptionUtils::GetPerceptionConfig(Entity);
    if ((!((local_24 == nullptr))))
    {
        UAIAlertnessConfigDataAsset local_54;
        if (AIKnowledge.CurrentOverrideAlertConfigKey.IsNone())
        {
            return local_24.Get().AIAlertnessConfigOverride;
        }
        if (local_24.Get().OverrideAlertConfigMap.Find(AIKnowledge.CurrentOverrideAlertConfigKey, local_54))
        {
            return local_54;
        }
        return local_24.Get().AIAlertnessConfigOverride;
    }
    return nullptr;
}
float32 GetOutOfCombatDistance(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_AIKnowledge& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.OutOfCombatDistanceOverride >= 0.0f)
        {
            return local_6.OutOfCombatDistanceOverride;
        }
    }
    TDataObjectPtr<FAIPerceptionConfig> local_34 = FAIPerceptionUtils::GetPerceptionConfig(Entity);
    if ((!((local_34 == nullptr))))
    {
        return local_34.Get().OutOfCombatDistance;
    }
    return 5000.0f;
}
float32 GetOutOfCombatDelay(const FECSEntity &inout Entity)
{
    TDataObjectPtr<FAIPerceptionConfig> local_24 = FAIPerceptionUtils::GetPerceptionConfig(Entity);
    if ((!((local_24 == nullptr))))
    {
        return local_24.Get().OutOfCombatDelay;
    }
    return 10.0f;
}
float32 GetOutOfCombatMaxDistance(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_AIKnowledge& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.OutOfCombatMaxDistanceOverride >= 0.0f)
        {
            return local_6.OutOfCombatMaxDistanceOverride;
        }
    }
    TDataObjectPtr<FAIPerceptionConfig> local_34 = FAIPerceptionUtils::GetPerceptionConfig(Entity);
    if ((!((local_34 == nullptr))))
    {
        return local_34.Get().OutOfCombatMaxDistance;
    }
    return 10000.0f;
}
float32 GetMeleeRange(const FECSEntity &inout Entity)
{
    TDataObjectPtr<FAIPerceptionConfig> local_24 = FAIPerceptionUtils::GetPerceptionConfig(Entity);
    if ((!((local_24 == nullptr))))
    {
        return local_24.Get().MeleeRange;
    }
    return 400.0f;
}
float32 GetHostilityAccumulationTime(const FECSEntity &inout Entity)
{
    TDataObjectPtr<FAIPerceptionConfig> local_24 = FAIPerceptionUtils::GetPerceptionConfig(Entity);
    if ((!((local_24 == nullptr))))
    {
        return local_24.Get().HostilityAccumulationTime;
    }
    return 30.0f;
}
float32 GetHostilityRemainTime(const FECSEntity &inout Entity)
{
    TDataObjectPtr<FAIPerceptionConfig> local_24 = FAIPerceptionUtils::GetPerceptionConfig(Entity);
    if ((!((local_24 == nullptr))))
    {
        return local_24.Get().HostilityRemainTime;
    }
    return 1.0f;
}
}
