

// NOTE: class defaults are not authored in this module: FPVPBrawlGameModeFlowSettings (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

struct FPVPBrawlGameModeFlowSettings : FGameModeFlowSettings
{
    FGameModeFlowSettings _base_FGameModeFlowSettings;

    FPVPBrawlGameModeFlowSettings()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

class UPVPBrawlGameModeFlow : UPVPGameModeFlowBase
{
    UPVPBrawlGameModeFlow()
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
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void OnTickPlaying(const FCS_GameModeProfile &inout Profile) const
    {
        int local_8 = 0;
        int local_24 = 0;
        Super::CleanupDisconnectedPlayers();
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (local_8.GetbInPrepStage())
        {
            this.TickPrepStage(local_8);
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Has local_14;
        bool local_9 = local_14.opCall();
        if (!(local_9))
        {
            local_9 = false;
        }
        else
        {
            FECSWorldPtr local_2_3 = ECS::GetECSWorld();
            Get local_18;
            local_9 = (local_18.opCall().GetWinnerTeamIds().Num() > 0);
        }
        if (local_9)
        {
            return;
        }
        this.RespawnDeadBots();
        FECSWorldPtr local_2_4 = ECS::GetECSWorld();
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_5 = ECS::GetECSWorld();
        FFPTime local_26 = FFPTime(local_24.GetMatchEndTime());
        if (local_26.opCmp(local_24.GetMatchStartTime()) > 0 && ((ECS::GetContextTime().opCmp(local_24.GetMatchEndTime()) > 0)))
        {
            int local_27 = 0;
            if (local_8.GetTeam1Kills() > local_8.GetTeam2Kills())
            {
                local_27 = 1;
            }
            else
            {
                local_27 = local_8.GetTeam2Kills() > local_8.GetTeam1Kills() ? 2 : -1;
            }
            TArray<int> local_32;
            local_32.Add(local_27);
            TArray<int> local_36;
            if (local_27 > 0)
            {
                int local_19 = local_27 == 1 ? 2 : 1;
                local_36.Add(local_19);
            }
            Super::GameModeFinish(local_32, local_36);
            Super::ReviveAllDeadPlayersAndBots();
        }
        return;
    }
    void OnHandleDeath(const FCS_GameModeProfile &inout Profile, FCE_DeathEvent &inout Event) const
    {
        int local_24 = 0;
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
        FECSWorldPtr local_2_3 = ECS::GetECSWorld();
        Has local_28;
        bool local_10 = local_28.opCall();
        if (!(local_10))
        {
            local_10 = false;
        }
        else
        {
            FECSWorldPtr local_2_4 = ECS::GetECSWorld();
            Get local_32;
            local_10 = (local_32.opCall().GetWinnerTeamIds().Num() > 0);
        }
        local_10 = local_10 || local_24.GetbInPrepStage();
        if (local_10)
        {
            return;
        }
        FECSEntity local_38 = FECSEntity(Event.KilledByEntity);
        int local_15 = Super::GetPawnTeam(local_38);
        if ((local_15 == 0 || (local_15 == local_16)))
        {
            return;
        }
        FECSEntity local_42 = Super::GetStatKeyForPawn(local_38);
        FECSEntity local_48 = Super::GetStatKeyForPawn(local_14);
        if ((local_42.GetId() == local_48.GetId()))
        {
            return;
        }
        Super::BroadcastKillHint(local_42, local_48);
        if (local_15 == 1)
        {
            local_24.SetTeam1Kills((local_24.GetTeam1Kills() + 1));
        }
        else
        {
            if (local_15 == 2)
            {
                local_24.SetTeam2Kills((local_24.GetTeam2Kills() + 1));
            }
        }
        int local_56 = local_24.GetKillScoreLimit() > 0 ? local_24.GetKillScoreLimit() : 30;
        int local_57 = 0;
        if (local_24.GetTeam1Kills() >= local_56)
        {
            local_57 = 1;
        }
        else
        {
            if (local_24.GetTeam2Kills() >= local_56)
            {
                local_57 = 2;
            }
        }
        if (local_57 != 0)
        {
            TArray<int> local_62;
            local_62.Add(local_57);
            TArray<int> local_66;
            int local_8_3 = local_57 == 1 ? 2 : 1;
            local_66.Add(local_8_3);
            Super::GameModeFinish(local_62, local_66);
        }
        return;
    }
    void TickPrepStage(FCS_PVP_TDM_ScoreData &inout Brawl) const
    {
        if (ECS::GetContextTime().opCmp(Brawl.GetPrepEndTime()) >= 0)
        {
            Brawl.SetbInPrepStage(false);
            FFPTime local_2 = FFPTime(-1);
            FECSWorldPtr local_6 = ECS::GetECSWorld();
            FFPTime local_2_2 = FFPTime(-1);
            FECSWorldPtr local_6_2 = ECS::GetECSWorld();
            SendEvent local_16;
            local_16.opCall(ENTITY_NULL, local_2_2);
            XLog(ELog(22), "Brawl prep ended, combat started");
        }
        return;
    }
    void RespawnDeadBots() const
    {
        int local_8 = 0;
        int local_22 = 0;
        int local_28 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (local_8.GetBotPlayerEntities().Num() == 0)
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_3 = ECS::GetECSWorld();
        FECSWorldPtr local_2_4 = ECS::GetECSWorld();
        Has local_54;
        Has local_58;
        for (auto& local_46 : local_8.GetBotPlayerEntities())
        {
            FECSEntity local_50;
            if (!(local_50.IsValid()))
            {
                continue;
            }
            if (!(local_54.opCall()) && !(local_58.opCall()))
            {
                continue;
            }
            if (!(local_28.GetPlayerMatchDatas().Contains(local_46.GetKey())))
            {
                continue;
            }
            Super::ReviveSinglePawn(local_50);
            Super::TeleportPawnToTeamSpawn(local_50, FECSEntity(), uint8((local_28.GetPlayerMatchDatas()[local_46.GetKey()].GetTeamID() + 1)), local_22);
        }
        return;
    }
}

