
namespace FAsGameAudioUtils
{
    const FConsoleVariable CVar_EnvSound_EnableDebug = FConsoleVariable();
    const FConsoleVariable CVar_Enable_GameSound_DebugLog = FConsoleVariable();
    const FConsoleVariable CVar_Audio_LoadDebug = FConsoleVariable();
    const FConsoleVariable CVar_UseNewAsynLoad = FConsoleVariable();
    const int PianoPreloadMinMidi = 36;
    const int PianoPreloadMaxMidi = 71;

UFUNCTION()
TSoftObjectPtr<UAkSwitchValue> GetSwitchSoftPtrFromName(const FName &inout SwitchName)
{
    if (SwitchName.IsNone())
    {
        return TSoftObjectPtr<UAkSwitchValue>();
    }
    UKlAudioAssetLoader local_16 = UKlAudioAssetLoader::GetInstance();
    if (local_16 == nullptr)
    {
        return TSoftObjectPtr<UAkSwitchValue>();
    }
    FString local_24 = local_16.GetSwitchPath(SwitchName);
    if (local_24.IsEmpty())
    {
        return TSoftObjectPtr<UAkSwitchValue>();
    }
    return TSoftObjectPtr<UAkSwitchValue>(FSoftObjectPath(local_24));
}
UFUNCTION()
FString GetInstrumentTargetPrefabClassName(const FECSEntity &inout Entity)
{
    if (!(FAsGameAudioUtils::GetInstrumentTargetEntity(Entity).IsValid()))
    {
        return "";
    }
    Get local_14;
    const FC_PrefabLoaded& local_16 = local_14.opCall();
    if (local_16)
    {
        FString local_32;
        if (local_16.PrefabClass.IsValid())
        {
            TSubclassOf<AECSPrefab> local_18 = local_16.PrefabClass.Get();
            UClass local_20;
            local_32 = local_20.GetName();
        }
        else
        {
            local_32 = FString("");
        }
        return local_32;
    }
    return "";
}
UFUNCTION()
FECSEntity GetInstrumentTargetEntity(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return ENTITY_NULL;
    }
    Get local_6;
    const FC_InteractionInfoForESM& local_8 = local_6.opCall();
    if (local_8)
    {
        if (local_8.GetTargetEntity().IsValid())
        {
            return local_8.GetTargetEntity();
        }
    }
    return Entity;
}
UFUNCTION()
FName GetInstrumentIdFromSubType(const EInteractionSubTypeForESM SubType)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FName __r; return __r;
}
UFUNCTION()
FName GetInstrumentIdFromSocialType(const EInteractionSocialTypeForESM SocialType)
{
    switch (int(SocialType))
    {
    case 59:
    {
        return n"WeavingOud";
    }
    case 61:
    {
        return n"NetFlute";
    }
    case 62:
    {
        return n"FuXiString";
    }
    case 60:
    {
        return n"VitalityDrum";
    }
    }
    return n"None";
}
UFUNCTION()
FName GetInstrumentIdFromPrefabClassName(const FString &inout PrefabClassName)
{
    if (PrefabClassName.Contains("Prefab_Prop_Avatar_Common_Piano", ESearchCase(1), ESearchDir(0)))
    {
        return n"Piano";
    }
    if (PrefabClassName.Contains("Prefab_Prop_Avatar_Common_Instrument_WeavingOud", ESearchCase(1), ESearchDir(0)))
    {
        return n"WeavingOud";
    }
    if (PrefabClassName.Contains("Prefab_Prop_Avatar_Common_Instrument_NetFlute", ESearchCase(1), ESearchDir(0)))
    {
        return n"NetFlute";
    }
    if (PrefabClassName.Contains("Prefab_Prop_Avatar_Common_Instrument_FuXiString", ESearchCase(1), ESearchDir(0)))
    {
        return n"FuXiString";
    }
    if (PrefabClassName.Contains("Prefab_Prop_Avatar_Common_Instrument_VitalityDrum", ESearchCase(1), ESearchDir(0)))
    {
        return n"VitalityDrum";
    }
    return n"None";
}
UFUNCTION()
FName GetInstrumentId(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return n"None";
    }
    Get local_6;
    const FC_InteractionInfoForESM& local_8 = local_6.opCall();
    if (local_8)
    {
        FName local_13 = FAsGameAudioUtils::GetInstrumentIdFromSubType(local_8.GetSubType());
        if (!(local_13.IsNone()))
        {
            return local_13;
        }
        local_13 = FAsGameAudioUtils::GetInstrumentIdFromSocialType(local_8.GetSocialAnimName());
        if (!(local_13.IsNone()))
        {
            return local_13;
        }
    }
    FASCommonUtils::GetUniquePlayerEntity(Entity);
    Get local_26;
    const FC_SocialInteractionInfo& local_28 = local_26.opCall();
    if (local_28)
    {
        FName local_10 = FAsGameAudioUtils::GetInstrumentIdFromSocialType(local_28.GetSocialAnimName());
        if (!(local_10.IsNone()))
        {
            return local_10;
        }
    }
    return FAsGameAudioUtils::GetInstrumentIdFromPrefabClassName(FAsGameAudioUtils::GetInstrumentTargetPrefabClassName(Entity));
}
UFUNCTION()
FInstrumentAudioConfig MakeLegacyPianoInstrumentAudioConfig()
{
    FInstrumentAudioConfig __r;
    UGameAudioSettings local_4 = FGameAudioSettings::Get();
    FInstrumentAudioConfig local_62;
    local_62.InstrumentId = n"Piano";
    local_62.PrefabClassName = n"Prefab_Prop_Avatar_Common_Piano_C";
    local_62.SwitchGroupName = local_4.InstrumentsSwitchGroupName;
    local_62.SwitchValueName = local_4.InstrumentsSwitchValueName;
    local_62.DefaultSwitchValue = local_4.DefaultInstrumentsSwitchValue;
    local_62.PlayEvent = local_4.PlayInstrumentsEvent;
    local_62.StopEvent = local_4.StopInstrumentsEvent;
    local_62.PreloadMinKey = 36;
    local_62.PreloadMaxKey = 71;
    local_62.bPreloadKeySwitches = true;
    local_62.bUseStopEvent = true;
    return __r;
}
UFUNCTION()
UDataTable GetInstrumentAudioTable()
{
    UDataTable local_2;
    return local_2;
}
UFUNCTION()
bool TryGetInstrumentAudioConfig(const FECSEntity &inout Entity, const UDataTable InstrumentAudioTable, FInstrumentAudioConfig &out OutConfig)
{
    FName local_62 = FAsGameAudioUtils::GetInstrumentId(Entity);
    FName local_60 = FName(FAsGameAudioUtils::GetInstrumentTargetPrefabClassName(Entity));
    if (InstrumentAudioTable != nullptr)
    {
        if (!(local_62.IsNone()))
        {
            UDataTable::FindDataObject local_74;
            if ((!((local_74.opCall(local_62) == nullptr))))
            {
                return true;
            }
        }
        if (!(local_60.IsNone()))
        {
            TArray<FInstrumentAudioConfig> local_126;
            InstrumentAudioTable.GetAllRows(local_126);
            for (auto& local_140 : local_126)
            {
                if ((local_140.PrefabClassName == local_60))
                {
                    return true;
                }
            }
        }
    }
    if ((local_62 == n"Piano"))
    {
        FAsGameAudioUtils::MakeLegacyPianoInstrumentAudioConfig();
        return true;
    }
    return false;
}
UFUNCTION()
bool TryResolveInstrumentMidiKey(const FInstrumentAudioConfig &inout Config, const int KeyIndex, int &out OutMidiKey)
{
    OutMidiKey = 0;
    if (Config.KeyIndexToMidiNotes.Num() > 0)
    {
        int local_4 = KeyIndex - 1;
        if (!(Config.KeyIndexToMidiNotes.IsValidIndex(local_4)))
        {
            XWarning(ELog(1), FString().Append("TryResolveInstrumentMidiKey invalid 1-based KeyIndex:").Append(KeyIndex).Append(", InstrumentId:").Append(Config.InstrumentId));
            return false;
        }
        OutMidiKey = Config.KeyIndexToMidiNotes[local_4];
    }
    else
    {
        OutMidiKey = KeyIndex;
    }
    if ((OutMidiKey < 0 || (OutMidiKey > 127)))
    {
        XWarning(ELog(1), FString().Append("TryResolveInstrumentMidiKey invalid MidiKey:").Append(OutMidiKey).Append(", InstrumentId:").Append(Config.InstrumentId));
        return false;
    }
    return true;
}
UFUNCTION()
void PreloadInstrumentAudioAssets(const FECSEntity &inout Entity, const UDataTable InstrumentAudioTable)
{
    int local_76;
    FInstrumentAudioConfig local_58;
    if (!(FAsGameAudioUtils::TryGetInstrumentAudioConfig(Entity, InstrumentAudioTable, local_58)))
    {
        FString local_70 = FAsGameAudioUtils::GetInstrumentTargetPrefabClassName(Entity);
        FName local_66 = FAsGameAudioUtils::GetInstrumentId(Entity);
        XWarning(ELog(1), FString().Append("PreloadInstrumentAudioAssets missing config, InstrumentId:").Append(local_66).Append(", Prefab:").Append(local_70));
        return;
    }
    if (!(local_58.PlayEvent.IsNull()))
    {
        FPreloadAssetUtils::LoadAkEvent(local_58.PlayEvent);
    }
    if (local_58.bUseStopEvent && !(local_58.StopEvent.IsNull()))
    {
        FPreloadAssetUtils::LoadAkEvent(local_58.StopEvent);
    }
    if (!(local_58.DefaultSwitchValue.IsNull()))
    {
        FPreloadAssetUtils::LoadAkSwitch(local_58.DefaultSwitchValue);
    }
    if (!(local_58.bPreloadKeySwitches) || local_58.SwitchGroupName.IsNone() || local_58.SwitchValueName.IsNone())
    {
        return;
    }
    if (local_58.KeyIndexToMidiNotes.Num() > 0)
    {
        int local_75 = 0;
        for (; local_75 < local_58.KeyIndexToMidiNotes.Num(); ++local_75)
        {
            local_76 = local_58.KeyIndexToMidiNotes[local_75];
            if (local_76 < 0 || (local_76 > 127))
            {
                XWarning(ELog(1), FString().Append("PreloadInstrumentAudioAssets invalid MidiKey:").Append(local_76).Append(", InstrumentId:").Append(local_58.InstrumentId));
                continue;
            }
            FName local_66_2 = FName(FString().Append(local_58.SwitchGroupName).Append("-").Append(local_58.SwitchValueName).Append("_").Append(FString::ApplyFormat(local_76, "02d")));
            TSoftObjectPtr<UAkSwitchValue> local_98 = FAsGameAudioUtils::GetSwitchSoftPtrFromName(local_66_2);
            if (!(local_98.IsNull()))
            {
                FPreloadAssetUtils::LoadAkSwitch(local_98);
            }
        }
        XLogIf(FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool(), ELog(1), FString().Append("[PreloadInstrumentAudioAssets] InstrumentId:").Append(local_58.InstrumentId).Append(", mapped key count ").Append(local_58.KeyIndexToMidiNotes.Num()));
        return;
    }
    local_76 = local_58.PreloadMinKey;
    while (local_76 <= int(local_58.PreloadMaxKey))
    {
        FName local_78 = FName(FString().Append(local_58.SwitchGroupName).Append("-").Append(local_58.SwitchValueName).Append("_").Append(FString::ApplyFormat(local_76, "02d")));
        TSoftObjectPtr<UAkSwitchValue> local_88 = FAsGameAudioUtils::GetSwitchSoftPtrFromName(local_78);
        if (!(local_88.IsNull()))
        {
            FPreloadAssetUtils::LoadAkSwitch(local_88);
        }
        ++local_76;
    }
    XLogIf(FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool(), ELog(1), FString().Append("[PreloadInstrumentAudioAssets] InstrumentId:").Append(local_58.InstrumentId).Append(", key range [").Append(local_58.PreloadMinKey).Append(", ").Append(local_58.PreloadMaxKey).Append("]"));
    return;
}
UFUNCTION()
void PreloadPianoAudioAssets()
{
    UGameAudioSettings local_4 = FGameAudioSettings::Get();
    if (!(local_4.PlayInstrumentsEvent.IsNull()))
    {
        FPreloadAssetUtils::LoadAkEvent(local_4.PlayInstrumentsEvent);
    }
    if (!(local_4.StopInstrumentsEvent.IsNull()))
    {
        FPreloadAssetUtils::LoadAkEvent(local_4.StopInstrumentsEvent);
    }
    if (!(local_4.DefaultInstrumentsSwitchValue.IsNull()))
    {
        FPreloadAssetUtils::LoadAkSwitch(local_4.DefaultInstrumentsSwitchValue);
    }
    FName local_7 = local_4.InstrumentsSwitchGroupName;
    FName local_9 = local_4.InstrumentsSwitchValueName;
    int local_10 = 36;
    for (; local_10 <= 71; ++local_10)
    {
        FName local_24 = FName(FString().Append(local_7).Append("-").Append(local_9).Append("_").Append(FString::ApplyFormat(local_10, "02d")));
        TSoftObjectPtr<UAkSwitchValue> local_44 = FAsGameAudioUtils::GetSwitchSoftPtrFromName(local_24);
        if (!(local_44.IsNull()))
        {
            FPreloadAssetUtils::LoadAkSwitch(local_44);
        }
    }
    XLogIf(FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool(), ELog(1), FString().Append("[PreloadPianoAudioAssets] done, midi range [").Append(36).Append(", ").Append(71).Append("]"));
    return;
}
UFUNCTION()
UAkAudioEvent GetEvent(const TSoftObjectPtr<UAkAudioEvent> &inout Event)
{
    if (Event.IsNull())
    {
        return nullptr;
    }
    if (Event.IsValid())
    {
        UAkAudioEvent local_4;
        return local_4;
    }
    return Cast<UAkAudioEvent>(Event.ToSoftObjectPath().TryLoad());
}
UFUNCTION()
void PlayAudioWhenRegionEnter(const FECSEntity &inout Entity, const FName &inout RegionName, const UDataTable RegionAudioTable)
{
    TSoftObjectPtr<UAkAudioEvent> local_102;
    TSoftObjectPtr<UAkSwitchValue> local_104;
    TSoftObjectPtr<UAkStateValue> local_106;
    if (RegionAudioTable == nullptr)
    {
        XWarning(ELog(0), "Cannot found RegionAudioConfig datatable!");
        if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
        {
            Print("Cannot found RegionAudioConfig datatable!", 600.0f, FLinearColor::Red);
        }
        return;
    }
    UDataTable::FindDataObject local_8;
    if ((local_8.opCall(RegionName) == nullptr))
    {
        XLog(ELog(0), (FString("RegionAudioConfig not found for ") + RegionName));
        if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
        {
            Print((FString("RegionAudioConfig not found for ") + RegionName), 600.0f, FLinearColor::Red);
        }
        return;
    }
    FAudioActionData local_100;
    if (!(local_102.IsNull()))
    {
        local_100.AddEvent(local_102);
    }
    if (!(local_104.IsNull()))
    {
        local_100.AddSwitch(local_104);
    }
    if (!(local_106.IsNull()))
    {
        local_100.AddState(local_106);
    }
    FGameAudioUtils::Play2DAudioActionData(local_100, FLoadEventCallback(), FGameAudioUtils::GetCachedAudioWorld());
    XLogIf(FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool(), ELog(1), FString().Append("PlayAudioWhenRegionEnter Entity: ").Append(Entity.GetEntityName()).Append(", RegionName: ").Append(RegionName).Append(", EventName:").Append(local_102.GetAssetName()).Append(", SwitchName:").Append(local_104.GetAssetName()).Append(", State:").Append(local_106.GetAssetName()));
    if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
    {
        Print(FString().Append("PlayAudioWhenRegionEnter Entity: ").Append(Entity.GetEntityName()).Append(", RegionName: ").Append(RegionName).Append(", EventName:").Append(local_102.GetAssetName()).Append(", SwitchName:").Append(local_104.GetAssetName()).Append(", State:").Append(local_106.GetAssetName()), 600.0f, FLinearColor::Green);
    }
    return;
}
UFUNCTION()
void PlayAudioWhenRegionExit(const FECSEntity &inout Entity, const FName &inout RegionName, const UDataTable RegionAudioTable)
{
    TSoftObjectPtr<UAkAudioEvent> local_64;
    if (RegionAudioTable == nullptr)
    {
        XWarning(ELog(0), "Cannot found RegionAudioConfig datatable!");
        return;
    }
    UDataTable::FindDataObject local_6;
    if ((local_6.opCall(RegionName) == nullptr))
    {
        XLog(ELog(0), (FString("RegionAudioConfig not found for ") + RegionName));
        return;
    }
    if (local_64.IsNull())
    {
        XLog(ELog(0), FString().Append("PlayAudioWhenRegionExit WwiseEvent is nullptr, RegionName: ").Append(RegionName));
        return;
    }
    if (local_64.IsPending())
    {
        XLog(ELog(0), FString().Append("PlayAudioWhenRegionExit WwiseEvent IsPending, RegionName: ").Append(RegionName));
    }
    FGameAudioUtils::PlayEventUI(local_64, FLoadEventCallback(), FGameAudioUtils::GetCachedAudioWorld(), true);
    XLogIf(FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool(), ELog(1), FString().Append("PlayAudioWhenRegionExit Entity: ").Append(Entity.GetEntityName()).Append(", RegionName: ").Append(RegionName).Append(", EventName:").Append(local_64.ToString()));
    if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
    {
        Print(FString().Append("PlayAudioWhenRegionExit Entity: ").Append(Entity.GetEntityName()).Append(", RegionName: ").Append(RegionName).Append(", EventName:").Append(local_64.ToString()), 5.0f, FLinearColor::LucBlue);
    }
    return;
}
UFUNCTION()
void PlayAudioWhenWeatherEnter(const FECSEntity &inout Entity, const FName &inout WeatherName, const UDataTable WeatherAudioTable)
{
    FSimpleAudioSet local_64;
    float32 local_121 = 0.0f;
    if (WeatherAudioTable == nullptr)
    {
        XWarningIf(FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool(), ELog(0), "Cannot found WeatherAudioConfig datatable!");
        return;
    }
    UDataTable::FindDataObject local_6;
    if ((local_6.opCall(WeatherName) == nullptr))
    {
        XLogIf(FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool(), ELog(0), (FString("WeatherAudioConfig not found for ") + WeatherName));
        return;
    }
    FAudioActionData local_100;
    if (!(local_64.State.IsNull()))
    {
        local_100.AddState(local_64.State);
    }
    if (!(local_64.Switch.IsNull()))
    {
        local_100.AddSwitch(local_64.Switch);
    }
    TSoftObjectPtr<UAkAudioEvent> local_102 = local_64.Event;
    if (!(local_102.IsNull()))
    {
        local_100.AddEvent(local_102);
    }
    for (auto& local_120 : local_64.RtpcMap)
    {
        local_100.AddRtpc(local_120.GetKey(), local_121);
    }
    if (local_100.IsValidData())
    {
        FGameAudioUtils::Play2DAudioActionData(local_100, FLoadEventCallback(), FGameAudioUtils::GetCachedAudioWorld());
        if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
        {
            FString local_134 = FString().Append("[PlayAudioWhenWeatherEnter] Success! Entity: ").Append(Entity.GetEntityName()).Append(", WeatherName: ").Append(WeatherName);
            if (!(local_64.State.IsNull()))
            {
                local_134 += FString().Append(", State: ").Append(local_64.State.GetAssetName());
            }
            if (!(local_64.Switch.IsNull()))
            {
                local_134 += FString().Append(", Switch: ").Append(local_64.Switch.GetAssetName());
            }
            if (!(local_102.IsNull()))
            {
                local_134 += FString().Append(", Event: ").Append(local_102.GetAssetName());
            }
            if (local_64.RtpcMap.Num() > 0)
            {
                FString local_142;
                for (auto& local_120 : local_64.RtpcMap)
                {
                    if (local_142.Len() > 0)
                    {
                        local_142 += ", ";
                    }
                    local_142 += FString().Append(local_120.GetKey().GetAssetName()).Append(": ").Append();
                }
                local_134 += FString().Append(", RTPC: [").Append(local_142).Append("]");
            }
            XLog(ELog(1), local_134);
            Print(local_134, 600.0f, FLinearColor::Green);
        }
    }
    else
    {
        XLogIf(FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool(), ELog(0), FString().Append("PlayAudioWhenWeatherEnter AudioSet is invalid, WeatherName: ").Append(WeatherName));
    }
    return;
}
UFUNCTION()
void PlayAudioWhenWeatherExit(const FECSEntity &inout Entity, const FName &inout WeatherName, const UDataTable WeatherAudioTable)
{
    FSimpleAudioSet local_64;
    float32 local_121 = 0.0f;
    if (WeatherAudioTable == nullptr)
    {
        XWarningIf(FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool(), ELog(0), "Cannot found WeatherAudioConfig datatable!");
        return;
    }
    UDataTable::FindDataObject local_6;
    if ((local_6.opCall(WeatherName) == nullptr))
    {
        XLogIf(FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool(), ELog(0), (FString("WeatherAudioConfig not found for ") + WeatherName));
        return;
    }
    FAudioActionData local_100;
    if (!(local_64.State.IsNull()))
    {
        local_100.AddState(local_64.State);
    }
    if (!(local_64.Switch.IsNull()))
    {
        local_100.AddSwitch(local_64.Switch);
    }
    TSoftObjectPtr<UAkAudioEvent> local_102 = local_64.Event;
    if (!(local_102.IsNull()))
    {
        local_100.AddEvent(local_102);
    }
    for (auto& local_120 : local_64.RtpcMap)
    {
        local_100.AddRtpc(local_120.GetKey(), local_121);
    }
    if (local_100.IsValidData())
    {
        FGameAudioUtils::Play2DAudioActionData(local_100, FLoadEventCallback(), FGameAudioUtils::GetCachedAudioWorld());
        if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
        {
            FString local_134 = FString().Append("[PlayAudioWhenWeatherExit] Success! Entity: ").Append(Entity.GetEntityName()).Append(", WeatherName: ").Append(WeatherName);
            if (!(local_64.State.IsNull()))
            {
                local_134 += FString().Append(", State: ").Append(local_64.State.GetAssetName());
            }
            if (!(local_64.Switch.IsNull()))
            {
                local_134 += FString().Append(", Switch: ").Append(local_64.Switch.GetAssetName());
            }
            if (!(local_102.IsNull()))
            {
                local_134 += FString().Append(", Event: ").Append(local_102.GetAssetName());
            }
            if (local_64.RtpcMap.Num() > 0)
            {
                FString local_142;
                for (auto& local_120 : local_64.RtpcMap)
                {
                    if (local_142.Len() > 0)
                    {
                        local_142 += ", ";
                    }
                    local_142 += FString().Append(local_120.GetKey().GetAssetName()).Append(": ").Append();
                }
                local_134 += FString().Append(", RTPC: [").Append(local_142).Append("]");
            }
            XLog(ELog(1), local_134);
            Print(local_134, 600.0f, FLinearColor::Green);
        }
    }
    else
    {
        XLogIf(FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool(), ELog(0), FString().Append("PlayAudioWhenWeatherExit AudioSet is invalid, WeatherName: ").Append(WeatherName));
    }
    return;
}
UFUNCTION()
void PlayTimeOfDayStageAudio(const FECSEntity &inout Entity, const FName &inout TimeDayStage, const UDataTable TimeOfDayStageAudioTable)
{
    TSoftObjectPtr<UAkStateValue> local_64;
    if (TimeOfDayStageAudioTable == nullptr)
    {
        XWarning(ELog(1), "Cannot found TimeOfDayStageAudioTable datatable!");
        return;
    }
    UDataTable::FindDataObject local_6;
    if ((local_6.opCall(TimeDayStage) == nullptr))
    {
        XLog(ELog(1), (FString("TimeOfDayStageAudioConfig not found for ") + TimeDayStage));
        return;
    }
    if (local_64.IsNull())
    {
        XLog(ELog(1), FString().Append("PlayTimeOfDayStageAudio wwise State is nullptr, TimeDayStage: ").Append(TimeDayStage));
        return;
    }
    if (local_64.IsPending())
    {
        XLog(ELog(1), FString().Append("PlayTimeOfDayStageAudio wwise IsPending, TimeDayStage: ").Append(TimeDayStage));
    }
    FGameAudioUtils::SetAudioState(local_64, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
    if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
    {
        Print(FString().Append("PlayTimeOfDayStageAudio Entity: ").Append(Entity.GetEntityName()).Append(", TimeDayStage: ").Append(TimeDayStage).Append(", State:").Append(local_64.GetAssetName()), 600.0f, FLinearColor::Green);
    }
    XLogIf(FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool(), ELog(1), FString().Append("PlayTimeOfDayStageAudio Entity: ").Append(Entity.GetEntityName()).Append(", TimeDayStage: ").Append(TimeDayStage).Append(", State:").Append(local_64.ToString()));
    return;
}
UFUNCTION()
FName GetPlayInstrumentsEvent(const FECSEntity &inout Entity, const UDataTable InstrumentAudioTable)
{
    if (!(Entity.IsValid()) == !(false))
    {
        XWarning(ELog(1), FString().Append("GetPlayInstrumentsEvent Entity is invalid!"));
        return n"None";
    }
    FInstrumentAudioConfig local_66;
    if (!(FAsGameAudioUtils::TryGetInstrumentAudioConfig(Entity, InstrumentAudioTable, local_66)) || local_66.PlayEvent.IsNull())
    {
        FString local_72 = FAsGameAudioUtils::GetInstrumentTargetPrefabClassName(Entity);
        FName local_68 = FAsGameAudioUtils::GetInstrumentId(Entity);
        XWarning(ELog(1), FString().Append("GetPlayInstrumentsEvent missing PlayEvent, InstrumentId:").Append(local_68).Append(", Prefab:").Append(local_72));
        return n"None";
    }
    FName local_68_2 = FName(local_66.PlayEvent.GetAssetName());
    return local_68_2;
}
UFUNCTION()
FName GetStopInstrumentsEvent(const FECSEntity &inout Entity, const UDataTable InstrumentAudioTable)
{
    bool local_2 = !(false);
    if (!(Entity.IsValid()) == local_2)
    {
        XWarning(ELog(1), FString().Append("GetStopInstrumentsEvent Entity is invalid!"));
        return n"None";
    }
    FInstrumentAudioConfig local_66;
    if (!(FAsGameAudioUtils::TryGetInstrumentAudioConfig(Entity, InstrumentAudioTable, local_66)))
    {
        FString local_72 = FAsGameAudioUtils::GetInstrumentTargetPrefabClassName(Entity);
        FName local_68 = FAsGameAudioUtils::GetInstrumentId(Entity);
        XWarning(ELog(1), FString().Append("GetStopInstrumentsEvent missing config, InstrumentId:").Append(local_68).Append(", Prefab:").Append(local_72));
        return n"None";
    }
    if (!(local_66.bUseStopEvent) || local_66.StopEvent.IsNull())
    {
        return n"None";
    }
    FName local_68_2 = FName(local_66.StopEvent.GetAssetName());
    return local_68_2;
}
UFUNCTION()
FName GetPlayInstrumentsSwitchName(const FECSEntity &inout Entity, const UDataTable InstrumentAudioTable, const int KeyIndex)
{
    FName local_68;
    FName local_75;
    bool local_2 = !(false);
    if (!(Entity.IsValid()) == local_2)
    {
        XWarning(ELog(1), FString().Append("GetPlayInstrumentsSwitchName Entity is invalid!"));
        return n"None";
    }
    FInstrumentAudioConfig local_66;
    if (!(FAsGameAudioUtils::TryGetInstrumentAudioConfig(Entity, InstrumentAudioTable, local_66)))
    {
        FString local_72 = FAsGameAudioUtils::GetInstrumentTargetPrefabClassName(Entity);
        local_68 = FAsGameAudioUtils::GetInstrumentId(Entity);
        XWarning(ELog(1), FString().Append("GetPlayInstrumentsSwitchName missing config, InstrumentId:").Append(local_68).Append(", Prefab:").Append(local_72));
        return n"None";
    }
    int local_73 = 0;
    if (!(FAsGameAudioUtils::TryResolveInstrumentMidiKey(local_66, KeyIndex, local_73)))
    {
        if (local_66.DefaultSwitchValue.IsNull())
        {
            local_75 = n"None";
        }
        else
        {
            local_75 = FName(local_66.DefaultSwitchValue.GetAssetName());
        }
        return local_75;
    }
    if (local_66.SwitchGroupName.IsNone() || local_66.SwitchValueName.IsNone())
    {
        if (local_66.DefaultSwitchValue.IsNull())
        {
            local_68 = n"None";
        }
        else
        {
            local_68 = FName(local_66.DefaultSwitchValue.GetAssetName());
        }
        return local_68;
    }
    FString local_80 = FString().Append(local_66.SwitchGroupName).Append("-").Append(local_66.SwitchValueName).Append("_").Append(FString::ApplyFormat(local_73, "02d"));
    return FName(local_80);
}
UFUNCTION()
FName GetStopInstrumentsSwitchName(const FECSEntity &inout Entity, const UDataTable InstrumentAudioTable)
{
    if (!(Entity.IsValid()) == !(false))
    {
        XWarning(ELog(1), FString().Append("GetStopInstrumentsSwitchName Entity is invalid!"));
        return n"None";
    }
    FInstrumentAudioConfig local_66;
    if (!(FAsGameAudioUtils::TryGetInstrumentAudioConfig(Entity, InstrumentAudioTable, local_66)) || local_66.DefaultSwitchValue.IsNull())
    {
        FString local_72 = FAsGameAudioUtils::GetInstrumentTargetPrefabClassName(Entity);
        FName local_68 = FAsGameAudioUtils::GetInstrumentId(Entity);
        XWarning(ELog(1), FString().Append("GetStopInstrumentsSwitchName missing DefaultSwitchValue, InstrumentId:").Append(local_68).Append(", Prefab:").Append(local_72));
        return n"None";
    }
    FName local_68_2 = FName(local_66.DefaultSwitchValue.GetAssetName());
    return local_68_2;
}
UFUNCTION()
void SendAudioEventAndSwitchInputToServer(const FECSEntity &inout Entity, const FName &inout EventName, const FName &inout SwitchName, const bool bIsStop)
{
    if (EventName.IsNone() || SwitchName.IsNone())
    {
        return;
    }
    UASGameAudioSubSystem local_6 = UASGameAudioSubSystem::Get();
    if (local_6 != nullptr)
    {
        local_6.AddPendingAudioSyncInput(EventName, SwitchName, bIsStop);
        return;
    }
    return;
}
UFUNCTION()
void SendAudioEventInputToServer(const FECSEntity &inout Entity, const FName &inout EventName)
{
    int local_12 = 0;
    bool local_1 = !(Entity.IsValid());
    bool local_2 = !(false);
    local_1 = local_1 == local_2 || EventName.IsNone();
    if (local_1)
    {
        return;
    }
    FFPTime local_8 = FFPTime(-1);
    local_12.AudioEventName = EventName;
    return;
}
UFUNCTION()
void SendAudioSwitchInputToServer(const FECSEntity &inout Entity, const FName &inout SwitchName)
{
    int local_12 = 0;
    bool local_1 = !(Entity.IsValid());
    bool local_2 = !(false);
    local_1 = local_1 == local_2 || SwitchName.IsNone();
    if (local_1)
    {
        return;
    }
    FFPTime local_8 = FFPTime(-1);
    local_12.SwitchName = SwitchName;
    return;
}
UFUNCTION()
void PlayAudioEventWithSync(const FName &inout AudioEventName, const FName &inout SwitchName)
{
    int local_26 = 0;
    if (AudioEventName.IsNone())
    {
        XWarning(ELog(1), FString().Append("PlayAudioEventWithSync AudioEventName is None!"));
        return;
    }
    if (FASCommonUtils::GetLocalPlayerPawnEntity().IsValid())
    {
        FFPTime local_22 = FFPTime(-1);
        local_26.AudioEventName = AudioEventName;
        local_26.SwitchName = SwitchName;
    }
    else
    {
        XWarning(ELog(1), FString().Append("Cannot found LocalEntity When Play Event:%s! ").Append(AudioEventName));
    }
    return;
}
UFUNCTION()
void PlayAudioEventAssetWithSync(TSoftObjectPtr<UAkAudioEvent> &inout AudioEvent)
{
    int local_26 = 0;
    if (AudioEvent.IsNull())
    {
        XWarning(ELog(1), FString().Append("PlayAudioEventAssetWithSync AudioEvent Asset is None!"));
        return;
    }
    if (FASCommonUtils::GetLocalPlayerPawnEntity().IsValid())
    {
        FFPTime local_22 = FFPTime(-1);
        local_26.AudioEventName = FName(AudioEvent.GetAssetName());
    }
    else
    {
        XWarning(ELog(1), FString().Append("Cannot found LocalEntity When Play Event:%s! ").Append(AudioEvent.ToString()));
    }
    return;
}
UFUNCTION()
void PlayAudioEvent(const FECSEntity &inout Entity, const TSoftObjectPtr<UAkAudioEvent> &inout Event, const ESfxSourceType SourceType = ESfxSourceType::SourceType_Root, const bool bFollow = false, const EGameAudioEmitterPartType PartType = EGameAudioEmitterPartType::Root, const FName &inout Socket = n"None", const FVector &inout LocationOffset = FVector::ZeroVector, const FRotator &inout RotationOffset = FRotator::ZeroRotator, const bool bLocalSpace = true, const bool bIsLoop = false, const bool bLoopEnd = false)
{
    if (!(Entity.IsValid()))
    {
        XWarning(ELog(1), "PlayAudioEvent: Entity is not valid");
        return;
    }
    if (Event.IsNull())
    {
        XWarning(ELog(1), "PlayAudioEvent: Event is null");
        return;
    }
    FName local_6 = GetPrefabAvatarSwitchName(Entity);
    if (!(local_6.IsNone()))
    {
        FGameAudioUtils::SetAudioSwitch(local_6, Entity, FOnLoadEventCallbackWithEntity(), false, FGameAudioUtils::GetCachedAudioWorld());
    }
    switch (int(SourceType))
    {
    case 1:
    {
        FGameAudioUtils::PlayEventOnEmitter(Event, Entity, FLoadEventCallback(), EGameAudioEmitterPartType(PartType), bFollow, bIsLoop, bLoopEnd, FGameAudioUtils::GetCachedAudioWorld(), true);
        return;
    }
    case 2:
    {
        FGameAudioUtils::PlayEventAtSocket(Event, Entity, FLoadEventCallback(), Socket, bFollow, bIsLoop, bLoopEnd, FGameAudioUtils::GetCachedAudioWorld(), true);
        return;
    }
    case 3:
    {
        FGameAudioUtils::PlayEventAtLocation(Event, Entity, FLoadEventCallback(), LocationOffset, FQuat4f(RotationOffset.Quaternion()), FGameAudioUtils::GetCachedAudioWorld(), bLocalSpace, true);
        return;
    }
    case 4:
    {
        FGameAudioUtils::PlayEventUI(Event, FLoadEventCallback(), FGameAudioUtils::GetCachedAudioWorld(), true);
        return;
    }
    case 0:
    default:
    {
        FGameAudioUtils::PlayEventOnEmitter(Event, Entity, FLoadEventCallback(), EGameAudioEmitterPartType(0), bFollow, bIsLoop, bLoopEnd, FGameAudioUtils::GetCachedAudioWorld(), true);
    }
    }
}
UFUNCTION()
void PlayAudioEventByName(const FECSEntity &inout Entity, const FName &inout EventName, const ESfxSourceType SourceType = ESfxSourceType::SourceType_Root, const bool bFollow = false, const EGameAudioEmitterPartType PartType = EGameAudioEmitterPartType::Root, const FName &inout Socket = n"None", const FVector &inout LocationOffset = FVector::ZeroVector, const FRotator &inout RotationOffset = FRotator::ZeroRotator, const bool bLocalSpace = true, const bool bIsLoop = false, const bool bLoopEnd = false)
{
    if (!(Entity.IsValid()))
    {
        XWarning(ELog(1), "PlayAudioEventByName: Entity is not valid");
        return;
    }
    if (EventName.IsNone())
    {
        XWarning(ELog(1), "PlayAudioEventByName: EventName is none");
        return;
    }
    FName local_6 = GetPrefabAvatarSwitchName(Entity);
    if (!(local_6.IsNone()))
    {
        FGameAudioUtils::SetAudioSwitch(local_6, Entity, FOnLoadEventCallbackWithEntity(), false, FGameAudioUtils::GetCachedAudioWorld());
    }
    switch (int(SourceType))
    {
    case 1:
    {
        FGameAudioUtils::PlayEventOnEmitter(EventName, Entity, FLoadEventCallback(), EGameAudioEmitterPartType(PartType), bFollow, bIsLoop, bLoopEnd, FGameAudioUtils::GetCachedAudioWorld(), true);
        return;
    }
    case 2:
    {
        FGameAudioUtils::PlayEventAtSocket(EventName, Entity, FLoadEventCallback(), Socket, bFollow, bIsLoop, bLoopEnd, FGameAudioUtils::GetCachedAudioWorld(), true);
        return;
    }
    case 3:
    {
        FGameAudioUtils::PlayEventAtLocation(EventName, Entity, FLoadEventCallback(), LocationOffset, FQuat4f(RotationOffset.Quaternion()), FGameAudioUtils::GetCachedAudioWorld(), bLocalSpace, true);
        return;
    }
    case 4:
    {
        FGameAudioUtils::PlayEventUI(EventName, FLoadEventCallback(), FGameAudioUtils::GetCachedAudioWorld(), true);
        return;
    }
    case 0:
    default:
    {
        FGameAudioUtils::PlayEventOnEmitter(EventName, Entity, FLoadEventCallback(), EGameAudioEmitterPartType(0), bFollow, bIsLoop, bLoopEnd, FGameAudioUtils::GetCachedAudioWorld(), true);
    }
    }
}
}
