namespace __FLevelInfoConfigFunctions
{
UFUNCTION()
ELevelType __FLevelInfoConfig_GetLevelType(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelType' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.LevelType;
    }
    return DataObject.Get().LevelType;
}
UFUNCTION()
FString __FLevelInfoConfig_GetBaseLevelName(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseLevelName' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.BaseLevelName;
    }
    return DataObject.Get().BaseLevelName;
}
UFUNCTION()
FText __FLevelInfoConfig_GetLevelDisplayName(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelDisplayName' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.LevelDisplayName;
    }
    return DataObject.Get().LevelDisplayName;
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
    return DataObject.Get().GetMapConfig();
}
UFUNCTION()
TSoftClassPtr<UAS_GameModeSettings> __FLevelInfoConfig_GetGameSettings(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameSettings' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.GameSettings;
    }
    return DataObject.Get().GameSettings;
}
UFUNCTION()
TSet<EKLDataLayerFilterTags> __FLevelInfoConfig_GetLoadFilterTags(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LoadFilterTags' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.LoadFilterTags;
    }
    return DataObject.Get().LoadFilterTags;
}
UFUNCTION()
TSet<TSoftClassPtr<AKLLevelScriptActor>> __FLevelInfoConfig_GetExtraLoadDatalayerClasses(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraLoadDatalayerClasses' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.ExtraLoadDatalayerClasses;
    }
    return DataObject.Get().ExtraLoadDatalayerClasses;
}
UFUNCTION()
FKLGameplayTagQuery __FLevelInfoConfig_GetLoadTagQuery(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LoadTagQuery' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.LoadTagQuery;
    }
    return DataObject.Get().LoadTagQuery;
}
UFUNCTION()
ESpawnPointSelectionRule __FLevelInfoConfig_GetSpawnPointRule(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpawnPointRule' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.SpawnPointRule;
    }
    return DataObject.Get().SpawnPointRule;
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
    return DataObject.Get().GetReviveRule();
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
    return DataObject.Get().GetGameRuleConfig();
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
    return DataObject.Get().GetMinimapDisplayConfigOverride();
}
UFUNCTION()
bool __FLevelInfoConfig_GetbShowAllTeleporters(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowAllTeleporters' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.bShowAllTeleporters;
    }
    return DataObject.Get().bShowAllTeleporters;
}
UFUNCTION()
bool __FLevelInfoConfig_GetbIsDevLevel(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsDevLevel' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.bIsDevLevel;
    }
    return DataObject.Get().bIsDevLevel;
}
UFUNCTION()
bool __FLevelInfoConfig_GetbIsCommonLevel(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsCommonLevel' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.bIsCommonLevel;
    }
    return DataObject.Get().bIsCommonLevel;
}
UFUNCTION()
EInitWeatherPolicy __FLevelInfoConfig_GetInitWeatherPolicy(const TDataObjectPtr<FLevelInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitWeatherPolicy' from a null 'FLevelInfoConfig' DataObject!");
        }
        FLevelInfoConfig local_218;
        return local_218.InitWeatherPolicy;
    }
    return DataObject.Get().InitWeatherPolicy;
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
    return DataObject.Get().GetWeatherAreaTemplateOverride();
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
    return DataObject.Get().GetLevelInfoConfig();
}
UFUNCTION()
FLevelTypeConfig CastToFLevelTypeConfig(const TDataObjectPtr<FLevelTypeConfig> &inout DataObject)
{
    FLevelTypeConfig __r;
    return __r;
}
}
