
namespace FEcosimAIV2Utils
{
FECSEntity CreateWaveEntity()
{
    FECSEntity local_12;
    ECS::GetECSWorld().Create(EEntityType(9), local_12);
    ModifyOrAdd local_16;
    local_16.opCall();
    XLog(ELog(0), FString().Append("CreateWaveEntity: ").Append(local_12));
    return local_12;
}
void AddMemberToWaveEntity(const FECSEntity &inout WaveEntity, const FECSEntity &inout WaveMemberEntity)
{
    int local_14 = 0;
    Modify local_4;
    FC_EcosimAIV2WaveInfo& local_6 = local_4.opCall();
    if (local_6)
    {
        FCE_EcosimAIV2WaveMemberChange local_24;
        local_6.WaveMemberEntityList.AddUnique(WaveMemberEntity);
        local_14.WaveEntity = WaveEntity;
        FFPTime local_20 = FFPTime(-1);
        local_24.CurrentNum = local_6.WaveMemberEntityList.Num();
        local_24.bIsAdd = true;
    }
    return;
}
FECSEntity SpawnPrefabWithSpawnPoint(const FECSEntity &inout LevelScriptEntity, const TArray<ATargetPoint> &inout TargetPointList, const TArray<TSubclassOf<AECSPrefab>> &inout PrefabList, const float32 RandomLocationHorizontalRange = 200, const float32 RandomYawOffset = 30, const FName &inout InitToState = NAME_None)
{
    ATargetPoint local_4;
    int local_136 = 0;
    if (ECS::GetRuntimeInfo().IsServer)
    {
        if (TargetPointList.IsEmpty() || PrefabList.IsEmpty())
        {
            return ENTITY_NULL;
        }
        int local_7 = FMath::RandRange(0, (TargetPointList.Num() - 1));
        TSubclassOf<AECSPrefab> local_10 = TSubclassOf<AECSPrefab>(PrefabList[FMath::RandRange(0, (PrefabList.Num() - 1))]);
        if (local_4 == nullptr || !(local_10.IsValid()))
        {
            return ENTITY_NULL;
        }
        FTransform local_36 = local_4.GetActorTransform();
        FVector local_42(local_36.GetLocation());
        FQuat local_56 = FQuat(local_36.GetRotation());
        float32 local_71 = -RandomLocationHorizontalRange;
        float local_78 = FMath::RandRange(local_71, RandomLocationHorizontalRange);
        local_71 = RandomLocationHorizontalRange;
        local_71 = -local_71;
        FVector local_86 = (local_42 + FVector((FMath::RandRange(local_71, RandomLocationHorizontalRange)), local_78, 0.0));
        FRotator local_98 = local_56.Rotator();
        local_71 = RandomYawOffset;
        local_71 = -local_71;
        FRotator local_110 = (local_98 + FRotator(0.0, (FMath::RandRange(local_71, RandomYawOffset)), 0.0));
        bool local_1_2 = false;
        FVector local_70 = FASCommonUtils::FindLegalLocationByPrefab(local_1_2, LevelScriptEntity, local_10.GetDefaultObject(), local_86, FQuat(local_110), 500.0f, 50.0f, 8, true);
        FECSEntity local_130 = ECS::RequestEntityByPrefabDeferred(local_10, local_70, local_110, EPrefabCollisionAlignment(0), EECSRegType(0), false);
        if (!(InitToState.IsNone()))
        {
            local_136.ToState = InitToState;
        }
        return local_130;
    }
    return ENTITY_NULL;
}
}
