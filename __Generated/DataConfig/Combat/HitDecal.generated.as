namespace __FHitDecalConfigFunctions
{
UFUNCTION()
int __FHitDecalConfig_GetDecalTextureID(const TDataObjectPtr<FHitDecalConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DecalTextureID' from a null 'FHitDecalConfig' DataObject!");
        }
        FHitDecalConfig defaultValue;
        return defaultValue.DecalTextureID;
    }
    return DataObject.Get().DecalTextureID;
}
UFUNCTION()
FVector __FHitDecalConfig_GetSize(const TDataObjectPtr<FHitDecalConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Size' from a null 'FHitDecalConfig' DataObject!");
        }
        FHitDecalConfig local_28;
        return local_28.Size;
    }
    return DataObject.Get().Size;
}
UFUNCTION()
float32 __FHitDecalConfig_GetDuration(const TDataObjectPtr<FHitDecalConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Duration' from a null 'FHitDecalConfig' DataObject!");
        }
        FHitDecalConfig defaultValue;
        return defaultValue.Duration;
    }
    return DataObject.Get().Duration;
}
UFUNCTION()
float32 __FHitDecalConfig_GetInitOpacity(const TDataObjectPtr<FHitDecalConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitOpacity' from a null 'FHitDecalConfig' DataObject!");
        }
        FHitDecalConfig defaultValue;
        return defaultValue.InitOpacity;
    }
    return DataObject.Get().InitOpacity;
}
UFUNCTION()
bool __FHitDecalConfig_GetbFadeOutByTime(const TDataObjectPtr<FHitDecalConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bFadeOutByTime' from a null 'FHitDecalConfig' DataObject!");
        }
        FHitDecalConfig local_28;
        return local_28.bFadeOutByTime;
    }
    return DataObject.Get().bFadeOutByTime;
}
UFUNCTION()
float32 __FHitDecalConfig_GetFadeStartTime(const TDataObjectPtr<FHitDecalConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FadeStartTime' from a null 'FHitDecalConfig' DataObject!");
        }
        FHitDecalConfig defaultValue;
        return defaultValue.FadeStartTime;
    }
    return DataObject.Get().FadeStartTime;
}
UFUNCTION()
float32 __FHitDecalConfig_GetEmissive(const TDataObjectPtr<FHitDecalConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Emissive' from a null 'FHitDecalConfig' DataObject!");
        }
        FHitDecalConfig defaultValue;
        return defaultValue.Emissive;
    }
    return DataObject.Get().Emissive;
}
UFUNCTION()
FHitDecalConfig CastToFHitDecalConfig(const TDataObjectPtr<FHitDecalConfig> &inout DataObject)
{
    FHitDecalConfig __r;
    return __r;
}
}
