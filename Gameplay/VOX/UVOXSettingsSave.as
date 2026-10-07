

class UVOXSettingsSave : UKLSaveGameScriptBase
{
    UPROPERTY()
    EVOXVoiceMode CityMicMode = EVOXVoiceMode(2);
    UPROPERTY()
    EVOXVoiceMode CitySpeakerMode = EVOXVoiceMode(0);
    UPROPERTY()
    EVOXVoiceMode NonCityNoSocialMicMode = EVOXVoiceMode(2);
    UPROPERTY()
    EVOXVoiceMode NonCityNoSocialSpeakerMode = EVOXVoiceMode(1);
    UPROPERTY()
    EVOXVoiceMode NonCitySocialMicMode = EVOXVoiceMode(2);
    UPROPERTY()
    EVOXVoiceMode NonCitySocialSpeakerMode = EVOXVoiceMode(1);


}

