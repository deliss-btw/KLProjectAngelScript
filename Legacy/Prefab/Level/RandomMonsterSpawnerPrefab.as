

// NOTE: class defaults are not authored in this module: ARandomMonsterSpawnerPrefab (default scalar field AECSPrefab.bHasActor has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

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
        AActor local_18;
        for (auto& local_16 : this.RandomMonsterSpawner.Config_FC_RandomMonsterSpawner.CandidatePoints)
        {
            local_16;
            if (local_18 != nullptr)
            {
                AActor local_26;
                FVector local_32 = local_26.GetActorLocation();
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

