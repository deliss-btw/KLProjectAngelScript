namespace __FPVPOverrideAvatarConfigFunctions
{
UFUNCTION()
TSoftClassPtr<ACharacterPrefab> __FPVPOverrideAvatarConfig_GetCharacterPrefab(const TDataObjectPtr<FPVPOverrideAvatarConfig> &inout DataObject)
{
    TSoftClassPtr<ACharacterPrefab> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CharacterPrefab' from a null 'FPVPOverrideAvatarConfig' DataObject!");
        }
        FPVPOverrideAvatarConfig local_64;
        return local_64.CharacterPrefab;
    }
    return __r;
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
    return GetSkills();
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
    return GetDefaultWeapon();
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
    TSoftClassPtr<ACharacterPrefab> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CharacterPrefab' from a null 'FGameModeOverrideAvatarConfig' DataObject!");
        }
        FGameModeOverrideAvatarConfig local_64;
        return local_64.CharacterPrefab;
    }
    return __r;
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
    return GetSkills();
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
    return GetDefaultWeapon();
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
    TSoftClassPtr<ACharacterPrefab> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CharacterPrefab' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.CharacterPrefab;
    }
    return __r;
}
UFUNCTION()
EGenderType __FAvatarPrefabConfig_GetGenderType(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    int local_669 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GenderType' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        local_669 = int(local_668.GenderType);
        return EGenderType(local_669);
    }
    return EGenderType(local_669);
}
UFUNCTION()
FSoftBrush __FAvatarPrefabConfig_GetAvatarIcon(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarIcon' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.AvatarIcon;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FAvatarPrefabConfig_GetAvatarLargeIcon(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarLargeIcon' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.AvatarLargeIcon;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FAvatarPrefabConfig_GetUnlockedAvatarLargeIcon(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockedAvatarLargeIcon' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.UnlockedAvatarLargeIcon;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<AActor> __FAvatarPrefabConfig_GetShowcaseActor(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    TSoftClassPtr<AActor> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowcaseActor' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.ShowcaseActor;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<AActor> __FAvatarPrefabConfig_GetShowcaseLightActor(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    TSoftClassPtr<AActor> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowcaseLightActor' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.ShowcaseLightActor;
    }
    return __r;
}
UFUNCTION()
FVector __FAvatarPrefabConfig_GetShowcaseOffset(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FVector __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowcaseOffset' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.ShowcaseOffset;
    }
    return __r;
}
UFUNCTION()
TSoftObjectPtr<UTexture2D> __FAvatarPrefabConfig_GetAvatar3DIconSoft(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    TSoftObjectPtr<UTexture2D> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Avatar3DIconSoft' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.Avatar3DIconSoft;
    }
    return __r;
}
UFUNCTION()
EDamageType __FAvatarPrefabConfig_GetDamageType(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    int local_669 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DamageType' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        local_669 = int(local_668.DamageType);
        return EDamageType(local_669);
    }
    return EDamageType(local_669);
}
UFUNCTION()
EAvatarCombatType __FAvatarPrefabConfig_GetCombatType(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    int local_669 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CombatType' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        local_669 = int(local_668.CombatType);
        return EAvatarCombatType(local_669);
    }
    return EAvatarCombatType(local_669);
}
UFUNCTION()
FSoftBrush __FAvatarPrefabConfig_GetPlayerPowerIcon(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerPowerIcon' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.PlayerPowerIcon;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FAvatarPrefabConfig_GetPlayerTachie(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerTachie' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.PlayerTachie;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FAvatarPrefabConfig_GetPlayerTachieBack(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerTachieBack' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.PlayerTachieBack;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FAvatarPrefabConfig_GetPlayerClassIcon(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerClassIcon' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.PlayerClassIcon;
    }
    return __r;
}
UFUNCTION()
FText __FAvatarPrefabConfig_GetPlayerPowerName(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerPowerName' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.PlayerPowerName;
    }
    return __r;
}
UFUNCTION()
FText __FAvatarPrefabConfig_GetPlayerIllustrate1(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerIllustrate1' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.PlayerIllustrate1;
    }
    return __r;
}
UFUNCTION()
FText __FAvatarPrefabConfig_GetAvatarBackgroundDesc(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarBackgroundDesc' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.AvatarBackgroundDesc;
    }
    return __r;
}
UFUNCTION()
FText __FAvatarPrefabConfig_GetSpecialtyDesc(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpecialtyDesc' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.SpecialtyDesc;
    }
    return __r;
}
UFUNCTION()
EAvatarIllustrate __FAvatarPrefabConfig_GetAvatarIllustrate(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    int local_669 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarIllustrate' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        local_669 = int(local_668.AvatarIllustrate);
        return EAvatarIllustrate(local_669);
    }
    return EAvatarIllustrate(local_669);
}
UFUNCTION()
EWeaponType __FAvatarPrefabConfig_GetWeaponType(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    int local_669 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeaponType' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        local_669 = int(local_668.WeaponType);
        return EWeaponType(local_669);
    }
    return EWeaponType(local_669);
}
UFUNCTION()
bool __FAvatarPrefabConfig_GetbIsMainPlayer(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsMainPlayer' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.bIsMainPlayer;
    }
    return local_1;
}
UFUNCTION()
bool __FAvatarPrefabConfig_GetbAlwaysHidden(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAlwaysHidden' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.bAlwaysHidden;
    }
    return local_1;
}
UFUNCTION()
bool __FAvatarPrefabConfig_GetbIsOfficialAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsOfficialAvatar' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.bIsOfficialAvatar;
    }
    return local_1;
}
UFUNCTION()
FDataObjectPtr __FAvatarPrefabConfig_GetInitValues(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FDataObjectPtr __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitValues' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.InitValues;
    }
    return __r;
}
UFUNCTION()
FName __FAvatarPrefabConfig_GetAvatarAudioSwitchName(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarAudioSwitchName' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.AvatarAudioSwitchName;
    }
    return __r;
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
    return GetSkills();
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
    return GetSkillConfig();
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
    return GetDefaultWeapon();
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
    return GetDefaultFoundation();
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
    return GetSkillBtnConfig();
}
UFUNCTION()
bool __FAvatarPrefabConfig_GetbDefaultUnlock(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bDefaultUnlock' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.bDefaultUnlock;
    }
    return local_1;
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
    return GetUnlockCondition();
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
    return GetPVPOverride();
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
    return GetGameModeOverride();
}
UFUNCTION()
TArray<FTrainingLevelConfig> __FAvatarPrefabConfig_GetTrainingLevelConfigs(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    TArray<FTrainingLevelConfig> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TrainingLevelConfigs' from a null 'FAvatarPrefabConfig' DataObject!");
        }
        FAvatarPrefabConfig local_668;
        return local_668.TrainingLevelConfigs;
    }
    return __r;
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
    return GetTrainingInfoConfigs();
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
    return GetDefaultFashion();
}
UFUNCTION()
FAvatarPrefabConfig CastToFAvatarPrefabConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout DataObject)
{
    FAvatarPrefabConfig __r;
    return __r;
}
}
