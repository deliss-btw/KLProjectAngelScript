namespace __FMapConfigFunctions
{
UFUNCTION()
FText __FMapConfig_GetMapName(const TDataObjectPtr<FMapConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MapName' from a null 'FMapConfig' DataObject!");
        }
        FMapConfig local_178;
        return local_178.MapName;
    }
    return __r;
}
UFUNCTION()
TSoftObjectPtr<UWorld> __FMapConfig_GetMapReference(const TDataObjectPtr<FMapConfig> &inout DataObject)
{
    TSoftObjectPtr<UWorld> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MapReference' from a null 'FMapConfig' DataObject!");
        }
        FMapConfig local_178;
        return local_178.MapReference;
    }
    return __r;
}
UFUNCTION()
FName __FMapConfig_GetAssetName(const TDataObjectPtr<FMapConfig> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AssetName' from a null 'FMapConfig' DataObject!");
        }
        FMapConfig local_178;
        return local_178.AssetName;
    }
    return __r;
}
UFUNCTION()
FName __FMapConfig_GetFullName(const TDataObjectPtr<FMapConfig> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FullName' from a null 'FMapConfig' DataObject!");
        }
        FMapConfig local_178;
        return local_178.FullName;
    }
    return __r;
}
UFUNCTION()
FSimpleAudioSet __FMapConfig_GetLoadMapAudioSet(const TDataObjectPtr<FMapConfig> &inout DataObject)
{
    FSimpleAudioSet __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LoadMapAudioSet' from a null 'FMapConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FSimpleAudioSet __FMapConfig_GetUnLoadMapAudioSet(const TDataObjectPtr<FMapConfig> &inout DataObject)
{
    FSimpleAudioSet __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnLoadMapAudioSet' from a null 'FMapConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
TMap<int, FDefaultCombatBGMConfig> __FMapConfig_GetDefaultCombatBGM(const TDataObjectPtr<FMapConfig> &inout DataObject)
{
    TMap<int, FDefaultCombatBGMConfig> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultCombatBGM' from a null 'FMapConfig' DataObject!");
        }
        FMapConfig local_178;
        return local_178.DefaultCombatBGM;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FMinimapDisplayConfig> __FMapConfig_GetMinimapDisplayConfig(const TDataObjectPtr<FMapConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinimapDisplayConfig' from a null 'FMapConfig' DataObject!");
        }
        FMapConfig local_178;
        return local_178.GetMinimapDisplayConfig();
    }
    return GetMinimapDisplayConfig();
}
UFUNCTION()
FMapConfig CastToFMapConfig(const TDataObjectPtr<FMapConfig> &inout DataObject)
{
    FMapConfig __r;
    return __r;
}
}
