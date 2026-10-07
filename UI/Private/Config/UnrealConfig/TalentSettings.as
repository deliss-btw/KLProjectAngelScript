

class UTalentSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> TalentInfoHover;
    UPROPERTY()
    FSoftBrush DefaultPreviewPicture;
    UPROPERTY()
    TMap<ESkillType, FSoftBrush> TalentSkillTypeIcon;

    UTalentSettings()
    {
        return;
    }
}

