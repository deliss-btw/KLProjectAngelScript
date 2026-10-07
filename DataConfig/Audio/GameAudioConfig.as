

struct FWeatherAudioConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FSimpleAudioSet WeatherEnter;
    UPROPERTY()
    FSimpleAudioSet WeatherExit;

    FWeatherAudioConfig()
    {
        return;
    }
}

struct FRegionAudioConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FSimpleAudioSet RegionEnter;
    UPROPERTY()
    FSimpleAudioSet RegionExit;

    FRegionAudioConfig()
    {
        return;
    }
}

struct FTimeOfDayStageAudioConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TSoftObjectPtr<UAkStateValue> TimeOfDayState;

    FTimeOfDayStageAudioConfig()
    {
        return;
    }
}

struct FInstrumentAudioConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FName InstrumentId;
    UPROPERTY()
    FName PrefabClassName;
    UPROPERTY()
    FName SwitchGroupName;
    UPROPERTY()
    FName SwitchValueName = n"MIDI";
    UPROPERTY()
    TSoftObjectPtr<UAkSwitchValue> DefaultSwitchValue;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> PlayEvent;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> StopEvent;
    UPROPERTY()
    TArray<int> KeyIndexToMidiNotes;
    UPROPERTY()
    int PreloadMinKey = 0;
    UPROPERTY()
    int PreloadMaxKey = 127;
    UPROPERTY()
    bool bPreloadKeySwitches = true;
    UPROPERTY()
    bool bUseStopEvent = true;


}

