
namespace FEcosimAIV2Utils
{
    const FName HTN_Var = n"Var";

bool GetRealWorldEntityClassByUnitName(const FString &inout UnitName, TSubclassOf<AECSPrefab> &out Prefab)
{
    TSubclassOf<AECSPrefab> local_2;
    Prefab = local_2;
    return false;
}
bool GetRealWorldEntityUnitData(const FName &inout UnitName, FEcosimAIV2UnitData &out UnitData)
{
    FECSWorldPtr local_28 = ECS::GetECSWorld();
    if (0.EcosimAIV2UnitDataTable.FindRow(UnitName, UnitData))
    {
        return true;
    }
    return false;
}
void DestroyAllEntities()
{
    int local_8 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_8.AllEntityList.IsEmpty()))
    {
        for (auto& local_24 : local_8.AllEntityList)
        {
            local_24.GetEntity().DestroyDeferred();
        }
        local_8.AllEntityList.Empty(0);
    }
    return;
}
bool GetRoadLocationByStartAndTarget(const FVector &inout StartLocation, const FVector &inout TargetLocation, FVector &out RoadLocation)
{
    FVector local_6;
    RoadLocation = local_6;
    FKLRoadGraphData& local_10 = KLRoadGraph::GetRoadGraphData(ECS::GetUEWorld());
    FKLRoadGraphPath local_44;
    bool local_80 = local_10.FindPath(StartLocation, TargetLocation, local_44, EKLRoadMask(1));
    if (!(local_80))
    {
        return false;
    }
    FTransform local_116 = local_10.GetTransformAlongPath(local_44, (FMath::RandRange(0.0, 1.0)) * local_44.GetPathLength());
    RoadLocation = local_116.TransformPosition(FVector::ZeroVector);
    return true;
}
void SpawnAllEntityByBatch()
{
    int local_8 = 0;
    int local_113;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    FPlTerm local_10 = FPlTerm::Var();
    FPlTerm local_12 = FPlTerm::Var();
    FLegacyEcoQuery local_36 = FStdPrologUtils::Context(FEcosimAIV2PrologDeclare::ecosimaiv2_get_creature_batch_related_point, local_10, local_12).CreateQuery(false);
    while (local_36.NextSolution())
    {
        TArray<FPlTerm> local_52 = local_10.FlatToArray();
        TArray<FPlTerm> local_56 = local_12.FlatToArray();
        FPlTerm local_65 = FPlTerm(local_56[FMath::RandRange(0, (local_56.Num() - 1))]);
        FECSEntity local_76 = FECSEntity(local_65.GetEntityId());
        GetDefaulted local_86;
        FVector local_82 = local_86.opCall().GetPosition();
        for (auto& local_100 : local_52)
        {
            TArray<FPlTerm> local_60 = local_100.FlatToArray();
            if (local_60.Num() < 2)
            {
                continue;
            }
            FString local_108 = FString(local_60[0].GetString());
            local_113 = local_60[1].GetInteger();
            int local_114 = 0;
            for (; local_114 < local_113; ++local_114)
            {
                TSubclassOf<AECSPrefab> local_116;
                if (FEcosimAIV2Utils::GetRealWorldEntityClassByUnitName(local_108, local_116))
                {
                    local_8.CreatureEntityList.Add(ECS::RequestEntityByPrefabDeferred(local_116, local_82, FRotator::ZeroRotator, EPrefabCollisionAlignment(2), EECSRegType(0), false));
                }
            }
        }
    }
    local_36.Close();
    return;
}
}
