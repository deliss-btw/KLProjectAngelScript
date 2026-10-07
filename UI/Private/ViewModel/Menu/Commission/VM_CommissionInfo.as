
namespace FVM_CommissionInfo
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature StartCommission = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnConfirmStartCommission = FEUIModelCallbackSignature();

}
struct FVM_CommissionInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Commission> m_CommissionModel;
    UPROPERTY()
    FEUIModelRef m_CommissionRewardList;
    UPROPERTY()
    FEUIModelRef m_CommissionFirstTimeRewardList;
    UPROPERTY()
    TArray<FEUIModelContainer> m_EcologyInfo;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_MonsterInfo>> m_TargetMonsters;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionMonsterInfo> m_CommissionMonsterInfo;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionRewardInfo> m_CommissionRewardInfo;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionEcologyInfo> m_CommissionEcologyInfo;

    FVM_CommissionInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionInfo' by default constructor.");
        return;
    }
    FVM_CommissionInfo(const FVM_CommissionInfo &inout Other)
    {
        this.m_CommissionModel = Other.m_CommissionModel;
        this.m_CommissionRewardList = Other.m_CommissionRewardList;
        this.m_CommissionFirstTimeRewardList = Other.m_CommissionFirstTimeRewardList;
        this.m_EcologyInfo = Other.m_EcologyInfo;
        this.m_TargetMonsters = Other.m_TargetMonsters;
        this.m_CommissionMonsterInfo = Other.m_CommissionMonsterInfo;
        this.m_CommissionRewardInfo = Other.m_CommissionRewardInfo;
        this.m_CommissionEcologyInfo = Other.m_CommissionEcologyInfo;
        return;
    }
    FVM_CommissionInfo(const TEUIModelRef<FM_Commission> &inout InCommissionModel)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommissionModel(InCommissionModel);
        return;
    }
    FVM_CommissionInfo& opAssign(const FVM_CommissionInfo &inout Other)
    {
        this.m_CommissionModel = Other.m_CommissionModel;
        this.m_CommissionRewardList = Other.m_CommissionRewardList;
        this.m_CommissionFirstTimeRewardList = Other.m_CommissionFirstTimeRewardList;
        this.m_EcologyInfo = Other.m_EcologyInfo;
        this.m_TargetMonsters = Other.m_TargetMonsters;
        this.m_CommissionMonsterInfo = Other.m_CommissionMonsterInfo;
        this.m_CommissionRewardInfo = Other.m_CommissionRewardInfo;
        return Other.m_CommissionEcologyInfo;
    }
    void PostConstruct()
    {
        TDataObjectPtr<FDropItemConfigBase> local_48 = this.GetCommissionConfig().opArrow().GetCommissionReward();
        if (local_48)
        {
            FEUIModelRef local_80;
            ::FCommonRewardListBuilder::BuildFromDropConfig(local_48);
            this.SetCommissionRewardList(local_80);
        }
        TDataObjectPtr<FCommissionConfig> local_24_2 = this.GetCommissionConfig();
        TDataObjectPtr<FRewardConfig> local_104 = local_24_2.opArrow().GetSpecialRewardConfig();
        if (local_104)
        {
            FEUIModelRef local_80;
            ::FCommonRewardListBuilder::BuildFromRewardConfig(local_104);
            this.SetCommissionFirstTimeRewardList(local_80);
        }
        this.SetCommissionMonsterInfo(TEUIModelRef<FVM_CommissionMonsterInfo>(::FVM_CommissionMonsterInfo::Create(this.GetContext().Manager, this.GetCommissionModel())));
        this.SetCommissionRewardInfo(TEUIModelRef<FVM_CommissionRewardInfo>(::FVM_CommissionRewardInfo::Create(this.GetContext().Manager, this.GetCommissionModel())));
        this.SetCommissionEcologyInfo(TEUIModelRef<FVM_CommissionEcologyInfo>(::FVM_CommissionEcologyInfo::Create(this.GetContext().Manager, this.GetCommissionModel())));
        return;
    }
    TDataObjectPtr<FCommissionConfig> GetCommissionConfig() const property
    {
        return this.GetCommissionModel().opArrow().GetCommissionConfig();
    }
    bool CanMatchmakingEntry() const
    {
        bool local_50 = false;
        return this.GetCommissionConfig().IsSet() && local_50;
    }
    bool GetIsCurrentCommissionMatching() const
    {
        FMS_Mode& local_2 = ::FMS_Mode::Get(this.GetContext().Manager);
        return local_2.GetbMatching() && (local_2.GetCurMatchMode() == 2) && (local_2.GetCurMatchCommissionId() == this.GetCommissionId());
    }
    TDataObjectPtr<FPveCommissionMatchConfig> GetCommissionMatchConfig() const
    {
        if (!(this.GetCommissionConfig().IsSet()))
        {
            return TDataObjectPtr<FPveCommissionMatchConfig>();
        }
        if (GetOverrideMatchConfig().IsSet())
        {
            return GetOverrideMatchConfig();
        }
        UCommissionSettings local_100 = ::CommissionUtils::GetCommissionSettings();
        TDataObjectPtr<FPveCommissionMatchConfig> local_126;
        if (local_100.DefaultMatchConfigs.Find(unresolved.CommissionType, local_126))
        {
            return local_126;
        }
        return local_126;
    }
    uint GetCommissionId() const
    {
        int local_51 = 0;
        int local_50 = this.GetCommissionConfig().IsSet() ? local_51 : 0;
        return local_50;
    }
    TDataObjectPtr<FObjectiveConfig> GetCommissionTargetObjectiveConfig() const property
    {
        return this.GetCommissionConfig().opArrow().GetCommissionTargetObjective();
    }
    FText GetDeathLimitText() const
    {
        return FText::Format(NSLOCTEXT("DeathLimitText", "< {0}ж¬Ў"), this.GetCommissionConfig().opArrow().MaxDeathCount);
    }
    bool HasDeathLimit() const
    {
        return (this.GetCommissionConfig().opArrow().MaxDeathCount >= 0);
    }
    FText GetTimeLimitText() const
    {
        FNumberFormattingOptions local_6 = FNumberFormattingOptions();
        FText local_38;
        FText::AsNumber(local_38, (this.GetCommissionConfig().opArrow().CommissionTimeLimit / 60.0f));
        return FText::Format(NSLOCTEXT("TimeLimitText", "< {0}е€†й’џ"), local_38);
    }
    bool HasTimeLimit() const
    {
        return (this.GetCommissionConfig().opArrow().CommissionTimeLimit > 0.0f);
    }
    FText GetPlayerNumLimitText() const
    {
        int local_78 = 0;
        int local_79 = 0;
        TDataObjectPtr<FCommissionConfig> local_48 = this.GetCommissionConfig();
        CastTo local_52;
        if (local_52.opCall())
        {
            local_79 = local_78;
            if (local_79 == 2)
            {
                return NSLOCTEXT("RaceMultiPlayerNumLimitText", "1~4дєє");
            }
            if (local_78 == 1)
            {
                return NSLOCTEXT("RaceSinglePlayerNumLimitText", "1дєє");
            }
        }
        if (this.GetCommissionMatchConfig().IsSet() && (local_79 > 1))
        {
            NSLOCTEXT("PlayerNumLimitText", "1~{0}дєє");
            return FText();
        }
        return NSLOCTEXT("PlayerNumLimitMinText", "1дєє");
    }
    FText GetCommissionTargetObjectiveOrAimDesc() const
    {
        return this.GetCommissionModel().opArrow().GetCommissionTargetObjectiveOrAimDesc();
    }
    TDataObjectPtr<FObjectiveConfig> GetCommissionSubTargetObjectiveConfig() const property
    {
        return this.GetCommissionModel().opArrow().GetSubTargetConfig();
    }
    FText GetCommissionSubTargetDesc() const
    {
        TDataObjectPtr<FObjectiveConfig> local_26 = this.GetCommissionModel().opArrow().GetSubTargetConfig();
        FText local_56;
        if (!(local_26))
        {
            return local_56;
        }
        local_56 = ::ObjectiveUtils::GetObjectiveDesc(local_26, 0, 0);
        if (local_56.IsEmpty())
        {
            return FText();
        }
        return FText::Format(NSLOCTEXT("CommissionSubTargetText", "[еЏЇйЂ‰] {0}"), local_56);
    }
    int GetFinishCount() const
    {
        return this.GetCommissionModel().opArrow().GetFinishCount();
    }
    bool IsHardCommission() const
    {
        ECommissionType local_25 = this.GetCommissionConfig().opArrow().CommissionType;
        return (int(local_25) == 2 || (int(local_25) == 4) || (int(local_25) == 5));
    }
    int GetCommissionTypeSwicher() const
    {
        ECommissionType local_25 = this.GetCommissionConfig().opArrow().CommissionType;
        if (int(local_25) == 2)
        {
            return 1;
        }
        if ((int(local_25) == 4 || (int(local_25) == 5)))
        {
            return 2;
        }
        return 0;
    }
    FText GetCommissionLevelText() const
    {
        FNumberFormattingOptions local_6;
        return FText::AsNumber(this.GetCommissionConfig().opArrow().CommissionStars, local_6);
    }
    FSlateBrush GetCommissionIcon() const
    {
        return this.GetCommissionConfig().opArrow().CommissionIcon.LoadBrush();
    }
    FSlateBrush GetCommissionTypeIcon() const
    {
        TDataObjectPtr<FCommissionTypeConfig> local_50 = ::CommissionUtils::GetCommissionTypeConfig(this.GetCommissionConfig().opArrow().CommissionType);
        return local_50.opArrow().CommissionTypeIcon.LoadBrush();
    }
    FText GetCommissionTypeName() const
    {
        return ::CommissionUtils::GetCommissionTypeConfig(this.GetCommissionConfig().opArrow().CommissionType).opArrow().CommissionTypeName;
    }
    FSlateBrush GetCommissionWeatherBrush() const
    {
        TDataObjectPtr<FWeatherConfig> local_26 = this.GetCommissionModel().opArrow().GetWeatherConfig();
        if (local_26)
        {
            return local_26.opArrow().DisplayIcon.LoadBrush();
        }
        return FSlateBrush();
    }
    FText GetCommissionWeatherName() const
    {
        return this.GetCommissionModel().opArrow().GetWeatherConfig().opArrow().DisplayName;
    }
    FText GetCommissionTimeLimit() const
    {
        return FText::Format(NSLOCTEXT("Commission", "CommissionTimeLimit", "й™ђж—¶{0}е€†й’џ"), (this.GetCommissionConfig().opArrow().CommissionTimeLimit / 60.0f));
    }
    bool CommissionHasTimeLimit() const
    {
        return (this.GetCommissionConfig().opArrow().CommissionTimeLimit > 0.0f);
    }
    FText GetCommissionLocationName() const
    {
        return this.GetCommissionModel().opArrow().GetLocationName();
    }
    FText GetCommissionDayTimeText() const
    {
        TDataObjectPtr<FTODStageConfig> local_50 = ::FTimeOfDayUtils::GetTODStage(this.GetCommissionConfig().opArrow().CommissionDayTime);
        if (local_50)
        {
            return local_50.opArrow().DisplayName;
        }
        return FText();
    }
    bool HasFirstTimeReward() const
    {
        Get local_6;
        return this.GetCommissionFirstTimeRewardList().IsValid() && !(local_6.opCall().IsEmpty());
    }
    bool HasReceivedFirstTimeReward() const
    {
        return (this.GetFinishCount() > 0);
    }
    bool HasNotReceivedFirstTimeReward() const
    {
        return this.HasFirstTimeReward() && !(this.HasReceivedFirstTimeReward());
    }
    TDataObjectPtr<FCommissionEntryRuleConfig> GetEntryRuleConfig() const property
    {
        return this.GetCommissionModel().opArrow().GetEntryRuleConfig();
    }
    bool HasEntryRule() const
    {
        return this.GetCommissionModel().opArrow().HasEntryRule();
    }
    bool ShouldHideLocation() const
    {
        return this.GetCommissionModel().opArrow().ShouldHideLocation();
    }
    bool IsBadWeather() const
    {
        TDataObjectPtr<FWeatherConfig> local_26 = this.GetCommissionModel().opArrow().GetWeatherConfig();
        if (local_26)
        {
            return local_26.opArrow().bBadWeather;
        }
        return false;
    }
    int GetRecommendedLevel() const
    {
        return this.GetCommissionConfig().opArrow().RecommendedLevel;
    }
    bool GetIsRecommendedLevelShown() const
    {
        return (this.GetRecommendedLevel() > 1);
    }
    bool GetIsRecommendedLevelHigherThanPlayerLevel() const
    {
        int local_3;
        int local_2 = this.GetRecommendedLevel();
        local_3 = ::FM_LocalPlayerLevel::Get(this.GetContext().Manager).GetLevel();
        return (local_2 > local_3);
    }
    FText GetRecommendedLevelText() const
    {
        int local_3;
        int local_2 = this.GetRecommendedLevel();
        local_3 = ::FM_LocalPlayerLevel::Get(this.GetContext().Manager).GetLevel();
        if (local_2 > local_3)
        {
            return FText::Format(NSLOCTEXT("RecommendedLevelTextWithCurrent", "зїјз—•з­‰зє§е»єи®® {0} / еЅ“е‰Ќ {1}"), local_2, local_3);
        }
        return FText::Format(NSLOCTEXT("RecommendedLevelText", "<Beige16>зїјз—•з­‰зє§е»єи®® {0}</>"), local_2);
    }
    ERaceMode GetRaceMode() const
    {
        TDataObjectPtr<FCommissionConfig> local_48 = this.GetCommissionConfig();
        CastTo local_52;
        TDataObjectPtr<FRaceCommissionConfig> local_76 = local_52.opCall();
        if (local_76)
        {
            return local_76.opArrow().RaceMode;
        }
        return ERaceMode(0);
    }
    bool IsRaceCommission() const
    {
        return (int(this.GetCommissionConfig().opArrow().CommissionType) == 5);
    }
    bool IsNotRaceCommission() const
    {
        return !(this.IsRaceCommission());
    }
    bool IsMultiRaceCommission() const
    {
        return this.IsRaceCommission() && (int(this.GetRaceMode()) == 2);
    }
    int GetBestCostTimeSec() const
    {
        return this.GetCommissionModel().opArrow().GetBestCostTimeSec();
    }
    FText GetBestCostTimeText() const
    {
        if (this.GetCommissionModel().opArrow().GetBestCostTimeSec() > 0)
        {
            return ::CommissionUtils::GetRaceCommissionTimeText(this.GetCommissionModel().opArrow().GetBestCostTimeSec());
        }
        return NSLOCTEXT("NoTimeRecord", "жљ‚жњЄйЂље…і");
    }
    ECommissionTier GetBestAchievedTier() const
    {
        return this.GetCommissionModel().opArrow().GetBestAchievedTier();
    }
    TEUIModelRef<FVM_CommissionTier> GetBestAchievedTierVM() const
    {
        if ((int(this.GetBestAchievedTier())) == 0)
        {
            return TEUIModelRef<FVM_CommissionTier>();
        }
        TEUIModelRef<FM_CommissionTier> local_12 = TEUIModelRef<FM_CommissionTier>(::FM_CommissionTier::Create(this.GetContext().Manager, this.GetCommissionModel()));
        return TEUIModelRef<FVM_CommissionTier>(::FVM_CommissionTier::Create(this.GetContext().Manager, local_12));
    }
    TDataObjectPtr<FCommissionTierConfig> GetBestAchievedTierConfig() const
    {
        return TDataObjectPtr<FCommissionTierConfig>(::FCommissionTierConfig::FindByKey(this.GetBestAchievedTier()));
    }
    TArray<TEUIModelRef<FVM_CommissionTier>> GetCommissionTiers() const
    {
        TArray<TEUIModelRef<FVM_CommissionTier>> local_4;
        for (auto& local_26 : this.GetCommissionModel().opArrow().GetCommissionTiers())
        {
            local_4.Add(TEUIModelRef<FVM_CommissionTier>(::FVM_CommissionTier::Create(this.GetContext().Manager, local_26)));
        }
        return local_4;
    }
    bool ShowLowLevelWarningIfNeeded(const FDialogCallback &inout OnConfirm)
    {
        int local_3;
        int local_2 = this.GetRecommendedLevel();
        local_3 = ::FM_LocalPlayerLevel::Get(this.GetContext().Manager).GetLevel();
        if ((local_2 <= 0 || (((local_2 - local_3) <= 0))))
        {
            return false;
        }
        FCommonDialogParam local_16;
        ::CommonPopup::Dialog_Decision(NSLOCTEXT("CommissionInfo", "LowLevelWarningTitle", "жЏђз¤є"), FText::Format(NSLOCTEXT("CommissionInfo", "LowLevelWarningContent", "еЅ“е‰ЌеҐ‘зє¦е»єи®®зїјз—•з­‰зє§дёє{0}пјЊеЅ“е‰Ќ<Yellow20>жњЄиѕѕе€°е»єи®®зїјз—•з­‰зє§</>пјЊ\nеҐ‘зє¦йЈЋй™©иѕѓй«пјЊжЇеђ¦з»§з»­пјџ"), local_2), OnConfirm, FText(), FText(), local_16);
        return true;
    }
    void StartCommission()
    {
        FDialogModelCallback local_26;
        local_26.Bind(this, FVM_CommissionInfo::OnConfirmStartCommission);
        if (this.ShowLowLevelWarningIfNeeded(FDialogCallback(local_26)))
        {
            return;
        }
        this.DoStartCommission();
        return;
    }
    bool OnConfirmStartCommission(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            this.DoStartCommission();
        }
        return true;
    }
    void DoStartCommission()
    {
        ::FMS_Mode::Get(this.GetContext().Manager).BeginSwitchToDirectEnter(this.GetCommissionModel());
        return;
    }
    TEUIModelRef<FM_Commission> GetCommissionModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CommissionModel;
    }
    void SetCommissionModel(const TEUIModelRef<FM_Commission> &inout __Value) property
    {
        TEUIModelRef<FM_Commission> local_2;
        local_2 = this.m_CommissionModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommissionModel = __Value;
        return;
    }
    const FEUIModelRef GetCommissionRewardList() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIModelRef GetModify_CommissionRewardList() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCommissionRewardList(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CommissionRewardList = __Value;
        return;
    }
    const FEUIModelRef GetCommissionFirstTimeRewardList() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIModelRef GetModify_CommissionFirstTimeRewardList() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCommissionFirstTimeRewardList(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CommissionFirstTimeRewardList = __Value;
        return;
    }
    TArray<FEUIModelContainer> GetEcologyInfo() const property
    {
        TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_EcologyInfo() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEcologyInfo(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EcologyInfo = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_MonsterInfo>> GetTargetMonsters() const property
    {
        const TArray<TEUIModelRef<FVM_MonsterInfo>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_MonsterInfo>> GetModify_TargetMonsters() property
    {
        TArray<TEUIModelRef<FVM_MonsterInfo>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetTargetMonsters(const TArray<TEUIModelRef<FVM_MonsterInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TargetMonsters = __Value;
        return;
    }
    TEUIModelRef<FVM_CommissionMonsterInfo> GetCommissionMonsterInfo() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CommissionMonsterInfo;
    }
    void SetCommissionMonsterInfo(const TEUIModelRef<FVM_CommissionMonsterInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_CommissionMonsterInfo> local_2;
        local_2 = this.m_CommissionMonsterInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CommissionMonsterInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_CommissionRewardInfo> GetCommissionRewardInfo() const property
    {
        this.TrackPropertyRead(6);
        return this.m_CommissionRewardInfo;
    }
    void SetCommissionRewardInfo(const TEUIModelRef<FVM_CommissionRewardInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_CommissionRewardInfo> local_2;
        local_2 = this.m_CommissionRewardInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_CommissionRewardInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_CommissionEcologyInfo> GetCommissionEcologyInfo() const property
    {
        this.TrackPropertyRead(7);
        return this.m_CommissionEcologyInfo;
    }
    void SetCommissionEcologyInfo(const TEUIModelRef<FVM_CommissionEcologyInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_CommissionEcologyInfo> local_2;
        local_2 = this.m_CommissionEcologyInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_CommissionEcologyInfo = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionInfo
{
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> CommissionConfig;
    UPROPERTY()
    bool CanMatchmakingEntry;
    UPROPERTY()
    bool IsCurrentCommissionMatching;
    UPROPERTY()
    TDataObjectPtr<FObjectiveConfig> CommissionTargetObjectiveConfig;
    UPROPERTY()
    FText DeathLimitText;
    UPROPERTY()
    bool HasDeathLimit;
    UPROPERTY()
    FText TimeLimitText;
    UPROPERTY()
    bool HasTimeLimit;
    UPROPERTY()
    FText PlayerNumLimitText;
    UPROPERTY()
    FText CommissionTargetObjectiveOrAimDesc;
    UPROPERTY()
    TDataObjectPtr<FObjectiveConfig> CommissionSubTargetObjectiveConfig;
    UPROPERTY()
    FText CommissionSubTargetDesc;
    UPROPERTY()
    int FinishCount;
    UPROPERTY()
    bool IsHardCommission;
    UPROPERTY()
    int CommissionTypeSwicher;
    UPROPERTY()
    FText CommissionLevelText;
    UPROPERTY()
    FSlateBrush CommissionIcon;
    UPROPERTY()
    FSlateBrush CommissionTypeIcon;
    UPROPERTY()
    FText CommissionTypeName;
    UPROPERTY()
    FSlateBrush CommissionWeatherBrush;
    UPROPERTY()
    FText CommissionWeatherName;
    UPROPERTY()
    FText CommissionTimeLimit;
    UPROPERTY()
    bool CommissionHasTimeLimit;
    UPROPERTY()
    FText CommissionLocationName;
    UPROPERTY()
    FText CommissionDayTimeText;
    UPROPERTY()
    bool HasFirstTimeReward;
    UPROPERTY()
    bool HasReceivedFirstTimeReward;
    UPROPERTY()
    bool HasNotReceivedFirstTimeReward;
    UPROPERTY()
    TDataObjectPtr<FCommissionEntryRuleConfig> EntryRuleConfig;
    UPROPERTY()
    bool HasEntryRule;
    UPROPERTY()
    bool ShouldHideLocation;
    UPROPERTY()
    bool IsBadWeather;
    UPROPERTY()
    int RecommendedLevel;
    UPROPERTY()
    bool IsRecommendedLevelShown;
    UPROPERTY()
    bool IsRecommendedLevelHigherThanPlayerLevel;
    UPROPERTY()
    FText RecommendedLevelText;
    UPROPERTY()
    ERaceMode RaceMode;
    UPROPERTY()
    bool IsRaceCommission;
    UPROPERTY()
    bool IsNotRaceCommission;
    UPROPERTY()
    bool IsMultiRaceCommission;
    UPROPERTY()
    int BestCostTimeSec;
    UPROPERTY()
    FText BestCostTimeText;
    UPROPERTY()
    ECommissionTier BestAchievedTier;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionTier> BestAchievedTierVM;
    UPROPERTY()
    TDataObjectPtr<FCommissionTierConfig> BestAchievedTierConfig;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommissionTier>> CommissionTiers;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionInfo> Self;


}

namespace FVM_CommissionInfo
{
FVM_CommissionInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_Commission> &inout CommissionModel)
{
    return FVM_CommissionInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommissionModel);
}
FVM_CommissionInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Commission> &inout CommissionModel)
{
    FVM_CommissionInfo __r;
    TEUIModelRef<FVM_CommissionInfo> local_6 = TEUIModelRef<FVM_CommissionInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionInfo::ModelId, 0, CommissionModel));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CommissionRewardList";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionFirstTimeRewardList";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EcologyInfo";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TargetMonsters";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_MonsterInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionMonsterInfo";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionMonsterInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionRewardInfo";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionRewardInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionEcologyInfo";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionEcologyInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionConfig";
    local_14.TypeName = "TDataObjectPtr<FCommissionConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanMatchmakingEntry";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsCurrentCommissionMatching";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionTargetObjectiveConfig";
    local_14.TypeName = "TDataObjectPtr<FObjectiveConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DeathLimitText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasDeathLimit";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TimeLimitText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasTimeLimit";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerNumLimitText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionTargetObjectiveOrAimDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionSubTargetObjectiveConfig";
    local_14.TypeName = "TDataObjectPtr<FObjectiveConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionSubTargetDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FinishCount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsHardCommission";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionTypeSwicher";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionTypeIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionTypeName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionWeatherBrush";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionWeatherName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionTimeLimit";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionHasTimeLimit";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionLocationName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionDayTimeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasFirstTimeReward";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasReceivedFirstTimeReward";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasNotReceivedFirstTimeReward";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EntryRuleConfig";
    local_14.TypeName = "TDataObjectPtr<FCommissionEntryRuleConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasEntryRule";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldHideLocation";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsBadWeather";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RecommendedLevel";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsRecommendedLevelShown";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsRecommendedLevelHigherThanPlayerLevel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RecommendedLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RaceMode";
    local_14.TypeName = "ERaceMode";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsRaceCommission";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsNotRaceCommission";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsMultiRaceCommission";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BestCostTimeSec";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BestCostTimeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BestAchievedTier";
    local_14.TypeName = "ECommissionTier";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BestAchievedTierVM";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionTier>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BestAchievedTierConfig";
    local_14.TypeName = "TDataObjectPtr<FCommissionTierConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionTiers";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommissionTier>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionInfo;
}
FEUIModelRef __UIGetter_CommissionRewardList(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionRewardList();
}
FEUIModelRef __UIGetter_CommissionFirstTimeRewardList(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionFirstTimeRewardList();
}
TArray<FEUIModelContainer> __UIGetter_EcologyInfo(const FVM_CommissionInfo &inout Model)
{
    return Model.GetEcologyInfo();
}
TArray<TEUIModelRef<FVM_MonsterInfo>> __UIGetter_TargetMonsters(const FVM_CommissionInfo &inout Model)
{
    return Model.GetTargetMonsters();
}
TEUIModelRef<FVM_CommissionMonsterInfo> __UIGetter_CommissionMonsterInfo(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionMonsterInfo();
}
TEUIModelRef<FVM_CommissionRewardInfo> __UIGetter_CommissionRewardInfo(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionRewardInfo();
}
TEUIModelRef<FVM_CommissionEcologyInfo> __UIGetter_CommissionEcologyInfo(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionEcologyInfo();
}
TDataObjectPtr<FCommissionConfig> __UIGetter_CommissionConfig(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionConfig();
}
bool __UIGetter_CanMatchmakingEntry(const FVM_CommissionInfo &inout Model)
{
    return Model.CanMatchmakingEntry();
}
bool __UIGetter_IsCurrentCommissionMatching(const FVM_CommissionInfo &inout Model)
{
    return Model.GetIsCurrentCommissionMatching();
}
TDataObjectPtr<FObjectiveConfig> __UIGetter_CommissionTargetObjectiveConfig(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionTargetObjectiveConfig();
}
FText __UIGetter_DeathLimitText(const FVM_CommissionInfo &inout Model)
{
    return Model.GetDeathLimitText();
}
bool __UIGetter_HasDeathLimit(const FVM_CommissionInfo &inout Model)
{
    return Model.HasDeathLimit();
}
FText __UIGetter_TimeLimitText(const FVM_CommissionInfo &inout Model)
{
    return Model.GetTimeLimitText();
}
bool __UIGetter_HasTimeLimit(const FVM_CommissionInfo &inout Model)
{
    return Model.HasTimeLimit();
}
FText __UIGetter_PlayerNumLimitText(const FVM_CommissionInfo &inout Model)
{
    return Model.GetPlayerNumLimitText();
}
FText __UIGetter_CommissionTargetObjectiveOrAimDesc(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionTargetObjectiveOrAimDesc();
}
TDataObjectPtr<FObjectiveConfig> __UIGetter_CommissionSubTargetObjectiveConfig(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionSubTargetObjectiveConfig();
}
FText __UIGetter_CommissionSubTargetDesc(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionSubTargetDesc();
}
int __UIGetter_FinishCount(const FVM_CommissionInfo &inout Model)
{
    return Model.GetFinishCount();
}
bool __UIGetter_IsHardCommission(const FVM_CommissionInfo &inout Model)
{
    return Model.IsHardCommission();
}
int __UIGetter_CommissionTypeSwicher(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionTypeSwicher();
}
FText __UIGetter_CommissionLevelText(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionLevelText();
}
FSlateBrush __UIGetter_CommissionIcon(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionIcon();
}
FSlateBrush __UIGetter_CommissionTypeIcon(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionTypeIcon();
}
FText __UIGetter_CommissionTypeName(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionTypeName();
}
FSlateBrush __UIGetter_CommissionWeatherBrush(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionWeatherBrush();
}
FText __UIGetter_CommissionWeatherName(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionWeatherName();
}
FText __UIGetter_CommissionTimeLimit(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionTimeLimit();
}
bool __UIGetter_CommissionHasTimeLimit(const FVM_CommissionInfo &inout Model)
{
    return Model.CommissionHasTimeLimit();
}
FText __UIGetter_CommissionLocationName(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionLocationName();
}
FText __UIGetter_CommissionDayTimeText(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionDayTimeText();
}
bool __UIGetter_HasFirstTimeReward(const FVM_CommissionInfo &inout Model)
{
    return Model.HasFirstTimeReward();
}
bool __UIGetter_HasReceivedFirstTimeReward(const FVM_CommissionInfo &inout Model)
{
    return Model.HasReceivedFirstTimeReward();
}
bool __UIGetter_HasNotReceivedFirstTimeReward(const FVM_CommissionInfo &inout Model)
{
    return Model.HasNotReceivedFirstTimeReward();
}
TDataObjectPtr<FCommissionEntryRuleConfig> __UIGetter_EntryRuleConfig(const FVM_CommissionInfo &inout Model)
{
    return Model.GetEntryRuleConfig();
}
bool __UIGetter_HasEntryRule(const FVM_CommissionInfo &inout Model)
{
    return Model.HasEntryRule();
}
bool __UIGetter_ShouldHideLocation(const FVM_CommissionInfo &inout Model)
{
    return Model.ShouldHideLocation();
}
bool __UIGetter_IsBadWeather(const FVM_CommissionInfo &inout Model)
{
    return Model.IsBadWeather();
}
int __UIGetter_RecommendedLevel(const FVM_CommissionInfo &inout Model)
{
    return Model.GetRecommendedLevel();
}
bool __UIGetter_IsRecommendedLevelShown(const FVM_CommissionInfo &inout Model)
{
    return Model.GetIsRecommendedLevelShown();
}
bool __UIGetter_IsRecommendedLevelHigherThanPlayerLevel(const FVM_CommissionInfo &inout Model)
{
    return Model.GetIsRecommendedLevelHigherThanPlayerLevel();
}
FText __UIGetter_RecommendedLevelText(const FVM_CommissionInfo &inout Model)
{
    return Model.GetRecommendedLevelText();
}
ERaceMode __UIGetter_RaceMode(const FVM_CommissionInfo &inout Model)
{
    return Model.GetRaceMode();
}
bool __UIGetter_IsRaceCommission(const FVM_CommissionInfo &inout Model)
{
    return Model.IsRaceCommission();
}
bool __UIGetter_IsNotRaceCommission(const FVM_CommissionInfo &inout Model)
{
    return Model.IsNotRaceCommission();
}
bool __UIGetter_IsMultiRaceCommission(const FVM_CommissionInfo &inout Model)
{
    return Model.IsMultiRaceCommission();
}
int __UIGetter_BestCostTimeSec(const FVM_CommissionInfo &inout Model)
{
    return Model.GetBestCostTimeSec();
}
FText __UIGetter_BestCostTimeText(const FVM_CommissionInfo &inout Model)
{
    return Model.GetBestCostTimeText();
}
ECommissionTier __UIGetter_BestAchievedTier(const FVM_CommissionInfo &inout Model)
{
    return Model.GetBestAchievedTier();
}
TEUIModelRef<FVM_CommissionTier> __UIGetter_BestAchievedTierVM(const FVM_CommissionInfo &inout Model)
{
    return Model.GetBestAchievedTierVM();
}
TDataObjectPtr<FCommissionTierConfig> __UIGetter_BestAchievedTierConfig(const FVM_CommissionInfo &inout Model)
{
    return Model.GetBestAchievedTierConfig();
}
TArray<TEUIModelRef<FVM_CommissionTier>> __UIGetter_CommissionTiers(const FVM_CommissionInfo &inout Model)
{
    return Model.GetCommissionTiers();
}
TEUIModelRef<FVM_CommissionInfo> __UIGetter_Self(const FVM_CommissionInfo &inout Model)
{
    return TEUIModelRef<FVM_CommissionInfo>(Model);
}
int __IndexOf_CommissionModel()
{
    return 0;
}
int __IndexOf_CommissionRewardList()
{
    return 1;
}
int __IndexOf_CommissionFirstTimeRewardList()
{
    return 2;
}
int __IndexOf_EcologyInfo()
{
    return 3;
}
int __IndexOf_TargetMonsters()
{
    return 4;
}
int __IndexOf_CommissionMonsterInfo()
{
    return 5;
}
int __IndexOf_CommissionRewardInfo()
{
    return 6;
}
int __IndexOf_CommissionEcologyInfo()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_CommissionInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
