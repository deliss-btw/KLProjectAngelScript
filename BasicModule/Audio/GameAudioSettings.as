

class UGameAudioSettings : UDeveloperSettings
{
    UPROPERTY()
    FName InstrumentsSwitchGroupName = n"SwitchGroup_SocialPianoNote_MIDI";
    UPROPERTY()
    FName InstrumentsSwitchValueName = n"MIDI";
    UPROPERTY()
    TSoftObjectPtr<UAkSwitchValue> DefaultInstrumentsSwitchValue;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> PlayInstrumentsEvent;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> StopInstrumentsEvent;
    UPROPERTY()
    TSoftObjectPtr<UAkStateValue> NonCombatBGMState;
    UPROPERTY()
    TSoftObjectPtr<UAkStateValue> NoneBGMState;
    UPROPERTY()
    float32 WaterAudioSearchRadius = 100000.0f;
    UPROPERTY()
    FName DefaultWaterAudioEventName = n"None";
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> DefaultWaterAudioEvent;
    UPROPERTY()
    float32 DefaultWaterAudioAttenuationRadius = 1000.0f;
    UPROPERTY()
    float32 CustomVolumeAudioSearchRadius = 100000.0f;
    UPROPERTY()
    float32 DefaultCustomVolumeAudioAttenuationRadius = 1000.0f;


}

