
enum EPrepareGameState
{
    Init,
    WaitingForDSForkBegin,
    WaitingForDSForkFinish,
    WaitingForInitGlobalDsInfo,
    WaitingForInitDataLayer,
    ReadyToStartECSGame,
}


// NOTE: class defaults are not authored in this module: AKLGameModeMP (default scalar field AECSGameModeBase.bIsReadyToStartECSGame has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class AKLGameModeMP : AECSGameModeMPBase
{
    float32 CheckReadyToStartECSGameInterval = 0.1f;
    float32 PreECSStartDSHeartBeatInterval = 10.0f;
    int64 LastSendDSHeartBeatTime = 0;
    bool bSkipDSGlobalInfo = false;
    EPrepareGameState PrepareGameState = EPrepareGameState(0);


    UFUNCTION()
    bool CheckPlayerToken_Implementation(const APlayerController NewPlayer, const int UID, const int PlayerToken) const
    {
        FAngelscriptGameThreadScopeWorldContext local_2 = FAngelscriptGameThreadScopeWorldContext(NewPlayer.GetWorld());
        UGameDSConnectionSubsystem local_6 = ::UGameDSConnectionSubsystem::Get();
        if (local_6 != nullptr)
        {
            if (local_6.GetNumPlayerTokens() > 0)
            {
                int local_12 = 0;
                bool local_9 = local_6.GetPlayerTokenByUID(UID, local_12);
                if ((!(local_9) || (local_12 != PlayerToken)))
                {
                    XLog(ELog(33), FString().Append("CheckPlayerToken Failed, UID: ").Append(UID).Append(", PlayerToken: ").Append(PlayerToken).Append(", SavingToken: ").Append(local_12));
                    return false;
                }
            }
        }
        return true;
    }
    UFUNCTION()
    void PlayerPostLogin_Implementation(const AECSPlayerController NewPlayer, const int UID, const int EntityID)
    {
        bool local_13;
        int local_38 = 0;
        int local_80 = 0;
        APlayerState local_86;
        UGameDSConnectionSubsystem local_4 = ::UGameDSConnectionSubsystem::Get();
        local_4.PlayerPostLogin(NewPlayer, UID, EntityID);
        FECSEntity local_8 = FECSEntity(NewPlayer.GetPlayerEntity());
        if (local_8.IsValid())
        {
            Has local_18;
            if (local_18.opCall())
            {
                local_13 = true;
            }
            else
            {
                Has local_22;
                local_13 = local_22.opCall();
            }
            FC_PlayerPendingLogin local_30;
            Assign local_28;
            local_28.opCall(local_30).bIsReconnect = local_13;
            FPbDsPlayerInfo local_48 = local_4.GetPlayerInfo(UID);
            local_38.SetCurLevel(local_48.GetBasicCompInfo().GetPlayerLevel());
            if (::FGameModeUtils::ShouldDisableStigmata())
            {
                ::StigmataUtils::SetEffectiveHealItemMax(local_8, ::StigmataUtils::GetDefaultHealItemMax());
            }
            else
            {
                TArray<uint> local_74;
                local_48.GetBasicCompInfo().GetUnlockedStigmataList(local_74);
                ::StigmataUtils::ApplyHealItemMaxToEntity(local_8, local_74);
            }
            local_86 = NewPlayer.PlayerState;
            if (local_86 != nullptr && local_80.GetNickName().IsEmpty())
            {
                local_80.SetNickName(NewPlayer.PlayerState.GetPlayerName());
            }
        }
        return;
    }
    UFUNCTION()
    void PlayerLogout_Implementation(const AECSPlayerController LogoutPlayer, const int EntityID)
    {
        if (FECSEntity(LogoutPlayer.GetPlayerEntity()).IsValid())
        {
            FC_PlayerPendingLogoutTag local_16;
            Assign local_14;
            local_14.opCall(local_16);
        }
        return;
    }
    UFUNCTION()
    void OnPlayerControllerEntityCreated_Implementation(const FECSEntity &inout PlayerEntity)
    {
        int local_6 = 0;
        UGameDSConnectionSubsystem local_10 = ::UGameDSConnectionSubsystem::Get();
        if (local_10 != nullptr)
        {
            local_10.NotifyPlayerEntityCreated(PlayerEntity.GetIdValue(), local_6.GetPlayerId());
            local_10.OnPlayerEntityEnterDS(PlayerEntity);
        }
        return;
    }
    UFUNCTION()
    bool IsConnectedToGameServer_Implementation() const
    {
        UGameDSConnectionSubsystem local_4 = ::UGameDSConnectionSubsystem::Get();
        return local_4 != nullptr && local_4.IsConnectedToGameServer();
    }
    UFUNCTION()
    void BeginWaitingForDSFork()
    {
        XLog(ELog(33), FString().Append("BeginWaitingForDSFork"));
        this.PrepareGameState = EPrepareGameState(1);
        System::SetTimer(this, n"CheckReadyToStartECSGame", this.CheckReadyToStartECSGameInterval, true, false, 0.0f, 0.0f);
        US_GameDSMessageSystem local_20 = Cast<US_GameDSMessageSystem>(AECSGameManagerActor::GetSystem(this.GetWorld(), US_GameDSMessageSystem));
        if (local_20 != nullptr)
        {
            this.PreECSStartDSHeartBeatInterval = local_20.HeartBeatInterval;
        }
        return;
    }
    void CheckPreECSStartDSHeartBeat()
    {
        int64 local_4 = FDateTime::UtcNow().ToUnixTimestamp();
        if ((this.LastSendDSHeartBeatTime == 0 || (((local_4 - this.LastSendDSHeartBeatTime) >= this.PreECSStartDSHeartBeatInterval))))
        {
            this.LastSendDSHeartBeatTime = local_4;
            this.PreECSStartDSHeartBeat();
        }
        return;
    }
    UFUNCTION()
    void PreECSStartDSHeartBeat()
    {
        UGameDSConnectionSubsystem local_4 = ::UGameDSConnectionSubsystem::Get();
        if (local_4 != nullptr)
        {
            XLog(ELog(33), FString().Append("PreECSStartDSHeartBeat"));
            local_4.DSHeartBeat();
        }
        return;
    }
    void OnDSFinishFork()
    {
        int local_22 = 0;
        XLog(ELog(33), FString().Append("OnDSFinishFork"));
        AECSWorldSettingsBase local_14 = (Cast<AAS_ECSWorldSettings>(this.GetWorld().GetWorldSettings()));
        if (local_14 != nullptr)
        {
            local_14.InitLevelInfo();
            UGameDSConnectionSubsystem local_20 = ::UGameDSConnectionSubsystem::Get();
            if (local_20 != nullptr)
            {
                local_20.DSRegisterLevelKey = int(local_14.LevelKey);
                if (local_14.LevelInfoConfig)
                {
                    local_20.DSRegisterLevelType = local_22;
                }
            }
            WorldUtils::AddWorldURLOption(this.GetWorld(), FString().Append("level_key=").Append(local_14.LevelKey));
        }
        return;
    }
    UFUNCTION()
    void BeginInitDataLayer()
    {
        ULevelActorManager local_4 = ULevelActorManager::Get();
        if (local_4 != nullptr)
        {
            const TArray<UKLDataLayerInstance>& local_8 = local_4.GetLBPDataLayerInstances();
            if (local_8.Num() > 0)
            {
                ::FLevelDataLayerUtils::OverrideInitialDataLayers(this.GetWorld(), local_8);
            }
            local_4.SetIsLoadingInitialDataLayers(true);
        }
        return;
    }
    UFUNCTION()
    void CheckReadyToStartECSGame()
    {
        UGameDSConnectionSubsystem local_4 = ::UGameDSConnectionSubsystem::Get();
        local_4.TickGameConnection(this.CheckReadyToStartECSGameInterval);
        if (int(this.PrepareGameState) > 2)
        {
            this.CheckPreECSStartDSHeartBeat();
        }
        switch (int(this.PrepareGameState))
        {
        case 1:
        {
            if (!(::FLevelDataLayerUtils::IsWaitingForStreaming(this.GetWorld(), false)))
            {
                local_4.NotifyReadyForFork();
                this.PrepareGameState = EPrepareGameState(2);
                XLog(ELog(33), FString().Append("CheckReadyToStartECSGame WaitingForDSFork -> WaitingForDSForkFinish"));
            }
            break;
        }
        case 2:
        {
            if (local_4.IsForkFinished())
            {
                this.OnDSFinishFork();
                FParse::Bool(FCommandLine::Get(), "-SkipDSGlobalInfo=", this.bSkipDSGlobalInfo);
                if (this.bSkipDSGlobalInfo)
                {
                    this.BeginInitDataLayer();
                    this.PrepareGameState = EPrepareGameState(4);
                    XLog(ELog(33), FString().Append("CheckReadyToStartECSGame WaitingForDSForkFinish -> WaitingForInitDataLayer (SkipDSGlobalInfo)"));
                }
                else
                {
                    this.PrepareGameState = EPrepareGameState(3);
                    XLog(ELog(33), FString().Append("CheckReadyToStartECSGame WaitingForDSForkFinish -> WaitingForInitGlobalDsInfo"));
                }
            }
            break;
        }
        case 3:
        {
            local_4.CheckDSRegister(int(local_4.DSRegisterLevelKey), int(local_4.DSRegisterLevelType));
            if (local_4.IsDSGlobalInfoInited())
            {
                this.BeginInitDataLayer();
                this.PrepareGameState = EPrepareGameState(4);
                XLog(ELog(33), FString().Append("CheckReadyToStartECSGame WaitingForInitGlobalDsInfo -> WaitingForInitDataLayer"));
            }
            break;
        }
        case 4:
        {
            if (!(::FLevelDataLayerUtils::IsWaitingForStreaming(this.GetWorld(), false)))
            {
                XLog(ELog(33), FString().Append("CheckReadyToStartECSGame WaitingForInitDataLayer -> ReadyToStartECSGame"));
                this.PrepareGameState = EPrepareGameState(5);
            }
            break;
        }
        }
        if (int(this.PrepareGameState) == 5)
        {
            ULevelActorManager local_26 = ULevelActorManager::Get();
            if (local_26 != nullptr)
            {
                local_26.SetIsLoadingInitialDataLayers(false);
            }
            System::ClearTimer(this, "CheckReadyToStartECSGame");
            this.bIsReadyToStartECSGame = true;
            local_4.FlushPendingDSGlobalInfoRsp();
            XLog(ELog(33), FString().Append("CheckReadyToStartECSGame Start ECS Game"));
        }
        return;
    }
}

