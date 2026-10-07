
namespace FVMS_PVP_TDM_HUD
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnBackToCityPressed = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnBackToRoomPressed = FEUIModelCallbackSignature();

}
struct FPVP_TDM_KDAEntry
{
    UPROPERTY()
    FString PlayerName;
    UPROPERTY()
    FString PlayerIdText;
    UPROPERTY()
    int Kills = 0;
    UPROPERTY()
    int Deaths = 0;
    UPROPERTY()
    int Assists = 0;
    UPROPERTY()
    int TeamId = 0;
    UPROPERTY()
    FText KDAText;
    UPROPERTY()
    bool bIsLocalPlayer = false;
    UPROPERTY()
    int DamageDealt = 0;
    UPROPERTY()
    int DamageTaken = 0;


}

struct FVMS_PVP_TDM_HUD : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    int m_Team1Kills;
    UPROPERTY()
    int m_Team2Kills;
    UPROPERTY()
    int m_KillScoreLimit;
    UPROPERTY()
    int m_WinnerTeamId;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_PVP_TDM_KDAListEntry>> m_Modify_KDAListEntries;
    UPROPERTY()
    TArray<FPVP_TDM_KDAEntry> m_Modify_AllPlayersKDA;
    UPROPERTY()
    bool m_bScoreboardVisible;
    UPROPERTY()
    int m_LocalPlayerKills;
    UPROPERTY()
    int m_LocalPlayerDeaths;
    UPROPERTY()
    int m_LocalPlayerAssists;
    UPROPERTY()
    FText m_LocalPlayerKDAText;
    UPROPERTY()
    int m_LocalPlayerTeamId;
    UPROPERTY()
    FText m_LocalPlayerTeamDisplayText;
    UPROPERTY()
    FText m_MatchRemainingTimeText;
    UPROPERTY()
    FFPTime m_MatchEndTime;
    UPROPERTY()
    bool m_bMatchEndResultVisible;
    UPROPERTY()
    FText m_MatchEndWinnerAnnouncementText;
    UPROPERTY()
    FText m_MatchEndMVPPlayerNameText;
    UPROPERTY()
    int m_MatchEndMVPKills;
    UPROPERTY()
    FText m_MatchEndMVPSummaryText;
    UPROPERTY()
    bool m_bLocalPlayerWonMatch;
    UPROPERTY()
    bool m_bMatchEndAutoHideArmed;
    UPROPERTY()
    FFPTime m_MatchEndAutoHideAt;
    UPROPERTY()
    FText m_BackToCityRemainTimeText;
    UPROPERTY()
    bool m_bBackToRoomVisible;
    UPROPERTY()
    bool m_bBackToCityPressed;
    UPROPERTY()
    bool m_bBackToRoomPressed;
    UPROPERTY()
    bool m_bSwitchAvatarPanelVisible;
    UPROPERTY()
    FEUIWidgetRef m_SwitchAvatarPanelPageHandle;
    UPROPERTY()
    bool m_bInBrawlPrepStage;
    UPROPERTY()
    FText m_BrawlPrepCountdownText;
    UPROPERTY()
    FText m_BrawlPrepStageText;
    UPROPERTY()
    FFPTime m_BrawlPrepEndTime;
    UPROPERTY()
    bool m_bIsBrawlMode;
    UPROPERTY()
    bool m_bIsTDMRoundMode;
    UPROPERTY()
    int m_CurrentRound;
    UPROPERTY()
    int m_Team1RoundWins;
    UPROPERTY()
    int m_Team2RoundWins;
    UPROPERTY()
    int m_RoundsToWin;
    UPROPERTY()
    FText m_RoundScoreText;
    UPROPERTY()
    FText m_RoundStageText;
    UPROPERTY()
    FText m_RoundCountdownText;
    UPROPERTY()
    FFPTime m_RoundStageEndTime;
    UPROPERTY()
    int m_RoundWinnerTeamId;
    UPROPERTY()
    FText m_RoundResultText;
    UPROPERTY()
    bool m_bRoundResultVisible;
    UPROPERTY()
    bool m_bRoundStageHintVisible;

    FVMS_PVP_TDM_HUD()
    {
        this.m_Team1Kills = 0;
        this.m_Team2Kills = 0;
        this.m_KillScoreLimit = 30;
        this.m_WinnerTeamId = 0;
        this.m_bScoreboardVisible = false;
        this.m_LocalPlayerKills = 0;
        this.m_LocalPlayerDeaths = 0;
        this.m_LocalPlayerAssists = 0;
        this.m_LocalPlayerTeamId = 0;
        this.m_bMatchEndResultVisible = false;
        this.m_MatchEndMVPKills = 0;
        this.m_bLocalPlayerWonMatch = false;
        this.m_bMatchEndAutoHideArmed = false;
        this.m_bBackToRoomVisible = false;
        this.m_bBackToCityPressed = false;
        this.m_bBackToRoomPressed = false;
        this.m_bSwitchAvatarPanelVisible = false;
        this.m_bInBrawlPrepStage = false;
        this.m_bIsBrawlMode = false;
        this.m_bIsTDMRoundMode = false;
        this.m_CurrentRound = 0;
        this.m_Team1RoundWins = 0;
        this.m_Team2RoundWins = 0;
        this.m_RoundsToWin = 3;
        this.m_RoundWinnerTeamId = 0;
        this.m_bRoundResultVisible = false;
        this.m_bRoundStageHintVisible = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_PVP_TDM_HUD(const FVMS_PVP_TDM_HUD &inout Other)
    {
        this.m_Team1Kills = 0;
        this.m_Team2Kills = 0;
        this.m_KillScoreLimit = 30;
        this.m_WinnerTeamId = 0;
        this.m_bScoreboardVisible = false;
        this.m_LocalPlayerKills = 0;
        this.m_LocalPlayerDeaths = 0;
        this.m_LocalPlayerAssists = 0;
        this.m_LocalPlayerTeamId = 0;
        this.m_bMatchEndResultVisible = false;
        this.m_MatchEndMVPKills = 0;
        this.m_bLocalPlayerWonMatch = false;
        this.m_bMatchEndAutoHideArmed = false;
        this.m_bBackToRoomVisible = false;
        this.m_bBackToCityPressed = false;
        this.m_bBackToRoomPressed = false;
        this.m_bSwitchAvatarPanelVisible = false;
        this.m_bInBrawlPrepStage = false;
        this.m_bIsBrawlMode = false;
        this.m_bIsTDMRoundMode = false;
        this.m_CurrentRound = 0;
        this.m_Team1RoundWins = 0;
        this.m_Team2RoundWins = 0;
        this.m_RoundsToWin = 3;
        this.m_RoundWinnerTeamId = 0;
        this.m_bRoundResultVisible = false;
        this.m_bRoundStageHintVisible = false;
        this.m_Team1Kills = int(Other.m_Team1Kills);
        this.m_Team2Kills = int(Other.m_Team2Kills);
        this.m_KillScoreLimit = int(Other.m_KillScoreLimit);
        this.m_WinnerTeamId = int(Other.m_WinnerTeamId);
        this.m_Modify_KDAListEntries = Other.m_Modify_KDAListEntries;
        this.m_Modify_AllPlayersKDA = Other.m_Modify_AllPlayersKDA;
        this.m_bScoreboardVisible = Other.m_bScoreboardVisible;
        this.m_LocalPlayerKills = int(Other.m_LocalPlayerKills);
        this.m_LocalPlayerDeaths = int(Other.m_LocalPlayerDeaths);
        this.m_LocalPlayerAssists = int(Other.m_LocalPlayerAssists);
        this.m_LocalPlayerKDAText = Other.m_LocalPlayerKDAText;
        this.m_LocalPlayerTeamId = int(Other.m_LocalPlayerTeamId);
        this.m_LocalPlayerTeamDisplayText = Other.m_LocalPlayerTeamDisplayText;
        this.m_MatchRemainingTimeText = Other.m_MatchRemainingTimeText;
        this.m_MatchEndTime = Other.m_MatchEndTime;
        this.m_bMatchEndResultVisible = Other.m_bMatchEndResultVisible;
        this.m_MatchEndWinnerAnnouncementText = Other.m_MatchEndWinnerAnnouncementText;
        this.m_MatchEndMVPPlayerNameText = Other.m_MatchEndMVPPlayerNameText;
        this.m_MatchEndMVPKills = int(Other.m_MatchEndMVPKills);
        this.m_MatchEndMVPSummaryText = Other.m_MatchEndMVPSummaryText;
        this.m_bLocalPlayerWonMatch = Other.m_bLocalPlayerWonMatch;
        this.m_bMatchEndAutoHideArmed = Other.m_bMatchEndAutoHideArmed;
        this.m_MatchEndAutoHideAt = Other.m_MatchEndAutoHideAt;
        this.m_BackToCityRemainTimeText = Other.m_BackToCityRemainTimeText;
        this.m_bBackToRoomVisible = Other.m_bBackToRoomVisible;
        this.m_bBackToCityPressed = Other.m_bBackToCityPressed;
        this.m_bBackToRoomPressed = Other.m_bBackToRoomPressed;
        this.m_bSwitchAvatarPanelVisible = Other.m_bSwitchAvatarPanelVisible;
        this.m_SwitchAvatarPanelPageHandle = Other.m_SwitchAvatarPanelPageHandle;
        this.m_bInBrawlPrepStage = Other.m_bInBrawlPrepStage;
        this.m_BrawlPrepCountdownText = Other.m_BrawlPrepCountdownText;
        this.m_BrawlPrepStageText = Other.m_BrawlPrepStageText;
        this.m_BrawlPrepEndTime = Other.m_BrawlPrepEndTime;
        this.m_bIsBrawlMode = Other.m_bIsBrawlMode;
        this.m_bIsTDMRoundMode = Other.m_bIsTDMRoundMode;
        this.m_CurrentRound = int(Other.m_CurrentRound);
        this.m_Team1RoundWins = int(Other.m_Team1RoundWins);
        this.m_Team2RoundWins = int(Other.m_Team2RoundWins);
        this.m_RoundsToWin = int(Other.m_RoundsToWin);
        this.m_RoundScoreText = Other.m_RoundScoreText;
        this.m_RoundStageText = Other.m_RoundStageText;
        this.m_RoundCountdownText = Other.m_RoundCountdownText;
        this.m_RoundStageEndTime = Other.m_RoundStageEndTime;
        this.m_RoundWinnerTeamId = int(Other.m_RoundWinnerTeamId);
        this.m_RoundResultText = Other.m_RoundResultText;
        this.m_bRoundResultVisible = Other.m_bRoundResultVisible;
        this.m_bRoundStageHintVisible = Other.m_bRoundStageHintVisible;
        return;
    }
    FVMS_PVP_TDM_HUD opAssign(const FVMS_PVP_TDM_HUD &inout Other)
    {
        FVMS_PVP_TDM_HUD __r;
        this.m_Team1Kills = int(Other.m_Team1Kills);
        this.m_Team2Kills = int(Other.m_Team2Kills);
        this.m_KillScoreLimit = int(Other.m_KillScoreLimit);
        this.m_WinnerTeamId = int(Other.m_WinnerTeamId);
        this.m_Modify_KDAListEntries = Other.m_Modify_KDAListEntries;
        this.m_Modify_AllPlayersKDA = Other.m_Modify_AllPlayersKDA;
        this.m_bScoreboardVisible = Other.m_bScoreboardVisible;
        this.m_LocalPlayerKills = int(Other.m_LocalPlayerKills);
        this.m_LocalPlayerDeaths = int(Other.m_LocalPlayerDeaths);
        this.m_LocalPlayerAssists = int(Other.m_LocalPlayerAssists);
        this.m_LocalPlayerKDAText = Other.m_LocalPlayerKDAText;
        this.m_LocalPlayerTeamId = int(Other.m_LocalPlayerTeamId);
        this.m_LocalPlayerTeamDisplayText = Other.m_LocalPlayerTeamDisplayText;
        this.m_MatchRemainingTimeText = Other.m_MatchRemainingTimeText;
        this.m_MatchEndTime = Other.m_MatchEndTime;
        this.m_bMatchEndResultVisible = Other.m_bMatchEndResultVisible;
        this.m_MatchEndWinnerAnnouncementText = Other.m_MatchEndWinnerAnnouncementText;
        this.m_MatchEndMVPPlayerNameText = Other.m_MatchEndMVPPlayerNameText;
        this.m_MatchEndMVPKills = int(Other.m_MatchEndMVPKills);
        this.m_MatchEndMVPSummaryText = Other.m_MatchEndMVPSummaryText;
        this.m_bLocalPlayerWonMatch = Other.m_bLocalPlayerWonMatch;
        this.m_bMatchEndAutoHideArmed = Other.m_bMatchEndAutoHideArmed;
        this.m_MatchEndAutoHideAt = Other.m_MatchEndAutoHideAt;
        this.m_BackToCityRemainTimeText = Other.m_BackToCityRemainTimeText;
        this.m_bBackToRoomVisible = Other.m_bBackToRoomVisible;
        this.m_bBackToCityPressed = Other.m_bBackToCityPressed;
        this.m_bBackToRoomPressed = Other.m_bBackToRoomPressed;
        this.m_bSwitchAvatarPanelVisible = Other.m_bSwitchAvatarPanelVisible;
        this.m_SwitchAvatarPanelPageHandle = Other.m_SwitchAvatarPanelPageHandle;
        this.m_bInBrawlPrepStage = Other.m_bInBrawlPrepStage;
        this.m_BrawlPrepCountdownText = Other.m_BrawlPrepCountdownText;
        this.m_BrawlPrepStageText = Other.m_BrawlPrepStageText;
        this.m_BrawlPrepEndTime = Other.m_BrawlPrepEndTime;
        this.m_bIsBrawlMode = Other.m_bIsBrawlMode;
        this.m_bIsTDMRoundMode = Other.m_bIsTDMRoundMode;
        this.m_CurrentRound = int(Other.m_CurrentRound);
        this.m_Team1RoundWins = int(Other.m_Team1RoundWins);
        this.m_Team2RoundWins = int(Other.m_Team2RoundWins);
        this.m_RoundsToWin = int(Other.m_RoundsToWin);
        this.m_RoundScoreText = Other.m_RoundScoreText;
        this.m_RoundStageText = Other.m_RoundStageText;
        this.m_RoundCountdownText = Other.m_RoundCountdownText;
        this.m_RoundStageEndTime = Other.m_RoundStageEndTime;
        this.m_RoundWinnerTeamId = int(Other.m_RoundWinnerTeamId);
        this.m_RoundResultText = Other.m_RoundResultText;
        this.m_bRoundResultVisible = Other.m_bRoundResultVisible;
        this.m_bRoundStageHintVisible = Other.m_bRoundStageHintVisible;
        return __r;
    }
    void UpdateLocalPlayerTeamDisplay(const int TeamId)
    {
        this.SetLocalPlayerTeamId(TeamId);
        if (TeamId == 1)
        {
            this.SetLocalPlayerTeamDisplayText(FText::FromString("Team 1"));
            return;
        }
        if (TeamId == 2)
        {
            this.SetLocalPlayerTeamDisplayText(FText::FromString("Team 2"));
            return;
        }
        if (TeamId == 0)
        {
            this.SetLocalPlayerTeamDisplayText(FText::FromString("вЂ”"));
            return;
        }
        this.SetLocalPlayerTeamDisplayText(FText::FromString((FString("Team ") + String::Conv_IntToString(TeamId))));
        return;
    }
    void UpdateMatchEndPresentation_Common(const int Winner)
    {
        bool local_2;
        int local_7;
        FString local_38;
        bool local_48;
        this.SetbMatchEndResultVisible((Winner != 0));
        this.SetbBackToRoomVisible((Winner != 0));
        this.SetbLocalPlayerWonMatch(false);
        if (Winner == 0)
        {
            this.SetbMatchEndAutoHideArmed(false);
            this.SetMatchEndWinnerAnnouncementText(FText::FromString(""));
            this.SetMatchEndMVPPlayerNameText(FText::FromString(""));
            this.SetMatchEndMVPKills(0);
            this.SetMatchEndMVPSummaryText(FText::FromString(""));
            this.SetBackToCityRemainTimeText(FText::FromString(""));
            this.SetbBackToRoomVisible(false);
            this.SetbBackToRoomPressed(false);
            this.SetbBackToCityPressed(false);
            return;
        }
        if (!(this.GetbMatchEndAutoHideArmed()))
        {
            this.SetbMatchEndAutoHideArmed(true);
            local_7 = 20;
            if (this.UseUniversalSystem())
            {
                FECSWorldPtr local_10 = ECS::GetECSWorld();
                Has local_16;
                local_2 = local_16.opCall();
                if (local_2)
                {
                    Get local_24;
                    local_7 = local_24.opCall().MatchFinishDelaySeconds;
                }
            }
            this.SetMatchEndAutoHideAt((FFPTime(this.GetContext().Time) + FFPTime(local_7)));
        }
        if (Winner == -1)
        {
            this.SetMatchEndWinnerAnnouncementText(FText::FromString("е№іе±Ђ!"));
        }
        else
        {
            if (Winner == 1)
            {
                this.SetMatchEndWinnerAnnouncementText(FText::FromString("Team 1 иЋ·иѓњ!"));
            }
            else
            {
                if (Winner == 2)
                {
                    this.SetMatchEndWinnerAnnouncementText(FText::FromString("Team 2 иЋ·иѓњ!"));
                }
                else
                {
                    local_38 = ((FString("Team ") + String::Conv_IntToString(Winner)) + " Wins!");
                    this.SetMatchEndWinnerAnnouncementText(FText::FromString(local_38));
                }
            }
        }
        FECSEntity local_46 = this.GetContext().GetLocalPlayer();
        if (local_46.IsValid() && (this.GetLocalPlayerTeamId() != 0) && (this.GetLocalPlayerTeamId() == Winner))
        {
            this.SetbLocalPlayerWonMatch(true);
        }
        FECSWorldPtr local_12 = ECS::GetECSWorld();
        TMap<FECSEntity, FGameModePlayerScoreDataBase> local_68;
        if (!(this.UseUniversalSystem()))
        {
            local_48 = false;
        }
        else
        {
            FECSWorldPtr::Has<FCS_GameMode_ScoreData> local_72;
            local_48 = local_72.opCall();
        }
        if (local_48)
        {
            Get local_76;
            local_68 = local_76.opCall().GetPlayerScores();
        }
        else
        {
            Has local_80;
            local_2 = local_80.opCall();
            if (local_2)
            {
                int local_86;
                for (auto& local_104 : local_86.GetPlayerStatMap())
                {
                    FGameModePlayerScoreDataBase local_110;
                    local_110.SetKills(GetKills());
                    local_110.SetDeaths(GetDeaths());
                    local_110.SetAssists(GetAssists());
                    local_110.SetDamageDealt(GetDamageDealt());
                    local_110.SetDamageTaken(GetDamageTaken());
                    local_68.Add(local_104.GetKey(), local_110);
                }
            }
            else
            {
                Has local_116;
                local_48 = local_116.opCall();
                if (local_48)
                {
                    int local_122;
                    for (auto& local_104_2 : local_122.GetPlayerStatMap())
                    {
                        FGameModePlayerScoreDataBase local_110;
                        local_110.SetKills(GetKills());
                        local_110.SetDeaths(GetDeaths());
                        local_110.SetAssists(GetAssists());
                        local_110.SetDamageDealt(GetDamageDealt());
                        local_110.SetDamageTaken(GetDamageTaken());
                        local_68.Add(local_104_2.GetKey(), local_110);
                    }
                }
            }
        }
        local_7 = -1;
        for (auto& local_140 : local_68)
        {
            if (GetKills() > local_7)
            {
                local_7 = GetKills();
            }
        }
        if (local_7 < 0)
        {
            local_7 = 0;
        }
        int local_145 = -1;
        for (auto& local_140_2 : local_68)
        {
            if (GetKills() != local_7)
            {
                continue;
            }
            int local_146 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_140_2.GetKey());
            if (!(local_46.IsValid()) || (local_146 < local_145))
            {
                local_145 = local_146;
                local_46 = local_140_2.GetKey();
            }
        }
        if (!(local_46.IsValid()) || (local_68.Num() == 0))
        {
            this.SetMatchEndMVPPlayerNameText(FText::FromString("вЂ”"));
            this.SetMatchEndMVPKills(0);
            this.SetMatchEndMVPSummaryText(FText::FromString("MVP: вЂ”"));
            return;
        }
        FString local_42_2 = ::FASCommonUtils::GetPlayerName(local_46).ToString();
        if (local_42_2.IsEmpty())
        {
            FString local_156 = String::Conv_IntToString(::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_46));
            if (local_156.IsEmpty())
            {
                local_38 = "Player";
            }
            else
            {
                local_38 = FString().Append("Player ").Append(local_156);
            }
            local_42_2 = local_38;
        }
        this.SetMatchEndMVPPlayerNameText(FText::FromString(local_42_2));
        this.SetMatchEndMVPKills(local_7);
        FString local_34_2 = (((FString("MVP: ") + local_42_2) + " вЂ” ") + String::Conv_IntToString(local_7));
        local_38 = (local_34_2 + " Kills");
        this.SetMatchEndMVPSummaryText(FText::FromString(local_38));
        return;
    }
    void RebuildKDAList()
    {
        int local_38 = 0;
        int local_112;
        int local_113;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        bool local_6 = this.UseUniversalSystem();
        if (!(local_6))
        {
            local_6 = false;
        }
        else
        {
            Has local_10;
            local_6 = local_10.opCall();
        }
        TMap<FECSEntity, FGameModePlayerScoreDataBase> local_32;
        if (local_6)
        {
            local_32 = local_38.GetPlayerScores();
        }
        else
        {
            Has local_42;
            bool local_11 = local_42.opCall();
            if (local_11)
            {
                int local_48;
                for (auto& local_66 : local_48.GetPlayerStatMap())
                {
                    FGameModePlayerScoreDataBase local_72;
                    local_72.SetKills(GetKills());
                    local_72.SetDeaths(GetDeaths());
                    local_72.SetAssists(GetAssists());
                    local_72.SetDamageDealt(GetDamageDealt());
                    local_72.SetDamageTaken(GetDamageTaken());
                    local_32.Add(local_66.GetKey(), local_72);
                }
            }
            else
            {
                Has local_78;
                local_11 = local_78.opCall();
                if (local_11)
                {
                    int local_84;
                    for (auto& local_66_2 : local_84.GetPlayerStatMap())
                    {
                        FGameModePlayerScoreDataBase local_72;
                        local_72.SetKills(GetKills());
                        local_72.SetDeaths(GetDeaths());
                        local_72.SetAssists(GetAssists());
                        local_72.SetDamageDealt(GetDamageDealt());
                        local_72.SetDamageTaken(GetDamageTaken());
                        local_32.Add(local_66_2.GetKey(), local_72);
                    }
                }
            }
        }
        if (local_32.Num() == 0)
        {
            return;
        }
        TArray<FECSEntity> local_90;
        for (auto& local_108 : local_32)
        {
            local_90.Add(local_108.GetKey());
        }
        int local_109 = 0;
        for (; local_109 < local_90.Num(); ++local_109)
        {
            int local_111 = local_109 + 1;
            for (; local_111 < local_90.Num(); ++local_111)
            {
                local_112 = local_32[local_90[local_109]].GetKills();
                local_113 = local_32[local_90[local_111]].GetKills();
                if (local_113 > local_112)
                {
                    FECSEntity local_118 = local_90[local_109];
                    local_90[local_109] = local_90[local_111];
                    local_90[local_111] = local_118;
                }
            }
        }
        TArray<FPVP_TDM_KDAEntry> local_122;
        local_122.Reserve(local_90.Num());
        FString local_176;
        for (auto& local_136 : local_90)
        {
            FGameModePlayerScoreDataBase& local_138 = local_32[local_136];
            FPVP_TDM_KDAEntry local_158;
            local_158.PlayerIdText = String::Conv_IntToString(::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_136));
            local_158.PlayerName = ::FASCommonUtils::GetPlayerName(local_136).ToString();
            if (local_158.PlayerName.IsEmpty())
            {
                if (local_158.PlayerIdText.IsEmpty())
                {
                    local_176 = "зЋ©е®¶";
                }
                else
                {
                    local_176 = FString().Append("зЋ©е®¶ ").Append(local_158.PlayerIdText);
                }
                local_158.PlayerName = local_176;
            }
            local_158.Kills = local_138.GetKills();
            local_158.Deaths = local_138.GetDeaths();
            local_158.Assists = local_138.GetAssists();
            local_158.TeamId = this.GetPlayerTeamId(local_136);
            local_158.DamageDealt = uint(local_138.GetDamageDealt());
            local_158.DamageTaken = uint(local_138.GetDamageTaken());
            local_158.KDAText = FText::FromString(((((String::Conv_IntToString(local_138.GetKills()) + " / ") + String::Conv_IntToString(local_138.GetDeaths())) + " / ") + String::Conv_IntToString(local_138.GetAssists())));
            local_158.bIsLocalPlayer = this.GetContext().GetLocalPlayer().IsValid() && (local_136 == this.GetContext().GetLocalPlayer());
            local_122.Add(local_158);
        }
        this.SetModify_AllPlayersKDA(local_122);
        TArray<TEUIModelRef<FVM_PVP_TDM_KDAListEntry>> local_188;
        local_188.Reserve(local_90.Num());
        for (auto& local_136 : local_90)
        {
            local_188.Add(TEUIModelRef<FVM_PVP_TDM_KDAListEntry>(::FVM_PVP_TDM_KDAListEntry::Create(this.GetContext().Manager, local_136)));
        }
        this.SetModify_KDAListEntries(local_188);
        return;
    }
    int GetPlayerTeamId(const FECSEntity &inout PlayerEntity) const
    {
        bool local_1;
        if (!(PlayerEntity.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            Has local_6;
            local_1 = local_6.opCall();
        }
        if (local_1)
        {
            Get local_12;
            return local_12.opCall().GetTeam();
        }
        return 0;
    }
    bool TryGetPlayerScoreFromOldSystem(const FECSWorldPtr &inout World, const FECSEntity &inout PlayerEntity, FGameModePlayerScoreDataBase &inout OutScore) const
    {
        int local_12 = 0;
        int local_26 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            if (local_12.GetPlayerStatMap().Contains(PlayerEntity))
            {
                const FPVP_TDM_PlayerStat& local_14 = local_12.GetPlayerStatMap()[PlayerEntity];
                OutScore.SetKills(local_14.GetKills());
                OutScore.SetDeaths(local_14.GetDeaths());
                OutScore.SetAssists(local_14.GetAssists());
                OutScore.SetDamageDealt(local_14.GetDamageDealt());
                OutScore.SetDamageTaken(local_14.GetDamageTaken());
                return true;
            }
        }
        Has local_20;
        bool local_5_2 = local_20.opCall();
        if (local_5_2)
        {
            if (local_26.GetPlayerStatMap().Contains(PlayerEntity))
            {
                const FPVP_TDM_PlayerStat& local_14_2 = local_26.GetPlayerStatMap()[PlayerEntity];
                OutScore.SetKills(local_14_2.GetKills());
                OutScore.SetDeaths(local_14_2.GetDeaths());
                OutScore.SetAssists(local_14_2.GetAssists());
                OutScore.SetDamageDealt(local_14_2.GetDamageDealt());
                OutScore.SetDamageTaken(local_14_2.GetDamageTaken());
                return true;
            }
        }
        return false;
    }
    bool UseUniversalSystem() const
    {
        return FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool();
    }
    void UpdateLocalPlayerStats()
    {
        bool local_21;
        int local_32 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (!(this.GetContext().GetLocalPlayer().IsValid()))
        {
            this.SetLocalPlayerKills(0);
            this.SetLocalPlayerDeaths(0);
            this.SetLocalPlayerAssists(0);
            this.SetLocalPlayerKDAText(FText::FromString("0 / 0 / 0"));
            this.UpdateLocalPlayerTeamDisplay(0);
            return;
        }
        FGameModePlayerScoreDataBase local_20;
        local_21 = false;
        if (this.UseUniversalSystem())
        {
            Has local_26;
            bool local_9 = local_26.opCall();
            if (local_9)
            {
                if (local_32.GetPlayerScores().Contains(this.GetContext().GetLocalPlayer()))
                {
                    local_20 = local_32.GetPlayerScores()[this.GetContext().GetLocalPlayer()];
                }
            }
        }
        else
        {
            local_21 = this.TryGetPlayerScoreFromOldSystem(local_2, this.GetContext().GetLocalPlayer(), local_20);
        }
        if (local_21)
        {
            this.SetLocalPlayerKills(local_20.GetKills());
            this.SetLocalPlayerDeaths(local_20.GetDeaths());
            this.SetLocalPlayerAssists(local_20.GetAssists());
            FString local_40 = (String::Conv_IntToString(local_20.GetKills()) + " / ");
            FString local_40_2 = ((local_40 + String::Conv_IntToString(local_20.GetDeaths())) + " / ");
            this.SetLocalPlayerKDAText(FText::FromString((local_40_2 + String::Conv_IntToString(local_20.GetAssists()))));
            this.UpdateLocalPlayerTeamDisplay(this.GetPlayerTeamId(this.GetContext().GetLocalPlayer()));
        }
        else
        {
            this.SetLocalPlayerKills(0);
            this.SetLocalPlayerDeaths(0);
            this.SetLocalPlayerAssists(0);
            this.SetLocalPlayerKDAText(FText::FromString("0 / 0 / 0"));
            FECSEntity local_8 = this.GetContext().GetLocalPlayer();
            Has local_48;
            bool local_9_2 = local_48.opCall();
            if (local_9_2)
            {
                FECSEntity local_8_2 = this.GetContext().GetLocalPlayer();
                Get local_52;
                this.UpdateLocalPlayerTeamDisplay(local_52.opCall().GetTeam());
            }
            else
            {
                this.UpdateLocalPlayerTeamDisplay(0);
            }
        }
        return;
    }
    void ToggleScoreboard()
    {
        this.SetbScoreboardVisible(!(this.GetbScoreboardVisible()));
        if (this.GetbScoreboardVisible())
        {
            this.RebuildKDAList();
        }
        return;
    }
    void OnBrawlScoreChanged(const FCS_PVP_TDM_ScoreData &inout Data)
    {
        this.SetbIsBrawlMode(true);
        this.SetbIsTDMRoundMode(false);
        this.SetbRoundStageHintVisible(false);
        this.SetTeam1Kills(Data.GetTeam1Kills());
        this.SetTeam2Kills(Data.GetTeam2Kills());
        this.SetKillScoreLimit(Data.GetKillScoreLimit());
        if (!(this.UseUniversalSystem()))
        {
            this.SetWinnerTeamId(Data.GetWinnerTeamId());
            this.SetMatchEndTime(Data.GetMatchEndTime());
        }
        this.SetbInBrawlPrepStage(Data.GetbInPrepStage());
        this.SetBrawlPrepEndTime(Data.GetPrepEndTime());
        if (this.GetbInBrawlPrepStage())
        {
            this.SetBrawlPrepStageText(FText::FromString("е‡†е¤‡й¶ж®µ"));
        }
        else
        {
            this.SetBrawlPrepStageText(FText::FromString(""));
        }
        this.UpdateLocalPlayerStats();
        if (!(this.UseUniversalSystem()))
        {
            this.UpdateMatchEndPresentation_Common(Data.GetWinnerTeamId());
        }
        this.RebuildKDAList();
        return;
    }
    void OnTDMRoundDataChanged(const FCS_PVP_TDM_RoundData &inout Data)
    {
        bool local_24;
        this.SetbIsBrawlMode(false);
        this.SetbIsTDMRoundMode(true);
        this.SetCurrentRound(Data.GetCurrentRound());
        this.SetTeam1RoundWins(Data.GetTeam1RoundWins());
        this.SetTeam2RoundWins(Data.GetTeam2RoundWins());
        this.SetRoundsToWin(Data.GetRoundsToWin());
        this.SetRoundWinnerTeamId(Data.GetRoundWinnerTeamId());
        if (!(this.UseUniversalSystem()))
        {
            this.SetWinnerTeamId(Data.GetMatchWinnerTeamId());
        }
        FString local_10 = (String::Conv_IntToString(Data.GetTeam1RoundWins()) + " - ");
        this.SetRoundScoreText(FText::FromString((local_10 + String::Conv_IntToString(Data.GetTeam2RoundWins()))));
        switch (int(Data.GetRoundStage()))
        {
        case 0:
        {
            this.SetRoundStageText(FText::FromString("е‡†е¤‡й¶ж®µ"));
            this.SetRoundStageEndTime(Data.GetRoundPrepEndTime());
            this.SetbRoundStageHintVisible(true);
            break;
        }
        case 1:
        {
            this.SetRoundStageText(FText::FromString("ж€ж–—й¶ж®µ"));
            this.SetRoundStageEndTime(Data.GetRoundCombatEndTime());
            this.SetbRoundStageHintVisible(false);
            break;
        }
        case 2:
        {
            this.SetRoundStageText(FText::FromString("з­‰еѕ…дё‹дёЂе›ћеђ€ејЂе§‹"));
            this.SetRoundStageEndTime(Data.GetRoundIntermissionEndTime());
            this.SetbRoundStageHintVisible(true);
            break;
        }
        }
        if (this.UseUniversalSystem())
        {
            local_24 = (this.GetWinnerTeamId() != 0);
        }
        else
        {
            local_24 = (Data.GetMatchWinnerTeamId() != 0);
        }
        this.SetbRoundResultVisible(Data.GetRoundWinnerTeamId() != 0 && !(local_24));
        if (Data.GetRoundWinnerTeamId() == -1)
        {
            this.SetRoundResultText(FText::FromString("е№іе±Ђ!"));
        }
        else
        {
            if (Data.GetRoundWinnerTeamId() == 1)
            {
                this.SetRoundResultText(FText::FromString("Team 1 иЋ·еѕ—1е€†!"));
            }
            else
            {
                if (Data.GetRoundWinnerTeamId() == 2)
                {
                    this.SetRoundResultText(FText::FromString("Team 2 иЋ·еѕ—1е€†!"));
                }
                else
                {
                    this.SetRoundResultText(FText::FromString(""));
                }
            }
        }
        this.UpdateLocalPlayerStats();
        if (!(this.UseUniversalSystem()) && (Data.GetMatchWinnerTeamId() != 0))
        {
            this.UpdateMatchEndPresentation_Common(Data.GetMatchWinnerTeamId());
        }
        this.RebuildKDAList();
        return;
    }
    void OnGameModeScoreDataChanged(const FCS_GameMode_ScoreData &inout Data)
    {
        if (!(this.UseUniversalSystem()))
        {
            return;
        }
        this.SetMatchEndTime(Data.GetMatchEndTime());
        if (Data.GetWinnerTeamIds().Num() > 0)
        {
            int local_4;
            local_4 = Data.GetWinnerTeamIds()[0];
            this.SetWinnerTeamId(local_4);
            this.SetbRoundResultVisible(false);
            this.UpdateMatchEndPresentation_Common(local_4);
        }
        else
        {
            if (this.GetWinnerTeamId() != 0)
            {
                this.SetWinnerTeamId(0);
                this.UpdateMatchEndPresentation_Common(0);
            }
        }
        this.UpdateLocalPlayerStats();
        this.RebuildKDAList();
        return;
    }
    void TickMatchHUD()
    {
        if (this.GetbIsTDMRoundMode())
        {
            this.UpdateRoundCountdown();
        }
        else
        {
            this.UpdateMatchCountdown();
        }
        this.UpdateBrawlPrepCountdown();
        if (!(this.GetbMatchEndAutoHideArmed()) || !(this.GetbMatchEndResultVisible()))
        {
            return;
        }
        this.RefreshBackToCityRemainTimeText();
        return;
    }
    void UpdateBrawlPrepCountdown()
    {
        if (!(this.GetbInBrawlPrepStage()) || (this.GetBrawlPrepEndTime().ToSeconds() <= 0.0))
        {
            this.SetBrawlPrepCountdownText(FText::FromString(""));
            return;
        }
        int local_19 = int(((FFPTime(this.GetBrawlPrepEndTime()) - this.GetContext().Time).ToSeconds()));
        if (local_19 < 0)
        {
            local_19 = 0;
        }
        int local_21 = FMath::IntegerDivisionTrunc(local_19, 60);
        int local_13_2 = local_19 - (local_21 * 60);
        FString local_38;
        if (local_13_2 < 10)
        {
            local_38 = FString().Append("0").Append(local_13_2);
        }
        else
        {
            local_38 = FString().Append(local_13_2);
        }
        this.SetBrawlPrepCountdownText(FText::FromString(FString().Append(local_21).Append(":").Append(local_38)));
        return;
    }
    void UpdateMatchCountdown()
    {
        if (this.GetMatchEndTime().ToSeconds() <= 0.0 || (this.GetWinnerTeamId() != 0))
        {
            this.SetMatchRemainingTimeText(FText::FromString(""));
            return;
        }
        int local_6 = int(((FFPTime(this.GetMatchEndTime()) - this.GetContext().Time).ToSeconds()));
        if (local_6 < 0)
        {
            local_6 = 0;
        }
        int local_13 = FMath::IntegerDivisionTrunc(local_6, 60);
        int local_7_2 = local_6 - (local_13 * 60);
        FString local_36;
        if (local_7_2 < 10)
        {
            local_36 = FString().Append("0").Append(local_7_2);
        }
        else
        {
            local_36 = FString().Append(local_7_2);
        }
        this.SetMatchRemainingTimeText(FText::FromString(FString().Append(local_13).Append(":").Append(local_36)));
        return;
    }
    void UpdateRoundCountdown()
    {
        if (this.GetRoundStageEndTime().ToSeconds() <= 0.0 || (this.GetWinnerTeamId() != 0))
        {
            this.SetRoundCountdownText(FText::FromString(""));
            return;
        }
        int local_6 = int(((FFPTime(this.GetRoundStageEndTime()) - this.GetContext().Time).ToSeconds()));
        if (local_6 < 0)
        {
            local_6 = 0;
        }
        int local_13 = FMath::IntegerDivisionTrunc(local_6, 60);
        int local_7_2 = local_6 - (local_13 * 60);
        FString local_36;
        if (local_7_2 < 10)
        {
            local_36 = FString().Append("0").Append(local_7_2);
        }
        else
        {
            local_36 = FString().Append(local_7_2);
        }
        this.SetRoundCountdownText(FText::FromString(FString().Append(local_13).Append(":").Append(local_36)));
        return;
    }
    void RefreshBackToCityRemainTimeText()
    {
        this.SetBackToCityRemainTimeText(FText::FromString(FString().Append(int((FFPTime(this.GetMatchEndAutoHideAt()) - this.GetContext().Time).ToSeconds())).Append("sеђЋиї”е›ћдё»еџЋ")));
        return;
    }
    void OnBackToCityPressed()
    {
        if (!(this.GetbBackToCityPressed()))
        {
            ::FGameConnectionUtils::UICallBackToCityLevel(this.GetContext().GetLocalPlayer());
            this.SetbBackToCityPressed(true);
        }
        return;
    }
    void OnBackToRoomPressed()
    {
        if (this.GetbBackToRoomPressed())
        {
            return;
        }
        this.SetbBackToRoomPressed(true);
        this.SetbBackToRoomVisible(false);
        this.SetbMatchEndResultVisible(false);
        bool local_1 = this.GetContext().GetLocalPlayer().IsValid();
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            local_1 = ECS::GetRuntimeInfo().IsClient;
        }
        if (local_1)
        {
            FFPTime local_14 = FFPTime(-1);
            FECSEntity local_6 = this.GetContext().GetLocalPlayer();
            SendEvent local_12;
            local_12.opCall(local_14);
        }
        return;
    }
    void OnSwitchAvatarPanelTogglePressed(const TArray<FGameplayTag> &inout WidgetDisableTags)
    {
        if (this.GetSwitchAvatarPanelPageHandle().IsLayoutLayerWidget())
        {
            FEUIWidget::RemoveWidget(this.GetSwitchAvatarPanelPageHandle());
            this.SetbSwitchAvatarPanelVisible(false);
            return;
        }
        this.SetSwitchAvatarPanelPageHandle(FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Mode_PVX_MainAvatar));
        this.SetbSwitchAvatarPanelVisible(true);
        return;
    }
    int GetTeam1Kills() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Team1Kills;
    }
    void SetTeam1Kills(const int __Value) property
    {
        if (this.m_Team1Kills == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Team1Kills = __Value;
        return;
    }
    int GetTeam2Kills() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Team2Kills;
    }
    void SetTeam2Kills(const int __Value) property
    {
        if (this.m_Team2Kills == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Team2Kills = __Value;
        return;
    }
    int GetKillScoreLimit() const property
    {
        this.TrackPropertyRead(2);
        return this.m_KillScoreLimit;
    }
    void SetKillScoreLimit(const int __Value) property
    {
        if (this.m_KillScoreLimit == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_KillScoreLimit = __Value;
        return;
    }
    int GetWinnerTeamId() const property
    {
        this.TrackPropertyRead(3);
        return this.m_WinnerTeamId;
    }
    void SetWinnerTeamId(const int __Value) property
    {
        if (this.m_WinnerTeamId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_WinnerTeamId = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_PVP_TDM_KDAListEntry>> GetModify_KDAListEntries() const property
    {
        const TArray<TEUIModelRef<FVM_PVP_TDM_KDAListEntry>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_PVP_TDM_KDAListEntry>> GetModify_Modify_KDAListEntries() property
    {
        TArray<TEUIModelRef<FVM_PVP_TDM_KDAListEntry>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetModify_KDAListEntries(const TArray<TEUIModelRef<FVM_PVP_TDM_KDAListEntry>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Modify_KDAListEntries = __Value;
        return;
    }
    const TArray<FPVP_TDM_KDAEntry> GetModify_AllPlayersKDA() const property
    {
        const TArray<FPVP_TDM_KDAEntry> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<FPVP_TDM_KDAEntry> GetModify_Modify_AllPlayersKDA() property
    {
        TArray<FPVP_TDM_KDAEntry> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetModify_AllPlayersKDA(const TArray<FPVP_TDM_KDAEntry> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_Modify_AllPlayersKDA = __Value;
        return;
    }
    bool GetbScoreboardVisible() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bScoreboardVisible;
    }
    void SetbScoreboardVisible(const bool __Value) property
    {
        if (!(this.m_bScoreboardVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bScoreboardVisible = __Value;
        return;
    }
    int GetLocalPlayerKills() const property
    {
        this.TrackPropertyRead(7);
        return this.m_LocalPlayerKills;
    }
    void SetLocalPlayerKills(const int __Value) property
    {
        if (this.m_LocalPlayerKills == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_LocalPlayerKills = __Value;
        return;
    }
    int GetLocalPlayerDeaths() const property
    {
        this.TrackPropertyRead(8);
        return this.m_LocalPlayerDeaths;
    }
    void SetLocalPlayerDeaths(const int __Value) property
    {
        if (this.m_LocalPlayerDeaths == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_LocalPlayerDeaths = __Value;
        return;
    }
    int GetLocalPlayerAssists() const property
    {
        this.TrackPropertyRead(9);
        return this.m_LocalPlayerAssists;
    }
    void SetLocalPlayerAssists(const int __Value) property
    {
        if (this.m_LocalPlayerAssists == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_LocalPlayerAssists = __Value;
        return;
    }
    const FText GetLocalPlayerKDAText() const property
    {
        const FText __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FText GetModify_LocalPlayerKDAText() property
    {
        FText __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetLocalPlayerKDAText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_LocalPlayerKDAText = __Value;
        return;
    }
    int GetLocalPlayerTeamId() const property
    {
        this.TrackPropertyRead(11);
        return this.m_LocalPlayerTeamId;
    }
    void SetLocalPlayerTeamId(const int __Value) property
    {
        if (this.m_LocalPlayerTeamId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_LocalPlayerTeamId = __Value;
        return;
    }
    const FText GetLocalPlayerTeamDisplayText() const property
    {
        const FText __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FText GetModify_LocalPlayerTeamDisplayText() property
    {
        FText __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetLocalPlayerTeamDisplayText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_LocalPlayerTeamDisplayText = __Value;
        return;
    }
    const FText GetMatchRemainingTimeText() const property
    {
        const FText __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FText GetModify_MatchRemainingTimeText() property
    {
        FText __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetMatchRemainingTimeText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_MatchRemainingTimeText = __Value;
        return;
    }
    const FFPTime GetMatchEndTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    FFPTime GetModify_MatchEndTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetMatchEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_MatchEndTime = __Value;
        return;
    }
    bool GetbMatchEndResultVisible() const property
    {
        this.TrackPropertyRead(15);
        return this.m_bMatchEndResultVisible;
    }
    void SetbMatchEndResultVisible(const bool __Value) property
    {
        if (!(this.m_bMatchEndResultVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_bMatchEndResultVisible = __Value;
        return;
    }
    const FText GetMatchEndWinnerAnnouncementText() const property
    {
        const FText __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    FText GetModify_MatchEndWinnerAnnouncementText() property
    {
        FText __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetMatchEndWinnerAnnouncementText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_MatchEndWinnerAnnouncementText = __Value;
        return;
    }
    const FText GetMatchEndMVPPlayerNameText() const property
    {
        const FText __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    FText GetModify_MatchEndMVPPlayerNameText() property
    {
        FText __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetMatchEndMVPPlayerNameText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_MatchEndMVPPlayerNameText = __Value;
        return;
    }
    int GetMatchEndMVPKills() const property
    {
        this.TrackPropertyRead(18);
        return this.m_MatchEndMVPKills;
    }
    void SetMatchEndMVPKills(const int __Value) property
    {
        if (this.m_MatchEndMVPKills == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_MatchEndMVPKills = __Value;
        return;
    }
    const FText GetMatchEndMVPSummaryText() const property
    {
        const FText __r;
        this.TrackPropertyRead(19);
        return __r;
    }
    FText GetModify_MatchEndMVPSummaryText() property
    {
        FText __r;
        this.MarkPropertyDirty(19);
        return __r;
    }
    void SetMatchEndMVPSummaryText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_MatchEndMVPSummaryText = __Value;
        return;
    }
    bool GetbLocalPlayerWonMatch() const property
    {
        this.TrackPropertyRead(20);
        return this.m_bLocalPlayerWonMatch;
    }
    void SetbLocalPlayerWonMatch(const bool __Value) property
    {
        if (!(this.m_bLocalPlayerWonMatch) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_bLocalPlayerWonMatch = __Value;
        return;
    }
    bool GetbMatchEndAutoHideArmed() const property
    {
        this.TrackPropertyRead(21);
        return this.m_bMatchEndAutoHideArmed;
    }
    void SetbMatchEndAutoHideArmed(const bool __Value) property
    {
        if (!(this.m_bMatchEndAutoHideArmed) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_bMatchEndAutoHideArmed = __Value;
        return;
    }
    const FFPTime GetMatchEndAutoHideAt() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(22);
        return __r;
    }
    FFPTime GetModify_MatchEndAutoHideAt() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(22);
        return __r;
    }
    void SetMatchEndAutoHideAt(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_MatchEndAutoHideAt = __Value;
        return;
    }
    const FText GetBackToCityRemainTimeText() const property
    {
        const FText __r;
        this.TrackPropertyRead(23);
        return __r;
    }
    FText GetModify_BackToCityRemainTimeText() property
    {
        FText __r;
        this.MarkPropertyDirty(23);
        return __r;
    }
    void SetBackToCityRemainTimeText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(23);
        this.m_BackToCityRemainTimeText = __Value;
        return;
    }
    bool GetbBackToRoomVisible() const property
    {
        this.TrackPropertyRead(24);
        return this.m_bBackToRoomVisible;
    }
    void SetbBackToRoomVisible(const bool __Value) property
    {
        if (!(this.m_bBackToRoomVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(24);
        this.m_bBackToRoomVisible = __Value;
        return;
    }
    bool GetbBackToCityPressed() const property
    {
        this.TrackPropertyRead(25);
        return this.m_bBackToCityPressed;
    }
    void SetbBackToCityPressed(const bool __Value) property
    {
        if (!(this.m_bBackToCityPressed) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(25);
        this.m_bBackToCityPressed = __Value;
        return;
    }
    bool GetbBackToRoomPressed() const property
    {
        this.TrackPropertyRead(26);
        return this.m_bBackToRoomPressed;
    }
    void SetbBackToRoomPressed(const bool __Value) property
    {
        if (!(this.m_bBackToRoomPressed) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(26);
        this.m_bBackToRoomPressed = __Value;
        return;
    }
    bool GetbSwitchAvatarPanelVisible() const property
    {
        this.TrackPropertyRead(27);
        return this.m_bSwitchAvatarPanelVisible;
    }
    void SetbSwitchAvatarPanelVisible(const bool __Value) property
    {
        if (!(this.m_bSwitchAvatarPanelVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(27);
        this.m_bSwitchAvatarPanelVisible = __Value;
        return;
    }
    const FEUIWidgetRef GetSwitchAvatarPanelPageHandle() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(28);
        return __r;
    }
    FEUIWidgetRef GetModify_SwitchAvatarPanelPageHandle() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(28);
        return __r;
    }
    void SetSwitchAvatarPanelPageHandle(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(28);
        this.m_SwitchAvatarPanelPageHandle = __Value;
        return;
    }
    bool GetbInBrawlPrepStage() const property
    {
        this.TrackPropertyRead(29);
        return this.m_bInBrawlPrepStage;
    }
    void SetbInBrawlPrepStage(const bool __Value) property
    {
        if (!(this.m_bInBrawlPrepStage) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(29);
        this.m_bInBrawlPrepStage = __Value;
        return;
    }
    const FText GetBrawlPrepCountdownText() const property
    {
        const FText __r;
        this.TrackPropertyRead(30);
        return __r;
    }
    FText GetModify_BrawlPrepCountdownText() property
    {
        FText __r;
        this.MarkPropertyDirty(30);
        return __r;
    }
    void SetBrawlPrepCountdownText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(30);
        this.m_BrawlPrepCountdownText = __Value;
        return;
    }
    const FText GetBrawlPrepStageText() const property
    {
        const FText __r;
        this.TrackPropertyRead(31);
        return __r;
    }
    FText GetModify_BrawlPrepStageText() property
    {
        FText __r;
        this.MarkPropertyDirty(31);
        return __r;
    }
    void SetBrawlPrepStageText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(31);
        this.m_BrawlPrepStageText = __Value;
        return;
    }
    const FFPTime GetBrawlPrepEndTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(32);
        return __r;
    }
    FFPTime GetModify_BrawlPrepEndTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(32);
        return __r;
    }
    void SetBrawlPrepEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(32);
        this.m_BrawlPrepEndTime = __Value;
        return;
    }
    bool GetbIsBrawlMode() const property
    {
        this.TrackPropertyRead(33);
        return this.m_bIsBrawlMode;
    }
    void SetbIsBrawlMode(const bool __Value) property
    {
        if (!(this.m_bIsBrawlMode) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(33);
        this.m_bIsBrawlMode = __Value;
        return;
    }
    bool GetbIsTDMRoundMode() const property
    {
        this.TrackPropertyRead(34);
        return this.m_bIsTDMRoundMode;
    }
    void SetbIsTDMRoundMode(const bool __Value) property
    {
        if (!(this.m_bIsTDMRoundMode) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(34);
        this.m_bIsTDMRoundMode = __Value;
        return;
    }
    int GetCurrentRound() const property
    {
        this.TrackPropertyRead(35);
        return this.m_CurrentRound;
    }
    void SetCurrentRound(const int __Value) property
    {
        if (this.m_CurrentRound == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(35);
        this.m_CurrentRound = __Value;
        return;
    }
    int GetTeam1RoundWins() const property
    {
        this.TrackPropertyRead(36);
        return this.m_Team1RoundWins;
    }
    void SetTeam1RoundWins(const int __Value) property
    {
        if (this.m_Team1RoundWins == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(36);
        this.m_Team1RoundWins = __Value;
        return;
    }
    int GetTeam2RoundWins() const property
    {
        this.TrackPropertyRead(37);
        return this.m_Team2RoundWins;
    }
    void SetTeam2RoundWins(const int __Value) property
    {
        if (this.m_Team2RoundWins == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(37);
        this.m_Team2RoundWins = __Value;
        return;
    }
    int GetRoundsToWin() const property
    {
        this.TrackPropertyRead(38);
        return this.m_RoundsToWin;
    }
    void SetRoundsToWin(const int __Value) property
    {
        if (this.m_RoundsToWin == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(38);
        this.m_RoundsToWin = __Value;
        return;
    }
    const FText GetRoundScoreText() const property
    {
        const FText __r;
        this.TrackPropertyRead(39);
        return __r;
    }
    FText GetModify_RoundScoreText() property
    {
        FText __r;
        this.MarkPropertyDirty(39);
        return __r;
    }
    void SetRoundScoreText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(39);
        this.m_RoundScoreText = __Value;
        return;
    }
    const FText GetRoundStageText() const property
    {
        const FText __r;
        this.TrackPropertyRead(40);
        return __r;
    }
    FText GetModify_RoundStageText() property
    {
        FText __r;
        this.MarkPropertyDirty(40);
        return __r;
    }
    void SetRoundStageText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(40);
        this.m_RoundStageText = __Value;
        return;
    }
    const FText GetRoundCountdownText() const property
    {
        const FText __r;
        this.TrackPropertyRead(41);
        return __r;
    }
    FText GetModify_RoundCountdownText() property
    {
        FText __r;
        this.MarkPropertyDirty(41);
        return __r;
    }
    void SetRoundCountdownText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(41);
        this.m_RoundCountdownText = __Value;
        return;
    }
    const FFPTime GetRoundStageEndTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(42);
        return __r;
    }
    FFPTime GetModify_RoundStageEndTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(42);
        return __r;
    }
    void SetRoundStageEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(42);
        this.m_RoundStageEndTime = __Value;
        return;
    }
    int GetRoundWinnerTeamId() const property
    {
        this.TrackPropertyRead(43);
        return this.m_RoundWinnerTeamId;
    }
    void SetRoundWinnerTeamId(const int __Value) property
    {
        if (this.m_RoundWinnerTeamId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(43);
        this.m_RoundWinnerTeamId = __Value;
        return;
    }
    const FText GetRoundResultText() const property
    {
        const FText __r;
        this.TrackPropertyRead(44);
        return __r;
    }
    FText GetModify_RoundResultText() property
    {
        FText __r;
        this.MarkPropertyDirty(44);
        return __r;
    }
    void SetRoundResultText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(44);
        this.m_RoundResultText = __Value;
        return;
    }
    bool GetbRoundResultVisible() const property
    {
        this.TrackPropertyRead(45);
        return this.m_bRoundResultVisible;
    }
    void SetbRoundResultVisible(const bool __Value) property
    {
        if (!(this.m_bRoundResultVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(45);
        this.m_bRoundResultVisible = __Value;
        return;
    }
    bool GetbRoundStageHintVisible() const property
    {
        this.TrackPropertyRead(46);
        return this.m_bRoundStageHintVisible;
    }
    void SetbRoundStageHintVisible(const bool __Value) property
    {
        if (!(this.m_bRoundStageHintVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(46);
        this.m_bRoundStageHintVisible = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_PVP_TDM_HUD
{
    UPROPERTY()
    TEUIModelRef<FVMS_PVP_TDM_HUD> Self;

    __GeneratedProperties_FVMS_PVP_TDM_HUD()
    {
        return;
    }
}

namespace FVMS_PVP_TDM_HUD
{
FVMS_PVP_TDM_HUD& Get(const UObject ContextObject)
{
    return FVMS_PVP_TDM_HUD::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_PVP_TDM_HUD GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_PVP_TDM_HUD __r;
    TEUIModelRef<FVMS_PVP_TDM_HUD> local_6 = TEUIModelRef<FVMS_PVP_TDM_HUD>(EUIInternal::MakeModelWithManager(Manager, FVMS_PVP_TDM_HUD::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Team1Kills";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Team2Kills";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "KillScoreLimit";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WinnerTeamId";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Modify_KDAListEntries";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_PVP_TDM_KDAListEntry>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Modify_AllPlayersKDA";
    local_14.TypeName = "TArray<FPVP_TDM_KDAEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bScoreboardVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LocalPlayerKills";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LocalPlayerDeaths";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LocalPlayerAssists";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LocalPlayerKDAText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LocalPlayerTeamId";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LocalPlayerTeamDisplayText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MatchRemainingTimeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bMatchEndResultVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MatchEndWinnerAnnouncementText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MatchEndMVPPlayerNameText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MatchEndMVPKills";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MatchEndMVPSummaryText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bLocalPlayerWonMatch";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BackToCityRemainTimeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bBackToRoomVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bSwitchAvatarPanelVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bInBrawlPrepStage";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BrawlPrepCountdownText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BrawlPrepStageText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsBrawlMode";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsTDMRoundMode";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentRound";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Team1RoundWins";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Team2RoundWins";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RoundsToWin";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RoundScoreText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RoundStageText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RoundCountdownText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RoundWinnerTeamId";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RoundResultText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bRoundResultVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bRoundStageHintVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_PVP_TDM_HUD>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_PVP_TDM_HUD;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnBrawlScoreChanged";
    local_26.ComponentType = FCS_PVP_TDM_ScoreData;
    Result.MonitorFunctions.Add(local_26);
    local_26.FunctionName = "__OnTDMRoundDataChanged";
    local_26.ComponentType = FCS_PVP_TDM_RoundData;
    Result.MonitorFunctions.Add(local_26);
    local_26.FunctionName = "__OnGameModeScoreDataChanged";
    local_26.ComponentType = FCS_GameMode_ScoreData;
    Result.MonitorFunctions.Add(local_26);
    Result.TickFunction.FunctionName = "__TickMatchHUD";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_PVP_TDM_HUD;
}
void __OnBrawlScoreChanged(FVMS_PVP_TDM_HUD &inout Model, const FECSEntity &inout Entity, const FCS_PVP_TDM_ScoreData &inout Component)
{
    Get local_4;
    Model.OnBrawlScoreChanged(local_4.opCall());
    return;
}
void __OnTDMRoundDataChanged(FVMS_PVP_TDM_HUD &inout Model, const FECSEntity &inout Entity, const FCS_PVP_TDM_RoundData &inout Component)
{
    Get local_4;
    Model.OnTDMRoundDataChanged(local_4.opCall());
    return;
}
void __OnGameModeScoreDataChanged(FVMS_PVP_TDM_HUD &inout Model, const FECSEntity &inout Entity, const FCS_GameMode_ScoreData &inout Component)
{
    Get local_4;
    Model.OnGameModeScoreDataChanged(local_4.opCall());
    return;
}
void __TickMatchHUD(FVMS_PVP_TDM_HUD &inout Model)
{
    Model.TickMatchHUD();
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __UIGetter_Team1Kills(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetTeam1Kills();
}
int __UIGetter_Team2Kills(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetTeam2Kills();
}
int __UIGetter_KillScoreLimit(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetKillScoreLimit();
}
int __UIGetter_WinnerTeamId(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetWinnerTeamId();
}
TArray<TEUIModelRef<FVM_PVP_TDM_KDAListEntry>> __UIGetter_Modify_KDAListEntries(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetModify_KDAListEntries();
}
TArray<FPVP_TDM_KDAEntry> __UIGetter_Modify_AllPlayersKDA(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetModify_AllPlayersKDA();
}
bool __UIGetter_bScoreboardVisible(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetbScoreboardVisible();
}
int __UIGetter_LocalPlayerKills(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetLocalPlayerKills();
}
int __UIGetter_LocalPlayerDeaths(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetLocalPlayerDeaths();
}
int __UIGetter_LocalPlayerAssists(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetLocalPlayerAssists();
}
FText __UIGetter_LocalPlayerKDAText(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetLocalPlayerKDAText();
}
int __UIGetter_LocalPlayerTeamId(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetLocalPlayerTeamId();
}
FText __UIGetter_LocalPlayerTeamDisplayText(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetLocalPlayerTeamDisplayText();
}
FText __UIGetter_MatchRemainingTimeText(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetMatchRemainingTimeText();
}
bool __UIGetter_bMatchEndResultVisible(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetbMatchEndResultVisible();
}
FText __UIGetter_MatchEndWinnerAnnouncementText(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetMatchEndWinnerAnnouncementText();
}
FText __UIGetter_MatchEndMVPPlayerNameText(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetMatchEndMVPPlayerNameText();
}
int __UIGetter_MatchEndMVPKills(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetMatchEndMVPKills();
}
FText __UIGetter_MatchEndMVPSummaryText(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetMatchEndMVPSummaryText();
}
bool __UIGetter_bLocalPlayerWonMatch(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetbLocalPlayerWonMatch();
}
FText __UIGetter_BackToCityRemainTimeText(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetBackToCityRemainTimeText();
}
bool __UIGetter_bBackToRoomVisible(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetbBackToRoomVisible();
}
bool __UIGetter_bSwitchAvatarPanelVisible(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetbSwitchAvatarPanelVisible();
}
bool __UIGetter_bInBrawlPrepStage(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetbInBrawlPrepStage();
}
FText __UIGetter_BrawlPrepCountdownText(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetBrawlPrepCountdownText();
}
FText __UIGetter_BrawlPrepStageText(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetBrawlPrepStageText();
}
bool __UIGetter_bIsBrawlMode(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetbIsBrawlMode();
}
bool __UIGetter_bIsTDMRoundMode(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetbIsTDMRoundMode();
}
int __UIGetter_CurrentRound(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetCurrentRound();
}
int __UIGetter_Team1RoundWins(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetTeam1RoundWins();
}
int __UIGetter_Team2RoundWins(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetTeam2RoundWins();
}
int __UIGetter_RoundsToWin(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetRoundsToWin();
}
FText __UIGetter_RoundScoreText(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetRoundScoreText();
}
FText __UIGetter_RoundStageText(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetRoundStageText();
}
FText __UIGetter_RoundCountdownText(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetRoundCountdownText();
}
int __UIGetter_RoundWinnerTeamId(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetRoundWinnerTeamId();
}
FText __UIGetter_RoundResultText(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetRoundResultText();
}
bool __UIGetter_bRoundResultVisible(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetbRoundResultVisible();
}
bool __UIGetter_bRoundStageHintVisible(const FVMS_PVP_TDM_HUD &inout Model)
{
    return Model.GetbRoundStageHintVisible();
}
TEUIModelRef<FVMS_PVP_TDM_HUD> __UIGetter_Self(const FVMS_PVP_TDM_HUD &inout Model)
{
    return TEUIModelRef<FVMS_PVP_TDM_HUD>(Model);
}
int __IndexOf_Team1Kills()
{
    return 0;
}
int __IndexOf_Team2Kills()
{
    return 1;
}
int __IndexOf_KillScoreLimit()
{
    return 2;
}
int __IndexOf_WinnerTeamId()
{
    return 3;
}
int __IndexOf_Modify_KDAListEntries()
{
    return 4;
}
int __IndexOf_Modify_AllPlayersKDA()
{
    return 5;
}
int __IndexOf_bScoreboardVisible()
{
    return 6;
}
int __IndexOf_LocalPlayerKills()
{
    return 7;
}
int __IndexOf_LocalPlayerDeaths()
{
    return 8;
}
int __IndexOf_LocalPlayerAssists()
{
    return 9;
}
int __IndexOf_LocalPlayerKDAText()
{
    return 10;
}
int __IndexOf_LocalPlayerTeamId()
{
    return 11;
}
int __IndexOf_LocalPlayerTeamDisplayText()
{
    return 12;
}
int __IndexOf_MatchRemainingTimeText()
{
    return 13;
}
int __IndexOf_MatchEndTime()
{
    return 14;
}
int __IndexOf_bMatchEndResultVisible()
{
    return 15;
}
int __IndexOf_MatchEndWinnerAnnouncementText()
{
    return 16;
}
int __IndexOf_MatchEndMVPPlayerNameText()
{
    return 17;
}
int __IndexOf_MatchEndMVPKills()
{
    return 18;
}
int __IndexOf_MatchEndMVPSummaryText()
{
    return 19;
}
int __IndexOf_bLocalPlayerWonMatch()
{
    return 20;
}
int __IndexOf_bMatchEndAutoHideArmed()
{
    return 21;
}
int __IndexOf_MatchEndAutoHideAt()
{
    return 22;
}
int __IndexOf_BackToCityRemainTimeText()
{
    return 23;
}
int __IndexOf_bBackToRoomVisible()
{
    return 24;
}
int __IndexOf_bBackToCityPressed()
{
    return 25;
}
int __IndexOf_bBackToRoomPressed()
{
    return 26;
}
int __IndexOf_bSwitchAvatarPanelVisible()
{
    return 27;
}
int __IndexOf_SwitchAvatarPanelPageHandle()
{
    return 28;
}
int __IndexOf_bInBrawlPrepStage()
{
    return 29;
}
int __IndexOf_BrawlPrepCountdownText()
{
    return 30;
}
int __IndexOf_BrawlPrepStageText()
{
    return 31;
}
int __IndexOf_BrawlPrepEndTime()
{
    return 32;
}
int __IndexOf_bIsBrawlMode()
{
    return 33;
}
int __IndexOf_bIsTDMRoundMode()
{
    return 34;
}
int __IndexOf_CurrentRound()
{
    return 35;
}
int __IndexOf_Team1RoundWins()
{
    return 36;
}
int __IndexOf_Team2RoundWins()
{
    return 37;
}
int __IndexOf_RoundsToWin()
{
    return 38;
}
int __IndexOf_RoundScoreText()
{
    return 39;
}
int __IndexOf_RoundStageText()
{
    return 40;
}
int __IndexOf_RoundCountdownText()
{
    return 41;
}
int __IndexOf_RoundStageEndTime()
{
    return 42;
}
int __IndexOf_RoundWinnerTeamId()
{
    return 43;
}
int __IndexOf_RoundResultText()
{
    return 44;
}
int __IndexOf_bRoundResultVisible()
{
    return 45;
}
int __IndexOf_bRoundStageHintVisible()
{
    return 46;
}
}
namespace __GeneratedProperties_FVMS_PVP_TDM_HUD
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
