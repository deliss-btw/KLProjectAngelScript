
namespace PVXSettlementEventNames
{
    const FName LevelEvent_PVXBossDeath = n"PVXBossDeath";
    const FName LevelEvent_PVXPlayerDeath = n"PVXPlayerDeath";
    const FName LevelEvent_PVXFinish = n"PVXFinish";
    const FName LevelEvent_PVXDefeat = n"PVXDefeat";
    const FName ExpMultiplierUpdate = n"PVX_EXP_MULTIPLIER_UPDATE";
    const FName LevelEvent_PVXHelpMonsterHurt = n"PVXHelpMonsterHurt";
    const FName LevelEvent_PVXDoomHeartInteract = n"PVXDoomHeartInteract";
    const FName LevelEvent_PVXPrepareFinished = n"PVXPrepareFinished";
    const FName RewardEvent_PVX_BossAim = n"RewardEvent_PVX_BossAim";
    const FName RewardEvent_PVX_Death = n"RewardEvent_PVX_Death";
    const FName RewardEvent_PVX_Success = n"RewardEvent_PVX_Success";
    const FName RewardEvent_PVX_Defeat = n"RewardEvent_PVX_Defeat";
}
namespace PVXGameModeUtils
{
    const FConsoleVariable CVar_PVX_AllowPartialRosterAndLateJoin = FConsoleVariable();

}
namespace PVXSettlementEventUtils
{
bool IsValidEvent(const FPVXGameModeFlowSettings &inout FlowSettings, const FName &inout EventName)
{
    return true;
}
void SetPlayerFinalState(const FECSEntity &inout PlayerEntity, const EPVXPlayerFinalState State, const EPVXPlayerFinishReason FinishReason)
{
    int local_14 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    if (!(local_6.opCall()))
    {
        return;
    }
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    if (local_14.GetPlayerProgressMap().Contains(PlayerEntity))
    {
        local_14.GetModify_PlayerProgressMap()[PlayerEntity].SetFinalState();
        local_14.GetModify_PlayerProgressMap()[PlayerEntity].SetFinishReason();
    }
    return;
}
void SetPlayerProgressDataFinalState(FPVX_PlayerProgressData &inout PlayerProgressData, const EPVXPlayerFinalState State, const EPVXPlayerFinishReason FinishReason)
{
    PlayerProgressData.SetFinalState(EPVXPlayerFinalState(State));
    PlayerProgressData.SetFinishReason(EPVXPlayerFinishReason(FinishReason));
    return;
}
bool TrySendPendingSettlementEvent(const FECSEntity &inout SenderEntity, const FPVXGameModeFlowSettings &inout FlowSettings, const FName &inout EventName)
{
    int local_20 = 0;
    if (!(PVXSettlementEventUtils::IsValidEvent(FlowSettings, EventName)))
    {
        XError(ELog(22), FString().Append("TrySendPendingSettlementEvent: invalid event '").Append(EventName).Append("'"));
        return false;
    }
    FECSWorldPtr local_10 = ECS::GetECSWorld();
    Has local_14;
    bool local_1 = local_14.opCall();
    if (local_1)
    {
        FECSWorldPtr local_10_2 = ECS::GetECSWorld();
        if (local_20.GetPlayerProgressMap().Contains(SenderEntity))
        {
            FPVX_PlayerProgressData& local_22 = local_20.GetModify_PlayerProgressMap()[SenderEntity];
            local_22.GetModify_PendingSettlementEvents().Add(EventName);
        }
    }
    return true;
}
void TrySendPendingSettlementEventToTeam(const int TeamId, const FPVXGameModeFlowSettings &inout FlowSettings, const FName &inout EventName)
{
    int local_14;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    if (!(local_6.opCall()))
    {
        return;
    }
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    for (auto& local_32 : local_14.GetPlayerProgressMap())
    {
        if (GetTeamId() == TeamId)
        {
            PVXSettlementEventUtils::TrySendPendingSettlementEvent(FECSEntity(local_32.GetKey()), FlowSettings, EventName);
        }
    }
    return;
}
}
namespace PVXGameModeUtils
{
FPVXGameModeFlowSettings GetFlowSettings()
{
    FPVXGameModeFlowSettings __r;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    return __r;
}
int GetLevelRequiredExp(const int CurLevel, const EFaction Faction)
{
    FPVXGameModeFlowSettings local_418 = PVXGameModeUtils::GetFlowSettings();
    TArray<FPVX_LevelExpConfig> local_840;
    if (int(Faction) == 6)
    {
        local_418.LevelExpDataTable_Boss.GetAllRows(local_840);
    }
    else
    {
        local_418.LevelExpDataTable.GetAllRows(local_840);
    }
    for (auto& local_858 : local_840)
    {
        if (int(local_858.Level) == CurLevel)
        {
            return int(local_858.Exp);
        }
    }
    return -1;
}
int GetLevelByExp(const int Exp, const EFaction Faction)
{
    FPVXGameModeFlowSettings local_418 = PVXGameModeUtils::GetFlowSettings();
    int local_837 = 1;
    TArray<FPVX_LevelExpConfig> local_842;
    if (int(Faction) == 6)
    {
        local_418.LevelExpDataTable_Boss.GetAllRows(local_842);
    }
    else
    {
        local_418.LevelExpDataTable.GetAllRows(local_842);
    }
    for (auto& local_858 : local_842)
    {
        if ((int(local_858.Exp) <= Exp && (int(local_858.Level) > local_837)))
        {
            local_837 = int(local_858.Level);
        }
    }
    return local_837;
}
FGameplayTag GetEntityTeamTag(const FECSEntity &inout Entity)
{
    int local_16 = 0;
    int local_17;
    if (!(Entity.IsValid()))
    {
        return FGameplayTag();
    }
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    Has local_10;
    if (!(local_10.opCall()))
    {
        return FGameplayTag();
    }
    FECSWorldPtr local_6_2 = ECS::GetECSWorld();
    if (!(local_16.GetPlayerProgressMap().Contains(Entity)))
    {
        return FGameplayTag();
    }
    local_17 = local_16.GetPlayerProgressMap()[Entity].GetTeamId();
    if (local_17 == 4)
    {
        return PVXUtil::TeamBossTag;
    }
    switch (local_17)
    {
    case 0:
    {
        return PVXUtil::Team1Tag;
    }
    case 1:
    {
        return PVXUtil::Team2Tag;
    }
    case 2:
    {
        return PVXUtil::Team3Tag;
    }
    case 3:
    {
        return PVXUtil::Team4Tag;
    }
    }
    return FGameplayTag();
}
UFUNCTION()
bool GetPVXPlayerProgressData(const FECSEntity &inout PlayerEntity, FPVX_PlayerProgressData &out OutData)
{
    FPVX_PlayerProgressData local_48;
    int local_62 = 0;
    OutData = local_48;
    FECSWorldPtr local_50 = ECS::GetECSWorld();
    Has local_54;
    if (!(local_54.opCall()))
    {
        return false;
    }
    FECSWorldPtr local_50_2 = ECS::GetECSWorld();
    if (!(local_62.GetPlayerProgressMap().Contains(PlayerEntity)))
    {
        return false;
    }
    OutData = local_62.GetPlayerProgressMap()[PlayerEntity];
    return true;
}
EPVXPlayerFinishReason GetPlayerFinishReasonFromWorld(const EPVXPlayerFinishReason Reason, const bool bIsWinner)
{
    int local_3;
    int local_1 = int(Reason);
    if (local_1 <= 2)
    {
        if (local_1 != 1)
        {
            if (local_1 != 2)
            {
            }
        }
        else
        {
            if (bIsWinner)
            {
                local_3 = 1;
            }
            else
            {
                local_3 = 2;
            }
            return EPVXPlayerFinishReason(local_3);
        }
    }
    return Reason;
}
EFaction GetPVXCampFromMatchData(const FECSEntity &inout PlayerEntity)
{
    int local_14 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    if (!(local_6.opCall()))
    {
        return EFaction(0);
    }
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    int local_16 = FASCommonUtils::GetPlayerUidFromPlayerEntity(PlayerEntity);
    if (!(local_14.GetPlayerMatchDatas().Contains(local_16)))
    {
        return EFaction(0);
    }
    return local_14.GetPlayerMatchDatas()[local_16].GetFaction();
}
void SendPVXEndDataTrack(const FECSEntity &inout PlayerEntity)
{
    FPbPlayerLogDsPvxEnd local_10;
    int local_24 = 0;
    Has local_34;
    int local_40 = 0;
    FECSWorldPtr local_12 = ECS::GetECSWorld();
    Has local_16;
    bool local_17 = local_16.opCall();
    if (local_17)
    {
        FECSWorldPtr local_12_2 = ECS::GetECSWorld();
        if (local_24.GetPlayerProgressMap().Contains(PlayerEntity))
        {
            const FPVX_PlayerProgressData& local_26 = local_24.GetPlayerProgressMap()[PlayerEntity];
            local_10.SetPvxTeamId(local_26.GetTeamId());
            local_10.SetCamp(int(PVXGameModeUtils::GetPVXCampFromMatchData(PlayerEntity)));
            local_10.SetPvxLevel(FMath::Max(0, local_26.GetLevel()));
            local_10.SetPvxExp(FMath::Max(0, local_26.GetExp()));
            FECSWorldPtr local_12_3 = ECS::GetECSWorld();
            bool local_17_2 = local_34.opCall();
            if (local_17_2)
            {
                FECSWorldPtr local_12_4 = ECS::GetECSWorld();
                local_10.SetResult((local_40.GetWinnerTeamIds().Contains(local_26.GetTeamId()) ? 1 : 2));
            }
            local_10.SetStatus(int(local_26.GetFinalState()));
            local_10.SetReason(int(local_26.GetFinishReason()));
        }
    }
    FECSWorldPtr local_12_5 = ECS::GetECSWorld();
    bool local_17_3 = local_34.opCall();
    if (local_17_3)
    {
        FECSWorldPtr local_12_6 = ECS::GetECSWorld();
        if (local_40.GetPlayerScores().Contains(PlayerEntity))
        {
            const FGameModePlayerScoreDataBase& local_44 = local_40.GetPlayerScores()[PlayerEntity];
            FPbPlayerLogDsPvxKda local_54 = local_10.AddKda();
            local_54.SetKillNum(FMath::Max(0, local_44.GetKills()));
            local_54.SetDeathNum(FMath::Max(0, local_44.GetDeaths()));
            local_54.SetAssistNum(FMath::Max(0, local_44.GetAssists()));
        }
        FFPTime local_68 = ECS::GetContextTime();
        if (local_40.GetMatchEndTime().ToSeconds() > 0.0 && (local_68.opCmp(local_40.GetMatchEndTime()) > 0))
        {
            local_68 = local_40.GetMatchEndTime();
        }
        local_10.SetDuration(uint((FMath::Max(0.0f, float32(((local_68 - local_40.GetMatchStartTime()).ToSeconds()))))));
    }
    Has local_82;
    if (local_82.opCall())
    {
        FC_PVX_SettlementReward local_88;
        for (auto& local_102 : local_88.RewardEntries)
        {
            FPbPlayerLogDsPvxRewardEntry local_112 = local_10.AddRewardList();
            local_112.SetRewardId(int(local_102.RewardId));
            local_112.SetNum(int(local_102.Num));
        }
        local_10.SetRewardCurrencyAmount(int(local_88.RewardCurrencyAmount));
        Remove local_126;
        local_126.opCall();
    }
    ServerDataTrackerHelper::LogProtoMessage3WithPlayer(PlayerEntity, 103800, local_10.ToWrapper());
    return;
}
void SendPVXExpChangeDataTrack(const FECSEntity &inout PlayerEntity, const FECSEntity &inout SourceEntity, const int BeforeExp, const int AfterExp, const EPVXExpChangeReason Reason)
{
    FPbPlayerLogDsPvxExpChange local_10;
    int local_30 = 0;
    int local_34 = 0;
    int local_160 = 0;
    float local_13 = (AfterExp - BeforeExp);
    float32 local_11 = float32(local_13);
    local_10.SetIsAdd((local_11 >= 0.0f));
    int local_15 = uint(FMath::Abs(local_11));
    local_10.SetChangeValue(local_15);
    local_10.SetCamp(int(PVXGameModeUtils::GetPVXCampFromMatchData(PlayerEntity)));
    local_10.SetReason(int(Reason));
    FECSWorldPtr local_20 = ECS::GetECSWorld();
    Has local_24;
    if (local_24.opCall())
    {
        FECSWorldPtr local_20_2 = ECS::GetECSWorld();
        if (local_30.GetPlayerProgressMap().Contains(PlayerEntity))
        {
            const FPVX_PlayerProgressData& local_32 = local_30.GetPlayerProgressMap()[PlayerEntity];
            local_10.SetPvxExp(FMath::Max(0, AfterExp));
            local_10.SetPvxLevel(FMath::Max(0, local_32.GetLevel()));
            local_34 = FMath::Max(0, BeforeExp);
            local_10.SetBeforeExp(local_34);
        }
    }
    if (SourceEntity.IsValid())
    {
        Has local_38;
        if (local_38.opCall())
        {
            local_10.SetSourceEntityType(1);
            Get local_42;
            FECSEntity local_46 = local_42.opCall().GetPlayerEntity();
            EFaction local_16 = PVXGameModeUtils::GetPVXCampFromMatchData(local_46);
            if (int(local_16) == 1)
            {
                if (GetAvatarConfig(SourceEntity))
                {
                    local_10.SetSourceEntityId(local_15);
                }
            }
            else
            {
                if (int(local_16) == 6)
                {
                    TDataObjectPtr<FMonsterPrefabConfig> local_120 = GetMonsterConfig(SourceEntity);
                    if (local_120)
                    {
                        local_10.SetSourceEntityBossKey(local_120.GetDataName().ToString());
                    }
                }
            }
            local_10.SetSourceEntitySessionId(FASCommonUtils::GetPlayerUidFromPlayerEntity(local_46));
        }
        else
        {
            Has local_154;
            if (local_154.opCall())
            {
                local_10.SetSourceEntityType(2);
                if (local_160.GetMonsterConfig())
                {
                    local_10.SetSourceEntityId(local_34);
                }
                local_10.SetSourceEntitySessionId(SourceEntity.GetId());
            }
        }
    }
    ServerDataTrackerHelper::LogProtoMessage3WithPlayer(PlayerEntity, 103801, local_10.ToWrapper());
    return;
}
}
