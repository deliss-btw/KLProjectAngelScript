

class UCharacterGlobalSetting : UCharacterGlobalSettingsBase
{
    UPROPERTY()
    UESMInputTriggerAsset TurnStandTrigger;
    UPROPERTY()
    float32 KeepSprintDelay = 0.2f;
    UPROPERTY()
    FESMBlackboardConditionAndArray KeepSprintCondition;
    UPROPERTY()
    UESMInputTriggerAsset StanceTrigger;
    UPROPERTY()
    float32 StanceThrethold = 0.5f;
    UPROPERTY()
    int WalkDeferFrames = 4;
    UPROPERTY()
    TObjectPtr<UESMInputTriggerAsset> MountInputTrigger = nullptr;
    UPROPERTY()
    FESMBlackboardConditionAndArray TeleportCondition;


}

