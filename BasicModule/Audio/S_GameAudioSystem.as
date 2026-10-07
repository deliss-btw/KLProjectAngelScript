
const FConsoleVariable CVar_AudioSyncEnable = FConsoleVariable();
const FConsoleVariable CVar_AudioTimeOfDayEnable = FConsoleVariable();

class US_GameAudioSystem : UECSScriptSystem
{
    UPROPERTY()
    UDataTable WeatherAudioTable;
    UPROPERTY()
    UDataTable RegionAudioTable;
    UPROPERTY()
    UDataTable TimeOfDayStageAudioTable;
    UPROPERTY()
    TSoftObjectPtr<UAkRtpc> GlobalTimeRtpc;

    US_GameAudioSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_GameAudioSystemOnEnterDS() const
    {
        FGameAudioUtils::StopAllLoopSound();
        return;
    }
    UFUNCTION()
    void Job_PreloadRegionAudioTable() const
    {
        ::FPreloadAssetUtils::PreloadRegionAudioFromTable(this.RegionAudioTable);
        return;
    }
    UFUNCTION()
    void ClientJob_FlushPendingAudioSyncInputs() const
    {
        FCE_ClientToServerAudioInput local_42;
        UASGameAudioSubSystem local_4 = ::UASGameAudioSubSystem::Get();
        if (!((local_4 != nullptr)) || (local_4.PendingAudioSyncInputList.Num() <= 0))
        {
            return;
        }
        Has local_20;
        if (!(::FASCommonUtils::GetLocalPlayerPawnEntity().IsValid()) || !(local_20.opCall()))
        {
            local_4.ClearPendingAudioSyncInput();
            return;
        }
        for (auto& local_34 : local_4.PendingAudioSyncInputList)
        {
            FFPTime local_40 = FFPTime(-1);
            local_42.AudioEventName = local_34.AudioEventName;
            local_42.SwitchName = local_34.SwitchName;
            local_42.bIsStop = local_34.bIsStop;
        }
        local_4.ClearPendingAudioSyncInput();
        return;
    }
    UFUNCTION()
    void Job_AddMapAudioDataToPendingList() const
    {
        UASGameAudioSubSystem local_4 = ::UASGameAudioSubSystem::Get();
        if (local_4 != nullptr)
        {
            TArray<FAudioActionData> local_8 = local_4.MapAudioSetList;
            if (local_8.Num() > 0)
            {
                FCS_MapAudioBGM local_18;
                FECSWorldPtr local_12 = ECS::GetECSWorld();
                if (local_18)
                {
                    for (auto& local_32 : local_8)
                    {
                        local_18.AudioActionDataList.AddUnique(local_32);
                    }
                    local_18.bPreloadRequested = false;
                    local_4.ClearMapAudioSet();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_CollectHandleMapAudioBGM(const FCS_MapAudioBGM &inout MapAudioBGM) const
    {
        bool local_1 = true;
        for (auto& local_16 : MapAudioBGM.AudioActionDataList)
        {
            if (local_16.TargetEvent.Num() > 0)
            {
                XLog(ELog(1), FString().Append("Job_CollectHandleMapAudioBGM, play map bgm, Event: ").Append(local_16.TargetEvent[0]));
            }
            if (local_16.TargetStateValue.Num() > 0)
            {
                XLog(ELog(1), FString().Append("Job_CollectHandleMapAudioBGM, play map bgm, State: ").Append(local_16.TargetStateValue[0]));
            }
            if (local_16.TargetSwitchValue.Num() > 0)
            {
                XLog(ELog(1), FString().Append("Job_CollectHandleMapAudioBGM, play map bgm, Switch: ").Append(local_16.TargetSwitchValue[0]));
            }
            if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
            {
                Print(FString().Append("Job_CollectHandleMapAudioBGM, play map bgm, Data: ").Append(local_16.ToString()), 99999.0f, FLinearColor::DPink);
            }
            if (!(::FPreloadAssetUtils::AreAudioActionDataAssetsReady(local_16)))
            {
                local_1 = false;
            }
        }
        if (!(local_1))
        {
            if (!(MapAudioBGM.bPreloadRequested))
            {
                FCS_MapAudioBGM local_38;
                for (auto& local_16 : MapAudioBGM.AudioActionDataList)
                {
                    if (!(::FPreloadAssetUtils::AreAudioActionDataAssetsReady(local_16)))
                    {
                        ::FPreloadAssetUtils::PreloadAudioActionDataAssets(local_16);
                    }
                }
                FECSWorldPtr local_32 = ECS::GetECSWorld();
                if (local_38)
                {
                    local_38.bPreloadRequested = true;
                }
                XWarning(ELog(1), "Job_CollectHandleMapAudioBGM request map bgm preload, keep pending order.");
            }
            else
            {
                XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(1), "Job_CollectHandleMapAudioBGM wait for map bgm preload ready, keep pending order.");
            }
            return;
        }
        for (auto& local_16 : MapAudioBGM.AudioActionDataList)
        {
            FAudioActionData local_74 = FAudioActionData(local_16);
            FGameAudioUtils::Play2DBGMAudioActionData(local_74, FLoadEventCallback(), FGameAudioUtils::GetCachedAudioWorld());
        }
        FECSWorldPtr local_32_2 = ECS::GetECSWorld();
        Remove local_84;
        local_84.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_OnRegionEntry(const FECSEntity &inout Entity, const FC_RegionEntry &inout RegionEntry) const
    {
        if (!(this.IsLocalPlayerPawnForRegionAudio(Entity)))
        {
            return;
        }
        ::FAsGameAudioUtils::PlayAudioWhenRegionEnter(Entity, RegionEntry.GetRegionName(), this.RegionAudioTable);
        return;
    }
    UFUNCTION()
    void Monitor_OnRegionExit(const FECSEntity &inout Entity, const FC_RegionExit &inout RegionExit) const
    {
        if (!(this.IsLocalPlayerPawnForRegionAudio(Entity)))
        {
            return;
        }
        ::FAsGameAudioUtils::PlayAudioWhenRegionExit(Entity, RegionExit.GetRegionName(), this.RegionAudioTable);
        return;
    }
    bool IsLocalPlayerPawnForRegionAudio(const FECSEntity &inout Entity) const
    {
        Has local_4;
        bool local_5;
        if (!(local_4.opCall()))
        {
            return false;
        }
        GetDefaulted local_10;
        if (!(FECSEntity(local_10.opCall().GetPlayerEntity()).IsValid()))
        {
            local_5 = false;
        }
        else
        {
            Has local_18;
            local_5 = local_18.opCall();
        }
        Get local_24;
        local_5 = local_5 && (FECSEntity(local_24.opCall().GetPlayerPawnEntity()) == Entity);
        return local_5;
    }
    UFUNCTION()
    void Job_HandleWeatherChanged(const FCE_ClientPlayerWeatherChanged &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_UpdateCombatBGM(const FECSEntity &inout PlayerEntity, FC_PlayerBGMInfo &inout PlayerBGMInfo) const
    {
        bool local_13;
        int local_137 = 0;
        bool local_183;
        int local_428 = 0;
        FECSEntity local_4 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(::FASCommonUtils::GetControlledPawnEntity(PlayerEntity));
        if (!(local_4.IsValid()))
        {
            return;
        }
        TDataObjectPtr<FMapConfig> local_38;
        if (::FLevelUtils::GetCurrentLevelInfoConfig(nullptr))
        {
            local_38 = GetMapConfig();
        }
        TSoftObjectPtr<UAkStateValue> local_120;
        TSoftObjectPtr<UAkAudioEvent> local_130;
        FECSEntity local_134;
        local_13 = false;
        bool local_135 = local_13;
        if (::FAIKnowledgeUtils::IsEntityInCombatWithDelay(local_4))
        {
            Get local_220;
            int local_211;
            Get local_208;
            int local_136 = -1;
            TSet<FTargetEntity> local_178 = ::FAITargetingUtils::GetEntityCombatTargets(local_4);
            if (PlayerBGMInfo.CombatBGMEntity && ((PlayerBGMInfo.TraceBGMStartTime.opCmp(0.0) >= 0)))
            {
                local_135 = local_178.Contains(FTargetEntity(PlayerBGMInfo.CombatBGMEntity));
                local_183 = !(local_135);
                local_13 = !(false);
                if (local_183 == local_13)
                {
                    local_178.Add(FTargetEntity(PlayerBGMInfo.CombatBGMEntity));
                }
            }
            for (auto& local_204 : local_178)
            {
                FECSEntity local_12 = local_204.GetEntity();
                const FC_MonsterBGMConfig& local_210 = local_208.opCall();
                if (local_210)
                {
                    bool local_331;
                    local_211 = -1;
                    FECSEntity local_216 = local_204.GetEntity();
                    const FC_CreatureMeta& local_222 = local_220.opCall();
                    if (local_222)
                    {
                        if ((PlayerBGMInfo.CombatBGMEntity == local_204.GetEntity()) && ((PlayerBGMInfo.TraceBGMStartTime.opCmp(0.0) >= 0)))
                        {
                            local_211 = int(local_210.TraceBGMInterruptStrength);
                        }
                        else
                        {
                            if (local_222.CreatureConfigProxy.GetMonsterConfig())
                            {
                                CastTo local_306;
                                TDataObjectPtr<FMonsterBaseConfig> local_330 = local_306.opCall();
                                if (local_330)
                                {
                                    local_137 = local_330.opArrow().MonsterStrength;
                                    local_211 = local_137;
                                }
                            }
                        }
                    }
                    if (local_211 < 0)
                    {
                        continue;
                    }
                    local_13 = false;
                    local_331 = local_13;
                    if (local_135 || ((PlayerBGMInfo.TraceBGMStartTime.opCmp(0.0) < 0)))
                    {
                        if (!((PlayerBGMInfo.CombatBGMEntity == local_204.GetEntity())))
                        {
                            local_331 = (local_136 < local_211);
                        }
                        else
                        {
                            local_331 = (local_136 <= local_211);
                        }
                    }
                    else
                    {
                        local_13 = !((PlayerBGMInfo.CombatBGMEntity == local_204.GetEntity()));
                        if (local_13)
                        {
                            local_331 = (local_136 <= local_211);
                        }
                        else
                        {
                            if (local_136 < local_211)
                            {
                                local_331 = true;
                            }
                        }
                    }
                    if (local_331)
                    {
                        local_136 = local_211;
                        local_120 = local_210.CombatBGMStateRef;
                        if (!(local_120.IsNull()))
                        {
                            local_13 = false;
                        }
                        else
                        {
                            local_13 = local_38;
                        }
                        if (local_13)
                        {
                            TConstRawPtr<FDefaultCombatBGMConfig> local_334 = local_38.opArrow().DefaultCombatBGM.Find(local_211);
                            if (local_334)
                            {
                                local_120 = local_334.opArrow().DefaultCombatBGMStateRef;
                            }
                        }
                        local_130 = local_210.CombatBGMEventRef;
                        if (!(local_130.IsNull()))
                        {
                            local_13 = false;
                        }
                        else
                        {
                            local_13 = local_38;
                        }
                        if (local_13)
                        {
                            TConstRawPtr<FDefaultCombatBGMConfig> local_336 = local_38.opArrow().DefaultCombatBGM.Find(local_211);
                            if (local_336)
                            {
                                local_130 = local_336.opArrow().DefaultCombatBGMEventRef;
                            }
                        }
                        local_134 = local_204.GetEntity();
                    }
                }
                else
                {
                    if (local_38 && (local_136 < 0))
                    {
                        for (auto& local_354 : local_38.opArrow().DefaultCombatBGM)
                        {
                            local_354;
                            local_136 = 0;
                            local_134 = local_204.GetEntity();
                            break;
                        }
                    }
                }
            }
        }
        if (local_134)
        {
            local_183 = (PlayerBGMInfo.CombatBGMEntity == local_134);
            if (local_183 && local_135)
            {
                PlayerBGMInfo.TraceBGMStartTime = -1;
            }
            else
            {
                if (!((PlayerBGMInfo.CombatBGMEntity == local_134)))
                {
                    PlayerBGMInfo.CombatBGMEntity = local_134;
                    PlayerBGMInfo.TraceBGMStartTime = -1;
                }
            }
        }
        local_183 = PlayerBGMInfo.CombatBGMEntity && ((local_134 == ENTITY_NULL) || (PlayerBGMInfo.CombatBGMEntity == local_134));
        if (local_183)
        {
            Get local_220;
            int local_211;
            Get local_208;
            if ((PlayerBGMInfo.TraceBGMStartTime == -1.0))
            {
                FC_EcologyFlockBehaviorComponent local_370;
                GetDefaulted local_360;
                FECSEntity local_226 = FECSEntity(local_360.opCall().FlockProxyEntity);
                local_13 = local_370 && ((int(local_370.MainState) == 2));
                if (local_13)
                {
                    local_134 = PlayerBGMInfo.CombatBGMEntity;
                    PlayerBGMInfo.TraceBGMStartTime = ECS::GetContextTime();
                }
                else
                {
                    PlayerBGMInfo.CombatBGMEntity = ENTITY_NULL;
                }
            }
            if (PlayerBGMInfo.TraceBGMStartTime.opCmp(0.0) >= 0)
            {
                float32 local_373;
                local_373 = 60.0f;
                local_211 = 0;
                FECSEntity local_226_2 = PlayerBGMInfo.CombatBGMEntity;
                if (local_220.opCall())
                {
                    CastTo local_378;
                    if (local_378.opCall())
                    {
                        local_211 = local_137;
                    }
                }
                const FC_MonsterBGMConfig& local_210_2 = local_208.opCall();
                if (local_210_2)
                {
                    if (local_210_2.bOverrideTraceBGMDuration)
                    {
                        local_373 = local_210_2.TraceBGMDuration;
                    }
                    else
                    {
                        if (local_38)
                        {
                            TConstRawPtr<FDefaultCombatBGMConfig> local_334_2 = local_38.opArrow().DefaultCombatBGM.Find(local_211);
                            if (local_334_2)
                            {
                                local_373 = local_334_2.opArrow().DefaultTraceBGMDuration;
                            }
                        }
                    }
                }
                FFPTime local_382 = (PlayerBGMInfo.TraceBGMStartTime + FFPTime(local_373));
                if (local_382.opCmp(ECS::GetContextTime()) >= 0)
                {
                    const FC_MonsterBGMConfig& local_210_3 = local_208.opCall();
                    if (local_210_3)
                    {
                        local_120 = local_210_3.TraceBGMStateRef;
                        if (!(local_120.IsNull()))
                        {
                            local_13 = false;
                        }
                        else
                        {
                            local_13 = local_38;
                        }
                        if (local_13)
                        {
                            TConstRawPtr<FDefaultCombatBGMConfig> local_336_2 = local_38.opArrow().DefaultCombatBGM.Find(local_211);
                            if (local_336_2)
                            {
                                local_120 = local_336_2.opArrow().DefaultTraceBGMStateRef;
                            }
                        }
                        local_130 = local_210_3.TraceBGMEventRef;
                        if (!(local_130.IsNull()))
                        {
                            local_13 = false;
                        }
                        else
                        {
                            local_13 = local_38;
                        }
                        if (local_13)
                        {
                            TConstRawPtr<FDefaultCombatBGMConfig> local_334_3 = local_38.opArrow().DefaultCombatBGM.Find(local_211);
                            if (local_334_3)
                            {
                                local_130 = local_334_3.opArrow().DefaultTraceBGMEventRef;
                            }
                        }
                    }
                    if (!(local_120.IsNull()) || !(local_130.IsNull()))
                    {
                        local_134 = PlayerBGMInfo.CombatBGMEntity;
                    }
                }
                else
                {
                    PlayerBGMInfo.TraceBGMStartTime = -1;
                    PlayerBGMInfo.CombatBGMEntity = ENTITY_NULL;
                    local_134 = ENTITY_NULL;
                }
            }
        }
        Has local_386;
        local_13 = local_386.opCall();
        if (local_13)
        {
            local_183 = true;
        }
        else
        {
            Has local_390;
            local_183 = local_390.opCall();
        }
        if (local_183)
        {
            local_134 = ENTITY_NULL;
            PlayerBGMInfo.TraceBGMStartTime = -1;
            PlayerBGMInfo.CombatBGMEntity = ENTITY_NULL;
        }
        if (local_134)
        {
            TSoftObjectPtr<UAkStateValue> local_400;
            local_400 = PlayerBGMInfo.CurrentBGMStateRef;
            local_13 = !((local_400 == local_120));
            if (local_13 && !(local_120.IsNull()))
            {
                PlayerBGMInfo.CurrentBGMStateRef = local_120;
                PlayerBGMInfo.CurrentBGMEventRef = local_130;
                local_428.SetState(local_120);
                local_428.SetEvent(local_130);
                if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
                {
                    Print(FString().Append("[Job_UpdateCombatBGM] Combat BGM Start, Monster(").Append(local_134.ToString()).Append(") Add State(").Append(local_120.GetAssetName()).Append(") to FC_PlayerBGMState, BestBGMEventRef").Append(local_130.GetAssetName()), 99999.0f, FLinearColor::LucBlue);
                }
                XLog(ELog(1), FString().Append("Combat BGM Start ! BGMState:  ").Append(local_120.ToString()));
            }
        }
        else
        {
            TSoftObjectPtr<UAkStateValue> local_458 = ::FGameAudioSettings::Get().NonCombatBGMState;
            bool local_355 = local_38 && !(local_38.opArrow().LoadMapAudioSet.State.IsNull());
            if (local_355)
            {
                local_458 = local_38.opArrow().LoadMapAudioSet.State;
            }
            if (!(!(local_458.IsNull())))
            {
                local_355 = false;
            }
            else
            {
                TSoftObjectPtr<UAkStateValue> local_400;
                local_355 = !((PlayerBGMInfo.CurrentBGMStateRef == local_458));
            }
            if (local_355)
            {
                PlayerBGMInfo.CurrentBGMStateRef = local_458;
                local_428.SetState(local_458);
                if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
                {
                    Print(FString().Append("[Job_UpdateCombatBGM] Fallback BGM Start, Entity(").Append(local_4.ToString()).Append(") Add State(").Append(local_458.GetAssetName()).Append(") to FC_PlayerBGMState}"), 99999.0f, FLinearColor::LucBlue);
                }
                XLog(ELog(1), FString().Append("Fallback BGM Start ! BGMState: ").Append(local_458.ToString()));
            }
        }
        return;
    }
    void ResetPlayerBGMInfo(const FECSEntity &inout PawnEntity) const
    {
        Get local_4;
        if (local_4.opCall())
        {
            Modify local_12;
            FC_PlayerBGMInfo& local_14 = local_12.opCall();
            if (local_14)
            {
                local_14.TraceBGMStartTime = -1;
                local_14.CombatBGMEntity = ENTITY_NULL;
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleTeleportCompleted(const FCE_TeleportCompleted &inout Event) const
    {
        this.ResetPlayerBGMInfo(Event.Sender);
        return;
    }
    UFUNCTION()
    void Monitor_HandleAudioBGMState(const FECSEntity &inout Entity, const FC_PlayerBgmToPending &inout PlayerCurrentBGMState) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            FString local_14;
            if (!(PlayerCurrentBGMState.GetState().IsNull()))
            {
                local_14 = Entity.ToString();
                XLog(ELog(1), FString().Append("Monitor_HandleAudioBGMState return. Entity:").Append(local_14).Append(", PlayerBGM State:").Append(PlayerCurrentBGMState.GetState().ToString()));
            }
            if (!(IsNull()))
            {
                local_14.ToString();
                XLog(ELog(1), FString().Append("Monitor_HandleAudioBGMState return. Entity:").Append(Entity.ToString()).Append(", PlayerBGM Event:").Append(local_14));
            }
            return;
        }
        if (!(PlayerCurrentBGMState.GetState().IsNull()))
        {
            FString local_14;
            if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
            {
                Print(FString().Append("Job_HandleAudioBGMState :Entity:").Append(Entity.ToString()).Append(", State ").Append(PlayerCurrentBGMState.GetState().GetAssetName()), 99999.0f, FLinearColor::Yellow);
            }
            FString local_10;
            local_10 = Entity.ToString();
            local_14 = FString();
            XLog(ELog(1), local_14.Append("Job_HandleAudioBGMState :Entity:").Append(local_10).Append(", State ").Append(PlayerCurrentBGMState.GetState().GetAssetName()));
            FGameAudioUtils::SetAudioState(PlayerCurrentBGMState.GetState(), FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
        }
        if (!(IsNull()))
        {
            FString local_14;
            FString local_10;
            if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
            {
                local_10.GetAssetName();
                local_14 = Entity.ToString();
                Print(FString().Append("Job_HandleAudioBGMState :Entity:").Append(local_14).Append(", Event ").Append(local_10), 99999.0f, FLinearColor::Yellow);
            }
            local_14.GetAssetName();
            XLog(ELog(1), local_10.Append("Job_HandleAudioBGMState :Entity:").Append(Entity.ToString()).Append(", Event ").Append(local_14));
            FGameAudioUtils::GetCachedAudioWorld();
            FLoadEventCallback local_30 = FLoadEventCallback();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleAudioInput(const FCE_ClientToServerAudioInput &inout Event) const
    {
        int local_2 = 0;
        if (!(local_2.IsValid()) == !(false))
        {
            return;
        }
        int local_5 = 1195593728;
        Get local_10;
        FECSRuntimeQuery local_52 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(local_2, local_10.opCall().GetPosition(), 50000.0f, EECSQueryRegsitryType(3), false);
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        int local_101 = 0;
        FECSRuntimeQueryIterator local_124 = local_52.Iterator();
        for (; local_124.CanProceed;)
        {
            const FECSEntity& local_148 = local_124.Proceed();
            if ((local_148 == local_2))
            {
                continue;
            }
            if (!(::FASCommonUtils::GetUniquePlayerEntity(local_148).IsValid()))
            {
                continue;
            }
            ++local_101;
        }
        if (local_101 <= 0)
        {
            return;
        }
        FFPTime local_162 = FFPTime(-1);
        FCE_ServerToClientAudioPlayEvent local_164;
        local_164.AudioEventName = Event.AudioEventName;
        local_164.SwitchName = Event.SwitchName;
        local_164.bIsStop = Event.bIsStop;
        if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
        {
            Print(FString().Append("[ServerJob_HandleAudioInput] Caster(").Append(local_2).Append("), ListenerCount(").Append(local_101).Append("), SendAudioInput Event(").Append(Event.AudioEventName).Append("), SwitchName(").Append(Event.SwitchName).Append("), bIsStop(").Append(Event.bIsStop).Append("), HearingRange").Append(1195593728), 99999.0f, FLinearColor::LucBlue);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleServerToClientAudioPlay(const FCE_ServerToClientAudioPlayEvent &inout Event) const
    {
        if (!(Event.Sender.IsValid()) == !(false))
        {
            return;
        }
        FECSEntity local_6 = FECSEntity(Event.Sender);
        FECSEntity local_14 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (local_14.IsValid() && (local_6 == local_14))
        {
            if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
            {
                Print(FString().Append("ClientJob_HandleServerToClientAudioPlay skip local sender: ").Append(local_6).Append(", EventName:").Append(Event.AudioEventName).Append(", SwitchName:").Append(Event.SwitchName).Append(", bIsStop:").Append(Event.bIsStop), 5.0f, FLinearColor::LucBlue);
            }
            return;
        }
        if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
        {
            Print(FString().Append("ClientJob_HandleServerToClientAudioPlay Sender: ").Append(local_6).Append(", EventName:").Append(Event.AudioEventName).Append(", SwitchName:").Append(Event.SwitchName).Append(", bIsStop:").Append(Event.bIsStop), 5.0f, FLinearColor::LucBlue);
        }
        if (!(Event.SwitchName.IsNone()))
        {
            FGameAudioUtils::SetAudioSwitch(Event.SwitchName, local_6, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
        }
        if (!(Event.AudioEventName.IsNone()))
        {
            FGameAudioUtils::PlayEventOnEmitter(Event.AudioEventName, local_6, FLoadEventCallback(), EGameAudioEmitterPartType(0), true, false, false, FGameAudioUtils::GetCachedAudioWorld(), true);
        }
        return;
    }
    FECSEntity ResolveLevelAudioRequestEntity(const FECSEntity &inout Sender) const
    {
        FECSEntity local_10 = ::FASCommonUtils::GetPlayerPawnOrMountEntity(Sender, false);
        if (local_10.IsValid())
        {
            return local_10;
        }
        return Sender;
    }
    UFUNCTION()
    void ClientJob_HandleLevelClientAudioPlayRequest(const FCE_LevelClientAudioPlayRequest &inout Event) const
    {
        if (!(Event.Sender.IsValid()) || Event.AudioEventName.IsNone())
        {
            return;
        }
        FECSEntity local_10 = this.ResolveLevelAudioRequestEntity(Event.Sender);
        if (!(local_10.IsValid()))
        {
            return;
        }
        ::FAsGameAudioUtils::PlayAudioEventByName(local_10, Event.AudioEventName, Event.SourceType, Event.bFollow, Event.PartType, Event.Socket, Event.LocationOffset, Event.RotationOffset, Event.bLocalSpace, Event.bIsLoop, Event.bLoopEnd);
        return;
    }
    UFUNCTION()
    void ClientJob_HandleLevelServerToClientAudioPlayRequest(const FCE_LevelServerToClientAudioPlayRequest &inout Event) const
    {
        if (!(Event.Sender.IsValid()) || Event.AudioEventName.IsNone())
        {
            return;
        }
        FECSEntity local_10 = this.ResolveLevelAudioRequestEntity(Event.Sender);
        if (!(local_10.IsValid()))
        {
            return;
        }
        ::FAsGameAudioUtils::PlayAudioEventByName(local_10, Event.AudioEventName, Event.SourceType, Event.bFollow, Event.PartType, Event.Socket, Event.LocationOffset, Event.RotationOffset, Event.bLocalSpace, Event.bIsLoop, Event.bLoopEnd);
        return;
    }
    UFUNCTION()
    void ClientJob_HandleTimeOfDayChanged(const FCE_TimeOfDayChangeEvent &inout Event) const
    {
        ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (CVar_AudioTimeOfDayEnable.GetBool())
        {
            FECSEntity local_8;
            Print(FString().Append("ClientJob_HandleTimeOfDayChanged, ").Append(local_8).Append(", EventName:").Append(Event.IntegerTime), 5.0f, FLinearColor::LucBlue);
        }
        FGameAudioUtils::SetAudioRtpc(this.GlobalTimeRtpc, ENTITY_NULL, Event.IntegerTime, 0, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
        return;
    }
    UFUNCTION()
    void Monitor_ClientTimeOfDayAssign(const FCS_TimeOfDay &inout TimeOfDay) const
    {
        FName local_2(TimeOfDay.GetTODStageName());
        if (local_2.IsNone())
        {
            return;
        }
        FECSEntity local_14 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
        {
            Print(FString().Append("ClientJob_InitTimeOfDay, ").Append(local_14).Append(", TODStageName:").Append(local_2), 600.0f, FLinearColor::Yellow);
        }
        ::FAsGameAudioUtils::PlayTimeOfDayStageAudio(local_14, local_2, this.TimeOfDayStageAudioTable);
        return;
    }
    UFUNCTION()
    void ClientJob_OnTODStageChanged(const FCE_TODStageUpdated &inout Event) const
    {
        if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
        {
            Print(FString().Append("ClientJob_OnTODStageChanged, PrevStageName:").Append(Event.PrevStageName).Append(", NewStageName:").Append(Event.NewStageName), 600.0f, FLinearColor::Yellow);
        }
        ::FAsGameAudioUtils::PlayTimeOfDayStageAudio(::FASCommonUtils::GetLocalPlayerPawnEntity(), Event.NewStageName, this.TimeOfDayStageAudioTable);
        return;
    }
    UFUNCTION()
    void Monitor_OnCharacterAssign(const FECSEntity &inout Entity, const FC_CharacterAudioConfig &inout CharacterAudioConfig) const
    {
        if (!(CharacterAudioConfig.DefaultSwitchValue.IsNull()) == !(false))
        {
            FGameAudioUtils::SetAudioSwitch(CharacterAudioConfig.DefaultSwitchValue, Entity, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
        }
        USFXSettings local_12 = ::UCombatGlobalSettings::Get().SFXSettings;
        if (local_12 != nullptr)
        {
            EPrefabSize local_13;
            EPrefabSize local_14 = EPrefabSize(0);
            local_13 = local_14;
            if (::GetPrefabConfigPtr(Entity))
            {
                local_13 = local_14;
            }
            FGameAudioUtils::SetAudioSwitch(local_12.BodySizeSwitch[int(local_13)], Entity, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
            bool local_2 = (Entity == ::FASCommonUtils::GetLocalPlayerPawnEntity());
            FGameAudioUtils::GetCachedAudioWorld();
            FOnLoadEventCallbackWithEntity local_8 = FOnLoadEventCallbackWithEntity();
            int local_63 = local_2 ? 1 : 3;
            FGameAudioUtils::SetAudioRtpc(local_12.PerspectiveRtpc, Entity, local_63);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_GameAudioSystemOnEnterDS() const
    {
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        this.ClientJob_GameAudioSystemOnEnterDS();
        return;
    }
    UFUNCTION()
    void Run_Job_PreloadRegionAudioTable() const
    {
        ECS::GetContextJob();
        this.Job_PreloadRegionAudioTable();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_FlushPendingAudioSyncInputs() const
    {
        ECS::GetContextJob();
        this.ClientJob_FlushPendingAudioSyncInputs();
        return;
    }
    UFUNCTION()
    void Run_Job_AddMapAudioDataToPendingList() const
    {
        ECS::GetContextJob();
        this.Job_AddMapAudioDataToPendingList();
        return;
    }
    UFUNCTION()
    void Run_Job_CollectHandleMapAudioBGM() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.Job_CollectHandleMapAudioBGM(local_12);
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRegionEntry() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorRegionEntryOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRegionEntry(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorRegionEntryOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnRegionEntry(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRegionExit() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorRegionExitOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRegionExit(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorRegionExitOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnRegionExit(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleWeatherChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClientPlayerWeatherChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClientPlayerWeatherChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleWeatherChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateCombatBGM() const
    {
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        int local_10 = 0;
        int local_9 = local_10;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdateCombatBGM(local_40, local_42);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_7 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateCombatBGM(local_174, local_42);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_7);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleTeleportCompleted() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TeleportCompleted> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TeleportCompleted& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleTeleportCompleted(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_HandleAudioBGMState() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPlayerBgmToPendingOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_HandleAudioBGMState(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorPlayerBgmToPendingOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_HandleAudioBGMState(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleAudioInput() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClientToServerAudioInput> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClientToServerAudioInput& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleAudioInput(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleServerToClientAudioPlay() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ServerToClientAudioPlayEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ServerToClientAudioPlayEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleServerToClientAudioPlay(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleLevelClientAudioPlayRequest() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_LevelClientAudioPlayRequest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_LevelClientAudioPlayRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleLevelClientAudioPlayRequest(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleLevelServerToClientAudioPlayRequest() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_LevelServerToClientAudioPlayRequest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_LevelServerToClientAudioPlayRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleLevelServerToClientAudioPlayRequest(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleTimeOfDayChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TimeOfDayChangeEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TimeOfDayChangeEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleTimeOfDayChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientTimeOfDayAssign() const
    {
        int local_24 = 0;
        ECS::GetContextJob();
        if (ECSInternal::GetMonitorSingletonOnAssign(this.GetECSWorld(), FCS_TimeOfDay, EECSRegType(0), false, true).bIsMonitored)
        {
            this.Monitor_ClientTimeOfDayAssign(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_OnTODStageChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TODStageUpdated> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TODStageUpdated& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_OnTODStageChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnCharacterAssign() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCharacterAudioConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnCharacterAssign(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorCharacterAudioConfigOnActiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnCharacterAssign(local_46, local_52);
        }
        return;
    }
}

