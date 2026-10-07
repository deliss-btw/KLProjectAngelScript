
namespace FVM_CommissionPanel
{
    const FConsoleVariable CVar_CommissionPanel_EnableDsAllocatingDisplay = FConsoleVariable();
    const int ModelId = 0;
    const FEUIModelCallbackSignature SetSelectedCommissionType = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SetSelectedCommissionItem = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnRecruitSendAction = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSwitchMatchStatus = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnConfirmSwitchMatch = FEUIModelCallbackSignature();

}
struct FCommissionListSorter
{
    FCommissionListSorter()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FM_Commission> &inout A, const TEUIModelRef<FM_Commission> &inout B)
    {
        if (A.opArrow().GetCommissionConfig().opArrow().CommissionStars != B.opArrow().GetCommissionConfig().opArrow().CommissionStars)
        {
            return (A.opArrow().GetCommissionConfig().opArrow().CommissionStars > B.opArrow().GetCommissionConfig().opArrow().CommissionStars);
        }
        return (A.opArrow().GetCommissionConfig().opArrow().RecommendedLevel > B.opArrow().GetCommissionConfig().opArrow().RecommendedLevel);
    }
}

struct FVM_CommissionPanel : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    ECommissionType m_DefaultCommissionType;
    UPROPERTY()
    uint m_InitialSelectedCommissionId;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_Text>> m_CommissionTypes;
    UPROPERTY()
    ECommissionType m_CommissionType;
    UPROPERTY()
    int m_SelectedCommissionTypeIndex;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommissionInfo>> m_CommissionList;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionInfo> m_SelectedCommission;
    UPROPERTY()
    TArray<ECommissionType> m_IndexToCommissionType;
    UPROPERTY()
    TMap<ECommissionType, int> m_CommissionTypeToIndex;
    UPROPERTY()
    FMW_CounterDown m_RecruitCooldown;
    UPROPERTY()
    int m_RecruitCountdownSeconds;
    UPROPERTY()
    bool m_bRecruitSendDisabled;
    UPROPERTY()
    bool m_bSelectedCommissionCanMatch;
    UPROPERTY()
    bool m_bSelectedCommissionMatching;
    UPROPERTY()
    bool m_bGlobalMatching;
    UPROPERTY()
    TEUIModelRef<FVM_Match_HintComp> m_MatchHint;

    FVM_CommissionPanel()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_CommissionPanel(const FVM_CommissionPanel &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_CommissionPanel(const ECommissionType InDefaultCommissionType, const uint InInitialSelectedCommissionId)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_CommissionPanel& opAssign(const FVM_CommissionPanel &inout Other)
    {
        this.m_DefaultCommissionType = Other.m_DefaultCommissionType;
        this.m_InitialSelectedCommissionId = int(Other.m_InitialSelectedCommissionId);
        this.m_CommissionTypes = Other.m_CommissionTypes;
        this.m_CommissionType = Other.m_CommissionType;
        this.m_SelectedCommissionTypeIndex = int(Other.m_SelectedCommissionTypeIndex);
        this.m_CommissionList = Other.m_CommissionList;
        this.m_SelectedCommission = Other.m_SelectedCommission;
        this.m_IndexToCommissionType = Other.m_IndexToCommissionType;
        this.m_CommissionTypeToIndex = Other.m_CommissionTypeToIndex;
        this.m_RecruitCooldown = Other.m_RecruitCooldown;
        this.m_RecruitCountdownSeconds = int(Other.m_RecruitCountdownSeconds);
        this.m_bRecruitSendDisabled = Other.m_bRecruitSendDisabled;
        this.m_bSelectedCommissionCanMatch = Other.m_bSelectedCommissionCanMatch;
        this.m_bSelectedCommissionMatching = Other.m_bSelectedCommissionMatching;
        this.m_bGlobalMatching = Other.m_bGlobalMatching;
        return Other.m_MatchHint;
    }
    void PostConstruct()
    {
        int local_59 = 0;
        UCommissionSettings local_2 = ::CommissionUtils::GetCommissionSettings();
        int local_5 = 1;
        for (; local_5 < 6; ++local_5)
        {
            ECommissionType local_9 = local_5;
            if (local_2.HiddenCommissionTypes.Contains(local_9))
            {
                continue;
            }
            local_9 = local_5;
            TDataObjectPtr<FCommissionTypeConfig> local_34 = ::CommissionUtils::GetCommissionTypeConfig(ECommissionType(local_9));
            if (!(local_34))
            {
                continue;
            }
            if (!(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(local_59), false)))
            {
                continue;
            }
            this.GetModify_CommissionTypes().Add(TEUIModelRef<FVM_Text>(::FVM_Text::Create(this.GetContext().Manager, local_34.opArrow().CommissionTypeName)));
            local_9 = local_5;
            this.GetModify_IndexToCommissionType().Add(local_9);
            local_9 = local_5;
            this.GetModify_CommissionTypeToIndex().Add(local_9, (this.GetModify_IndexToCommissionType().Num() - 1));
        }
        if ((int(this.GetDefaultCommissionType())) != 0)
        {
            ECommissionType local_9_2 = this.GetDefaultCommissionType();
            this.SetCommissionType(ECommissionType(local_9_2));
        }
        this.RefreshRecruitCooldownFromData();
        this.SetMatchHint(TEUIModelRef<FVM_Match_HintComp>(::FVM_Match_HintComp::Create(this.GetContext().Manager)));
        return;
    }
    void SetSelectedCommissionType(const int Index)
    {
        if (this.GetIndexToCommissionType().IsValidIndex(Index))
        {
            this.SetCommissionType(ECommissionType(this.GetIndexToCommissionType()[Index]));
        }
        return;
    }
    void SetSelectedCommissionItem(const FEUIModelContainer &inout Item)
    {
        this.SetSelectedCommission(TEUIModelRef<FVM_CommissionInfo>(FEUIModelContainer::GetModel(Item).opCall()));
        return;
    }
    TArray<TEUIModelRef<FVM_CommissionInfo>> CreateCommissionList(const ECommissionType InCommissionType)
    {
        TArray<TEUIModelRef<FVM_CommissionInfo>> local_4;
        TArray<TEUIModelRef<FM_Commission>> local_12 = ::FMS_CommissionData::Get(this.GetContext().Manager).GetCommissionListByType();
        for (auto& local_30 : local_12)
        {
            local_4.Add(TEUIModelRef<FVM_CommissionInfo>(::FVM_CommissionInfo::Create(this.GetContext().Manager, local_30)));
        }
        return local_4;
    }
    void OnSelectedCommissionTypeChanged()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnCommissionListUpdated(const FMsg_CommissionListUpdated &inout Msg)
    {
        this.SetCommissionList(this.CreateCommissionList(this.GetCommissionType()));
        this.SelectDefaultCommissionInList();
        return;
    }
    FEUIModelContainer GetSelectedCommissionTypeItem() const
    {
        if (this.GetCommissionTypes().IsValidIndex(this.GetSelectedCommissionTypeIndex()))
        {
            FEUIModelRef local_18;
            int local_1 = this.GetSelectedCommissionTypeIndex();
            local_18;
            return FEUIModelContainer(local_18);
        }
        return FEUIModelContainer();
    }
    bool IsCommissionListEmpty() const
    {
        return this.GetCommissionList().IsEmpty();
    }
    TEUIModelRef<FVM_MonsterInfo> GetSelectedMonsterInfo() const
    {
        if (this.GetSelectedCommission())
        {
            TEUIModelRef<FVM_CommissionMonsterInfo> local_8 = this.GetSelectedCommission().opArrow().GetCommissionMonsterInfo();
            TEUIModelRef<FVM_CommissionMonsterInfo> local_6;
            if (local_6)
            {
                return local_6.opArrow().GetSelectedMonsterInfo();
            }
        }
        return TEUIModelRef<FVM_MonsterInfo>();
    }
    bool IsRaceCommission() const
    {
        return (int(this.GetCommissionType()) == 5);
    }
    void OnRecruitSendAction()
    {
        if (!(this.GetSelectedCommission()))
        {
            return;
        }
        TEUIModelRef<FVM_CommissionInfo> local_2 = this.GetSelectedCommission();
        TDataObjectPtr<FCommissionConfig> local_28;
        local_28.GetCommissionConfig();
        ::FMS_CommissionData::Get(this.GetContext().Manager).RequestSendCommissionRecruit(local_28);
        return;
    }
    void RefreshRecruitCountdown()
    {
        this.SetRecruitCountdownSeconds(FMath::CeilToInt(FMath::Max(this.GetRecruitCooldown().GetRemainedTime(), 0.0f)));
        return;
    }
    void RefreshRecruitSendDisabled()
    {
        bool local_1 = true;
        bool local_2 = this.GetSelectedCommission();
        if (local_2)
        {
            TDataObjectPtr<FCommissionConfig> local_28;
            TEUIModelRef<FVM_CommissionInfo> local_4 = this.GetSelectedCommission();
            local_28.GetCommissionConfig();
            if (local_28.IsSet())
            {
                local_1 = local_2;
            }
        }
        this.SetbRecruitSendDisabled(local_1);
        return;
    }
    void RefreshSelectedCommissionMatchState()
    {
        bool local_3 = this.GetSelectedCommission().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_CommissionInfo> local_2 = this.GetSelectedCommission();
            local_3 = CanMatchmakingEntry();
        }
        this.SetbSelectedCommissionCanMatch(local_3);
        this.SetbSelectedCommissionMatching(this.IsSelectedCommissionMatching());
        this.SetbGlobalMatching(::FMS_Mode::Get(this.GetContext().Manager).GetbMatching());
        if (this.GetbSelectedCommissionMatching())
        {
            this.RefreshMatchHintName();
        }
        return;
    }
    void OnModeMatchStatusUpdate(const FMsg_ModeMatchStatusUpdate &inout Msg)
    {
        this.SetbSelectedCommissionMatching(this.IsSelectedCommissionMatching());
        this.SetbGlobalMatching(Msg.bMatching);
        if (this.GetbSelectedCommissionMatching())
        {
            this.RefreshMatchHintName();
        }
        return;
    }
    void RefreshMatchHintName()
    {
        int local_59 = 0;
        if (!(this.GetMatchHint().IsValid()) || !(this.GetSelectedCommission()))
        {
            return;
        }
        TEUIModelRef<FVM_CommissionInfo> local_6 = this.GetSelectedCommission();
        TDataObjectPtr<FPveCommissionMatchConfig> local_32;
        local_32.GetCommissionMatchConfig();
        int local_58 = local_32.IsSet() ? local_59 : 0;
        TEUIModelRef<FVM_CommissionInfo> local_6_2 = this.GetSelectedCommission();
        TEUIModelRef<FVM_Match_HintComp> local_2 = this.GetMatchHint();
        2.SetMatchContext(local_58, GetCommissionId());
        return;
    }
    bool IsSelectedCommissionMatching() const
    {
        bool local_3 = this.GetSelectedCommission().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_CommissionInfo> local_2 = this.GetSelectedCommission();
            local_3 = GetIsCurrentCommissionMatching();
        }
        return local_3;
    }
    void OnSwitchMatchStatus()
    {
        if (!(this.GetSelectedCommission()))
        {
            return;
        }
        FMS_Mode& local_6 = ::FMS_Mode::Get(this.GetContext().Manager);
        if (this.IsSelectedCommissionMatching())
        {
            ::FMS_PlayerData::Get(this.GetContext().Manager).GetLocalPlayerData();
            local_6.GS_RequestCancelMatch(GetPlayerUid(), 1);
            return;
        }
        TEUIModelRef<FVM_CommissionInfo> local_2 = this.GetSelectedCommission();
        TDataObjectPtr<FPveCommissionMatchConfig> local_36;
        local_36.GetCommissionMatchConfig();
        if (!(local_36.IsSet()))
        {
            return;
        }
        FDialogModelCallback local_86;
        local_86.Bind(this, FVM_CommissionPanel::OnConfirmSwitchMatch);
        FDialogCallback local_118 = FDialogCallback(local_86);
        TEUIModelRef<FVM_CommissionInfo> local_2_2 = this.GetSelectedCommission();
        if (local_118.ShowLowLevelWarningIfNeeded())
        {
            return;
        }
        this.DoSwitchMatch();
        return;
    }
    bool OnConfirmSwitchMatch(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1 && !(this.IsSelectedCommissionMatching()))
        {
            this.DoSwitchMatch();
        }
        return true;
    }
    void DoSwitchMatch()
    {
        int local_56 = 0;
        int local_64 = 0;
        if (!(this.GetSelectedCommission()))
        {
            return;
        }
        TEUIModelRef<FVM_CommissionInfo> local_2 = this.GetSelectedCommission();
        TDataObjectPtr<FPveCommissionMatchConfig> local_28;
        local_28.GetCommissionMatchConfig();
        if (!(local_28.IsSet()))
        {
            return;
        }
        FMS_Mode& local_54 = ::FMS_Mode::Get(this.GetContext().Manager);
        int local_55 = local_56;
        if ((local_55 > 0 && (::FMS_LocalPlayerTeamData::Get(this.GetContext().Manager).GetTeamMemberCount(ETeamType(1)) == local_55)))
        {
            TEUIModelRef<FM_Commission> local_62;
            TEUIModelRef<FVM_CommissionInfo> local_2_2 = this.GetSelectedCommission();
            local_62.GetCommissionModel();
            local_54.BeginSwitchToDirectEnter(local_62);
            return;
        }
        this.RefreshMatchHintName();
        TEUIModelRef<FVM_CommissionInfo> local_2_3 = this.GetSelectedCommission();
        local_54.BeginSwitchToCommissionMatch(local_64, GetCommissionId());
        return;
    }
    void OnRecruitCdUpdated(const FMsg_CommissionRecruitCdUpdated &inout Msg)
    {
        this.RefreshRecruitCooldownFromData();
        return;
    }
    void RefreshRecruitCooldownFromData()
    {
        int local_2 = ::FMS_CommissionData::Get(this.GetContext().Manager).GetRecruitCooldownRemainingSec();
        if (local_2 > 0)
        {
            this.GetModify_RecruitCooldown().SetRemainedTimeWithPrecision(FFPTime(local_2), EMWCounterDownPrecision(0));
            return;
        }
        return;
    }
    bool ShouldShowCommissionTypeBar() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    void SelectDefaultCommissionInList()
    {
        TEUIModelRef<FVM_CommissionInfo> local_22;
        if (!(this.GetCommissionList().IsEmpty()))
        {
            int local_2 = this.GetInitialSelectedCommissionId();
            if (local_2 != 0)
            {
                for (auto& local_18 : this.GetCommissionList())
                {
                    if (local_18.IsValid() && (GetCommissionId() == this.GetInitialSelectedCommissionId()))
                    {
                        this.SetSelectedCommission(local_18);
                        return;
                    }
                }
            }
            local_22 = this.GetSelectedCommission();
            if (!(this.GetCommissionList().Contains(local_22)))
            {
                this.SetSelectedCommission(this.GetCommissionList()[0]);
            }
            return;
        }
        this.SetSelectedCommission(local_22);
        return;
    }
    ECommissionType GetDefaultCommissionType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_DefaultCommissionType;
    }
    void SetDefaultCommissionType(const ECommissionType __Value) property
    {
        if (int(this.m_DefaultCommissionType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DefaultCommissionType = __Value;
        return;
    }
    uint GetInitialSelectedCommissionId() const property
    {
        this.TrackPropertyRead(1);
        return this.m_InitialSelectedCommissionId;
    }
    void SetInitialSelectedCommissionId(const uint __Value) property
    {
        if (this.m_InitialSelectedCommissionId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_InitialSelectedCommissionId = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_Text>> GetCommissionTypes() const property
    {
        const TArray<TEUIModelRef<FVM_Text>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_Text>> GetModify_CommissionTypes() property
    {
        TArray<TEUIModelRef<FVM_Text>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCommissionTypes(const TArray<TEUIModelRef<FVM_Text>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CommissionTypes = __Value;
        return;
    }
    ECommissionType GetCommissionType() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CommissionType;
    }
    void SetCommissionType(const ECommissionType __Value) property
    {
        if (int(this.m_CommissionType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CommissionType = __Value;
        return;
    }
    int GetSelectedCommissionTypeIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SelectedCommissionTypeIndex;
    }
    void SetSelectedCommissionTypeIndex(const int __Value) property
    {
        if (this.m_SelectedCommissionTypeIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SelectedCommissionTypeIndex = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CommissionInfo>> GetCommissionList() const property
    {
        const TArray<TEUIModelRef<FVM_CommissionInfo>> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommissionInfo>> GetModify_CommissionList() property
    {
        TArray<TEUIModelRef<FVM_CommissionInfo>> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetCommissionList(const TArray<TEUIModelRef<FVM_CommissionInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CommissionList = __Value;
        return;
    }
    TEUIModelRef<FVM_CommissionInfo> GetSelectedCommission() const property
    {
        this.TrackPropertyRead(6);
        return this.m_SelectedCommission;
    }
    void SetSelectedCommission(const TEUIModelRef<FVM_CommissionInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_CommissionInfo> local_2;
        local_2 = this.m_SelectedCommission;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SelectedCommission = __Value;
        return;
    }
    const TArray<ECommissionType> GetIndexToCommissionType() const property
    {
        const TArray<ECommissionType> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<ECommissionType> GetModify_IndexToCommissionType() property
    {
        TArray<ECommissionType> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetIndexToCommissionType(const TArray<ECommissionType> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_IndexToCommissionType = __Value;
        return;
    }
    const TMap<ECommissionType, int> GetCommissionTypeToIndex() const property
    {
        const TMap<ECommissionType, int> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TMap<ECommissionType, int> GetModify_CommissionTypeToIndex() property
    {
        TMap<ECommissionType, int> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetCommissionTypeToIndex(const TMap<ECommissionType, int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CommissionTypeToIndex = __Value;
        return;
    }
    const FMW_CounterDown GetRecruitCooldown() const property
    {
        const FMW_CounterDown __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FMW_CounterDown GetModify_RecruitCooldown() property
    {
        FMW_CounterDown __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetRecruitCooldown(const FMW_CounterDown &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_RecruitCooldown = __Value;
        return;
    }
    int GetRecruitCountdownSeconds() const property
    {
        this.TrackPropertyRead(10);
        return this.m_RecruitCountdownSeconds;
    }
    void SetRecruitCountdownSeconds(const int __Value) property
    {
        if (this.m_RecruitCountdownSeconds == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_RecruitCountdownSeconds = __Value;
        return;
    }
    bool GetbRecruitSendDisabled() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bRecruitSendDisabled;
    }
    void SetbRecruitSendDisabled(const bool __Value) property
    {
        if (!(this.m_bRecruitSendDisabled) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bRecruitSendDisabled = __Value;
        return;
    }
    bool GetbSelectedCommissionCanMatch() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bSelectedCommissionCanMatch;
    }
    void SetbSelectedCommissionCanMatch(const bool __Value) property
    {
        if (!(this.m_bSelectedCommissionCanMatch) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bSelectedCommissionCanMatch = __Value;
        return;
    }
    bool GetbSelectedCommissionMatching() const property
    {
        this.TrackPropertyRead(13);
        return this.m_bSelectedCommissionMatching;
    }
    void SetbSelectedCommissionMatching(const bool __Value) property
    {
        if (!(this.m_bSelectedCommissionMatching) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_bSelectedCommissionMatching = __Value;
        return;
    }
    bool GetbGlobalMatching() const property
    {
        this.TrackPropertyRead(14);
        return this.m_bGlobalMatching;
    }
    void SetbGlobalMatching(const bool __Value) property
    {
        if (!(this.m_bGlobalMatching) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_bGlobalMatching = __Value;
        return;
    }
    TEUIModelRef<FVM_Match_HintComp> GetMatchHint() const property
    {
        this.TrackPropertyRead(15);
        return this.m_MatchHint;
    }
    void SetMatchHint(const TEUIModelRef<FVM_Match_HintComp> &inout __Value) property
    {
        TEUIModelRef<FVM_Match_HintComp> local_2;
        local_2 = this.m_MatchHint;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_MatchHint = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionPanel
{
    UPROPERTY()
    FEUIModelContainer SelectedCommissionTypeItem;
    UPROPERTY()
    bool IsCommissionListEmpty;
    UPROPERTY()
    TEUIModelRef<FVM_MonsterInfo> SelectedMonsterInfo;
    UPROPERTY()
    bool IsRaceCommission;
    UPROPERTY()
    bool IsSelectedCommissionMatching;
    UPROPERTY()
    bool ShouldShowCommissionTypeBar;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionPanel> Self;


}

namespace FVM_CommissionPanel
{
FVM_CommissionPanel& Create(const UObject ContextObject, const ECommissionType DefaultCommissionType, const uint InitialSelectedCommissionId)
{
    return FVM_CommissionPanel::CreateByManager(EUIInternal::GetContextManager(ContextObject), ECommissionType(InitialSelectedCommissionId));
}
FVM_CommissionPanel CreateByManager(const UEUIManagerSubsystem Manager, const ECommissionType DefaultCommissionType, const uint InitialSelectedCommissionId)
{
    FVM_CommissionPanel __r;
    TEUIModelRef<FVM_CommissionPanel> local_6 = TEUIModelRef<FVM_CommissionPanel>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionPanel::ModelId, 0, DefaultCommissionType, InitialSelectedCommissionId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CommissionTypes";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_Text>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommissionInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedCommission";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MatchHint";
    local_14.TypeName = "TEUIModelRef<FVM_Match_HintComp>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedCommissionTypeItem";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsCommissionListEmpty";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedMonsterInfo";
    local_14.TypeName = "TEUIModelRef<FVM_MonsterInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsRaceCommission";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSelectedCommissionMatching";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShowCommissionTypeBar";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionPanel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionPanel;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("RecruitCooldown");
    int local_2_2 = FVM_CommissionPanel::__IndexOf_RecruitCooldown();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "OnSelectedCommissionTypeChanged";
    Result.EffectFunctions.Add(local_26);
    FEUIModelMsgHandleDefine local_36;
    local_36.FunctionName = "__OnCommissionListUpdated";
    local_36.MessageTypeName = "Msg_CommissionListUpdated";
    local_36.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_36);
    local_26.FunctionName = "RefreshRecruitCountdown";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshRecruitSendDisabled";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshSelectedCommissionMatchState";
    Result.EffectFunctions.Add(local_26);
    local_36.FunctionName = "__OnModeMatchStatusUpdate";
    local_36.MessageTypeName = "Msg_ModeMatchStatusUpdate";
    local_36.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_36);
    local_36.FunctionName = "__OnRecruitCdUpdated";
    local_36.MessageTypeName = "Msg_CommissionRecruitCdUpdated";
    local_36.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_36);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionPanel;
}
void __OnCommissionListUpdated(FVM_CommissionPanel &inout Model, const FMsg_CommissionListUpdated &inout Message)
{
    Model.OnCommissionListUpdated(Message);
    return;
}
void __OnModeMatchStatusUpdate(FVM_CommissionPanel &inout Model, const FMsg_ModeMatchStatusUpdate &inout Message)
{
    Model.OnModeMatchStatusUpdate(Message);
    return;
}
void __OnRecruitCdUpdated(FVM_CommissionPanel &inout Model, const FMsg_CommissionRecruitCdUpdated &inout Message)
{
    Model.OnRecruitCdUpdated(Message);
    return;
}
TArray<TEUIModelRef<FVM_Text>> __UIGetter_CommissionTypes(const FVM_CommissionPanel &inout Model)
{
    return Model.GetCommissionTypes();
}
TArray<TEUIModelRef<FVM_CommissionInfo>> __UIGetter_CommissionList(const FVM_CommissionPanel &inout Model)
{
    return Model.GetCommissionList();
}
TEUIModelRef<FVM_CommissionInfo> __UIGetter_SelectedCommission(const FVM_CommissionPanel &inout Model)
{
    return Model.GetSelectedCommission();
}
TEUIModelRef<FVM_Match_HintComp> __UIGetter_MatchHint(const FVM_CommissionPanel &inout Model)
{
    return Model.GetMatchHint();
}
FEUIModelContainer __UIGetter_SelectedCommissionTypeItem(const FVM_CommissionPanel &inout Model)
{
    return Model.GetSelectedCommissionTypeItem();
}
bool __UIGetter_IsCommissionListEmpty(const FVM_CommissionPanel &inout Model)
{
    return Model.IsCommissionListEmpty();
}
TEUIModelRef<FVM_MonsterInfo> __UIGetter_SelectedMonsterInfo(const FVM_CommissionPanel &inout Model)
{
    return Model.GetSelectedMonsterInfo();
}
bool __UIGetter_IsRaceCommission(const FVM_CommissionPanel &inout Model)
{
    return Model.IsRaceCommission();
}
bool __UIGetter_IsSelectedCommissionMatching(const FVM_CommissionPanel &inout Model)
{
    return Model.IsSelectedCommissionMatching();
}
bool __UIGetter_ShouldShowCommissionTypeBar(const FVM_CommissionPanel &inout Model)
{
    return Model.ShouldShowCommissionTypeBar();
}
TEUIModelRef<FVM_CommissionPanel> __UIGetter_Self(const FVM_CommissionPanel &inout Model)
{
    return TEUIModelRef<FVM_CommissionPanel>(Model);
}
int __IndexOf_DefaultCommissionType()
{
    return 0;
}
int __IndexOf_InitialSelectedCommissionId()
{
    return 1;
}
int __IndexOf_CommissionTypes()
{
    return 2;
}
int __IndexOf_CommissionType()
{
    return 3;
}
int __IndexOf_SelectedCommissionTypeIndex()
{
    return 4;
}
int __IndexOf_CommissionList()
{
    return 5;
}
int __IndexOf_SelectedCommission()
{
    return 6;
}
int __IndexOf_IndexToCommissionType()
{
    return 7;
}
int __IndexOf_CommissionTypeToIndex()
{
    return 8;
}
int __IndexOf_RecruitCooldown()
{
    return 9;
}
int __IndexOf_RecruitCountdownSeconds()
{
    return 10;
}
int __IndexOf_bRecruitSendDisabled()
{
    return 11;
}
int __IndexOf_bSelectedCommissionCanMatch()
{
    return 12;
}
int __IndexOf_bSelectedCommissionMatching()
{
    return 13;
}
int __IndexOf_bGlobalMatching()
{
    return 14;
}
int __IndexOf_MatchHint()
{
    return 15;
}
}
namespace __GeneratedProperties_FVM_CommissionPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
