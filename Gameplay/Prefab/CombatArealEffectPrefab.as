

class ACombatArealEffectPrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_CombatArealEffect CombatArealEffect;

    default SetEntityType(EEntityType(6));

    ACombatArealEffectPrefab()
    {
        return;
    }
}

