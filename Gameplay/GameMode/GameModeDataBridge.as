

struct FPVPLobbyPlayerEntry
{
    UPROPERTY()
    uint8 TeamID = false;
    UPROPERTY()
    int PlayerInTeamIndex = -1;
    UPROPERTY()
    bool bWantsBackToRoom = false;
    UPROPERTY()
    bool bIsBot = false;


}

namespace FGameModeDataBridge
{
bool HasPVPLobbyData(const FECSWorldPtr &inout World)
{
    if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
    {
        Has local_6;
        return local_6.opCall();
    }
    Has local_10;
    return local_10.opCall();
}
uint GetPVPHostPlayerUID(const FECSWorldPtr &inout World)
{
    if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
    {
        Has local_6;
        if (!(local_6.opCall()))
        {
            return 0;
        }
        Get local_12;
        return local_12.opCall().GetHostPlayerUID();
    }
    Has local_16;
    if (!(local_16.opCall()))
    {
        return 0;
    }
    Get local_20;
    return local_20.opCall().GetHostPlayerUID();
}
uint GetPVPMatchRoomID(const FECSWorldPtr &inout World)
{
    if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
    {
        Has local_6;
        if (!(local_6.opCall()))
        {
            return 0;
        }
        Get local_12;
        return local_12.opCall().GetMatchRoomID();
    }
    Has local_16;
    if (!(local_16.opCall()))
    {
        return 0;
    }
    Get local_20;
    return local_20.opCall().GetMatchRoomID();
}
EPVPGameRuleType GetPVPSelectedGameRule(const FECSWorldPtr &inout World)
{
    if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
    {
        Has local_6;
        if (!(local_6.opCall()))
        {
            return EPVPGameRuleType(1);
        }
        Get local_12;
        return local_12.opCall().GetSelectedGameRuleType();
    }
    Has local_16;
    if (!(local_16.opCall()))
    {
        return EPVPGameRuleType(1);
    }
    Get local_20;
    return local_20.opCall().GetSelectedGameRuleType();
}
bool GetPVPLobbyPlayerEntries(const FECSWorldPtr &inout World, TMap<uint, FPVPLobbyPlayerEntry> &inout OutEntries)
{
    int local_18 = 0;
    int local_58;
    OutEntries.Empty(0);
    if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
    {
        int local_24;
        Has local_10;
        Has local_6;
        if (!(local_6.opCall()) || !(local_10.opCall()))
        {
            return false;
        }
        for (auto& local_42 : local_24.GetPlayerMatchDatas())
        {
            FPVPLobbyPlayerEntry local_46;
            int local_47 = GetTeamID();
            local_46.TeamID = (local_47 != 0);
            local_46.PlayerInTeamIndex = GetPlayerInTeamIndex();
            if (local_18.GetPlayerExtras().Contains(local_42.GetKey()))
            {
                local_46.bWantsBackToRoom = local_18.GetPlayerExtras()[local_42.GetKey()].GetbWantsBackToRoom();
                local_46.bIsBot = local_18.GetPlayerExtras()[local_42.GetKey()].GetbIsBot();
            }
            OutEntries.Add(local_42.GetKey(), local_46);
        }
        return true;
    }
    Has local_52;
    if (!(local_52.opCall()))
    {
        return false;
    }
    for (auto& local_76 : local_58.GetPlayerMatchDatas())
    {
        FPVPLobbyPlayerEntry local_46;
        int local_47_2 = GetTeamID();
        local_46.TeamID = (local_47_2 != 0);
        local_46.PlayerInTeamIndex = GetPlayerInTeamIndex();
        local_46.bWantsBackToRoom = GetbWantsBackToRoom();
        local_46.bIsBot = GetbIsBot();
        OutEntries.Add(local_76.GetKey(), local_46);
    }
    return true;
}
int GetMaxPlayersPerTeam(const FECSWorldPtr &inout World)
{
    Has local_4;
    int local_12 = 0;
    if (!(local_4.opCall()))
    {
        return 5;
    }
    if (!(local_12.GameModeFlowSettings.IsValid()))
    {
        return 5;
    }
    return FInstancedStruct::Get<FGameModeFlowSettings>(local_12.GameModeFlowSettings).opCall().MaxPlayersPerTeam;
}
int GetMaxTeamCount(const FECSWorldPtr &inout World)
{
    Has local_4;
    int local_12 = 0;
    if (!(local_4.opCall()))
    {
        return 2;
    }
    if (!(local_12.GameModeFlowSettings.IsValid()))
    {
        return 2;
    }
    Get local_16;
    return local_16.opCall().MaxTeamCount;
}
float32 GetPVPPlayerDamageDealt(const FECSWorldPtr &inout World, const FECSEntity &inout PlayerEntity)
{
    int local_14 = 0;
    int local_24 = 0;
    int local_34 = 0;
    if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
    {
        Has local_6;
        if (!(local_6.opCall()))
        {
            return 0.0f;
        }
        if (local_14.GetPlayerScores().Contains(PlayerEntity))
        {
            return local_14.GetPlayerScores()[PlayerEntity].GetDamageDealt();
        }
        return 0.0f;
    }
    Has local_18;
    bool local_1 = local_18.opCall();
    if (local_1)
    {
        if (local_24.GetPlayerStatMap().Contains(PlayerEntity))
        {
            return local_24.GetPlayerStatMap()[PlayerEntity].GetDamageDealt();
        }
    }
    Has local_28;
    bool local_1_2 = local_28.opCall();
    if (local_1_2)
    {
        if (local_34.GetPlayerStatMap().Contains(PlayerEntity))
        {
            return local_34.GetPlayerStatMap()[PlayerEntity].GetDamageDealt();
        }
    }
    return 0.0f;
}
float32 GetPVPPlayerDamageTaken(const FECSWorldPtr &inout World, const FECSEntity &inout PlayerEntity)
{
    int local_14 = 0;
    int local_24 = 0;
    int local_34 = 0;
    if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
    {
        Has local_6;
        if (!(local_6.opCall()))
        {
            return 0.0f;
        }
        if (local_14.GetPlayerScores().Contains(PlayerEntity))
        {
            return local_14.GetPlayerScores()[PlayerEntity].GetDamageTaken();
        }
        return 0.0f;
    }
    Has local_18;
    bool local_1 = local_18.opCall();
    if (local_1)
    {
        if (local_24.GetPlayerStatMap().Contains(PlayerEntity))
        {
            return local_24.GetPlayerStatMap()[PlayerEntity].GetDamageTaken();
        }
    }
    Has local_28;
    bool local_1_2 = local_28.opCall();
    if (local_1_2)
    {
        if (local_34.GetPlayerStatMap().Contains(PlayerEntity))
        {
            return local_34.GetPlayerStatMap()[PlayerEntity].GetDamageTaken();
        }
    }
    return 0.0f;
}
TMap<FECSEntity, FPVX_PlayerData> GetPVXPlayerInfoMap(const FECSWorldPtr &inout World)
{
    int local_60;
    FString local_136;
    int local_148 = 0;
    if (!(FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool()))
    {
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            Get local_10;
            return local_10.opCall().GetPlayerInfoMap();
        }
        return TMap<FECSEntity, FPVX_PlayerData>();
    }
    TMap<FECSEntity, FPVX_PlayerData> local_50;
    Has local_54;
    if (!(local_54.opCall()))
    {
        return local_50;
    }
    for (auto& local_78 : local_60.GetPlayerProgressMap())
    {
        FPVX_PlayerData local_130;
        local_130.SetLevel(GetLevel());
        local_130.SetLastEvolveLevel_Boss(GetLastEvolveLevel_Boss());
        local_130.SetExp(GetExp());
        local_130.SetScore(GetScore());
        local_130.SetbInLevelProtect(GetbInLevelProtect());
        local_130.SetTeamId(GetTeamId());
        local_130.SetPlayerInTeamIndex(GetPlayerInTeamIndex());
        local_136.GetPlayerName();
        local_130.SetPlayerName(local_136);
        local_130.SetPlayerUID(GetPlayerUID());
        local_130.SetPlayerAvatarID(GetPlayerAvatarID());
        local_130.SetPlayerDivineSkillID(GetPlayerDivineSkillID());
        local_130.SetCurrencyAmount(GetCurrencyAmount());
        local_130.SetLastOverrideAttributeData(GetLastOverrideAttributeData());
        local_130.SetPendingSettlementEvents(GetPendingSettlementEvents());
        local_130.SetFinalState(GetFinalState());
        Has local_142;
        bool local_1_2 = local_142.opCall();
        if (local_1_2)
        {
            if (local_148.GetPlayerScores().Contains(local_78.GetKey()))
            {
                local_130.SetKills(local_148.GetPlayerScores()[local_78.GetKey()].GetKills());
                local_130.SetDeaths(local_148.GetPlayerScores()[local_78.GetKey()].GetDeaths());
                local_130.SetAssists(local_148.GetPlayerScores()[local_78.GetKey()].GetAssists());
            }
        }
        local_50.Add(local_78.GetKey(), local_130);
    }
    return local_50;
}
FFPTime GetPVXMissionEndTime(const FECSWorldPtr &inout World)
{
    if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
    {
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            Get local_10;
            return local_10.opCall().GetMatchEndTime();
        }
        return FFPTime();
    }
    Has local_16;
    bool local_1_2 = local_16.opCall();
    if (local_1_2)
    {
        Get local_20;
        return local_20.opCall().GetMissionEndTime();
    }
    return FFPTime();
}
int GetPVXWinnerTeamId(const FECSWorldPtr &inout World)
{
    int local_12 = 0;
    if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
    {
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            if (local_12.GetWinnerTeamIds().Num() > 0)
            {
                return local_12.GetWinnerTeamIds()[0];
            }
        }
        return -1;
    }
    Has local_18;
    bool local_1_2 = local_18.opCall();
    if (local_1_2)
    {
        Get local_22;
        return local_22.opCall().GetWinnerTeamId();
    }
    return -1;
}
EFaction GetPVXPlayerFaction(const FECSWorldPtr &inout World, const FECSEntity &inout PlayerEntity)
{
    bool local_1;
    int local_12 = 0;
    int local_15;
    if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
    {
        Has local_6;
        local_1 = local_6.opCall();
        if (local_1)
        {
            if (local_12.GetPlayerProgressMap().Contains(PlayerEntity))
            {
                if ((local_12.GetPlayerProgressMap()[PlayerEntity].GetTeamId()) == 4)
                {
                    local_15 = EFaction(6);
                }
                else
                {
                    local_15 = EFaction(1);
                }
                return EFaction(local_15);
            }
        }
        return EFaction(1);
    }
    if (!(PlayerEntity.IsValid()))
    {
        local_1 = false;
    }
    else
    {
        Has local_20;
        local_1 = local_20.opCall();
    }
    if (local_1)
    {
        Get local_26;
        return local_26.opCall().GetFaction();
    }
    return EFaction(1);
}
FBuffConfigRef GetPVXMonsterPowerBuffConfig(const FECSWorldPtr &inout World)
{
    if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
    {
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            Get local_10;
            return local_10.opCall().GetMonsterPowerBuffConfig();
        }
        return FBuffConfigRef();
    }
    Has local_38;
    bool local_1_2 = local_38.opCall();
    if (local_1_2)
    {
        Get local_42;
        return local_42.opCall().GetMonsterPowerBuffConfig();
    }
    return FBuffConfigRef();
}
bool GetPVXMatchPlayerEntries(const FECSWorldPtr &inout World, TMap<uint, FPVX_MatchPlayerEntry> &inout OutEntries)
{
    int local_20;
    OutEntries.Empty(0);
    if (!(FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool()))
    {
        Has local_6;
        if (!(local_6.opCall()))
        {
            return false;
        }
        Get local_10;
        OutEntries = local_10.opCall().GetPlayerEntries();
        return true;
    }
    Has local_14;
    if (!(local_14.opCall()))
    {
        return false;
    }
    for (auto& local_38 : local_20.GetPlayerMatchDatas())
    {
        FPVX_MatchPlayerEntry local_46;
        local_46.SetUid(GetUID());
        local_46.SetTeamId(GetTeamID());
        local_46.SetPlayerInTeamIndex(GetPlayerInTeamIndex());
        local_46.SetFaction(GetFaction());
        local_46.SetBossPrefabIdx(GetBossPrefabIdx());
        local_46.SetPlayerPrefabIdx(GetPlayerPrefabIdx());
        OutEntries.Add(local_38.GetKey(), local_46);
    }
    return true;
}
FFPTime GetPVXSelectRoleEndTime(const FECSWorldPtr &inout World)
{
    if (!(FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool()))
    {
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            Get local_10;
            return local_10.opCall().GetSelectRoleEndTime();
        }
        return FFPTime();
    }
    Has local_16;
    bool local_1_2 = local_16.opCall();
    if (local_1_2)
    {
        Get local_20;
        return local_20.opCall().GetSelectRoleEndTime();
    }
    return FFPTime();
}
FFPTime GetPVXSelectRoleTotalTime(const FECSWorldPtr &inout World)
{
    if (!(FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool()))
    {
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            Get local_10;
            return local_10.opCall().GetSelectRoleTotalTime();
        }
        return FFPTime();
    }
    Has local_16;
    bool local_1_2 = local_16.opCall();
    if (local_1_2)
    {
        Get local_20;
        return local_20.opCall().GetSelectRoleTotalTime();
    }
    return FFPTime();
}
TArray<int> GetGameModeWinnerTeamIds(const FECSWorldPtr &inout World)
{
    Get local_26;
    if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
    {
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            Get local_10;
            return local_10.opCall().GetWinnerTeamIds();
        }
        return TArray<int>();
    }
    TArray<int> local_18;
    Has local_22;
    if (local_22.opCall() && (local_26.opCall().GetWinnerTeamId() != 0))
    {
        local_18.Add(local_26.opCall().GetWinnerTeamId());
    }
    else
    {
        Get local_38;
        Has local_34;
        if (local_34.opCall() && (local_38.opCall().GetMatchWinnerTeamId() != 0))
        {
            local_18.Add(local_38.opCall().GetMatchWinnerTeamId());
        }
        else
        {
            Get local_46;
            Has local_42;
            if (local_42.opCall() && (local_46.opCall().GetWinnerTeamId() >= 0))
            {
                local_18.Add(local_46.opCall().GetWinnerTeamId());
            }
        }
    }
    return local_18;
}
FFPTime GetGameModeFinishStartTime(const FECSWorldPtr &inout World)
{
    if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
    {
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            Get local_10;
            return local_10.opCall().GetFinishStartTime();
        }
        return FFPTime();
    }
    Has local_16;
    bool local_1_2 = local_16.opCall();
    if (local_1_2)
    {
        Get local_20;
        return local_20.opCall().GetFinishStartTime();
    }
    Has local_24;
    local_1_2 = local_24.opCall();
    if (local_1_2)
    {
        Get local_28;
        return local_28.opCall().GetFinishStartTime();
    }
    return FFPTime();
}
FFPTime GetGameModeMatchStartTime(const FECSWorldPtr &inout World)
{
    if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
    {
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            Get local_10;
            return local_10.opCall().GetMatchStartTime();
        }
        return FFPTime();
    }
    Has local_16;
    bool local_1_2 = local_16.opCall();
    if (local_1_2)
    {
        Get local_20;
        return local_20.opCall().GetMatchStartTime();
    }
    return FFPTime();
}
FFPTime GetGameModeMatchEndTime(const FECSWorldPtr &inout World)
{
    if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
    {
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            Get local_10;
            return local_10.opCall().GetMatchEndTime();
        }
        return FFPTime();
    }
    Has local_16;
    bool local_1_2 = local_16.opCall();
    if (local_1_2)
    {
        Get local_20;
        return local_20.opCall().GetMatchEndTime();
    }
    return FFPTime();
}
}
