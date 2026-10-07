

struct FSpawnEntityGroup
{
    UPROPERTY()
    TArray<TSubclassOf<AECSPrefab>> SpawnEntityConfigArray;
    UPROPERTY()
    AActor SpawnPointGroup = nullptr;

    FSpawnEntityGroup()
    {
        return;
    }
}

struct FEcosimAIDataLayerDetail
{
    UPROPERTY()
    FString CreatureName;
    UPROPERTY()
    FString ActivityName;
    UPROPERTY()
    FName DataLayerName;

    FEcosimAIDataLayerDetail()
    {
        return;
    }
}

struct FEcosimAIDataLayerInfo
{
    UPROPERTY()
    TArray<FEcosimAIDataLayerDetail> DataLayerDetailList;

    FEcosimAIDataLayerInfo()
    {
        return;
    }
}

