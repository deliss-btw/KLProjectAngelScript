

class UUtilitySettings : UGameplaySettingsBase
{
    UPROPERTY()
    TDataObjectPtr<FEnhancedInputContextConfig> GlobalReturnContext;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> BuffLargeSideHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> DivineSkillUnlockHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> CraftUnlockHint;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> BuffSmallSideHintTitle;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> WeatherInfoHover;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> TimeOfDayInfoHover;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> CommissionTimeInfoHover;
    UPROPERTY()
    FSoftBrush CommonCategoryAllIcon;
    UPROPERTY()
    FSoftBrush MountIconImg;
    UPROPERTY()
    FLinearColor ItemSufficientQuantityTextColor;
    UPROPERTY()
    FLinearColor ItemInsufficientQuantityTextColor;
    UPROPERTY()
    float32 AttenuationDamageTextDistanceThrethold = 0.7f;
    UPROPERTY()
    float32 AttenuationDamageTextDamageTypeThrethold = 0.7f;
    UPROPERTY()
    float32 NavigationBarCenterThreshold = 0.05f;
    UPROPERTY()
    FBuffConfigRef ExecuteBuffRef;
    UPROPERTY()
    TMap<int, UESMInputTriggerAsset> TeamInfoSkillHintIAMap;
    UPROPERTY()
    FFPTime UnstuckCooldown = 30.0;


}

