

class UPresentationSpotDisplaySettings : UGameplaySettingsBase
{
    UPROPERTY()
    TMap<EPresentationSpotUsage, USpotDisplayConfigBase> DisplayConfigs;

    UPresentationSpotDisplaySettings()
    {
        return;
    }
}

