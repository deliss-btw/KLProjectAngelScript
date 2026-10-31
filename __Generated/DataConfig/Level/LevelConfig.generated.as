namespace __FLevelInfoConfigFunctions
{
UFUNCTION()
ELevelType __FLevelInfoConfig_GetLevelType(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    int local_219 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelType' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        local_219 = int(local_218.LevelType);
        return ELevelType(local_219);
    }
    return ELevelType(local_219);
}
UFUNCTION()
FString __FLevelInfoConfig_GetBaseLevelName(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseLevelName' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.BaseLevelName;
    }
    return __r;
}
UFUNCTION()
FText __FLevelInfoConfig_GetLevelDisplayName(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelDisplayName' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.LevelDisplayName;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FMapConfig> __FLevelInfoConfig_GetMapConfig(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MapConfig' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.GetMapConfig();
    }
    return GetMapConfig();
}
UFUNCTION()
TSoftClassPtr<UAS_GameModeSettings> __FLevelInfoConfig_GetGameSettings(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    TSoftClassPtr<UAS_GameModeSettings> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameSettings' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.GameSettings;
    }
    return __r;
}
UFUNCTION()
TSet<EKLDataLayerFilterTags> __FLevelInfoConfig_GetLoadFilterTags(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    TSet<EKLDataLayerFilterTags> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LoadFilterTags' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.LoadFilterTags;
    }
    return __r;
}
UFUNCTION()
TSet<TSoftClassPtr<AKLLevelScriptActor>> __FLevelInfoConfig_GetExtraLoadDatalayerClasses(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    TSet<TSoftClassPtr<AKLLevelScriptActor>> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraLoadDatalayerClasses' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.ExtraLoadDatalayerClasses;
    }
    return __r;
}
UFUNCTION()
FKLGameplayTagQuery __FLevelInfoConfig_GetLoadTagQuery(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    FKLGameplayTagQuery __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LoadTagQuery' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.LoadTagQuery;
    }
    return __r;
}
UFUNCTION()
ESpawnPointSelectionRule __FLevelInfoConfig_GetSpawnPointRule(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    int local_219 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpawnPointRule' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        local_219 = int(local_218.SpawnPointRule);
        return ESpawnPointSelectionRule(local_219);
    }
    return ESpawnPointSelectionRule(local_219);
}
UFUNCTION()
TDataObjectPtr<FReviveData> __FLevelInfoConfig_GetReviveRule(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReviveRule' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.GetReviveRule();
    }
    return GetReviveRule();
}
UFUNCTION()
TDataObjectPtr<FGameRuleConfig> __FLevelInfoConfig_GetGameRuleConfig(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameRuleConfig' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.GetGameRuleConfig();
    }
    return GetGameRuleConfig();
}
UFUNCTION()
TDataObjectPtr<FMinimapDisplayConfig> __FLevelInfoConfig_GetMinimapDisplayConfigOverride(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinimapDisplayConfigOverride' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.GetMinimapDisplayConfigOverride();
    }
    return GetMinimapDisplayConfigOverride();
}
UFUNCTION()
bool __FLevelInfoConfig_GetbShowAllTeleporters(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowAllTeleporters' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.bShowAllTeleporters;
    }
    return local_1;
}
UFUNCTION()
bool __FLevelInfoConfig_GetbIsDevLevel(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsDevLevel' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.bIsDevLevel;
    }
    return local_1;
}
UFUNCTION()
bool __FLevelInfoConfig_GetbIsCommonLevel(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsCommonLevel' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.bIsCommonLevel;
    }
    return local_1;
}
UFUNCTION()
EInitWeatherPolicy __FLevelInfoConfig_GetInitWeatherPolicy(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    int local_219 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitWeatherPolicy' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        local_219 = int(local_218.InitWeatherPolicy);
        return EInitWeatherPolicy(local_219);
    }
    return EInitWeatherPolicy(local_219);
}
UFUNCTION()
TDataObjectPtr<FAreaWeatherTemplateConfig> __FLevelInfoConfig_GetWeatherAreaTemplateOverride(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherAreaTemplateOverride' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.GetWeatherAreaTemplateOverride();
    }
    return GetWeatherAreaTemplateOverride();
}
UFUNCTION()
FLevelInfoConfig CastToFLevelInfoConfig(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    FLevelInfoConfig __r;
    return __r;
}
}
namespace __FLevelTypeConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FLevelInfoConfig> __FLevelTypeConfig_GetLevelInfoConfig(const TDataObjectPtr<FLevelTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelInfoConfig' from a null 'FLevelTypeConfig' DataObject!");
        }
        FLevelTypeConfig local_40;
        return local_40.GetLevelInfoConfig();
    }
    return GetLevelInfoConfig();
}
UFUNCTION()
FLevelTypeConfig CastToFLevelTypeConfig(const TDataObjectPtr<FLevelTypeConfig> &inout DataObject)
{
    FLevelTypeConfig __r;
    return __r;
}
}
