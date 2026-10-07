

class UMissionSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> ChapterStartHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> ChapterEndHint;
    UPROPERTY()
    TMap<EMissionType, TDataObjectPtr<FMissionPresentationRuleConfig>> DefaultMissionPresentationRuleConfig;
    UPROPERTY()
    TMap<EMissionType, FText> MissionCategoryTextMap;

    UMissionSettings()
    {
        return;
    }
}

