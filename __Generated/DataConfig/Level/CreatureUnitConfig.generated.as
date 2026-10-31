namespace __FCreatureAttributeScaleByLevelConfigFunctions
{
UFUNCTION()
TMap<int, FCreatureAttributeScaleData> __FCreatureAttributeScaleByLevelConfig_GetAttributeScaleByLevel(const TDataObjectPtr<FCreatureAttributeScaleByLevelConfig> &inout DataObject)
{
    TMap<int, FCreatureAttributeScaleData> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttributeScaleByLevel' from a null 'FCreatureAttributeScaleByLevelConfig' DataObject!");
        }
        FCreatureAttributeScaleByLevelConfig local_34;
        return local_34.AttributeScaleByLevel;
    }
    return __r;
}
UFUNCTION()
FCreatureAttributeScaleByLevelConfig CastToFCreatureAttributeScaleByLevelConfig(const TDataObjectPtr<FCreatureAttributeScaleByLevelConfig> &inout DataObject)
{
    FCreatureAttributeScaleByLevelConfig __r;
    return __r;
}
}
namespace __FCombatUnitBaseConfigFunctions
{
UFUNCTION()
FString __FCombatUnitBaseConfig_GetFriendlyName(const TDataObjectPtr<FCombatUnitBaseConfig> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FriendlyName' from a null 'FCombatUnitBaseConfig' DataObject!");
        }
        FCombatUnitBaseConfig local_126;
        return local_126.FriendlyName;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<ACharacterPrefab> __FCombatUnitBaseConfig_GetPrefab(const TDataObjectPtr<FCombatUnitBaseConfig> &inout DataObject)
{
    TSoftClassPtr<ACharacterPrefab> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Prefab' from a null 'FCombatUnitBaseConfig' DataObject!");
        }
        FCombatUnitBaseConfig local_126;
        return local_126.Prefab;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FGameAttributeInitConfig_CombatUnit> __FCombatUnitBaseConfig_GetInitAttributeValues(const TDataObjectPtr<FCombatUnitBaseConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitAttributeValues' from a null 'FCombatUnitBaseConfig' DataObject!");
        }
        FCombatUnitBaseConfig local_126;
        return local_126.GetInitAttributeValues();
    }
    return GetInitAttributeValues();
}
UFUNCTION()
TDataObjectPtr<FAITargetingConfig> __FCombatUnitBaseConfig_GetTargetingConfig(const TDataObjectPtr<FCombatUnitBaseConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetingConfig' from a null 'FCombatUnitBaseConfig' DataObject!");
        }
        FCombatUnitBaseConfig local_126;
        return local_126.GetTargetingConfig();
    }
    return GetTargetingConfig();
}
UFUNCTION()
TDataObjectPtr<FAIQuitCombatConfig> __FCombatUnitBaseConfig_GetQuitCombatConfig(const TDataObjectPtr<FCombatUnitBaseConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'QuitCombatConfig' from a null 'FCombatUnitBaseConfig' DataObject!");
        }
        FCombatUnitBaseConfig local_126;
        return local_126.GetQuitCombatConfig();
    }
    return GetQuitCombatConfig();
}
UFUNCTION()
TDataObjectPtr<FAIPerceptionConfig> __FCombatUnitBaseConfig_GetPerceptionConfig(const TDataObjectPtr<FCombatUnitBaseConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PerceptionConfig' from a null 'FCombatUnitBaseConfig' DataObject!");
        }
        FCombatUnitBaseConfig local_126;
        return local_126.GetPerceptionConfig();
    }
    return GetPerceptionConfig();
}
UFUNCTION()
EMonsterRank __FCombatUnitBaseConfig_GetRank(const TDataObjectPtr<FCombatUnitBaseConfig> &inout DataObject)
{
    int local_127 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Rank' from a null 'FCombatUnitBaseConfig' DataObject!");
        }
        FCombatUnitBaseConfig local_126;
        local_127 = int(local_126.Rank);
        return EMonsterRank(local_127);
    }
    return EMonsterRank(local_127);
}
UFUNCTION()
FCombatUnitBaseConfig CastToFCombatUnitBaseConfig(const TDataObjectPtr<FCombatUnitBaseConfig> &inout DataObject)
{
    FCombatUnitBaseConfig __r;
    return __r;
}
}
namespace __FNPCWatchPlayerLookPresetConfigFunctions
{
UFUNCTION()
ENPCWatchPlayerLookMode __FNPCWatchPlayerLookPresetConfig_GetWatchPlayerLookMode(const TDataObjectPtr<FNPCWatchPlayerLookPresetConfig> &inout DataObject)
{
    int local_23 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WatchPlayerLookMode' from a null 'FNPCWatchPlayerLookPresetConfig' DataObject!");
        }
        FNPCWatchPlayerLookPresetConfig local_22;
        local_23 = int(local_22.WatchPlayerLookMode);
        return ENPCWatchPlayerLookMode(local_23);
    }
    return ENPCWatchPlayerLookMode(local_23);
}
UFUNCTION()
float32 __FNPCWatchPlayerLookPresetConfig_GetMinPitchAngle(const TDataObjectPtr<FNPCWatchPlayerLookPresetConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinPitchAngle' from a null 'FNPCWatchPlayerLookPresetConfig' DataObject!");
        }
        FNPCWatchPlayerLookPresetConfig defaultValue;
        return defaultValue.MinPitchAngle;
    }
    return DataObject.Get().MinPitchAngle;
}
UFUNCTION()
float32 __FNPCWatchPlayerLookPresetConfig_GetMaxPitchAngle(const TDataObjectPtr<FNPCWatchPlayerLookPresetConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxPitchAngle' from a null 'FNPCWatchPlayerLookPresetConfig' DataObject!");
        }
        FNPCWatchPlayerLookPresetConfig defaultValue;
        return defaultValue.MaxPitchAngle;
    }
    return DataObject.Get().MaxPitchAngle;
}
UFUNCTION()
float32 __FNPCWatchPlayerLookPresetConfig_GetMinYawAngle(const TDataObjectPtr<FNPCWatchPlayerLookPresetConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinYawAngle' from a null 'FNPCWatchPlayerLookPresetConfig' DataObject!");
        }
        FNPCWatchPlayerLookPresetConfig defaultValue;
        return defaultValue.MinYawAngle;
    }
    return DataObject.Get().MinYawAngle;
}
UFUNCTION()
float32 __FNPCWatchPlayerLookPresetConfig_GetMaxYawAngle(const TDataObjectPtr<FNPCWatchPlayerLookPresetConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxYawAngle' from a null 'FNPCWatchPlayerLookPresetConfig' DataObject!");
        }
        FNPCWatchPlayerLookPresetConfig defaultValue;
        return defaultValue.MaxYawAngle;
    }
    return DataObject.Get().MaxYawAngle;
}
UFUNCTION()
float32 __FNPCWatchPlayerLookPresetConfig_GetEnterRange(const TDataObjectPtr<FNPCWatchPlayerLookPresetConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EnterRange' from a null 'FNPCWatchPlayerLookPresetConfig' DataObject!");
        }
        FNPCWatchPlayerLookPresetConfig defaultValue;
        return defaultValue.EnterRange;
    }
    return DataObject.Get().EnterRange;
}
UFUNCTION()
float32 __FNPCWatchPlayerLookPresetConfig_GetExitRange(const TDataObjectPtr<FNPCWatchPlayerLookPresetConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExitRange' from a null 'FNPCWatchPlayerLookPresetConfig' DataObject!");
        }
        FNPCWatchPlayerLookPresetConfig defaultValue;
        return defaultValue.ExitRange;
    }
    return DataObject.Get().ExitRange;
}
UFUNCTION()
int __FNPCWatchPlayerLookPresetConfig_GetPriority(const TDataObjectPtr<FNPCWatchPlayerLookPresetConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Priority' from a null 'FNPCWatchPlayerLookPresetConfig' DataObject!");
        }
        FNPCWatchPlayerLookPresetConfig defaultValue;
        return defaultValue.Priority;
    }
    return DataObject.Get().Priority;
}
UFUNCTION()
FNPCWatchPlayerLookPresetConfig CastToFNPCWatchPlayerLookPresetConfig(const TDataObjectPtr<FNPCWatchPlayerLookPresetConfig> &inout DataObject)
{
    FNPCWatchPlayerLookPresetConfig __r;
    return __r;
}
}
namespace __FCreatureUnitConfigFunctions
{
UFUNCTION()
FString __FCreatureUnitConfig_GetFriendlyName(const TDataObjectPtr<FCreatureUnitConfig> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FriendlyName' from a null 'FCreatureUnitConfig' DataObject!");
        }
        FCreatureUnitConfig local_156;
        return local_156.FriendlyName;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FCombatUnitBaseConfig> __FCreatureUnitConfig_GetCombatConfig(const TDataObjectPtr<FCreatureUnitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CombatConfig' from a null 'FCreatureUnitConfig' DataObject!");
        }
        FCreatureUnitConfig local_156;
        return local_156.GetCombatConfig();
    }
    return GetCombatConfig();
}
UFUNCTION()
TMap<TSubclassOf<UGameAttribute>, float32> __FCreatureUnitConfig_GetAttributeScale(const TDataObjectPtr<FCreatureUnitConfig> &inout DataObject)
{
    TMap<TSubclassOf<UGameAttribute>, float32> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttributeScale' from a null 'FCreatureUnitConfig' DataObject!");
        }
        FCreatureUnitConfig local_156;
        return local_156.AttributeScale;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FPresentationRuleConfig> __FCreatureUnitConfig_GetPresentationRuleConfig(const TDataObjectPtr<FCreatureUnitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PresentationRuleConfig' from a null 'FCreatureUnitConfig' DataObject!");
        }
        FCreatureUnitConfig local_156;
        return local_156.GetPresentationRuleConfig();
    }
    return GetPresentationRuleConfig();
}
UFUNCTION()
TDataObjectPtr<FNPCWatchPlayerLookPresetConfig> __FCreatureUnitConfig_GetWatchPlayerLookPreset(const TDataObjectPtr<FCreatureUnitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WatchPlayerLookPreset' from a null 'FCreatureUnitConfig' DataObject!");
        }
        FCreatureUnitConfig local_156;
        return local_156.GetWatchPlayerLookPreset();
    }
    return GetWatchPlayerLookPreset();
}
UFUNCTION()
TArray<TDataObjectPtr<FDropItemConfigBase>> __FCreatureUnitConfig_GetDropItems(const TDataObjectPtr<FCreatureUnitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DropItems' from a null 'FCreatureUnitConfig' DataObject!");
        }
        FCreatureUnitConfig local_156;
        return local_156.GetDropItems();
    }
    return GetDropItems();
}
UFUNCTION()
TArray<FBuffConfigRef> __FCreatureUnitConfig_GetInitBuffs(const TDataObjectPtr<FCreatureUnitConfig> &inout DataObject)
{
    TArray<FBuffConfigRef> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitBuffs' from a null 'FCreatureUnitConfig' DataObject!");
        }
        FCreatureUnitConfig local_156;
        return local_156.InitBuffs;
    }
    return __r;
}
UFUNCTION()
FGameplayTagContainer __FCreatureUnitConfig_GetInitGameplayTags(const TDataObjectPtr<FCreatureUnitConfig> &inout DataObject)
{
    FGameplayTagContainer __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitGameplayTags' from a null 'FCreatureUnitConfig' DataObject!");
        }
        FCreatureUnitConfig local_156;
        return local_156.InitGameplayTags;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FEcologyCreatureDefinitionRow> __FCreatureUnitConfig_GetCreature(const TDataObjectPtr<FCreatureUnitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Creature' from a null 'FCreatureUnitConfig' DataObject!");
        }
        FCreatureUnitConfig local_156;
        return local_156.GetCreature();
    }
    return GetCreature();
}
UFUNCTION()
bool __FCreatureUnitConfig_GetbAvailableForLevelPlacement(const TDataObjectPtr<FCreatureUnitConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAvailableForLevelPlacement' from a null 'FCreatureUnitConfig' DataObject!");
        }
        FCreatureUnitConfig local_156;
        return local_156.bAvailableForLevelPlacement;
    }
    return local_1;
}
UFUNCTION()
FCreatureUnitConfig CastToFCreatureUnitConfig(const TDataObjectPtr<FCreatureUnitConfig> &inout DataObject)
{
    FCreatureUnitConfig __r;
    return __r;
}
}
