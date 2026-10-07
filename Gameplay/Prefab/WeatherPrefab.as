

// NOTE: class defaults are not authored in this module: AWeatherPrefab (default scalar field AECSPrefab.bHasTransform has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

UCLASS(Abstract)
class AWeatherPrefab : AKLECSPrefab
{
    UPROPERTY()
    FT_Ability Ability;
    UPROPERTY()
    FT_Faction Faction;
    UPROPERTY()
    FT_PrefabConfig PrefabConfig;
    UPROPERTY()
    FT_DestructibleDamageDefault DestructibleDamageDefault;

    AWeatherPrefab()
    {
        return;
    }
}

