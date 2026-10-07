

class ACombatArealEffectSpawnerPrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_CombatArealEffectSpawner CombatArealEffectSpawner;

    default SetEntityType(EEntityType(6));

    ACombatArealEffectSpawnerPrefab()
    {
        return;
    }
}

