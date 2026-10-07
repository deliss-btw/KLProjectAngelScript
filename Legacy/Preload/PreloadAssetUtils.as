
namespace FPreloadAssetUtils
{
    const FConsoleVariable CVar_PreloadAssetDebug = FConsoleVariable();

UFUNCTION()
void LoadAkBank(const TSoftObjectPtr<UAkAudioBank> &inout Bank)
{
    if (Bank.IsNull())
    {
        return;
    }
    UASGameAudioSubSystem local_6 = UASGameAudioSubSystem::Get();
    if (local_6 != nullptr)
    {
        local_6.PreloadAudioType(Bank, EGameAudioType(0), FOnSoftObjectLoaded());
    }
    else
    {
        Bank.LoadAsync(FOnSoftObjectLoaded());
    }
    XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(1), FString().Append("UAkAudioBank LoadAsync!, Event: ").Append(Bank.GetAssetName()));
    return;
}
UFUNCTION()
void LoadAkRtpc(const TSoftObjectPtr<UAkRtpc> &inout Rtpc)
{
    if (Rtpc.IsNull())
    {
        return;
    }
    UASGameAudioSubSystem local_6 = UASGameAudioSubSystem::Get();
    if (local_6 != nullptr)
    {
        local_6.PreloadAudioType(Rtpc, EGameAudioType(2), FOnSoftObjectLoaded());
    }
    else
    {
        Rtpc.LoadAsync(FOnSoftObjectLoaded());
    }
    XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(1), FString().Append("LoadAkRtpc LoadAsync!, Event: ").Append(Rtpc.GetAssetName()));
    return;
}
UFUNCTION()
void LoadAkSwitch(const TSoftObjectPtr<UAkSwitchValue> &inout Switch)
{
    if (Switch.IsNull())
    {
        return;
    }
    UASGameAudioSubSystem local_6 = UASGameAudioSubSystem::Get();
    if (local_6 != nullptr)
    {
        local_6.PreloadAudioType(Switch, EGameAudioType(3), FOnSoftObjectLoaded());
    }
    else
    {
        Switch.LoadAsync(FOnSoftObjectLoaded());
    }
    XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(1), FString().Append("LoadAkSwitch LoadAsync!, Event: ").Append(Switch.GetAssetName()));
    return;
}
UFUNCTION()
void LoadAkEvent(const TSoftObjectPtr<UAkAudioEvent> &inout Event)
{
    if (Event.IsNull())
    {
        return;
    }
    UASGameAudioSubSystem local_6 = UASGameAudioSubSystem::Get();
    if (local_6 != nullptr)
    {
        local_6.PreloadAudioType(Event, EGameAudioType(1), FOnSoftObjectLoaded());
    }
    else
    {
        Event.LoadAsync(FOnSoftObjectLoaded());
    }
    XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(1), FString().Append("LoadAkEvent LoadAsync!, Event: ").Append(Event.GetAssetName()));
    return;
}
UFUNCTION()
void LoadAkState(const TSoftObjectPtr<UAkStateValue> &inout State)
{
    if (State.IsNull())
    {
        return;
    }
    UASGameAudioSubSystem local_6 = UASGameAudioSubSystem::Get();
    if (local_6 != nullptr)
    {
        local_6.PreloadAudioType(State, EGameAudioType(4), FOnSoftObjectLoaded());
    }
    else
    {
        State.LoadAsync(FOnSoftObjectLoaded());
    }
    XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(1), FString().Append("LoadAkState LoadAsync!, State: ").Append(State.GetAssetName()));
    return;
}
UFUNCTION()
void LoadFXActor(const TSoftClassPtr<AFXActor> &inout Actor)
{
    if (Actor.IsNull())
    {
        return;
    }
    UASGameAudioSubSystem local_6 = UASGameAudioSubSystem::Get();
    if (local_6 != nullptr)
    {
        local_6.PreloadFxActor(Actor, FOnSoftObjectLoaded());
    }
    else
    {
        Actor.LoadAsync(FOnSoftClassLoaded());
    }
    return;
}
UFUNCTION()
void LoadFXActorByPath(const FSoftClassPath &inout ActorPath)
{
    if (!(ActorPath.IsValid()))
    {
        return;
    }
    FSoftObjectPath local_14 = FSoftObjectPath(ActorPath.ToString());
    FPreloadAssetUtils::LoadFXActor(TSoftClassPtr<AFXActor>(local_14));
    return;
}
UFUNCTION()
bool AddESMPreloadCustomDataToRequest(const UESMPreloadCustomData CustomData, const FName &inout AssetPathName)
{
    int local_12 = 0;
    if (CustomData == nullptr)
    {
        return false;
    }
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    if (!(local_12))
    {
        return false;
    }
    bool local_13 = false;
    if (CustomData.PreloadEvents.Num() > 0)
    {
        local_12.AddToRequestEvents(CustomData.PreloadEvents);
        local_13 = true;
        XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(0), FString().Append("ESMAssetPreload, Asset:").Append(AssetPathName).Append(", PreloadEvents: ").Append(CustomData.PreloadEvents.Num()));
        for (auto& local_36 : CustomData.PreloadEvents)
        {
            if (local_36.IsNull())
            {
                XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(0), FString().Append("ESMAssetPreload.Event, Asset:").Append(AssetPathName).Append(", Event:<Null>"));
                continue;
            }
            XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(0), FString().Append("ESMAssetPreload.Event, Asset:").Append(AssetPathName).Append(", Event:").Append(local_36.GetAssetName()).Append(", Path:").Append(local_36.ToSoftObjectPath().ToString()));
        }
    }
    if (CustomData.PreloadStates.Num() > 0)
    {
        local_12.AddToRequestStates(CustomData.PreloadStates);
        local_13 = true;
        XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(0), FString().Append("ESMAssetPreload, Asset:").Append(AssetPathName).Append(", PreloadStates: ").Append(CustomData.PreloadStates.Num()));
    }
    if (CustomData.PreloadSwitches.Num() > 0)
    {
        local_12.AddToRequestSwitches(CustomData.PreloadSwitches);
        local_13 = true;
        XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(0), FString().Append("ESMAssetPreload, Asset:").Append(AssetPathName).Append(", PreloadSwitches: ").Append(CustomData.PreloadSwitches.Num()));
    }
    if (CustomData.PreloadRtpcs.Num() > 0)
    {
        local_12.AddToRequestRtpcs(CustomData.PreloadRtpcs);
        local_13 = true;
        XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(0), FString().Append("ESMAssetPreload, Asset:").Append(AssetPathName).Append(", PreloadRtpcs: ").Append(CustomData.PreloadRtpcs.Num()));
    }
    if (CustomData.PreloadFXActors.Num() > 0)
    {
        local_12.AddToRequestFxActors(CustomData.PreloadFXActors);
        local_13 = true;
        XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(0), FString().Append("ESMAssetPreload, Asset:").Append(AssetPathName).Append(", PreloadFXActors: ").Append(CustomData.PreloadFXActors.Num()));
    }
    return local_13;
}
UFUNCTION()
bool RequestESMAssetPreload(const FC_ESM &inout ESM)
{
    if (!(ESM) || (!((ESM.Asset != nullptr))))
    {
        return false;
    }
    bool local_6 = false;
    UESMPreloadCustomData local_14 = (Cast<UESMPreloadCustomData>(ESM.Asset.GetCustomConfig(UESMPreloadCustomData)));
    if (local_14 != nullptr)
    {
        FName local_20 = FName(ESM.ToString());
        local_6 = FPreloadAssetUtils::AddESMPreloadCustomDataToRequest(local_14, local_20);
    }
    else
    {
        FString local_18 = FString();
        bool local_1 = FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool();
    }
    return local_6;
}
UFUNCTION()
bool AreAudioActionDataAssetsReady(const FAudioActionData &inout AudioData)
{
    for (auto& local_16 : AudioData)
    {
        if (!(local_16.IsNull()) && !(local_16.IsValid()))
        {
            return false;
        }
    }
    for (auto& local_32 : AudioData.TargetStateValue)
    {
        if (!(local_32.IsNull()) && !(local_32.IsValid()))
        {
            return false;
        }
    }
    for (auto& local_46 : AudioData.TargetSwitchValue)
    {
        if (!(local_46.IsNull()) && !(local_46.IsValid()))
        {
            return false;
        }
    }
    for (auto& local_64 : AudioData.TargetRtpcValue)
    {
        if (!(local_64.GetKey().IsNull()) && !(local_64.GetKey().IsValid()))
        {
            return false;
        }
    }
    return true;
}
UFUNCTION()
void PreloadAudioActionDataAssets(const FAudioActionData &inout AudioData)
{
    for (auto& local_16 : AudioData)
    {
        FPreloadAssetUtils::LoadAkEvent(local_16);
    }
    for (auto& local_30 : AudioData.TargetStateValue)
    {
        FPreloadAssetUtils::LoadAkState(local_30);
    }
    for (auto& local_44 : AudioData.TargetSwitchValue)
    {
        FPreloadAssetUtils::LoadAkSwitch(local_44);
    }
    for (auto& local_62 : AudioData.TargetRtpcValue)
    {
        FPreloadAssetUtils::LoadAkRtpc(local_62.GetKey());
    }
    return;
}
UFUNCTION()
void PreloadSimpleAudioSet(const FSimpleAudioSet &inout AudioSet)
{
    FPreloadAssetUtils::LoadAkSwitch(AudioSet.Switch);
    FPreloadAssetUtils::LoadAkState(AudioSet.State);
    for (auto& local_20 : AudioSet.RtpcMap)
    {
        FPreloadAssetUtils::LoadAkRtpc(local_20.GetKey());
    }
    return;
}
UFUNCTION()
void PreloadDefaultCombatBGMConfig(const FDefaultCombatBGMConfig &inout BGMConfig)
{
    FPreloadAssetUtils::LoadAkEvent(BGMConfig.DefaultCombatBGMEventRef);
    FPreloadAssetUtils::LoadAkState(BGMConfig.DefaultTraceBGMStateRef);
    FPreloadAssetUtils::LoadAkEvent(BGMConfig.DefaultTraceBGMEventRef);
    return;
}
TArray<FSoftObjectPath> GetDefaultResidentAudioPreloadEventPaths()
{
    TArray<FSoftObjectPath> local_4;
    local_4.Add(FSoftObjectPath("/Game/WwiseAudio/Play_Sfx_Prop_HorseCart_MoveSlow_Loop.Play_Sfx_Prop_HorseCart_MoveSlow_Loop"));
    local_4.Add(FSoftObjectPath("/Game/WwiseAudio/Stop_Sfx_Prop_HorseCart_MoveSlow_Loop.Stop_Sfx_Prop_HorseCart_MoveSlow_Loop"));
    local_4.Add(FSoftObjectPath("/Game/WwiseAudio/Play_Sfx_Prop_HorseCart_MoveFast_Loop.Play_Sfx_Prop_HorseCart_MoveFast_Loop"));
    local_4.Add(FSoftObjectPath("/Game/WwiseAudio/Stop_Sfx_Prop_HorseCart_MoveFast_Loop.Stop_Sfx_Prop_HorseCart_MoveFast_Loop"));
    local_4.Add(FSoftObjectPath("/Game/WwiseAudio/Play_Music_Quest_Intro.Play_Music_Quest_Intro"));
    local_4.Add(FSoftObjectPath("/Game/WwiseAudio/Stop_Music_Quest_Intro.Stop_Music_Quest_Intro"));
    local_4.Add(FSoftObjectPath("/Game/WwiseAudio/Play_sfx_avatar_Common_ExecutedByHarbinger.Play_sfx_avatar_Common_ExecutedByHarbinger"));
    local_4.Add(FSoftObjectPath("/Game/WwiseAudio/Play_sfx_avatar_Common_ExecutedByGlimmeringWolf.Play_sfx_avatar_Common_ExecutedByGlimmeringWolf"));
    local_4.Add(FSoftObjectPath("/Game/WwiseAudio/Play_SFX_Mon_QiongQi_Skill_2100_Execute_Main_3_PlayerFly.Play_SFX_Mon_QiongQi_Skill_2100_Execute_Main_3_PlayerFly"));
    local_4.Add(FSoftObjectPath("/Game/WwiseAudio/Play_SFX_Mon_QiongQi_Skill_2100_Execute_Main_Phase3_Player_1.Play_SFX_Mon_QiongQi_Skill_2100_Execute_Main_Phase3_Player_1"));
    local_4.Add(FSoftObjectPath("/Game/WwiseAudio/Play_SFX_Mon_QiongQi_Skill_2100_Execute_Main_Phase3_Player_2.Play_SFX_Mon_QiongQi_Skill_2100_Execute_Main_Phase3_Player_2"));
    local_4.Add(FSoftObjectPath("/Game/WwiseAudio/Play_SFX_Mon_QiongQi_Skill_2100_Execute_Main_Phase3_Player_3.Play_SFX_Mon_QiongQi_Skill_2100_Execute_Main_Phase3_Player_3"));
    local_4.Add(FSoftObjectPath("/Game/WwiseAudio/Play_sfx_mon_RiderOfDoom_Skill_2001_Catch_Execute_P3_CutGround.Play_sfx_mon_RiderOfDoom_Skill_2001_Catch_Execute_P3_CutGround"));
    return local_4;
}
UFUNCTION()
TArray<FName> GetDefaultResidentAudioPreloadStateNames()
{
    TArray<FName> local_4;
    local_4.Add(n"StateGroup_GlobalArea-Area_HuoCun");
    local_4.Add(n"StateGroup_GlobalArea-Area_HuoCun_TJS");
    local_4.Add(n"StateGroup_GlobalArea-Area_HeGu_North");
    local_4.Add(n"StateGroup_GlobalArea-Area_HeGu_North_GateCamp");
    local_4.Add(n"StateGroup_GlobalArea-Area_HeGu_North_BanditCave");
    local_4.Add(n"StateGroup_GlobalArea-Area_HeGu_South");
    local_4.Add(n"StateGroup_GlobalArea-Area_HeGu_South_JinwuDungeon");
    local_4.Add(n"StateGroup_Gameplay-Gameplay_NonCombat");
    local_4.Add(n"StateGroup_Gameplay-Gameplay_NonCombat_Arrival");
    local_4.Add(n"StateGroup_Gameplay-Gameplay_Event_PublicEvent_SocialSpa");
    return local_4;
}
UFUNCTION()
TArray<FName> GetDefaultResidentAudioPreloadSwitchNames()
{
    TArray<FName> local_4;
    return local_4;
}
UFUNCTION()
TArray<FName> GetDefaultResidentAudioPreloadRtpcNames()
{
    TArray<FName> local_4;
    return local_4;
}
UFUNCTION()
void PreloadDefaultResidentAkEvents()
{
    TArray<FSoftObjectPath> local_8 = FPreloadAssetUtils::GetDefaultResidentAudioPreloadEventPaths();
    XLog(ELog(1), FString().Append("[AudioPreload.Resident] Begin, EventPathCount:").Append(local_8.Num()));
    for (auto& local_30 : local_8)
    {
        if (!(local_30.IsValid()))
        {
            XLog(ELog(1), "[AudioPreload.Resident] Skip invalid AkEvent path");
            continue;
        }
        TSoftObjectPtr<UAkAudioEvent> local_50 = TSoftObjectPtr<UAkAudioEvent>(local_30);
        XLog(ELog(1), FString().Append("[AudioPreload.Resident] Request EventPath:").Append(local_30.ToString()));
        FPreloadAssetUtils::LoadAkEvent(local_50);
    }
    return;
}
UFUNCTION()
void PreloadDefaultResidentAkStates(const UKlAudioAssetLoader Loader)
{
    TArray<FName> local_8 = FPreloadAssetUtils::GetDefaultResidentAudioPreloadStateNames();
    XLog(ELog(1), FString().Append("[AudioPreload.Resident] Begin, StateCount:").Append(local_8.Num()));
    for (auto& local_30 : local_8)
    {
        if (local_30.IsNone())
        {
            XLog(ELog(1), "[AudioPreload.Resident] Skip none AkState name");
            continue;
        }
        FString local_12 = Loader.GetStatPath(local_30);
        if (local_12.IsEmpty())
        {
            XLog(ELog(1), FString().Append("[AudioPreload.Resident] Skip unmapped AkState, State:").Append(local_30));
            continue;
        }
        TSoftObjectPtr<UAkStateValue> local_62 = TSoftObjectPtr<UAkStateValue>(FSoftObjectPath(local_12));
        XLog(ELog(1), FString().Append("[AudioPreload.Resident] Request State:").Append(local_30).Append(", Path:").Append(local_12));
        FPreloadAssetUtils::LoadAkState(local_62);
    }
    return;
}
UFUNCTION()
void PreloadDefaultResidentAkSwitches(const UKlAudioAssetLoader Loader)
{
    TArray<FName> local_8 = FPreloadAssetUtils::GetDefaultResidentAudioPreloadSwitchNames();
    XLog(ELog(1), FString().Append("[AudioPreload.Resident] Begin, SwitchCount:").Append(local_8.Num()));
    for (auto& local_30 : local_8)
    {
        if (local_30.IsNone())
        {
            XLog(ELog(1), "[AudioPreload.Resident] Skip none AkSwitch name");
            continue;
        }
        FString local_12 = Loader.GetSwitchPath(local_30);
        if (local_12.IsEmpty())
        {
            XLog(ELog(1), FString().Append("[AudioPreload.Resident] Skip unmapped AkSwitch, Switch:").Append(local_30));
            continue;
        }
        TSoftObjectPtr<UAkSwitchValue> local_62 = TSoftObjectPtr<UAkSwitchValue>(FSoftObjectPath(local_12));
        XLog(ELog(1), FString().Append("[AudioPreload.Resident] Request Switch:").Append(local_30).Append(", Path:").Append(local_12));
        FPreloadAssetUtils::LoadAkSwitch(local_62);
    }
    return;
}
UFUNCTION()
void PreloadDefaultResidentAkRtpcs(const UKlAudioAssetLoader Loader)
{
    TArray<FName> local_8 = FPreloadAssetUtils::GetDefaultResidentAudioPreloadRtpcNames();
    XLog(ELog(1), FString().Append("[AudioPreload.Resident] Begin, RtpcCount:").Append(local_8.Num()));
    for (auto& local_30 : local_8)
    {
        if (local_30.IsNone())
        {
            XLog(ELog(1), "[AudioPreload.Resident] Skip none AkRtpc name");
            continue;
        }
        FString local_12 = Loader.GetRtpcPath(local_30);
        if (local_12.IsEmpty())
        {
            XLog(ELog(1), FString().Append("[AudioPreload.Resident] Skip unmapped AkRtpc, Rtpc:").Append(local_30));
            continue;
        }
        TSoftObjectPtr<UAkRtpc> local_62 = TSoftObjectPtr<UAkRtpc>(FSoftObjectPath(local_12));
        XLog(ELog(1), FString().Append("[AudioPreload.Resident] Request Rtpc:").Append(local_30).Append(", Path:").Append(local_12));
        FPreloadAssetUtils::LoadAkRtpc(local_62);
    }
    return;
}
UFUNCTION()
void PreloadDefaultResidentAudioAssets()
{
    UKlAudioAssetLoader local_4 = UKlAudioAssetLoader::GetInstance();
    if (local_4 == nullptr)
    {
        XLog(ELog(1), "[AudioPreload.Resident] Skip because audio asset loader is null");
        return;
    }
    FPreloadAssetUtils::PreloadDefaultResidentAkEvents();
    FPreloadAssetUtils::PreloadDefaultResidentAkStates(local_4);
    FPreloadAssetUtils::PreloadDefaultResidentAkSwitches(local_4);
    FPreloadAssetUtils::PreloadDefaultResidentAkRtpcs(local_4);
    return;
}
UFUNCTION()
void LoadInstrumentMidiSwitches(const FInstrumentAudioConfig &inout Config)
{
    int local_21;
    if (!(Config.bPreloadKeySwitches) || Config.SwitchGroupName.IsNone() || Config.SwitchValueName.IsNone())
    {
        return;
    }
    UKlAudioAssetLoader local_6 = UKlAudioAssetLoader::GetInstance();
    if (local_6 == nullptr)
    {
        return;
    }
    if (Config.KeyIndexToMidiNotes.Num() > 0)
    {
        auto local_14 = Config.KeyIndexToMidiNotes.Iterator();
        for (; local_14.CanProceed;)
        {
            local_21 = local_14.Proceed();
            if (local_21 < 0 || (local_21 > 127))
            {
                XWarning(ELog(1), FString().Append("LoadInstrumentMidiSwitches invalid MidiKey:").Append(local_21).Append(", InstrumentId:").Append(Config.InstrumentId));
                continue;
            }
            FString local_26 = FString();
            FString local_26_2 = local_6.GetSwitchPath(FName());
            if (!(local_26_2.IsEmpty()))
            {
                FPreloadAssetUtils::LoadAkSwitch(TSoftObjectPtr<UAkSwitchValue>(FSoftObjectPath(local_26_2)));
            }
        }
        return;
    }
    local_21 = Config.PreloadMinKey;
    for (; local_21 <= int(Config.PreloadMaxKey); ++local_21)
    {
        FString local_40 = FString();
        FString local_40_2 = local_6.GetSwitchPath(FName());
        if (!(local_40_2.IsEmpty()))
        {
            FPreloadAssetUtils::LoadAkSwitch(TSoftObjectPtr<UAkSwitchValue>(FSoftObjectPath(local_40_2)));
        }
    }
    return;
}
UFUNCTION()
void PreloadInstrumentAudioFromTable()
{
    UDataTable local_2;
    if (local_2 == nullptr)
    {
        XWarning(ELog(0), "Cannot found InstrumentAudioConfig datatable!");
        return;
    }
    TArray<FInstrumentAudioConfig> local_10;
    local_2.GetAllRows(local_10);
    for (auto& local_24 : local_10)
    {
        FPreloadAssetUtils::LoadAkEvent(local_24.PlayEvent);
        if (local_24.bUseStopEvent)
        {
            FPreloadAssetUtils::LoadAkEvent(local_24.StopEvent);
        }
        FPreloadAssetUtils::LoadAkSwitch(local_24.DefaultSwitchValue);
        FPreloadAssetUtils::LoadInstrumentMidiSwitches(local_24);
    }
    return;
}
UFUNCTION()
void PreloadRegionAudioFromTable(const UDataTable RegionAudioTable)
{
    if (RegionAudioTable == nullptr)
    {
        XWarning(ELog(0), "Cannot found RegionAudioConfig datatable!");
        return;
    }
    TArray<FRegionAudioConfig> local_8;
    RegionAudioTable.GetAllRows(local_8);
    for (auto& local_22 : local_8)
    {
        FPreloadAssetUtils::PreloadSimpleAudioSet(local_22.RegionEnter);
        FPreloadAssetUtils::PreloadSimpleAudioSet(local_22.RegionExit);
    }
    return;
}
UFUNCTION()
void PreloadAudioFromTables()
{
    UDataTable local_4;
    UDataTable local_44;
    UDataTable local_64;
    UDataTable local_102;
    if (local_4 == nullptr)
    {
        XWarning(ELog(0), "Cannot found MapConfig datatable!");
    }
    else
    {
        TArray<FMapConfig> local_10;
        local_4.GetAllRows(local_10);
        for (auto& local_24 : local_10)
        {
            FPreloadAssetUtils::PreloadSimpleAudioSet(local_24.LoadMapAudioSet);
            FPreloadAssetUtils::PreloadSimpleAudioSet(local_24.UnLoadMapAudioSet);
            for (auto& local_42 : local_24.DefaultCombatBGM)
            {
                local_42;
                FPreloadAssetUtils::PreloadDefaultCombatBGMConfig();
            }
        }
    }
    if (local_44 == nullptr)
    {
        XWarning(ELog(0), "Cannot found ImpactSFXConfig datatable!");
    }
    else
    {
        TArray<FImpactConfigSFX> local_48;
        local_44.GetAllRows(local_48);
        for (auto& local_62 : local_48)
        {
            FPreloadAssetUtils::LoadAkEvent(local_62.Default.Event);
            FPreloadAssetUtils::LoadAkEvent(local_62.Cut.Event);
            FPreloadAssetUtils::LoadAkEvent(local_62.Stab.Event);
        }
    }
    if (local_64 == nullptr)
    {
        XWarning(ELog(0), "Cannot found CustomVolumeAudioConfig datatable!");
    }
    else
    {
        TArray<FCustomVolumeAudioConfig> local_68;
        local_64.GetAllRows(local_68);
        for (auto& local_82 : local_68)
        {
            FPreloadAssetUtils::LoadAkEvent(local_82.AudioSet.Event);
            FPreloadAssetUtils::LoadAkSwitch(local_82.AudioSet.Switch);
            FPreloadAssetUtils::LoadAkState(local_82.AudioSet.State);
            for (auto& local_100 : local_82.AudioSet.RtpcMap)
            {
                FPreloadAssetUtils::LoadAkRtpc(local_100.GetKey());
            }
        }
    }
    if (local_102 == nullptr)
    {
        XWarning(ELog(0), "Cannot found LandedImpactSFXConfig datatable!");
    }
    else
    {
        TArray<FLandedImpactConfigSFX> local_106;
        local_102.GetAllRows(local_106);
        for (auto& local_120 : local_106)
        {
            local_120.Default.Preload();
            local_120.Flesh.Preload();
            local_120.Grass.Preload();
            local_120.LandGrass.Preload();
            local_120.LandSoil.Preload();
            local_120.LandStone.Preload();
            local_120.Metal.Preload();
            local_120.Stone.Preload();
            local_120.Water.Preload();
            local_120.Wood.Preload();
        }
    }
    FPreloadAssetUtils::PreloadInstrumentAudioFromTable();
    return;
}
UFUNCTION()
void PreloadVfxFromTables()
{
    UDataTable local_4;
    UDataTable local_26;
    if (local_4 == nullptr)
    {
        XWarning(ELog(0), "Cannot found ImpactVFXConfig datatable!");
    }
    else
    {
        TArray<FImpactConfigVFX> local_10;
        local_4.GetAllRows(local_10);
        for (auto& local_24 : local_10)
        {
            FPreloadAssetUtils::LoadFXActor(local_24.Default.Light.FXActor);
            FPreloadAssetUtils::LoadFXActor(local_24.Default.Moderate.FXActor);
            FPreloadAssetUtils::LoadFXActor(local_24.Default.High.FXActor);
            FPreloadAssetUtils::LoadFXActor(local_24.Cut.Light.FXActor);
            FPreloadAssetUtils::LoadFXActor(local_24.Cut.Moderate.FXActor);
            FPreloadAssetUtils::LoadFXActor(local_24.Cut.High.FXActor);
            FPreloadAssetUtils::LoadFXActor(local_24.Stab.Light.FXActor);
            FPreloadAssetUtils::LoadFXActor(local_24.Stab.Moderate.FXActor);
            FPreloadAssetUtils::LoadFXActor(local_24.Stab.High.FXActor);
            FPreloadAssetUtils::LoadFXActor(local_24.Smash.Light.FXActor);
            FPreloadAssetUtils::LoadFXActor(local_24.Smash.Moderate.FXActor);
            FPreloadAssetUtils::LoadFXActor(local_24.Smash.High.FXActor);
        }
    }
    if (local_26 == nullptr)
    {
        XWarning(ELog(0), "Cannot found LandedImpactVFXConfig datatable!");
        return;
    }
    TArray<FLandedImpactConfigVFX> local_30;
    local_26.GetAllRows(local_30);
    for (auto& local_44 : local_30)
    {
        local_44.Default.Preload();
        local_44.Flesh.Preload();
        local_44.Grass.Preload();
        local_44.LandGrass.Preload();
        local_44.LandSoil.Preload();
        local_44.LandStone.Preload();
        local_44.Metal.Preload();
        local_44.Stone.Preload();
        local_44.Water.Preload();
        local_44.Wood.Preload();
    }
    return;
}
}
