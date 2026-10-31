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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TimeOfDayState' from a null 'FTimeOfDayStageAudioConfig' DataObject!");
        }
        FTimeOfDayStageAudioConfig local_24;
        return local_24.TimeOfDayState;
    }
    return DataObject.Get().TimeOfDayState;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InstrumentId' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.InstrumentId;
    }
    return DataObject.Get().InstrumentId;
}
UFUNCTION()
FName __FInstrumentAudioConfig_GetPrefabClassName(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PrefabClassName' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.PrefabClassName;
    }
    return DataObject.Get().PrefabClassName;
}
UFUNCTION()
FName __FInstrumentAudioConfig_GetSwitchGroupName(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SwitchGroupName' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.SwitchGroupName;
    }
    return DataObject.Get().SwitchGroupName;
}
UFUNCTION()
FName __FInstrumentAudioConfig_GetSwitchValueName(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SwitchValueName' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.SwitchValueName;
    }
    return DataObject.Get().SwitchValueName;
}
UFUNCTION()
TSoftObjectPtr<UAkSwitchValue> __FInstrumentAudioConfig_GetDefaultSwitchValue(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultSwitchValue' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.DefaultSwitchValue;
    }
    return DataObject.Get().DefaultSwitchValue;
}
UFUNCTION()
TSoftObjectPtr<UAkAudioEvent> __FInstrumentAudioConfig_GetPlayEvent(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayEvent' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.PlayEvent;
    }
    return DataObject.Get().PlayEvent;
}
UFUNCTION()
TSoftObjectPtr<UAkAudioEvent> __FInstrumentAudioConfig_GetStopEvent(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StopEvent' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.StopEvent;
    }
    return DataObject.Get().StopEvent;
}
UFUNCTION()
TArray<int> __FInstrumentAudioConfig_GetKeyIndexToMidiNotes(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'KeyIndexToMidiNotes' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.KeyIndexToMidiNotes;
    }
    return DataObject.Get().KeyIndexToMidiNotes;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bPreloadKeySwitches' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.bPreloadKeySwitches;
    }
    return DataObject.Get().bPreloadKeySwitches;
}
UFUNCTION()
bool __FInstrumentAudioConfig_GetbUseStopEvent(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bUseStopEvent' from a null 'FInstrumentAudioConfig' DataObject!");
        }
        FInstrumentAudioConfig local_60;
        return local_60.bUseStopEvent;
    }
    return DataObject.Get().bUseStopEvent;
}
UFUNCTION()
FInstrumentAudioConfig CastToFInstrumentAudioConfig(const TDataObjectPtr<FInstrumentAudioConfig> &inout DataObject)
{
    FInstrumentAudioConfig __r;
    return __r;
}
}
