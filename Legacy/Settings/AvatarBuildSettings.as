
enum EAttributeDisplayType
{
    Numeric,
    Percentage,
}


struct FAttributeDisplayConfig
{
    UPROPERTY()
    FGameAttributeRef Attribute;
    UPROPERTY()
    EAttributeDisplayType DisplayType;


}

struct FAttributeDisplayGroup
{
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    TArray<FAttributeDisplayConfig> Attributes;

    FAttributeDisplayGroup()
    {
        return;
    }
}

struct FAvatarIllustrateInfo
{
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    FSoftBrush BackgroundIcon;
    UPROPERTY()
    FSoftBrush BackgroundActiveIcon;

    FAvatarIllustrateInfo()
    {
        return;
    }
}

struct FWeaponTypeDisplayInfo
{
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    FSoftBrush Icon;

    FWeaponTypeDisplayInfo()
    {
        return;
    }
}

class UAvatarBuildSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> AvatarSelectBarClass;
    UPROPERTY()
    TMap<EAvatarIllustrate, FAvatarIllustrateInfo> AvatarIllustrateInfos;
    UPROPERTY()
    TMap<FGameAttributeRef, FText> AttributeDisplayNames;
    UPROPERTY()
    TArray<FAttributeDisplayGroup> AttributeDisplayGroups;
    UPROPERTY()
    TArray<FAttributeDisplayConfig> EquipmentDetailDisplayAttributes;
    UPROPERTY()
    TMap<EWeaponType, FWeaponTypeDisplayInfo> WeaponTypeDisplayInfo;
    UPROPERTY()
    FDataTablePtr AttributeConfigDataTable;
    UPROPERTY()
    FText UnlockNewAvatarTipsTitle;
    UPROPERTY()
    FText UnlockNewAvatarTipsContentFormat;
    UPROPERTY()
    FEUIInputActionDataRow UnlockNewAvatarTipsConfirmAction;
    UPROPERTY()
    float32 UnlockNewAvatarTipsTimeDuration;
    UPROPERTY()
    TDataObjectPtr<FDivineSkillConfig> SwordSpecialtyDivineSkillConfig;
    UPROPERTY()
    TDataObjectPtr<FDivineSkillConfig> WizardSpecialtyDivineSkillConfig;
    UPROPERTY()
    FSoftBrush SwordSpecialtyDefaultWeaponIcon;
    UPROPERTY()
    FSoftBrush WizardSpecialtyDefaultWeaponIcon;
    UPROPERTY()
    FText SwordSpecialtyDescription;
    UPROPERTY()
    FText WizardSpecialtyDescription;
    UPROPERTY()
    FText SwordSpecialtyRecommendation;
    UPROPERTY()
    FText WizardSpecialtyRecommendation;
    UPROPERTY()
    TDataObjectPtr<FAvatarBuildOverrideConfig> SwordSpecialtyTrainingAvatarConfig;
    UPROPERTY()
    TDataObjectPtr<FAvatarBuildOverrideConfig> WizardSpecialtyTrainingAvatarConfig;

    UAvatarBuildSettings()
    {
        return;
    }
}

