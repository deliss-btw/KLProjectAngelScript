
namespace FVM_PVX_Match
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature LeaveTeam = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnMatchActionConfirm = FEUIModelCallbackSignature();

}
struct FVM_PVX_Match : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FM_ModeItem> m_Mode;
    UPROPERTY()
    TEUIModelRef<FMS_Mode> m_ModeMS;
    UPROPERTY()
    TEUIModelRef<FVM_TeamPanel> m_TeamPanel;
    UPROPERTY()
    bool m_bCanMatch;
    UPROPERTY()
    FText m_ForbiddenMatchText;
    UPROPERTY()
    FText m_DismatchTeamMemberCountTips;
    UPROPERTY()
    FText m_UnselectedCampusTips;
    UPROPERTY()
    bool m_bMatching;
    UPROPERTY()
    bool m_bInOpenPeriod;
    UPROPERTY()
    FText m_OutOfOpenPeriodTips;
    UPROPERTY()
    FEUITimerHandle m_OpenPeriodTickTimer;
    UPROPERTY()
    FText m_OpenPeriodHint;
    UPROPERTY()
    TEUIModelRef<FVM_TitleAndDesc> m_TitleHoverTipsVM;
    UPROPERTY()
    TEUIModelRef<FVM_Match_HintComp> m_MatchHint;
    UPROPERTY()
    TEUIModelRef<FVM_PVX_Match_CampusItem> m_PlayerCampusItem;
    UPROPERTY()
    TEUIModelRef<FVM_PVX_Match_CampusItem> m_BossCampusItem;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TeammateInfo>> m_CurDisplayingTeammates;
    UPROPERTY()
    TEUIModelRef<FM_SocialTeam> m_MyTeam;
    UPROPERTY()
    TEUIModelRef<FVM_TeammateInfo> m_LocalPlayerTeammateInfo;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarShowcase> m_Showcase;

    FVM_PVX_Match()
    {
        this.m_bCanMatch = true;
        this.m_bMatching = false;
        this.m_bInOpenPeriod = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PVX_Match' by default constructor.");
        return;
    }
    FVM_PVX_Match(const FVM_PVX_Match &inout Other)
    {
        this.m_bCanMatch = true;
        this.m_bMatching = false;
        this.m_bInOpenPeriod = true;
        this.m_Mode = Other.m_Mode;
        this.m_ModeMS = Other.m_ModeMS;
        this.m_TeamPanel = Other.m_TeamPanel;
        this.m_bCanMatch = Other.m_bCanMatch;
        this.m_ForbiddenMatchText = Other.m_ForbiddenMatchText;
        this.m_DismatchTeamMemberCountTips = Other.m_DismatchTeamMemberCountTips;
        this.m_UnselectedCampusTips = Other.m_UnselectedCampusTips;
        this.m_bMatching = Other.m_bMatching;
        this.m_bInOpenPeriod = Other.m_bInOpenPeriod;
        this.m_OutOfOpenPeriodTips = Other.m_OutOfOpenPeriodTips;
        this.m_OpenPeriodTickTimer = Other.m_OpenPeriodTickTimer;
        this.m_OpenPeriodHint = Other.m_OpenPeriodHint;
        this.m_TitleHoverTipsVM = Other.m_TitleHoverTipsVM;
        this.m_MatchHint = Other.m_MatchHint;
        this.m_PlayerCampusItem = Other.m_PlayerCampusItem;
        this.m_BossCampusItem = Other.m_BossCampusItem;
        this.m_CurDisplayingTeammates = Other.m_CurDisplayingTeammates;
        this.m_MyTeam = Other.m_MyTeam;
        this.m_LocalPlayerTeammateInfo = Other.m_LocalPlayerTeammateInfo;
        this.m_Showcase = Other.m_Showcase;
        return;
    }
    FVM_PVX_Match(const TEUIModelWeakRef<FM_ModeItem> &inout InMode)
    {
        this.m_bCanMatch = true;
        this.m_bMatching = false;
        this.m_bInOpenPeriod = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMode(InMode);
        return;
    }
    FVM_PVX_Match& opAssign(const FVM_PVX_Match &inout Other)
    {
        this.m_Mode = Other.m_Mode;
        this.m_ModeMS = Other.m_ModeMS;
        this.m_TeamPanel = Other.m_TeamPanel;
        this.m_bCanMatch = Other.m_bCanMatch;
        this.m_ForbiddenMatchText = Other.m_ForbiddenMatchText;
        this.m_DismatchTeamMemberCountTips = Other.m_DismatchTeamMemberCountTips;
        this.m_UnselectedCampusTips = Other.m_UnselectedCampusTips;
        this.m_bMatching = Other.m_bMatching;
        this.m_bInOpenPeriod = Other.m_bInOpenPeriod;
        this.m_OutOfOpenPeriodTips = Other.m_OutOfOpenPeriodTips;
        this.m_OpenPeriodTickTimer = Other.m_OpenPeriodTickTimer;
        this.m_OpenPeriodHint = Other.m_OpenPeriodHint;
        this.m_TitleHoverTipsVM = Other.m_TitleHoverTipsVM;
        this.m_MatchHint = Other.m_MatchHint;
        this.m_PlayerCampusItem = Other.m_PlayerCampusItem;
        this.m_BossCampusItem = Other.m_BossCampusItem;
        this.m_CurDisplayingTeammates = Other.m_CurDisplayingTeammates;
        this.m_MyTeam = Other.m_MyTeam;
        this.m_LocalPlayerTeammateInfo = Other.m_LocalPlayerTeammateInfo;
        return Other.m_Showcase;
    }
    void LoadConfig(const FConfigVM_PVX_Match &inout InConfig)
    {
        this.SetUnselectedCampusTips(InConfig.UnselectedCampusTips);
        this.SetOutOfOpenPeriodTips(InConfig.OutOfOpenPeriodTips);
        this.SetDismatchTeamMemberCountTips(InConfig.DismatchTeamMemberCountTips);
        return;
    }
    void PostConstruct()
    {
        this.SetModeMS(TEUIModelRef<FMS_Mode>(::FMS_Mode::Get(this.GetContext().Manager)));
        this.SetbMatching(this.GetIsCurrentModeMatching());
        if (this.GetMode().IsValid())
        {
            this.SetMatchHint(TEUIModelRef<FVM_Match_HintComp>(::FVM_Match_HintComp::Create(this.GetContext().Manager)));
            TEUIModelWeakRef<FM_ModeItem> local_6 = this.GetMode();
            TEUIModelRef<FVM_Match_HintComp> local_8 = this.GetMatchHint();
            TEUIModelRef<FM_ModeItem> local_10;
            local_10.SetModeData();
            TEUIModelWeakRef<FM_ModeItem> local_6_2 = this.GetMode();
            if (GetMatchConfig().IsSet())
            {
                TEUIModelWeakRef<FM_ModeItem> local_6_3 = this.GetMode();
                CastTo local_38;
                TDataObjectPtr<FPvxMatchConfig> local_62 = local_38.opCall();
                if (local_62)
                {
                    UEUIManagerSubsystem local_64 = this.GetManager();
                    this.SetTitleHoverTipsVM(TEUIModelRef<FVM_TitleAndDesc>());
                    this.SetPlayerCampusItem(TEUIModelRef<FVM_PVX_Match_CampusItem>(::FVM_PVX_Match_CampusItem::Create(this.GetContext().Manager, local_62, true)));
                    this.SetBossCampusItem(TEUIModelRef<FVM_PVX_Match_CampusItem>(::FVM_PVX_Match_CampusItem::Create(this.GetContext().Manager, local_62, false)));
                    if (this.GetOutOfOpenPeriodTips().IsEmpty())
                    {
                        this.SetOutOfOpenPeriodTips(NSLOCTEXT("PVXMatch", "OutOfOpenPeriod", "жњЄењЁзЋ©жі•ејЂе§‹ж—¶ж®µ"));
                    }
                    bool local_3 = ::OpenTimeRangeUtils::IsNowInAnyRange(GetOpenPeriods());
                    this.SetbInOpenPeriod(local_3);
                    if (GetOpenPeriods().Num() > 0)
                    {
                        this.ScheduleTick(this.GetModify_OpenPeriodTickTimer(), n"RefreshOpenPeriod", 30.0f, -1.0f);
                        FText local_72 = ::OpenTimeRangeUtils::GetRangesDisplayText(GetOpenPeriods());
                        if (!(local_72.IsEmpty()))
                        {
                            this.SetOpenPeriodHint(FText::Format(NSLOCTEXT("PVXMatch", "OpenPeriodHint", "<Beige20F>жЇЏж—Ґ </>{0}<Beige20F> ејЂеђЇ</>"), local_72));
                        }
                    }
                    TEUIModelRef<FMS_Mode> local_2 = this.GetModeMS();
                    int local_85 = GetCurSelectCampus() & 1;
                    if (local_85 != 0)
                    {
                        local_3 = false;
                    }
                    else
                    {
                        TEUIModelRef<FMS_Mode> local_2_2 = this.GetModeMS();
                        int local_85_2 = GetCurSelectCampus() & 2;
                        local_3 = (local_85_2 == 0);
                    }
                    if (local_3)
                    {
                        TEUIModelRef<FVM_PVX_Match_CampusItem> local_68 = this.GetPlayerCampusItem();
                        true.SetbSelected();
                    }
                    TEUIModelRef<FMS_Mode> local_2_3 = this.GetModeMS();
                    int local_85_3 = GetCurSelectCampus() & 1;
                    if (local_85_3 != 0)
                    {
                        bool local_89 = true;
                        TEUIModelRef<FVM_PVX_Match_CampusItem> local_68_2 = this.GetPlayerCampusItem();
                        local_89.SetbSelected();
                    }
                    TEUIModelRef<FMS_Mode> local_2_4 = this.GetModeMS();
                    int local_87 = GetCurSelectCampus() & 2;
                    if (local_87 != 0)
                    {
                        bool local_3_3 = true;
                        TEUIModelRef<FVM_PVX_Match_CampusItem> local_68_3 = this.GetBossCampusItem();
                        local_3_3.SetbSelected();
                    }
                }
            }
        }
        return;
    }
    void BeginDestroy()
    {
        this.ClearTimer(this.GetModify_OpenPeriodTickTimer());
        return;
    }
    void Setup(const TEUIModelRef<FVM_TeamPanel> &inout InTeamPanel)
    {
        int local_12 = 0;
        this.SetTeamPanel(InTeamPanel);
        int64 local_2 = 0;
        this.SetMyTeam(TEUIModelRef<FM_SocialTeam>(::FM_SocialTeam::Create(this.GetContext().Manager, 0)));
        TEUIModelRef<FM_SocialTeam> local_6 = this.GetMyTeam();
        FEUIModelWeakRef local_8 = FEUIModelWeakRef(FEUIModelRef());
        local_12.SetPlayer(::FMS_PlayerData::Get(this.GetContext().Manager).GetLocalPlayerData());
        this.GetMyTeam().opArrow().GetModify_TeamCommonData().Members.Add(TEUIModelRef<FM_TeamMember>(local_12));
        TEUIModelRef<FM_SocialTeam> local_6_2 = this.GetMyTeam();
        local_6_2.opArrow().GetModify_TeamCommonData().Captain = (TEUIModelRef<FM_TeamMember>(local_12));
        this.SetLocalPlayerTeammateInfo(TEUIModelRef<FVM_TeammateInfo>(::FVM_TeammateInfo::Create(this.GetContext().Manager, (TEUIModelRef<FM_TeamMember>(local_12)))));
        TEUIModelRef<FVM_TeamPanel> local_22 = this.GetTeamPanel();
        1.SetTeamType();
        return;
    }
    void SetCurrentShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout InShowcase)
    {
        XLog(ELog(70), FString().Append("[PVX_Match]SetCurrentShowcase."));
        this.SetShowcase(InShowcase);
        return;
    }
    void OnDisplayingTeammatesChanged()
    {
        if (this.GetTeamPanel().IsValid())
        {
            TEUIModelRef<FVM_TeamPanel> local_2 = this.GetTeamPanel();
            if (GetDisplayingTeammates().IsEmpty())
            {
                this.GetModify_CurDisplayingTeammates().Empty(0);
                this.GetModify_CurDisplayingTeammates().Add(this.GetLocalPlayerTeammateInfo());
            }
            else
            {
                TEUIModelRef<FVM_TeamPanel> local_2_2 = this.GetTeamPanel();
                this.SetCurDisplayingTeammates(GetDisplayingTeammates());
            }
            this.RefreshCanMatch();
            this.RefreshCampusItemCanMatch();
        }
        return;
    }
    bool CanLeaveTeam() const
    {
        bool local_3 = this.GetTeamPanel().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_TeamPanel> local_2 = this.GetTeamPanel();
            local_3 = HasSocialTeamOtherMembers();
        }
        if (local_3)
        {
            return true;
        }
        return false;
    }
    void LeaveTeam()
    {
        if (this.CanLeaveTeam())
        {
            TEUIModelRef<FVM_TeamPanel> local_4 = this.GetTeamPanel();
            LeaveTeam();
        }
        return;
    }
    bool HasPlayerCampusSelected() const
    {
        bool local_5;
        if (this.GetPlayerCampusItem().IsValid())
        {
            TEUIModelRef<FVM_PVX_Match_CampusItem> local_2 = this.GetPlayerCampusItem();
            local_5 = GetbSelected();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    bool HasBossCampusSelected() const
    {
        bool local_5;
        if (this.GetBossCampusItem().IsValid())
        {
            TEUIModelRef<FVM_PVX_Match_CampusItem> local_2 = this.GetBossCampusItem();
            local_5 = GetbSelected();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    void OnCampusItemClicked(const FMsg_PVXMatchCampusItemClicked &inout Msg)
    {
        if (Msg.ClickCampusItem.IsValid())
        {
            FVM_PVX_Match_CampusItem& local_4;
            local_4.SetbSelected(!(local_4.GetbSelected()));
            this.RefreshCanMatch();
        }
        return;
    }
    void RefreshCanMatch()
    {
        this.SetbCanMatch(true);
        bool local_1 = this.HasPlayerCampusSelected();
        bool local_2 = this.HasBossCampusSelected();
        if (local_1)
        {
            bool local_3;
            TEUIModelRef<FVM_PVX_Match_CampusItem> local_8 = this.GetPlayerCampusItem();
            local_3 = (this.GetCurDisplayingTeammates().Num() <= GetMaxMemberNum());
            if (!(local_3))
            {
                this.SetForbiddenMatchText(this.GetDismatchTeamMemberCountTips());
            }
            this.SetbCanMatch(this.GetbCanMatch() && local_3);
        }
        if (local_2)
        {
            bool local_4;
            int local_9 = this.GetCurDisplayingTeammates().Num();
            TEUIModelRef<FVM_PVX_Match_CampusItem> local_8_2 = this.GetBossCampusItem();
            local_4 = (local_9 <= GetMaxMemberNum());
            if (!(local_4))
            {
                this.SetForbiddenMatchText(this.GetDismatchTeamMemberCountTips());
            }
            this.SetbCanMatch(this.GetbCanMatch() && local_4);
        }
        if (!(local_1) && !(local_2))
        {
            this.SetForbiddenMatchText(this.GetUnselectedCampusTips());
            this.SetbCanMatch(false);
        }
        if (!(this.GetbInOpenPeriod()))
        {
            this.SetForbiddenMatchText(this.GetOutOfOpenPeriodTips());
            this.SetbCanMatch(false);
        }
        return;
    }
    void RefreshOpenPeriod()
    {
        bool local_3 = this.GetMode().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelWeakRef<FM_ModeItem> local_2 = this.GetMode();
            local_3 = GetMatchConfig().IsSet();
        }
        if (local_3)
        {
            TEUIModelWeakRef<FM_ModeItem> local_2_2 = this.GetMode();
            this.SetbInOpenPeriod(::OpenTimeRangeUtils::IsNowInAnyRange(GetOpenPeriods()));
        }
        this.RefreshCanMatch();
        return;
    }
    void RefreshCampusItemCanMatch()
    {
        if (this.GetPlayerCampusItem().IsValid())
        {
            TEUIModelRef<FVM_PVX_Match_CampusItem> local_2 = this.GetPlayerCampusItem();
            bool local_3 = (this.GetCurDisplayingTeammates().Num() <= GetMaxMemberNum());
            TEUIModelRef<FVM_PVX_Match_CampusItem> local_2_2 = this.GetPlayerCampusItem();
            local_3.SetbCanMatch();
        }
        if (this.GetBossCampusItem().IsValid())
        {
            int local_5 = this.GetCurDisplayingTeammates().Num();
            TEUIModelRef<FVM_PVX_Match_CampusItem> local_2_3 = this.GetBossCampusItem();
            bool local_3_2 = (local_5 <= GetMaxMemberNum());
            TEUIModelRef<FVM_PVX_Match_CampusItem> local_2_4 = this.GetBossCampusItem();
            local_3_2.SetbCanMatch();
        }
        return;
    }
    void OnPlayerCampusItemSelectedChange()
    {
        int local_10;
        TEUIModelRef<FVM_PVX_Match_CampusItem> local_2 = this.GetPlayerCampusItem();
        if (GetbSelected())
        {
            TEUIModelRef<FMS_Mode> local_6 = this.GetModeMS();
            local_10 = GetCurSelectCampus() | 1;
        }
        else
        {
            TEUIModelRef<FMS_Mode> local_6_2 = this.GetModeMS();
            local_10 = GetCurSelectCampus() & -2;
        }
        TEUIModelRef<FMS_Mode> local_6_3 = this.GetModeMS();
        local_10.SetCurSelectCampus();
        return;
    }
    void OnBossCampusItemSelectedChange()
    {
        int local_10;
        TEUIModelRef<FVM_PVX_Match_CampusItem> local_2 = this.GetBossCampusItem();
        if (GetbSelected())
        {
            TEUIModelRef<FMS_Mode> local_6 = this.GetModeMS();
            local_10 = GetCurSelectCampus() | 2;
        }
        else
        {
            TEUIModelRef<FMS_Mode> local_6_2 = this.GetModeMS();
            local_10 = GetCurSelectCampus() & -3;
        }
        TEUIModelRef<FMS_Mode> local_6_3 = this.GetModeMS();
        local_10.SetCurSelectCampus();
        return;
    }
    bool GetIsCurrentModeMatching() const
    {
        if (!(this.GetMode().IsValid()))
        {
            return false;
        }
        FMS_Mode& local_6 = ::FMS_Mode::Get(this.GetContext().Manager);
        bool local_9 = local_6.GetbMatching() && (local_6.GetCurMatchMode() == 1);
        if (!(local_9))
        {
            local_9 = false;
        }
        else
        {
            TEUIModelWeakRef<FM_ModeItem> local_2 = this.GetMode();
            local_9 = (local_6.GetCurMatchId() == GetDataId());
        }
        return local_9;
    }
    void OnModeMatchStatusUpdate(const FMsg_ModeMatchStatusUpdate &inout Msg)
    {
        bool local_2 = this.GetIsCurrentModeMatching();
        bool local_3 = !(local_2);
        if (!(this.GetbMatching()) != local_3)
        {
            this.SetbMatching(local_2);
            if (this.GetbMatching() && this.GetMatchHint().IsValid())
            {
                TEUIModelWeakRef<FM_ModeItem> local_8 = this.GetMode();
                TEUIModelRef<FVM_Match_HintComp> local_6 = this.GetMatchHint();
                1.SetMatchContext(GetDataId(), 0);
            }
        }
        return;
    }
    void OnMatchActionConfirm()
    {
        if (!(this.GetMode().IsValid()))
        {
            return;
        }
        if (this.GetbMatching())
        {
            ::FMS_PlayerData::Get(this.GetContext().Manager).GetLocalPlayerData();
            TEUIModelRef<FMS_Mode> local_10 = this.GetModeMS();
            GetPlayerUid().GS_RequestCancelMatch(1);
            return;
        }
        TEUIModelRef<FMS_Mode> local_10_2 = this.GetModeMS();
        if (GetbMatching())
        {
            FCommonTipsParam local_18;
            ::CommonPopup::Tips(NSLOCTEXT("PVXMatch", "AlreadyMatchingOther", "е·Іжњ‰иї›иЎЊдё­зљ„еЊ№й…Ќ"), local_18);
            return;
        }
        if (this.GetbCanMatch())
        {
            TEUIModelRef<FMS_Mode> local_20 = this.GetModeMS();
            int local_4 = GetCurSelectCampus();
            TEUIModelWeakRef<FM_ModeItem> local_2 = this.GetMode();
            int local_21 = GetDataId();
            TEUIModelRef<FMS_Mode> local_10_3 = this.GetModeMS();
            local_21.GS_RequestStartPvxMatch(local_4);
            return;
        }
        if (!(this.GetForbiddenMatchText().IsEmpty()))
        {
            FCommonTipsParam local_18;
            ::CommonPopup::WeakTips(this.GetForbiddenMatchText(), local_18);
        }
        return;
    }
    TEUIModelWeakRef<FM_ModeItem> GetMode() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Mode;
    }
    void SetMode(const TEUIModelWeakRef<FM_ModeItem> &inout __Value) property
    {
        TEUIModelWeakRef<FM_ModeItem> local_2;
        local_2 = this.m_Mode;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Mode = __Value;
        return;
    }
    TEUIModelRef<FMS_Mode> GetModeMS() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ModeMS;
    }
    void SetModeMS(const TEUIModelRef<FMS_Mode> &inout __Value) property
    {
        TEUIModelRef<FMS_Mode> local_2;
        local_2 = this.m_ModeMS;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ModeMS = __Value;
        return;
    }
    TEUIModelRef<FVM_TeamPanel> GetTeamPanel() const property
    {
        this.TrackPropertyRead(2);
        return this.m_TeamPanel;
    }
    void SetTeamPanel(const TEUIModelRef<FVM_TeamPanel> &inout __Value) property
    {
        TEUIModelRef<FVM_TeamPanel> local_2;
        local_2 = this.m_TeamPanel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TeamPanel = __Value;
        return;
    }
    bool GetbCanMatch() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bCanMatch;
    }
    void SetbCanMatch(const bool __Value) property
    {
        if (!(this.m_bCanMatch) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bCanMatch = __Value;
        return;
    }
    const FText GetForbiddenMatchText() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_ForbiddenMatchText() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetForbiddenMatchText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ForbiddenMatchText = __Value;
        return;
    }
    const FText GetDismatchTeamMemberCountTips() const property
    {
        const FText __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FText GetModify_DismatchTeamMemberCountTips() property
    {
        FText __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetDismatchTeamMemberCountTips(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_DismatchTeamMemberCountTips = __Value;
        return;
    }
    const FText GetUnselectedCampusTips() const property
    {
        const FText __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FText GetModify_UnselectedCampusTips() property
    {
        FText __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetUnselectedCampusTips(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_UnselectedCampusTips = __Value;
        return;
    }
    bool GetbMatching() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bMatching;
    }
    void SetbMatching(const bool __Value) property
    {
        if (!(this.m_bMatching) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bMatching = __Value;
        return;
    }
    bool GetbInOpenPeriod() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bInOpenPeriod;
    }
    void SetbInOpenPeriod(const bool __Value) property
    {
        if (!(this.m_bInOpenPeriod) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bInOpenPeriod = __Value;
        return;
    }
    const FText GetOutOfOpenPeriodTips() const property
    {
        const FText __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FText GetModify_OutOfOpenPeriodTips() property
    {
        FText __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetOutOfOpenPeriodTips(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_OutOfOpenPeriodTips = __Value;
        return;
    }
    const FEUITimerHandle GetOpenPeriodTickTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FEUITimerHandle GetModify_OpenPeriodTickTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetOpenPeriodTickTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_OpenPeriodTickTimer = __Value;
        return;
    }
    const FText GetOpenPeriodHint() const property
    {
        const FText __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FText GetModify_OpenPeriodHint() property
    {
        FText __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetOpenPeriodHint(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_OpenPeriodHint = __Value;
        return;
    }
    TEUIModelRef<FVM_TitleAndDesc> GetTitleHoverTipsVM() const property
    {
        this.TrackPropertyRead(12);
        return this.m_TitleHoverTipsVM;
    }
    void SetTitleHoverTipsVM(const TEUIModelRef<FVM_TitleAndDesc> &inout __Value) property
    {
        TEUIModelRef<FVM_TitleAndDesc> local_2;
        local_2 = this.m_TitleHoverTipsVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_TitleHoverTipsVM = __Value;
        return;
    }
    TEUIModelRef<FVM_Match_HintComp> GetMatchHint() const property
    {
        this.TrackPropertyRead(13);
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
        this.MarkPropertyDirty(13);
        this.m_MatchHint = __Value;
        return;
    }
    TEUIModelRef<FVM_PVX_Match_CampusItem> GetPlayerCampusItem() const property
    {
        this.TrackPropertyRead(14);
        return this.m_PlayerCampusItem;
    }
    void SetPlayerCampusItem(const TEUIModelRef<FVM_PVX_Match_CampusItem> &inout __Value) property
    {
        TEUIModelRef<FVM_PVX_Match_CampusItem> local_2;
        local_2 = this.m_PlayerCampusItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_PlayerCampusItem = __Value;
        return;
    }
    TEUIModelRef<FVM_PVX_Match_CampusItem> GetBossCampusItem() const property
    {
        this.TrackPropertyRead(15);
        return this.m_BossCampusItem;
    }
    void SetBossCampusItem(const TEUIModelRef<FVM_PVX_Match_CampusItem> &inout __Value) property
    {
        TEUIModelRef<FVM_PVX_Match_CampusItem> local_2;
        local_2 = this.m_BossCampusItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_BossCampusItem = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TeammateInfo>> GetCurDisplayingTeammates() const property
    {
        const TArray<TEUIModelRef<FVM_TeammateInfo>> __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TeammateInfo>> GetModify_CurDisplayingTeammates() property
    {
        TArray<TEUIModelRef<FVM_TeammateInfo>> __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetCurDisplayingTeammates(const TArray<TEUIModelRef<FVM_TeammateInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_CurDisplayingTeammates = __Value;
        return;
    }
    TEUIModelRef<FM_SocialTeam> GetMyTeam() const property
    {
        this.TrackPropertyRead(17);
        return this.m_MyTeam;
    }
    void SetMyTeam(const TEUIModelRef<FM_SocialTeam> &inout __Value) property
    {
        TEUIModelRef<FM_SocialTeam> local_2;
        local_2 = this.m_MyTeam;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_MyTeam = __Value;
        return;
    }
    TEUIModelRef<FVM_TeammateInfo> GetLocalPlayerTeammateInfo() const property
    {
        this.TrackPropertyRead(18);
        return this.m_LocalPlayerTeammateInfo;
    }
    void SetLocalPlayerTeammateInfo(const TEUIModelRef<FVM_TeammateInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_TeammateInfo> local_2;
        local_2 = this.m_LocalPlayerTeammateInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_LocalPlayerTeammateInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarShowcase> GetShowcase() const property
    {
        this.TrackPropertyRead(19);
        return this.m_Showcase;
    }
    void SetShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarShowcase> local_2;
        local_2 = this.m_Showcase;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_Showcase = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PVX_Match
{
    UPROPERTY()
    bool CanLeaveTeam;
    UPROPERTY()
    bool HasPlayerCampusSelected;
    UPROPERTY()
    bool HasBossCampusSelected;
    UPROPERTY()
    bool IsCurrentModeMatching;
    UPROPERTY()
    TEUIModelRef<FVM_PVX_Match> Self;


}

namespace FVM_PVX_Match
{
FVM_PVX_Match& Create(const UObject ContextObject, const TEUIModelWeakRef<FM_ModeItem> &inout Mode)
{
    return FVM_PVX_Match::CreateByManager(EUIInternal::GetContextManager(ContextObject), Mode);
}
FVM_PVX_Match CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FM_ModeItem> &inout Mode)
{
    FVM_PVX_Match __r;
    TEUIModelRef<FVM_PVX_Match> local_6 = TEUIModelRef<FVM_PVX_Match>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PVX_Match::ModelId, 0, Mode));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_PVX_Match;
}
void __OnDisplayingTeammatesChanged(FVM_PVX_Match &inout Model)
{
    Model.OnDisplayingTeammatesChanged();
    return;
}
void __OnCampusItemClicked(FVM_PVX_Match &inout Model, const FMsg_PVXMatchCampusItemClicked &inout Message)
{
    Model.OnCampusItemClicked(Message);
    return;
}
void __OnPlayerCampusItemSelectedChange(FVM_PVX_Match &inout Model)
{
    Model.OnPlayerCampusItemSelectedChange();
    return;
}
void __OnBossCampusItemSelectedChange(FVM_PVX_Match &inout Model)
{
    Model.OnBossCampusItemSelectedChange();
    return;
}
void __OnModeMatchStatusUpdate(FVM_PVX_Match &inout Model, const FMsg_ModeMatchStatusUpdate &inout Message)
{
    Model.OnModeMatchStatusUpdate(Message);
    return;
}
bool __UIGetter_bMatching(const FVM_PVX_Match &inout Model)
{
    return Model.GetbMatching();
}
bool __UIGetter_bInOpenPeriod(const FVM_PVX_Match &inout Model)
{
    return Model.GetbInOpenPeriod();
}
FText __UIGetter_OpenPeriodHint(const FVM_PVX_Match &inout Model)
{
    return Model.GetOpenPeriodHint();
}
TEUIModelRef<FVM_TitleAndDesc> __UIGetter_TitleHoverTipsVM(const FVM_PVX_Match &inout Model)
{
    return Model.GetTitleHoverTipsVM();
}
TEUIModelRef<FVM_Match_HintComp> __UIGetter_MatchHint(const FVM_PVX_Match &inout Model)
{
    return Model.GetMatchHint();
}
TEUIModelRef<FVM_PVX_Match_CampusItem> __UIGetter_PlayerCampusItem(const FVM_PVX_Match &inout Model)
{
    return Model.GetPlayerCampusItem();
}
TEUIModelRef<FVM_PVX_Match_CampusItem> __UIGetter_BossCampusItem(const FVM_PVX_Match &inout Model)
{
    return Model.GetBossCampusItem();
}
TArray<TEUIModelRef<FVM_TeammateInfo>> __UIGetter_CurDisplayingTeammates(const FVM_PVX_Match &inout Model)
{
    return Model.GetCurDisplayingTeammates();
}
bool __UIGetter_CanLeaveTeam(const FVM_PVX_Match &inout Model)
{
    return Model.CanLeaveTeam();
}
bool __UIGetter_HasPlayerCampusSelected(const FVM_PVX_Match &inout Model)
{
    return Model.HasPlayerCampusSelected();
}
bool __UIGetter_HasBossCampusSelected(const FVM_PVX_Match &inout Model)
{
    return Model.HasBossCampusSelected();
}
bool __UIGetter_IsCurrentModeMatching(const FVM_PVX_Match &inout Model)
{
    return Model.GetIsCurrentModeMatching();
}
TEUIModelRef<FVM_PVX_Match> __UIGetter_Self(const FVM_PVX_Match &inout Model)
{
    return TEUIModelRef<FVM_PVX_Match>(Model);
}
int __IndexOf_Mode()
{
    return 0;
}
int __IndexOf_ModeMS()
{
    return 1;
}
int __IndexOf_TeamPanel()
{
    return 2;
}
int __IndexOf_bCanMatch()
{
    return 3;
}
int __IndexOf_ForbiddenMatchText()
{
    return 4;
}
int __IndexOf_DismatchTeamMemberCountTips()
{
    return 5;
}
int __IndexOf_UnselectedCampusTips()
{
    return 6;
}
int __IndexOf_bMatching()
{
    return 7;
}
int __IndexOf_bInOpenPeriod()
{
    return 8;
}
int __IndexOf_OutOfOpenPeriodTips()
{
    return 9;
}
int __IndexOf_OpenPeriodTickTimer()
{
    return 10;
}
int __IndexOf_OpenPeriodHint()
{
    return 11;
}
int __IndexOf_TitleHoverTipsVM()
{
    return 12;
}
int __IndexOf_MatchHint()
{
    return 13;
}
int __IndexOf_PlayerCampusItem()
{
    return 14;
}
int __IndexOf_BossCampusItem()
{
    return 15;
}
int __IndexOf_CurDisplayingTeammates()
{
    return 16;
}
int __IndexOf_MyTeam()
{
    return 17;
}
int __IndexOf_LocalPlayerTeammateInfo()
{
    return 18;
}
int __IndexOf_Showcase()
{
    return 19;
}
}
namespace __GeneratedProperties_FVM_PVX_Match
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
