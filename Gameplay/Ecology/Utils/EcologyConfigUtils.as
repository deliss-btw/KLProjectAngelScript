namespace EcologyConfigUtils
{
UFUNCTION()
bool IsInLoadRegions(const FVector &inout Position)
{
    return true;
}
UFUNCTION()
TArray<FEcologyActivityType> GetCreatureActivityDefintionActivityOptions()
{
    TArray<FEcologyActivityType> local_8;
    local_8.Add(FEcologyActivityType("drink"));
    return local_8;
}
UFUNCTION()
TArray<FString> TestOptions()
{
    TArray<FString> local_8;
    local_8.Add("drink");
    return local_8;
}
UFUNCTION()
TArray<FString> GetEcologyActivityOptions(const UObject Outer, const FCreatureActivityDefintion &inout Data)
{
    TArray<FString> local_4;
    if (Data.CreatureType.CreatureTypeName.IsEmpty())
    {
        return local_4;
    }
    if (FPrologUtils::GetQueryValueResultByArgName(FString().Append("creature_activity_definition(").Append(Data.CreatureType.CreatureTypeName).Append(", CreatureActivityName, _, _)"), "CreatureActivityName", local_4, true, false))
    {
        local_4.Sort(false);
    }
    return local_4;
}
UFUNCTION()
FECSEntityId FindConfigByUUID(const FConfigGUID &inout GUID, const FECSWorldPtr &inout WorldPtr = ECS::ECSWorld)
{
    TConstRawPtr<FECSEntityId> local_2 = FEcologyUtils::GetConfigContext(WorldPtr).EntityConfigMap.Find(GUID);
    FECSEntityId local_6;
    if (local_2)
    {
        local_6 = local_2.Get();
    }
    else
    {
        local_6 = ENTITY_ID_NULL;
    }
    return local_6;
}
UFUNCTION()
EMonsterRank GetMonsterRank(const TDataObjectPtr<FMonsterMainConfig> &inout Config)
{
    if (!(Config))
    {
        return EMonsterRank(0);
    }
    const TDataObjectPtr<FCombatUnitBaseConfig>& local_4 = Config.Get().GetCombatConfig();
    if (!(local_4))
    {
        return EMonsterRank(0);
    }
    return local_4.Get().Rank;
}
}
