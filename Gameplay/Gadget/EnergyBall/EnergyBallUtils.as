
enum EEnergyBallSpawnDirection
{
    LeftThenRight,
    Random,
}

namespace EnergyBallUtils
{
UFUNCTION()
void SpawnEnergyBallByPrefab(const FECSEntity &inout OwnerEntity, const TSubclassOf<AEnergyBallPrefab> &inout Prefab, const FFPTime &inout SpawnTime, const FVector &inout Location, const int SpawnNum = 1, const EEnergyBallSpawnDirection SpawnDirection = EEnergyBallSpawnDirection::LeftThenRight)
{
    if (int(SpawnDirection) == 0)
    {
        int local_4 = 0;
        for (; local_4 < SpawnNum; )
        {
            int local_2 = local_4 % 2;
            EnergyBallUtils::SpawnEnergyBallByPrefabEx(OwnerEntity, Prefab, SpawnTime, Location, (local_2 == 0));
            ++local_4;
        }
        return;
    }
    FRandomStream local_10 = FRandomStream(int(ECS::GetECSWorld().GetFixedTime().Frame));
    int local_4_2 = 0;
    for (; local_4_2 < SpawnNum; )
    {
        EnergyBallUtils::SpawnEnergyBallByPrefabEx(OwnerEntity, Prefab, SpawnTime, Location, (local_10.RandRange(0, 1) == 1));
        ++local_4_2;
    }
    return;
}
void SpawnEnergyBallByPrefabEx(const FECSEntity &inout OwnerEntity, const TSubclassOf<AEnergyBallPrefab> &inout Prefab, const FFPTime &inout SpawnTime, const FVector &inout Location, const bool bLeft)
{
    FC_EnergyBall local_6;
    int local_56 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(Prefab.IsValid()))
    {
        return;
    }
    AEnergyBallPrefab local_4 = Prefab.GetDefaultObject();
    if (int(local_6.EnergyBallAddType) == 1)
    {
        if (!(!(local_6.Attribute.GetDefinition().IsNull()) && (local_6.Value > 0.0f)))
        {
            return;
        }
    }
    FECSEntity local_28 = OwnerEntity;
    Get local_32;
    const FC_ControlledByPlayer& local_34 = local_32.opCall();
    if (local_34)
    {
        local_28 = FECSEntity(local_34.GetPlayerEntity());
    }
    if (!(local_28))
    {
        return;
    }
    AEnergyBallPrefab local_4_2 = Prefab.GetDefaultObject();
    FC_EnergyBall local_40;
    float32 local_42 = FMath::RandRange(-local_40.MoveTimeRandom, local_40.MoveTimeRandom);
    float32 local_41 = local_40.MoveTime + local_42;
    FFPTime local_54 = (SpawnTime + FFPTime(local_41));
    local_56.Prefab = Prefab;
    FCE_SpawnEnergyBall local_62;
    local_62.OriginLocation = Location;
    local_62.Prefab = Prefab;
    local_62.MoveTime = local_41;
    local_62.bLeft = bLeft;
    return;
}
UFUNCTION()
void SpawnEnergyBallInSphere(const FECSEntity &inout SourceEntity, const TSubclassOf<AEnergyBallPrefab> &inout Prefab, const FFPTime &inout SpawnTime, const float32 Radius = 400, const int SpawnNum = 1, const EEnergyBallSpawnDirection SpawnDirection = EEnergyBallSpawnDirection::LeftThenRight)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(Prefab.IsValid()))
    {
        return;
    }
    Get local_12;
    FVector local_8 = local_12.opCall().GetPosition();
    FECSRuntimeQuery local_56 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(SourceEntity, local_8, Radius, EECSQueryRegsitryType(3), false);
    Include local_100;
    local_100.opCall();
    Exclude(local_56).opCall();
    FECSRuntimeQueryIterator local_126 = local_56.Iterator();
    for (; local_126.CanProceed;)
    {
        const FECSEntity& local_150 = local_126.Proceed();
        EnergyBallUtils::SpawnEnergyBallByPrefab(local_150, Prefab, SpawnTime, local_8, SpawnNum, EEnergyBallSpawnDirection(SpawnDirection));
    }
    return;
}
UFUNCTION()
void SpawnEnergyBallInArea(const FVector &inout Location, const TSubclassOf<AEnergyBallPrefab> &inout Prefab, const FFPTime &inout SpawnTime, const float32 Radius = 400)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(Prefab.IsValid()))
    {
        return;
    }
    FECSRuntimeQuery local_44 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(ENTITY_NULL, Location, Radius, EECSQueryRegsitryType(3), false);
    Include local_88;
    local_88.opCall();
    Exclude(local_44).opCall();
    FECSRuntimeQueryIterator local_114 = local_44.Iterator();
    for (; local_114.CanProceed;)
    {
        const FECSEntity& local_138 = local_114.Proceed();
        EnergyBallUtils::SpawnEnergyBallByPrefab(local_138, Prefab, SpawnTime, Location, 1, EEnergyBallSpawnDirection(0));
    }
    return;
}
UFUNCTION()
bool TryDropDeathEnergyBall(const FECSEntity &inout SourceEntity, const FFPTime &inout Time)
{
    FC_DropEnergyBallSource local_18;
    Assign local_22;
    FC_DeathEnergyBallDroppedTag local_24;
    FC_DropEnergyBallSourceOverride local_30;
    float32 local_31;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return false;
    }
    Has local_6;
    if (!(SourceEntity.IsValid()) || !(local_6.opCall()))
    {
        return false;
    }
    Has local_12;
    bool local_1 = local_12.opCall();
    if (local_1)
    {
        return false;
    }
    if (!(local_18))
    {
        local_22.opCall(local_24);
        return false;
    }
    if (!(!(local_30)) && local_30.bOverrideDetectRadius)
    {
        local_31 = local_30.DetectRadius;
    }
    else
    {
        local_31 = local_18.DetectRadius;
    }
    TArray<FDropEnergyBallData> local_38;
    if (!(!(local_30)) && local_30.bOverrideDeathEnergyBallDrops)
    {
        local_38 = local_30.DeathEnergyBallDrops;
    }
    else
    {
        local_38 = local_18.DeathEnergyBallDrops;
    }
    for (auto& local_54 : local_38)
    {
        EnergyBallUtils::SpawnEnergyBallInSphere(SourceEntity, local_54.Prefab, Time, local_31, local_54.Number, EEnergyBallSpawnDirection(0));
    }
    local_22.opCall(local_24);
    return true;
}
}
