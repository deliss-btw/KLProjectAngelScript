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

