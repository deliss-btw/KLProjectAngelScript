
namespace FVMS_PVX_MainHUD
{
    const int ModelId = 0;

}
struct FPVX_PlayerKDAEntry
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
    int TeamId = -1;
    UPROPERTY()
    int CurrencyAmount = 0;
    UPROPERTY()
    FSoftBrush AvatarIcon;
    UPROPERTY()
    bool bIsLocalPlayer = false;


}

struct FVMS_PVX_MainHUD : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    int m_Level;
    UPROPERTY()
    int m_Exp;
    UPROPERTY()
    FText m_NextLevelExpStr;
    UPROPERTY()
    int m_oldExp;
    UPROPERTY()
    int m_DeltaExp;
    UPROPERTY()
    FText m_DeltaExpText;
    UPROPERTY()
    int m_TargetPanelSwitcherIndex;
    UPROPERTY()
    int m_TriggerAddExpAnim;
    UPROPERTY()
    float32 m_ExpBarProgress;
    UPROPERTY()
    float32 m_ExpBarTargetProgress;
    UPROPERTY()
    float32 m_ExpBarLerpSpeed;
    UPROPERTY()
    int m_ExpBarProgressLevel;
    UPROPERTY()
    FTimespan m_RemainingTime;
    UPROPERTY()
    FText m_WinnerFactionText;
    UPROPERTY()
    int m_LocalPlayerKills;
    UPROPERTY()
    int m_LocalPlayerDeaths;
    UPROPERTY()
    int m_LocalPlayerAssists;
    UPROPERTY()
    TArray<FPVX_PlayerKDAEntry> m_Modify_AllPlayersKDA;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_PVX_LeaderboardListEntry>> m_Modify_LeaderboardEntries;
    UPROPERTY()
    bool m_bLeaderboardVisible;
    UPROPERTY()
    int m_CurrencyItemNum;
    UPROPERTY()
    bool m_bEscapePanelVisible;
    UPROPERTY()
    bool m_bEscapeEnergyFull;
    UPROPERTY()
    FGameplayTag m_AvatarEscapeTag;
    UPROPERTY()
    TArray<USkillConfig> m_EscapeSkillList;
    UPROPERTY()
    FFPTime m_MissionEndTime_Record;
    UPROPERTY()
    FEUIWidgetRef m_SettlementWidgetRef;
    UPROPERTY()
    bool m_bWaitingExpBannerForSettlement;
    UPROPERTY()
    bool m_bWinnerAnnounceAllowed;
    UPROPERTY()
    FText m_CachedWinnerFactionText;
    UPROPERTY()
    bool m_bWaitingSettlementUIDelay;
    UPROPERTY()
    FFPTime m_SettlementUIDelayEndTime;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_CurrencyItemConfig;

    FVMS_PVX_MainHUD()
    {
        this.m_Level = 0;
        this.m_Exp = 0;
        this.m_oldExp = 0;
        this.m_DeltaExp = 0;
        this.m_TargetPanelSwitcherIndex = 0;
        this.m_TriggerAddExpAnim = 0;
        this.m_ExpBarProgress = 0.0f;
        this.m_ExpBarTargetProgress = 0.0f;
        this.m_ExpBarLerpSpeed = 8.0f;
        this.m_ExpBarProgressLevel = 0;
        this.m_LocalPlayerKills = 0;
        this.m_LocalPlayerDeaths = 0;
        this.m_LocalPlayerAssists = 0;
        this.m_bLeaderboardVisible = false;
        this.m_CurrencyItemNum = 0;
        this.m_bEscapePanelVisible = false;
        this.m_bEscapeEnergyFull = false;
        this.m_bWaitingExpBannerForSettlement = false;
        this.m_bWinnerAnnounceAllowed = false;
        this.m_bWaitingSettlementUIDelay = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_PVX_MainHUD(const FVMS_PVX_MainHUD &inout Other)
    {
        this.m_Level = 0;
        this.m_Exp = 0;
        this.m_oldExp = 0;
        this.m_DeltaExp = 0;
        this.m_TargetPanelSwitcherIndex = 0;
        this.m_TriggerAddExpAnim = 0;
        this.m_ExpBarProgress = 0.0f;
        this.m_ExpBarTargetProgress = 0.0f;
        this.m_ExpBarLerpSpeed = 8.0f;
        this.m_ExpBarProgressLevel = 0;
        this.m_LocalPlayerKills = 0;
        this.m_LocalPlayerDeaths = 0;
        this.m_LocalPlayerAssists = 0;
        this.m_bLeaderboardVisible = false;
        this.m_CurrencyItemNum = 0;
        this.m_bEscapePanelVisible = false;
        this.m_bEscapeEnergyFull = false;
        this.m_bWaitingExpBannerForSettlement = false;
        this.m_bWinnerAnnounceAllowed = false;
        this.m_bWaitingSettlementUIDelay = false;
        this.m_Level = int(Other.m_Level);
        this.m_Exp = int(Other.m_Exp);
        this.m_NextLevelExpStr = Other.m_NextLevelExpStr;
        this.m_oldExp = int(Other.m_oldExp);
        this.m_DeltaExp = int(Other.m_DeltaExp);
        this.m_DeltaExpText = Other.m_DeltaExpText;
        this.m_TargetPanelSwitcherIndex = int(Other.m_TargetPanelSwitcherIndex);
        this.m_TriggerAddExpAnim = int(Other.m_TriggerAddExpAnim);
        this.m_ExpBarProgress = Other.m_ExpBarProgress;
        this.m_ExpBarTargetProgress = Other.m_ExpBarTargetProgress;
        this.m_ExpBarLerpSpeed = Other.m_ExpBarLerpSpeed;
        this.m_ExpBarProgressLevel = int(Other.m_ExpBarProgressLevel);
        this.m_RemainingTime = Other.m_RemainingTime;
        this.m_WinnerFactionText = Other.m_WinnerFactionText;
        this.m_LocalPlayerKills = int(Other.m_LocalPlayerKills);
        this.m_LocalPlayerDeaths = int(Other.m_LocalPlayerDeaths);
        this.m_LocalPlayerAssists = int(Other.m_LocalPlayerAssists);
        this.m_Modify_AllPlayersKDA = Other.m_Modify_AllPlayersKDA;
        this.m_Modify_LeaderboardEntries = Other.m_Modify_LeaderboardEntries;
        this.m_bLeaderboardVisible = Other.m_bLeaderboardVisible;
        this.m_CurrencyItemNum = int(Other.m_CurrencyItemNum);
        this.m_bEscapePanelVisible = Other.m_bEscapePanelVisible;
        this.m_bEscapeEnergyFull = Other.m_bEscapeEnergyFull;
        this.m_AvatarEscapeTag = Other.m_AvatarEscapeTag;
        this.m_EscapeSkillList = Other.m_EscapeSkillList;
        this.m_MissionEndTime_Record = Other.m_MissionEndTime_Record;
        this.m_SettlementWidgetRef = Other.m_SettlementWidgetRef;
        this.m_bWaitingExpBannerForSettlement = Other.m_bWaitingExpBannerForSettlement;
        this.m_bWinnerAnnounceAllowed = Other.m_bWinnerAnnounceAllowed;
        this.m_CachedWinnerFactionText = Other.m_CachedWinnerFactionText;
        this.m_bWaitingSettlementUIDelay = Other.m_bWaitingSettlementUIDelay;
        this.m_SettlementUIDelayEndTime = Other.m_SettlementUIDelayEndTime;
        this.m_CurrencyItemConfig = Other.m_CurrencyItemConfig;
        return;
    }
    FVMS_PVX_MainHUD& opAssign(const FVMS_PVX_MainHUD &inout Other)
    {
        this.m_Level = int(Other.m_Level);
        this.m_Exp = int(Other.m_Exp);
        this.m_NextLevelExpStr = Other.m_NextLevelExpStr;
        this.m_oldExp = int(Other.m_oldExp);
        this.m_DeltaExp = int(Other.m_DeltaExp);
        this.m_DeltaExpText = Other.m_DeltaExpText;
        this.m_TargetPanelSwitcherIndex = int(Other.m_TargetPanelSwitcherIndex);
        this.m_TriggerAddExpAnim = int(Other.m_TriggerAddExpAnim);
        this.m_ExpBarProgress = Other.m_ExpBarProgress;
        this.m_ExpBarTargetProgress = Other.m_ExpBarTargetProgress;
        this.m_ExpBarLerpSpeed = Other.m_ExpBarLerpSpeed;
        this.m_ExpBarProgressLevel = int(Other.m_ExpBarProgressLevel);
        this.m_RemainingTime = Other.m_RemainingTime;
        this.m_WinnerFactionText = Other.m_WinnerFactionText;
        this.m_LocalPlayerKills = int(Other.m_LocalPlayerKills);
        this.m_LocalPlayerDeaths = int(Other.m_LocalPlayerDeaths);
        this.m_LocalPlayerAssists = int(Other.m_LocalPlayerAssists);
        this.m_Modify_AllPlayersKDA = Other.m_Modify_AllPlayersKDA;
        this.m_Modify_LeaderboardEntries = Other.m_Modify_LeaderboardEntries;
        this.m_bLeaderboardVisible = Other.m_bLeaderboardVisible;
        this.m_CurrencyItemNum = int(Other.m_CurrencyItemNum);
        this.m_bEscapePanelVisible = Other.m_bEscapePanelVisible;
        this.m_bEscapeEnergyFull = Other.m_bEscapeEnergyFull;
        this.m_AvatarEscapeTag = Other.m_AvatarEscapeTag;
        this.m_EscapeSkillList = Other.m_EscapeSkillList;
        this.m_MissionEndTime_Record = Other.m_MissionEndTime_Record;
        this.m_SettlementWidgetRef = Other.m_SettlementWidgetRef;
        this.m_bWaitingExpBannerForSettlement = Other.m_bWaitingExpBannerForSettlement;
        this.m_bWinnerAnnounceAllowed = Other.m_bWinnerAnnounceAllowed;
        this.m_CachedWinnerFactionText = Other.m_CachedWinnerFactionText;
        this.m_bWaitingSettlementUIDelay = Other.m_bWaitingSettlementUIDelay;
        this.m_SettlementUIDelayEndTime = Other.m_SettlementUIDelayEndTime;
        return Other.m_CurrencyItemConfig;
    }
    void PostLoad()
    {
        bool local_1;
        int local_16 = 0;
        if (!(FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool()))
        {
            local_1 = false;
        }
        else
        {
            FECSWorldPtr local_4 = ECS::GetECSWorld();
            Has local_8;
            local_1 = local_8.opCall();
        }
        if (local_1)
        {
            FECSWorldPtr local_4_2 = ECS::GetECSWorld();
            if (local_16.GameModeFlowSettings.IsValid())
            {
                Get local_20;
                TDataObjectPtr<FItemConfig> local_44 = local_20.opCall().CurrencyItemConfig;
                if (local_44.IsSet())
                {
                    this.SetCurrencyItemConfig(local_44);
                    return;
                }
            }
        }
        UAS_GameModeSettingsPVX local_76 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if (local_76 == nullptr)
        {
            local_1 = false;
        }
        else
        {
            local_1 = local_76.CurrencyItemConfig;
        }
        if (local_1)
        {
            this.SetCurrencyItemConfig(local_76.CurrencyItemConfig);
        }
        return;
    }
    void OnPVXSettlementTrigger(const FCE_PVXSettlementTrigger &inout Event)
    {
        if (this.GetSettlementWidgetRef().IsValid() || this.GetbWaitingExpBannerForSettlement() || this.GetbWaitingSettlementUIDelay())
        {
            return;
        }
        if (this.HasPendingLevelUpBanner())
        {
            this.SetbWaitingExpBannerForSettlement(true);
            return;
        }
        this.BeginWinnerAnnounceThenSettlement();
        return;
    }
    void OnCommonPopupManagerChanged(const FCE_NotifyCommonPopupManagerChanged &inout Event)
    {
        if (!(this.GetbWaitingExpBannerForSettlement()))
        {
            return;
        }
        if (this.GetSettlementWidgetRef().IsValid())
        {
            this.SetbWaitingExpBannerForSettlement(false);
            return;
        }
        if (this.HasPendingLevelUpBanner())
        {
            return;
        }
        this.SetbWaitingExpBannerForSettlement(false);
        this.BeginWinnerAnnounceThenSettlement();
        return;
    }
    void BeginWinnerAnnounceThenSettlement()
    {
        if (this.GetSettlementWidgetRef().IsValid() || this.GetbWaitingSettlementUIDelay())
        {
            return;
        }
        this.SetbWinnerAnnounceAllowed(true);
        this.SetWinnerFactionText(this.GetCachedWinnerFactionText());
        float32 local_4 = this.GetSettlementUIDelayTime();
        if (local_4 > 0.0f)
        {
            this.SetbWaitingSettlementUIDelay(true);
            this.SetSettlementUIDelayEndTime((ECS::GetContextTime() + FFPTime(local_4)));
            return;
        }
        this.ShowSettlementWidget();
        return;
    }
    float32 GetSettlementUIDelayTime()
    {
        int local_14 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        bool local_7 = local_6.opCall();
        if (local_7)
        {
            FECSWorldPtr local_2_2 = ECS::GetECSWorld();
            if (local_14.GameModeFlowSettings.IsValid())
            {
                Get local_18;
                return FMath::Max(0.0f, local_18.opCall().PvxSettlementDelayTime);
            }
        }
        return 0.0f;
    }
    void ShowSettlementWidget()
    {
        this.SetbWaitingSettlementUIDelay(false);
        if (this.GetSettlementWidgetRef().IsValid())
        {
            return;
        }
        this.SetSettlementWidgetRef(FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Mode_PVX_SettlementMain));
        return;
    }
    bool HasPendingLevelUpBanner()
    {
        int local_18 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_10;
        if (!(local_2.IsValid()) || !(local_10.opCall()))
        {
            return false;
        }
        TArray<FCommonPopupInfo> local_22;
        local_18.GetPopupsList(GameplayTags::UI_Type_Commonpupop_Banner_Banner, local_22);
        return (local_22.Num() > 0);
    }
    void RebuildAllPlayersKDAList(const TMap<FECSEntity, FPVX_PlayerData> &inout PlayerInfoMap)
    {
        int local_30;
        int local_31;
        TArray<FECSEntity> local_4;
        for (auto& local_24 : PlayerInfoMap)
        {
            local_4.Add(local_24.GetKey());
        }
        int local_26 = 0;
        for (; local_26 < local_4.Num(); ++local_26)
        {
            int local_29 = local_26 + 1;
            for (; local_29 < local_4.Num(); ++local_29)
            {
                local_30 = PlayerInfoMap[local_4[local_26]].GetCurrencyAmount();
                local_31 = PlayerInfoMap[local_4[local_29]].GetCurrencyAmount();
                if (local_31 > local_30)
                {
                    FECSEntity local_36 = local_4[local_26];
                    local_4[local_26] = local_4[local_29];
                    local_4[local_29] = local_36;
                }
            }
        }
        TArray<FPVX_PlayerKDAEntry> local_40;
        TArray<TEUIModelRef<FVM_PVX_LeaderboardListEntry>> local_44;
        local_40.Reserve(local_4.Num());
        local_44.Reserve(local_4.Num());
        for (auto& local_58 : local_4)
        {
            const FPVX_PlayerData& local_60 = PlayerInfoMap[local_58];
            FPVX_PlayerKDAEntry local_124;
            FString local_132;
            if (local_60.GetPlayerName().IsEmpty())
            {
                local_132 = "зЋ©е®¶";
            }
            else
            {
                local_132 = local_60.GetPlayerName();
            }
            local_124.PlayerName = local_132;
            local_124.PlayerIdText = String::Conv_IntToString(::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_58));
            local_124.Kills = local_60.GetKills();
            local_124.Deaths = local_60.GetDeaths();
            local_124.Assists = local_60.GetAssists();
            local_124.TeamId = local_60.GetTeamId();
            local_124.bIsLocalPlayer = this.GetContext().GetLocalPlayer().IsValid() && (local_58 == this.GetContext().GetLocalPlayer());
            local_124.CurrencyAmount = local_60.GetCurrencyAmount();
            local_124.AvatarIcon = ::GetDefaultedAvatarConfig(local_58).AvatarIcon;
            local_40.Add(local_124);
            local_44.Add(TEUIModelRef<FVM_PVX_LeaderboardListEntry>(::FVM_PVX_LeaderboardListEntry::Create(this.GetContext().Manager, local_58)));
        }
        this.SetModify_AllPlayersKDA(local_40);
        this.SetModify_LeaderboardEntries(local_44);
        return;
    }
    void ToggleLeaderboard()
    {
        this.SetbLeaderboardVisible(!(this.GetbLeaderboardVisible()));
        if (this.GetbLeaderboardVisible())
        {
            TMap<FECSEntity, FPVX_PlayerData> local_26 = ::FGameModeDataBridge::GetPVXPlayerInfoMap(ECS::GetECSWorld());
            if (local_26.Num() > 0)
            {
                this.RebuildAllPlayersKDAList(local_26);
            }
        }
        return;
    }
    void UpdateExpBarTarget(const int InCurLevelExp, const int NextLevelExp)
    {
        int local_4;
        if (InCurLevelExp < 0)
        {
            local_4 = 0;
        }
        else
        {
            local_4 = InCurLevelExp;
        }
        if (NextLevelExp <= local_4)
        {
            this.SetExpBarTargetProgress(1.0f);
        }
        else
        {
            this.SetExpBarTargetProgress(FMath::Clamp((float32((this.GetExp() - local_4)) / (NextLevelExp - local_4)), 0.0f, 1.0f));
        }
        if (this.GetLevel() > this.GetExpBarProgressLevel())
        {
            this.SetExpBarProgress(0.0f);
        }
        this.SetExpBarProgressLevel(this.GetLevel());
        return;
    }
    void TickExpBarProgress(const float32 DeltaTime)
    {
        if (FMath::Abs((this.GetExpBarProgress() - this.GetExpBarTargetProgress())) < 0.001f)
        {
            if (this.GetExpBarProgress() != this.GetExpBarTargetProgress())
            {
                this.SetExpBarProgress(this.GetExpBarTargetProgress());
            }
            return;
        }
        float32 local_2 = FMath::Clamp(DeltaTime * this.GetExpBarLerpSpeed(), 0.0f, 1.0f);
        this.SetExpBarProgress(FMath::Lerp(this.GetExpBarProgress(), this.GetExpBarTargetProgress(), local_2));
        return;
    }
    void HandleCalc(const FCS_PVX_ScoreData &inout ScoreData)
    {
        int local_16 = 0;
        const FPVX_PlayerData& local_28;
        int local_29;
        FText local_54;
        if (this.GetContext().GetLocalPlayer().IsValid())
        {
            FECSEntity local_10 = FECSEntity(this.GetContext().GetLocalPlayer());
            if (ScoreData.GetPlayerInfoMap().Contains(local_10))
            {
                FECSEntity local_4 = this.GetContext().GetLocalPlayer();
                if (int(local_16.GetFaction()) == 6)
                {
                    this.SetTargetPanelSwitcherIndex(1);
                }
                else
                {
                    this.SetTargetPanelSwitcherIndex(0);
                }
                const FFPTime& local_22 = ScoreData.GetMissionEndTime();
                if ((local_22.ToSeconds()) > (0.0))
                {
                    this.SetMissionEndTime_Record(local_22);
                    this.UpdateCountDownUI();
                }
                local_28 = ScoreData.GetPlayerInfoMap()[local_10];
                this.SetLevel(local_28.GetLevel());
                this.SetExp(local_28.GetExp());
                EFaction local_17 = local_16.GetFaction();
                int local_18 = ::PVXUtil::GetLevelRequiredExp((this.GetLevel() + 1));
                if (local_18 != -1)
                {
                    FNumberFormattingOptions local_35;
                    this.SetNextLevelExpStr(FText::AsNumber(local_18, local_35));
                }
                else
                {
                    this.SetNextLevelExpStr(NSLOCTEXT("PVX", "MaxLevel", "MAX"));
                }
                EFaction local_17_2 = local_16.GetFaction();
                local_29 = ::PVXUtil::GetLevelRequiredExp(this.GetLevel());
                this.UpdateExpBarTarget(local_29, local_18);
                if (this.GetoldExp() != this.GetExp())
                {
                    this.SetDeltaExp((this.GetExp() - this.GetoldExp()));
                    if (this.GetDeltaExp() >= 0)
                    {
                        FNumberFormattingOptions local_35;
                        local_54 = FText::Format(FText::FromString("+{0}"), FText::AsNumber(this.GetDeltaExp(), local_35));
                    }
                    else
                    {
                        FNumberFormattingOptions local_35;
                        local_54 = FText::AsNumber(this.GetDeltaExp(), local_35);
                    }
                    this.SetDeltaExpText(local_54);
                    this.SetTriggerAddExpAnim((this.GetTriggerAddExpAnim() + 1));
                    this.SetoldExp(this.GetExp());
                }
                this.SetLocalPlayerKills(local_28.GetKills());
                this.SetLocalPlayerDeaths(local_28.GetDeaths());
                this.SetLocalPlayerAssists(local_28.GetAssists());
            }
            this.RebuildAllPlayersKDAList(ScoreData.GetPlayerInfoMap());
            local_29 = ScoreData.GetWinnerTeamId();
            if (local_29 >= 0)
            {
                TArray<FString> local_58;
                for (auto& local_76 : ScoreData.GetPlayerInfoMap())
                {
                    local_76;
                    if (local_28.GetTeamId() == local_29)
                    {
                        FString local_80 = FString(local_28.GetPlayerName());
                        if (local_80.IsEmpty())
                        {
                            local_80 = "зЋ©е®¶";
                        }
                        local_58.Add(local_80);
                    }
                }
                if (local_58.Num() > 0)
                {
                    this.SetCachedWinnerFactionText(FText::Format(NSLOCTEXT("PVX", "Winner", "иѓње€©иЂ…пјљ\n{0} !!!"), FText::FromString(FString::Join(local_58, "\n"))));
                    if (this.GetbWinnerAnnounceAllowed())
                    {
                        this.SetWinnerFactionText(this.GetCachedWinnerFactionText());
                    }
                }
            }
        }
        return;
    }
    void HandleUniversalScoreChanged(const FCS_GameMode_ScoreData &inout ScoreData)
    {
        this.RefreshFromUniversalData();
        return;
    }
    void HandleProgressDataChanged(const FCS_PVX_ProgressData &inout ProgressData)
    {
        this.RefreshFromUniversalData();
        return;
    }
    void RefreshFromUniversalData()
    {
        if (!(this.GetContext().GetLocalPlayer().IsValid()))
        {
            return;
        }
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        TMap<FECSEntity, FPVX_PlayerData> local_30 = ::FGameModeDataBridge::GetPVXPlayerInfoMap(local_8);
        FECSEntity local_54 = FECSEntity(this.GetContext().GetLocalPlayer());
        if (local_30.Contains(local_54))
        {
            this.SetTargetPanelSwitcherIndex((int(::FGameModeDataBridge::GetPVXPlayerFaction(local_8, local_54)) == 6 ? 1 : 0));
            FFPTime local_64 = ::FGameModeDataBridge::GetPVXMissionEndTime(local_8);
            if ((local_64.ToSeconds()) > (0.0))
            {
                this.SetMissionEndTime_Record(local_64);
                this.UpdateCountDownUI();
            }
            FPVX_PlayerData& local_70 = local_30[local_54];
            this.SetLevel(local_70.GetLevel());
            this.SetExp(local_70.GetExp());
            int local_57 = ::PVXGameModeUtils::GetLevelRequiredExp(this.GetLevel() + 1);
            if (local_57 != -1)
            {
                FNumberFormattingOptions local_77;
                this.SetNextLevelExpStr(FText::AsNumber(local_57, local_77));
            }
            else
            {
                this.SetNextLevelExpStr(NSLOCTEXT("PVX", "MaxLevel", "MAX"));
            }
            int local_71 = ::PVXGameModeUtils::GetLevelRequiredExp(this.GetLevel());
            this.UpdateExpBarTarget(local_71, local_57);
            int local_83 = this.GetExp();
            if (this.GetoldExp() != local_83)
            {
                local_83 = this.GetoldExp();
                this.SetDeltaExp(this.GetExp() - local_83);
                FText local_96;
                local_83 = this.GetDeltaExp();
                if (local_83 >= 0)
                {
                    FNumberFormattingOptions local_77;
                    local_83 = this.GetDeltaExp();
                    local_96 = FText::Format(FText::FromString("+{0}"), FText::AsNumber(local_83, local_77));
                }
                else
                {
                    FNumberFormattingOptions local_77;
                    local_96 = FText::AsNumber(this.GetDeltaExp(), local_77);
                }
                this.SetDeltaExpText(local_96);
                this.SetTriggerAddExpAnim(this.GetTriggerAddExpAnim() + 1);
                local_83 = this.GetExp();
                this.SetoldExp(local_83);
            }
            this.SetLocalPlayerKills(local_70.GetKills());
            local_83 = local_70.GetDeaths();
            this.SetLocalPlayerDeaths(local_83);
            this.SetLocalPlayerAssists(local_70.GetAssists());
        }
        this.RebuildAllPlayersKDAList(local_30);
        int local_83_2 = ::FGameModeDataBridge::GetPVXWinnerTeamId(local_8);
        if (local_83_2 >= 0)
        {
            TArray<FString> local_100;
            for (auto& local_118 : local_30)
            {
                local_118;
                if (GetTeamId() == local_83_2)
                {
                    FString local_126;
                    local_126.GetPlayerName();
                    FString local_122 = local_126;
                    if (local_122.IsEmpty())
                    {
                        local_122 = "зЋ©е®¶";
                    }
                    local_100.Add(local_122);
                }
            }
            int local_71_2 = local_100.Num();
            if (local_71_2 > 0)
            {
                this.SetCachedWinnerFactionText(FText::FromString(FString::Join(local_100, "\n")));
                if (this.GetbWinnerAnnounceAllowed())
                {
                    this.SetWinnerFactionText(this.GetCachedWinnerFactionText());
                }
            }
        }
        return;
    }
    void Tick(const FCS_LocalPlayer &inout LocalPlayer)
    {
        int local_39;
        if (this.GetbWaitingExpBannerForSettlement() && !(this.HasPendingLevelUpBanner()))
        {
            this.SetbWaitingExpBannerForSettlement(false);
            this.BeginWinnerAnnounceThenSettlement();
        }
        if (this.GetbWaitingSettlementUIDelay() && (ECS::GetContextTime().opCmp(this.GetSettlementUIDelayEndTime()) >= 0))
        {
            this.ShowSettlementWidget();
        }
        if (this.GetMissionEndTime_Record().ToSeconds() > 0.0)
        {
            this.UpdateCountDownUI();
        }
        TEUIModelRef<FM_ItemData> local_36 = ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetSumItem(this.GetCurrencyItemConfig());
        if (local_36.IsValid())
        {
            local_39 = local_36.opArrow().GetNum();
        }
        else
        {
            local_39 = 0;
        }
        this.SetCurrencyItemNum(local_39);
        this.UpdateEscapePanelVisibility();
        this.UpdateEscapeEnergyFull();
        return;
    }
    void UpdateEscapePanelVisibility()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void UpdateEscapeEnergyFull()
    {
        int local_32 = 0;
        bool local_5 = !(this.GetContext().GetLocalPlayer().IsValid());
        if (local_5)
        {
            local_5 = true;
        }
        else
        {
            FECSEntity local_4 = this.GetContext().GetLocalPlayer();
            Has local_10;
            local_5 = !(local_10.opCall());
        }
        if (local_5)
        {
            this.SetbEscapeEnergyFull(false);
            return;
        }
        FECSEntity local_4_2 = this.GetContext().GetLocalPlayer();
        Get local_20;
        if (!(FECSEntity(local_20.opCall().GetPlayerPawnEntity()).IsValid()))
        {
            this.SetbEscapeEnergyFull(false);
            return;
        }
        UDamageSettings local_22 = ::DamageSettings::Get();
        if (local_22.HitStunDetachMax <= 0.0f)
        {
            this.SetbEscapeEnergyFull(false);
            return;
        }
        if (!(local_32))
        {
            this.SetbEscapeEnergyFull(false);
            return;
        }
        FECSWorldPtr local_34 = ECS::GetECSWorld();
        if (!(local_34.IsValid()))
        {
            this.SetbEscapeEnergyFull(false);
            return;
        }
        if ((int(::FGameModeDataBridge::GetPVXPlayerFaction(local_34, this.GetContext().GetLocalPlayer()))) == 6)
        {
            this.SetbEscapeEnergyFull(false);
            return;
        }
        this.SetbEscapeEnergyFull((local_32.GetAccumulatedDetachValue() >= local_22.HitStunDetachMax));
        return;
    }
    void UpdateCountDownUI()
    {
        float local_6 = (FFPTime(this.GetMissionEndTime_Record()) - this.GetContext().Time).ToSeconds();
        if (local_6 < 0.0)
        {
            this.SetRemainingTime(FTimespan::Zero());
            return;
        }
        this.SetRemainingTime(FTimespan::FromSeconds(local_6));
        return;
    }
    TDataObjectPtr<FItemConfig> GetCurrencyItemConfig()
    {
        bool local_1;
        int local_40 = 0;
        if (this.GetCurrencyItemConfig().IsSet())
        {
            return this.GetCurrencyItemConfig();
        }
        if (!(FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool()))
        {
            local_1 = false;
        }
        else
        {
            FECSWorldPtr local_28 = ECS::GetECSWorld();
            Has local_32;
            local_1 = local_32.opCall();
        }
        if (local_1)
        {
            FECSWorldPtr local_28_2 = ECS::GetECSWorld();
            if (local_40.GameModeFlowSettings.IsValid())
            {
                Get local_44;
                TDataObjectPtr<FItemConfig> local_68 = local_44.opCall().CurrencyItemConfig;
                if (local_68.IsSet())
                {
                    this.SetCurrencyItemConfig(local_68);
                    return this.GetCurrencyItemConfig();
                }
            }
        }
        UAS_GameModeSettingsPVX local_76 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if (local_76 != nullptr && local_76.CurrencyItemConfig.IsSet())
        {
            this.SetCurrencyItemConfig(local_76.CurrencyItemConfig);
        }
        return this.GetCurrencyItemConfig();
    }
    int GetLevel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Level;
    }
    void SetLevel(const int __Value) property
    {
        if (this.m_Level == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Level = __Value;
        return;
    }
    int GetExp() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Exp;
    }
    void SetExp(const int __Value) property
    {
        if (this.m_Exp == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Exp = __Value;
        return;
    }
    const FText GetNextLevelExpStr() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_NextLevelExpStr() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetNextLevelExpStr(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_NextLevelExpStr = __Value;
        return;
    }
    int GetoldExp() const property
    {
        this.TrackPropertyRead(3);
        return this.m_oldExp;
    }
    void SetoldExp(const int __Value) property
    {
        if (this.m_oldExp == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_oldExp = __Value;
        return;
    }
    int GetDeltaExp() const property
    {
        this.TrackPropertyRead(4);
        return this.m_DeltaExp;
    }
    void SetDeltaExp(const int __Value) property
    {
        if (this.m_DeltaExp == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DeltaExp = __Value;
        return;
    }
    const FText GetDeltaExpText() const property
    {
        const FText __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FText GetModify_DeltaExpText() property
    {
        FText __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetDeltaExpText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_DeltaExpText = __Value;
        return;
    }
    int GetTargetPanelSwitcherIndex() const property
    {
        this.TrackPropertyRead(6);
        return this.m_TargetPanelSwitcherIndex;
    }
    void SetTargetPanelSwitcherIndex(const int __Value) property
    {
        if (this.m_TargetPanelSwitcherIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_TargetPanelSwitcherIndex = __Value;
        return;
    }
    int GetTriggerAddExpAnim() const property
    {
        this.TrackPropertyRead(7);
        return this.m_TriggerAddExpAnim;
    }
    void SetTriggerAddExpAnim(const int __Value) property
    {
        if (this.m_TriggerAddExpAnim == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_TriggerAddExpAnim = __Value;
        return;
    }
    const float32 GetExpBarProgress() const property
    {
        const float32 __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    float32 GetModify_ExpBarProgress() property
    {
        float32 __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetExpBarProgress(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_ExpBarProgress = __Value;
        return;
    }
    const float32 GetExpBarTargetProgress() const property
    {
        const float32 __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    float32 GetModify_ExpBarTargetProgress() property
    {
        float32 __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetExpBarTargetProgress(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_ExpBarTargetProgress = __Value;
        return;
    }
    const float32 GetExpBarLerpSpeed() const property
    {
        const float32 __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    float32 GetModify_ExpBarLerpSpeed() property
    {
        float32 __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetExpBarLerpSpeed(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_ExpBarLerpSpeed = __Value;
        return;
    }
    int GetExpBarProgressLevel() const property
    {
        this.TrackPropertyRead(11);
        return this.m_ExpBarProgressLevel;
    }
    void SetExpBarProgressLevel(const int __Value) property
    {
        if (this.m_ExpBarProgressLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_ExpBarProgressLevel = __Value;
        return;
    }
    FTimespan GetRemainingTime() const property
    {
        FTimespan __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FTimespan GetModify_RemainingTime() property
    {
        FTimespan __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetRemainingTime(const FTimespan &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_RemainingTime = __Value;
        return;
    }
    const FText GetWinnerFactionText() const property
    {
        const FText __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FText GetModify_WinnerFactionText() property
    {
        FText __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetWinnerFactionText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_WinnerFactionText = __Value;
        return;
    }
    int GetLocalPlayerKills() const property
    {
        this.TrackPropertyRead(14);
        return this.m_LocalPlayerKills;
    }
    void SetLocalPlayerKills(const int __Value) property
    {
        if (this.m_LocalPlayerKills == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_LocalPlayerKills = __Value;
        return;
    }
    int GetLocalPlayerDeaths() const property
    {
        this.TrackPropertyRead(15);
        return this.m_LocalPlayerDeaths;
    }
    void SetLocalPlayerDeaths(const int __Value) property
    {
        if (this.m_LocalPlayerDeaths == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_LocalPlayerDeaths = __Value;
        return;
    }
    int GetLocalPlayerAssists() const property
    {
        this.TrackPropertyRead(16);
        return this.m_LocalPlayerAssists;
    }
    void SetLocalPlayerAssists(const int __Value) property
    {
        if (this.m_LocalPlayerAssists == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_LocalPlayerAssists = __Value;
        return;
    }
    const TArray<FPVX_PlayerKDAEntry> GetModify_AllPlayersKDA() const property
    {
        const TArray<FPVX_PlayerKDAEntry> __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    TArray<FPVX_PlayerKDAEntry> GetModify_Modify_AllPlayersKDA() property
    {
        TArray<FPVX_PlayerKDAEntry> __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetModify_AllPlayersKDA(const TArray<FPVX_PlayerKDAEntry> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_Modify_AllPlayersKDA = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_PVX_LeaderboardListEntry>> GetModify_LeaderboardEntries() const property
    {
        const TArray<TEUIModelRef<FVM_PVX_LeaderboardListEntry>> __r;
        this.TrackPropertyRead(18);
        return __r;
    }
    TArray<TEUIModelRef<FVM_PVX_LeaderboardListEntry>> GetModify_Modify_LeaderboardEntries() property
    {
        TArray<TEUIModelRef<FVM_PVX_LeaderboardListEntry>> __r;
        this.MarkPropertyDirty(18);
        return __r;
    }
    void SetModify_LeaderboardEntries(const TArray<TEUIModelRef<FVM_PVX_LeaderboardListEntry>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_Modify_LeaderboardEntries = __Value;
        return;
    }
    bool GetbLeaderboardVisible() const property
    {
        this.TrackPropertyRead(19);
        return this.m_bLeaderboardVisible;
    }
    void SetbLeaderboardVisible(const bool __Value) property
    {
        if (!(this.m_bLeaderboardVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_bLeaderboardVisible = __Value;
        return;
    }
    int GetCurrencyItemNum() const property
    {
        this.TrackPropertyRead(20);
        return this.m_CurrencyItemNum;
    }
    void SetCurrencyItemNum(const int __Value) property
    {
        if (this.m_CurrencyItemNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_CurrencyItemNum = __Value;
        return;
    }
    bool GetbEscapePanelVisible() const property
    {
        this.TrackPropertyRead(21);
        return this.m_bEscapePanelVisible;
    }
    void SetbEscapePanelVisible(const bool __Value) property
    {
        if (!(this.m_bEscapePanelVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_bEscapePanelVisible = __Value;
        return;
    }
    bool GetbEscapeEnergyFull() const property
    {
        this.TrackPropertyRead(22);
        return this.m_bEscapeEnergyFull;
    }
    void SetbEscapeEnergyFull(const bool __Value) property
    {
        if (!(this.m_bEscapeEnergyFull) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_bEscapeEnergyFull = __Value;
        return;
    }
    const FGameplayTag GetAvatarEscapeTag() const property
    {
        const FGameplayTag __r;
        this.TrackPropertyRead(23);
        return __r;
    }
    FGameplayTag GetModify_AvatarEscapeTag() property
    {
        FGameplayTag __r;
        this.MarkPropertyDirty(23);
        return __r;
    }
    void SetAvatarEscapeTag(const FGameplayTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(23);
        this.m_AvatarEscapeTag = __Value;
        return;
    }
    const TArray<USkillConfig> GetEscapeSkillList() const property
    {
        const TArray<USkillConfig> __r;
        this.TrackPropertyRead(24);
        return __r;
    }
    TArray<USkillConfig> GetModify_EscapeSkillList() property
    {
        TArray<USkillConfig> __r;
        this.MarkPropertyDirty(24);
        return __r;
    }
    void SetEscapeSkillList(const TArray<USkillConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(24);
        this.m_EscapeSkillList = __Value;
        return;
    }
    const FFPTime GetMissionEndTime_Record() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(25);
        return __r;
    }
    FFPTime GetModify_MissionEndTime_Record() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(25);
        return __r;
    }
    void SetMissionEndTime_Record(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(25);
        this.m_MissionEndTime_Record = __Value;
        return;
    }
    const FEUIWidgetRef GetSettlementWidgetRef() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(26);
        return __r;
    }
    FEUIWidgetRef GetModify_SettlementWidgetRef() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(26);
        return __r;
    }
    void SetSettlementWidgetRef(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(26);
        this.m_SettlementWidgetRef = __Value;
        return;
    }
    bool GetbWaitingExpBannerForSettlement() const property
    {
        this.TrackPropertyRead(27);
        return this.m_bWaitingExpBannerForSettlement;
    }
    void SetbWaitingExpBannerForSettlement(const bool __Value) property
    {
        if (!(this.m_bWaitingExpBannerForSettlement) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(27);
        this.m_bWaitingExpBannerForSettlement = __Value;
        return;
    }
    bool GetbWinnerAnnounceAllowed() const property
    {
        this.TrackPropertyRead(28);
        return this.m_bWinnerAnnounceAllowed;
    }
    void SetbWinnerAnnounceAllowed(const bool __Value) property
    {
        if (!(this.m_bWinnerAnnounceAllowed) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(28);
        this.m_bWinnerAnnounceAllowed = __Value;
        return;
    }
    const FText GetCachedWinnerFactionText() const property
    {
        const FText __r;
        this.TrackPropertyRead(29);
        return __r;
    }
    FText GetModify_CachedWinnerFactionText() property
    {
        FText __r;
        this.MarkPropertyDirty(29);
        return __r;
    }
    void SetCachedWinnerFactionText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(29);
        this.m_CachedWinnerFactionText = __Value;
        return;
    }
    bool GetbWaitingSettlementUIDelay() const property
    {
        this.TrackPropertyRead(30);
        return this.m_bWaitingSettlementUIDelay;
    }
    void SetbWaitingSettlementUIDelay(const bool __Value) property
    {
        if (!(this.m_bWaitingSettlementUIDelay) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(30);
        this.m_bWaitingSettlementUIDelay = __Value;
        return;
    }
    const FFPTime GetSettlementUIDelayEndTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(31);
        return __r;
    }
    FFPTime GetModify_SettlementUIDelayEndTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(31);
        return __r;
    }
    void SetSettlementUIDelayEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(31);
        this.m_SettlementUIDelayEndTime = __Value;
        return;
    }
    const TDataObjectPtr<FItemConfig> GetCurrencyItemConfig() const property
    {
        const TDataObjectPtr<FItemConfig> __r;
        this.TrackPropertyRead(32);
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_CurrencyItemConfig() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.MarkPropertyDirty(32);
        return __r;
    }
    void SetCurrencyItemConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(32);
        this.m_CurrencyItemConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_PVX_MainHUD
{
    UPROPERTY()
    TEUIModelRef<FVMS_PVX_MainHUD> Self;

    __GeneratedProperties_FVMS_PVX_MainHUD()
    {
        return;
    }
}

namespace FVMS_PVX_MainHUD
{
FVMS_PVX_MainHUD& Get(const UObject ContextObject)
{
    return FVMS_PVX_MainHUD::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_PVX_MainHUD GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_PVX_MainHUD __r;
    TEUIModelRef<FVMS_PVX_MainHUD> local_6 = TEUIModelRef<FVMS_PVX_MainHUD>(EUIInternal::MakeModelWithManager(Manager, FVMS_PVX_MainHUD::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Level";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Exp";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NextLevelExpStr";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DeltaExpText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TargetPanelSwitcherIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TriggerAddExpAnim";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExpBarProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RemainingTime";
    local_14.TypeName = "FTimespan";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WinnerFactionText";
    local_14.TypeName = "FText";
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
    local_14.PropertyName = "Modify_AllPlayersKDA";
    local_14.TypeName = "TArray<FPVX_PlayerKDAEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Modify_LeaderboardEntries";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_PVX_LeaderboardListEntry>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bLeaderboardVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrencyItemNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bEscapePanelVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bEscapeEnergyFull";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_PVX_MainHUD>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_PVX_MainHUD;
    FEUIModelEventDefine local_22;
    local_22.FunctionName = "__OnPVXSettlementTrigger";
    local_22.EventType = FCE_PVXSettlementTrigger;
    Result.EventFunctions.Add(local_22);
    local_22.FunctionName = "__OnCommonPopupManagerChanged";
    local_22.EventType = FCE_NotifyCommonPopupManagerChanged;
    Result.EventFunctions.Add(local_22);
    FEUIModelMonitorDefine local_32;
    local_32.FunctionName = "__HandleCalc";
    local_32.ComponentType = FCS_PVX_ScoreData;
    Result.MonitorFunctions.Add(local_32);
    local_32.FunctionName = "__HandleUniversalScoreChanged";
    local_32.ComponentType = FCS_GameMode_ScoreData;
    Result.MonitorFunctions.Add(local_32);
    local_32.FunctionName = "__HandleProgressDataChanged";
    local_32.ComponentType = FCS_PVX_ProgressData;
    Result.MonitorFunctions.Add(local_32);
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_PVX_MainHUD;
}
void __OnPVXSettlementTrigger(FVMS_PVX_MainHUD &inout Model, const FCE_PVXSettlementTrigger &inout Event)
{
    Model.OnPVXSettlementTrigger(Event);
    return;
}
void __OnCommonPopupManagerChanged(FVMS_PVX_MainHUD &inout Model, const FCE_NotifyCommonPopupManagerChanged &inout Event)
{
    Model.OnCommonPopupManagerChanged(Event);
    return;
}
void __HandleCalc(FVMS_PVX_MainHUD &inout Model, const FECSEntity &inout Entity, const FCS_PVX_ScoreData &inout Component)
{
    Get local_4;
    Model.HandleCalc(local_4.opCall());
    return;
}
void __HandleUniversalScoreChanged(FVMS_PVX_MainHUD &inout Model, const FECSEntity &inout Entity, const FCS_GameMode_ScoreData &inout Component)
{
    Get local_4;
    Model.HandleUniversalScoreChanged(local_4.opCall());
    return;
}
void __HandleProgressDataChanged(FVMS_PVX_MainHUD &inout Model, const FECSEntity &inout Entity, const FCS_PVX_ProgressData &inout Component)
{
    Get local_4;
    Model.HandleProgressDataChanged(local_4.opCall());
    return;
}
void __Tick(FVMS_PVX_MainHUD &inout Model)
{
    Get local_4;
    Model.Tick(local_4.opCall());
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __UIGetter_Level(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetLevel();
}
int __UIGetter_Exp(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetExp();
}
FText __UIGetter_NextLevelExpStr(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetNextLevelExpStr();
}
FText __UIGetter_DeltaExpText(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetDeltaExpText();
}
int __UIGetter_TargetPanelSwitcherIndex(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetTargetPanelSwitcherIndex();
}
int __UIGetter_TriggerAddExpAnim(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetTriggerAddExpAnim();
}
float32 __UIGetter_ExpBarProgress(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetExpBarProgress();
}
FTimespan __UIGetter_RemainingTime(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetRemainingTime();
}
FText __UIGetter_WinnerFactionText(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetWinnerFactionText();
}
int __UIGetter_LocalPlayerKills(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetLocalPlayerKills();
}
int __UIGetter_LocalPlayerDeaths(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetLocalPlayerDeaths();
}
int __UIGetter_LocalPlayerAssists(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetLocalPlayerAssists();
}
TArray<FPVX_PlayerKDAEntry> __UIGetter_Modify_AllPlayersKDA(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetModify_AllPlayersKDA();
}
TArray<TEUIModelRef<FVM_PVX_LeaderboardListEntry>> __UIGetter_Modify_LeaderboardEntries(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetModify_LeaderboardEntries();
}
bool __UIGetter_bLeaderboardVisible(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetbLeaderboardVisible();
}
int __UIGetter_CurrencyItemNum(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetCurrencyItemNum();
}
bool __UIGetter_bEscapePanelVisible(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetbEscapePanelVisible();
}
bool __UIGetter_bEscapeEnergyFull(const FVMS_PVX_MainHUD &inout Model)
{
    return Model.GetbEscapeEnergyFull();
}
TEUIModelRef<FVMS_PVX_MainHUD> __UIGetter_Self(const FVMS_PVX_MainHUD &inout Model)
{
    return TEUIModelRef<FVMS_PVX_MainHUD>(Model);
}
int __IndexOf_Level()
{
    return 0;
}
int __IndexOf_Exp()
{
    return 1;
}
int __IndexOf_NextLevelExpStr()
{
    return 2;
}
int __IndexOf_oldExp()
{
    return 3;
}
int __IndexOf_DeltaExp()
{
    return 4;
}
int __IndexOf_DeltaExpText()
{
    return 5;
}
int __IndexOf_TargetPanelSwitcherIndex()
{
    return 6;
}
int __IndexOf_TriggerAddExpAnim()
{
    return 7;
}
int __IndexOf_ExpBarProgress()
{
    return 8;
}
int __IndexOf_ExpBarTargetProgress()
{
    return 9;
}
int __IndexOf_ExpBarLerpSpeed()
{
    return 10;
}
int __IndexOf_ExpBarProgressLevel()
{
    return 11;
}
int __IndexOf_RemainingTime()
{
    return 12;
}
int __IndexOf_WinnerFactionText()
{
    return 13;
}
int __IndexOf_LocalPlayerKills()
{
    return 14;
}
int __IndexOf_LocalPlayerDeaths()
{
    return 15;
}
int __IndexOf_LocalPlayerAssists()
{
    return 16;
}
int __IndexOf_Modify_AllPlayersKDA()
{
    return 17;
}
int __IndexOf_Modify_LeaderboardEntries()
{
    return 18;
}
int __IndexOf_bLeaderboardVisible()
{
    return 19;
}
int __IndexOf_CurrencyItemNum()
{
    return 20;
}
int __IndexOf_bEscapePanelVisible()
{
    return 21;
}
int __IndexOf_bEscapeEnergyFull()
{
    return 22;
}
int __IndexOf_AvatarEscapeTag()
{
    return 23;
}
int __IndexOf_EscapeSkillList()
{
    return 24;
}
int __IndexOf_MissionEndTime_Record()
{
    return 25;
}
int __IndexOf_SettlementWidgetRef()
{
    return 26;
}
int __IndexOf_bWaitingExpBannerForSettlement()
{
    return 27;
}
int __IndexOf_bWinnerAnnounceAllowed()
{
    return 28;
}
int __IndexOf_CachedWinnerFactionText()
{
    return 29;
}
int __IndexOf_bWaitingSettlementUIDelay()
{
    return 30;
}
int __IndexOf_SettlementUIDelayEndTime()
{
    return 31;
}
int __IndexOf_CurrencyItemConfig()
{
    return 32;
}
}
namespace __GeneratedProperties_FVMS_PVX_MainHUD
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
