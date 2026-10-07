

class US_ASGameModeSystemPVP : US_ECSScriptGameModeSystemBase
{
    FName BrawlPrepStartLevelEventName = n"PVP_BRAWL_PREP_START";
    FName BrawlPrepEndLevelEventName = n"PVP_BRAWL_PREP_END";

    US_ASGameModeSystemPVP()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool();
    }
    const UAS_GameModeSettingsPVP GetPVPSettings() const
    {
        UAS_GameModeSettingsPVP local_6 = Cast<UAS_GameModeSettingsPVP>(UECSGameModeSettingsBase::Get(this.GetWorld()));
        return local_6;
    }
    EPVPGameRuleType GetSelectedGameRuleType() const
    {
        EPVPGameRuleType local_13;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Has local_6;
        if (local_6.opCall())
        {
            FECSWorldPtr local_2_2 = this.GetECSWorld();
            Get local_12;
            return local_12.opCall().GetSelectedGameRuleType();
        }
        const UAS_GameModeSettingsPVP local_18 = this.GetPVPSettings();
        if (local_18 != nullptr)
        {
            local_13 = local_18.GameRuleType;
        }
        else
        {
            local_13 = EPVPGameRuleType(1);
        }
        return local_13;
    }
    bool IsGameRuleBrawl() const
    {
        return (int(this.GetSelectedGameRuleType()) != 2);
    }
    bool IsGameRuleTDM() const
    {
        return (int(this.GetSelectedGameRuleType()) == 2);
    }
    int ResolveBrawlLimitFromSettings(const UAS_GameModeSettingsPVP Settings, const int PlayerCount) const
    {
        if ((!((Settings != nullptr))))
        {
            return 30;
        }
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
    UFUNCTION()
    void ServerJob_Begin() const
    {
        int local_14 = 0;
        int local_80 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        local_14.SetGameModeType(EGameModeType(2));
        local_14.SetbPVPGame(true);
        ::FGameModeUtils::InitAttributeScale(this.GetECSWorld());
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        FCS_GameModePreparingTag local_22;
        Assign local_20;
        local_20.opCall(local_22);
        FECSWorldPtr local_2_4 = this.GetECSWorld();
        FCS_PVP_MatchData local_74;
        Assign local_26;
        local_26.opCall(local_74);
        FECSWorldPtr local_2_5 = this.GetECSWorld();
        local_80.SetSelectedGameRuleType(EPVPGameRuleType(1));
        return;
    }
    UFUNCTION()
    void ServerJob_TickPrepare() const
    {
        int local_22 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        if (::FLevelDataLayerUtils::IsWaitingForStreaming(this.GetWorld(), false))
        {
            return;
        }
        if (!(::FGameModeUtils::IsInitialLoadingComplete()))
        {
            return;
        }
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        Has local_16;
        if (!(local_16.opCall()))
        {
            ::FGameModeUtils::InitTeamSpawner(this.GetECSWorld());
        }
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        XLog(ELog(22), "FinishPrepareGameEvent");
        local_22.SetStageType(EFCS_GameStageType(1));
        FECSWorldPtr local_2_4 = this.GetECSWorld();
        Remove local_28;
        local_28.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_Tick() const
    {
        int local_8 = 0;
        ::FGameModeUtils::HandleClientJoin();
        FECSWorldPtr local_2 = this.GetECSWorld();
        switch (int(local_8.GetStageType()))
        {
        case 1:
        {
            this.TickPreparing();
            return;
        }
        case 2:
        {
            this.TickStart();
            return;
        }
        case 3:
        {
            this.TickPlaying();
            return;
        }
        case 4:
        {
            this.TickFinish();
            return;
        }
        }
        return;
    }
    void TryInitNewlyComePlayerControllerDatas() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        FECSRuntimeView local_46 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_50;
        local_50.opCall();
        Exclude(local_46).opCall();
        FECSRuntimeViewIterator local_88 = local_46.Iterator();
        for (; local_88.CanProceed;)
        {
            const FECSEntity& local_126 = local_88.Proceed();
            FC_PlayerStates local_136;
            Assign local_130;
            local_130.opCall(local_136);
            int local_138 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_126);
            local_8.AddNewPlayer(local_138);
            int local_137 = local_8.GetMatchRoomID();
            if (local_137 == 0)
            {
                UGameDSConnectionSubsystem local_142 = ::UGameDSConnectionSubsystem::Get();
                if (local_142 != nullptr)
                {
                    int local_145 = 0;
                    if (local_142.GetPlayerTokenByUID(local_138, local_145) && (local_145 > 0))
                    {
                        local_8.SetMatchRoomID(local_145);
                    }
                }
            }
        }
        return;
    }
    void CleanupDisconnectedPlayers() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        TSet<uint> local_28;
        FECSRuntimeView local_66 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_70;
        local_70.opCall();
        FECSRuntimeViewIterator local_104 = local_66.Iterator();
        for (; local_104.CanProceed;)
        {
            int local_144 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_104.Proceed());
            if (local_144 > 0)
            {
                local_28.Add(local_144);
            }
        }
        TArray<uint> local_148;
        for (auto& local_166 : local_8.GetPlayerMatchDatas())
        {
            if (GetbIsBot())
            {
                continue;
            }
            if (!(local_28.Contains(local_166.GetKey())))
            {
                local_148.Add(local_166.GetKey());
            }
        }
        auto local_174 = local_148.Iterator();
        for (; local_174.CanProceed;)
        {
            local_8.RemovePlayer(local_174.Proceed());
        }
        return;
    }
    void TickPreparing() const
    {
        int local_18 = 0;
        int local_24 = 0;
        int local_148 = 0;
        int local_178 = 0;
        if (::FLevelDataLayerUtils::IsWaitingForStreaming(this.GetWorld(), false))
        {
            return;
        }
        FECSWorldPtr local_6 = this.GetECSWorld();
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        FECSWorldPtr local_6_3 = this.GetECSWorld();
        this.TryInitNewlyComePlayerControllerDatas();
        this.CleanupDisconnectedPlayers();
        FCS_FixedTime local_12;
        int local_26 = int(local_12.Frame) % ECS::GetECSFixedFrameRate();
        if (local_26 == 0)
        {
            bool local_72;
            bool local_71;
            Include local_70;
            FECSRuntimeView local_66 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
            local_70.opCall();
            local_71 = true;
            local_72 = true;
            FECSRuntimeViewIterator local_106 = local_66.Iterator();
            for (; local_106.CanProceed;)
            {
                const FECSEntity& local_142 = local_106.Proceed();
                local_72 = false;
                if (!(local_148.GetbReady()))
                {
                    local_71 = false;
                    break;
                }
            }
            if (!(local_71) && local_24.GetbHostSayGO())
            {
                local_24.SetbHostSayGO(false);
            }
            if (((local_71 && local_24.GetbHostSayGO()) || local_18.GetbForceGo()) && !(local_72))
            {
                local_18.SetConfirmReadyTime((FFPTime(local_18.GetConfirmReadyTime()) - FFPTime(1)));
                if (!(local_71))
                {
                    FECSRuntimeView local_46 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
                    local_70.opCall();
                    Include local_176;
                    local_176.opCall();
                    FECSRuntimeViewIterator local_140 = local_46.Iterator();
                    for (; local_140.CanProceed;)
                    {
                        const FECSEntity& local_142_2 = local_140.Proceed();
                        if (!(local_148.GetbReady()) && !((local_178.GetUEPlayerController() == nullptr)))
                        {
                            ::FGameConnectionUtils::DisconnectPlayer(local_142_2, EDisconnectReason(4));
                        }
                    }
                }
            }
            else
            {
                local_18.SetConfirmReadyTime(FFPTime(1));
            }
            if (FFPTime(local_18.GetConfirmReadyTime()).opCmp(0.0) <= 0)
            {
                FFPTime local_154 = FFPTime(-1);
                FECSWorldPtr local_6_4 = this.GetECSWorld();
                SendEvent local_192;
                local_192.opCall(ENTITY_NULL, local_154);
                local_18.SetStageType(EFCS_GameStageType(2));
                local_18.SetConfirmReadyTime(FFPTime(0));
                FFPTime local_152 = FFPTime(-1);
                FECSWorldPtr local_6_5 = this.GetECSWorld();
            }
        }
        return;
    }
    void TickStart() const
    {
        this.CleanupDisconnectedPlayers();
        if (this.IsGameRuleTDM())
        {
            this.TickStart_TDM();
            return;
        }
        this.TickStart_Brawl();
        return;
    }
    void TickStart_Brawl() const
    {
        int local_8 = 0;
        int local_20 = 0;
        int local_26 = 0;
        int local_152 = 0;
        int local_158;
        int local_230 = 0;
        int local_248 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        FECSWorldPtr local_2_4 = this.GetECSWorld();
        int local_27 = 0;
        FECSRuntimeView local_66 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_70;
        local_70.opCall();
        Include local_74;
        local_74.opCall();
        FECSRuntimeViewIterator local_108 = local_66.Iterator();
        for (; local_108.CanProceed;)
        {
            const FECSEntity& local_146 = local_108.Proceed();
            int local_154 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_146);
            if (!(local_26.GetPlayerMatchDatas().Contains(local_154)))
            {
                continue;
            }
            local_152.SetTeam(uint8((local_26.GetPlayerMatchDatas()[local_154].GetTeamID() + 1)));
            if (local_152.GetAllPlayerPawnEntities().Num() == 0)
            {
                ::FGameModeUtils::SpawnAvatarsForPlayer(local_146, local_152, local_20);
            }
            else
            {
                this.RespawnExistingAvatars(local_146, local_152, local_20);
            }
            FECSEntity local_168 = FECSEntity(local_146.GetId());
            FECSWorldPtr local_2_5 = this.GetECSWorld();
            local_158 = local_152.GetPlayerId();
            local_158 = local_152.GetTeam();
            ++local_27;
            const TArray<FECSEntity>& local_172 = local_152.GetAllPlayerPawnEntities();
            auto local_178 = local_172.Iterator();
            for (; local_178.CanProceed;)
            {
                const FECSEntity& local_186 = local_178.Proceed();
                ::FGameModeUtils::ReplaceInitAttribute(local_186, 1);
            }
        }
        this.SetupPVPCombatTeams();
        FECSWorldPtr local_2_6 = this.GetECSWorld();
        FCS_PVP_TDM_ScoreData local_224;
        Assign local_190;
        local_190.opCall(local_224);
        FECSWorldPtr local_2_7 = this.GetECSWorld();
        local_230.SetTeam1Kills(0);
        local_230.SetTeam2Kills(0);
        local_230.SetWinnerTeamId(0);
        const UAS_GameModeSettingsPVP local_234 = this.GetPVPSettings();
        local_230.SetKillScoreLimit(this.ResolveBrawlLimitFromSettings(local_234, local_27));
        local_158 = local_234 != nullptr ? int(local_234.BrawlPrepDurationSeconds) : 30;
        if (local_158 < 0)
        {
            local_158 = 0;
        }
        local_230.SetbInPrepStage((local_158 > 0));
        if (local_230.GetbInPrepStage())
        {
            local_230.SetPrepEndTime((ECS::GetContextTime() + FFPTime(local_158)));
            FFPTime local_242 = FFPTime(-1);
            FECSWorldPtr local_2_8 = this.GetECSWorld();
            local_248.CustomName = this.BrawlPrepStartLevelEventName;
        }
        local_230.SetMatchStartTime(ECS::GetContextTime());
        int local_28 = local_234 != nullptr ? int(local_234.TDMMaxMatchDurationSeconds) : 1800;
        if (local_28 > 0)
        {
            local_230.SetMatchEndTime((ECS::GetContextTime() + FFPTime(local_28)));
        }
        this.SpawnBotPlayers(local_26, local_20);
        local_230.GetModify_PlayerStatMap().Empty(0);
        FECSRuntimeView local_46 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        local_70.opCall();
        local_74.opCall();
        FECSRuntimeViewIterator local_142 = local_46.Iterator();
        for (; local_142.CanProceed;)
        {
            const FECSEntity& local_186_2 = local_142.Proceed();
            FPVP_TDM_PlayerStat local_276;
            Get local_280;
            local_276.SetTeamId(local_280.opCall().GetTeam());
            local_230.GetModify_PlayerStatMap().Add(local_186_2, local_276);
        }
        this.ClampPotionsForAllPlayers();
        local_8.SetStageType(EFCS_GameStageType(3));
        return;
    }
    void TickStart_TDM() const
    {
        int local_8 = 0;
        int local_20 = 0;
        int local_26 = 0;
        int local_150 = 0;
        int local_216 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        FECSWorldPtr local_2_4 = this.GetECSWorld();
        FECSRuntimeView local_64 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_68;
        local_68.opCall();
        Include local_72;
        local_72.opCall();
        FECSRuntimeViewIterator local_106 = local_64.Iterator();
        for (; local_106.CanProceed;)
        {
            const FECSEntity& local_144 = local_106.Proceed();
            int local_152 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_144);
            if (!(local_26.GetPlayerMatchDatas().Contains(local_152)))
            {
                continue;
            }
            local_150.SetTeam(uint8((local_26.GetPlayerMatchDatas()[local_152].GetTeamID() + 1)));
            if (local_150.GetAllPlayerPawnEntities().Num() == 0)
            {
                ::FGameModeUtils::SpawnAvatarsForPlayer(local_144, local_150, local_20);
            }
            else
            {
                this.RespawnExistingAvatars(local_144, local_150, local_20);
            }
            FECSEntity local_168 = FECSEntity(local_144.GetId());
            FECSWorldPtr local_2_5 = this.GetECSWorld();
            int local_157 = local_150.GetPlayerId();
            int local_157_2 = local_150.GetTeam();
        }
        this.SetupPVPCombatTeams();
        this.SpawnBotPlayers(local_26, local_20);
        FECSWorldPtr local_2_6 = this.GetECSWorld();
        FCS_PVP_TDM_RoundData local_210;
        Assign local_174;
        local_174.opCall(local_210);
        FECSWorldPtr local_2_7 = this.GetECSWorld();
        const UAS_GameModeSettingsPVP local_220 = this.GetPVPSettings();
        int local_156 = local_220 != nullptr ? int(local_220.TDMRoundsToWin) : 3;
        local_216.SetRoundsToWin(local_156);
        local_216.GetModify_PlayerStatMap().Empty(0);
        FECSRuntimeView local_44 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        local_68.opCall();
        local_72.opCall();
        FECSRuntimeViewIterator local_140 = local_44.Iterator();
        for (; local_140.CanProceed;)
        {
            const FECSEntity& local_144_2 = local_140.Proceed();
            FPVP_TDM_PlayerStat local_246;
            Get local_250;
            local_246.SetTeamId(local_250.opCall().GetTeam());
            local_216.GetModify_PlayerStatMap().Add(local_144_2, local_246);
        }
        this.ClampPotionsForAllPlayers();
        local_8.SetStageType(EFCS_GameStageType(3));
        this.TDM_BeginNewRound();
        return;
    }
    void TickPlaying() const
    {
        this.CleanupDisconnectedPlayers();
        FECSWorldPtr local_2 = this.GetECSWorld();
        Has local_6;
        bool local_7 = local_6.opCall();
        if (local_7)
        {
            this.TickPlaying_TDM();
            return;
        }
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        Has local_12;
        bool local_7_2 = local_12.opCall();
        if (local_7_2)
        {
            this.TickPlaying_Brawl();
        }
        return;
    }
    void TickPlaying_Brawl() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        if (local_8.GetbInPrepStage())
        {
            this.Brawl_TickPrepStage(local_8);
            return;
        }
        if (local_8.GetWinnerTeamId() == 0)
        {
            this.Brawl_RespawnDeadBots();
            if (FFPTime(local_8.GetMatchEndTime()).opCmp(local_8.GetMatchStartTime()) > 0 && (ECS::GetContextTime().opCmp(local_8.GetMatchEndTime()) > 0))
            {
                if (local_8.GetTeam1Kills() > local_8.GetTeam2Kills())
                {
                    local_8.SetWinnerTeamId(1);
                }
                else
                {
                    if (local_8.GetTeam2Kills() > local_8.GetTeam1Kills())
                    {
                        local_8.SetWinnerTeamId(2);
                    }
                    else
                    {
                        local_8.SetWinnerTeamId(-1);
                    }
                }
                local_8.SetFinishStartTime(ECS::GetContextTime());
                FECSWorldPtr local_2_2 = this.GetECSWorld();
                Modify local_20;
                local_20.opCall().SetStageType(EFCS_GameStageType(4));
                this.ReviveAllDeadPlayers();
            }
        }
        return;
    }
    void Brawl_RespawnDeadBots() const
    {
        int local_8 = 0;
        int local_22 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        if (local_8.GetBotPlayerEntities().Num() == 0)
        {
            return;
        }
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        Has local_48;
        Has local_52;
        for (auto& local_40 : local_8.GetBotPlayerEntities())
        {
            FECSEntity local_44;
            if (!(local_44.IsValid()))
            {
                continue;
            }
            if (!(local_48.opCall()) && !(local_52.opCall()))
            {
                continue;
            }
            if (!(local_8.GetPlayerMatchDatas().Contains(local_40.GetKey())))
            {
                continue;
            }
            this.ReviveSinglePawn(local_44);
            this.TDM_TeleportPawnToTeamSpawn(local_44, FECSEntity(), uint8((local_8.GetPlayerMatchDatas()[local_40.GetKey()].GetTeamID() + 1)), local_22);
        }
        return;
    }
    void Brawl_TickPrepStage(FCS_PVP_TDM_ScoreData &inout Brawl) const
    {
        int local_12 = 0;
        if (ECS::GetContextTime().opCmp(Brawl.GetPrepEndTime()) >= 0)
        {
            Brawl.SetbInPrepStage(false);
            FFPTime local_2 = FFPTime(-1);
            FECSWorldPtr local_6 = this.GetECSWorld();
            local_12.CustomName = this.BrawlPrepEndLevelEventName;
            FFPTime local_2_2 = FFPTime(-1);
            FECSWorldPtr local_6_2 = this.GetECSWorld();
            SendEvent local_16;
            local_16.opCall(ENTITY_NULL, local_2_2);
            XLog(ELog(22), "Brawl prep ended, combat started");
        }
        return;
    }
    void TickPlaying_TDM() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        if (local_8.GetMatchWinnerTeamId() != 0)
        {
            return;
        }
        switch (int(local_8.GetRoundStage()))
        {
        case 0:
        {
            this.TDM_TickRoundPrep(local_8);
            return;
        }
        case 1:
        {
            this.TDM_TickRoundCombat(local_8);
            return;
        }
        case 2:
        {
            this.TDM_TickRoundIntermission(local_8);
            return;
        }
        }
        return;
    }
    void TDM_BeginNewRound() const
    {
        int local_14 = 0;
        int local_34 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        const UAS_GameModeSettingsPVP local_18 = this.GetPVPSettings();
        local_14.SetCurrentRound((local_14.GetCurrentRound() + 1));
        local_14.SetRoundWinnerTeamId(0);
        local_14.SetRoundStage(EPVPTDMRoundStage(0));
        local_14.SetRoundPrepEndTime((ECS::GetContextTime() + FFPTime(local_18 != nullptr ? int(local_18.TDMRoundPrepDurationSeconds) : 30)));
        this.TDM_SetAllPlayerInputEnabled(true);
        this.TDM_RespawnAllPlayers();
        this.ClampPotionsForAllPlayers();
        FFPTime local_28 = FFPTime(-1);
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        local_34.CustomName = this.BrawlPrepStartLevelEventName;
        FFPTime local_26 = FFPTime(-1);
        FECSWorldPtr local_2_4 = this.GetECSWorld();
        SendEvent local_38;
        local_38.opCall(ENTITY_NULL, local_26);
        return;
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
                this.TDM_FullHealPawn(local_18);
            }
            Has local_42;
            local_15 = local_42.opCall();
            if (local_15)
            {
                Remove local_46;
                local_46.opCall();
            }
            this.TDM_TeleportPawnToTeamSpawn(local_18, PlayerProxy, uint8(local_1), SpawnerIndex);
        }
        return;
    }
    void TDM_RespawnAllPlayers() const
    {
        int local_14 = 0;
        int local_20 = 0;
        int local_142 = 0;
        int local_143;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        FECSRuntimeView local_58 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_62;
        local_62.opCall();
        Include local_66;
        local_66.opCall();
        FECSRuntimeViewIterator local_100 = local_58.Iterator();
        for (; local_100.CanProceed;)
        {
            const FECSEntity& local_136 = local_100.Proceed();
            local_143 = local_142.GetTeam();
            for (auto& local_158 : local_142.GetAllPlayerPawnEntities())
            {
                if (!(local_158.IsValid()))
                {
                    continue;
                }
                this.ReviveSinglePawn(local_158);
                this.TDM_TeleportPawnToTeamSpawn(local_158, local_136, uint8(local_143), local_14);
            }
        }
        for (auto& local_176 : local_20.GetBotPlayerEntities())
        {
            FECSEntity local_180;
            if (!(local_180.IsValid()))
            {
                continue;
            }
            if (!(local_20.GetPlayerMatchDatas().Contains(local_176.GetKey())))
            {
                continue;
            }
            this.ReviveSinglePawn(local_180);
            int local_181 = local_20.GetPlayerMatchDatas()[local_176.GetKey()].GetTeamID();
            int local_144 = (local_181 + 1);
            this.TDM_TeleportPawnToTeamSpawn(local_180, FECSEntity(), uint8(local_144), local_14);
        }
        return;
    }
    void TDM_FullHealPawn(const FECSEntity &inout PawnEntity) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        Get local_10;
        float32 local_13 = local_10.opCall().GetAttributeValue(Attribute::HPMax, ECS::GetContextTime());
        float32 local_6 = local_10.opCall().GetAttributeValue(Attribute::HP, ECS::GetContextTime());
        if (local_6 < local_13)
        {
            FGameAttributeUtils::Recover(PawnEntity, Attribute::HP, ECS::GetContextTime(), local_13 - local_6, -1.0f);
        }
        return;
    }
    void ReviveAllDeadPlayers() const
    {
        int local_126;
        int local_146;
        FECSRuntimeView local_40 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        Include local_48;
        local_48.opCall();
        FECSRuntimeViewIterator local_82 = local_40.Iterator();
        for (; local_82.CanProceed;)
        {
            local_82.Proceed();
            for (auto& local_140 : local_126.GetAllPlayerPawnEntities())
            {
                if (!(local_140.IsValid()))
                {
                    continue;
                }
                this.ReviveSinglePawn(local_140);
            }
        }
        FECSWorldPtr local_20 = this.GetECSWorld();
        for (auto& local_164 : local_146.GetBotPlayerEntities())
        {
            local_164;
            if (IsValid())
            {
                this.ReviveSinglePawn();
            }
        }
        return;
    }
    void ReviveSinglePawn(const FECSEntity &inout PawnEntity) const
    {
        bool local_1 = false;
        Has local_6;
        bool local_2 = local_6.opCall();
        if (local_2)
        {
            ::FNearDeathUtils::TryRestoreHitboxFromNearDeath(PawnEntity);
            Remove local_10;
            local_10.opCall();
            Remove local_14;
            local_14.opCall();
            Remove local_18;
            local_18.opCall();
            Remove local_22;
            local_22.opCall();
            local_1 = true;
        }
        Has local_26;
        bool local_2_2 = local_26.opCall();
        if (local_2_2)
        {
            local_1 = true;
        }
        if (local_1)
        {
            FCE_Reborn local_34;
            ECS::GetContextTime();
            local_34.RebornByEntity = PawnEntity;
            local_34.RebornHPRatio = 1.0f;
            bool local_2_3 = true;
            local_34.bRebornWithAnimation = local_2_3;
        }
        else
        {
            this.TDM_FullHealPawn(PawnEntity);
        }
        Has local_40;
        bool local_2_4 = local_40.opCall();
        if (local_2_4)
        {
            Remove local_44;
            local_44.opCall();
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
    void TDM_TeleportPawnToTeamSpawn(const FECSEntity &inout PawnEntity, const FECSEntity &inout PlayerProxy, const uint8 Team, const FCS_PlayerSpawnerIndex &inout SpawnerIndex) const
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
        ::BlueprintFunctions_Common::TeleportEntityToLocation(FECSEntityAdapter(PawnEntity), ::FASCommonUtils::FindLegalLocationExt(PawnEntity, local_6, 400.0f, 200.0f, 4, FVector(100.0, 100.0, 200.0), false), local_16.Rotator(), false, FRotator::ZeroRotator, false, true, ELoadingScreenAction(0), true);
        return;
    }
    void TDM_TickRoundPrep(FCS_PVP_TDM_RoundData &inout RD) const
    {
        int local_24 = 0;
        if (ECS::GetContextTime().opCmp(RD.GetRoundPrepEndTime()) >= 0)
        {
            const UAS_GameModeSettingsPVP local_8 = this.GetPVPSettings();
            int local_3 = local_8 != nullptr ? int(local_8.TDMRoundCombatDurationSeconds) : 180;
            RD.SetRoundStage(EPVPTDMRoundStage(1));
            RD.SetRoundCombatEndTime((ECS::GetContextTime() + FFPTime(local_3)));
            FFPTime local_2 = FFPTime(-1);
            FECSWorldPtr local_18 = this.GetECSWorld();
            local_24.CustomName = this.BrawlPrepEndLevelEventName;
            FFPTime local_16 = FFPTime(-1);
            FECSWorldPtr local_18_2 = this.GetECSWorld();
            SendEvent local_28;
            local_28.opCall(ENTITY_NULL, local_16);
            XLog(ELog(22), FString().Append("TDM Round ").Append(RD.GetCurrentRound()).Append(": Prep ended, Combat started (").Append(local_3).Append("s)"));
        }
        return;
    }
    void TDM_TickRoundCombat(FCS_PVP_TDM_RoundData &inout RD) const
    {
        if (RD.GetRoundWinnerTeamId() != 0)
        {
            return;
        }
        int local_4 = 0;
        int local_5 = 0;
        float32 local_6 = 0.0f;
        float32 local_8 = 0.0f;
        this.TDM_CountAlivePlayersAndHP(local_4, local_5, local_6, local_8);
        if ((local_4 == 0 && (local_5 == 0)))
        {
            this.TDM_EndRound(RD, -1);
            return;
        }
        if (local_4 == 0)
        {
            this.TDM_EndRound(RD, 2);
            return;
        }
        if (local_5 == 0)
        {
            this.TDM_EndRound(RD, 1);
            return;
        }
        if (ECS::GetContextTime().opCmp(RD.GetRoundCombatEndTime()) >= 0)
        {
            if (local_4 > local_5)
            {
                this.TDM_EndRound(RD, 1);
            }
            else
            {
                if (local_5 > local_4)
                {
                    this.TDM_EndRound(RD, 2);
                }
                else
                {
                    if (local_6 > local_8)
                    {
                        this.TDM_EndRound(RD, 1);
                    }
                    else
                    {
                        if (local_8 > local_6)
                        {
                            this.TDM_EndRound(RD, 2);
                        }
                        else
                        {
                            this.TDM_EndRound(RD, -1);
                        }
                    }
                }
            }
            return;
        }
        this.TDM_TickAutoRespawn(RD);
        return;
    }
    void TDM_TickAutoRespawn(FCS_PVP_TDM_RoundData &inout RD) const
    {
        int local_14 = 0;
        FECSEntityId local_173;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FFPTime local_18 = ECS::GetContextTime();
        FECSRuntimeView local_56 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_60;
        local_60.opCall();
        FECSRuntimeViewIterator local_94 = local_56.Iterator();
        Get local_144;
        for (; local_94.CanProceed;)
        {
            const FECSEntity& local_130 = local_94.Proceed();
            Has local_134;
            bool local_7 = local_134.opCall();
            if (local_7)
            {
                Remove local_138;
                local_138.opCall();
            }
            if (local_18.opCmp(FFPTime(local_144.opCall().RespawnTime)) < 0)
            {
                continue;
            }
            Remove local_150;
            local_150.opCall();
            this.ReviveSinglePawn(local_130);
            int local_152 = this.GetPawnTeam(local_130);
            FECSEntity local_156;
            Has local_160;
            local_7 = local_160.opCall();
            if (local_7)
            {
                Get local_164;
                local_156 = FECSEntity(local_164.opCall().GetPlayerEntity());
            }
            this.TDM_TeleportPawnToTeamSpawn(local_130, local_156, uint8(local_152), local_14);
            local_130.GetId();
            XLog(ELog(22), FString().Append("TDM auto-respawn: Pawn=").Append(local_173).Append(local_173).Append(", Team="));
        }
        return;
    }
    void TDM_CountAlivePlayersAndHP(int &inout Team1Alive, int &inout Team2Alive, float32 &inout Team1HPPercent, float32 &inout Team2HPPercent) const
    {
        bool local_123;
        int local_132 = 0;
        int local_133;
        FECSEntity local_142;
        Has local_146;
        Has local_150;
        Has local_158;
        Get local_162;
        int local_172 = 0;
        float32 local_191;
        Team1Alive = 0;
        Team2Alive = 0;
        float32 local_2 = 0.0f;
        float32 local_4 = 0.0f;
        float32 local_5 = 0.0f;
        float32 local_6 = 0.0f;
        FECSRuntimeView local_46 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_50;
        local_50.opCall();
        Include local_54;
        local_54.opCall();
        FECSRuntimeViewIterator local_88 = local_46.Iterator();
        for (; local_88.CanProceed;)
        {
            local_88.Proceed();
            local_133 = local_132.GetTeam();
            local_142 = FECSEntity(local_132.GetPlayerPawnEntity());
            if (!(local_142.IsValid()))
            {
                continue;
            }
            local_123 = local_146.opCall();
            if (local_123)
            {
                local_123 = true;
            }
            else
            {
                local_123 = local_150.opCall();
            }
            if (local_123)
            {
                continue;
            }
            float32 local_152 = 0.0f;
            float32 local_153 = 0.0f;
            local_123 = local_158.opCall();
            if (local_123)
            {
                local_152 = local_162.opCall().GetAttributeValue(Attribute::HP, ECS::GetContextTime());
                local_153 = local_162.opCall().GetAttributeValue(Attribute::HPMax, ECS::GetContextTime());
            }
            if (local_133 == 1)
            {
                Team1Alive = (Team1Alive + 1);
                local_2 = local_2 + local_152;
                local_4 = local_4 + local_153;
            }
            else
            {
                if (local_133 == 2)
                {
                    Team2Alive = (Team2Alive + 1);
                    local_5 = local_5 + local_152;
                    local_6 = local_6 + local_153;
                }
            }
        }
        FECSWorldPtr local_26 = this.GetECSWorld();
        for (auto& local_190 : local_172.GetBotPlayerEntities())
        {
            if (!(local_142.IsValid()))
            {
                local_123 = true;
            }
            else
            {
                local_123 = local_146.opCall();
            }
            if (local_123)
            {
                local_123 = true;
            }
            else
            {
                local_123 = local_150.opCall();
            }
            if (local_123)
            {
                continue;
            }
            if (!(local_172.GetPlayerMatchDatas().Contains(local_190.GetKey())))
            {
                continue;
            }
            int local_166_2 = local_172.GetPlayerMatchDatas()[local_190.GetKey()].GetTeamID();
            int local_134 = (local_166_2 + 1);
            float32 local_153_2 = 0.0f;
            float32 local_152_2 = 0.0f;
            local_123 = local_158.opCall();
            if (local_123)
            {
                local_153_2 = local_162.opCall().GetAttributeValue(Attribute::HP, ECS::GetContextTime());
                local_152_2 = local_162.opCall().GetAttributeValue(Attribute::HPMax, ECS::GetContextTime());
            }
            if (local_134 == 1)
            {
                local_166_2 = Team1Alive;
                local_166_2 = local_166_2 + 1;
                Team1Alive = local_166_2;
                local_2 = local_2 + local_153_2;
                local_4 = local_4 + local_152_2;
            }
            else
            {
                if (local_134 == 2)
                {
                    Team2Alive = (Team2Alive + 1);
                    local_5 = local_5 + local_153_2;
                    local_6 = local_6 + local_152_2;
                }
            }
        }
        if (local_4 > 0.0f)
        {
            local_191 = local_2 / local_4;
        }
        else
        {
            local_191 = 0.0f;
        }
        Team1HPPercent = local_191;
        if (local_6 > 0.0f)
        {
            local_191 = local_5 / local_6;
        }
        else
        {
            local_191 = 0.0f;
        }
        Team2HPPercent = local_191;
        return;
    }
    void TDM_EndRound(FCS_PVP_TDM_RoundData &inout RD, const int RoundWinner) const
    {
        int local_1;
        int local_3;
        RD.SetRoundWinnerTeamId(RoundWinner);
        if (RoundWinner == 1)
        {
            local_1 = RD.GetTeam1RoundWins();
            local_1 = local_1 + 1;
            RD.SetTeam1RoundWins(local_1);
        }
        else
        {
            if (RoundWinner == 2)
            {
                local_3 = RD.GetTeam2RoundWins();
                local_3 = local_3 + 1;
                RD.SetTeam2RoundWins(local_3);
            }
        }
        XLog(ELog(22), FString().Append("TDM Round ").Append(RD.GetCurrentRound()).Append(" ended. Winner: ").Append(RoundWinner).Append(". Score: ").Append(RD.GetTeam1RoundWins()).Append(" - ").Append(RD.GetTeam2RoundWins()));
        this.TDM_RecordPendingDeathStats(RD);
        this.ReviveAllDeadPlayers();
        local_3 = RD.GetRoundsToWin() > 0 ? RD.GetRoundsToWin() : 3;
        if (RD.GetTeam1RoundWins() >= local_3)
        {
            Modify local_20;
            RD.SetMatchWinnerTeamId(1);
            RD.SetFinishStartTime(ECS::GetContextTime());
            FECSWorldPtr local_16 = this.GetECSWorld();
            local_20.opCall().SetStageType(EFCS_GameStageType(4));
            return;
        }
        if (RD.GetTeam2RoundWins() >= local_3)
        {
            Modify local_20;
            RD.SetMatchWinnerTeamId(2);
            RD.SetFinishStartTime(ECS::GetContextTime());
            FECSWorldPtr local_16_2 = this.GetECSWorld();
            local_20.opCall().SetStageType(EFCS_GameStageType(4));
            return;
        }
        const UAS_GameModeSettingsPVP local_26 = this.GetPVPSettings();
        local_1 = local_26 != nullptr ? int(local_26.TDMRoundIntermissionSeconds) : 10;
        RD.SetRoundStage(EPVPTDMRoundStage(2));
        RD.SetRoundIntermissionEndTime((ECS::GetContextTime() + FFPTime(local_1)));
        this.TDM_SetAllPlayerInputEnabled(false);
        return;
    }
    void TDM_SetAllPlayerInputEnabled(const bool bEnabled) const
    {
        int local_126;
        Has local_144;
        FECSRuntimeView local_40 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        Include local_48;
        local_48.opCall();
        FECSRuntimeViewIterator local_82 = local_40.Iterator();
        for (; local_82.CanProceed;)
        {
            local_82.Proceed();
            for (auto& local_140 : local_126.GetAllPlayerPawnEntities())
            {
                if (!(local_140.IsValid()))
                {
                    continue;
                }
                if (bEnabled)
                {
                    if (!(local_144.opCall()))
                    {
                        Assign local_148;
                        FC_Input local_260;
                        local_148.opCall(local_260);
                    }
                    continue;
                }
                bool local_117 = local_144.opCall();
                if (local_117)
                {
                    Remove local_264;
                    local_264.opCall();
                }
            }
        }
        return;
    }
    void TDM_TickRoundIntermission(FCS_PVP_TDM_RoundData &inout RD) const
    {
        if (ECS::GetContextTime().opCmp(RD.GetRoundIntermissionEndTime()) >= 0)
        {
            this.TDM_BeginNewRound();
        }
        return;
    }
    void TickFinish() const
    {
        int local_44 = 0;
        this.ReviveAllDeadPlayers();
        FFPTime local_2;
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        bool local_9 = local_8.opCall();
        if (local_9)
        {
            FECSWorldPtr local_4_2 = this.GetECSWorld();
            Get local_14;
            local_2 = local_14.opCall().GetFinishStartTime();
        }
        else
        {
            FECSWorldPtr local_4_3 = this.GetECSWorld();
            Has local_18;
            local_9 = local_18.opCall();
            if (local_9)
            {
                FECSWorldPtr local_4_4 = this.GetECSWorld();
                Get local_22;
                local_2 = local_22.opCall().GetFinishStartTime();
            }
            else
            {
                return;
            }
        }
        if (local_2.ToSeconds() <= 0.0)
        {
            return;
        }
        const UAS_GameModeSettingsPVP local_30 = this.GetPVPSettings();
        if ((ECS::GetContextTime() - local_2).ToSeconds() < float(local_30 != nullptr ? int(local_30.FinishDisconnectDelaySeconds) : 25))
        {
            return;
        }
        FECSWorldPtr local_4_5 = this.GetECSWorld();
        bool local_45 = false;
        for (auto& local_64 : local_44.GetPlayerMatchDatas())
        {
            local_64;
            if (GetbWantsBackToRoom())
            {
                local_45 = true;
                break;
            }
        }
        FECSRuntimeView local_102 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_106;
        local_106.opCall();
        if (local_45)
        {
            Get local_180;
            FECSRuntimeViewIterator local_140 = local_102.Iterator();
            for (; local_140.CanProceed;)
            {
                const FECSEntity& local_176 = local_140.Proceed();
                if ((local_180.opCall().GetUEPlayerController() == nullptr))
                {
                    continue;
                }
                int local_184 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_176);
                if (local_44.GetPlayerMatchDatas().Contains(local_184) && local_44.GetPlayerMatchDatas()[local_184].GetbWantsBackToRoom())
                {
                    continue;
                }
                ::FGameConnectionUtils::UICallBackToCityLevel(local_176);
            }
            this.TryTransitionToPreparingIfAllReturned();
        }
        else
        {
            Get local_180;
            FECSRuntimeViewIterator local_174 = local_102.Iterator();
            for (; local_174.CanProceed;)
            {
                const FECSEntity& local_176_2 = local_174.Proceed();
                if ((local_180.opCall().GetUEPlayerController() == nullptr))
                {
                    continue;
                }
                ::FGameConnectionUtils::UICallBackToCityLevel(local_176_2);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_OnPlayerRequestBackToRoom(const FCE_PVPPlayerRequestBackToRoom &inout Event) const
    {
        int local_8 = 0;
        int local_24 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        if (int(local_8.GetStageType()) != 4)
        {
            XLog(ELog(22), FString().Append("BackToRoom rejected: StageType=").Append(int(local_8.GetStageType())).Append(", expected Finish"));
            return;
        }
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        int local_26 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(Event.Sender);
        if (!(local_24.GetPlayerMatchDatas().Contains(local_26)))
        {
            return;
        }
        if (local_24.GetPlayerMatchDatas()[local_26].GetbWantsBackToRoom())
        {
            return;
        }
        local_24.GetModify_PlayerMatchDatas()[local_26].SetbWantsBackToRoom(true);
        ModifyOrAdd local_30;
        local_30.opCall().SetbReady(false);
        XLog(ELog(22), FString().Append("BackToRoom: player ").Append(local_26).Append(" returned to room"));
        FFPTime local_36 = FFPTime(-1);
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        SendEvent local_34;
        local_34.opCall(ENTITY_NULL, local_36);
        this.TryTransitionToPreparingIfAllReturned();
        return;
    }
    void TryTransitionToPreparingIfAllReturned() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        FECSRuntimeView local_46 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
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
            if (local_8.GetPlayerMatchDatas().Contains(local_130) && !(local_8.GetPlayerMatchDatas()[local_130].GetbWantsBackToRoom()))
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
        int local_74 = 0;
        int local_84 = 0;
        int local_204 = 0;
        int local_210 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        local_8.SetStageType(EFCS_GameStageType(1));
        local_8.SetConfirmReadyTime(FFPTime(1));
        local_8.SetbForceGo(false);
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        local_20.SetbHostSayGO(false);
        this.DestroyBotPlayers(local_20);
        TArray<uint> local_24;
        for (auto& local_42 : local_20.GetPlayerMatchDatas())
        {
            if (GetbIsBot())
            {
                continue;
            }
            if (!(GetbWantsBackToRoom()))
            {
                local_24.Add(local_42.GetKey());
            }
        }
        auto local_48 = local_24.Iterator();
        for (; local_48.CanProceed;)
        {
            int local_56 = local_48.Proceed();
        }
        if (local_24.Num() > 0)
        {
            local_20.RefreshInTeamIndices();
        }
        if (!(local_20.GetPlayerMatchDatas().Contains(local_20.GetHostPlayerUID())))
        {
            local_20.SetHostPlayerUID(0);
            TArray<uint> local_62;
            for (auto& local_42_2 : local_20.GetPlayerMatchDatas())
            {
                if (!(GetbIsBot()))
                {
                    local_62.Add(local_42_2.GetKey());
                }
            }
            if (local_62.Num() > 0)
            {
                local_20.SetHostPlayerUID(local_62[FMath::RandRange(0, (local_62.Num() - 1))]);
            }
        }
        for (auto& local_42_3 : local_20.GetPlayerMatchDatas())
        {
            if (!(GetbIsBot()))
            {
                local_20.GetModify_PlayerMatchDatas()[local_42_3.GetKey()].SetbWantsBackToRoom(false);
            }
        }
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        Has local_68;
        bool local_14 = local_68.opCall();
        if (local_14)
        {
            FECSWorldPtr local_2_4 = this.GetECSWorld();
            local_74.SetTeam1Kills(0);
            local_74.SetTeam2Kills(0);
            local_74.SetWinnerTeamId(0);
            local_74.SetbInPrepStage(true);
            local_74.SetPrepEndTime(FFPTime());
            local_74.SetMatchStartTime(FFPTime());
            local_74.SetMatchEndTime(FFPTime());
            local_74.SetFinishStartTime(FFPTime());
            local_74.GetModify_PlayerStatMap().Empty(0);
        }
        FECSWorldPtr local_2_5 = this.GetECSWorld();
        Has local_78;
        bool local_14_2 = local_78.opCall();
        if (local_14_2)
        {
            FECSWorldPtr local_2_6 = this.GetECSWorld();
            local_84.SetCurrentRound(0);
            local_84.SetTeam1RoundWins(0);
            local_84.SetTeam2RoundWins(0);
            local_84.SetRoundWinnerTeamId(0);
            local_84.SetMatchWinnerTeamId(0);
            local_84.SetRoundStage(EPVPTDMRoundStage(0));
            local_84.SetRoundPrepEndTime(FFPTime());
            local_84.SetRoundCombatEndTime(FFPTime());
            local_84.SetRoundIntermissionEndTime(FFPTime());
            local_84.SetFinishStartTime(FFPTime());
            local_84.GetModify_PlayerStatMap().Empty(0);
        }
        FECSRuntimeView local_124 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_128;
        local_128.opCall();
        FECSRuntimeViewIterator local_162 = local_124.Iterator();
        for (; local_162.CanProceed;)
        {
            local_162.Proceed();
            local_204.SetbReady(false);
        }
        this.ReviveAllDeadPlayers();
        FFPTime local_12 = FFPTime(-1);
        FECSWorldPtr local_2_7 = this.GetECSWorld();
        local_210.CustomName = this.BrawlPrepStartLevelEventName;
        FFPTime local_12_2 = FFPTime(-1);
        FECSWorldPtr local_2_8 = this.GetECSWorld();
        SendEvent local_214;
        local_214.opCall(ENTITY_NULL, local_12_2);
        return;
    }
    UFUNCTION()
    void ClientJob_OnBackToRoom(const FCE_GameModeStateChangedEvent &inout Event) const
    {
        int local_14 = 0;
        int local_30 = 0;
        UClass local_44;
        AAS_ECSPlayerController local_4 = ::FASCommonUtils::GetASECSProxyPlayerController();
        if (local_4 == nullptr)
        {
            return;
        }
        FECSWorldPtr local_8 = this.GetECSWorld();
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
                FECSWorldPtr local_8_2 = this.GetECSWorld();
                Has local_22;
                local_5 = local_22.opCall();
            }
            if (local_5)
            {
                FECSWorldPtr local_8_3 = this.GetECSWorld();
                int local_37 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_4.GetPlayerEntity());
                local_15 = local_30.GetPlayerMatchDatas().Contains(local_37) && local_30.GetPlayerMatchDatas()[local_37].GetbWantsBackToRoom();
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
    UFUNCTION()
    void ClientJob_SyncPrepBlocking(const FCE_GameModeStateChangedEvent &inout Event) const
    {
        AActor local_32;
        APVP_LevelScriptActor local_36;
        bool local_1 = false;
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (local_8.opCall())
        {
            FECSWorldPtr local_4_2 = this.GetECSWorld();
            Get local_12;
            local_1 = local_12.opCall().GetbInPrepStage();
        }
        else
        {
            FECSWorldPtr local_4_3 = this.GetECSWorld();
            Has local_16;
            if (local_16.opCall())
            {
                FECSWorldPtr local_4_4 = this.GetECSWorld();
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
    void SpawnBotPlayers(FCS_PVP_MatchData &inout MatchData, const FCS_PlayerSpawnerIndex &inout SpawnerIndex) const
    {
        int local_2 = 1;
        int local_1 = local_2;
        return;
    }
    void DestroyBotPlayers(FCS_PVP_MatchData &inout MatchData) const
    {
        for (auto& local_20 : MatchData.GetBotPlayerEntities())
        {
            local_20;
            if (IsValid())
            {
                ::FASCommonUtils::DestroyEntity();
            }
        }
        MatchData.GetModify_BotPlayerEntities().Empty(0);
        return;
    }
    uint FindBotUIDByPawn(const FCS_PVP_MatchData &inout MatchData, const FECSEntity &inout Pawn) const
    {
        FECSEntityId local_21;
        for (auto& local_20 : MatchData.GetBotPlayerEntities())
        {
            local_21.GetId();
            if ((local_21 == Pawn.GetId()))
            {
                return local_20.GetKey();
            }
        }
        return 0;
    }
    uint8 GetPawnTeam(const FECSEntity &inout Pawn) const
    {
        int local_38 = 0;
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
        FECSWorldPtr local_32 = this.GetECSWorld();
        int local_40 = this.FindBotUIDByPawn(local_38, Pawn);
        if (local_40 > 0 && local_38.GetPlayerMatchDatas().Contains(local_40))
        {
            int local_41 = local_38.GetPlayerMatchDatas()[local_40].GetTeamID();
            return (local_41 + 1);
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
        FECSRuntimeView local_40 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
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
    void SetupPVPCombatTeams() const
    {
        FECSRuntimeView local_40 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        FECSRuntimeViewIterator local_78 = local_40.Iterator();
        for (; local_78.CanProceed;)
        {
            ::FTeamUtils::HandlePlayerEnterForCombatTeam(local_78.Proceed());
        }
        return;
    }
    void ClampPotionsForAllPlayers() const
    {
        const UAS_GameModeSettingsPVP local_4 = this.GetPVPSettings();
        int local_7 = local_4 != nullptr ? int(local_4.PotionMaxCount) : 1;
        if (!(FItemTableRowRef(::NearDeathSettings::Get().PotionItemConfig)))
        {
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        FECSRuntimeViewIterator local_112 = local_74.Iterator();
        for (; local_112.CanProceed;)
        {
            const FECSEntity& local_148 = local_112.Proceed();
            int local_8 = ::InventoryUtils::GetInventoryItemNumber(local_148, TDataObjectPtr<FItemConfig>());
            if (local_8 > local_7)
            {
                ::InventoryUtils::RemoveInventoryItem(local_148, TDataObjectPtr<FItemConfig>(), local_8 - local_7);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_OnPlayerDeath(const FCE_DeathEvent &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        if ((int(local_6.opCall().GetStageType())) != 3)
        {
            return;
        }
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        Has local_14;
        if (local_14.opCall())
        {
            this.ProcessBrawlPawnDeath(Event, Event.Sender);
            return;
        }
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        Has local_18;
        if (local_18.opCall())
        {
            this.ProcessTDMPawnDeath(Event, Event.Sender);
        }
        return;
    }
    void ProcessBrawlPawnDeath(const FCE_DeathEvent &inout Event, const FECSEntity &inout DeadPawn) const
    {
        int local_14 = 0;
        if (!(DeadPawn.IsValid()))
        {
            return;
        }
        int local_3 = this.GetPawnTeam(DeadPawn);
        if (local_3 == 0)
        {
            return;
        }
        FECSWorldPtr local_8 = this.GetECSWorld();
        if (local_14.GetWinnerTeamId() != 0 || local_14.GetbInPrepStage())
        {
            return;
        }
        FECSEntity local_24 = this.GetStatKeyForPawn(DeadPawn);
        if (!(local_14.GetPlayerStatMap().Contains(local_24)))
        {
            FPVP_TDM_PlayerStat local_32;
            local_32.SetTeamId(local_3);
            local_14.GetModify_PlayerStatMap().Add(local_24, local_32);
        }
        FPVP_TDM_PlayerStat& local_34 = local_14.GetModify_PlayerStatMap()[local_24];
        local_34.SetDeaths((local_34.GetDeaths() + 1));
        local_34.SetTeamId(local_3);
        FECSEntity local_20 = FECSEntity(Event.KilledByEntity);
        int local_2 = this.GetPawnTeam(local_20);
        if (local_2 == 0 || ((local_2 == local_3)))
        {
            return;
        }
        FECSEntity local_38 = this.GetStatKeyForPawn(local_20);
        if ((local_38.GetId() == local_24.GetId()))
        {
            return;
        }
        if (!(local_14.GetPlayerStatMap().Contains(local_38)))
        {
            FPVP_TDM_PlayerStat local_32;
            local_32.SetTeamId(local_2);
            local_14.GetModify_PlayerStatMap().Add(local_38, local_32);
        }
        FPVP_TDM_PlayerStat& local_48 = local_14.GetModify_PlayerStatMap()[local_38];
        local_48.SetKills((local_48.GetKills() + 1));
        local_48.SetTeamId(local_2);
        this.BroadcastKillHint(local_38, local_24);
        if (local_2 == 1)
        {
            local_14.SetTeam1Kills((local_14.GetTeam1Kills() + 1));
        }
        else
        {
            if (local_2 == 2)
            {
                local_14.SetTeam2Kills((local_14.GetTeam2Kills() + 1));
            }
        }
        int local_50 = local_14.GetKillScoreLimit() > 0 ? local_14.GetKillScoreLimit() : 30;
        if (local_14.GetTeam1Kills() >= local_50)
        {
            local_14.SetWinnerTeamId(1);
        }
        else
        {
            if (local_14.GetTeam2Kills() >= local_50)
            {
                local_14.SetWinnerTeamId(2);
            }
        }
        if (local_14.GetWinnerTeamId() != 0)
        {
            local_14.SetFinishStartTime(ECS::GetContextTime());
            FECSWorldPtr local_8_2 = this.GetECSWorld();
            Modify local_56;
            local_56.opCall().SetStageType(EFCS_GameStageType(4));
        }
        return;
    }
    void TDM_RecordPendingDeathStats(FCS_PVP_TDM_RoundData &inout RD) const
    {
        int local_126;
        int local_146;
        FECSRuntimeView local_40 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        Include local_48;
        local_48.opCall();
        FECSRuntimeViewIterator local_82 = local_40.Iterator();
        for (; local_82.CanProceed;)
        {
            local_82.Proceed();
            for (auto& local_140 : local_126.GetAllPlayerPawnEntities())
            {
                if (local_140.IsValid())
                {
                    this.TDM_RecordSinglePawnDeathIfNeeded(RD, local_140);
                }
            }
        }
        FECSWorldPtr local_20 = this.GetECSWorld();
        for (auto& local_164 : local_146.GetBotPlayerEntities())
        {
            local_164;
            if (IsValid())
            {
                this.TDM_RecordSinglePawnDeathIfNeeded(RD);
            }
        }
        return;
    }
    void TDM_RecordSinglePawnDeathIfNeeded(FCS_PVP_TDM_RoundData &inout RD, const FECSEntity &inout Pawn) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        Has local_10;
        bool local_5 = local_10.opCall();
        if (local_5)
        {
            return;
        }
        int local_12 = this.GetPawnTeam(Pawn);
        int local_13 = local_12;
        if (local_13 == 0)
        {
            return;
        }
        FECSEntity local_22 = this.GetStatKeyForPawn(Pawn);
        if (!(RD.GetPlayerStatMap().Contains(local_22)))
        {
            FPVP_TDM_PlayerStat local_30;
            local_13 = local_12;
            local_30.SetTeamId(local_13);
            RD.GetModify_PlayerStatMap().Add(local_22, local_30);
        }
        local_13.SetDeaths((RD.GetModify_PlayerStatMap()[local_22].GetDeaths() + 1));
        Has local_36;
        if (!(local_36.opCall()))
        {
            return;
        }
        Get local_42;
        FECSEntityId local_37 = FECSEntityId(local_42.opCall().GetKilledByEntity());
        if ((local_37 == ENTITY_ID_NULL))
        {
            return;
        }
        FECSEntity local_18 = FECSEntity(local_37);
        int local_11 = this.GetPawnTeam(local_18);
        int local_31_2 = local_11;
        if ((local_31_2 == 0 || ((local_11 == local_12))))
        {
            return;
        }
        FECSEntity local_46 = this.GetStatKeyForPawn(local_18);
        if ((local_46.GetId() == local_22.GetId()))
        {
            return;
        }
        if (!(RD.GetPlayerStatMap().Contains(local_46)))
        {
            FPVP_TDM_PlayerStat local_30;
            local_30.SetTeamId(local_11);
            RD.GetModify_PlayerStatMap().Add(local_46, local_30);
        }
        local_31_2.SetKills((RD.GetModify_PlayerStatMap()[local_46].GetKills() + 1));
        this.BroadcastKillHint(local_46, local_22);
        return;
    }
    void ProcessTDMPawnDeath(const FCE_DeathEvent &inout Event, const FECSEntity &inout DeadPawn) const
    {
        int local_14 = 0;
        int local_35 = 0;
        int local_72 = 0;
        if (!(DeadPawn.IsValid()))
        {
            return;
        }
        int local_3 = this.GetPawnTeam(DeadPawn);
        if (local_3 == 0)
        {
            return;
        }
        FECSWorldPtr local_8 = this.GetECSWorld();
        int local_4 = int(local_14.GetRoundStage());
        if (local_4 != 1 || (local_14.GetRoundWinnerTeamId() != 0))
        {
            return;
        }
        FECSEntity local_26 = this.GetStatKeyForPawn(DeadPawn);
        if (!(local_14.GetPlayerStatMap().Contains(local_26)))
        {
            FPVP_TDM_PlayerStat local_34;
            local_34.SetTeamId(local_3);
            local_14.GetModify_PlayerStatMap().Add(local_26, local_34);
        }
        local_4.SetDeaths((local_14.GetModify_PlayerStatMap()[local_26].GetDeaths() + 1));
        FECSEntity local_22 = FECSEntity(Event.KilledByEntity);
        int local_2 = this.GetPawnTeam(local_22);
        if (local_2 != 0 && ((local_2 != local_3)))
        {
            FECSEntity local_40 = this.GetStatKeyForPawn(local_22);
            if (!((local_40.GetId() == local_26.GetId())))
            {
                if (!(local_14.GetPlayerStatMap().Contains(local_40)))
                {
                    FPVP_TDM_PlayerStat local_34;
                    local_34.SetTeamId(local_2);
                    local_14.GetModify_PlayerStatMap().Add(local_40, local_34);
                }
                local_35.SetKills((local_14.GetModify_PlayerStatMap()[local_40].GetKills() + 1));
                this.BroadcastKillHint(local_40, local_26);
            }
        }
        Has local_54;
        bool local_1 = local_54.opCall();
        if (local_1)
        {
            Remove local_58;
            local_58.opCall();
        }
        const UAS_GameModeSettingsPVP local_62 = this.GetPVPSettings();
        int local_49 = local_62 != nullptr ? int(local_62.TDMRespawnDurationSeconds) : 5;
        if (local_49 > 0)
        {
            local_72.RespawnTime = (ECS::GetContextTime() + FFPTime(local_49));
        }
        return;
    }
    void BroadcastKillHint(const FECSEntity &inout KillerPlayerEntity, const FECSEntity &inout DeadPlayerEntity) const
    {
        const UAS_GameModeSettingsPVP local_4 = this.GetPVPSettings();
        if ((!((local_4 != nullptr)) || !(local_4.MessageHintConfig_PlayerKill)))
        {
            return;
        }
        TArray<FTextArgument> local_10;
        Make local_16;
        local_10.Add(local_16.opImplConv());
        local_10.Add(local_16.opImplConv());
        FECSRuntimeView local_64 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_68;
        local_68.opCall();
        FECSRuntimeViewIterator local_102 = local_64.Iterator();
        for (; local_102.CanProceed;)
        {
            const FECSEntity& local_138 = local_102.Proceed();
            ::BlueprintFunctions_Level::Level_SendMessageHint(FECSEntityAdapter(local_138), local_4.MessageHintConfig_PlayerKill, local_10);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_AccumulatePVPDamageStats(const FCE_DamageEvent &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        if ((int(local_6.opCall().GetStageType())) != 3)
        {
            return;
        }
        Get local_14;
        const FC_ControlledByPlayer& local_16 = local_14.opCall();
        if (local_16)
        {
            FECSEntity local_20 = local_16.GetPlayerEntity();
            Has local_24;
            if (!(local_20.IsValid()) || !(local_24.opCall()))
            {
                return;
            }
            FECSWorldPtr local_2_2 = this.GetECSWorld();
            Has local_30;
            bool local_10 = local_30.opCall();
            if (local_10)
            {
                FECSWorldPtr local_2_3 = this.GetECSWorld();
                Modify local_34;
                this.AccumulatePVPDamage(local_34.opCall().GetModify_PlayerStatMap(), local_20, Event.FinalDamageSource, Event.ActualDamageToHP);
            }
            else
            {
                FECSWorldPtr local_2_4 = this.GetECSWorld();
                Has local_40;
                local_10 = local_40.opCall();
                if (local_10)
                {
                    FECSWorldPtr local_2_5 = this.GetECSWorld();
                    Modify local_44;
                    this.AccumulatePVPDamage(local_44.opCall().GetModify_PlayerStatMap(), local_20, Event.FinalDamageSource, Event.ActualDamageToHP);
                }
            }
        }
        return;
    }
    void AccumulatePVPDamage(TMap<FECSEntity, FPVP_TDM_PlayerStat> &inout StatMap, const FECSEntity &inout ReceiverPlayer, const FECSEntity &inout AttackerPawn, const float32 Damage) const
    {
        int local_2 = 0;
        float32 local_3 = 0.0f;
        if (StatMap.Contains(ReceiverPlayer))
        {
            local_3 = StatMap[ReceiverPlayer].GetDamageTaken();
            local_3 = local_3 + Damage;
            local_2.SetDamageTaken(local_3);
        }
        Has local_8;
        if (!(AttackerPawn.IsValid()) || !(local_8.opCall()))
        {
            return;
        }
        Get local_14;
        FECSEntity local_18 = local_14.opCall().GetPlayerEntity();
        if (local_18.IsValid() && !((local_18 == ReceiverPlayer)) && StatMap.Contains(local_18))
        {
            local_3.SetDamageDealt((StatMap[local_18].GetDamageDealt() + Damage));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TickPlayerSetReady(const FCE_PlayerSetReady &inout Event) const
    {
        0.SetbReady(Event.bReady);
        return;
    }
    UFUNCTION()
    void ServerJob_TickPlayerSetGO(const FCE_PVPPlayerSetGO &inout Event) const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        if (local_8.GetHostPlayerUID() != ::FASCommonUtils::GetPlayerUidFromPlayerEntity(Event.Sender))
        {
            return;
        }
        local_8.SetbHostSayGO(true);
        return;
    }
    UFUNCTION()
    void ServerJob_TickPlayerSwitchTeam(const FCE_PVPPlayerSwitchTeam &inout Event) const
    {
        int local_8 = 0;
        int local_22 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        int local_10 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(Event.Sender);
        if (!(local_8.GetPlayerMatchDatas().Contains(local_10)))
        {
            return;
        }
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        if (local_22.GetbReady())
        {
            return;
        }
        FPVP_PlayerMatchData& local_24 = local_8.GetModify_PlayerMatchDatas()[local_10];
        if (local_24.GetTeamID() == int(Event.NewTeamID))
        {
            return;
        }
        if (local_8.GetTeamPlayerCount(uint8(local_24.GetTeamID())) <= 1 || (local_8.GetTeamPlayerCount(uint8(int(Event.NewTeamID))) >= 5))
        {
            return;
        }
        local_24.SetPlayerInTeamIndex(local_8.GetTeamPlayerCount(Event.NewTeamID));
        local_24.SetTeamID(Event.NewTeamID);
        local_8.RefreshInTeamIndices();
        return;
    }
    UFUNCTION()
    void ServerJob_TickPlayerSwitchGameRule(const FCE_PVPPlayerSwitchGameRule &inout Event) const
    {
        int local_8 = 0;
        int local_18 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        int local_10 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(Event.Sender);
        if ((local_8.GetHostPlayerUID()) != local_10)
        {
            return;
        }
        FECSWorldPtr local_2_2 = this.GetECSWorld();
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
    UFUNCTION()
    void ServerJob_OnAddBot(const FCE_PVPAddBot &inout Event) const
    {
        int local_2 = 1;
        int local_1 = local_2;
        return;
    }
    UFUNCTION()
    void ServerJob_OnRemoveBot(const FCE_PVPRemoveBot &inout Event) const
    {
        int local_18 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        if ((int(0.GetStageType())) != 1)
        {
            return;
        }
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        local_18.RemoveBotFromTeam(Event.TeamID);
        XLog(ELog(22), FString().Append("PVP Bot removed from Team=").Append(Event.TeamID));
        return;
    }
    UFUNCTION()
    void ServerJob_HandleReviveTeleport(FCE_Event_ReviveTeleport &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        if (this.TryReviveTeleportToTeamSpawn(FECSEntity(Event.Sender)))
        {
            return;
        }
        this.HandleReviveTeleportPrefabFallback(Event);
        return;
    }
    bool TryReviveTeleportToTeamSpawn(const FECSEntity &inout TelportEntity) const
    {
        int local_14 = 0;
        int local_37;
        int local_54 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return false;
        }
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        if ((int(local_14.GetGameModeType())) != 2)
        {
            return false;
        }
        Has local_22;
        if (!(TelportEntity.IsValid()) || !(local_22.opCall()))
        {
            return false;
        }
        Get local_32;
        FECSEntity local_28 = local_32.opCall().GetPlayerEntity();
        Has local_36;
        if (!(local_28.IsValid()) || !(local_36.opCall()))
        {
            return false;
        }
        Get local_42;
        local_37 = local_42.opCall().GetTeam();
        if ((local_37) == 0)
        {
            return false;
        }
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        Has local_48;
        if (!(local_48.opCall()))
        {
            return false;
        }
        FECSWorldPtr local_2_4 = this.GetECSWorld();
        TDataObjectPtr<FLevelInfoConfig> local_102 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
        ESpawnPointSelectionRule local_104 = ESpawnPointSelectionRule(0);
        ESpawnPointSelectionRule local_103 = local_104;
        if (local_102.IsSet())
        {
            local_103 = local_104;
        }
        FVector local_110(FVector::ZeroVector);
        FQuat local_120 = FQuat(FQuat::Identity);
        if (!(::FGameModeUtils::GetSpawnLocationForPlayerBySpawnPointRule(local_28, uint8(local_37), local_54, ESpawnPointSelectionRule(local_103), local_110, local_120)))
        {
            return false;
        }
        float32 local_123 = FMath::RandRange(0.1f, 1.0f);
        local_110.X += local_123;
        float32 local_123_2 = FMath::RandRange(0.1f, 1.0f);
        local_110.Y += local_123_2;
        ::BlueprintFunctions_Common::TeleportEntityToLocation(FECSEntityAdapter(TelportEntity), ::FASCommonUtils::FindLegalLocationExt(TelportEntity, local_110, 400.0f, 200.0f, 4, FVector(100.0, 100.0, 200.0), false), local_120.Rotator(), false, FRotator::ZeroRotator, false, true, ELoadingScreenAction(0), true);
        return true;
    }
    void HandleReviveTeleportPrefabFallback(FCE_Event_ReviveTeleport &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        FECSQueryParam local_18;
        local_18.bExcludeDeath = true;
        FVector local_24(FVector::ZeroVector);
        Has local_28;
        bool local_5 = local_28.opCall();
        if (local_5)
        {
            Get local_32;
            local_24 = local_32.opCall().GetPosition();
        }
        float32 local_33 = 500000.0f;
        float32 local_35 = 20000.0f;
        bool local_36 = false;
        int local_38 = 3;
        int local_37 = local_38;
        bool local_39 = false;
        TArray<FECSEntity> local_44;
        auto local_50 = Event.SpecificPrefabClass.Iterator();
        for (; local_50.CanProceed;)
        {
            local_18.SpecificPrefabClass = local_50.Proceed();
            FECSRuntimeQuery local_100 = FECSRuntimeQueryHelper::RuntimeQueryInCylinder(local_4, local_24, local_33, local_35, local_36, EECSQueryRegsitryType(local_37), local_39);
            ::ECSQueryUtils::AddQueryFilterByParams(local_100, local_4, local_18);
            local_44.Append(local_100.GetAllEntities());
        }
        local_44 = FEntityUtils::SortEntitiesByDistance(local_44, local_24);
        ::FBorderUtils::FilterEntitiesOutsideBorder(local_44);
        bool local_145 = false;
        FVector local_152(FVector::ZeroVector);
        if (local_44.Num() > 0)
        {
            local_152 = ::FASCommonUtils::GetEntityLocation(FECSEntity(local_44[0]));
            local_145 = true;
        }
        else
        {
            Get local_168;
            const FC_LastValidNavGround& local_170 = local_168.opCall();
            if (local_170)
            {
                local_152 = local_170.GetLastNavGroundPosition();
                local_145 = true;
            }
            else
            {
                Get local_174;
                const FC_LastValidGround& local_176 = local_174.opCall();
                if (local_176)
                {
                    local_152 = local_176.GetLastGroundPosition();
                    local_145 = true;
                }
            }
        }
        if (local_145)
        {
            GetDefaulted local_198;
            ::BlueprintFunctions_Common::TeleportEntityToLocation(FECSEntityAdapter(local_4), ::FASCommonUtils::FindLegalLocationExt(local_4, local_152, 400.0f, 200.0f, 4, FVector(100.0, 100.0, 200.0), false), local_198.opCall().GetRotation().Rotator(), false, FRotator::ZeroRotator, false, true, ELoadingScreenAction(0), true);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_Begin() const
    {
        ECS::GetContextJob();
        this.ServerJob_Begin();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickPrepare() const
    {
        ECS::GetContextJob();
        this.ServerJob_TickPrepare();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_Tick() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        this.ServerJob_Tick();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_OnPlayerRequestBackToRoom() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PVPPlayerRequestBackToRoom> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PVPPlayerRequestBackToRoom& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PVPPlayerRequestBackToRoom, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_OnPlayerRequestBackToRoom(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_OnBackToRoom() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_GameModeStateChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_GameModeStateChangedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_OnBackToRoom(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_SyncPrepBlocking() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_GameModeStateChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_GameModeStateChangedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_SyncPrepBlocking(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_OnPlayerDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_OnPlayerDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_AccumulatePVPDamageStats() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DamageEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DamageEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_AccumulatePVPDamageStats(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickPlayerSetReady() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerSetReady> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerSetReady& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PlayerSetReady, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TickPlayerSetReady(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickPlayerSetGO() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PVPPlayerSetGO> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PVPPlayerSetGO& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PVPPlayerSetGO, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TickPlayerSetGO(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickPlayerSwitchTeam() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PVPPlayerSwitchTeam> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PVPPlayerSwitchTeam& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PVPPlayerSwitchTeam, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TickPlayerSwitchTeam(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickPlayerSwitchGameRule() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PVPPlayerSwitchGameRule> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PVPPlayerSwitchGameRule& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PVPPlayerSwitchGameRule, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TickPlayerSwitchGameRule(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_OnAddBot() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PVPAddBot> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PVPAddBot& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PVPAddBot, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_OnAddBot(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_OnRemoveBot() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PVPRemoveBot> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PVPRemoveBot& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PVPRemoveBot, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_OnRemoveBot(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleReviveTeleport() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_Event_ReviveTeleport> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_Event_ReviveTeleport& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleReviveTeleport(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

