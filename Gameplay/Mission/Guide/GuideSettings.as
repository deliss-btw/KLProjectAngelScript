

class UGuideSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TSubclassOf<UMinimapIconRegistryAsset> GuideIconRegistry;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> MiniMapRegionIconWidget;
    UPROPERTY()
    float MinRegionRadius = 1000.0;
    UPROPERTY()
    FMinimapIconDisplaySettings MiniMapRegionIconDisplayConfig;
    UPROPERTY()
    TMap<EGuideStyleType, TDataObjectPtr<FGuidePresentationConfig>> GuidePresentationSettings;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> GuideEntityPresentationRule;
    UPROPERTY()
    TSoftClassPtr<AActor> GuideFXActorClass;
    UPROPERTY()
    FVector LocationIconOffset = FVector(0.0, 0.0, 180.0);
    UPROPERTY()
    float32 GuidingPathRequestCooldown = 0.2f;


}

