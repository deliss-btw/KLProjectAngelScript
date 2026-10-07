
namespace CommissionFinish_Util
{
    const int TITLE_TEXT_INDEX_NORMAL = 0;
    const int TITLE_TEXT_INDEX_SUCCESS = 1;
    const int TITLE_TEXT_INDEX_FAILURE = 2;
}
namespace FVM_CommissionFinish
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature CommissionFinishClose = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSkipWaitPhase = FEUIModelCallbackSignature();

}
struct FVM_CommissionFinish : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bPendingClose;
    UPROPERTY()
    bool m_bCanClose;
    UPROPERTY()
    FFPTime m_CommissionTotalTime;
    UPROPERTY()
    bool m_bHasNormalReward;
    UPROPERTY()
    int m_RewardMoneyNum_Base;
    UPROPERTY()
    int m_RewardMoneyNum_Extra;
    UPROPERTY()
    int m_RewardExpNum_Base;
    UPROPERTY()
    int m_RewardExpNum_Extra;
    UPROPERTY()
    TArray<FEUIModelRef> m_RewardsData;
    UPROPERTY()
    TArray<FEUIModelContainer> m_MainObjectResurlts;
    UPROPERTY()
    bool m_bHasSpecialObjectResurlts;
    UPROPERTY()
    TArray<FEUIModelContainer> m_SpecialObjectResurlts;
    UPROPERTY()
    int m_RewardScoreNum;
    UPROPERTY()
    int m_FullScoreNum;
    UPROPERTY()
    FText m_ScoreRating;
    UPROPERTY()
    int m_ScoreRatingImageIndex;
    UPROPERTY()
    FText m_GetCommissionStateTypeText;
    UPROPERTY()
    FText m_GetCommissionEndButtonText;
    UPROPERTY()
    TArray<FEUIModelContainer> m_TeamerInfos;
    UPROPERTY()
    TArray<FEUIModelContainer> m_BadgeInfos;
    UPROPERTY()
    bool m_bHaveBadge;
    UPROPERTY()
    int m_MoneyCount;
    UPROPERTY()
    int m_ExpCount;
    UPROPERTY()
    int m_BaseMoneyCount;
    UPROPERTY()
    int m_BaseExpCount;
    UPROPERTY()
    bool m_bIsRaceCommission;
    UPROPERTY()
    ECommissionTier m_CurrentTier;
    UPROPERTY()
    TArray<ECommissionTier> m_AchievedTierList;
    UPROPERTY()
    int m_CostTimeSec;
    UPROPERTY()
    int m_OldBestCostTimeSec;
    UPROPERTY()
    bool m_bIsNewBest;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommissionTier>> m_CommissionTiers;
    UPROPERTY()
    TArray<FEUIModelContainer> m_NewTierRewardItems;
    UPROPERTY()
    bool m_StateChange;
    UPROPERTY()
    int m_SkipCountdownSeconds;
    UPROPERTY()
    bool m_bShowSkipButton;
    UPROPERTY()
    int m_TitleTextIndex;
    UPROPERTY()
    FText m_TitleNormalText;

    FVM_CommissionFinish()
    {
        this.m_bPendingClose = false;
        this.m_bCanClose = false;
        this.m_bHasNormalReward = false;
        this.m_RewardMoneyNum_Base = 0;
        this.m_RewardMoneyNum_Extra = 0;
        this.m_RewardExpNum_Base = 0;
        this.m_RewardExpNum_Extra = 0;
        this.m_bHasSpecialObjectResurlts = false;
        this.m_RewardScoreNum = 0;
        this.m_FullScoreNum = 0;
        this.m_ScoreRatingImageIndex = 0;
        this.m_bHaveBadge = false;
        this.m_MoneyCount = 0;
        this.m_ExpCount = 0;
        this.m_BaseMoneyCount = 0;
        this.m_BaseExpCount = 0;
        this.m_bIsRaceCommission = false;
        this.m_CurrentTier = ECommissionTier(0);
        this.m_CostTimeSec = 0;
        this.m_OldBestCostTimeSec = 0;
        this.m_bIsNewBest = false;
        this.m_StateChange = false;
        this.m_SkipCountdownSeconds = 0;
        this.m_bShowSkipButton = false;
        this.m_TitleTextIndex = 0;
        this.m_TitleNormalText = NSLOCTEXT("PVX", "Settlement_Performance", "е›ўйџиЎЁзЋ°");
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CommissionFinish(const FVM_CommissionFinish &inout Other)
    {
        this.m_bPendingClose = false;
        this.m_bCanClose = false;
        this.m_bHasNormalReward = false;
        this.m_RewardMoneyNum_Base = 0;
        this.m_RewardMoneyNum_Extra = 0;
        this.m_RewardExpNum_Base = 0;
        this.m_RewardExpNum_Extra = 0;
        this.m_bHasSpecialObjectResurlts = false;
        this.m_RewardScoreNum = 0;
        this.m_FullScoreNum = 0;
        this.m_ScoreRatingImageIndex = 0;
        this.m_bHaveBadge = false;
        this.m_MoneyCount = 0;
        this.m_ExpCount = 0;
        this.m_BaseMoneyCount = 0;
        this.m_BaseExpCount = 0;
        this.m_bIsRaceCommission = false;
        this.m_CurrentTier = ECommissionTier(0);
        this.m_CostTimeSec = 0;
        this.m_OldBestCostTimeSec = 0;
        this.m_bIsNewBest = false;
        this.m_StateChange = false;
        this.m_SkipCountdownSeconds = 0;
        this.m_bShowSkipButton = false;
        this.m_TitleTextIndex = 0;
        this.m_TitleNormalText = NSLOCTEXT("PVX", "Settlement_Performance", "е›ўйџиЎЁзЋ°");
        this.m_bPendingClose = Other.m_bPendingClose;
        this.m_bCanClose = Other.m_bCanClose;
        this.m_CommissionTotalTime = Other.m_CommissionTotalTime;
        this.m_bHasNormalReward = Other.m_bHasNormalReward;
        this.m_RewardMoneyNum_Base = int(Other.m_RewardMoneyNum_Base);
        this.m_RewardMoneyNum_Extra = int(Other.m_RewardMoneyNum_Extra);
        this.m_RewardExpNum_Base = int(Other.m_RewardExpNum_Base);
        this.m_RewardExpNum_Extra = int(Other.m_RewardExpNum_Extra);
        this.m_RewardsData = Other.m_RewardsData;
        this.m_MainObjectResurlts = Other.m_MainObjectResurlts;
        this.m_bHasSpecialObjectResurlts = Other.m_bHasSpecialObjectResurlts;
        this.m_SpecialObjectResurlts = Other.m_SpecialObjectResurlts;
        this.m_RewardScoreNum = int(Other.m_RewardScoreNum);
        this.m_FullScoreNum = int(Other.m_FullScoreNum);
        this.m_ScoreRating = Other.m_ScoreRating;
        this.m_ScoreRatingImageIndex = int(Other.m_ScoreRatingImageIndex);
        this.m_GetCommissionStateTypeText = Other.m_GetCommissionStateTypeText;
        this.m_GetCommissionEndButtonText = Other.m_GetCommissionEndButtonText;
        this.m_TeamerInfos = Other.m_TeamerInfos;
        this.m_BadgeInfos = Other.m_BadgeInfos;
        this.m_bHaveBadge = Other.m_bHaveBadge;
        this.m_MoneyCount = int(Other.m_MoneyCount);
        this.m_ExpCount = int(Other.m_ExpCount);
        this.m_BaseMoneyCount = int(Other.m_BaseMoneyCount);
        this.m_BaseExpCount = int(Other.m_BaseExpCount);
        this.m_bIsRaceCommission = Other.m_bIsRaceCommission;
        this.m_CurrentTier = Other.m_CurrentTier;
        this.m_AchievedTierList = Other.m_AchievedTierList;
        this.m_CostTimeSec = int(Other.m_CostTimeSec);
        this.m_OldBestCostTimeSec = int(Other.m_OldBestCostTimeSec);
        this.m_bIsNewBest = Other.m_bIsNewBest;
        this.m_CommissionTiers = Other.m_CommissionTiers;
        this.m_NewTierRewardItems = Other.m_NewTierRewardItems;
        this.m_StateChange = Other.m_StateChange;
        this.m_SkipCountdownSeconds = int(Other.m_SkipCountdownSeconds);
        this.m_bShowSkipButton = Other.m_bShowSkipButton;
        this.m_TitleTextIndex = int(Other.m_TitleTextIndex);
        this.m_TitleNormalText = Other.m_TitleNormalText;
        return;
    }
    FVM_CommissionFinish& opAssign(const FVM_CommissionFinish &inout Other)
    {
        this.m_bPendingClose = Other.m_bPendingClose;
        this.m_bCanClose = Other.m_bCanClose;
        this.m_CommissionTotalTime = Other.m_CommissionTotalTime;
        this.m_bHasNormalReward = Other.m_bHasNormalReward;
        this.m_RewardMoneyNum_Base = int(Other.m_RewardMoneyNum_Base);
        this.m_RewardMoneyNum_Extra = int(Other.m_RewardMoneyNum_Extra);
        this.m_RewardExpNum_Base = int(Other.m_RewardExpNum_Base);
        this.m_RewardExpNum_Extra = int(Other.m_RewardExpNum_Extra);
        this.m_RewardsData = Other.m_RewardsData;
        this.m_MainObjectResurlts = Other.m_MainObjectResurlts;
        this.m_bHasSpecialObjectResurlts = Other.m_bHasSpecialObjectResurlts;
        this.m_SpecialObjectResurlts = Other.m_SpecialObjectResurlts;
        this.m_RewardScoreNum = int(Other.m_RewardScoreNum);
        this.m_FullScoreNum = int(Other.m_FullScoreNum);
        this.m_ScoreRating = Other.m_ScoreRating;
        this.m_ScoreRatingImageIndex = int(Other.m_ScoreRatingImageIndex);
        this.m_GetCommissionStateTypeText = Other.m_GetCommissionStateTypeText;
        this.m_GetCommissionEndButtonText = Other.m_GetCommissionEndButtonText;
        this.m_TeamerInfos = Other.m_TeamerInfos;
        this.m_BadgeInfos = Other.m_BadgeInfos;
        this.m_bHaveBadge = Other.m_bHaveBadge;
        this.m_MoneyCount = int(Other.m_MoneyCount);
        this.m_ExpCount = int(Other.m_ExpCount);
        this.m_BaseMoneyCount = int(Other.m_BaseMoneyCount);
        this.m_BaseExpCount = int(Other.m_BaseExpCount);
        this.m_bIsRaceCommission = Other.m_bIsRaceCommission;
        this.m_CurrentTier = Other.m_CurrentTier;
        this.m_AchievedTierList = Other.m_AchievedTierList;
        this.m_CostTimeSec = int(Other.m_CostTimeSec);
        this.m_OldBestCostTimeSec = int(Other.m_OldBestCostTimeSec);
        this.m_bIsNewBest = Other.m_bIsNewBest;
        this.m_CommissionTiers = Other.m_CommissionTiers;
        this.m_NewTierRewardItems = Other.m_NewTierRewardItems;
        this.m_StateChange = Other.m_StateChange;
        this.m_SkipCountdownSeconds = int(Other.m_SkipCountdownSeconds);
        this.m_bShowSkipButton = Other.m_bShowSkipButton;
        this.m_TitleTextIndex = int(Other.m_TitleTextIndex);
        return Other.m_TitleNormalText;
    }
    bool HasMoneyCount() const
    {
        return (this.GetMoneyCount() > 0);
    }
    bool HasExpCount() const
    {
        return (this.GetExpCount() > 0);
    }
    int DisplayBaseMoneyCount() const
    {
        return FMath::Min(this.GetBaseMoneyCount(), this.GetMoneyCount());
    }
    int DisplayBaseExpCount() const
    {
        return FMath::Min(this.GetBaseExpCount(), this.GetExpCount());
    }
    int AdditionalMoneyCount() const
    {
        return FMath::Max(0, (this.GetMoneyCount() - this.GetBaseMoneyCount()));
    }
    int AdditionalExpCount() const
    {
        return FMath::Max(0, (this.GetExpCount() - this.GetBaseExpCount()));
    }
    bool HasAdditionalMoneyCount() const
    {
        return (this.AdditionalMoneyCount() > 0);
    }
    bool HasAdditionalExpCount() const
    {
        return (this.AdditionalExpCount() > 0);
    }
    FText GetAdditionalMoneyCountText() const
    {
        return FText::AsNumber(this.AdditionalMoneyCount(), FNumberFormattingOptions().SetAlwaysSign(true));
    }
    FText GetAdditionalExpCountText() const
    {
        return FText::AsNumber(this.AdditionalExpCount(), FNumberFormattingOptions().SetAlwaysSign(true));
    }
    FText GetCostTimeText() const
    {
        if (this.GetCostTimeSec() <= 0)
        {
            return FText();
        }
        return ::CommissionUtils::GetRaceCommissionTimeText(this.GetCostTimeSec());
    }
    void PostConstruct()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FText GetScoreItemDisplayText(const FCommissionFinishScoreItem &inout ScoreItem) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FText __r; return __r;
    }
    FText GetCurCommissionRatingResurlt(const TArray<FCommissionRating> &inout RatingRule, const int CurScore, const int FullScore, int &inout BestRatingImageIndex)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FText __r; return __r;
    }
    int GetRankImageIndex() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    FText GetCommissionTypeName() const
    {
        TDataObjectPtr<FCommissionConfig> local_24 = ::CommissionUtils::GetCurrentCommissionConfig();
        if (local_24)
        {
            TDataObjectPtr<FCommissionTypeConfig> local_74 = ::CommissionUtils::GetCommissionTypeConfig(local_24.opArrow().CommissionType);
            if (local_74)
            {
                return local_74.opArrow().CommissionTypeName;
            }
        }
        return FText();
    }
    int GetCommissionStars() const
    {
        TDataObjectPtr<FCommissionConfig> local_24 = ::CommissionUtils::GetCurrentCommissionConfig();
        if (local_24)
        {
            return local_24.opArrow().CommissionStars;
        }
        return 0;
    }
    FText GetCommissionName() const
    {
        TDataObjectPtr<FCommissionConfig> local_24 = ::CommissionUtils::GetCurrentCommissionConfig();
        if (local_24)
        {
            return local_24.opArrow().CommissionName;
        }
        return FText();
    }
    TDataObjectPtr<FCommissionTierConfig> GetCurrentTierConfig() const
    {
        return TDataObjectPtr<FCommissionTierConfig>(::FCommissionTierConfig::FindByKey(this.GetCurrentTier()));
    }
    bool GetIsNotRaceCommission() const
    {
        return !(this.GetbIsRaceCommission());
    }
    void UpdateRewardItem()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void OnCommissionRewardRsp(const FCE_OnCommissionFinishRewardRspEvent &inout CommissionRewardRsp)
    {
        this.UpdateRewardItem();
        return;
    }
    void CommissionFinishClose()
    {
        this.SetbPendingClose(true);
        FMS_CommissionModelFactory& local_6 = ::FMS_CommissionModelFactory::Get(this.GetManager());
        if (local_6.GetCommissionPopup())
        {
            TEUIModelRef<FM_CommissionPopup> local_8 = local_6.GetCommissionPopup();
            "CommissionFinishClose".EndFullScreenRewardFlow();
        }
        return;
    }
    void OnSkipWaitPhase()
    {
        FMS_CommissionModelFactory& local_4 = ::FMS_CommissionModelFactory::Get(this.GetManager());
        if (local_4.GetCommissionPopup())
        {
            TEUIModelRef<FM_CommissionPopup> local_6 = local_4.GetCommissionPopup();
            SkipCurrentWaitPhase();
        }
        return;
    }
    void BuildNewTierRewardItems()
    {
        this.GetModify_NewTierRewardItems().Empty(0);
        TEUIModelRef<FM_CommissionTier> local_20;
        for (auto& local_18 : this.GetCommissionTiers())
        {
            TEUIModelRef<FM_CommissionTier> local_22 = local_18.opArrow().GetCommissionTier();
            if (!(this.GetAchievedTierList().Contains(ECommissionTier(local_20.opArrow().GetTier()))))
            {
                continue;
            }
            FText local_36;
            if (local_20.opArrow().GetCommissionTierConfig())
            {
                local_36 = local_20.opArrow().GetCommissionTierConfig().opArrow().TierName;
            }
            else
            {
                local_36 = FText();
            }
            for (auto& local_50 : local_20.opArrow().GetRewardItems())
            {
                this.GetModify_NewTierRewardItems().Add(this.MakeTaggedRewardContainer(local_50, local_36));
            }
        }
        return;
    }
    FEUIModelContainer MakeTaggedRewardContainer(const TEUIModelRef<FM_ItemData> &inout ItemData, const FText &inout TagText)
    {
        TEUIModelRef<FVM_ComposableItem> local_6 = TEUIModelRef<FVM_ComposableItem>(::FVM_ComposableItem::Create(this.GetContext().Manager, ItemData, EItemDisplayScenario(3)));
        FText::AsNumber(ItemData.opArrow().GetNum(), FNumberFormattingOptions::DefaultNoGrouping());
        FEUIModelContainer local_28;
        local_28.AddModel(local_6.opImplConv(), false);
        return local_28;
    }
    bool GetbPendingClose() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bPendingClose;
    }
    void SetbPendingClose(const bool __Value) property
    {
        if (!(this.m_bPendingClose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bPendingClose = __Value;
        return;
    }
    bool GetbCanClose() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bCanClose;
    }
    void SetbCanClose(const bool __Value) property
    {
        if (!(this.m_bCanClose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bCanClose = __Value;
        return;
    }
    const FFPTime GetCommissionTotalTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FFPTime GetModify_CommissionTotalTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCommissionTotalTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CommissionTotalTime = __Value;
        return;
    }
    bool GetbHasNormalReward() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bHasNormalReward;
    }
    void SetbHasNormalReward(const bool __Value) property
    {
        if (!(this.m_bHasNormalReward) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bHasNormalReward = __Value;
        return;
    }
    int GetRewardMoneyNum_Base() const property
    {
        this.TrackPropertyRead(4);
        return this.m_RewardMoneyNum_Base;
    }
    void SetRewardMoneyNum_Base(const int __Value) property
    {
        if (this.m_RewardMoneyNum_Base == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_RewardMoneyNum_Base = __Value;
        return;
    }
    int GetRewardMoneyNum_Extra() const property
    {
        this.TrackPropertyRead(5);
        return this.m_RewardMoneyNum_Extra;
    }
    void SetRewardMoneyNum_Extra(const int __Value) property
    {
        if (this.m_RewardMoneyNum_Extra == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_RewardMoneyNum_Extra = __Value;
        return;
    }
    int GetRewardExpNum_Base() const property
    {
        this.TrackPropertyRead(6);
        return this.m_RewardExpNum_Base;
    }
    void SetRewardExpNum_Base(const int __Value) property
    {
        if (this.m_RewardExpNum_Base == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_RewardExpNum_Base = __Value;
        return;
    }
    int GetRewardExpNum_Extra() const property
    {
        this.TrackPropertyRead(7);
        return this.m_RewardExpNum_Extra;
    }
    void SetRewardExpNum_Extra(const int __Value) property
    {
        if (this.m_RewardExpNum_Extra == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_RewardExpNum_Extra = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetRewardsData() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_RewardsData() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetRewardsData(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_RewardsData = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetMainObjectResurlts() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_MainObjectResurlts() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetMainObjectResurlts(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_MainObjectResurlts = __Value;
        return;
    }
    bool GetbHasSpecialObjectResurlts() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bHasSpecialObjectResurlts;
    }
    void SetbHasSpecialObjectResurlts(const bool __Value) property
    {
        if (!(this.m_bHasSpecialObjectResurlts) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bHasSpecialObjectResurlts = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetSpecialObjectResurlts() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_SpecialObjectResurlts() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetSpecialObjectResurlts(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_SpecialObjectResurlts = __Value;
        return;
    }
    int GetRewardScoreNum() const property
    {
        this.TrackPropertyRead(12);
        return this.m_RewardScoreNum;
    }
    void SetRewardScoreNum(const int __Value) property
    {
        if (this.m_RewardScoreNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_RewardScoreNum = __Value;
        return;
    }
    int GetFullScoreNum() const property
    {
        this.TrackPropertyRead(13);
        return this.m_FullScoreNum;
    }
    void SetFullScoreNum(const int __Value) property
    {
        if (this.m_FullScoreNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_FullScoreNum = __Value;
        return;
    }
    const FText GetScoreRating() const property
    {
        const FText __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    FText GetModify_ScoreRating() property
    {
        FText __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetScoreRating(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_ScoreRating = __Value;
        return;
    }
    int GetScoreRatingImageIndex() const property
    {
        this.TrackPropertyRead(15);
        return this.m_ScoreRatingImageIndex;
    }
    void SetScoreRatingImageIndex(const int __Value) property
    {
        if (this.m_ScoreRatingImageIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_ScoreRatingImageIndex = __Value;
        return;
    }
    const FText GetGetCommissionStateTypeText() const property
    {
        const FText __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    FText GetModify_GetCommissionStateTypeText() property
    {
        FText __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetGetCommissionStateTypeText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_GetCommissionStateTypeText = __Value;
        return;
    }
    const FText GetGetCommissionEndButtonText() const property
    {
        const FText __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    FText GetModify_GetCommissionEndButtonText() property
    {
        FText __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetGetCommissionEndButtonText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_GetCommissionEndButtonText = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetTeamerInfos() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(18);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_TeamerInfos() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(18);
        return __r;
    }
    void SetTeamerInfos(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_TeamerInfos = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetBadgeInfos() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(19);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_BadgeInfos() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(19);
        return __r;
    }
    void SetBadgeInfos(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_BadgeInfos = __Value;
        return;
    }
    bool GetbHaveBadge() const property
    {
        this.TrackPropertyRead(20);
        return this.m_bHaveBadge;
    }
    void SetbHaveBadge(const bool __Value) property
    {
        if (!(this.m_bHaveBadge) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_bHaveBadge = __Value;
        return;
    }
    int GetMoneyCount() const property
    {
        this.TrackPropertyRead(21);
        return this.m_MoneyCount;
    }
    void SetMoneyCount(const int __Value) property
    {
        if (this.m_MoneyCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_MoneyCount = __Value;
        return;
    }
    int GetExpCount() const property
    {
        this.TrackPropertyRead(22);
        return this.m_ExpCount;
    }
    void SetExpCount(const int __Value) property
    {
        if (this.m_ExpCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_ExpCount = __Value;
        return;
    }
    int GetBaseMoneyCount() const property
    {
        this.TrackPropertyRead(23);
        return this.m_BaseMoneyCount;
    }
    void SetBaseMoneyCount(const int __Value) property
    {
        if (this.m_BaseMoneyCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(23);
        this.m_BaseMoneyCount = __Value;
        return;
    }
    int GetBaseExpCount() const property
    {
        this.TrackPropertyRead(24);
        return this.m_BaseExpCount;
    }
    void SetBaseExpCount(const int __Value) property
    {
        if (this.m_BaseExpCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(24);
        this.m_BaseExpCount = __Value;
        return;
    }
    bool GetbIsRaceCommission() const property
    {
        this.TrackPropertyRead(25);
        return this.m_bIsRaceCommission;
    }
    void SetbIsRaceCommission(const bool __Value) property
    {
        if (!(this.m_bIsRaceCommission) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(25);
        this.m_bIsRaceCommission = __Value;
        return;
    }
    ECommissionTier GetCurrentTier() const property
    {
        this.TrackPropertyRead(26);
        return this.m_CurrentTier;
    }
    void SetCurrentTier(const ECommissionTier __Value) property
    {
        if (int(this.m_CurrentTier) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(26);
        this.m_CurrentTier = __Value;
        return;
    }
    TArray<ECommissionTier> GetAchievedTierList() const property
    {
        TArray<ECommissionTier> __r;
        this.TrackPropertyRead(27);
        return __r;
    }
    TArray<ECommissionTier> GetModify_AchievedTierList() property
    {
        TArray<ECommissionTier> __r;
        this.MarkPropertyDirty(27);
        return __r;
    }
    void SetAchievedTierList(const TArray<ECommissionTier> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(27);
        this.m_AchievedTierList = __Value;
        return;
    }
    int GetCostTimeSec() const property
    {
        this.TrackPropertyRead(28);
        return this.m_CostTimeSec;
    }
    void SetCostTimeSec(const int __Value) property
    {
        if (this.m_CostTimeSec == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(28);
        this.m_CostTimeSec = __Value;
        return;
    }
    int GetOldBestCostTimeSec() const property
    {
        this.TrackPropertyRead(29);
        return this.m_OldBestCostTimeSec;
    }
    void SetOldBestCostTimeSec(const int __Value) property
    {
        if (this.m_OldBestCostTimeSec == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(29);
        this.m_OldBestCostTimeSec = __Value;
        return;
    }
    bool GetbIsNewBest() const property
    {
        this.TrackPropertyRead(30);
        return this.m_bIsNewBest;
    }
    void SetbIsNewBest(const bool __Value) property
    {
        if (!(this.m_bIsNewBest) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(30);
        this.m_bIsNewBest = __Value;
        return;
    }
    TArray<TEUIModelRef<FVM_CommissionTier>> GetCommissionTiers() const property
    {
        TArray<TEUIModelRef<FVM_CommissionTier>> __r;
        this.TrackPropertyRead(31);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommissionTier>> GetModify_CommissionTiers() property
    {
        TArray<TEUIModelRef<FVM_CommissionTier>> __r;
        this.MarkPropertyDirty(31);
        return __r;
    }
    void SetCommissionTiers(const TArray<TEUIModelRef<FVM_CommissionTier>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(31);
        this.m_CommissionTiers = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetNewTierRewardItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(32);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_NewTierRewardItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(32);
        return __r;
    }
    void SetNewTierRewardItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(32);
        this.m_NewTierRewardItems = __Value;
        return;
    }
    bool GetStateChange() const property
    {
        this.TrackPropertyRead(33);
        return this.m_StateChange;
    }
    void SetStateChange(const bool __Value) property
    {
        if (!(this.m_StateChange) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(33);
        this.m_StateChange = __Value;
        return;
    }
    int GetSkipCountdownSeconds() const property
    {
        this.TrackPropertyRead(34);
        return this.m_SkipCountdownSeconds;
    }
    void SetSkipCountdownSeconds(const int __Value) property
    {
        if (this.m_SkipCountdownSeconds == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(34);
        this.m_SkipCountdownSeconds = __Value;
        return;
    }
    bool GetbShowSkipButton() const property
    {
        this.TrackPropertyRead(35);
        return this.m_bShowSkipButton;
    }
    void SetbShowSkipButton(const bool __Value) property
    {
        if (!(this.m_bShowSkipButton) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(35);
        this.m_bShowSkipButton = __Value;
        return;
    }
    int GetTitleTextIndex() const property
    {
        this.TrackPropertyRead(36);
        return this.m_TitleTextIndex;
    }
    void SetTitleTextIndex(const int __Value) property
    {
        if (this.m_TitleTextIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(36);
        this.m_TitleTextIndex = __Value;
        return;
    }
    const FText GetTitleNormalText() const property
    {
        const FText __r;
        this.TrackPropertyRead(37);
        return __r;
    }
    FText GetModify_TitleNormalText() property
    {
        FText __r;
        this.MarkPropertyDirty(37);
        return __r;
    }
    void SetTitleNormalText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(37);
        this.m_TitleNormalText = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionFinish
{
    UPROPERTY()
    bool HasMoneyCount;
    UPROPERTY()
    bool HasExpCount;
    UPROPERTY()
    int DisplayBaseMoneyCount;
    UPROPERTY()
    int DisplayBaseExpCount;
    UPROPERTY()
    int AdditionalMoneyCount;
    UPROPERTY()
    int AdditionalExpCount;
    UPROPERTY()
    bool HasAdditionalMoneyCount;
    UPROPERTY()
    bool HasAdditionalExpCount;
    UPROPERTY()
    FText AdditionalMoneyCountText;
    UPROPERTY()
    FText AdditionalExpCountText;
    UPROPERTY()
    FText CostTimeText;
    UPROPERTY()
    int RankImageIndex;
    UPROPERTY()
    FText CommissionTypeName;
    UPROPERTY()
    int CommissionStars;
    UPROPERTY()
    FText CommissionName;
    UPROPERTY()
    TDataObjectPtr<FCommissionTierConfig> CurrentTierConfig;
    UPROPERTY()
    bool IsNotRaceCommission;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionFinish> Self;


}

namespace FVM_CommissionFinish
{
FVM_CommissionFinish& Create(const UObject ContextObject)
{
    return FVM_CommissionFinish::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommissionFinish CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommissionFinish __r;
    TEUIModelRef<FVM_CommissionFinish> local_6 = TEUIModelRef<FVM_CommissionFinish>(EUIInternal::MakeModelWithManager(Manager, FVM_CommissionFinish::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bCanClose";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionTotalTime";
    local_14.TypeName = "FFPTime";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasNormalReward";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardMoneyNum_Base";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardMoneyNum_Extra";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardExpNum_Base";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardExpNum_Extra";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardsData";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MainObjectResurlts";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasSpecialObjectResurlts";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SpecialObjectResurlts";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardScoreNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FullScoreNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ScoreRating";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ScoreRatingImageIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GetCommissionStateTypeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GetCommissionEndButtonText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeamerInfos";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BadgeInfos";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHaveBadge";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MoneyCount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExpCount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BaseMoneyCount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BaseExpCount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsRaceCommission";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentTier";
    local_14.TypeName = "ECommissionTier";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AchievedTierList";
    local_14.TypeName = "TArray<ECommissionTier>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CostTimeSec";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OldBestCostTimeSec";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsNewBest";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionTiers";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommissionTier>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NewTierRewardItems";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkipCountdownSeconds";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowSkipButton";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TitleTextIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TitleNormalText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasMoneyCount";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasExpCount";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayBaseMoneyCount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayBaseExpCount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AdditionalMoneyCount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AdditionalExpCount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasAdditionalMoneyCount";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasAdditionalExpCount";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AdditionalMoneyCountText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AdditionalExpCountText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CostTimeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RankImageIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionTypeName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionStars";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentTierConfig";
    local_14.TypeName = "TDataObjectPtr<FCommissionTierConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsNotRaceCommission";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionFinish>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionFinish;
    FEUIModelEventDefine local_22;
    local_22.FunctionName = "__OnCommissionRewardRsp";
    local_22.EventType = FCE_OnCommissionFinishRewardRspEvent;
    Result.EventFunctions.Add(local_22);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionFinish;
}
void __OnCommissionRewardRsp(FVM_CommissionFinish &inout Model, const FCE_OnCommissionFinishRewardRspEvent &inout Event)
{
    Model.OnCommissionRewardRsp(Event);
    return;
}
bool __UIGetter_bCanClose(const FVM_CommissionFinish &inout Model)
{
    return Model.GetbCanClose();
}
FFPTime __UIGetter_CommissionTotalTime(const FVM_CommissionFinish &inout Model)
{
    return Model.GetCommissionTotalTime();
}
bool __UIGetter_bHasNormalReward(const FVM_CommissionFinish &inout Model)
{
    return Model.GetbHasNormalReward();
}
int __UIGetter_RewardMoneyNum_Base(const FVM_CommissionFinish &inout Model)
{
    return Model.GetRewardMoneyNum_Base();
}
int __UIGetter_RewardMoneyNum_Extra(const FVM_CommissionFinish &inout Model)
{
    return Model.GetRewardMoneyNum_Extra();
}
int __UIGetter_RewardExpNum_Base(const FVM_CommissionFinish &inout Model)
{
    return Model.GetRewardExpNum_Base();
}
int __UIGetter_RewardExpNum_Extra(const FVM_CommissionFinish &inout Model)
{
    return Model.GetRewardExpNum_Extra();
}
TArray<FEUIModelRef> __UIGetter_RewardsData(const FVM_CommissionFinish &inout Model)
{
    return Model.GetRewardsData();
}
TArray<FEUIModelContainer> __UIGetter_MainObjectResurlts(const FVM_CommissionFinish &inout Model)
{
    return Model.GetMainObjectResurlts();
}
bool __UIGetter_bHasSpecialObjectResurlts(const FVM_CommissionFinish &inout Model)
{
    return Model.GetbHasSpecialObjectResurlts();
}
TArray<FEUIModelContainer> __UIGetter_SpecialObjectResurlts(const FVM_CommissionFinish &inout Model)
{
    return Model.GetSpecialObjectResurlts();
}
int __UIGetter_RewardScoreNum(const FVM_CommissionFinish &inout Model)
{
    return Model.GetRewardScoreNum();
}
int __UIGetter_FullScoreNum(const FVM_CommissionFinish &inout Model)
{
    return Model.GetFullScoreNum();
}
FText __UIGetter_ScoreRating(const FVM_CommissionFinish &inout Model)
{
    return Model.GetScoreRating();
}
int __UIGetter_ScoreRatingImageIndex(const FVM_CommissionFinish &inout Model)
{
    return Model.GetScoreRatingImageIndex();
}
FText __UIGetter_GetCommissionStateTypeText(const FVM_CommissionFinish &inout Model)
{
    return Model.GetGetCommissionStateTypeText();
}
FText __UIGetter_GetCommissionEndButtonText(const FVM_CommissionFinish &inout Model)
{
    return Model.GetGetCommissionEndButtonText();
}
TArray<FEUIModelContainer> __UIGetter_TeamerInfos(const FVM_CommissionFinish &inout Model)
{
    return Model.GetTeamerInfos();
}
TArray<FEUIModelContainer> __UIGetter_BadgeInfos(const FVM_CommissionFinish &inout Model)
{
    return Model.GetBadgeInfos();
}
bool __UIGetter_bHaveBadge(const FVM_CommissionFinish &inout Model)
{
    return Model.GetbHaveBadge();
}
int __UIGetter_MoneyCount(const FVM_CommissionFinish &inout Model)
{
    return Model.GetMoneyCount();
}
int __UIGetter_ExpCount(const FVM_CommissionFinish &inout Model)
{
    return Model.GetExpCount();
}
int __UIGetter_BaseMoneyCount(const FVM_CommissionFinish &inout Model)
{
    return Model.GetBaseMoneyCount();
}
int __UIGetter_BaseExpCount(const FVM_CommissionFinish &inout Model)
{
    return Model.GetBaseExpCount();
}
bool __UIGetter_bIsRaceCommission(const FVM_CommissionFinish &inout Model)
{
    return Model.GetbIsRaceCommission();
}
ECommissionTier __UIGetter_CurrentTier(const FVM_CommissionFinish &inout Model)
{
    return Model.GetCurrentTier();
}
TArray<ECommissionTier> __UIGetter_AchievedTierList(const FVM_CommissionFinish &inout Model)
{
    return Model.GetAchievedTierList();
}
int __UIGetter_CostTimeSec(const FVM_CommissionFinish &inout Model)
{
    return Model.GetCostTimeSec();
}
int __UIGetter_OldBestCostTimeSec(const FVM_CommissionFinish &inout Model)
{
    return Model.GetOldBestCostTimeSec();
}
bool __UIGetter_bIsNewBest(const FVM_CommissionFinish &inout Model)
{
    return Model.GetbIsNewBest();
}
TArray<TEUIModelRef<FVM_CommissionTier>> __UIGetter_CommissionTiers(const FVM_CommissionFinish &inout Model)
{
    return Model.GetCommissionTiers();
}
TArray<FEUIModelContainer> __UIGetter_NewTierRewardItems(const FVM_CommissionFinish &inout Model)
{
    return Model.GetNewTierRewardItems();
}
int __UIGetter_SkipCountdownSeconds(const FVM_CommissionFinish &inout Model)
{
    return Model.GetSkipCountdownSeconds();
}
bool __UIGetter_bShowSkipButton(const FVM_CommissionFinish &inout Model)
{
    return Model.GetbShowSkipButton();
}
int __UIGetter_TitleTextIndex(const FVM_CommissionFinish &inout Model)
{
    return Model.GetTitleTextIndex();
}
FText __UIGetter_TitleNormalText(const FVM_CommissionFinish &inout Model)
{
    return Model.GetTitleNormalText();
}
bool __UIGetter_HasMoneyCount(const FVM_CommissionFinish &inout Model)
{
    return Model.HasMoneyCount();
}
bool __UIGetter_HasExpCount(const FVM_CommissionFinish &inout Model)
{
    return Model.HasExpCount();
}
int __UIGetter_DisplayBaseMoneyCount(const FVM_CommissionFinish &inout Model)
{
    return Model.DisplayBaseMoneyCount();
}
int __UIGetter_DisplayBaseExpCount(const FVM_CommissionFinish &inout Model)
{
    return Model.DisplayBaseExpCount();
}
int __UIGetter_AdditionalMoneyCount(const FVM_CommissionFinish &inout Model)
{
    return Model.AdditionalMoneyCount();
}
int __UIGetter_AdditionalExpCount(const FVM_CommissionFinish &inout Model)
{
    return Model.AdditionalExpCount();
}
bool __UIGetter_HasAdditionalMoneyCount(const FVM_CommissionFinish &inout Model)
{
    return Model.HasAdditionalMoneyCount();
}
bool __UIGetter_HasAdditionalExpCount(const FVM_CommissionFinish &inout Model)
{
    return Model.HasAdditionalExpCount();
}
FText __UIGetter_AdditionalMoneyCountText(const FVM_CommissionFinish &inout Model)
{
    return Model.GetAdditionalMoneyCountText();
}
FText __UIGetter_AdditionalExpCountText(const FVM_CommissionFinish &inout Model)
{
    return Model.GetAdditionalExpCountText();
}
FText __UIGetter_CostTimeText(const FVM_CommissionFinish &inout Model)
{
    return Model.GetCostTimeText();
}
int __UIGetter_RankImageIndex(const FVM_CommissionFinish &inout Model)
{
    return Model.GetRankImageIndex();
}
FText __UIGetter_CommissionTypeName(const FVM_CommissionFinish &inout Model)
{
    return Model.GetCommissionTypeName();
}
int __UIGetter_CommissionStars(const FVM_CommissionFinish &inout Model)
{
    return Model.GetCommissionStars();
}
FText __UIGetter_CommissionName(const FVM_CommissionFinish &inout Model)
{
    return Model.GetCommissionName();
}
TDataObjectPtr<FCommissionTierConfig> __UIGetter_CurrentTierConfig(const FVM_CommissionFinish &inout Model)
{
    return Model.GetCurrentTierConfig();
}
bool __UIGetter_IsNotRaceCommission(const FVM_CommissionFinish &inout Model)
{
    return Model.GetIsNotRaceCommission();
}
TEUIModelRef<FVM_CommissionFinish> __UIGetter_Self(const FVM_CommissionFinish &inout Model)
{
    return TEUIModelRef<FVM_CommissionFinish>(Model);
}
int __IndexOf_bPendingClose()
{
    return 0;
}
int __IndexOf_bCanClose()
{
    return 1;
}
int __IndexOf_CommissionTotalTime()
{
    return 2;
}
int __IndexOf_bHasNormalReward()
{
    return 3;
}
int __IndexOf_RewardMoneyNum_Base()
{
    return 4;
}
int __IndexOf_RewardMoneyNum_Extra()
{
    return 5;
}
int __IndexOf_RewardExpNum_Base()
{
    return 6;
}
int __IndexOf_RewardExpNum_Extra()
{
    return 7;
}
int __IndexOf_RewardsData()
{
    return 8;
}
int __IndexOf_MainObjectResurlts()
{
    return 9;
}
int __IndexOf_bHasSpecialObjectResurlts()
{
    return 10;
}
int __IndexOf_SpecialObjectResurlts()
{
    return 11;
}
int __IndexOf_RewardScoreNum()
{
    return 12;
}
int __IndexOf_FullScoreNum()
{
    return 13;
}
int __IndexOf_ScoreRating()
{
    return 14;
}
int __IndexOf_ScoreRatingImageIndex()
{
    return 15;
}
int __IndexOf_GetCommissionStateTypeText()
{
    return 16;
}
int __IndexOf_GetCommissionEndButtonText()
{
    return 17;
}
int __IndexOf_TeamerInfos()
{
    return 18;
}
int __IndexOf_BadgeInfos()
{
    return 19;
}
int __IndexOf_bHaveBadge()
{
    return 20;
}
int __IndexOf_MoneyCount()
{
    return 21;
}
int __IndexOf_ExpCount()
{
    return 22;
}
int __IndexOf_BaseMoneyCount()
{
    return 23;
}
int __IndexOf_BaseExpCount()
{
    return 24;
}
int __IndexOf_bIsRaceCommission()
{
    return 25;
}
int __IndexOf_CurrentTier()
{
    return 26;
}
int __IndexOf_AchievedTierList()
{
    return 27;
}
int __IndexOf_CostTimeSec()
{
    return 28;
}
int __IndexOf_OldBestCostTimeSec()
{
    return 29;
}
int __IndexOf_bIsNewBest()
{
    return 30;
}
int __IndexOf_CommissionTiers()
{
    return 31;
}
int __IndexOf_NewTierRewardItems()
{
    return 32;
}
int __IndexOf_StateChange()
{
    return 33;
}
int __IndexOf_SkipCountdownSeconds()
{
    return 34;
}
int __IndexOf_bShowSkipButton()
{
    return 35;
}
int __IndexOf_TitleTextIndex()
{
    return 36;
}
int __IndexOf_TitleNormalText()
{
    return 37;
}
}
namespace __GeneratedProperties_FVM_CommissionFinish
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
