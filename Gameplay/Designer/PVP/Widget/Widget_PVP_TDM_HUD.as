
namespace UWidget_PVP_TDM_HUD
{
    const int ViewID = 0;

}
class UWidget_PVP_TDM_HUD : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_PVP_TDM_HUD> VMS_PVP_TDM_HUD;
    UPROPERTY()
    FEUIActionBinding ScoreboardToggleActionBinding;
    UPROPERTY()
    FEUIActionBinding SwitchAvatarPanelToggleActionBinding;
    UPROPERTY()
    TArray<FGameplayTag> SwitchAvatarPanelDisableInputTags;

    UWidget_PVP_TDM_HUD()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.ScoreboardToggleActionBinding.Register(this, n"OnScoreboardTogglePressed");
        this.SwitchAvatarPanelToggleActionBinding.Register(this, n"OnSwitchAvatarPanelTogglePressed");
        return;
    }
    UFUNCTION()
    void OnScoreboardTogglePressed()
    {
        if (this.VMS_PVP_TDM_HUD.IsValid())
        {
            ToggleScoreboard();
        }
        return;
    }
    UFUNCTION()
    void OnBackToCityPressed()
    {
        if (this.VMS_PVP_TDM_HUD.IsValid())
        {
            OnBackToCityPressed();
        }
        return;
    }
    UFUNCTION()
    void OnSwitchAvatarPanelTogglePressed()
    {
        if (this.VMS_PVP_TDM_HUD.IsValid())
        {
            this.SwitchAvatarPanelDisableInputTags.OnSwitchAvatarPanelTogglePressed();
        }
        return;
    }
    UFUNCTION()
    int VMS_PVP_TDM_HUD_Team1Kills() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        return local_2 ? local_2.GetTeam1Kills() : 0;
    }
    UFUNCTION()
    int VMS_PVP_TDM_HUD_Team2Kills() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        return local_2 ? local_2.GetTeam2Kills() : 0;
    }
    UFUNCTION()
    int VMS_PVP_TDM_HUD_KillScoreLimit() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        return local_2 ? local_2.GetKillScoreLimit() : 0;
    }
    UFUNCTION()
    int VMS_PVP_TDM_HUD_WinnerTeamId() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        return local_2 ? local_2.GetWinnerTeamId() : 0;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> VMS_PVP_TDM_HUD_Modify_KDAListEntries() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetModify_KDAListEntries());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FPVP_TDM_KDAEntry> VMS_PVP_TDM_HUD_Modify_AllPlayersKDA() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        TArray<FPVP_TDM_KDAEntry> local_12;
        if (local_2)
        {
            local_12 = local_2.GetModify_AllPlayersKDA();
        }
        else
        {
            local_12 = TArray<FPVP_TDM_KDAEntry>();
        }
        return local_12;
    }
    UFUNCTION()
    bool VMS_PVP_TDM_HUD_bScoreboardVisible() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbScoreboardVisible();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    int VMS_PVP_TDM_HUD_LocalPlayerKills() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        return local_2 ? local_2.GetLocalPlayerKills() : 0;
    }
    UFUNCTION()
    int VMS_PVP_TDM_HUD_LocalPlayerDeaths() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        return local_2 ? local_2.GetLocalPlayerDeaths() : 0;
    }
    UFUNCTION()
    int VMS_PVP_TDM_HUD_LocalPlayerAssists() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        return local_2 ? local_2.GetLocalPlayerAssists() : 0;
    }
    UFUNCTION()
    FText VMS_PVP_TDM_HUD_LocalPlayerKDAText() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        FText local_12 = local_2 ? local_2.GetLocalPlayerKDAText() : FText();
        return local_12;
    }
    UFUNCTION()
    int VMS_PVP_TDM_HUD_LocalPlayerTeamId() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        return local_2 ? local_2.GetLocalPlayerTeamId() : 0;
    }
    UFUNCTION()
    FText VMS_PVP_TDM_HUD_LocalPlayerTeamDisplayText() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        FText local_12 = local_2 ? local_2.GetLocalPlayerTeamDisplayText() : FText();
        return local_12;
    }
    UFUNCTION()
    FText VMS_PVP_TDM_HUD_MatchRemainingTimeText() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        FText local_12 = local_2 ? local_2.GetMatchRemainingTimeText() : FText();
        return local_12;
    }
    UFUNCTION()
    bool VMS_PVP_TDM_HUD_bMatchEndResultVisible() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbMatchEndResultVisible();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    FText VMS_PVP_TDM_HUD_MatchEndWinnerAnnouncementText() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        FText local_12 = local_2 ? local_2.GetMatchEndWinnerAnnouncementText() : FText();
        return local_12;
    }
    UFUNCTION()
    FText VMS_PVP_TDM_HUD_MatchEndMVPPlayerNameText() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        FText local_12 = local_2 ? local_2.GetMatchEndMVPPlayerNameText() : FText();
        return local_12;
    }
    UFUNCTION()
    int VMS_PVP_TDM_HUD_MatchEndMVPKills() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        return local_2 ? local_2.GetMatchEndMVPKills() : 0;
    }
    UFUNCTION()
    FText VMS_PVP_TDM_HUD_MatchEndMVPSummaryText() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        FText local_12 = local_2 ? local_2.GetMatchEndMVPSummaryText() : FText();
        return local_12;
    }
    UFUNCTION()
    bool VMS_PVP_TDM_HUD_bLocalPlayerWonMatch() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbLocalPlayerWonMatch();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    FText VMS_PVP_TDM_HUD_BackToCityRemainTimeText() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        FText local_12 = local_2 ? local_2.GetBackToCityRemainTimeText() : FText();
        return local_12;
    }
    UFUNCTION()
    bool VMS_PVP_TDM_HUD_bBackToRoomVisible() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbBackToRoomVisible();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool VMS_PVP_TDM_HUD_bSwitchAvatarPanelVisible() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbSwitchAvatarPanelVisible();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool VMS_PVP_TDM_HUD_bInBrawlPrepStage() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbInBrawlPrepStage();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    FText VMS_PVP_TDM_HUD_BrawlPrepCountdownText() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        FText local_12 = local_2 ? local_2.GetBrawlPrepCountdownText() : FText();
        return local_12;
    }
    UFUNCTION()
    FText VMS_PVP_TDM_HUD_BrawlPrepStageText() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        FText local_12 = local_2 ? local_2.GetBrawlPrepStageText() : FText();
        return local_12;
    }
    UFUNCTION()
    bool VMS_PVP_TDM_HUD_bIsBrawlMode() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbIsBrawlMode();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool VMS_PVP_TDM_HUD_bIsTDMRoundMode() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbIsTDMRoundMode();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    int VMS_PVP_TDM_HUD_CurrentRound() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        return local_2 ? local_2.GetCurrentRound() : 0;
    }
    UFUNCTION()
    int VMS_PVP_TDM_HUD_Team1RoundWins() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        return local_2 ? local_2.GetTeam1RoundWins() : 0;
    }
    UFUNCTION()
    int VMS_PVP_TDM_HUD_Team2RoundWins() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        return local_2 ? local_2.GetTeam2RoundWins() : 0;
    }
    UFUNCTION()
    int VMS_PVP_TDM_HUD_RoundsToWin() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        return local_2 ? local_2.GetRoundsToWin() : 0;
    }
    UFUNCTION()
    FText VMS_PVP_TDM_HUD_RoundScoreText() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        FText local_12 = local_2 ? local_2.GetRoundScoreText() : FText();
        return local_12;
    }
    UFUNCTION()
    FText VMS_PVP_TDM_HUD_RoundStageText() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        FText local_12 = local_2 ? local_2.GetRoundStageText() : FText();
        return local_12;
    }
    UFUNCTION()
    FText VMS_PVP_TDM_HUD_RoundCountdownText() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        FText local_12 = local_2 ? local_2.GetRoundCountdownText() : FText();
        return local_12;
    }
    UFUNCTION()
    int VMS_PVP_TDM_HUD_RoundWinnerTeamId() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        return local_2 ? local_2.GetRoundWinnerTeamId() : 0;
    }
    UFUNCTION()
    FText VMS_PVP_TDM_HUD_RoundResultText() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        FText local_12 = local_2 ? local_2.GetRoundResultText() : FText();
        return local_12;
    }
    UFUNCTION()
    bool VMS_PVP_TDM_HUD_bRoundResultVisible() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbRoundResultVisible();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool VMS_PVP_TDM_HUD_bRoundStageHintVisible() const
    {
        FVMS_PVP_TDM_HUD& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbRoundStageHintVisible();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void VMS_PVP_TDM_HUD_OnBackToCityPressed() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void VMS_PVP_TDM_HUD_OnBackToRoomPressed() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.VMS_PVP_TDM_HUD.Initialize(this, FName("VMS_PVP_TDM_HUD"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_PVP_TDM_HUD
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
