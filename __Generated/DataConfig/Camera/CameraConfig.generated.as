namespace __FFixedCameraConfigFunctions
{
UFUNCTION()
FVector __FFixedCameraConfig_GetOffsetPosition(const TDataObjectPtr<FFixedCameraConfig> &inout DataObject)
{
    FVector __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OffsetPosition' from a null 'FFixedCameraConfig' DataObject!");
        }
        FFixedCameraConfig local_104;
        return local_104.OffsetPosition;
    }
    return __r;
}
UFUNCTION()
FRotator __FFixedCameraConfig_GetRotation(const TDataObjectPtr<FFixedCameraConfig> &inout DataObject)
{
    FRotator __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Rotation' from a null 'FFixedCameraConfig' DataObject!");
        }
        FFixedCameraConfig local_104;
        return local_104.Rotation;
    }
    return __r;
}
UFUNCTION()
bool __FFixedCameraConfig_GetbAbsoluteRotation(const TDataObjectPtr<FFixedCameraConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAbsoluteRotation' from a null 'FFixedCameraConfig' DataObject!");
        }
        FFixedCameraConfig local_104;
        return local_104.bAbsoluteRotation;
    }
    return local_1;
}
UFUNCTION()
float32 __FFixedCameraConfig_GetFOV(const TDataObjectPtr<FFixedCameraConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FOV' from a null 'FFixedCameraConfig' DataObject!");
        }
        FFixedCameraConfig defaultValue;
        return defaultValue.FOV;
    }
    return DataObject.Get().FOV;
}
UFUNCTION()
FCameraBlendConfig __FFixedCameraConfig_GetBlendConfig(const TDataObjectPtr<FFixedCameraConfig> &inout DataObject)
{
    FCameraBlendConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BlendConfig' from a null 'FFixedCameraConfig' DataObject!");
        }
        FFixedCameraConfig local_104;
        return local_104.BlendConfig;
    }
    return __r;
}
UFUNCTION()
FFixedCameraConfig CastToFFixedCameraConfig(const TDataObjectPtr<FFixedCameraConfig> &inout DataObject)
{
    FFixedCameraConfig __r;
    return __r;
}
}
