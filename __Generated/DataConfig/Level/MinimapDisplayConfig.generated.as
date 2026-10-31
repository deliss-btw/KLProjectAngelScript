namespace __FMinimapDisplayConfigFunctions
{
UFUNCTION()
TSoftObjectPtr<UMinimapConfig> __FMinimapDisplayConfig_GetMinimapConfig(const TDataObjectPtr<FMinimapDisplayConfig> &inout DataObject)
{
    TSoftObjectPtr<UMinimapConfig> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinimapConfig' from a null 'FMinimapDisplayConfig' DataObject!");
        }
        FMinimapDisplayConfig local_62;
        return local_62.MinimapConfig;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<UMinimapIconRegistryAsset> __FMinimapDisplayConfig_GetDefaultIconRegistry(const TDataObjectPtr<FMinimapDisplayConfig> &inout DataObject)
{
    TSoftClassPtr<UMinimapIconRegistryAsset> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultIconRegistry' from a null 'FMinimapDisplayConfig' DataObject!");
        }
        FMinimapDisplayConfig local_62;
        return local_62.DefaultIconRegistry;
    }
    return __r;
}
UFUNCTION()
float32 __FMinimapDisplayConfig_GetBaseMapScale(const TDataObjectPtr<FMinimapDisplayConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseMapScale' from a null 'FMinimapDisplayConfig' DataObject!");
        }
        FMinimapDisplayConfig defaultValue;
        return defaultValue.BaseMapScale;
    }
    return DataObject.Get().BaseMapScale;
}
UFUNCTION()
float32 __FMinimapDisplayConfig_GetDefaultMapScale(const TDataObjectPtr<FMinimapDisplayConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultMapScale' from a null 'FMinimapDisplayConfig' DataObject!");
        }
        FMinimapDisplayConfig defaultValue;
        return defaultValue.DefaultMapScale;
    }
    return DataObject.Get().DefaultMapScale;
}
UFUNCTION()
float32 __FMinimapDisplayConfig_GetMinMapScale(const TDataObjectPtr<FMinimapDisplayConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinMapScale' from a null 'FMinimapDisplayConfig' DataObject!");
        }
        FMinimapDisplayConfig defaultValue;
        return defaultValue.MinMapScale;
    }
    return DataObject.Get().MinMapScale;
}
UFUNCTION()
float32 __FMinimapDisplayConfig_GetMaxMapScale(const TDataObjectPtr<FMinimapDisplayConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxMapScale' from a null 'FMinimapDisplayConfig' DataObject!");
        }
        FMinimapDisplayConfig defaultValue;
        return defaultValue.MaxMapScale;
    }
    return DataObject.Get().MaxMapScale;
}
UFUNCTION()
float32 __FMinimapDisplayConfig_GetWorldMapDefaultMapScale(const TDataObjectPtr<FMinimapDisplayConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WorldMapDefaultMapScale' from a null 'FMinimapDisplayConfig' DataObject!");
        }
        FMinimapDisplayConfig defaultValue;
        return defaultValue.WorldMapDefaultMapScale;
    }
    return DataObject.Get().WorldMapDefaultMapScale;
}
UFUNCTION()
float32 __FMinimapDisplayConfig_GetWorldMapMinMapScale(const TDataObjectPtr<FMinimapDisplayConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WorldMapMinMapScale' from a null 'FMinimapDisplayConfig' DataObject!");
        }
        FMinimapDisplayConfig defaultValue;
        return defaultValue.WorldMapMinMapScale;
    }
    return DataObject.Get().WorldMapMinMapScale;
}
UFUNCTION()
float32 __FMinimapDisplayConfig_GetWorldMapMaxMapScale(const TDataObjectPtr<FMinimapDisplayConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WorldMapMaxMapScale' from a null 'FMinimapDisplayConfig' DataObject!");
        }
        FMinimapDisplayConfig defaultValue;
        return defaultValue.WorldMapMaxMapScale;
    }
    return DataObject.Get().WorldMapMaxMapScale;
}
UFUNCTION()
bool __FMinimapDisplayConfig_GetbShowDSBoundary(const TDataObjectPtr<FMinimapDisplayConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowDSBoundary' from a null 'FMinimapDisplayConfig' DataObject!");
        }
        FMinimapDisplayConfig local_62;
        return local_62.bShowDSBoundary;
    }
    return local_1;
}
UFUNCTION()
bool __FMinimapDisplayConfig_GetbDSBoundaryMaskStandsForUnreachable(const TDataObjectPtr<FMinimapDisplayConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bDSBoundaryMaskStandsForUnreachable' from a null 'FMinimapDisplayConfig' DataObject!");
        }
        FMinimapDisplayConfig local_62;
        return local_62.bDSBoundaryMaskStandsForUnreachable;
    }
    return local_1;
}
UFUNCTION()
TSoftObjectPtr<UTexture2D> __FMinimapDisplayConfig_GetDSBoundaryMaskTexture(const TDataObjectPtr<FMinimapDisplayConfig> &inout DataObject)
{
    TSoftObjectPtr<UTexture2D> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DSBoundaryMaskTexture' from a null 'FMinimapDisplayConfig' DataObject!");
        }
        FMinimapDisplayConfig local_62;
        return local_62.DSBoundaryMaskTexture;
    }
    return __r;
}
UFUNCTION()
FBox2D __FMinimapDisplayConfig_GetDSBoundaryMaskWorldPosition(const TDataObjectPtr<FMinimapDisplayConfig> &inout DataObject)
{
    FBox2D __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DSBoundaryMaskWorldPosition' from a null 'FMinimapDisplayConfig' DataObject!");
        }
        FMinimapDisplayConfig local_62;
        return local_62.DSBoundaryMaskWorldPosition;
    }
    return __r;
}
UFUNCTION()
FMinimapDisplayConfig CastToFMinimapDisplayConfig(const TDataObjectPtr<FMinimapDisplayConfig> &inout DataObject)
{
    FMinimapDisplayConfig __r;
    return __r;
}
}
