

struct FAIPerceptionConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FSightPerceptionConfig DefaultSightConfig;
    UPROPERTY()
    TMap<FName, FSightPerceptionConfig> OverrideSightConfigMap;
    UPROPERTY()
    float32 OutOfCombatDelay = 10.0f;
    UPROPERTY()
    float32 OutOfCombatDistance = 5000.0f;
    UPROPERTY()
    float32 OutOfCombatMaxDistance = 10000.0f;
    UPROPERTY()
    UAIAlertnessConfigDataAsset AIAlertnessConfigOverride = nullptr;
    UPROPERTY()
    TMap<FName, UAIAlertnessConfigDataAsset> OverrideAlertConfigMap;
    UPROPERTY()
    float32 MeleeRange = 400.0f;
    UPROPERTY()
    float32 HostilityAccumulationTime = 30.0f;
    UPROPERTY()
    float32 HostilityRemainTime = 1.0f;


}

