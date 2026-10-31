namespace __FSignalConfigFunctions
{
UFUNCTION()
FText __FSignalConfig_GetSignalName(const TDataObjectPtr<FSignalConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SignalName' from a null 'FSignalConfig' DataObject!");
        }
        FSignalConfig local_80;
        return local_80.SignalName;
    }
    return __r;
}
UFUNCTION()
FText __FSignalConfig_GetSignalContext(const TDataObjectPtr<FSignalConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SignalContext' from a null 'FSignalConfig' DataObject!");
        }
        FSignalConfig local_80;
        return local_80.SignalContext;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FSignalConfig_GetSignalIconObject(const TDataObjectPtr<FSignalConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SignalIconObject' from a null 'FSignalConfig' DataObject!");
        }
        FSignalConfig local_80;
        return local_80.SignalIconObject;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<AFXActor> __FSignalConfig_GetFXActor(const TDataObjectPtr<FSignalConfig> &inout DataObject)
{
    TSoftClassPtr<AFXActor> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FXActor' from a null 'FSignalConfig' DataObject!");
        }
        FSignalConfig local_80;
        return local_80.FXActor;
    }
    return __r;
}
UFUNCTION()
FSignalConfig CastToFSignalConfig(const TDataObjectPtr<FSignalConfig> &inout DataObject)
{
    FSignalConfig __r;
    return __r;
}
}
namespace __FCustomWheelOptionConfigFunctions
{
UFUNCTION()
int __FCustomWheelOptionConfig_GetIndex(const TDataObjectPtr<FCustomWheelOptionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Index' from a null 'FCustomWheelOptionConfig' DataObject!");
        }
        FCustomWheelOptionConfig defaultValue;
        return defaultValue.Index;
    }
    return DataObject.Get().Index;
}
UFUNCTION()
ECustomWheelOptionType __FCustomWheelOptionConfig_GetOptionType(const TDataObjectPtr<FCustomWheelOptionConfig> &inout DataObject)
{
    int local_91 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OptionType' from a null 'FCustomWheelOptionConfig' DataObject!");
        }
        FCustomWheelOptionConfig local_90;
        local_91 = int(local_90.OptionType);
        return ECustomWheelOptionType(local_91);
    }
    return ECustomWheelOptionType(local_91);
}
UFUNCTION()
FName __FCustomWheelOptionConfig_GetOptionName(const TDataObjectPtr<FCustomWheelOptionConfig> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OptionName' from a null 'FCustomWheelOptionConfig' DataObject!");
        }
        FCustomWheelOptionConfig local_90;
        return local_90.OptionName;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FEmojiData> __FCustomWheelOptionConfig_GetDefaultEmojiData(const TDataObjectPtr<FCustomWheelOptionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultEmojiData' from a null 'FCustomWheelOptionConfig' DataObject!");
        }
        FCustomWheelOptionConfig local_90;
        return local_90.GetDefaultEmojiData();
    }
    return GetDefaultEmojiData();
}
UFUNCTION()
TDataObjectPtr<FSignalConfig> __FCustomWheelOptionConfig_GetDefaultSignalData(const TDataObjectPtr<FCustomWheelOptionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultSignalData' from a null 'FCustomWheelOptionConfig' DataObject!");
        }
        FCustomWheelOptionConfig local_90;
        return local_90.GetDefaultSignalData();
    }
    return GetDefaultSignalData();
}
UFUNCTION()
TDataObjectPtr<FMotionData> __FCustomWheelOptionConfig_GetDefaultMotionData(const TDataObjectPtr<FCustomWheelOptionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultMotionData' from a null 'FCustomWheelOptionConfig' DataObject!");
        }
        FCustomWheelOptionConfig local_90;
        return local_90.GetDefaultMotionData();
    }
    return GetDefaultMotionData();
}
UFUNCTION()
FCustomWheelOptionConfig CastToFCustomWheelOptionConfig(const TDataObjectPtr<FCustomWheelOptionConfig> &inout DataObject)
{
    FCustomWheelOptionConfig __r;
    return __r;
}
}
