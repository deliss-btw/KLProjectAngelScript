

class UASGameAudioSubSystem : UGameAudioSubSystem
{
    UPROPERTY()
    TMap<UAkAudioType, bool> AudioPreloadState;
    UPROPERTY()
    TMap<UClass, bool> FXPreloadState;
    UPROPERTY()
    TMap<FName, bool> BankPreloadState;
    UPROPERTY()
    TMap<FSoftObjectPath, FAudioPreloadContext> CurrentAudioPreloadContext;
    UPROPERTY()
    TMap<FSoftObjectPath, FFXPreloadContext> CurrentFxPreloadContext;
    UPROPERTY()
    TArray<FAudioActionData> MapAudioSetList;
    UPROPERTY()
    TArray<FAudioSyncInputData> PendingAudioSyncInputList;
    UPROPERTY()
    FAudioActionData PendingUnloadAudioSet;
    UPROPERTY()
    FString PendingUnloadWorldAssetName;
    UPROPERTY()
    bool bHasPendingUnloadAudioSet = false;


    UFUNCTION()
    void Initialize_Implementation()
    {
        this.AudioPreloadState.Empty(0);
        this.FXPreloadState.Empty(0);
        this.BankPreloadState.Empty(0);
        this.PendingAudioSyncInputList.Empty(0);
        this.bHasPendingUnloadAudioSet = false;
        this.PendingUnloadWorldAssetName = "";
        XDisplay(ELog(0), "----------------UASGameAudioSubSystem Initialize world Name--------------");
        return;
    }
    UFUNCTION()
    void Deinitialize_Implementation()
    {
        this.PendingAudioSyncInputList.Empty(0);
        this.bHasPendingUnloadAudioSet = false;
        this.PendingUnloadWorldAssetName = "";
        XDisplay(ELog(0), "----------------UASGameAudioSubSystem Deinitialize--------------");
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const float32 DeltaTime)
    {
        return;
    }
    UFUNCTION()
    void HandlePostLoadMapWithWorld_Implementation(const UWorld InWorld)
    {
        if ((!((InWorld != nullptr))))
        {
            return;
        }
        TSoftObjectPtr<UWorld> local_12 = InWorld;
        FString local_20 = local_12.GetAssetName();
        FString local_24 = "";
        if (this.bHasPendingUnloadAudioSet)
        {
            FMapConfig local_376;
            FSimpleAudioSet local_378 = local_376 = ::FMapUtils::GetMapConfigByRefrence(local_12);
            FString local_382;
            if (this.TryGetPlayMusicKey(local_378.Event, local_382) && this.PendingUnloadContainsStopMusicKey(local_382))
            {
                local_24 = local_382;
                XLog(ELog(1), FString().Append("[PlayAudioWhenMapUnLoaded]  Preserve same BGM across map load: ").Append(this.PendingUnloadWorldAssetName).Append(" -> ").Append(local_20).Append(", MusicKey: ").Append(local_24));
            }
            XLog(ELog(1), FString().Append("[PlayAudioWhenMapUnLoaded]  Apply PendingUnloadAudioSet before load map audio: ").Append(this.PendingUnloadWorldAssetName).Append(" -> ").Append(local_20));
            this.AddPendingUnloadAudioSet(local_24);
            this.bHasPendingUnloadAudioSet = false;
            this.PendingUnloadWorldAssetName = "";
            this.PendingUnloadAudioSet = FAudioActionData();
        }
        FString local_424 = "----------------UASGameAudioSubSystem HandlePostLoadMapWithWorld--------------";
        FString local_16 = InWorld.GetFullName(nullptr);
        this.PlayAudioWhenMapLoaded(TSoftObjectPtr<UWorld>(InWorld), local_24);
        return;
    }
    UFUNCTION()
    void HandleWorldBeginTearDown_Implementation(const UWorld InWorld)
    {
        if ((!((InWorld != nullptr))))
        {
            return;
        }
        FString local_10 = "----------------UASGameAudioSubSystem HandleWorldBeginTearDown--------------";
        FString local_6 = InWorld.GetFullName(nullptr);
        this.PlayAudioWhenMapUnLoaded(TSoftObjectPtr<UWorld>(InWorld));
        return;
    }
    UFUNCTION()
    void ClearSingleBankWhenWorldCleanup_Implementation(const FString &inout BnkName)
    {
        return;
    }
    void AddMapAudioSet(const FAudioActionData &inout AudioSet)
    {
        this.MapAudioSetList.AddUnique(AudioSet);
        return;
    }
    void ClearMapAudioSet()
    {
        this.MapAudioSetList.Empty(0);
        return;
    }
    void AddPendingAudioSyncInput(const FName &inout AudioEventName, const FName &inout SwitchName, const bool bIsStop)
    {
        FAudioSyncInputData local_6;
        local_6.AudioEventName = AudioEventName;
        local_6.SwitchName = SwitchName;
        local_6.bIsStop = bIsStop;
        this.PendingAudioSyncInputList.Add(local_6);
        return;
    }
    void ClearPendingAudioSyncInput()
    {
        this.PendingAudioSyncInputList.Empty(0);
        return;
    }
    bool TryGetPlayMusicKey(const TSoftObjectPtr<UAkAudioEvent> &inout Event, FString &out OutMusicKey)
    {
        FString local_4;
        OutMusicKey = local_4;
        OutMusicKey = "";
        if (Event.IsNull())
        {
            return false;
        }
        FString local_14 = Event.GetAssetName();
        if (!(local_14.StartsWith("Play_Music_", ESearchCase(1))))
        {
            return false;
        }
        OutMusicKey = local_14.Mid(5, 2147483647);
        return true;
    }
    bool TryGetStopMusicKey(const TSoftObjectPtr<UAkAudioEvent> &inout Event, FString &out OutMusicKey)
    {
        FString local_4;
        OutMusicKey = local_4;
        OutMusicKey = "";
        if (Event.IsNull())
        {
            return false;
        }
        FString local_14 = Event.GetAssetName();
        if (!(local_14.StartsWith("Stop_Music_", ESearchCase(1))))
        {
            return false;
        }
        OutMusicKey = local_14.Mid(5, 2147483647);
        return true;
    }
    bool PendingUnloadContainsStopMusicKey(const FString &inout MusicKey)
    {
        if (MusicKey.IsEmpty())
        {
            return false;
        }
        for (auto& local_16 : this.PendingUnloadAudioSet.TargetEvent)
        {
            FString local_20;
            if (this.TryGetStopMusicKey(local_16, local_20) && (local_20 == MusicKey))
            {
                return true;
            }
        }
        return false;
    }
    void AddPendingUnloadAudioSet(const FString &inout PreserveMusicKey)
    {
        FAudioActionData local_36;
        float32 local_115 = 0.0f;
        for (auto& local_52 : this.PendingUnloadAudioSet.TargetEvent)
        {
            FString local_56;
            if (!(PreserveMusicKey.IsEmpty()) && this.TryGetStopMusicKey(local_52, local_56) && (local_56 == PreserveMusicKey))
            {
                XLog(ELog(1), local_56.Append("[PlayAudioWhenMapUnLoaded]  Skip preserved BGM stop event: ").Append(local_52.GetAssetName()));
                continue;
            }
            local_36.AddEvent(local_52);
        }
        for (auto& local_82 : this.PendingUnloadAudioSet.TargetStateValue)
        {
            local_36.AddState(local_82);
        }
        for (auto& local_96 : this.PendingUnloadAudioSet.TargetSwitchValue)
        {
            local_36.AddSwitch(local_96);
        }
        for (auto& local_114 : this.PendingUnloadAudioSet.TargetRtpcValue)
        {
            local_36.AddRtpc(local_114.GetKey(), local_115);
        }
        if (local_36.IsValidData())
        {
            this.AddMapAudioSet(local_36);
        }
        return;
    }
    UFUNCTION()
    void SetAudioAssetLoaded(const TSoftObjectPtr<UAkAudioType> &inout Asset, const bool bLoaded)
    {
        if (Asset.IsValid())
        {
            UAkAudioType local_4;
            this.AudioPreloadState.FindOrAdd(local_4) = bLoaded;
        }
        return;
    }
    UFUNCTION()
    void SetFXAssetLoaded(const UClass Asset, const bool bLoaded)
    {
        if (Asset != nullptr)
        {
            this.FXPreloadState.FindOrAdd(Asset) = bLoaded;
        }
        return;
    }
    UFUNCTION()
    void SetBankLoaded(const FName &inout BankName, const bool bLoaded)
    {
        if (!(BankName.IsNone()))
        {
            this.BankPreloadState.FindOrAdd(BankName) = bLoaded;
        }
        return;
    }
    UFUNCTION()
    bool IsAudioAssetPreloaded(const TSoftObjectPtr<UAkAudioType> &inout Asset)
    {
        if (Asset.IsNull())
        {
            return false;
        }
        return (0 != 0);
    }
    UFUNCTION()
    bool IsFXAssetPreloaded(const TSoftClassPtr<AFXActor> &inout Asset)
    {
        if (Asset.IsNull())
        {
            return false;
        }
        UClass local_6 = Asset.Get();
        return (0 != 0);
    }
    UFUNCTION()
    bool IsBankPreloaded(const FName &inout BankName)
    {
        int local_2 = 0;
        return this.BankPreloadState.Find(BankName, local_2);
    }
    UFUNCTION()
    void PlayAudioWhenMapLoaded(const TSoftObjectPtr<UWorld> &inout WorldSoftPtr, const FString &inout PreserveMusicKey)
    {
        float32 local_433 = 0.0f;
        if (!(WorldSoftPtr.IsValid()))
        {
            return;
        }
        XLog(ELog(1), FString().Append("[PlayAudioWhenMapLoaded]  WorldSoftPtr:  ").Append(WorldSoftPtr.ToString()).Append(", World AssetName: ").Append(WorldSoftPtr.GetAssetName()));
        FMapConfig local_368;
        FSimpleAudioSet local_370 = local_368 = ::FMapUtils::GetMapConfigByRefrence(WorldSoftPtr);
        FAudioActionData local_406;
        if (!(local_370.State.IsNull()))
        {
            local_406.AddState(local_370.State);
        }
        else
        {
            XWarning(ELog(0), FString().Append("[PlayAudioWhenMapLoaded]  MapConfig.LoadMapAudioSet.State is not configed!  ").Append(WorldSoftPtr.ToString()));
        }
        if (!(local_370.Switch.IsNull()))
        {
            local_406.AddSwitch(local_370.Switch);
        }
        TSoftObjectPtr<UAkAudioEvent> local_408 = local_370.Event;
        if (!(local_408.IsNull()))
        {
            FString local_412;
            if (!(PreserveMusicKey.IsEmpty()) && this.TryGetPlayMusicKey(local_408, local_412) && (local_412 == PreserveMusicKey))
            {
                XWarning(ELog(1), FString().Append("[PlayAudioWhenMapLoaded]  Replay preserved BGM play event to avoid silent carry-over: ").Append(local_408.GetAssetName()));
                local_406.AddEvent(local_408);
            }
            else
            {
                local_406.AddEvent(local_408);
            }
        }
        else
        {
            XWarning(ELog(0), FString().Append("[PlayAudioWhenMapLoaded]  MapConfig.LoadMapAudioSet.Event is not configed!  ").Append(WorldSoftPtr.ToString()));
        }
        for (auto& local_432 : local_370.RtpcMap)
        {
            local_406.AddRtpc(local_432.GetKey(), local_433);
        }
        if (local_406.IsValidData())
        {
            XLog(ELog(1), FString().Append("[PlayAudioWhenMapLoaded]  AddAudioSet Success!  World AssetName: ").Append(WorldSoftPtr.GetAssetName()));
            this.AddMapAudioSet(local_406);
        }
        return;
    }
    UFUNCTION()
    void PlayAudioWhenMapUnLoaded(const TSoftObjectPtr<UWorld> &inout WorldSoftPtr)
    {
        float32 local_429 = 0.0f;
        if (!(WorldSoftPtr.IsValid()))
        {
            return;
        }
        if (WorldSoftPtr.IsNull())
        {
            return;
        }
        XWarning(ELog(1), FString().Append("[PlayAudioWhenMapUnLoaded]  WorldSoftPtr:  ").Append(WorldSoftPtr.ToString()).Append(", World AssetName: ").Append(WorldSoftPtr.GetAssetName()));
        FAudioActionData local_52;
        FMapConfig local_404;
        FSimpleAudioSet local_406 = local_404 = ::FMapUtils::GetMapConfigByRefrence(WorldSoftPtr);
        TSoftObjectPtr<UAkAudioEvent> local_408 = local_406.Event;
        if (!(local_408.IsNull()))
        {
            local_52.AddEvent(local_408);
        }
        TSoftObjectPtr<UAkStateValue> local_410 = local_406.State;
        if (!(local_410.IsNull()))
        {
            local_52.AddState(local_410);
        }
        if (!(local_406.Switch.IsNull()))
        {
            local_52.AddSwitch(local_406.Switch);
        }
        for (auto& local_428 : local_406.RtpcMap)
        {
            local_52.AddRtpc(local_428.GetKey(), local_429);
        }
        XWarning(ELog(1), FString().Append("[PlayAudioWhenMapUnLoaded]   World AssetName: ").Append(WorldSoftPtr.GetAssetName()));
        this.PendingUnloadWorldAssetName = WorldSoftPtr.GetAssetName();
        this.bHasPendingUnloadAudioSet = false;
        this.PendingUnloadAudioSet = FAudioActionData();
        if (local_52.IsValidData())
        {
            this.PendingUnloadAudioSet = local_52;
            this.bHasPendingUnloadAudioSet = true;
        }
        return;
    }
    UFUNCTION()
    void PreloadAudioType(const TSoftObjectPtr<UAkAudioType> &inout AkAudioType, const EGameAudioType AudioType, const FOnSoftObjectLoaded &inout LoadCallBack)
    {
        if (AkAudioType.IsNull())
        {
            return;
        }
        if (ECS::GetECSWorldOfObject(this.GetWorld()).IsValid())
        {
            if (this.IsAudioAssetPreloaded(AkAudioType))
            {
                XLogIf(FAsGameAudioUtils::CVar_Audio_LoadDebug.GetBool(), ELog(1), FString().Append("PreloadAudioType Check, Audio Resource Is Already Preloaded!, Audio: ").Append(AkAudioType.GetAssetName()));
                return;
            }
        }
        FSoftObjectPath local_34 = AkAudioType.ToSoftObjectPath();
        if (this.CurrentAudioPreloadContext.Contains(local_34))
        {
            return;
        }
        FAudioPreloadContext& local_36 = this.CurrentAudioPreloadContext.FindOrAdd(local_34);
        local_36.Path = local_34;
        local_36.LoadedCallBack = LoadCallBack;
        local_36.AudioType = AudioType;
        AkAudioType.LoadAsync(FOnSoftObjectLoaded(this, n"OnAudioPreLoadCallBack"));
        XLogIf(FAsGameAudioUtils::CVar_Audio_LoadDebug.GetBool(), ELog(1), FString().Append("Audio Resource PreLoadAsync Begin, Event: ").Append(AkAudioType.GetAssetName()));
        return;
    }
    UFUNCTION()
    void PreloadFxActor(const TSoftClassPtr<AFXActor> &inout FXActorSoft, const FOnSoftObjectLoaded &inout LoadCallBack)
    {
        if (FXActorSoft.IsNull())
        {
            return;
        }
        if (ECS::GetECSWorldOfObject(this.GetWorld()).IsValid())
        {
            if (this.IsFXAssetPreloaded(FXActorSoft))
            {
                XLogIf(FFXUtils::CVar_Fx_LoadDebug.GetBool(), ELog(1), FString().Append("PreloadFxActor Check, FX Resource Is Already Preloaded!, FX: ").Append(FXActorSoft.GetAssetName()));
                return;
            }
        }
        FSoftObjectPath local_34 = FXActorSoft.ToSoftObjectPath();
        if (this.CurrentFxPreloadContext.Contains(local_34))
        {
            return;
        }
        FFXPreloadContext& local_36 = this.CurrentFxPreloadContext.FindOrAdd(local_34);
        local_36.Path = local_34;
        local_36.LoadedCallBack = LoadCallBack;
        local_36.PendingAudioPaths.Reset(0);
        FXActorSoft.LoadAsync(FOnSoftClassLoaded(this, n"OnFxPreLoadCallBack"));
        XLogIf(FFXUtils::CVar_Fx_LoadDebug.GetBool(), ELog(1), FString().Append("FX Resource PreLoadAsync Begin, FX: ").Append(FXActorSoft.GetAssetName()));
        return;
    }
    void CollectFxActorAudioEvent(const TSoftObjectPtr<UAkAudioEvent> &inout Event, TArray<FSoftObjectPath> &inout PendingAudioPaths, TArray<TSoftObjectPtr<UAkAudioEvent>> &inout PendingAudioEvents, int &inout PreloadEventCount)
    {
        if (Event.IsNull())
        {
            return;
        }
        bool local_1 = this.IsAudioAssetPreloaded(Event);
        if (!(local_1))
        {
            FSoftObjectPath local_18 = Event.ToSoftObjectPath();
            if (local_18.ToString().IsEmpty())
            {
                return;
            }
            PendingAudioPaths.AddUnique(local_18);
            PendingAudioEvents.Add(Event);
        }
        ++PreloadEventCount;
        return;
    }
    void PreloadFxActorAudioEvents(const UClass LoadedClass, FFXPreloadContext &inout FxContext)
    {
        if (LoadedClass == nullptr)
        {
            return;
        }
        AFXActor local_4 = (Cast<AFXActor>(LoadedClass.GetDefaultObject()));
        if (local_4 == nullptr)
        {
            return;
        }
        int local_9 = 0;
        TArray<FSoftObjectPath> local_14;
        TArray<TSoftObjectPtr<UAkAudioEvent>> local_18;
        for (auto& local_32 : local_4.FxEnableEventPatterns)
        {
            this.CollectFxActorAudioEvent(local_32.EnterEvent, local_14, local_18, local_9);
        }
        for (auto& local_46 : local_4.FxExitEventPatterns)
        {
            this.CollectFxActorAudioEvent(local_46.EnterEvent, local_14, local_18, local_9);
        }
        for (auto& local_60 : local_4.FxStoppageEventPatterns)
        {
            this.CollectFxActorAudioEvent(local_60.EnterEvent, local_14, local_18, local_9);
        }
        if (local_4.bEnableMultiPositionSFX)
        {
            this.CollectFxActorAudioEvent(local_4.SFXMultiPositionSettings.StartEvent, local_14, local_18, local_9);
            this.CollectFxActorAudioEvent(local_4.SFXMultiPositionSettings.StopEvent, local_14, local_18, local_9);
        }
        FxContext.PendingAudioPaths = local_14;
        for (auto& local_74 : local_18)
        {
            this.PreloadAudioType(local_74, EGameAudioType(1), FOnSoftObjectLoaded());
        }
        XLogIf(FFXUtils::CVar_Fx_LoadDebug.GetBool(), ELog(1), FString().Append("FX Audio Resource PreLoadAsync Requested, FX: ").Append(LoadedClass.GetName()).Append(", EventCount: ").Append(local_9));
        return;
    }
    bool IsFxPreloadReady(const FFXPreloadContext &inout FxContext)
    {
        for (auto& local_16 : FxContext.PendingAudioPaths)
        {
            if (!(this.IsAudioAssetPreloaded(TSoftObjectPtr<UAkAudioEvent>(local_16))))
            {
                return false;
            }
        }
        return true;
    }
    void FinishFxPreload(const FSoftObjectPath &inout AssetPath)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void TryFinishPendingFxPreloads()
    {
        TArray<FSoftObjectPath> local_4;
        for (auto& local_24 : this.CurrentFxPreloadContext)
        {
            if (this.IsFxPreloadReady())
            {
                local_4.Add(local_24.GetKey());
            }
        }
        for (auto& local_40 : local_4)
        {
            this.FinishFxPreload(local_40);
        }
        return;
    }
    UFUNCTION()
    void OnAudioPreLoadCallBack(const UObject LoadedObject)
    {
        UAkAudioType local_46;
        if (LoadedObject == nullptr)
        {
            XLogIf(FAsGameAudioUtils::CVar_Audio_LoadDebug.GetBool(), ELog(1), FString().Append("OnAudioPreLoadCallBack PreLoadAsync End, Event is nullptr!"));
            return;
        }
        FSoftObjectPath local_24 = FSoftObjectPath(LoadedObject);
        FAudioPreloadContext local_38;
        if (this.CurrentAudioPreloadContext.Find(local_24, local_38))
        {
            local_38.LoadedCallBack.ExecuteIfBound(LoadedObject);
            if (int(local_38.AudioType) == 1)
            {
                local_46 = (Cast<UAkAudioType>(LoadedObject));
                this.SetAudioAssetLoaded(TSoftObjectPtr<UAkAudioType>(local_46), true);
                XLogIf(FAsGameAudioUtils::CVar_Audio_LoadDebug.GetBool(), ELog(1), FString().Append("Audio Resource PreLoadAsync End, Event: ").Append(LoadedObject.GetName()));
            }
            else
            {
                if (int(local_38.AudioType) == 2)
                {
                    local_46 = (Cast<UAkAudioType>(LoadedObject));
                    this.SetAudioAssetLoaded(TSoftObjectPtr<UAkAudioType>(local_46), true);
                    XLogIf(FAsGameAudioUtils::CVar_Audio_LoadDebug.GetBool(), ELog(1), FString().Append("Audio Resource PreLoadAsync End, Rtpc: ").Append(LoadedObject.GetName()));
                }
                else
                {
                    if (int(local_38.AudioType) == 3)
                    {
                        local_46 = (Cast<UAkAudioType>(LoadedObject));
                        this.SetAudioAssetLoaded(TSoftObjectPtr<UAkAudioType>(local_46), true);
                        XLogIf(FAsGameAudioUtils::CVar_Audio_LoadDebug.GetBool(), ELog(1), FString().Append("Audio Resource PreLoadAsync End, Switch: ").Append(LoadedObject.GetName()));
                    }
                    else
                    {
                        if (int(local_38.AudioType) == 4)
                        {
                            local_46 = (Cast<UAkAudioType>(LoadedObject));
                            this.SetAudioAssetLoaded(TSoftObjectPtr<UAkAudioType>(local_46), true);
                            XLogIf(FAsGameAudioUtils::CVar_Audio_LoadDebug.GetBool(), ELog(1), FString().Append("Audio Resource PreLoadAsync End, State: ").Append(LoadedObject.GetName()));
                        }
                        else
                        {
                            if (int(local_38.AudioType) == 0)
                            {
                                this.SetBankLoaded(LoadedObject.GetFName(), true);
                                XLogIf(FAsGameAudioUtils::CVar_Audio_LoadDebug.GetBool(), ELog(1), FString().Append("Audio Resource PreLoadAsync End, Bank: ").Append(LoadedObject.GetName()));
                            }
                        }
                    }
                }
            }
            this.TryFinishPendingFxPreloads();
        }
        return;
    }
    UFUNCTION()
    void OnFxPreLoadCallBack(const UClass LoadedClass)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}

