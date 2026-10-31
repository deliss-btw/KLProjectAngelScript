namespace __FWeatherAudioConfigFunctions
{
UFUNCTION()
FSimpleAudioSet __FWeatherAudioConfig_GetWeatherEnter(const TDataObjectPtr<FWeatherAudioConfig> &inout DataObject)
{
    FSimpleAudioSet __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherEnter' from a null 'FWeatherAudioConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FSimpleAudioSet __FWeatherAudioConfig_GetWeatherExit(const TDataObjectPtr<FWeatherAudioConfig> &inout DataObject)
{
    FSimpleAudioSet __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherExit' from a null 'FWeatherAudioConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FWeatherAudioConfig CastToFWeatherAudioConfig(const TDataObjectPtr<FWeatherAudioConfig> &inout DataObject)
{
    FWeatherAudioConfig __r;
    return __r;
}
}
namespace __FRegionAudioConfigFunctions
{
UFUNCTION()
FSimpleAudioSet __FRegionAudioConfig_GetRegionEnter(const TDataObjectPtr<FRegionAudioConfig> &inout DataObject)
{
    FSimpleAudioSet __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RegionEnter' from a null 'FRegionAudioConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FSimpleAudioSet __FRegionAudioConfig_GetRegionExit(const TDataObjectPtr<FRegionAudioConfig> &inout DataObject)
{
    FSimpleAudioSet __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RegionExit' from a null 'FRegionAudioConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FRegionAudioConfig CastToFRegionAudioConfig(const TDataObjectPtr<FRegionAudioConfig> &inout DataObject)
{
    FRegionAudioConfig __r;
    return __r;
}
}
namespace __FTimeOfDayStageAudioConfigFunctions
{
UFUNCTION()
TSoftObjectPtr<UAkStateValue> __FTimeOfDayStageAudioConfig_GetTimeOfDayState(const TDataObjectPtr<FTimeOfDayStageAudioConfig> &inout DataObject)
{
    TSoftObjectPtr<UAkStateValue> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TimeOfDayState' from a null 'FTimeOfDayStageAudioConfig' DataObject!");
        }
        FTimeOfDayStageAudioConfig local_24;
        return local_24.TimeOfDayState;
    }
    return __r;
}
UFUNCTION()
FTimeOfDayStageAudioConfig CastToFTimeOfDayStageAudioConfig(const TDataObjectPtr<FTimeOfDayStageAudioConfig> &inout DataObject)
{
    FTimeOfDayStageAudioConfig __r;
    return __r;
}
}
namespace __FInstrumentAudioConfigFunctions
{
UFUNCTION()
FName __FInstrumentAudioConfig_GetInstrumentId(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InstrumentId' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.InstrumentId;
    }
    return __r;
}
UFUNCTION()
FName __FInstrumentAudioConfig_GetPrefabClassName(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PrefabClassName' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.PrefabClassName;
    }
    return __r;
}
UFUNCTION()
FName __FInstrumentAudioConfig_GetSwitchGroupName(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SwitchGroupName' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.SwitchGroupName;
    }
    return __r;
}
UFUNCTION()
FName __FInstrumentAudioConfig_GetSwitchValueName(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SwitchValueName' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.SwitchValueName;
    }
    return __r;
}
UFUNCTION()
TSoftObjectPtr<UAkSwitchValue> __FInstrumentAudioConfig_GetDefaultSwitchValue(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    TSoftObjectPtr<UAkSwitchValue> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultSwitchValue' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.DefaultSwitchValue;
    }
    return __r;
}
UFUNCTION()
TSoftObjectPtr<UAkAudioEvent> __FInstrumentAudioConfig_GetPlayEvent(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    TSoftObjectPtr<UAkAudioEvent> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayEvent' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.PlayEvent;
    }
    return __r;
}
UFUNCTION()
TSoftObjectPtr<UAkAudioEvent> __FInstrumentAudioConfig_GetStopEvent(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    TSoftObjectPtr<UAkAudioEvent> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StopEvent' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.StopEvent;
    }
    return __r;
}
UFUNCTION()
TArray<int> __FInstrumentAudioConfig_GetKeyIndexToMidiNotes(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    TArray<int> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'KeyIndexToMidiNotes' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.KeyIndexToMidiNotes;
    }
    return __r;
}
UFUNCTION()
int __FInstrumentAudioConfig_GetPreloadMinKey(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PreloadMinKey' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig defaultValue;
        return defaultValue.PreloadMinKey;
    }
    return DataObject.Get().PreloadMinKey;
}
UFUNCTION()
int __FInstrumentAudioConfig_GetPreloadMaxKey(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PreloadMaxKey' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig defaultValue;
        return defaultValue.PreloadMaxKey;
    }
    return DataObject.Get().PreloadMaxKey;
}
UFUNCTION()
bool __FInstrumentAudioConfig_GetbPreloadKeySwitches(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bPreloadKeySwitches' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.bPreloadKeySwitches;
    }
    return local_1;
}
UFUNCTION()
bool __FInstrumentAudioConfig_GetbUseStopEvent(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bUseStopEvent' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.bUseStopEvent;
    }
    return local_1;
}
UFUNCTION()
FInstrumentAudioConfig CastToFInstrumentAudioConfig(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    FInstrumentAudioConfig __r;
    return __r;
}
}
