namespace __FVirtualJoystickConfigFunctions
{
UFUNCTION()
float32 __FVirtualJoystickConfig_GetRadius(const TDataObjectPtr<FVirtualJoystickConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Radius' from a null 'FVirtualJoystickConfig' DataObject!");
        }
        FVirtualJoystickConfig defaultValue;
        return defaultValue.Radius;
    }
    return DataObject.Get().Radius;
}
UFUNCTION()
float32 __FVirtualJoystickConfig_GetDeadZone(const TDataObjectPtr<FVirtualJoystickConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DeadZone' from a null 'FVirtualJoystickConfig' DataObject!");
        }
        FVirtualJoystickConfig defaultValue;
        return defaultValue.DeadZone;
    }
    return DataObject.Get().DeadZone;
}
UFUNCTION()
FKey __FVirtualJoystickConfig_GetXAxis(const TDataObjectPtr<FVirtualJoystickConfig> &inout DataObject)
{
    FKey __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'XAxis' from a null 'FVirtualJoystickConfig' DataObject!");
        }
        FVirtualJoystickConfig local_30;
        return local_30.XAxis;
    }
    return __r;
}
UFUNCTION()
FKey __FVirtualJoystickConfig_GetYAxis(const TDataObjectPtr<FVirtualJoystickConfig> &inout DataObject)
{
    FKey __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'YAxis' from a null 'FVirtualJoystickConfig' DataObject!");
        }
        FVirtualJoystickConfig local_30;
        return local_30.YAxis;
    }
    return __r;
}
UFUNCTION()
FVirtualJoystickConfig CastToFVirtualJoystickConfig(const TDataObjectPtr<FVirtualJoystickConfig> &inout DataObject)
{
    FVirtualJoystickConfig __r;
    return __r;
}
}
