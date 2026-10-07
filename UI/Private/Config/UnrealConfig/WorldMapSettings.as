
enum EWorldMapSpotCategory
{
    Teleporter,
    Mission,
    NPC,
    Uncategorized,
}


class UWorldMapSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> RegionMapTextTitleWidget;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> RegionMapTeleporterWidget;
    UPROPERTY()
    TMap<EWorldMapSpotCategory, FText> SpotCategoryNames;
    UPROPERTY()
    TMap<EWorldMapSpotCategory, TSoftClassPtr<UEUIUserWidget>> SpotDetailWidgets;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> RegionMapTeleporterMapIcon;
    UPROPERTY()
    TSubclassOf<UMinimapIconRegistryAsset> RegionMapIconRegistry;
    UPROPERTY()
    FMinimapIconDisplaySettings RegionMapTeleporterIconDisplaySettings;

    UWorldMapSettings()
    {
        return;
    }
}

