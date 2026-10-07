
namespace UWidget_PVX_LeaderboardPanel
{
    const int ViewID = 0;

}
class UWidget_PVX_LeaderboardPanel : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_PVX_MainHUD> VMS_PVX_MainHUD;
    UPROPERTY()
    UEUICommonListViewBase w_list_pvx_leaderboard;

    UWidget_PVX_LeaderboardPanel()
    {
        return;
    }
    UFUNCTION()
    int VMS_PVX_MainHUD_Level() const
    {
        FVMS_PVX_MainHUD& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = local_2.GetLevel();
        }
        else
        {
            local_5 = 0;
        }
        return local_5;
    }
    UFUNCTION()
    int VMS_PVX_MainHUD_Exp() const
    {
        FVMS_PVX_MainHUD& local_2;
        return local_2 ? local_2.GetExp() : 0;
    }
    UFUNCTION()
    FText VMS_PVX_MainHUD_NextLevelExpStr() const
    {
        FVMS_PVX_MainHUD& local_2;
        FText local_12 = local_2 ? local_2.GetNextLevelExpStr() : FText();
        return local_12;
    }
    UFUNCTION()
    FText VMS_PVX_MainHUD_DeltaExpText() const
    {
        FVMS_PVX_MainHUD& local_2;
        FText local_12 = local_2 ? local_2.GetDeltaExpText() : FText();
        return local_12;
    }
    UFUNCTION()
    int VMS_PVX_MainHUD_TargetPanelSwitcherIndex() const
    {
        FVMS_PVX_MainHUD& local_2;
        return local_2 ? local_2.GetTargetPanelSwitcherIndex() : 0;
    }
    UFUNCTION()
    int VMS_PVX_MainHUD_TriggerAddExpAnim() const
    {
        FVMS_PVX_MainHUD& local_2;
        return local_2 ? local_2.GetTriggerAddExpAnim() : 0;
    }
    UFUNCTION()
    float32 VMS_PVX_MainHUD_ExpBarProgress() const
    {
        FVMS_PVX_MainHUD& local_2;
        return local_2 ? local_2.GetExpBarProgress() : 0.0f;
    }
    UFUNCTION()
    FTimespan VMS_PVX_MainHUD_RemainingTime() const
    {
        FVMS_PVX_MainHUD& local_2;
        FTimespan local_8 = local_2 ? local_2.GetRemainingTime() : FTimespan();
        return local_8;
    }
    UFUNCTION()
    FText VMS_PVX_MainHUD_WinnerFactionText() const
    {
        FVMS_PVX_MainHUD& local_2;
        FText local_12 = local_2 ? local_2.GetWinnerFactionText() : FText();
        return local_12;
    }
    UFUNCTION()
    int VMS_PVX_MainHUD_LocalPlayerKills() const
    {
        FVMS_PVX_MainHUD& local_2;
        return local_2 ? local_2.GetLocalPlayerKills() : 0;
    }
    UFUNCTION()
    int VMS_PVX_MainHUD_LocalPlayerDeaths() const
    {
        FVMS_PVX_MainHUD& local_2;
        return local_2 ? local_2.GetLocalPlayerDeaths() : 0;
    }
    UFUNCTION()
    int VMS_PVX_MainHUD_LocalPlayerAssists() const
    {
        FVMS_PVX_MainHUD& local_2;
        return local_2 ? local_2.GetLocalPlayerAssists() : 0;
    }
    UFUNCTION()
    TArray<FPVX_PlayerKDAEntry> VMS_PVX_MainHUD_Modify_AllPlayersKDA() const
    {
        FVMS_PVX_MainHUD& local_2;
        TArray<FPVX_PlayerKDAEntry> local_12;
        if (local_2)
        {
            local_12 = local_2.GetModify_AllPlayersKDA();
        }
        else
        {
            local_12 = TArray<FPVX_PlayerKDAEntry>();
        }
        return local_12;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> VMS_PVX_MainHUD_Modify_LeaderboardEntries() const
    {
        FVMS_PVX_MainHUD& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetModify_LeaderboardEntries());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    bool VMS_PVX_MainHUD_bLeaderboardVisible() const
    {
        FVMS_PVX_MainHUD& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbLeaderboardVisible();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    int VMS_PVX_MainHUD_CurrencyItemNum() const
    {
        FVMS_PVX_MainHUD& local_2;
        return local_2 ? local_2.GetCurrencyItemNum() : 0;
    }
    UFUNCTION()
    bool VMS_PVX_MainHUD_bEscapePanelVisible() const
    {
        FVMS_PVX_MainHUD& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbEscapePanelVisible();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool VMS_PVX_MainHUD_bEscapeEnergyFull() const
    {
        FVMS_PVX_MainHUD& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbEscapeEnergyFull();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.VMS_PVX_MainHUD.Initialize(this, FName("VMS_PVX_MainHUD"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_PVX_LeaderboardPanel
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
