class APlayerSpawnerPrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_PlayerSpawner PlayerSpawner;

    APlayerSpawnerPrefab()
    {
        return;
    }
}

class APlayerSpawnerSelectablePrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_PlayerSpawnerSelectable PlayerSpawner;

    APlayerSpawnerSelectablePrefab()
    {
        return;
    }
}

