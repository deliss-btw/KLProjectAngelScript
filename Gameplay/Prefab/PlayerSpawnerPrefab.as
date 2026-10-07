

// NOTE: class defaults are not authored in this module: APlayerSpawnerPrefab (default scalar field AECSPrefab.bStatic has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

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

