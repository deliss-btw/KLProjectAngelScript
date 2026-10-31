namespace __FSignalConfigFunctions
{
UFUNCTION()
FText __FSignalConfig_GetSignalName(const TDataObjectPtr<FSignalConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SignalName' from a null 'FSignalConfig' DataObject!");
        }
        FSignalConfig local_80;
        return local_80.SignalName;
    }
    return DataObject.Get().SignalName;
}
UFUNCTION()
FText __FSignalConfig_GetSignalContext(const TDataObjectPtr<FSignalConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SignalContext' from a null 'FSignalConfig' DataObject!");
        }
        FSignalConfig local_80;
        return local_80.SignalContext;
    }
    return DataObject.Get().SignalContext;
}
UFUNCTION()
FSoftBrush __FSignalConfig_GetSignalIconObject(const TDataObjectPtr<FSignalConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SignalIconObject' from a null 'FSignalConfig' DataObject!");
        }
        FSignalConfig local_80;
        return local_80.SignalIconObject;
    }
    return DataObject.Get().SignalIconObject;
}
UFUNCTION()
TSoftClassPtr<AFXActor> __FSignalConfig_GetFXActor(const TDataObjectPtr<FSignalConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FXActor' from a null 'FSignalConfig' DataObject!");
        }
        FSignalConfig local_80;
        return local_80.FXActor;
    }
    return DataObject.Get().FXActor;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OptionType' from a null 'FCustomWheelOptionConfig' DataObject!");
        }
        FCustomWheelOptionConfig local_90;
        return local_90.OptionType;
    }
    return DataObject.Get().OptionType;
}
UFUNCTION()
FName __FCustomWheelOptionConfig_GetOptionName(const TDataObjectPtr<FCustomWheelOptionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OptionName' from a null 'FCustomWheelOptionConfig' DataObject!");
        }
        FCustomWheelOptionConfig local_90;
        return local_90.OptionName;
    }
    return DataObject.Get().OptionName;
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
    return DataObject.Get().GetDefaultEmojiData();
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
    return DataObject.Get().GetDefaultSignalData();
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
    return DataObject.Get().GetDefaultMotionData();
}
UFUNCTION()
FCustomWheelOptionConfig CastToFCustomWheelOptionConfig(const TDataObjectPtr<FCustomWheelOptionConfig> &inout DataObject)
{
    FCustomWheelOptionConfig __r;
    return __r;
}
}
