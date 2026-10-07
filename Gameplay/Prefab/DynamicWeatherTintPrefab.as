

UCLASS(Abstract)
class ADynamicWeatherTintPrefab : AKLECSPrefab
{
    UPROPERTY()
    FT_DynamicWeatherTint DynamicWeatherTint;

    default SetEntityType(EEntityType(9));

    ADynamicWeatherTintPrefab()
    {
        return;
    }
}

