namespace __FPVPOverrideAvatarConfigFunctions
{
UFUNCTION()
TSoftClassPtr<ACharacterPrefab> __FPVPOverrideAvatarConfig_GetCharacterPrefab(const TDataObjectPtr<FPVPOverrideAvatarConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CharacterPrefab' from a null 'FPVPOverrideAvatarConfig' DataObject!");
        }
        FPVPOverrideAvatarConfig local_64;
        return local_64.CharacterPrefab;
    }
    return DataObject.Get().CharacterPrefab;
}
UFUNCTION()
TArray<TDataObjectPtr<FSkillInitConfig>> __FPVPOverrideAvatarConfig_GetSkills(const TDataObjectPtr<FPVPOverrideAvatarConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Skills' from a null 'FPVPOverrideAvatarConfig' DataObject!");
        }
        FPVPOverrideAvatarConfig local_64;
        return local_64.GetSkills();
    }
    return DataObject.Get().GetSkills();
}
UFUNCTION()
FPVPGameAttributeByLevelConfig __FPVPOverrideAvatarConfig_GetGameAttributeConfig(const TDataObjectPtr<FPVPOverrideAvatarConfig> &inout DataObject)
{
    FPVPGameAttributeByLevelConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameAttributeConfig' from a null 'FPVPOverrideAvatarConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FWeaponConfig> __FPVPOverrideAvatarConfig_GetDefaultWeapon(const TDataObjectPtr<FPVPOverrideAvatarConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultWeapon' from a null 'FPVPOverrideAvatarConfig' DataObject!");
        }
        FPVPOverrideAvatarConfig local_64;
        return local_64.GetDefaultWeapon();
    }
    return DataObject.Get().GetDefaultWeapon();
}
UFUNCTION()
FPVPOverrideAvatarConfig CastToFPVPOverrideAvatarConfig(const TDataObjectPtr<FPVPOverrideAvatarConfig> &inout DataObject)
{
    FPVPOverrideAvatarConfig __r;
    return __r;
}
}
namespace __FGameModeOverrideAvatarConfigFunctions
{
UFUNCTION()
TSoftClassPtr<ACharacterPrefab> __FGameModeOverrideAvatarConfig_GetCharacterPrefab(const TDataObjectPtr<FGameModeOverrideAvatarConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CharacterPrefab' from a null 'FGameModeOverrideAvatarConfig' DataObject!");
        }
        FGameModeOverrideAvatarConfig local_64;
        return local_64.CharacterPrefab;
    }
    return DataObject.Get().CharacterPrefab;
}
UFUNCTION()
TArray<TDataObjectPtr<FSkillInitConfig>> __FGameModeOverrideAvatarConfig_GetSkills(const TDataObjectPtr<FGameModeOverrideAvatarConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Skills' from a null 'FGameModeOverrideAvatarConfig' DataObject!");
        }
        FGameModeOverrideAvatarConfig local_64;
        return local_64.GetSkills();
    }
    return DataObject.Get().GetSkills();
}
UFUNCTION()
FPVPGameAttributeByLevelConfig __FGameModeOverrideAvatarConfig_GetGameAttributeConfig(const TDataObjectPtr<FGameModeOverrideAvatarConfig> &inout DataObject)
{
    FPVPGameAttributeByLevelConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameAttributeConfig' from a null 'FGameModeOverrideAvatarConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FWeaponConfig> __FGameModeOverrideAvatarConfig_GetDefaultWeapon(const TDataObjectPtr<FGameModeOverrideAvatarConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultWeapon' from a null 'FGameModeOverrideAvatarConfig' DataObject!");
        }
        FGameModeOverrideAvatarConfig local_64;
        return local_64.GetDefaultWeapon();
    }
    return DataObject.Get().GetDefaultWeapon();
}
UFUNCTION()
FGameModeOverrideAvatarConfig CastToFGameModeOverrideAvatarConfig(const TDataObjectPtr<FGameModeOverrideAvatarConfig> &inout DataObject)
{
    FGameModeOverrideAvatarConfig __r;
    return __r;
}
}
namespace __FAvatarPrefabConfigFunctions
{
UFUNCTION()
int __FAvatarPrefabConfig_GetSortPriority(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SortPriority' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig defaultValue;
        return defaultValue.SortPriority;
    }
    return DataObject.Get().SortPriority;
}
UFUNCTION()
TSoftClassPtr<ACharacterPrefab> __FAvatarPrefabConfig_GetCharacterPrefab(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CharacterPrefab' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.CharacterPrefab;
    }
    return DataObject.Get().CharacterPrefab;
}
UFUNCTION()
EGenderType __FAvatarPrefabConfig_GetGenderType(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GenderType' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.GenderType;
    }
    return DataObject.Get().GenderType;
}
UFUNCTION()
FSoftBrush __FAvatarPrefabConfig_GetAvatarIcon(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarIcon' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.AvatarIcon;
    }
    return DataObject.Get().AvatarIcon;
}
UFUNCTION()
FSoftBrush __FAvatarPrefabConfig_GetAvatarLargeIcon(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarLargeIcon' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.AvatarLargeIcon;
    }
    return DataObject.Get().AvatarLargeIcon;
}
UFUNCTION()
FSoftBrush __FAvatarPrefabConfig_GetUnlockedAvatarLargeIcon(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockedAvatarLargeIcon' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.UnlockedAvatarLargeIcon;
    }
    return DataObject.Get().UnlockedAvatarLargeIcon;
}
UFUNCTION()
TSoftClassPtr<AActor> __FAvatarPrefabConfig_GetShowcaseActor(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowcaseActor' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.ShowcaseActor;
    }
    return DataObject.Get().ShowcaseActor;
}
UFUNCTION()
TSoftClassPtr<AActor> __FAvatarPrefabConfig_GetShowcaseLightActor(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowcaseLightActor' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.ShowcaseLightActor;
    }
    return DataObject.Get().ShowcaseLightActor;
}
UFUNCTION()
FVector __FAvatarPrefabConfig_GetShowcaseOffset(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowcaseOffset' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.ShowcaseOffset;
    }
    return DataObject.Get().ShowcaseOffset;
}
UFUNCTION()
TSoftObjectPtr<UTexture2D> __FAvatarPrefabConfig_GetAvatar3DIconSoft(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Avatar3DIconSoft' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.Avatar3DIconSoft;
    }
    return DataObject.Get().Avatar3DIconSoft;
}
UFUNCTION()
EDamageType __FAvatarPrefabConfig_GetDamageType(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DamageType' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.DamageType;
    }
    return DataObject.Get().DamageType;
}
UFUNCTION()
EAvatarCombatType __FAvatarPrefabConfig_GetCombatType(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CombatType' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.CombatType;
    }
    return DataObject.Get().CombatType;
}
UFUNCTION()
FSoftBrush __FAvatarPrefabConfig_GetPlayerPowerIcon(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerPowerIcon' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.PlayerPowerIcon;
    }
    return DataObject.Get().PlayerPowerIcon;
}
UFUNCTION()
FSoftBrush __FAvatarPrefabConfig_GetPlayerTachie(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerTachie' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.PlayerTachie;
    }
    return DataObject.Get().PlayerTachie;
}
UFUNCTION()
FSoftBrush __FAvatarPrefabConfig_GetPlayerTachieBack(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerTachieBack' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.PlayerTachieBack;
    }
    return DataObject.Get().PlayerTachieBack;
}
UFUNCTION()
FSoftBrush __FAvatarPrefabConfig_GetPlayerClassIcon(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerClassIcon' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.PlayerClassIcon;
    }
    return DataObject.Get().PlayerClassIcon;
}
UFUNCTION()
FText __FAvatarPrefabConfig_GetPlayerPowerName(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerPowerName' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.PlayerPowerName;
    }
    return DataObject.Get().PlayerPowerName;
}
UFUNCTION()
FText __FAvatarPrefabConfig_GetPlayerIllustrate1(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerIllustrate1' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.PlayerIllustrate1;
    }
    return DataObject.Get().PlayerIllustrate1;
}
UFUNCTION()
FText __FAvatarPrefabConfig_GetAvatarBackgroundDesc(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarBackgroundDesc' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.AvatarBackgroundDesc;
    }
    return DataObject.Get().AvatarBackgroundDesc;
}
UFUNCTION()
FText __FAvatarPrefabConfig_GetSpecialtyDesc(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpecialtyDesc' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.SpecialtyDesc;
    }
    return DataObject.Get().SpecialtyDesc;
}
UFUNCTION()
EAvatarIllustrate __FAvatarPrefabConfig_GetAvatarIllustrate(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarIllustrate' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.AvatarIllustrate;
    }
    return DataObject.Get().AvatarIllustrate;
}
UFUNCTION()
EWeaponType __FAvatarPrefabConfig_GetWeaponType(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeaponType' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.WeaponType;
    }
    return DataObject.Get().WeaponType;
}
UFUNCTION()
bool __FAvatarPrefabConfig_GetbIsMainPlayer(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsMainPlayer' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.bIsMainPlayer;
    }
    return DataObject.Get().bIsMainPlayer;
}
UFUNCTION()
bool __FAvatarPrefabConfig_GetbAlwaysHidden(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAlwaysHidden' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.bAlwaysHidden;
    }
    return DataObject.Get().bAlwaysHidden;
}
UFUNCTION()
bool __FAvatarPrefabConfig_GetbIsOfficialAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsOfficialAvatar' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.bIsOfficialAvatar;
    }
    return DataObject.Get().bIsOfficialAvatar;
}
UFUNCTION()
FDataObjectPtr __FAvatarPrefabConfig_GetInitValues(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitValues' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.InitValues;
    }
    return DataObject.Get().InitValues;
}
UFUNCTION()
FName __FAvatarPrefabConfig_GetAvatarAudioSwitchName(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarAudioSwitchName' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.AvatarAudioSwitchName;
    }
    return DataObject.Get().AvatarAudioSwitchName;
}
UFUNCTION()
TArray<TDataObjectPtr<FSkillInitConfig>> __FAvatarPrefabConfig_GetSkills(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Skills' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.GetSkills();
    }
    return DataObject.Get().GetSkills();
}
UFUNCTION()
TDataObjectPtr<FAvatarSkillConfig> __FAvatarPrefabConfig_GetSkillConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SkillConfig' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.GetSkillConfig();
    }
    return DataObject.Get().GetSkillConfig();
}
UFUNCTION()
TDataObjectPtr<FWeaponConfig> __FAvatarPrefabConfig_GetDefaultWeapon(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultWeapon' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.GetDefaultWeapon();
    }
    return DataObject.Get().GetDefaultWeapon();
}
UFUNCTION()
TDataObjectPtr<FTalentConfig> __FAvatarPrefabConfig_GetDefaultFoundation(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultFoundation' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.GetDefaultFoundation();
    }
    return DataObject.Get().GetDefaultFoundation();
}
UFUNCTION()
TDataObjectPtr<FSkillBtnConfig> __FAvatarPrefabConfig_GetSkillBtnConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SkillBtnConfig' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.GetSkillBtnConfig();
    }
    return DataObject.Get().GetSkillBtnConfig();
}
UFUNCTION()
bool __FAvatarPrefabConfig_GetbDefaultUnlock(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bDefaultUnlock' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.bDefaultUnlock;
    }
    return DataObject.Get().bDefaultUnlock;
}
UFUNCTION()
TArray<TDataObjectPtr<FServerConditionConfigBase>> __FAvatarPrefabConfig_GetUnlockCondition(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockCondition' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.GetUnlockCondition();
    }
    return DataObject.Get().GetUnlockCondition();
}
UFUNCTION()
TDataObjectPtr<FPVPOverrideAvatarConfig> __FAvatarPrefabConfig_GetPVPOverride(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PVPOverride' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.GetPVPOverride();
    }
    return DataObject.Get().GetPVPOverride();
}
UFUNCTION()
TMap<EGameModeType, TDataObjectPtr<FGameModeOverrideAvatarConfig>> __FAvatarPrefabConfig_GetGameModeOverride(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameModeOverride' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.GetGameModeOverride();
    }
    return DataObject.Get().GetGameModeOverride();
}
UFUNCTION()
TArray<FTrainingLevelConfig> __FAvatarPrefabConfig_GetTrainingLevelConfigs(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TrainingLevelConfigs' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.TrainingLevelConfigs;
    }
    return DataObject.Get().TrainingLevelConfigs;
}
UFUNCTION()
TArray<TDataObjectPtr<FTrainingInfoConfig>> __FAvatarPrefabConfig_GetTrainingInfoConfigs(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TrainingInfoConfigs' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.GetTrainingInfoConfigs();
    }
    return DataObject.Get().GetTrainingInfoConfigs();
}
UFUNCTION()
TDataObjectPtr<FCharacterDefaultFashionConfig> __FAvatarPrefabConfig_GetDefaultFashion(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultFashion' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.GetDefaultFashion();
    }
    return DataObject.Get().GetDefaultFashion();
}
UFUNCTION()
FAvatarPrefabConfig CastToFAvatarPrefabConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FAvatarPrefabConfig __r;
    return __r;
}
}
