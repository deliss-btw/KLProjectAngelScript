

// NOTE: class defaults are not authored in this module: FPVPTDMGameModeFlowSettings (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

struct FPVPTDMGameModeFlowSettings : FGameModeFlowSettings
{
    FGameModeFlowSettings _base_FGameModeFlowSettings;

    FPVPTDMGameModeFlowSettings()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

class UPVPTDMGameModeFlow : UPVPGameModeFlowBase
{
    UPVPTDMGameModeFlow()
    {
        super();
        return;
    }
    void OnTickPreparing(const FCS_GameModeProfile &inout Profile) const
    {
        Super::TickPreparingShared();
        return;
    }
    void OnTickStarting(const FCS_GameModeProfile &inout Profile) const
    {
        int local_10 = 0;
        int local_16 = 0;
        int local_62 = 0;
        Super::CleanupDisconnectedPlayers();
        Super::SpawnAllPlayerAvatars();
        Super::SetupCombatTeams();
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        FECSWorldPtr local_4_2 = ECS::GetECSWorld();
        Super::SpawnBotPlayers(local_10, local_16);
        FECSWorldPtr local_4_3 = ECS::GetECSWorld();
        FCS_PVP_TDM_RoundData local_56;
        Assign local_20;
        local_20.opCall(local_56);
        FECSWorldPtr local_4_4 = ECS::GetECSWorld();
        local_62.SetRoundsToWin(int(Super::GetPVPFlowSettings().TDMRoundsToWin));
        this.InitScoreData();
        Super::ClampPotionsForAllPlayers();
        Super::ApplyCombatRestrictions();
        Super::ChangeGameState(EFCS_GameStageType(3));
        this.BeginNewRound();
        return;
    }
    void OnTickPlaying(const FCS_GameModeProfile &inout Profile) const
    {
        int local_8 = 0;
        Super::CleanupDisconnectedPlayers();
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Has local_12;
        bool local_13 = local_12.opCall();
        if (!(local_13))
        {
            local_13 = false;
        }
        else
        {
            FECSWorldPtr local_2_3 = ECS::GetECSWorld();
            Get local_18;
            local_13 = (local_18.opCall().GetWinnerTeamIds().Num() > 0);
        }
        if (local_13)
        {
            return;
        }
        switch (int(local_8.GetRoundStage()))
        {
        case 0:
        {
            this.TickRoundPrep(local_8);
            return;
        }
        case 1:
        {
            this.TickRoundCombat(local_8);
            return;
        }
        case 2:
        {
            this.TickRoundIntermission(local_8);
            return;
        }
        }
        return;
    }
    void OnHandleDeath(const FCS_GameModeProfile &inout Profile, FCE_DeathEvent &inout Event) const
    {
        int local_24 = 0;
        int local_348 = 0;
        Super::OnHandleDeath(Profile, Event);
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Get local_6;
        if (int(local_6.opCall().GetStageType()) != 3)
        {
            return;
        }
        FECSEntity local_14 = FECSEntity(Event.Sender);
        if (!(local_14.IsValid()))
        {
            return;
        }
        int local_16 = Super::GetPawnTeam(local_14);
        if (local_16 == 0)
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        if (int(local_24.GetRoundStage()) != 1 || (local_24.GetRoundWinnerTeamId() != 0))
        {
            return;
        }
        FECSEntity local_34 = Super::GetStatKeyForPawn(local_14);
        FECSEntity local_30 = FECSEntity(Event.KilledByEntity);
        int local_15 = Super::GetPawnTeam(local_30);
        if ((local_15 != 0 && (local_15 != local_16)))
        {
            FECSEntity local_38 = Super::GetStatKeyForPawn(local_30);
            if ((!((local_38.GetId() == local_34.GetId()))))
            {
                Super::BroadcastKillHint(local_38, local_34);
            }
        }
        Has local_50;
        if (local_50.opCall())
        {
            Remove local_54;
            local_54.opCall();
        }
        int local_339 = int(Super::GetPVPFlowSettings().TDMRespawnDurationSeconds);
        if (local_339 > 0)
        {
            local_348.RespawnTime = (ECS::GetContextTime() + FFPTime(local_339));
        }
        return;
    }
    void BeginNewRound() const
    {
        int local_14 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        FPVPGameModeFlowSettings local_156 = Super::GetPVPFlowSettings();
        local_14.SetCurrentRound((local_14.GetCurrentRound() + 1));
        local_14.SetRoundWinnerTeamId(0);
        local_14.SetRoundStage(EPVPTDMRoundStage(0));
        int local_302 = local_156.TDMRoundPrepDurationSeconds;
        local_14.SetRoundPrepEndTime((ECS::GetContextTime() + FFPTime(local_302)));
        this.SetAllPlayerInputEnabled(true);
        Super::RespawnAllPlayersToSpawn();
        Super::ClampPotionsForAllPlayers();
        FFPTime local_308 = FFPTime(-1);
        FECSWorldPtr local_2_3 = ECS::GetECSWorld();
        FFPTime local_306 = FFPTime(-1);
        FECSWorldPtr local_2_4 = ECS::GetECSWorld();
        SendEvent local_318;
        local_318.opCall(ENTITY_NULL, local_306);
        return;
    }
    void TickRoundPrep(FCS_PVP_TDM_RoundData &inout RD) const
    {
        if (ECS::GetContextTime().opCmp(RD.GetRoundPrepEndTime()) >= 0)
        {
            int local_289;
            local_289 = int(Super::GetPVPFlowSettings().TDMRoundCombatDurationSeconds);
            RD.SetRoundStage(EPVPTDMRoundStage(1));
            RD.SetRoundCombatEndTime((ECS::GetContextTime() + FFPTime(local_289)));
            FFPTime local_2 = FFPTime(-1);
            FECSWorldPtr local_296 = ECS::GetECSWorld();
            FFPTime local_294 = FFPTime(-1);
            FECSWorldPtr local_296_2 = ECS::GetECSWorld();
            SendEvent local_306;
            local_306.opCall(ENTITY_NULL, local_294);
            XLog(ELog(22), FString().Append("TDM Round ").Append(RD.GetCurrentRound()).Append(": Prep ended, Combat started (").Append(local_289).Append("s)"));
        }
        return;
    }
    void TickRoundCombat(FCS_PVP_TDM_RoundData &inout RD) const
    {
        if (RD.GetRoundWinnerTeamId() != 0)
        {
            return;
        }
        int local_4 = 0;
        int local_5 = 0;
        float32 local_6 = 0.0f;
        float32 local_8 = 0.0f;
        this.CountAlivePlayersAndHP(local_4, local_5, local_6, local_8);
        if ((local_4 == 0 && (local_5 == 0)))
        {
            this.EndRound(RD, -1);
            return;
        }
        if (local_4 == 0)
        {
            this.EndRound(RD, 2);
            return;
        }
        if (local_5 == 0)
        {
            this.EndRound(RD, 1);
            return;
        }
        if (ECS::GetContextTime().opCmp(RD.GetRoundCombatEndTime()) >= 0)
        {
            if (local_4 > local_5)
            {
                this.EndRound(RD, 1);
            }
            else
            {
                if (local_5 > local_4)
                {
                    this.EndRound(RD, 2);
                }
                else
                {
                    if (local_6 > local_8)
                    {
                        this.EndRound(RD, 1);
                    }
                    else
                    {
                        if (local_8 > local_6)
                        {
                            this.EndRound(RD, 2);
                        }
                        else
                        {
                            this.EndRound(RD, -1);
                        }
                    }
                }
            }
            return;
        }
        this.TickAutoRespawn(RD);
        return;
    }
    void CountAlivePlayersAndHP(int &inout Team1Alive, int &inout Team2Alive, float32 &inout Team1HPPercent, float32 &inout Team2HPPercent) const
    {
        bool local_123;
        int local_132 = 0;
        int local_133;
        FECSEntity local_142;
        Has local_146;
        Has local_150;
        Has local_158;
        Get local_162;
        int local_172;
        int local_178 = 0;
        float32 local_197;
        Team1Alive = 0;
        Team2Alive = 0;
        float32 local_2 = 0.0f;
        float32 local_4 = 0.0f;
        float32 local_5 = 0.0f;
        float32 local_6 = 0.0f;
        FECSRuntimeView local_46 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
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
        FECSWorldPtr local_26 = ECS::GetECSWorld();
        FECSWorldPtr local_26_2 = ECS::GetECSWorld();
        for (auto& local_196 : local_172.GetBotPlayerEntities())
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
            if (!(local_178.GetPlayerMatchDatas().Contains(local_196.GetKey())))
            {
                continue;
            }
            int local_166_2 = local_178.GetPlayerMatchDatas()[local_196.GetKey()].GetTeamID();
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
            local_197 = local_2 / local_4;
        }
        else
        {
            local_197 = 0.0f;
        }
        Team1HPPercent = local_197;
        if (local_6 > 0.0f)
        {
            local_197 = local_5 / local_6;
        }
        else
        {
            local_197 = 0.0f;
        }
        Team2HPPercent = local_197;
        return;
    }
    void TickAutoRespawn(FCS_PVP_TDM_RoundData &inout RD) const
    {
        int local_14 = 0;
        FECSEntityId local_173;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        FFPTime local_18 = ECS::GetContextTime();
        FECSRuntimeView local_56 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
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
            Super::ReviveSinglePawn(local_130);
            int local_152 = Super::GetPawnTeam(local_130);
            FECSEntity local_156;
            Has local_160;
            local_7 = local_160.opCall();
            if (local_7)
            {
                Get local_164;
                local_156 = FECSEntity(local_164.opCall().GetPlayerEntity());
            }
            Super::TeleportPawnToTeamSpawn(local_130, local_156, uint8(local_152), local_14);
            local_130.GetId();
            XLog(ELog(22), FString().Append("TDM auto-respawn: Pawn=").Append(local_173).Append(local_173).Append(", Team="));
        }
        return;
    }
    void EndRound(FCS_PVP_TDM_RoundData &inout RD, const int RoundWinner) const
    {
        int local_3;
        RD.SetRoundWinnerTeamId(RoundWinner);
        if (RoundWinner == 1)
        {
            RD.SetTeam1RoundWins((RD.GetTeam1RoundWins() + 1));
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
        this.RecordPendingDeathStats();
        Super::ReviveAllDeadPlayersAndBots();
        local_3 = RD.GetRoundsToWin() > 0 ? RD.GetRoundsToWin() : 3;
        if (RD.GetTeam1RoundWins() >= local_3)
        {
            TArray<int> local_16;
            local_16.Add(1);
            TArray<int> local_20;
            local_20.Add(2);
            Super::GameModeFinish(local_16, local_20);
            return;
        }
        if (RD.GetTeam2RoundWins() >= local_3)
        {
            TArray<int> local_16;
            local_16.Add(2);
            TArray<int> local_20;
            local_20.Add(1);
            Super::GameModeFinish(local_16, local_20);
            return;
        }
        int local_305 = int(Super::GetPVPFlowSettings().TDMRoundIntermissionSeconds);
        RD.SetRoundStage(EPVPTDMRoundStage(2));
        RD.SetRoundIntermissionEndTime((ECS::GetContextTime() + FFPTime(local_305)));
        this.SetAllPlayerInputEnabled(false);
        return;
    }
    void TickRoundIntermission(FCS_PVP_TDM_RoundData &inout RD) const
    {
        if (ECS::GetContextTime().opCmp(RD.GetRoundIntermissionEndTime()) >= 0)
        {
            this.BeginNewRound();
        }
        return;
    }
    void RecordPendingDeathStats() const
    {
        int local_126;
        int local_146;
        FECSRuntimeView local_40 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        Include local_48;
        local_48.opCall();
        FECSRuntimeViewIterator local_82 = local_40.Iterator();
        for (; local_82.CanProceed;)
        {
            const FECSEntity& local_120 = local_82.Proceed();
            for (auto& local_140 : local_126.GetAllPlayerPawnEntities())
            {
                if (local_140.IsValid())
                {
                    this.RecordSinglePawnDeathIfNeeded(local_120, local_140);
                }
            }
        }
        FECSWorldPtr local_20 = ECS::GetECSWorld();
        for (auto& local_164 : local_146.GetBotPlayerEntities())
        {
            local_164;
            if (IsValid())
            {
                this.RecordSinglePawnDeathIfNeeded(Super::GetStatKeyForPawn());
            }
        }
        return;
    }
    void RecordSinglePawnDeathIfNeeded(const FECSEntity &inout StatKey, const FECSEntity &inout Pawn) const
    {
        Has local_4;
        int local_26 = 0;
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
        int local_12 = Super::GetPawnTeam(Pawn);
        if (local_12 == 0)
        {
            return;
        }
        FECSWorldPtr local_16 = ECS::GetECSWorld();
        Has local_20;
        if (!(local_20.opCall()))
        {
            return;
        }
        FECSWorldPtr local_16_2 = ECS::GetECSWorld();
        if (local_26.GetPlayerScores().Contains(StatKey))
        {
            FGameModePlayerScoreDataBase& local_28 = local_26.GetModify_PlayerScores()[StatKey];
            local_28.SetDeaths((local_28.GetDeaths() + 1));
        }
        Has local_34;
        if (!(local_34.opCall()))
        {
            return;
        }
        Get local_40;
        FECSEntityId local_35 = FECSEntityId(local_40.opCall().GetKilledByEntity());
        if ((local_35 == ENTITY_ID_NULL))
        {
            return;
        }
        FECSEntity local_48 = FECSEntity(local_35);
        int local_11 = Super::GetPawnTeam(local_48);
        if ((local_11 == 0 || (local_11 == local_12)))
        {
            return;
        }
        FECSEntity local_44 = Super::GetStatKeyForPawn(local_48);
        if ((local_44.GetId() == StatKey.GetId()))
        {
            return;
        }
        if (local_26.GetPlayerScores().Contains(local_44))
        {
            FGameModePlayerScoreDataBase& local_28_2 = local_26.GetModify_PlayerScores()[local_44];
            local_28_2.SetKills((local_28_2.GetKills() + 1));
        }
        Super::BroadcastKillHint(local_44, StatKey);
        return;
    }
    void SetAllPlayerInputEnabled(const bool bEnabled) const
    {
        int local_126;
        Has local_144;
        FECSRuntimeView local_40 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
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
}

