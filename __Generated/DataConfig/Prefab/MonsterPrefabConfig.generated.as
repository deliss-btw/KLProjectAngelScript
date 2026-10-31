namespace __FPVPOverrideMonsterConfigFunctions
{
UFUNCTION()
FPVPGameAttributeByLevelConfig __FPVPOverrideMonsterConfig_GetGameAttributeConfig(const TDataObjectPtr<FPVPOverrideMonsterConfig> &inout DataObject)
{
    FPVPGameAttributeByLevelConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameAttributeConfig' from a null 'FPVPOverrideMonsterConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FPVPOverrideMonsterConfig CastToFPVPOverrideMonsterConfig(const TDataObjectPtr<FPVPOverrideMonsterConfig> &inout DataObject)
{
    FPVPOverrideMonsterConfig __r;
    return __r;
}
}
namespace __FGameModeOverrideMonsterConfigFunctions
{
UFUNCTION()
FPVPGameAttributeByLevelConfig __FGameModeOverrideMonsterConfig_GetGameAttributeConfig(const TDataObjectPtr<FGameModeOverrideMonsterConfig> &inout DataObject)
{
    FPVPGameAttributeByLevelConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameAttributeConfig' from a null 'FGameModeOverrideMonsterConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FGameModeOverrideMonsterConfig CastToFGameModeOverrideMonsterConfig(const TDataObjectPtr<FGameModeOverrideMonsterConfig> &inout DataObject)
{
    FGameModeOverrideMonsterConfig __r;
    return __r;
}
}
namespace __FMonsterPrefabConfigFunctions
{
UFUNCTION()
EMonsterRank __FMonsterPrefabConfig_GetMonsterRank(const TDataObjectPtr<FMonsterPrefabConfig> &inout DataObject)
{
    int local_153 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MonsterRank' from a null 'FMonsterPrefabConfig' DataObject!");
        }
        FMonsterPrefabConfig local_152;
        local_153 = int(local_152.MonsterRank);
        return EMonsterRank(local_153);
    }
    return EMonsterRank(local_153);
}
UFUNCTION()
uint8 __FMonsterPrefabConfig_GetWeakDamageType(const TDataObjectPtr<FMonsterPrefabConfig> &inout DataObject)
{
    int local_153 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeakDamageType' from a null 'FMonsterPrefabConfig' DataObject!");
        }
        FMonsterPrefabConfig local_152;
        return int(local_152.WeakDamageType);
    }
    return local_153;
}
UFUNCTION()
TDataObjectPtr<FSkillBtnConfig> __FMonsterPrefabConfig_GetSkillBtnConfig(const TDataObjectPtr<FMonsterPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SkillBtnConfig' from a null 'FMonsterPrefabConfig' DataObject!");
        }
        FMonsterPrefabConfig local_152;
        return local_152.GetSkillBtnConfig();
    }
    return GetSkillBtnConfig();
}
UFUNCTION()
int __FMonsterPrefabConfig_GetHPBarSegment(const TDataObjectPtr<FMonsterPrefabConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HPBarSegment' from a null 'FMonsterPrefabConfig' DataObject!");
        }
        FMonsterPrefabConfig defaultValue;
        return defaultValue.HPBarSegment;
    }
    return DataObject.Get().HPBarSegment;
}
UFUNCTION()
FText __FMonsterPrefabConfig_GetDisplayPrefix(const TDataObjectPtr<FMonsterPrefabConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayPrefix' from a null 'FMonsterPrefabConfig' DataObject!");
        }
        FMonsterPrefabConfig local_152;
        return local_152.DisplayPrefix;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FPVPOverrideMonsterConfig> __FMonsterPrefabConfig_GetPVPOverride(const TDataObjectPtr<FMonsterPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PVPOverride' from a null 'FMonsterPrefabConfig' DataObject!");
        }
        FMonsterPrefabConfig local_152;
        return local_152.GetPVPOverride();
    }
    return GetPVPOverride();
}
UFUNCTION()
TMap<EGameModeType, TDataObjectPtr<FGameModeOverrideMonsterConfig>> __FMonsterPrefabConfig_GetGameModeOverride(const TDataObjectPtr<FMonsterPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameModeOverride' from a null 'FMonsterPrefabConfig' DataObject!");
        }
        FMonsterPrefabConfig local_152;
        return local_152.GetGameModeOverride();
    }
    return GetGameModeOverride();
}
UFUNCTION()
FMonsterPrefabConfig CastToFMonsterPrefabConfig(const TDataObjectPtr<FMonsterPrefabConfig> &inout DataObject)
{
    FMonsterPrefabConfig __r;
    return __r;
}
}
