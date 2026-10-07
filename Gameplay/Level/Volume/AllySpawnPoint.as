

class AAllySpawnPoint : APlayerSpawnerPrefab
{
    UPROPERTY()
    USceneComponent Root;

    default SetbHidden(true);
    default SetbNetLoadOnClient(false);

    AAllySpawnPoint()
    {
        super();
        return;
    }
}

