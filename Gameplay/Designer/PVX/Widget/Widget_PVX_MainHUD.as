
namespace UWidget_PVX_MainHUD
{
    const int ViewID = 0;

}
class UWidget_PVX_MainHUD : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_PVX_MainHUD> VMS_PVX_MainHUD;
    UPROPERTY()
    UWidgetAnimation ShowAddExp;
    UPROPERTY()
    FEUIInputActionDataRow LeaderboardToggleInputActionRow;
    UPROPERTY()
    FEUIActionBinding LeaderboardToggleActionBinding;
    UPROPERTY()
    FGameplayTag AvatarEscapeTag;
    UPROPERTY()
    TArray<USkillConfig> EscapeSkillList;
    UPROPERTY()
    bool bEscapeConfigPassed = false;
    FEUIModelWeakRef __VMS_PVX_MainHUD;


    UFUNCTION()
    void Construct_Implementation()
    {
        this.LeaderboardToggleActionBinding.Register(this, n"OnLeaderboardTogglePressed");
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (!(this.bEscapeConfigPassed) && this.VMS_PVX_MainHUD.IsValid())
        {
            this.AvatarEscapeTag.SetAvatarEscapeTag();
            this.EscapeSkillList.SetEscapeSkillList();
            this.bEscapeConfigPassed = true;
        }
        if (this.VMS_PVX_MainHUD.IsValid())
        {
            InDeltaTime.TickExpBarProgress();
        }
        return;
    }
    UFUNCTION()
    void OnLeaderboardTogglePressed()
    {
        if (this.VMS_PVX_MainHUD.IsValid())
        {
            ToggleLeaderboard();
        }
        return;
    }
    UFUNCTION()
    void OnTriggerAddExpAnim(const int TriggerAddExpAnim)
    {
        this.PlayAnimation(this.ShowAddExp, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        return;
    }
    UFUNCTION()
    void OnWinnerFactionTextChanged(const FText &inout WinnerFactionText)
    {
        if (!(WinnerFactionText.IsEmpty()))
        {
            this.PlayAnimation(this.Anim_In, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        }
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
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_PVX_MainHUD& local_6;
        TEUIModelRef<FVMS_PVX_MainHUD> local_2 = this.VMS_PVX_MainHUD.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 1)
            {
                if (local_57 != 0)
                {
                    if (local_57 != 1)
                    {
                    }
                }
                else
                {
                    this.VMS_PVX_MainHUD.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_PVX_MainHUD::__IndexOf_TriggerAddExpAnim());
                    }
                    if (local_6)
                    {
                        this.OnTriggerAddExpAnim(local_6.GetTriggerAddExpAnim());
                    }
                    this.VMS_PVX_MainHUD.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_PVX_MainHUD::__IndexOf_WinnerFactionText());
                    }
                    if (local_6)
                    {
                        this.OnWinnerFactionTextChanged(local_6.GetWinnerFactionText());
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnTriggerAddExpAnim");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnWinnerFactionTextChanged");
            }
            return;
        }
        this.__VMS_PVX_MainHUD = local_2.opImplConv();
        return;
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

namespace UWidget_PVX_MainHUD
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnTriggerAddExpAnim"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnWinnerFactionTextChanged"));
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
