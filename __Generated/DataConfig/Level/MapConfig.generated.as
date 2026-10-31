namespace __FMapConfigFunctions
{
UFUNCTION()
FText __FMapConfig_GetMapName(const TDataObjectPtr<FMapConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MapName' from a null 'FMapConfig' DataObject!");
        }
        FMapConfig local_178;
        return local_178.MapName;
    }
    return DataObject.Get().MapName;
}
UFUNCTION()
TSoftObjectPtr<UWorld> __FMapConfig_GetMapReference(const TDataObjectPtr<FMapConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MapReference' from a null 'FMapConfig' DataObject!");
        }
        FMapConfig local_178;
        return local_178.MapReference;
    }
    return DataObject.Get().MapReference;
}
UFUNCTION()
FName __FMapConfig_GetAssetName(const TDataObjectPtr<FMapConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AssetName' from a null 'FMapConfig' DataObject!");
        }
        FMapConfig local_178;
        return local_178.AssetName;
    }
    return DataObject.Get().AssetName;
}
UFUNCTION()
FName __FMapConfig_GetFullName(const TDataObjectPtr<FMapConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FullName' from a null 'FMapConfig' DataObject!");
        }
        FMapConfig local_178;
        return local_178.FullName;
    }
    return DataObject.Get().FullName;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultCombatBGM' from a null 'FMapConfig' DataObject!");
        }
        FMapConfig local_178;
        return local_178.DefaultCombatBGM;
    }
    return DataObject.Get().DefaultCombatBGM;
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
    return DataObject.Get().GetMinimapDisplayConfig();
}
UFUNCTION()
FMapConfig CastToFMapConfig(const TDataObjectPtr<FMapConfig> &inout DataObject)
{
    FMapConfig __r;
    return __r;
}
}
