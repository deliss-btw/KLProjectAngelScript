

class UHeadsUpDisplaySettings : UGameplaySettingsBase
{
    UPROPERTY()
    TSoftClassPtr<AHeadsUpDisplay3DActor> ActorClass;

    UHeadsUpDisplaySettings()
    {
        return;
    }
}

