

UCLASS(Abstract)
class UPVPGameModeFlowBase : UGameModeFlow
{
    FName BrawlPrepStartLevelEventName = n"PVP_BRAWL_PREP_START";
    FName BrawlPrepEndLevelEventName = n"PVP_BRAWL_PREP_END";

    UPVPGameModeFlowBase()
    {
        super();
        return;
    }
    void OnInitInternal(const FCS_GameModeProfile &inout Profile) const
    {
        int local_8 = 0;
        int local_62 = 0;
        Super::OnInitInternal(Profile);
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        local_8.SetGameModeType(EGameModeType(2));
        local_8.SetbPVPGame(true);
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        FGameModeFlowSettings local_110 = Super::GetFlowSettings(Profile);
        int local_112 = int(local_110.EntryMode);
        Super::InitMatchDataForEntryMode(Profile);
        FPVPGameModeFlowSettings local_256 = this.GetPVPFlowSettings();
        if (int(local_256.GameRuleType) != 0)
        {
            local_62.SetSelectedGameRuleType(local_256.GameRuleType);
        }
        return;
    }
    void OnTickFinishing(const FCS_GameModeProfile &inout Profile) const
    {
        this.ReviveAllDeadPlayersAndBots();
        Super::OnTickFinishing(Profile);
        return;
    }
    void OnHandleReviveTeleport(const FCS_GameModeProfile &inout Profile, FCE_Event_ReviveTeleport &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        if (this.TryReviveTeleportToTeamSpawn(Event.Sender))
        {
            return;
        }
        Super::DoReviveTeleport(Event);
        return;
    }
    void KickPlayersOnFinish(const FCS_GameModeProfile &inout Profile) const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        bool local_9 = false;
        for (auto& local_28 : local_8.GetPlayerExtras())
        {
            local_28;
            if (GetbWantsBackToRoom())
            {
                local_9 = true;
                break;
            }
        }
        FECSRuntimeView local_66 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_70;
        local_70.opCall();
        FECSRuntimeViewIterator local_104 = local_66.Iterator();
        Get local_144;
        for (; local_104.CanProceed;)
        {
            const FECSEntity& local_140 = local_104.Proceed();
            if ((local_144.opCall().GetUEPlayerController() == nullptr))
            {
                continue;
            }
            if (local_9)
            {
                int local_148 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_140);
                if (local_8.GetPlayerExtras().Contains(local_148) && local_8.GetPlayerExtras()[local_148].GetbWantsBackToRoom())
                {
                    continue;
                }
            }
            ::FGameConnectionUtils::UICallBackToCityLevel(local_140);
        }
        if (local_9)
        {
            this.TryTransitionToPreparingIfAllReturned();
        }
        return;
    }
    FPVPGameModeFlowSettings GetPVPFlowSettings() const
    {
        FPVPGameModeFlowSettings __r;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        return __r;
    }
    int ResolveBrawlLimit(const FPVPGameModeFlowSettings &inout Settings, const int PlayerCount) const
    {
        int local_2 = FMath::RoundToInt(Settings.TDMKillTargetByPlayerCount.GetFloatValue(FMath::Max(PlayerCount, 0), 0.0f));
        if (local_2 > 0)
        {
            return local_2;
        }
        if (int(Settings.TDMKillScoreLimit) > 0)
        {
            return int(Settings.TDMKillScoreLimit);
        }
        return 30;
    }
    bool TryReviveTeleportToTeamSpawn(const FECSEntity &inout TeleportEntity) const
    {
        int local_21;
        int local_42 = 0;
        Has local_6;
        if (!(TeleportEntity.IsValid()) || !(local_6.opCall()))
        {
            return false;
        }
        Get local_16;
        FECSEntity local_12 = local_16.opCall().GetPlayerEntity();
        Has local_20;
        if (!(local_12.IsValid()) || !(local_20.opCall()))
        {
            return false;
        }
        Get local_26;
        local_21 = local_26.opCall().GetTeam();
        int local_28 = local_21;
        if (local_28 == 0)
        {
            return false;
        }
        FECSWorldPtr local_32 = ECS::GetECSWorld();
        Has local_36;
        if (!(local_36.opCall()))
        {
            return false;
        }
        FECSWorldPtr local_32_2 = ECS::GetECSWorld();
        this.TeleportPawnToTeamSpawn(TeleportEntity, local_12, uint8(local_21), local_42);
        return true;
    }
    void TryInitNewPlayers() const
    {
        int local_8 = 0;
        int local_14 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        FECSRuntimeView local_52 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_56;
        local_56.opCall();
        Exclude(local_52).opCall();
        FECSRuntimeViewIterator local_94 = local_52.Iterator();
        for (; local_94.CanProceed;)
        {
            const FECSEntity& local_132 = local_94.Proceed();
            FC_PlayerStates local_142;
            Assign local_136;
            local_136.opCall(local_142);
            int local_144 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_132);
            local_14.AddNewPlayer(local_144, local_8);
            int local_143 = local_14.GetMatchRoomID();
            if (local_143 == 0)
            {
                UGameDSConnectionSubsystem local_148 = ::UGameDSConnectionSubsystem::Get();
                if (local_148 != nullptr)
                {
                    int local_151 = 0;
                    if (local_148.GetPlayerTokenByUID(local_144, local_151) && (local_151 > 0))
                    {
                        local_14.SetMatchRoomID(local_151);
                    }
                }
            }
        }
        return;
    }
    void CleanupDisconnectedPlayers() const
    {
        int local_8 = 0;
        int local_14 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        TSet<uint> local_34;
        FECSRuntimeView local_72 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_76;
        local_76.opCall();
        FECSRuntimeViewIterator local_110 = local_72.Iterator();
        for (; local_110.CanProceed;)
        {
            int local_150 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_110.Proceed());
            if (local_150 > 0)
            {
                local_34.Add(local_150);
            }
        }
        TArray<uint> local_154;
        for (auto& local_172 : local_8.GetPlayerMatchDatas())
        {
            if (local_14.GetPlayerExtras().Contains(local_172.GetKey()) && local_14.GetPlayerExtras()[local_172.GetKey()].GetbIsBot())
            {
                continue;
            }
            if (!(local_34.Contains(local_172.GetKey())))
            {
                local_154.Add(local_172.GetKey());
            }
        }
        auto local_180 = local_154.Iterator();
        for (; local_180.CanProceed;)
        {
            local_14.RemovePlayer(local_180.Proceed(), local_8);
        }
        return;
    }
    void TickPreparingShared() const
    {
        int local_10 = 0;
        int local_16 = 0;
        int local_146 = 0;
        int local_178 = 0;
        if (!(this.IsLoadingFinish()))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        FECSWorldPtr local_4_2 = ECS::GetECSWorld();
        this.TryInitNewPlayers();
        this.CleanupDisconnectedPlayers();
        FECSWorldPtr local_4_3 = ECS::GetECSWorld();
        FCS_FixedTime local_22;
        int local_24 = int(local_22.Frame) % ECS::GetECSFixedFrameRate();
        if (local_24 != 0)
        {
            return;
        }
        FECSRuntimeView local_64 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_68;
        local_68.opCall();
        bool local_69 = true;
        bool local_70 = true;
        FECSRuntimeViewIterator local_104 = local_64.Iterator();
        for (; local_104.CanProceed;)
        {
            const FECSEntity& local_140 = local_104.Proceed();
            local_70 = false;
            if (!(local_146.GetbReady()))
            {
                local_69 = false;
                break;
            }
        }
        if (!(local_69) && local_16.GetbHostSayGO())
        {
            local_16.SetbHostSayGO(false);
        }
        if (((local_69 && local_16.GetbHostSayGO()) || local_10.GetbForceGo()) && !(local_70))
        {
            local_10.SetConfirmReadyTime((FFPTime(local_10.GetConfirmReadyTime()) - FFPTime(1)));
            if (!(local_69))
            {
                FECSRuntimeView local_44 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
                local_68.opCall();
                Include local_176;
                local_176.opCall();
                FECSRuntimeViewIterator local_138 = local_44.Iterator();
                for (; local_138.CanProceed;)
                {
                    const FECSEntity& local_140_2 = local_138.Proceed();
                    if (!(local_146.GetbReady()) && !((local_178.GetUEPlayerController() == nullptr)))
                    {
                        ::FGameConnectionUtils::DisconnectPlayer(local_140_2, EDisconnectReason(4));
                    }
                }
            }
        }
        else
        {
            local_10.SetConfirmReadyTime(FFPTime(1));
        }
        if (FFPTime(local_10.GetConfirmReadyTime()).opCmp(0.0) <= 0)
        {
            FECSWorldPtr local_4_4 = ECS::GetECSWorld();
            Has local_192;
            if (!(local_192.opCall()))
            {
                ::FGameModeUtils::InitTeamSpawner(ECS::GetECSWorld());
            }
            FFPTime local_154 = FFPTime(-1);
            FECSWorldPtr local_4_5 = ECS::GetECSWorld();
            SendEvent local_196;
            local_196.opCall(ENTITY_NULL, local_154);
            local_10.SetConfirmReadyTime(FFPTime(0));
            Super::ChangeGameState(EFCS_GameStageType(2));
        }
        return;
    }
    int SpawnAllPlayerAvatars() const
    {
        int local_14 = 0;
        int local_20 = 0;
        int local_146 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        FECSWorldPtr local_2_3 = ECS::GetECSWorld();
        int local_21 = 0;
        FECSRuntimeView local_60 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_64;
        local_64.opCall();
        Include local_68;
        local_68.opCall();
        FECSRuntimeViewIterator local_102 = local_60.Iterator();
        for (; local_102.CanProceed;)
        {
            const FECSEntity& local_140 = local_102.Proceed();
            int local_148 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_140);
            if (!(local_20.GetPlayerMatchDatas().Contains(local_148)))
            {
                continue;
            }
            local_146.SetTeam(uint8((local_20.GetPlayerMatchDatas()[local_148].GetTeamID() + 1)));
            if (local_146.GetAllPlayerPawnEntities().Num() == 0)
            {
                ::FGameModeUtils::SpawnAvatarsForPlayer(local_140, local_146, local_14);
            }
            else
            {
                this.RespawnExistingAvatars(local_140, local_146, local_14);
            }
            FECSEntity local_162 = FECSEntity(local_140.GetId());
            FECSWorldPtr local_2_4 = ECS::GetECSWorld();
            int local_152 = local_146.GetPlayerId();
            int local_152_2 = local_146.GetTeam();
            ++local_21;
            const TArray<FECSEntity>& local_166 = local_146.GetAllPlayerPawnEntities();
            for (auto& local_180 : local_166)
            {
                ::FGameModeUtils::ReplaceInitAttribute(local_180, 1);
            }
        }
        return local_21;
    }
    void RespawnExistingAvatars(const FECSEntity &inout PlayerProxy, FC_PlayerController &inout PlayerController, const FCS_PlayerSpawnerIndex &inout SpawnerIndex) const
    {
        int local_1;
        local_1 = PlayerController.GetTeam();
        for (auto& local_18 : PlayerController.GetAllPlayerPawnEntities())
        {
            if (!(local_18.IsValid()))
            {
                continue;
            }
            Has local_22;
            bool local_15 = local_22.opCall();
            if (local_15)
            {
                local_15 = true;
            }
            else
            {
                Has local_26;
                local_15 = local_26.opCall();
            }
            if (local_15)
            {
                FCE_Reborn local_36;
                ECS::GetContextTime();
                local_36.RebornByEntity = local_18;
                local_36.RebornHPRatio = 1.0f;
                local_36.bRebornWithAnimation = false;
            }
            else
            {
                Super::FullHealPawn(local_18);
            }
            Has local_42;
            local_15 = local_42.opCall();
            if (local_15)
            {
                Remove local_46;
                local_46.opCall();
            }
            this.TeleportPawnToTeamSpawn(local_18, PlayerProxy, uint8(local_1), SpawnerIndex);
        }
        return;
    }
    void TryTransitionToPreparingIfAllReturned() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FECSRuntimeView local_46 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_50;
        local_50.opCall();
        FECSRuntimeViewIterator local_84 = local_46.Iterator();
        Get local_126;
        for (; local_84.CanProceed;)
        {
            const FECSEntity& local_122 = local_84.Proceed();
            if ((local_126.opCall().GetUEPlayerController() == nullptr))
            {
                continue;
            }
            int local_130 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_122);
            if (local_8.GetPlayerExtras().Contains(local_130) && !(local_8.GetPlayerExtras()[local_130].GetbWantsBackToRoom()))
            {
                return;
            }
        }
        XLog(ELog(22), "BackToRoom: all connected players returned, resetting to Preparing");
        this.ResetToPreparing();
        return;
    }
    void ResetToPreparing() const
    {
        int local_8 = 0;
        int local_20 = 0;
        int local_26 = 0;
        int local_82 = 0;
        int local_92 = 0;
        int local_104 = 0;
        int local_226 = 0;
        Super::RemoveCombatRestrictions();
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        local_8.SetStageType(EFCS_GameStageType(1));
        local_8.SetConfirmReadyTime(FFPTime(1));
        local_8.SetbForceGo(false);
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        FECSWorldPtr local_2_3 = ECS::GetECSWorld();
        local_20.SetbHostSayGO(false);
        this.DestroyBotPlayers(local_20);
        TArray<uint> local_30;
        for (auto& local_48 : local_20.GetPlayerExtras())
        {
            if (GetbIsBot())
            {
                continue;
            }
            if (!(GetbWantsBackToRoom()))
            {
                local_30.Add(local_48.GetKey());
            }
        }
        auto local_54 = local_30.Iterator();
        for (; local_54.CanProceed;)
        {
            int local_62 = local_54.Proceed();
        }
        if (local_30.Num() > 0)
        {
            local_26.RefreshTeamCounts();
        }
        if (!(local_26.GetPlayerMatchDatas().Contains(local_20.GetHostPlayerUID())))
        {
            local_20.SetHostPlayerUID(0);
            TArray<uint> local_68;
            for (auto& local_48_2 : local_20.GetPlayerExtras())
            {
                if (!(GetbIsBot()))
                {
                    local_68.Add(local_48_2.GetKey());
                }
            }
            if (local_68.Num() > 0)
            {
                local_20.SetHostPlayerUID(local_68[FMath::RandRange(0, (local_68.Num() - 1))]);
            }
        }
        for (auto& local_48_3 : local_20.GetPlayerExtras())
        {
            if (!(GetbIsBot()))
            {
                local_20.GetModify_PlayerExtras()[local_48_3.GetKey()].SetbWantsBackToRoom(false);
            }
        }
        FECSWorldPtr local_2_4 = ECS::GetECSWorld();
        Has local_76;
        bool local_14 = local_76.opCall();
        if (local_14)
        {
            FECSWorldPtr local_2_5 = ECS::GetECSWorld();
            local_82.SetTeam1Kills(0);
            local_82.SetTeam2Kills(0);
            local_82.SetWinnerTeamId(0);
            local_82.SetbInPrepStage(true);
            local_82.SetPrepEndTime(FFPTime());
            local_82.SetMatchStartTime(FFPTime());
            local_82.SetMatchEndTime(FFPTime());
            local_82.SetFinishStartTime(FFPTime());
        }
        FECSWorldPtr local_2_6 = ECS::GetECSWorld();
        Has local_86;
        bool local_14_2 = local_86.opCall();
        if (local_14_2)
        {
            FECSWorldPtr local_2_7 = ECS::GetECSWorld();
            local_92.SetCurrentRound(0);
            local_92.SetTeam1RoundWins(0);
            local_92.SetTeam2RoundWins(0);
            local_92.SetRoundWinnerTeamId(0);
            local_92.SetMatchWinnerTeamId(0);
            local_92.SetRoundStage(EPVPTDMRoundStage(0));
            local_92.SetRoundPrepEndTime(FFPTime());
            local_92.SetRoundCombatEndTime(FFPTime());
            local_92.SetRoundIntermissionEndTime(FFPTime());
            local_92.SetFinishStartTime(FFPTime());
        }
        FECSWorldPtr local_2_8 = ECS::GetECSWorld();
        Has local_98;
        bool local_14_3 = local_98.opCall();
        if (local_14_3)
        {
            FECSWorldPtr local_2_9 = ECS::GetECSWorld();
            local_104.GetModify_PlayerScores().Empty(0);
            local_104.GetModify_WinnerTeamIds().Empty(0);
            local_104.GetModify_LoserTeamIds().Empty(0);
            local_104.SetFinishStartTime(FFPTime());
            local_104.SetMatchStartTime(FFPTime());
            local_104.SetMatchEndTime(FFPTime());
            local_104.SetbPlayersKicked(false);
            local_104.SetbDSExitRequested(false);
        }
        FECSRuntimeView local_142 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_146;
        local_146.opCall();
        FECSRuntimeViewIterator local_180 = local_142.Iterator();
        for (; local_180.CanProceed;)
        {
            local_180.Proceed();
            Modify local_220;
            local_220.opCall().SetbReady(false);
        }
        this.ReviveAllDeadPlayersAndBots();
        FFPTime local_12 = FFPTime(-1);
        FECSWorldPtr local_2_10 = ECS::GetECSWorld();
        local_226.CustomName = this.BrawlPrepStartLevelEventName;
        FFPTime local_12_2 = FFPTime(-1);
        FECSWorldPtr local_2_11 = ECS::GetECSWorld();
        SendEvent local_230;
        local_230.opCall(ENTITY_NULL, local_12_2);
        return;
    }
    void SpawnBotPlayers(FCS_PVP_SessionData &inout Session, const FCS_PlayerSpawnerIndex &inout SpawnerIndex) const
    {
        int local_2 = 1;
        int local_1 = local_2;
        return;
    }
    void DestroyBotPlayers(FCS_PVP_SessionData &inout Session) const
    {
        for (auto& local_20 : Session.GetBotPlayerEntities())
        {
            local_20;
            if (IsValid())
            {
                ::FASCommonUtils::DestroyEntity();
            }
        }
        Session.GetModify_BotPlayerEntities().Empty(0);
        return;
    }
    uint FindBotUIDByPawn(const FCS_PVP_SessionData &inout Session, const FECSEntity &inout Pawn) const
    {
        FECSEntityId local_21;
        for (auto& local_20 : Session.GetBotPlayerEntities())
        {
            local_21.GetId();
            if ((local_21 == Pawn.GetId()))
            {
                return local_20.GetKey();
            }
        }
        return 0;
    }
    void ClampPotionsForAllPlayers() const
    {
        int local_285 = int(this.GetPVPFlowSettings().PotionMaxCount);
        if (!(FItemTableRowRef(::NearDeathSettings::Get().PotionItemConfig)))
        {
            return;
        }
        FECSRuntimeView local_354 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_358;
        local_358.opCall();
        FECSRuntimeViewIterator local_392 = local_354.Iterator();
        for (; local_392.CanProceed;)
        {
            const FECSEntity& local_428 = local_392.Proceed();
            int local_286 = ::InventoryUtils::GetInventoryItemNumber(local_428, TDataObjectPtr<FItemConfig>());
            if (local_286 > local_285)
            {
                ::InventoryUtils::RemoveInventoryItem(local_428, TDataObjectPtr<FItemConfig>(), local_286 - local_285);
            }
        }
        return;
    }
    void ReviveAllDeadPlayersAndBots() const
    {
        int local_8;
        Super::ReviveAllDeadPlayers();
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        for (auto& local_28 : local_8.GetBotPlayerEntities())
        {
            local_28;
            if (IsValid())
            {
                Super::ReviveSinglePawn();
            }
        }
        return;
    }
    bool TryGetTeamSpawnLocation(const FECSEntity &inout PlayerProxy, const uint8 Team, const FCS_PlayerSpawnerIndex &inout SpawnerIndex, FVector &inout Position, FQuat &inout Rotation) const
    {
        TDataObjectPtr<FLevelInfoConfig> local_48 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
        ESpawnPointSelectionRule local_50 = ESpawnPointSelectionRule(0);
        ESpawnPointSelectionRule local_49 = local_50;
        if (local_48.IsSet())
        {
            local_49 = local_50;
        }
        return ::FGameModeUtils::GetSpawnLocationForPlayerBySpawnPointRule(PlayerProxy, uint8(Team), SpawnerIndex, ESpawnPointSelectionRule(local_49), Position, Rotation);
    }
    void TeleportPawnToTeamSpawn(const FECSEntity &inout PawnEntity, const FECSEntity &inout PlayerProxy, const uint8 Team, const FCS_PlayerSpawnerIndex &inout SpawnerIndex) const
    {
        FVector local_6(FVector::ZeroVector);
        FQuat local_16 = FQuat(FQuat::Identity);
        if (!(this.TryGetTeamSpawnLocation(PlayerProxy, uint8(Team), SpawnerIndex, local_6, local_16)))
        {
            return;
        }
        float32 local_20 = FMath::RandRange(0.1f, 1.0f);
        local_6.X += local_20;
        float32 local_20_2 = FMath::RandRange(0.1f, 1.0f);
        local_6.Y += local_20_2;
        ::BlueprintFunctions_Common::TeleportEntityToLocation(FECSEntityAdapter(PawnEntity), ::FASCommonUtils::FindLegalLocationExt(PawnEntity, local_6, 400.0f, 200.0f, 4, FVector(100.0, 100.0, 200.0), false), local_16.Rotator(), false, FRotator::ZeroRotator, false, false, ELoadingScreenAction(0), false);
        return;
    }
    void RespawnAllPlayersToSpawn() const
    {
        int local_14 = 0;
        int local_20;
        int local_26 = 0;
        int local_148 = 0;
        int local_149;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        FECSWorldPtr local_2_3 = ECS::GetECSWorld();
        FECSWorldPtr local_2_4 = ECS::GetECSWorld();
        FECSRuntimeView local_64 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_68;
        local_68.opCall();
        Include local_72;
        local_72.opCall();
        FECSRuntimeViewIterator local_106 = local_64.Iterator();
        for (; local_106.CanProceed;)
        {
            const FECSEntity& local_142 = local_106.Proceed();
            local_149 = local_148.GetTeam();
            for (auto& local_164 : local_148.GetAllPlayerPawnEntities())
            {
                if (!(local_164.IsValid()))
                {
                    continue;
                }
                Super::ReviveSinglePawn(local_164);
                this.TeleportPawnToTeamSpawn(local_164, local_142, uint8(local_149), local_14);
            }
        }
        for (auto& local_182 : local_20.GetBotPlayerEntities())
        {
            FECSEntity local_186;
            if (!(local_186.IsValid()))
            {
                continue;
            }
            if (!(local_26.GetPlayerMatchDatas().Contains(local_182.GetKey())))
            {
                continue;
            }
            Super::ReviveSinglePawn(local_186);
            int local_187 = local_26.GetPlayerMatchDatas()[local_182.GetKey()].GetTeamID();
            int local_150 = (local_187 + 1);
            this.TeleportPawnToTeamSpawn(local_186, FECSEntity(), uint8(local_150), local_14);
        }
        return;
    }
    uint8 GetPawnTeam(const FECSEntity &inout Pawn) const
    {
        int local_38 = 0;
        int local_44 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            Get local_10;
            if (!(FECSEntity(local_10.opCall().GetPlayerEntity()).IsValid()))
            {
                local_5 = false;
            }
            else
            {
                Has local_22;
                local_5 = local_22.opCall();
            }
            if (local_5)
            {
                Get local_28;
                return local_28.opCall().GetTeam();
            }
        }
        FECSWorldPtr local_32 = ECS::GetECSWorld();
        FECSWorldPtr local_32_2 = ECS::GetECSWorld();
        int local_46 = this.FindBotUIDByPawn(local_38, Pawn);
        if (local_46 > 0 && local_44.GetPlayerMatchDatas().Contains(local_46))
        {
            int local_47 = local_44.GetPlayerMatchDatas()[local_46].GetTeamID();
            return (local_47 + 1);
        }
        return 0;
    }
    FECSEntity GetStatKeyForPawn(const FECSEntity &inout Pawn) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            Get local_10;
            FECSEntity local_14 = local_10.opCall().GetPlayerEntity();
            if (local_14.IsValid())
            {
                return local_14;
            }
        }
        return Pawn;
    }
    EFaction GetTeamFaction(const uint8 Team) const
    {
        bool local_113;
        int local_122 = 0;
        FECSRuntimeView local_40 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        FECSRuntimeViewIterator local_78 = local_40.Iterator();
        for (; local_78.CanProceed;)
        {
            local_78.Proceed();
            if ((local_122.GetTeam()) != (Team))
            {
                continue;
            }
            for (auto& local_140 : local_122.GetAllPlayerPawnEntities())
            {
                if (!(FECSEntity(local_140).IsValid()))
                {
                    local_113 = false;
                }
                else
                {
                    Has local_152;
                    local_113 = local_152.opCall();
                }
                if (local_113)
                {
                    Get local_158;
                    return local_158.opCall().GetFactionId();
                }
            }
        }
        return EFaction(1);
    }
    void BroadcastKillHint(const FECSEntity &inout KillerPlayerEntity, const FECSEntity &inout DeadPlayerEntity) const
    {
        FPVPGameModeFlowSettings local_142 = this.GetPVPFlowSettings();
        if (!(local_142.MessageHintConfig_PlayerKill))
        {
            return;
        }
        TArray<FTextArgument> local_290;
        Make local_296;
        local_290.Add(local_296.opImplConv());
        local_290.Add(local_296.opImplConv());
        FECSRuntimeView local_344 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_348;
        local_348.opCall();
        FECSRuntimeViewIterator local_382 = local_344.Iterator();
        for (; local_382.CanProceed;)
        {
            const FECSEntity& local_418 = local_382.Proceed();
            ::BlueprintFunctions_Level::Level_SendMessageHint(FECSEntityAdapter(local_418), local_142.MessageHintConfig_PlayerKill, local_290);
        }
        return;
    }
    void HandlePlayerSetReady(const FCE_PlayerSetReady &inout Event) const
    {
        0.SetbReady(Event.bReady);
        return;
    }
    void HandlePlayerSetGO(const FCE_PVPPlayerSetGO &inout Event) const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (local_8.GetHostPlayerUID() != ::FASCommonUtils::GetPlayerUidFromPlayerEntity(Event.Sender))
        {
            return;
        }
        local_8.SetbHostSayGO(true);
        return;
    }
    void HandlePlayerSwitchTeam(const FCE_PVPPlayerSwitchTeam &inout Event) const
    {
        int local_112 = 0;
        int local_124 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Get local_6;
        FGameModeFlowSettings local_54 = Super::GetFlowSettings(local_6.opCall());
        if (int(local_54.EntryMode) != 1)
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        int local_114 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(Event.Sender);
        if (!(local_112.GetPlayerMatchDatas().Contains(local_114)))
        {
            return;
        }
        Has local_118;
        if (!(local_118.opCall()))
        {
            return;
        }
        if (local_124.GetbReady())
        {
            return;
        }
        FGameModePlayerMatchDataBase& local_126 = local_112.GetModify_PlayerMatchDatas()[local_114];
        if (local_126.GetTeamID() == int(Event.NewTeamID))
        {
            return;
        }
        if (local_112.GetTeamPlayerCount(uint8(local_126.GetTeamID())) <= 1 || (local_112.GetTeamPlayerCount(uint8(int(Event.NewTeamID))) >= int(local_54.MaxPlayersPerTeam)))
        {
            return;
        }
        local_126.SetPlayerInTeamIndex(local_112.GetTeamPlayerCount(Event.NewTeamID));
        local_126.SetTeamID(Event.NewTeamID);
        local_112.RefreshTeamCounts();
        return;
    }
    void HandlePlayerSwitchGameRule(const FCE_PVPPlayerSwitchGameRule &inout Event) const
    {
        int local_8 = 0;
        int local_18 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        int local_10 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(Event.Sender);
        if ((local_8.GetHostPlayerUID()) != local_10)
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        if (int(local_18.GetStageType()) != 1)
        {
            return;
        }
        if (int(local_8.GetSelectedGameRuleType()) == int(Event.NewGameRuleType))
        {
            return;
        }
        local_8.SetSelectedGameRuleType(EPVPGameRuleType(Event.NewGameRuleType));
        return;
    }
    void HandleAddBot(const FCE_PVPAddBot &inout Event) const
    {
        int local_2 = 1;
        int local_1 = local_2;
        return;
    }
    void HandleRemoveBot(const FCE_PVPRemoveBot &inout Event) const
    {
        int local_18 = 0;
        int local_24 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if ((int(0.GetStageType())) != 1)
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        FECSWorldPtr local_2_3 = ECS::GetECSWorld();
        local_24.RemoveBotFromTeam(Event.TeamID, local_18);
        XLog(ELog(22), FString().Append("PVP Bot removed from Team=").Append(Event.TeamID));
        return;
    }
    void HandlePlayerRequestBackToRoom(const FCE_PVPPlayerRequestBackToRoom &inout Event) const
    {
        int local_8 = 0;
        int local_24 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (int(local_8.GetStageType()) != 4)
        {
            XLog(ELog(22), FString().Append("BackToRoom rejected: StageType=").Append(int(local_8.GetStageType())).Append(", expected Finish"));
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        int local_26 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(Event.Sender);
        if (!(local_24.GetPlayerExtras().Contains(local_26)))
        {
            return;
        }
        if (local_24.GetPlayerExtras()[local_26].GetbWantsBackToRoom())
        {
            return;
        }
        TMap<uint, FPVP_PlayerSessionExtra>& local_28 = local_24.GetModify_PlayerExtras();
        local_28[local_26].SetbWantsBackToRoom(true);
        ModifyOrAdd local_32;
        local_32.opCall().SetbReady(false);
        XLog(ELog(22), FString().Append("BackToRoom: player ").Append(local_26).Append(" returned to room"));
        FFPTime local_38 = FFPTime(-1);
        FECSWorldPtr local_2_3 = ECS::GetECSWorld();
        SendEvent local_36;
        local_36.opCall(ENTITY_NULL, local_38);
        this.TryTransitionToPreparingIfAllReturned();
        return;
    }
    void HandleClientBackToRoom() const
    {
        int local_14 = 0;
        int local_30 = 0;
        UClass local_44;
        AAS_ECSPlayerController local_4 = ::FASCommonUtils::GetASECSProxyPlayerController();
        if (local_4 == nullptr)
        {
            return;
        }
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        bool local_5 = false;
        bool local_15 = local_5;
        if ((int(local_14.GetStageType())) == 1)
        {
            local_5 = true;
            local_15 = local_5;
        }
        else
        {
            if ((int(local_14.GetStageType())) != 4)
            {
                local_5 = false;
            }
            else
            {
                FECSWorldPtr local_8_2 = ECS::GetECSWorld();
                Has local_22;
                local_5 = local_22.opCall();
            }
            if (local_5)
            {
                FECSWorldPtr local_8_3 = ECS::GetECSWorld();
                int local_37 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_4.GetPlayerEntity());
                local_15 = local_30.GetPlayerExtras().Contains(local_37) && local_30.GetPlayerExtras()[local_37].GetbWantsBackToRoom();
            }
        }
        if (!(local_15))
        {
            return;
        }
        TSubclassOf<UUserWidget> local_42 = TSubclassOf<UUserWidget>(::GameModeSettings::GetGameModeSettings(local_4).EntryUIClass);
        if (local_42.IsValid() && local_44.IsChildOf(UEUIUserWidget))
        {
            FEUIWidget::AddWidgetByClass(local_4.GetLocalPlayer(), TSoftClassPtr<UEUIUserWidget>(local_42));
        }
        return;
    }
    void HandleClientSyncMainHUD() const
    {
        int local_14 = 0;
        AAS_ECSPlayerController local_4 = ::FASCommonUtils::GetASECSProxyPlayerController();
        if (local_4 == nullptr)
        {
            return;
        }
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        if (!((int(local_14.GetStageType()) >= 2)))
        {
            return;
        }
        if (FEUIWidget::FindWidget(local_4.GetLocalPlayer(), GameplayTags::UI_Type_HUD_PVPModeTDM).IsValid())
        {
            return;
        }
        FEUIWidget::AddWidget(local_4.GetLocalPlayer(), GameplayTags::UI_Type_HUD_PVPModeTDM);
        return;
    }
    void HandleClientSyncPrepBlocking() const
    {
        AActor local_32;
        APVP_LevelScriptActor local_36;
        bool local_1 = false;
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        Has local_8;
        if (local_8.opCall())
        {
            FECSWorldPtr local_4_2 = ECS::GetECSWorld();
            Get local_12;
            local_1 = local_12.opCall().GetbInPrepStage();
        }
        else
        {
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            Has local_16;
            if (local_16.opCall())
            {
                FECSWorldPtr local_4_4 = ECS::GetECSWorld();
                Get local_20;
                local_1 = (int(local_20.opCall().GetRoundStage()) == 0);
            }
            else
            {
                return;
            }
        }
        TArray<AActor> local_28;
        Gameplay::GetAllActorsOfClass(__GetWorldContext(), APVP_LevelScriptActor, local_28);
        if ((local_28.Num()) > 0)
        {
            local_32 = local_28[0];
            local_36 = (Cast<APVP_LevelScriptActor>(local_32));
            if (local_36 != nullptr)
            {
                local_36.SyncBlockingState(local_1);
            }
        }
        return;
    }
}

