class ARandomMonsterSpawnerPrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FMonsterSpawnerDeadEvent OnEntityDead;
    UPROPERTY()
    FMonsterSpawnerAllDeadEvent OnEntityAllDead;
    UPROPERTY()
    FMonsterSpawnerSpawnedEvent OnEntitySpawned;
    UPROPERTY()
    FMonsterSpawnerSpawnFinishedEvent OnEntitySpawnFinished;
    UPROPERTY()
    FT_RandomMonsterSpawner RandomMonsterSpawner;

    ARandomMonsterSpawnerPrefab()
    {
        return;
    }
    UFUNCTION()
    void DrawVisualisationOnSelected_Implementation() const
    {
        for (auto& local_16 : this.RandomMonsterSpawner.Config_FC_RandomMonsterSpawner.CandidatePoints)
        {
            if (local_16.Get() != nullptr)
            {
                FVector local_32 = local_16.Get().GetActorLocation();
                DebugDraw::DrawDebugLine(this.GetWorld(), this.GetActorLocation(), local_32, FColor::Blue, false, -1.0f, uint8(0), 5.0f);
            }
        }
        return;
    }
}

event void FMonsterSpawnerDeadEvent(const FECSEntity &inout DeadEntity, const FECSEntity &inout KilledByEntity);

event void FMonsterSpawnerAllDeadEvent();

event void FMonsterSpawnerSpawnedEvent(const FECSEntity &inout SpawnedEntity);

event void FMonsterSpawnerSpawnFinishedEvent();

