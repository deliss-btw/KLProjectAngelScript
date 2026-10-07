
namespace WwiseClipboardTools
{
enum EClipboardContentType
{
    Unknown,
    Sound,
    Event,
    Switch,
    State,
    RTPC,
    Bank,
    ActorMixer,
    RandomContainer,
    BlendContainer,
    MusicSegment,
    MusicTrack,
}


struct FWwiseAssetResult
{
    UPROPERTY()
    WwiseClipboardTools::EClipboardContentType AssetType;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> EventAsset;
    UPROPERTY()
    TSoftObjectPtr<UAkSwitchValue> SwitchAsset;
    UPROPERTY()
    TSoftObjectPtr<UAkStateValue> StateAsset;
    UPROPERTY()
    TSoftObjectPtr<UAkRtpc> RtpcAsset;
    UPROPERTY()
    TSoftObjectPtr<UAkAuxBus> BusAsset;
    UPROPERTY()
    FString AssetName;
    UPROPERTY()
    bool bIsValid;


}

FString GetClipboardContent()
{
    FString local_4;
    FPlatformApplicationMisc::ClipboardPaste(local_4);
    return local_4;
}
WwiseClipboardTools::EClipboardContentType GetClipboardContentType(const FString &inout ClipboardText)
{
    WwiseClipboardTools::EClipboardContentType __return;
    if (__return.IsEmpty())
    {
        return WwiseClipboardTools::EClipboardContentType(0);
    }
    FString local_10 = __return.TrimStartAndEnd();
    if (local_10.Contains("\\", ESearchCase(1), ESearchDir(0)))
    {
        if (local_10.Contains("\\Events\\", ESearchCase(1), ESearchDir(0)))
        {
            return WwiseClipboardTools::EClipboardContentType(2);
        }
        if (local_10.Contains("\\Switches\\", ESearchCase(1), ESearchDir(0)))
        {
            return WwiseClipboardTools::EClipboardContentType(3);
        }
        if (local_10.Contains("\\States\\", ESearchCase(1), ESearchDir(0)))
        {
            return WwiseClipboardTools::EClipboardContentType(4);
        }
        if (local_10.Contains("\\Game Parameters\\", ESearchCase(1), ESearchDir(0)))
        {
            return WwiseClipboardTools::EClipboardContentType(5);
        }
        if (local_10.Contains("\\SoundBanks\\", ESearchCase(1), ESearchDir(0)))
        {
            return WwiseClipboardTools::EClipboardContentType(6);
        }
        if (local_10.Contains("\\Actor-Mixer\\", ESearchCase(1), ESearchDir(0)))
        {
            return WwiseClipboardTools::EClipboardContentType(7);
        }
        if (local_10.Contains("\\Random Containers\\", ESearchCase(1), ESearchDir(0)))
        {
            return WwiseClipboardTools::EClipboardContentType(8);
        }
        if (local_10.Contains("\\Blend Containers\\", ESearchCase(1), ESearchDir(0)))
        {
            return WwiseClipboardTools::EClipboardContentType(9);
        }
        if (local_10.Contains("\\Music Segments\\", ESearchCase(1), ESearchDir(0)))
        {
            return WwiseClipboardTools::EClipboardContentType(10);
        }
        else
        {
            if (local_10.Contains("\\Music Tracks\\", ESearchCase(1), ESearchDir(0)))
            {
                return WwiseClipboardTools::EClipboardContentType(11);
            }
        }
    }
    if (local_10.Contains(".wav", ESearchCase(1), ESearchDir(0)) || local_10.Contains(".mp3", ESearchCase(1), ESearchDir(0)) || local_10.Contains(".ogg", ESearchCase(1), ESearchDir(0)) || local_10.Contains(".flac", ESearchCase(1), ESearchDir(0)))
    {
        return WwiseClipboardTools::EClipboardContentType(1);
    }
    if (local_10.StartsWith("sfx_", ESearchCase(1)))
    {
        return WwiseClipboardTools::EClipboardContentType(1);
    }
    if (local_10.StartsWith("Play_", ESearchCase(1)) || local_10.StartsWith("Stop_", ESearchCase(1)) || local_10.StartsWith("Pause_", ESearchCase(1)) || local_10.StartsWith("Resume_", ESearchCase(1)))
    {
        return WwiseClipboardTools::EClipboardContentType(2);
    }
    if (local_10.StartsWith("Set_", ESearchCase(1)))
    {
        return WwiseClipboardTools::EClipboardContentType(3);
    }
    if (local_10.Contains("Volume", ESearchCase(1), ESearchDir(0)) || local_10.Contains("Pitch", ESearchCase(1), ESearchDir(0)) || local_10.Contains("LFE", ESearchCase(1), ESearchDir(0)) || local_10.Contains("Filter", ESearchCase(1), ESearchDir(0)) || local_10.Contains("Distance", ESearchCase(1), ESearchDir(0)) || local_10.Contains("Angle", ESearchCase(1), ESearchDir(0)))
    {
        return WwiseClipboardTools::EClipboardContentType(5);
    }
    if (local_10.StartsWith("State_", ESearchCase(1)) || local_10.Contains("State", ESearchCase(1), ESearchDir(0)))
    {
        return WwiseClipboardTools::EClipboardContentType(4);
    }
    if (local_10.StartsWith("Bank_", ESearchCase(1)))
    {
        return WwiseClipboardTools::EClipboardContentType(6);
    }
    return WwiseClipboardTools::EClipboardContentType(2);
}
FString GenerateEventNameFromSoundSFX(const FString &inout SoundSFXName)
{
    if (SoundSFXName.StartsWith("Play_", ESearchCase(1)))
    {
        return SoundSFXName;
    }
    return (FString("Play_") + SoundSFXName);
}
FString GetAudioAssetPath(const FString &inout AssetName, const WwiseClipboardTools::EClipboardContentType AssetType)
{
    UKlAudioAssetLoader local_4 = UKlAudioAssetLoader::GetInstance();
    switch (int(AssetType))
    {
    case 2:
    {
        return local_4.GetEventPath(FName(AssetName));
    }
    case 3:
    {
        return local_4.GetSwitchPath(FName(AssetName));
    }
    case 4:
    {
        return local_4.GetStatPath(FName(AssetName));
    }
    case 5:
    {
        return local_4.GetRtpcPath(FName(AssetName));
    }
    case 6:
    {
        return local_4.GetBusPath(FName(AssetName));
    }
    }
    return FString();
}
TSoftObjectPtr<UAkAudioEvent> GetEventFromName(const FString &inout EventName)
{
    FString local_10 = WwiseClipboardTools::GetAudioAssetPath(EventName, WwiseClipboardTools::EClipboardContentType(2));
    TSoftObjectPtr<UAkAudioEvent> local_50;
    if (local_10.IsEmpty())
    {
        local_50 = TSoftObjectPtr<UAkAudioEvent>();
    }
    else
    {
        local_50 = TSoftObjectPtr<UAkAudioEvent>(FSoftObjectPath(local_10));
    }
    return local_50;
}
TSoftObjectPtr<UAkSwitchValue> GetSwitchFromName(const FString &inout SwitchName)
{
    FString local_10 = WwiseClipboardTools::GetAudioAssetPath(SwitchName, WwiseClipboardTools::EClipboardContentType(3));
    TSoftObjectPtr<UAkSwitchValue> local_50;
    if (local_10.IsEmpty())
    {
        local_50 = TSoftObjectPtr<UAkSwitchValue>();
    }
    else
    {
        local_50 = TSoftObjectPtr<UAkSwitchValue>(FSoftObjectPath(local_10));
    }
    return local_50;
}
TSoftObjectPtr<UAkStateValue> GetStateFromName(const FString &inout StateName)
{
    FString local_10 = WwiseClipboardTools::GetAudioAssetPath(StateName, WwiseClipboardTools::EClipboardContentType(4));
    TSoftObjectPtr<UAkStateValue> local_50;
    if (local_10.IsEmpty())
    {
        local_50 = TSoftObjectPtr<UAkStateValue>();
    }
    else
    {
        local_50 = TSoftObjectPtr<UAkStateValue>(FSoftObjectPath(local_10));
    }
    return local_50;
}
TSoftObjectPtr<UAkRtpc> GetRtpcFromName(const FString &inout RtpcName)
{
    FString local_10 = WwiseClipboardTools::GetAudioAssetPath(RtpcName, WwiseClipboardTools::EClipboardContentType(5));
    TSoftObjectPtr<UAkRtpc> local_50;
    if (local_10.IsEmpty())
    {
        local_50 = TSoftObjectPtr<UAkRtpc>();
    }
    else
    {
        local_50 = TSoftObjectPtr<UAkRtpc>(FSoftObjectPath(local_10));
    }
    return local_50;
}
TSoftObjectPtr<UAkAuxBus> GetBusFromName(const FString &inout BusName)
{
    FString local_10 = WwiseClipboardTools::GetAudioAssetPath(BusName, WwiseClipboardTools::EClipboardContentType(6));
    TSoftObjectPtr<UAkAuxBus> local_50;
    if (local_10.IsEmpty())
    {
        local_50 = TSoftObjectPtr<UAkAuxBus>();
    }
    else
    {
        local_50 = TSoftObjectPtr<UAkAuxBus>(FSoftObjectPath(local_10));
    }
    return local_50;
}
bool SearchEventInUE(const FString &inout EventName)
{
    return WwiseClipboardTools::GetEventFromName(EventName).IsValid();
}
WwiseClipboardTools::EClipboardContentType GetCurrentClipboardContentType()
{
    return WwiseClipboardTools::GetClipboardContentType(WwiseClipboardTools::GetClipboardContent());
}
FString GetContentTypeString(const WwiseClipboardTools::EClipboardContentType ContentType)
{
    switch (int(ContentType))
    {
    case 1:
    {
        return "йџійў‘ж–‡д»¶";
    }
    case 2:
    {
        return "дє‹д»¶";
    }
    case 3:
    {
        return "ејЂе…і";
    }
    case 4:
    {
        return "зЉ¶жЂЃ";
    }
    case 5:
    {
        return "е®ћж—¶еЏ‚ж•°жЋ§е€¶";
    }
    case 6:
    {
        return "йџійў‘еє“";
    }
    case 7:
    {
        return "Actor-Mixer";
    }
    case 8:
    {
        return "йљЏжњєе®№е™Ё";
    }
    case 9:
    {
        return "ж··еђ€е®№е™Ё";
    }
    case 10:
    {
        return "йџід№ђз‰‡ж®µ";
    }
    case 11:
    {
        return "йџід№ђиЅЁйЃ“";
    }
    }
    return "жњЄзџҐз±»ећ‹";
}
bool IsClipboardContentSoundInfo(const FString &inout ClipboardText)
{
    if (ClipboardText.IsEmpty())
    {
        return false;
    }
    FString local_10 = ClipboardText.TrimStartAndEnd();
    TArray<FString> local_14;
    local_14.Add("Sound");
    local_14.Add("SFX");
    local_14.Add("Audio");
    local_14.Add("Wav");
    local_14.Add("Mp3");
    local_14.Add("Ogg");
    local_14.Add("Actor-Mixer");
    local_14.Add("\\Actor-Mixer");
    local_14.Add("\\Sound");
    int local_16 = 0;
    for (; local_16 < local_14.Num(); ++local_16)
    {
        if (local_10.Contains(local_14[local_16], ESearchCase(1), ESearchDir(0)))
        {
            return true;
        }
    }
    if (local_10.Contains(".", ESearchCase(1), ESearchDir(0)) && (local_10.Contains("\\", ESearchCase(1), ESearchDir(0)) || local_10.Contains("/", ESearchCase(1), ESearchDir(0))))
    {
        return true;
    }
    return false;
}
bool ParseSoundInfoFromClipboard(const FString &inout ClipboardText, TArray<FString> &inout OutSoundNames, TArray<FString> &inout OutSoundPaths)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    bool __r; return __r;
}
bool GetSoundInfoFromClipboard(TArray<FString> &inout OutSoundNames, TArray<FString> &inout OutSoundPaths)
{
    return WwiseClipboardTools::ParseSoundInfoFromClipboard(WwiseClipboardTools::GetClipboardContent(), OutSoundNames, OutSoundPaths);
}
bool HasSoundInfoInClipboard()
{
    return WwiseClipboardTools::IsClipboardContentSoundInfo(WwiseClipboardTools::GetClipboardContent());
}
TArray<WwiseClipboardTools::FWwiseAssetResult> GetAssetFromClipboard()
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TArray<WwiseClipboardTools::FWwiseAssetResult> __r; return __r;
}
}
