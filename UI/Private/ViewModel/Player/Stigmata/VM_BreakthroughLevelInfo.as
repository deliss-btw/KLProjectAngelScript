namespace FVM_BreakthroughLevelInfo
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature RequestLevelBreakthrough = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoBreakthrough = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature StartBreakthroughCommission = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnConfirmStartCommission = FEUIModelCallbackSignature();

}
struct FVM_BreakthroughLevelInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_LocalPlayerLevel> m_PlayerLevel;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDot;
    UPROPERTY()
    int m_BreakthroughLevel;
    UPROPERTY()
    int m_NextLimitLevel;
    UPROPERTY()
    FText m_BreakthroughLevelName;
    UPROPERTY()
    TEUIModelRef<FVM_TitleAndDescAndStatus> m_BreakthroughLevelNameVM;
    UPROPERTY()
    bool m_bReadyBreakthrough;
    UPROPERTY()
    int m_BreakthroughStatus;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardList> m_BreakthroughRewardList;
    UPROPERTY()
    bool m_bHasBreakthroughReward;
    UPROPERTY()
    TEUIModelRef<FVM_StigmataRow> m_CurrentBreakthroughRow;
    UPROPERTY()
    TEUIModelRef<FVM_StigmataRow> m_NextBreakthroughRow;
    UPROPERTY()
    bool m_bNoBreakthroughLevel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> m_BreakthroughConditionList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> m_UnmetConditionList;
    UPROPERTY()
    TEUIModelRef<FVM_TitleAndDescAndStatus> m_AchieveCondition;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_StigmataItem>> m_NoCostStigmataItems;

    FVM_BreakthroughLevelInfo()
    {
        this.m_BreakthroughLevel = 0;
        this.m_NextLimitLevel = 0;
        this.m_bReadyBreakthrough = false;
        this.m_BreakthroughStatus = 0;
        this.m_bHasBreakthroughReward = false;
        this.m_bNoBreakthroughLevel = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_BreakthroughLevelInfo(const FVM_BreakthroughLevelInfo &inout Other)
    {
        this.m_BreakthroughLevel = 0;
        this.m_NextLimitLevel = 0;
        this.m_bReadyBreakthrough = false;
        this.m_BreakthroughStatus = 0;
        this.m_bHasBreakthroughReward = false;
        this.m_bNoBreakthroughLevel = false;
        this.m_PlayerLevel = Other.m_PlayerLevel;
        this.m_RedDot = Other.m_RedDot;
        this.m_BreakthroughLevel = int(Other.m_BreakthroughLevel);
        this.m_NextLimitLevel = int(Other.m_NextLimitLevel);
        this.m_BreakthroughLevelName = Other.m_BreakthroughLevelName;
        this.m_BreakthroughLevelNameVM = Other.m_BreakthroughLevelNameVM;
        this.m_bReadyBreakthrough = Other.m_bReadyBreakthrough;
        this.m_BreakthroughStatus = int(Other.m_BreakthroughStatus);
        this.m_BreakthroughRewardList = Other.m_BreakthroughRewardList;
        this.m_bHasBreakthroughReward = Other.m_bHasBreakthroughReward;
        this.m_CurrentBreakthroughRow = Other.m_CurrentBreakthroughRow;
        this.m_NextBreakthroughRow = Other.m_NextBreakthroughRow;
        this.m_bNoBreakthroughLevel = Other.m_bNoBreakthroughLevel;
        this.m_BreakthroughConditionList = Other.m_BreakthroughConditionList;
        this.m_UnmetConditionList = Other.m_UnmetConditionList;
        this.m_AchieveCondition = Other.m_AchieveCondition;
        this.m_NoCostStigmataItems = Other.m_NoCostStigmataItems;
        return;
    }
    FVM_BreakthroughLevelInfo& opAssign(const FVM_BreakthroughLevelInfo &inout Other)
    {
        this.m_PlayerLevel = Other.m_PlayerLevel;
        this.m_RedDot = Other.m_RedDot;
        this.m_BreakthroughLevel = int(Other.m_BreakthroughLevel);
        this.m_NextLimitLevel = int(Other.m_NextLimitLevel);
        this.m_BreakthroughLevelName = Other.m_BreakthroughLevelName;
        this.m_BreakthroughLevelNameVM = Other.m_BreakthroughLevelNameVM;
        this.m_bReadyBreakthrough = Other.m_bReadyBreakthrough;
        this.m_BreakthroughStatus = int(Other.m_BreakthroughStatus);
        this.m_BreakthroughRewardList = Other.m_BreakthroughRewardList;
        this.m_bHasBreakthroughReward = Other.m_bHasBreakthroughReward;
        this.m_CurrentBreakthroughRow = Other.m_CurrentBreakthroughRow;
        this.m_NextBreakthroughRow = Other.m_NextBreakthroughRow;
        this.m_bNoBreakthroughLevel = Other.m_bNoBreakthroughLevel;
        this.m_BreakthroughConditionList = Other.m_BreakthroughConditionList;
        this.m_UnmetConditionList = Other.m_UnmetConditionList;
        this.m_AchieveCondition = Other.m_AchieveCondition;
        return Other.m_NoCostStigmataItems;
    }
    void PostConstruct()
    {
        this.SetPlayerLevel(TEUIModelRef<FM_LocalPlayerLevel>(::FM_LocalPlayerLevel::Get(this.GetContext().Manager)));
        this.SetRedDot(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_Stigmata_NewBreakthrough, 0))));
        this.Refresh();
        return;
    }
    void OnLevelRefresh(const FMsg_LocalPlayerLevelRefresh &inout Msg)
    {
        this.Refresh();
        return;
    }
    void Refresh()
    {
        bool local_6;
        int local_7;
        const UPlayerInfoSettings local_12;
        this.SetBreakthroughLevel(this.GetPlayerLevel().opArrow().GetCurrentBreakthroughLevel());
        int local_5 = this.GetPlayerLevel().opArrow().GetNextBreakthroughLevelAfter(this.GetBreakthroughLevel());
        int local_4 = INDEX_NONE;
        this.SetbNoBreakthroughLevel((this.GetBreakthroughLevel() == local_4));
        if (local_5 != INDEX_NONE)
        {
            local_7 = local_5;
        }
        else
        {
            local_7 = this.GetPlayerLevel().opArrow().GetMaxLevel();
        }
        this.SetNextLimitLevel(local_7);
        int local_8 = this.GetPlayerLevel().opArrow().GetLevelBreakthroughStatus();
        this.SetbReadyBreakthrough(local_8 == 2 || (local_8 == 3));
        GetGameplaySettings<UPlayerInfoSettings> local_14;
        local_12 = local_14;
        TDataObjectPtr<FPlayerLevelConfig> local_64 = local_12.GetLevelConfig(this.GetBreakthroughLevel());
        if (local_64)
        {
            this.SetBreakthroughLevelName(local_64.opArrow().BreakthroughLevelName);
            TEUIModelRef<FVM_TitleAndDescAndStatus> local_70 = TEUIModelRef<FVM_TitleAndDescAndStatus>(::FVM_TitleAndDescAndStatus::Create(this.GetContext().Manager, this.GetBreakthroughLevelName(), FText()));
            this.SetBreakthroughLevelNameVM(local_70);
            local_6 = this.GetbReadyBreakthrough();
            TEUIModelRef<FVM_TitleAndDescAndStatus> local_70_2 = this.GetBreakthroughLevelNameVM();
            local_70_2.opArrow().SetbDone(local_6);
            TDataObjectPtr<FRewardConfig> local_94;
            local_94 = local_64.opArrow().GetBreakthroughRewardConfig();
            this.SetbHasBreakthroughReward(!((local_94 == nullptr)));
            TDataObjectPtr<FRewardConfig> local_142 = local_64.opArrow().GetBreakthroughRewardConfig();
            if (local_142)
            {
                this.SetBreakthroughRewardList(TEUIModelRef<FVM_CommonRewardList>(::FVM_CommonRewardList::Create(this.GetContext().Manager, ::FCommonRewardListBuilder::BuildFromRewardConfig(local_142))));
            }
        }
        else
        {
            this.SetBreakthroughLevelName(FText());
            this.SetbHasBreakthroughReward(false);
        }
        this.BuildBreakthroughConditions(local_64, local_8);
        if (!(this.GetbNoBreakthroughLevel()))
        {
            this.SetCurrentBreakthroughRow(TEUIModelRef<FVM_StigmataRow>(::FVM_StigmataRow::Create(this.GetContext().Manager, this.GetBreakthroughLevel())));
            this.SetNextBreakthroughRow(TEUIModelRef<FVM_StigmataRow>(::FVM_StigmataRow::Create(this.GetContext().Manager, this.GetNextLimitLevel())));
        }
        else
        {
            this.SetCurrentBreakthroughRow(TEUIModelRef<FVM_StigmataRow>());
            this.SetNextBreakthroughRow(TEUIModelRef<FVM_StigmataRow>());
        }
        this.BuildNoCostStigmataItems();
        this.SetBreakthroughStatus(local_8);
        return;
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetBreakthroughRewards() const
    {
        if (this.GetBreakthroughRewardList())
        {
            TEUIModelRef<FVM_CommonRewardList> local_2 = this.GetBreakthroughRewardList();
            return GetRewards();
        }
        return TArray<TEUIModelRef<FVM_CommonRewardItem>>();
    }
    TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> GetDisplayConditionList() const
    {
        if (this.GetbReadyBreakthrough())
        {
            TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> local_6;
            if (this.GetAchieveCondition())
            {
                local_6.Add(this.GetAchieveCondition());
            }
            return local_6;
        }
        return this.GetBreakthroughConditionList();
    }
    void RequestLevelBreakthrough()
    {
        this.GetPlayerLevel().opArrow().GS_RequestLevelBreakthrough();
        return;
    }
    void GotoBreakthrough()
    {
        ::CommonPopup::CloseAllHover();
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_BreakThrough);
        return;
    }
    void StartBreakthroughCommission()
    {
        const UPlayerInfoSettings local_2;
        GetGameplaySettings<UPlayerInfoSettings> local_4;
        local_2 = local_4;
        TDataObjectPtr<FPlayerLevelConfig> local_56 = local_2.GetLevelConfig(this.GetBreakthroughLevel());
        if (!(local_56) || !(local_56.opArrow().GetBreakthroughLevel()))
        {
            return;
        }
        FText local_62;
        if (local_56.opArrow().GetAchieveCondition())
        {
            local_62 = local_56.opArrow().GetAchieveCondition().opArrow().ConditionTips;
        }
        FDialogModelCallback local_88;
        local_88.Bind(this, FVM_BreakthroughLevelInfo::OnConfirmStartCommission);
        FText local_130 = FText();
        FText local_134 = FText();
        FDialogCallback local_120 = FDialogCallback(local_88);
        FText local_124 = NSLOCTEXT("StartBtCommissionTitle", "突破挑战");
        FCommonDialogParam local_126;
        ::CommonPopup::Dialog_Decision(local_124, local_62, local_120, local_134, local_130, local_126);
        return;
    }
    bool OnConfirmStartCommission(const FCommonDialogAnswer &inout Answer)
    {
        const UPlayerInfoSettings local_6;
        if (int(Answer.AnswerType) == 1)
        {
            GetGameplaySettings<UPlayerInfoSettings> local_8;
            local_6 = local_8;
            TDataObjectPtr<FPlayerLevelConfig> local_58 = local_6.GetLevelConfig(this.GetBreakthroughLevel());
            if (!(!(local_58)) && local_58.opArrow().GetBreakthroughLevel())
            {
                ::UScriptAsToCppModelFunctionRouter::Get().OnRequestStartCommission.Execute(local_58.opArrow().GetBreakthroughLevel());
            }
        }
        return true;
    }
    void BuildBreakthroughConditions(const TDataObjectPtr<FPlayerLevelConfig> &inout LevelConfig, const int BtStatus)
    {
        int local_22 = 0;
        int local_44 = 0;
        this.GetModify_BreakthroughConditionList().Empty(0);
        this.GetModify_UnmetConditionList().Empty(0);
        if (!(LevelConfig))
        {
            return;
        }
        bool local_2 = (this.GetPlayerLevel().opArrow().GetLevel() >= this.GetBreakthroughLevel());
        FText::Format(NSLOCTEXT("BtLevelCondDesc", "{0}/{1}"), this.GetPlayerLevel().opArrow().GetLevel(), this.GetBreakthroughLevel());
        FText::Format(NSLOCTEXT("BtLevelCondTitle", "角色等级达到{0}级"), this.GetBreakthroughLevel());
        local_22.SetbDone(local_2);
        TEUIModelRef<FVM_TitleAndDescAndStatus> local_24 = TEUIModelRef<FVM_TitleAndDescAndStatus>(local_22);
        this.GetModify_BreakthroughConditionList().Add(local_24);
        if (!(local_2))
        {
            TEUIModelRef<FVM_TitleAndDescAndStatus> local_24_2 = TEUIModelRef<FVM_TitleAndDescAndStatus>(local_22);
            this.GetModify_UnmetConditionList().Add(local_24_2);
        }
        for (auto& local_38 : LevelConfig.opArrow().GetBreakthroughCondition())
        {
            if (!(local_38))
            {
                continue;
            }
            int local_7 = this.GetConditionDataId(local_38);
            bool local_3 = (local_7 != INDEX_NONE) && this.GetPlayerLevel().opArrow().IsBreakthroughCondMet(local_7);
            if (local_3)
            {
                NSLOCTEXT("CondCompleted", "已完成");
            }
            else
            {
                NSLOCTEXT("CondIncompleted", "未完成");
            }
            local_44.SetbDone(local_3);
            TEUIModelRef<FVM_TitleAndDescAndStatus> local_24_3 = TEUIModelRef<FVM_TitleAndDescAndStatus>(local_44);
            this.GetModify_BreakthroughConditionList().Add(local_24_3);
            if (!(local_3))
            {
                local_24_3 = TEUIModelRef<FVM_TitleAndDescAndStatus>(local_44);
                this.GetModify_UnmetConditionList().Add(local_24_3);
            }
        }
        if (LevelConfig.opArrow().GetAchieveCondition())
        {
            bool local_41 = (BtStatus == 3);
            TEUIModelRef<FVM_TitleAndDescAndStatus> local_24_4 = TEUIModelRef<FVM_TitleAndDescAndStatus>(::FVM_TitleAndDescAndStatus::Create(this.GetContext().Manager, LevelConfig.opArrow().GetAchieveCondition().opArrow().ConditionTips, local_41 ? NSLOCTEXT("AchieveCompleted", "已完成") : NSLOCTEXT("AchieveIncompleted", "未完成")));
            this.SetAchieveCondition(local_24_4);
            TEUIModelRef<FVM_TitleAndDescAndStatus> local_24_5 = this.GetAchieveCondition();
            local_24_5.opArrow().SetbDone(local_41);
        }
        return;
    }
    int GetConditionDataId(const TDataObjectPtr<FServerConditionConfigBase> &inout Cond) const
    {
        CastTo local_28;
        TDataObjectPtr<FConditionConfig> local_52 = local_28.opCall();
        if (local_52)
        {
            return ::NumericUtils::AsInt32(local_52.opArrow().DataId);
        }
        CastTo local_84;
        TDataObjectPtr<FGsConditionGroupConfig> local_108 = local_84.opCall();
        if (local_108)
        {
            return ::NumericUtils::AsInt32(local_108.opArrow().DataId);
        }
        return INDEX_NONE;
    }
    void BuildNoCostStigmataItems()
    {
        const UPlayerInfoSettings local_4;
        this.GetModify_NoCostStigmataItems().Empty(0);
        GetGameplaySettings<UPlayerInfoSettings> local_6;
        local_4 = local_6;
        int local_1 = this.GetNextLimitLevel();
        TArray<TDataObjectPtr<FStigmataConfig>> local_18 = local_4.GetNoCostStigmataConfigsInRange(this.GetBreakthroughLevel(), local_1);
        for (auto& local_34 : local_18)
        {
            int local_1_2 = ::NumericUtils::AsInt32(local_34.opArrow().DataId);
            this.GetModify_NoCostStigmataItems().Add(TEUIModelRef<FVM_StigmataItem>(::FVM_StigmataItem::Create(this.GetContext().Manager, local_1_2, false, 0, true)));
        }
        return;
    }
    TEUIModelRef<FM_LocalPlayerLevel> GetPlayerLevel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_PlayerLevel;
    }
    void SetPlayerLevel(const TEUIModelRef<FM_LocalPlayerLevel> &inout __Value) property
    {
        TEUIModelRef<FM_LocalPlayerLevel> local_2;
        local_2 = this.m_PlayerLevel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerLevel = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDot() const property
    {
        this.TrackPropertyRead(1);
        return this.m_RedDot;
    }
    void SetRedDot(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RedDot = __Value;
        return;
    }
    int GetBreakthroughLevel() const property
    {
        this.TrackPropertyRead(2);
        return this.m_BreakthroughLevel;
    }
    void SetBreakthroughLevel(const int __Value) property
    {
        if (this.m_BreakthroughLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_BreakthroughLevel = __Value;
        return;
    }
    int GetNextLimitLevel() const property
    {
        this.TrackPropertyRead(3);
        return this.m_NextLimitLevel;
    }
    void SetNextLimitLevel(const int __Value) property
    {
        if (this.m_NextLimitLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_NextLimitLevel = __Value;
        return;
    }
    const FText GetBreakthroughLevelName() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_BreakthroughLevelName() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetBreakthroughLevelName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_BreakthroughLevelName = __Value;
        return;
    }
    TEUIModelRef<FVM_TitleAndDescAndStatus> GetBreakthroughLevelNameVM() const property
    {
        this.TrackPropertyRead(5);
        return this.m_BreakthroughLevelNameVM;
    }
    void SetBreakthroughLevelNameVM(const TEUIModelRef<FVM_TitleAndDescAndStatus> &inout __Value) property
    {
        TEUIModelRef<FVM_TitleAndDescAndStatus> local_2;
        local_2 = this.m_BreakthroughLevelNameVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_BreakthroughLevelNameVM = __Value;
        return;
    }
    bool GetbReadyBreakthrough() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bReadyBreakthrough;
    }
    void SetbReadyBreakthrough(const bool __Value) property
    {
        if (!(this.m_bReadyBreakthrough) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bReadyBreakthrough = __Value;
        return;
    }
    int GetBreakthroughStatus() const property
    {
        this.TrackPropertyRead(7);
        return this.m_BreakthroughStatus;
    }
    void SetBreakthroughStatus(const int __Value) property
    {
        if (this.m_BreakthroughStatus == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_BreakthroughStatus = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonRewardList> GetBreakthroughRewardList() const property
    {
        this.TrackPropertyRead(8);
        return this.m_BreakthroughRewardList;
    }
    void SetBreakthroughRewardList(const TEUIModelRef<FVM_CommonRewardList> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonRewardList> local_2;
        local_2 = this.m_BreakthroughRewardList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_BreakthroughRewardList = __Value;
        return;
    }
    bool GetbHasBreakthroughReward() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bHasBreakthroughReward;
    }
    void SetbHasBreakthroughReward(const bool __Value) property
    {
        if (!(this.m_bHasBreakthroughReward) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bHasBreakthroughReward = __Value;
        return;
    }
    TEUIModelRef<FVM_StigmataRow> GetCurrentBreakthroughRow() const property
    {
        this.TrackPropertyRead(10);
        return this.m_CurrentBreakthroughRow;
    }
    void SetCurrentBreakthroughRow(const TEUIModelRef<FVM_StigmataRow> &inout __Value) property
    {
        TEUIModelRef<FVM_StigmataRow> local_2;
        local_2 = this.m_CurrentBreakthroughRow;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_CurrentBreakthroughRow = __Value;
        return;
    }
    TEUIModelRef<FVM_StigmataRow> GetNextBreakthroughRow() const property
    {
        this.TrackPropertyRead(11);
        return this.m_NextBreakthroughRow;
    }
    void SetNextBreakthroughRow(const TEUIModelRef<FVM_StigmataRow> &inout __Value) property
    {
        TEUIModelRef<FVM_StigmataRow> local_2;
        local_2 = this.m_NextBreakthroughRow;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_NextBreakthroughRow = __Value;
        return;
    }
    bool GetbNoBreakthroughLevel() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bNoBreakthroughLevel;
    }
    void SetbNoBreakthroughLevel(const bool __Value) property
    {
        if (!(this.m_bNoBreakthroughLevel) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bNoBreakthroughLevel = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> GetBreakthroughConditionList() const property
    {
        const TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> GetModify_BreakthroughConditionList() property
    {
        TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetBreakthroughConditionList(const TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_BreakthroughConditionList = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> GetUnmetConditionList() const property
    {
        const TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> GetModify_UnmetConditionList() property
    {
        TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetUnmetConditionList(const TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_UnmetConditionList = __Value;
        return;
    }
    TEUIModelRef<FVM_TitleAndDescAndStatus> GetAchieveCondition() const property
    {
        this.TrackPropertyRead(15);
        return this.m_AchieveCondition;
    }
    void SetAchieveCondition(const TEUIModelRef<FVM_TitleAndDescAndStatus> &inout __Value) property
    {
        TEUIModelRef<FVM_TitleAndDescAndStatus> local_2;
        local_2 = this.m_AchieveCondition;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_AchieveCondition = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_StigmataItem>> GetNoCostStigmataItems() const property
    {
        const TArray<TEUIModelRef<FVM_StigmataItem>> __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    TArray<TEUIModelRef<FVM_StigmataItem>> GetModify_NoCostStigmataItems() property
    {
        TArray<TEUIModelRef<FVM_StigmataItem>> __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetNoCostStigmataItems(const TArray<TEUIModelRef<FVM_StigmataItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_NoCostStigmataItems = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_BreakthroughLevelInfo
{
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonRewardItem>> BreakthroughRewards;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> DisplayConditionList;
    UPROPERTY()
    TEUIModelRef<FVM_BreakthroughLevelInfo> Self;

    __GeneratedProperties_FVM_BreakthroughLevelInfo()
    {
        return;
    }
}

namespace FVM_BreakthroughLevelInfo
{
FVM_BreakthroughLevelInfo& Create(const UObject ContextObject)
{
    return FVM_BreakthroughLevelInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_BreakthroughLevelInfo CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_BreakthroughLevelInfo __r;
    TEUIModelRef<FVM_BreakthroughLevelInfo> local_6 = TEUIModelRef<FVM_BreakthroughLevelInfo>(EUIInternal::MakeModelWithManager(Manager, FVM_BreakthroughLevelInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RedDot";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BreakthroughLevel";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NextLimitLevel";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BreakthroughLevelName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BreakthroughLevelNameVM";
    local_14.TypeName = "TEUIModelRef<FVM_TitleAndDescAndStatus>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bReadyBreakthrough";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BreakthroughStatus";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasBreakthroughReward";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentBreakthroughRow";
    local_14.TypeName = "TEUIModelRef<FVM_StigmataRow>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NextBreakthroughRow";
    local_14.TypeName = "TEUIModelRef<FVM_StigmataRow>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bNoBreakthroughLevel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BreakthroughConditionList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UnmetConditionList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AchieveCondition";
    local_14.TypeName = "TEUIModelRef<FVM_TitleAndDescAndStatus>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NoCostStigmataItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_StigmataItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BreakthroughRewards";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonRewardItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayConditionList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BreakthroughLevelInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BreakthroughLevelInfo;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnLevelRefresh";
    local_26.MessageTypeName = "Msg_LocalPlayerLevelRefresh";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BreakthroughLevelInfo;
}
void __OnLevelRefresh(FVM_BreakthroughLevelInfo &inout Model, const FMsg_LocalPlayerLevelRefresh &inout Message)
{
    Model.OnLevelRefresh(Message);
    return;
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDot(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetRedDot();
}
int __UIGetter_BreakthroughLevel(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetBreakthroughLevel();
}
int __UIGetter_NextLimitLevel(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetNextLimitLevel();
}
FText __UIGetter_BreakthroughLevelName(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetBreakthroughLevelName();
}
TEUIModelRef<FVM_TitleAndDescAndStatus> __UIGetter_BreakthroughLevelNameVM(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetBreakthroughLevelNameVM();
}
bool __UIGetter_bReadyBreakthrough(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetbReadyBreakthrough();
}
int __UIGetter_BreakthroughStatus(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetBreakthroughStatus();
}
bool __UIGetter_bHasBreakthroughReward(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetbHasBreakthroughReward();
}
TEUIModelRef<FVM_StigmataRow> __UIGetter_CurrentBreakthroughRow(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetCurrentBreakthroughRow();
}
TEUIModelRef<FVM_StigmataRow> __UIGetter_NextBreakthroughRow(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetNextBreakthroughRow();
}
bool __UIGetter_bNoBreakthroughLevel(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetbNoBreakthroughLevel();
}
TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> __UIGetter_BreakthroughConditionList(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetBreakthroughConditionList();
}
TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> __UIGetter_UnmetConditionList(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetUnmetConditionList();
}
TEUIModelRef<FVM_TitleAndDescAndStatus> __UIGetter_AchieveCondition(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetAchieveCondition();
}
TArray<TEUIModelRef<FVM_StigmataItem>> __UIGetter_NoCostStigmataItems(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetNoCostStigmataItems();
}
TArray<TEUIModelRef<FVM_CommonRewardItem>> __UIGetter_BreakthroughRewards(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetBreakthroughRewards();
}
TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> __UIGetter_DisplayConditionList(const FVM_BreakthroughLevelInfo &inout Model)
{
    return Model.GetDisplayConditionList();
}
TEUIModelRef<FVM_BreakthroughLevelInfo> __UIGetter_Self(const FVM_BreakthroughLevelInfo &inout Model)
{
    return TEUIModelRef<FVM_BreakthroughLevelInfo>(Model);
}
int __IndexOf_PlayerLevel()
{
    return 0;
}
int __IndexOf_RedDot()
{
    return 1;
}
int __IndexOf_BreakthroughLevel()
{
    return 2;
}
int __IndexOf_NextLimitLevel()
{
    return 3;
}
int __IndexOf_BreakthroughLevelName()
{
    return 4;
}
int __IndexOf_BreakthroughLevelNameVM()
{
    return 5;
}
int __IndexOf_bReadyBreakthrough()
{
    return 6;
}
int __IndexOf_BreakthroughStatus()
{
    return 7;
}
int __IndexOf_BreakthroughRewardList()
{
    return 8;
}
int __IndexOf_bHasBreakthroughReward()
{
    return 9;
}
int __IndexOf_CurrentBreakthroughRow()
{
    return 10;
}
int __IndexOf_NextBreakthroughRow()
{
    return 11;
}
int __IndexOf_bNoBreakthroughLevel()
{
    return 12;
}
int __IndexOf_BreakthroughConditionList()
{
    return 13;
}
int __IndexOf_UnmetConditionList()
{
    return 14;
}
int __IndexOf_AchieveCondition()
{
    return 15;
}
int __IndexOf_NoCostStigmataItems()
{
    return 16;
}
}
namespace __GeneratedProperties_FVM_BreakthroughLevelInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
