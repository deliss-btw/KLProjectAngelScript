
enum EMatchSwitchAction
{
    None,
    StartCommissionMatch,
    DirectEnterCommission,
    AcceptTeamJoin,
}

namespace FM_ModeItem
{
    const int ModelId = 0;
}
namespace FVM_MatchSwitchConfirm
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnAnswer = FEUIModelCallbackSignature();
}
namespace FVM_MatchRecruitConfirm
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnAnswer = FEUIModelCallbackSignature();
}
namespace FMS_Mode
{
    const int ModelId = 0;

}
struct FM_ModeItem : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    uint m_DataId;
    UPROPERTY()
    TDataObjectPtr<FMatchConfig> m_MatchConfig;

    FM_ModeItem()
    {
        this.m_DataId = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_ModeItem' by default constructor.");
        return;
    }
    FM_ModeItem(const FM_ModeItem &inout Other)
    {
        this.m_DataId = 0;
        this.m_DataId = int(Other.m_DataId);
        this.m_MatchConfig = Other.m_MatchConfig;
        return;
    }
    FM_ModeItem(const uint InDataId)
    {
        this.m_DataId = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetDataId(InDataId);
        return;
    }
    FM_ModeItem& opAssign(const FM_ModeItem &inout Other)
    {
        this.m_DataId = int(Other.m_DataId);
        return Other.m_MatchConfig;
    }
    void PostConstruct()
    {
        int local_25 = this.GetDataId();
        GetDataObjectByGSDataId<FMatchConfig> local_24;
        this.SetMatchConfig(local_24.opImplConv());
        this.GetMatchConfig().IsSet();
        return;
    }
    uint GetDataId() const property
    {
        this.TrackPropertyRead(0);
        return this.m_DataId;
    }
    void SetDataId(const uint __Value) property
    {
        if (this.m_DataId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DataId = __Value;
        return;
    }
    const TDataObjectPtr<FMatchConfig> GetMatchConfig() const property
    {
        const TDataObjectPtr<FMatchConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FMatchConfig> GetModify_MatchConfig() property
    {
        TDataObjectPtr<FMatchConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetMatchConfig(const TDataObjectPtr<FMatchConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MatchConfig = __Value;
        return;
    }
}

struct FVM_MatchSwitchConfirm : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;

    FVM_MatchSwitchConfirm()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MatchSwitchConfirm(const FVM_MatchSwitchConfirm &inout Other)
    {
        return;
    }
    FVM_MatchSwitchConfirm opAssign(const FVM_MatchSwitchConfirm &inout Other)
    {
        FVM_MatchSwitchConfirm __r;
        return __r;
    }
    bool OnAnswer(const FCommonDialogAnswer &inout Answer)
    {
        ::FMS_Mode::Get(this.GetContext().Manager).HandleSwitchConfirmAnswer((int(Answer.AnswerType) == 1));
        return true;
    }
}

struct FVM_MatchRecruitConfirm : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;

    FVM_MatchRecruitConfirm()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MatchRecruitConfirm(const FVM_MatchRecruitConfirm &inout Other)
    {
        return;
    }
    FVM_MatchRecruitConfirm opAssign(const FVM_MatchRecruitConfirm &inout Other)
    {
        FVM_MatchRecruitConfirm __r;
        return __r;
    }
    bool OnAnswer(const FCommonDialogAnswer &inout Answer)
    {
        ::FMS_Mode::Get(this.GetContext().Manager).HandleRecruitConfirmAnswer((int(Answer.AnswerType) == 1));
        return true;
    }
}

struct FMS_Mode : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    bool m_bMatching;
    UPROPERTY()
    uint m_MatchStartTime;
    UPROPERTY()
    FFPTime m_MatchWaitTime;
    UPROPERTY()
    uint m_CurSelectCampus;
    UPROPERTY()
    uint m_CurMatchMode;
    UPROPERTY()
    uint m_CurMatchId;
    UPROPERTY()
    uint m_CurMatchCommissionId;
    UPROPERTY()
    FEUIWidgetRef m_MatchConfirmWidget;
    UPROPERTY()
    TEUIModelRef<FM_ModeMatchConfirm> m_MatchConfirmData;
    UPROPERTY()
    EMatchSwitchAction m_PendingSwitchAction;
    UPROPERTY()
    uint m_PendingMatchId;
    UPROPERTY()
    uint m_PendingCommissionId;
    UPROPERTY()
    TEUIModelRef<FM_Commission> m_PendingDirectEnterCommission;
    UPROPERTY()
    bool m_PendingTeamAcceptIsInvite;
    UPROPERTY()
    uint64 m_PendingTeamId;
    UPROPERTY()
    uint m_PendingTeamSourceUid;
    UPROPERTY()
    bool m_bSwitchCancelInFlight;
    UPROPERTY()
    FFPTime m_SwitchCancelWaitTime;
    UPROPERTY()
    uint m_LastSwitchCancelUid;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDialog> m_SwitchConfirmDialog;
    UPROPERTY()
    TEUIModelRef<FVM_MatchSwitchConfirm> m_SwitchConfirmProxy;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDialog> m_RecruitConfirmDialog;
    UPROPERTY()
    TEUIModelRef<FVM_MatchRecruitConfirm> m_RecruitConfirmProxy;
    UPROPERTY()
    uint m_RecruitCommissionId;
    UPROPERTY()
    bool m_bMatchRecruitPromptShown;

    FMS_Mode()
    {
        this.m_bMatching = false;
        this.m_MatchStartTime = 0;
        this.m_MatchWaitTime = 0.0;
        this.m_CurSelectCampus = 0;
        this.m_CurMatchMode = 0;
        this.m_CurMatchId = 0;
        this.m_CurMatchCommissionId = 0;
        this.m_PendingSwitchAction = EMatchSwitchAction(0);
        this.m_PendingMatchId = 0;
        this.m_PendingCommissionId = 0;
        this.m_PendingTeamAcceptIsInvite = false;
        this.m_PendingTeamId = 0;
        this.m_PendingTeamSourceUid = 0;
        this.m_bSwitchCancelInFlight = false;
        this.m_SwitchCancelWaitTime = 0.0;
        this.m_LastSwitchCancelUid = 0;
        this.m_RecruitCommissionId = 0;
        this.m_bMatchRecruitPromptShown = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_Mode(const FMS_Mode &inout Other)
    {
        this.m_bMatching = false;
        this.m_MatchStartTime = 0;
        this.m_MatchWaitTime = 0.0;
        this.m_CurSelectCampus = 0;
        this.m_CurMatchMode = 0;
        this.m_CurMatchId = 0;
        this.m_CurMatchCommissionId = 0;
        this.m_PendingSwitchAction = EMatchSwitchAction(0);
        this.m_PendingMatchId = 0;
        this.m_PendingCommissionId = 0;
        this.m_PendingTeamAcceptIsInvite = false;
        this.m_PendingTeamId = 0;
        this.m_PendingTeamSourceUid = 0;
        this.m_bSwitchCancelInFlight = false;
        this.m_SwitchCancelWaitTime = 0.0;
        this.m_LastSwitchCancelUid = 0;
        this.m_RecruitCommissionId = 0;
        this.m_bMatchRecruitPromptShown = false;
        this.m_bMatching = Other.m_bMatching;
        this.m_MatchStartTime = int(Other.m_MatchStartTime);
        this.m_MatchWaitTime = Other.m_MatchWaitTime;
        this.m_CurSelectCampus = int(Other.m_CurSelectCampus);
        this.m_CurMatchMode = int(Other.m_CurMatchMode);
        this.m_CurMatchId = int(Other.m_CurMatchId);
        this.m_CurMatchCommissionId = int(Other.m_CurMatchCommissionId);
        this.m_MatchConfirmWidget = Other.m_MatchConfirmWidget;
        this.m_MatchConfirmData = Other.m_MatchConfirmData;
        this.m_PendingSwitchAction = Other.m_PendingSwitchAction;
        this.m_PendingMatchId = int(Other.m_PendingMatchId);
        this.m_PendingCommissionId = int(Other.m_PendingCommissionId);
        this.m_PendingDirectEnterCommission = Other.m_PendingDirectEnterCommission;
        this.m_PendingTeamAcceptIsInvite = Other.m_PendingTeamAcceptIsInvite;
        this.m_PendingTeamId = Other.m_PendingTeamId;
        this.m_PendingTeamSourceUid = int(Other.m_PendingTeamSourceUid);
        this.m_bSwitchCancelInFlight = Other.m_bSwitchCancelInFlight;
        this.m_SwitchCancelWaitTime = Other.m_SwitchCancelWaitTime;
        this.m_LastSwitchCancelUid = int(Other.m_LastSwitchCancelUid);
        this.m_SwitchConfirmDialog = Other.m_SwitchConfirmDialog;
        this.m_SwitchConfirmProxy = Other.m_SwitchConfirmProxy;
        this.m_RecruitConfirmDialog = Other.m_RecruitConfirmDialog;
        this.m_RecruitConfirmProxy = Other.m_RecruitConfirmProxy;
        this.m_RecruitCommissionId = int(Other.m_RecruitCommissionId);
        this.m_bMatchRecruitPromptShown = Other.m_bMatchRecruitPromptShown;
        return;
    }
    FMS_Mode opAssign(const FMS_Mode &inout Other)
    {
        FMS_Mode __r;
        this.m_bMatching = Other.m_bMatching;
        this.m_MatchStartTime = int(Other.m_MatchStartTime);
        this.m_MatchWaitTime = Other.m_MatchWaitTime;
        this.m_CurSelectCampus = int(Other.m_CurSelectCampus);
        this.m_CurMatchMode = int(Other.m_CurMatchMode);
        this.m_CurMatchId = int(Other.m_CurMatchId);
        this.m_CurMatchCommissionId = int(Other.m_CurMatchCommissionId);
        this.m_MatchConfirmWidget = Other.m_MatchConfirmWidget;
        this.m_MatchConfirmData = Other.m_MatchConfirmData;
        this.m_PendingSwitchAction = Other.m_PendingSwitchAction;
        this.m_PendingMatchId = int(Other.m_PendingMatchId);
        this.m_PendingCommissionId = int(Other.m_PendingCommissionId);
        this.m_PendingDirectEnterCommission = Other.m_PendingDirectEnterCommission;
        this.m_PendingTeamAcceptIsInvite = Other.m_PendingTeamAcceptIsInvite;
        this.m_PendingTeamId = Other.m_PendingTeamId;
        this.m_PendingTeamSourceUid = int(Other.m_PendingTeamSourceUid);
        this.m_bSwitchCancelInFlight = Other.m_bSwitchCancelInFlight;
        this.m_SwitchCancelWaitTime = Other.m_SwitchCancelWaitTime;
        this.m_LastSwitchCancelUid = int(Other.m_LastSwitchCancelUid);
        this.m_SwitchConfirmDialog = Other.m_SwitchConfirmDialog;
        this.m_SwitchConfirmProxy = Other.m_SwitchConfirmProxy;
        this.m_RecruitConfirmDialog = Other.m_RecruitConfirmDialog;
        this.m_RecruitConfirmProxy = Other.m_RecruitConfirmProxy;
        this.m_RecruitCommissionId = int(Other.m_RecruitCommissionId);
        this.m_bMatchRecruitPromptShown = Other.m_bMatchRecruitPromptShown;
        return __r;
    }
    void OnECSWorldBegin(const FMsg_ECSWorldBegin &inout Msg)
    {
        this.CleanupMatchConfirmOnWorldSwitch();
        return;
    }
    void InvalidateEntityCache()
    {
        this.CleanupMatchConfirmOnWorldSwitch();
        return;
    }
    void CleanupMatchConfirmOnWorldSwitch()
    {
        if (this.GetMatchConfirmWidget().IsValid())
        {
            XLog(ELog(70), FString().Append("[M_Mode]CleanupMatchConfirmOnWorldSwitch. Close residual MatchConfirm."));
            FEUIWidget::RemoveWidget(this.GetMatchConfirmWidget());
        }
        this.SetMatchConfirmData(TEUIModelRef<FM_ModeMatchConfirm>());
        return;
    }
    void Tick()
    {
        if (this.GetbMatching())
        {
            this.SetMatchWaitTime((this.GetMatchWaitTime() + this.GetContext().DeltaTime));
        }
        if (this.GetbSwitchCancelInFlight())
        {
            this.SetSwitchCancelWaitTime((this.GetSwitchCancelWaitTime() + this.GetContext().DeltaTime));
            if (this.GetSwitchCancelWaitTime() > 15.0f)
            {
                XWarning(ELog(70), "[M_Mode] Switch cancel timed out waiting for CANCELLED notify, drop pending switch.");
                this.ClearPendingSwitch();
                FCommonTipsParam local_16;
                ::CommonPopup::Tips(NSLOCTEXT("Mode", "SwitchTimeout", "еЅ“е‰Ќж— жі•е€‡жЌўеЊ№й…ЌпјЊиЇ·зЁЌеђЋе†ЌиЇ•"), local_16);
            }
        }
        return;
    }
    void GS_RequestStartPvxMatch(const uint MatchId, const uint Camp) const
    {
        this.SendStartMatch(MatchId, 1, Camp, 0);
        return;
    }
    void GS_RequestStartCommissionMatch(const uint MatchId, const uint CommissionId) const
    {
        this.SendStartMatch(MatchId, 2, 0, CommissionId);
        return;
    }
    void SendStartMatch(const uint MatchId, const uint MatchMode, const uint Camp, const uint CommissionId) const
    {
        XLog(ELog(70), FString().Append("[M_Mode]SendStartMatch. MatchId:[").Append(MatchId).Append("], MatchMode:[").Append(MatchMode).Append("], Camp:[").Append(Camp).Append("], CommissionId:[").Append(CommissionId).Append("]"));
        FPbStartMatchReq local_10;
        local_10.SetMatchId(MatchId);
        local_10.SetMatchMode(MatchMode);
        local_10.SetCampId(Camp);
        if (CommissionId != 0)
        {
            local_10.SetCommissionId(CommissionId);
        }
        this.SendProto(local_10.ToWrapper());
        return;
    }
    void GS_OnStartMatchRsp(const FPbStartMatchRsp &inout StartMatchRsp)
    {
        XLog(ELog(70), FString().Append("[M_Mode]GS_OnStartMatchRsp. Retcode:[").Append(StartMatchRsp.GetRetcode()).Append("]"));
        if (StartMatchRsp.GetRetcode() == 0)
        {
            this.SetMatchWaitTime(FFPTime(0.0));
        }
        return;
    }
    void GS_RequestCancelMatch(const uint Uid, const uint Reason) const
    {
        XLog(ELog(70), FString().Append("[M_Mode]GS_RequestCancelMatch. Uid:[").Append(Uid).Append("], Reason:[").Append(Reason).Append("]"));
        FPbCancelMatchReq local_10;
        local_10.SetUid(Uid);
        local_10.SetReason(Reason);
        this.SendProto(local_10.ToWrapper());
        return;
    }
    void GS_OnCancelMatchRsp(const FPbCancelMatchRsp &inout CancelMatchRsp)
    {
        XLog(ELog(70), FString().Append("[M_Mode]GS_OnCancelMatchRsp. Retcode:[").Append(CancelMatchRsp.GetRetcode()).Append("]"));
        if (this.GetbSwitchCancelInFlight() && (CancelMatchRsp.GetRetcode() != 0))
        {
            this.ClearPendingSwitch();
            this.CloseSwitchConfirmDialogIfOpen();
            FCommonTipsParam local_18;
            ::CommonPopup::Tips(NSLOCTEXT("Mode", "SwitchCancelRejected", "еЅ“е‰Ќж— жі•е€‡жЌўеЊ№й…Ќ"), local_18);
        }
        return;
    }
    void GS_RequestMatchKeepalive() const
    {
        XLog(ELog(70), FString().Append("[M_Mode]GS_RequestMatchKeepalive."));
        FPbMatchKeepaliveReq local_10;
        this.SendProto(local_10.ToWrapper());
        return;
    }
    void GS_OnMatchKeepaliveRsp(const FPbMatchKeepaliveRsp &inout MatchKeepaliveRsp)
    {
        XLog(ELog(70), FString().Append("[M_Mode]GS_OnMatchKeepaliveRsp."));
        return;
    }
    void GS_RequestMatchConfirm(const bool bConfirm) const
    {
        XLog(ELog(70), FString().Append("[M_Mode]GS_RequestMatchConfirm. bConfirm:[").Append(bConfirm).Append("]"));
        FPbMatchConfirmReq local_10;
        bool local_11 = !(bConfirm);
        local_10.SetIsReject(local_11);
        this.SendProto(local_10.ToWrapper());
        return;
    }
    void GS_OnMatchConfirmRsp(const FPbMatchConfirmRsp &inout MatchConfirmRsp)
    {
        XLog(ELog(70), FString().Append("[M_Mode]GS_OnMatchConfirmRsp. Retcode:[").Append(MatchConfirmRsp.GetRetcode()).Append("]"));
        if (MatchConfirmRsp.GetRetcode() == 0)
        {
            if (this.GetMatchConfirmData().IsValid())
            {
                TEUIModelRef<FM_ModeMatchConfirm> local_10 = this.GetMatchConfirmData();
                SetConfirmSent();
            }
        }
        return;
    }
    void GS_OnMatchInfoNotify(const FPbMatchStatusNotify &inout Notify)
    {
        bool local_38;
        XLog(ELog(70), FString().Append("[M_Mode]GS_OnMatchInfoNotify. match_status:[").Append(Notify.GetMatchStatus()).Append("], match_id:[").Append(Notify.GetMatchKey().GetMatchId()).Append("], start_time:[").Append(Notify.GetStartTime()).Append("], player_confirm_count:[").Append(Notify.GetPlayerConfirmCount()).Append("], player_total_count:[").Append(Notify.GetPlayerTotalCount()).Append("]"));
        FPbMatchKey local_16 = Notify.GetMatchKey();
        int local_20 = local_16.GetMatchMode();
        int local_5 = local_16.GetMatchId();
        int local_33 = local_16.GetCommissionId();
        int local_34 = Notify.GetCancelUid();
        int local_35 = Notify.GetCancelReason();
        local_38 = this.GetbMatching();
        bool local_40 = false;
        if (Notify.GetMatchStatus() == 1)
        {
            this.SetbMatching(true);
            local_40 = true;
            this.SetCurMatchMode(local_16.GetMatchMode());
            this.SetCurMatchId(local_16.GetMatchId());
            this.SetCurMatchCommissionId(local_16.GetCommissionId());
            int local_37 = this.GetLastSwitchCancelUid();
            if (local_37 != 0)
            {
                this.ShowMatchStartedHint(this.GetLastSwitchCancelUid(), this.GetCurMatchMode(), this.GetCurMatchId(), this.GetCurMatchCommissionId());
                this.SetLastSwitchCancelUid(0);
            }
        }
        else
        {
            if (Notify.GetMatchStatus() == 2)
            {
                this.SetbMatching(false);
                this.CloseSwitchConfirmDialogIfOpen();
                if (int(this.GetPendingSwitchAction()) != 0)
                {
                    this.ClearPendingSwitch();
                }
                if (Notify.GetPlayerConfirmCount() == Notify.GetPlayerTotalCount())
                {
                    this.SetMatchWaitTime(FFPTime(0.0));
                }
                if (local_38 || this.GetMatchConfirmWidget().IsValid())
                {
                    TMap<uint, uint> local_72;
                    int local_73 = 0;
                    for (; local_73 < Notify.GetUidStatus_Num(); )
                    {
                        FPbUint32Pair local_94 = Notify.GetUidStatus_Index(local_73);
                        local_72.Add(local_94.GetFirst(), local_94.GetSecond());
                        ++local_73;
                    }
                    if (!(this.GetMatchConfirmData().IsValid()))
                    {
                        FM_ModeMatchConfirm& local_98 = ::FM_ModeMatchConfirm::Create(this.GetContext().Manager, local_5);
                        local_98.SetMatchMode(local_20);
                        local_98.SetCommissionId(local_33);
                        this.SetMatchConfirmData(TEUIModelRef<FM_ModeMatchConfirm>(local_98));
                    }
                    TEUIModelRef<FM_ModeMatchConfirm> local_96 = this.GetMatchConfirmData();
                    if (!(this.GetMatchConfirmWidget().IsValid()))
                    {
                        XLog(ELog(70), FString().Append("[M_Mode]GS_OnMatchInfoNotify. Show MatchConfirm."));
                        FEUIModelRef local_100 = this.GetMatchConfirmData().opImplConv();
                        FEUIModelRef local_102;
                        this.SetMatchConfirmWidget(FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_TeamMemberConfirm, local_102));
                    }
                }
                else
                {
                    XLog(ELog(70), FString().Append("[M_Mode]GS_OnMatchInfoNotify. Skip stray SUCCESS (not following ING, no widget)."));
                }
            }
            else
            {
                if (Notify.GetMatchStatus() == 3)
                {
                    this.SetbMatching(false);
                    this.SetMatchWaitTime(FFPTime(0.0));
                    local_40 = true;
                    this.CloseSwitchConfirmDialogIfOpen();
                    if (int(this.GetPendingSwitchAction()) != 0)
                    {
                        this.ClearPendingSwitch();
                    }
                }
                else
                {
                    if (Notify.GetMatchStatus() == 4)
                    {
                        this.SetbMatching(false);
                        this.SetMatchWaitTime(FFPTime(0.0));
                        local_40 = true;
                        this.ShowMatchTimeoutHint(local_20, local_5, local_33);
                        this.CloseSwitchConfirmDialogIfOpen();
                        if (int(this.GetPendingSwitchAction()) != 0)
                        {
                            this.ClearPendingSwitch();
                        }
                    }
                    else
                    {
                        if (Notify.GetMatchStatus() == 5)
                        {
                            this.SetbMatching(false);
                            this.SetMatchWaitTime(FFPTime(0.0));
                            local_40 = true;
                            if (local_35 == 4)
                            {
                                this.SetLastSwitchCancelUid(local_34);
                            }
                            else
                            {
                                if (local_35 == 1)
                                {
                                    this.ShowMatchCancelledByPlayerHint(local_34, local_20, local_5, local_33);
                                }
                                else
                                {
                                    if (local_35 == 2)
                                    {
                                        FCommonTipsParam local_112;
                                        ::CommonPopup::Tips(NSLOCTEXT("Mode", "MatchCancelledByTeamChange", "йџдјЌдєєж•°еЏ‘з”џеЏеЊ–пјЊе·ІеЏ–ж¶€еЊ№й…Ќ"), local_112);
                                    }
                                }
                            }
                            if (this.GetbSwitchCancelInFlight() && (int(this.GetPendingSwitchAction()) != 0))
                            {
                                this.ExecutePendingSwitchAction();
                            }
                        }
                        else
                        {
                            if (Notify.GetMatchStatus() == 6)
                            {
                                this.SetbMatching(false);
                                this.SetMatchWaitTime(FFPTime(0.0));
                                local_40 = true;
                                this.CloseSwitchConfirmDialogIfOpen();
                                if (int(this.GetPendingSwitchAction()) != 0)
                                {
                                    this.ClearPendingSwitch();
                                }
                            }
                            else
                            {
                            }
                        }
                    }
                }
            }
        }
        this.SetMatchStartTime(Notify.GetStartTime());
        if (!(this.GetbMatching()))
        {
            this.SetCurMatchMode(0);
            this.SetCurMatchId(0);
            this.SetCurMatchCommissionId(0);
            this.CloseRecruitConfirmDialogIfOpen();
            this.SetbMatchRecruitPromptShown(false);
            this.SetRecruitCommissionId(0);
        }
        if (local_40)
        {
            if (this.GetMatchConfirmWidget().IsValid())
            {
                XLog(ELog(70), FString().Append("[M_Mode]GS_OnMatchInfoNotify. Close MatchConfirm."));
                FEUIWidget::RemoveWidget(this.GetMatchConfirmWidget());
            }
            this.SetMatchConfirmData(TEUIModelRef<FM_ModeMatchConfirm>());
        }
        FEUIModelRef local_100_2 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_ModeMatchStatusUpdate local_114;
        local_114.bMatching = this.GetbMatching();
        local_114.MatchId = local_5;
        local_114.MatchMode = this.GetCurMatchMode();
        local_114.CommissionId = this.GetCurMatchCommissionId();
        return;
    }
    void BeginSwitchToCommissionMatch(const uint NewMatchId, const uint NewCommissionId)
    {
        if (!(this.GetbMatching()))
        {
            this.GS_RequestStartCommissionMatch(NewMatchId, NewCommissionId);
            return;
        }
        if (this.GetbSwitchCancelInFlight())
        {
            this.StagePendingCommissionMatch(NewMatchId, NewCommissionId);
            return;
        }
        if (this.GetSwitchConfirmDialog().IsValid())
        {
            return;
        }
        this.StagePendingCommissionMatch(NewMatchId, NewCommissionId);
        this.ShowSwitchConfirmDialog(this.GetSwitchConfirmMessage(NewCommissionId, false));
        return;
    }
    void BeginSwitchToDirectEnter(const TEUIModelRef<FM_Commission> &inout Commission)
    {
        int local_4 = 0;
        if (!(Commission.IsValid()))
        {
            return;
        }
        if (!(this.GetbMatching()))
        {
            ::FMS_CommissionData::Get(this.GetContext().Manager).GS_RequestStartCommission(Commission);
            return;
        }
        int local_3 = GetCommissionConfig().IsSet() ? local_4 : 0;
        if (this.GetbSwitchCancelInFlight())
        {
            this.StagePendingDirectEnter(Commission, local_3);
            return;
        }
        if (this.GetSwitchConfirmDialog().IsValid())
        {
            return;
        }
        this.StagePendingDirectEnter(Commission, local_3);
        this.ShowSwitchConfirmDialog(this.GetSwitchConfirmMessage(local_3, true));
        return;
    }
    void StagePendingCommissionMatch(const uint NewMatchId, const uint NewCommissionId)
    {
        this.SetPendingSwitchAction(EMatchSwitchAction(1));
        this.SetPendingMatchId(NewMatchId);
        this.SetPendingCommissionId(NewCommissionId);
        this.SetPendingDirectEnterCommission(TEUIModelRef<FM_Commission>());
        return;
    }
    void StagePendingDirectEnter(const TEUIModelRef<FM_Commission> &inout Commission, const uint NewCommissionId)
    {
        this.SetPendingSwitchAction(EMatchSwitchAction(2));
        this.SetPendingMatchId(0);
        this.SetPendingCommissionId(NewCommissionId);
        this.SetPendingDirectEnterCommission(Commission);
        return;
    }
    bool IsGloballyMatching() const
    {
        return this.GetbMatching();
    }
    void BeginCancelForTeamAccept(const bool bIsInvite, const uint64 TeamId, const uint SourceUid)
    {
        this.SetPendingSwitchAction(EMatchSwitchAction(3));
        this.SetPendingMatchId(0);
        this.SetPendingCommissionId(0);
        this.SetPendingDirectEnterCommission(TEUIModelRef<FM_Commission>());
        this.SetPendingTeamAcceptIsInvite(bIsInvite);
        this.SetPendingTeamId(TeamId);
        this.SetPendingTeamSourceUid(SourceUid);
        this.SetbSwitchCancelInFlight(true);
        this.SetSwitchCancelWaitTime(FFPTime(0.0));
        this.GS_RequestCancelMatch(this.GetLocalPlayerUid(), 2);
        return;
    }
    void HandleSwitchConfirmAnswer(const bool bConfirm)
    {
        this.SetSwitchConfirmDialog(TEUIModelRef<FVM_CommonDialog>());
        this.SetSwitchConfirmProxy(TEUIModelRef<FVM_MatchSwitchConfirm>());
        if (bConfirm && (int(this.GetPendingSwitchAction()) != 0))
        {
            this.SetbSwitchCancelInFlight(true);
            this.SetSwitchCancelWaitTime(FFPTime(0.0));
            this.GS_RequestCancelMatch(this.GetLocalPlayerUid(), 4);
            return;
        }
        this.ClearPendingSwitch();
        return;
    }
    void ExecutePendingSwitchAction()
    {
        int local_3;
        int local_5;
        bool local_11;
        int local_14;
        int local_17;
        EMatchSwitchAction local_1;
        local_1 = this.GetPendingSwitchAction();
        local_3 = this.GetPendingMatchId();
        local_5 = this.GetPendingCommissionId();
        TEUIModelRef<FM_Commission> local_10 = this.GetPendingDirectEnterCommission();
        local_11 = this.GetPendingTeamAcceptIsInvite();
        local_14 = this.GetPendingTeamId();
        local_17 = this.GetPendingTeamSourceUid();
        this.ClearPendingSwitch();
        TEUIModelRef<FM_Commission> local_8;
        if (int(local_1) == 1)
        {
            this.GS_RequestStartCommissionMatch(local_3, local_5);
        }
        else
        {
            if ((int(local_1)) == 2)
            {
                if (local_8.IsValid())
                {
                    ::FMS_CommissionData::Get(this.GetContext().Manager).GS_RequestStartCommission(local_8);
                }
            }
            else
            {
                if (int(local_1) == 3)
                {
                    if (local_11)
                    {
                        FCE_ClientToServerTeamInviteReply local_32;
                        FFPTime local_30 = FFPTime(-1);
                        FECSEntity local_24 = this.GetContext().GetLocalPlayer();
                        local_32.TeamId = local_14;
                        local_32.SourceUid = local_17;
                        local_32.bAccept = true;
                    }
                    else
                    {
                        FCE_ClientToServerTeamApplyReply local_38;
                        FFPTime local_30_2 = FFPTime(-1);
                        FECSEntity local_24_2 = this.GetContext().GetLocalPlayer();
                        local_38.TeamId = local_14;
                        local_38.SourceUid = local_17;
                        local_38.bAccept = true;
                    }
                }
            }
        }
        return;
    }
    void ClearPendingSwitch()
    {
        this.SetPendingSwitchAction(EMatchSwitchAction(0));
        this.SetPendingMatchId(0);
        this.SetPendingCommissionId(0);
        this.SetPendingDirectEnterCommission(TEUIModelRef<FM_Commission>());
        this.SetPendingTeamAcceptIsInvite(false);
        this.SetPendingTeamId(0);
        this.SetPendingTeamSourceUid(0);
        this.SetbSwitchCancelInFlight(false);
        this.SetSwitchCancelWaitTime(FFPTime(0.0));
        return;
    }
    void CloseSwitchConfirmDialogIfOpen()
    {
        if (this.GetSwitchConfirmDialog().IsValid())
        {
            TEUIModelRef<FVM_CommonDialog> local_2 = this.GetSwitchConfirmDialog();
            ForceClose();
            this.SetSwitchConfirmDialog(local_2);
        }
        this.SetSwitchConfirmProxy(TEUIModelRef<FVM_MatchSwitchConfirm>());
        return;
    }
    void ShowSwitchConfirmDialog(const FText &inout Message)
    {
        ULocalPlayer local_2;
        int local_106 = 0;
        if ((!((local_2 != nullptr))))
        {
            this.ClearPendingSwitch();
            return;
        }
        UCommonPopupSettings local_8 = ::CommonPopupSettings::Get();
        FEUIInputAction local_14;
        FEUIInputAction local_20;
        if (!(local_8.CommonDialogAction.Find(ECommonDialogAnswerType(1), local_14)) || !(local_8.CommonDialogAction.Find(ECommonDialogAnswerType(2), local_20)))
        {
            this.ClearPendingSwitch();
            return;
        }
        TArray<FCommonDialogOption> local_26;
        FText local_42;
        local_26.Add(FCommonDialogOption(ECommonDialogAnswerType(2), local_20, local_42));
        local_26.Add(FCommonDialogOption(ECommonDialogAnswerType(1), local_14, local_42));
        FVM_MatchSwitchConfirm& local_46 = ::FVM_MatchSwitchConfirm::Create(this.GetContext().Manager);
        FDialogModelCallback local_72;
        local_72.Bind(local_46, FVM_MatchSwitchConfirm::OnAnswer);
        FDialogCallback local_104 = FDialogCallback(local_72);
        local_42 = NSLOCTEXT("Mode", "SwitchMatchTitle", "жЏђз¤є");
        FEUIWidget::AddWidgetByClass(this.GetContext().UELocalPlayer, local_8.CommonDialogWidget, FEUIModelRef(local_106));
        this.SetSwitchConfirmDialog(TEUIModelRef<FVM_CommonDialog>(local_106));
        this.SetSwitchConfirmProxy(TEUIModelRef<FVM_MatchSwitchConfirm>(local_46));
        return;
    }
    FText GetSwitchConfirmMessage(const uint NewCommissionId, const bool bDirectEnter) const
    {
        int local_5 = this.GetCurMatchCommissionId();
        FText local_12;
        this.ResolveMatchName(local_12, this.GetCurMatchMode(), this.GetCurMatchId());
        FText local_4 = this.ResolveCommissionName(NewCommissionId);
        if (bDirectEnter)
        {
            return FText::Format(NSLOCTEXT("Mode", "SwitchToDirectEnter", "е°†з»€ж­ўеЊ№й…ЌгЂЊ{0}гЂЌе№¶<Yellow20>з›ґжЋҐиї›е…ҐгЂЊ{1}гЂЌ</>пјЊжЇеђ¦з»§з»­пјџ"), local_12, local_4);
        }
        return FText::Format(NSLOCTEXT("Mode", "SwitchToMatch", "е°†з»€ж­ўеЊ№й…ЌгЂЊ{0}гЂЌе№¶<Yellow20>ејЂе§‹еЊ№й…ЌгЂЊ{1}гЂЌ</>пјЊжЇеђ¦з»§з»­пјџ"), local_12, local_4);
    }
    void GS_OnMatchRecruitNotify(const FPbMatchRecruitNotify &inout Notify)
    {
        XLog(ELog(70), FString().Append("[M_Mode]GS_OnMatchRecruitNotify. commission_id:[").Append(Notify.GetCommissionId()).Append("]"));
        if (!(this.GetbMatching()) || this.GetbMatchRecruitPromptShown() || this.GetRecruitConfirmDialog().IsValid())
        {
            return;
        }
        this.SetRecruitCommissionId(Notify.GetCommissionId());
        this.ShowRecruitConfirmDialog();
        this.SetbMatchRecruitPromptShown(true);
        return;
    }
    void HandleRecruitConfirmAnswer(const bool bConfirm)
    {
        this.SetRecruitConfirmDialog(TEUIModelRef<FVM_CommonDialog>());
        this.SetRecruitConfirmProxy(TEUIModelRef<FVM_MatchRecruitConfirm>());
        bool local_6 = bConfirm && this.GetbMatching();
        if (!(local_6))
        {
            local_6 = false;
        }
        else
        {
            int local_7 = this.GetRecruitCommissionId();
            local_6 = (local_7 != 0);
        }
        if (local_6)
        {
            int local_8 = this.GetRecruitCommissionId();
            GetDataObjectByGSDataId<FCommissionConfig> local_56;
            TDataObjectPtr<FCommissionConfig> local_32 = local_56.opImplConv();
            if (local_32.IsSet())
            {
                ::FMS_CommissionData::Get(this.GetContext().Manager).RequestSendCommissionRecruit(local_32);
            }
        }
        return;
    }
    void CloseRecruitConfirmDialogIfOpen()
    {
        if (this.GetRecruitConfirmDialog().IsValid())
        {
            TEUIModelRef<FVM_CommonDialog> local_2 = this.GetRecruitConfirmDialog();
            ForceClose();
            this.SetRecruitConfirmDialog(local_2);
        }
        this.SetRecruitConfirmProxy(TEUIModelRef<FVM_MatchRecruitConfirm>());
        return;
    }
    void ShowRecruitConfirmDialog()
    {
        ULocalPlayer local_2;
        int local_110 = 0;
        if ((!((local_2 != nullptr))))
        {
            return;
        }
        UCommonPopupSettings local_8 = ::CommonPopupSettings::Get();
        FEUIInputAction local_14;
        FEUIInputAction local_20;
        if (!(local_8.CommonDialogAction.Find(ECommonDialogAnswerType(1), local_14)) || !(local_8.CommonDialogAction.Find(ECommonDialogAnswerType(2), local_20)))
        {
            return;
        }
        TArray<FCommonDialogOption> local_26;
        FText local_42;
        local_26.Add(FCommonDialogOption(ECommonDialogAnswerType(2), local_20, local_42));
        local_26.Add(FCommonDialogOption(ECommonDialogAnswerType(1), local_14, local_42));
        FVM_MatchRecruitConfirm& local_46 = ::FVM_MatchRecruitConfirm::Create(this.GetContext().Manager);
        FDialogModelCallback local_72;
        local_72.Bind(local_46, FVM_MatchRecruitConfirm::OnAnswer);
        local_42 = NSLOCTEXT("Mode", "MatchRecruitConfirm", "еЅ“е‰ЌеЊ№й…Ќдєєж•°иѕѓе°‘пјЊйў„жњџз­‰еѕ…ж—¶й—ґиѕѓй•їпјЊжЇеђ¦е°†з»„йџй“ѕжЋҐеЏ‘йЂЃи‡іж‹›е‹џйў‘йЃ“?");
        FDialogCallback local_108 = FDialogCallback(local_72);
        NSLOCTEXT("Mode", "MatchRecruitTitle", "жЏђз¤є");
        FEUIWidget::AddWidgetByClass(this.GetContext().UELocalPlayer, local_8.CommonDialogWidget, FEUIModelRef(local_110));
        this.SetRecruitConfirmDialog(TEUIModelRef<FVM_CommonDialog>(local_110));
        this.SetRecruitConfirmProxy(TEUIModelRef<FVM_MatchRecruitConfirm>(local_46));
        return;
    }
    void ShowMatchTimeoutHint(const uint MatchMode, const uint MatchId, const uint CommissionId)
    {
        FText local_8;
        this.ResolveMatchName(local_8, MatchMode, MatchId);
        FCommonTipsParam local_16;
        ::CommonPopup::Tips(FText::Format(NSLOCTEXT("Mode", "MatchTimeout", "гЂЊ{0}гЂЌжњЄж‰ѕе€°еЊ№й…ЌпјЊиЇ·зЁЌеђЋе†ЌиЇ•"), local_8), local_16);
        return;
    }
    void ShowMatchCancelledByPlayerHint(const uint CancelUid, const uint MatchMode, const uint MatchId, const uint CommissionId)
    {
        if (CancelUid == 0 || (CancelUid == this.GetLocalPlayerUid()))
        {
            return;
        }
        FText local_12;
        this.ResolvePlayerName(local_12);
        FCommonTipsParam local_8;
        this.ResolveMatchName(local_8, MatchMode, MatchId);
        FCommonTipsParam local_24;
        ::CommonPopup::Tips(FText::Format(NSLOCTEXT("Mode", "MatchCancelledByPlayer", "{0} з»€ж­ўдє†гЂЊ{1}гЂЌзљ„еЊ№й…Ќ"), local_12, local_8), local_24);
        return;
    }
    void ShowMatchStartedHint(const uint StartUid, const uint MatchMode, const uint MatchId, const uint CommissionId)
    {
        if (StartUid == 0 || (StartUid == this.GetLocalPlayerUid()))
        {
            return;
        }
        FText local_12;
        this.ResolvePlayerName(local_12);
        FCommonTipsParam local_8;
        this.ResolveMatchName(local_8, MatchMode, MatchId);
        FCommonTipsParam local_24;
        ::CommonPopup::Tips(FText::Format(NSLOCTEXT("Mode", "MatchStartedByPlayer", "{0} ејЂеђЇдє†гЂЊ{1}гЂЌзљ„еЊ№й…Ќ"), local_12, local_8), local_24);
        return;
    }
    uint GetLocalPlayerUid() const
    {
        int local_7;
        if (::FMS_PlayerData::Get(this.GetContext().Manager).GetLocalPlayerData().IsValid())
        {
            local_7 = GetPlayerUid();
        }
        else
        {
            local_7 = 0;
        }
        return local_7;
    }
    FText ResolvePlayerName(const uint Uid) const
    {
        FString local_8 = ::FriendUtil::GetFriendName(Uid);
        if (local_8.IsEmpty())
        {
            local_8 = FString().Append(Uid);
        }
        return FText::FromString(local_8);
    }
    FText ResolveCommissionName(const uint CommissionConfigId) const
    {
        if (CommissionConfigId != 0)
        {
            if (::FMS_CommissionData::Get(this.GetContext().Manager).FindCommissionByConfigDataId(CommissionConfigId).IsValid() && GetCommissionConfig().IsSet())
            {
            }
            else
            {
                GetDataObjectByGSDataId<FCommissionConfig> local_56;
                if (local_56.opImplConv().IsSet())
                {
                }
                else
                {
                }
            }
        }
        return FText();
    }
    FText ResolveMatchName(const uint MatchMode, const uint MatchId, const uint CommissionId) const
    {
        if (MatchMode == 2)
        {
            return this.ResolveCommissionName(CommissionId);
        }
        if (MatchId != 0)
        {
            FM_ModeItem& local_8 = ::FM_ModeItem::Create(this.GetContext().Manager, MatchId);
            if (local_8.GetMatchConfig().IsSet())
            {
            }
            else
            {
            }
        }
        return FText();
    }
    bool GetbMatching() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bMatching;
    }
    void SetbMatching(const bool __Value) property
    {
        if (!(this.m_bMatching) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bMatching = __Value;
        return;
    }
    uint GetMatchStartTime() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MatchStartTime;
    }
    void SetMatchStartTime(const uint __Value) property
    {
        if (this.m_MatchStartTime == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MatchStartTime = __Value;
        return;
    }
    const FFPTime GetMatchWaitTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FFPTime GetModify_MatchWaitTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetMatchWaitTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MatchWaitTime = __Value;
        return;
    }
    uint GetCurSelectCampus() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CurSelectCampus;
    }
    void SetCurSelectCampus(const uint __Value) property
    {
        if (this.m_CurSelectCampus == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurSelectCampus = __Value;
        return;
    }
    uint GetCurMatchMode() const property
    {
        this.TrackPropertyRead(4);
        return this.m_CurMatchMode;
    }
    void SetCurMatchMode(const uint __Value) property
    {
        if (this.m_CurMatchMode == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CurMatchMode = __Value;
        return;
    }
    uint GetCurMatchId() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CurMatchId;
    }
    void SetCurMatchId(const uint __Value) property
    {
        if (this.m_CurMatchId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CurMatchId = __Value;
        return;
    }
    uint GetCurMatchCommissionId() const property
    {
        this.TrackPropertyRead(6);
        return this.m_CurMatchCommissionId;
    }
    void SetCurMatchCommissionId(const uint __Value) property
    {
        if (this.m_CurMatchCommissionId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_CurMatchCommissionId = __Value;
        return;
    }
    const FEUIWidgetRef GetMatchConfirmWidget() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FEUIWidgetRef GetModify_MatchConfirmWidget() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetMatchConfirmWidget(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_MatchConfirmWidget = __Value;
        return;
    }
    TEUIModelRef<FM_ModeMatchConfirm> GetMatchConfirmData() const property
    {
        this.TrackPropertyRead(8);
        return this.m_MatchConfirmData;
    }
    void SetMatchConfirmData(const TEUIModelRef<FM_ModeMatchConfirm> &inout __Value) property
    {
        TEUIModelRef<FM_ModeMatchConfirm> local_2;
        local_2 = this.m_MatchConfirmData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_MatchConfirmData = __Value;
        return;
    }
    EMatchSwitchAction GetPendingSwitchAction() const property
    {
        this.TrackPropertyRead(9);
        return this.m_PendingSwitchAction;
    }
    void SetPendingSwitchAction(const EMatchSwitchAction __Value) property
    {
        if (int(this.m_PendingSwitchAction) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_PendingSwitchAction = __Value;
        return;
    }
    uint GetPendingMatchId() const property
    {
        this.TrackPropertyRead(10);
        return this.m_PendingMatchId;
    }
    void SetPendingMatchId(const uint __Value) property
    {
        if (this.m_PendingMatchId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_PendingMatchId = __Value;
        return;
    }
    uint GetPendingCommissionId() const property
    {
        this.TrackPropertyRead(11);
        return this.m_PendingCommissionId;
    }
    void SetPendingCommissionId(const uint __Value) property
    {
        if (this.m_PendingCommissionId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_PendingCommissionId = __Value;
        return;
    }
    TEUIModelRef<FM_Commission> GetPendingDirectEnterCommission() const property
    {
        this.TrackPropertyRead(12);
        return this.m_PendingDirectEnterCommission;
    }
    void SetPendingDirectEnterCommission(const TEUIModelRef<FM_Commission> &inout __Value) property
    {
        TEUIModelRef<FM_Commission> local_2;
        local_2 = this.m_PendingDirectEnterCommission;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_PendingDirectEnterCommission = __Value;
        return;
    }
    bool GetPendingTeamAcceptIsInvite() const property
    {
        this.TrackPropertyRead(13);
        return this.m_PendingTeamAcceptIsInvite;
    }
    void SetPendingTeamAcceptIsInvite(const bool __Value) property
    {
        if (!(this.m_PendingTeamAcceptIsInvite) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_PendingTeamAcceptIsInvite = __Value;
        return;
    }
    uint64 GetPendingTeamId() const property
    {
        this.TrackPropertyRead(14);
        return this.m_PendingTeamId;
    }
    void SetPendingTeamId(const uint64 __Value) property
    {
        if (this.m_PendingTeamId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_PendingTeamId = __Value;
        return;
    }
    uint GetPendingTeamSourceUid() const property
    {
        this.TrackPropertyRead(15);
        return this.m_PendingTeamSourceUid;
    }
    void SetPendingTeamSourceUid(const uint __Value) property
    {
        if (this.m_PendingTeamSourceUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_PendingTeamSourceUid = __Value;
        return;
    }
    bool GetbSwitchCancelInFlight() const property
    {
        this.TrackPropertyRead(16);
        return this.m_bSwitchCancelInFlight;
    }
    void SetbSwitchCancelInFlight(const bool __Value) property
    {
        if (!(this.m_bSwitchCancelInFlight) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_bSwitchCancelInFlight = __Value;
        return;
    }
    const FFPTime GetSwitchCancelWaitTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    FFPTime GetModify_SwitchCancelWaitTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetSwitchCancelWaitTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_SwitchCancelWaitTime = __Value;
        return;
    }
    uint GetLastSwitchCancelUid() const property
    {
        this.TrackPropertyRead(18);
        return this.m_LastSwitchCancelUid;
    }
    void SetLastSwitchCancelUid(const uint __Value) property
    {
        if (this.m_LastSwitchCancelUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_LastSwitchCancelUid = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonDialog> GetSwitchConfirmDialog() const property
    {
        this.TrackPropertyRead(19);
        return this.m_SwitchConfirmDialog;
    }
    void SetSwitchConfirmDialog(const TEUIModelRef<FVM_CommonDialog> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonDialog> local_2;
        local_2 = this.m_SwitchConfirmDialog;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_SwitchConfirmDialog = __Value;
        return;
    }
    TEUIModelRef<FVM_MatchSwitchConfirm> GetSwitchConfirmProxy() const property
    {
        this.TrackPropertyRead(20);
        return this.m_SwitchConfirmProxy;
    }
    void SetSwitchConfirmProxy(const TEUIModelRef<FVM_MatchSwitchConfirm> &inout __Value) property
    {
        TEUIModelRef<FVM_MatchSwitchConfirm> local_2;
        local_2 = this.m_SwitchConfirmProxy;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_SwitchConfirmProxy = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonDialog> GetRecruitConfirmDialog() const property
    {
        this.TrackPropertyRead(21);
        return this.m_RecruitConfirmDialog;
    }
    void SetRecruitConfirmDialog(const TEUIModelRef<FVM_CommonDialog> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonDialog> local_2;
        local_2 = this.m_RecruitConfirmDialog;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_RecruitConfirmDialog = __Value;
        return;
    }
    TEUIModelRef<FVM_MatchRecruitConfirm> GetRecruitConfirmProxy() const property
    {
        this.TrackPropertyRead(22);
        return this.m_RecruitConfirmProxy;
    }
    void SetRecruitConfirmProxy(const TEUIModelRef<FVM_MatchRecruitConfirm> &inout __Value) property
    {
        TEUIModelRef<FVM_MatchRecruitConfirm> local_2;
        local_2 = this.m_RecruitConfirmProxy;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_RecruitConfirmProxy = __Value;
        return;
    }
    uint GetRecruitCommissionId() const property
    {
        this.TrackPropertyRead(23);
        return this.m_RecruitCommissionId;
    }
    void SetRecruitCommissionId(const uint __Value) property
    {
        if (this.m_RecruitCommissionId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(23);
        this.m_RecruitCommissionId = __Value;
        return;
    }
    bool GetbMatchRecruitPromptShown() const property
    {
        this.TrackPropertyRead(24);
        return this.m_bMatchRecruitPromptShown;
    }
    void SetbMatchRecruitPromptShown(const bool __Value) property
    {
        if (!(this.m_bMatchRecruitPromptShown) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(24);
        this.m_bMatchRecruitPromptShown = __Value;
        return;
    }
}

struct FMsg_ModeMatchStatusUpdate : FEUIMessage
{
    UPROPERTY()
    bool bMatching;
    UPROPERTY()
    uint MatchId;
    UPROPERTY()
    uint MatchMode;
    UPROPERTY()
    uint CommissionId;


}

struct __GeneratedProperties_FVM_MatchSwitchConfirm
{
    UPROPERTY()
    TEUIModelRef<FVM_MatchSwitchConfirm> Self;

    __GeneratedProperties_FVM_MatchSwitchConfirm()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_MatchRecruitConfirm
{
    UPROPERTY()
    TEUIModelRef<FVM_MatchRecruitConfirm> Self;

    __GeneratedProperties_FVM_MatchRecruitConfirm()
    {
        return;
    }
}

namespace FM_ModeItem
{
FM_ModeItem& Create(const UObject ContextObject, const uint DataId)
{
    return FM_ModeItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), DataId);
}
FM_ModeItem CreateByManager(const UEUIManagerSubsystem Manager, const uint DataId)
{
    FM_ModeItem __r;
    TEUIModelRef<FM_ModeItem> local_6 = TEUIModelRef<FM_ModeItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_ModeItem::ModelId, 0, DataId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_ModeItem;
}
int __IndexOf_DataId()
{
    return 0;
}
int __IndexOf_MatchConfig()
{
    return 1;
}
}
namespace FVM_MatchSwitchConfirm
{
FVM_MatchSwitchConfirm& Create(const UObject ContextObject)
{
    return FVM_MatchSwitchConfirm::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MatchSwitchConfirm CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MatchSwitchConfirm __r;
    TEUIModelRef<FVM_MatchSwitchConfirm> local_6 = TEUIModelRef<FVM_MatchSwitchConfirm>(EUIInternal::MakeModelWithManager(Manager, FVM_MatchSwitchConfirm::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MatchSwitchConfirm>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MatchSwitchConfirm;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MatchSwitchConfirm;
}
TEUIModelRef<FVM_MatchSwitchConfirm> __UIGetter_Self(const FVM_MatchSwitchConfirm &inout Model)
{
    return TEUIModelRef<FVM_MatchSwitchConfirm>(Model);
}
}
namespace __GeneratedProperties_FVM_MatchSwitchConfirm
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_MatchRecruitConfirm
{
FVM_MatchRecruitConfirm& Create(const UObject ContextObject)
{
    return FVM_MatchRecruitConfirm::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MatchRecruitConfirm CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MatchRecruitConfirm __r;
    TEUIModelRef<FVM_MatchRecruitConfirm> local_6 = TEUIModelRef<FVM_MatchRecruitConfirm>(EUIInternal::MakeModelWithManager(Manager, FVM_MatchRecruitConfirm::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MatchRecruitConfirm>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MatchRecruitConfirm;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MatchRecruitConfirm;
}
TEUIModelRef<FVM_MatchRecruitConfirm> __UIGetter_Self(const FVM_MatchRecruitConfirm &inout Model)
{
    return TEUIModelRef<FVM_MatchRecruitConfirm>(Model);
}
}
namespace __GeneratedProperties_FVM_MatchRecruitConfirm
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FMS_Mode
{
FMS_Mode& Get(const UObject ContextObject)
{
    return FMS_Mode::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_Mode GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_Mode __r;
    TEUIModelRef<FMS_Mode> local_6 = TEUIModelRef<FMS_Mode>(EUIInternal::MakeModelWithManager(Manager, FMS_Mode::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__OnECSWorldBegin";
    local_14.MessageTypeName = "Msg_ECSWorldBegin";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelProtoRspDefine local_24;
    local_24.FunctionName = "__GS_OnStartMatchRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnCancelMatchRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnMatchKeepaliveRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnMatchConfirmRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnMatchInfoNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnMatchRecruitNotify";
    Result.ProtoRspDefines.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_Mode;
}
void __OnECSWorldBegin(FMS_Mode &inout Model, const FMsg_ECSWorldBegin &inout Message)
{
    Model.OnECSWorldBegin(Message);
    return;
}
void __Tick(FMS_Mode &inout Model)
{
    Model.Tick();
    return;
}
void __GS_OnStartMatchRsp(FMS_Mode &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnStartMatchRsp(FPbStartMatchRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnCancelMatchRsp(FMS_Mode &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnCancelMatchRsp(FPbCancelMatchRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnMatchKeepaliveRsp(FMS_Mode &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnMatchKeepaliveRsp(FPbMatchKeepaliveRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnMatchConfirmRsp(FMS_Mode &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnMatchConfirmRsp(FPbMatchConfirmRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnMatchInfoNotify(FMS_Mode &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnMatchInfoNotify(FPbMatchStatusNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnMatchRecruitNotify(FMS_Mode &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnMatchRecruitNotify(FPbMatchRecruitNotify::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_bMatching()
{
    return 0;
}
int __IndexOf_MatchStartTime()
{
    return 1;
}
int __IndexOf_MatchWaitTime()
{
    return 2;
}
int __IndexOf_CurSelectCampus()
{
    return 3;
}
int __IndexOf_CurMatchMode()
{
    return 4;
}
int __IndexOf_CurMatchId()
{
    return 5;
}
int __IndexOf_CurMatchCommissionId()
{
    return 6;
}
int __IndexOf_MatchConfirmWidget()
{
    return 7;
}
int __IndexOf_MatchConfirmData()
{
    return 8;
}
int __IndexOf_PendingSwitchAction()
{
    return 9;
}
int __IndexOf_PendingMatchId()
{
    return 10;
}
int __IndexOf_PendingCommissionId()
{
    return 11;
}
int __IndexOf_PendingDirectEnterCommission()
{
    return 12;
}
int __IndexOf_PendingTeamAcceptIsInvite()
{
    return 13;
}
int __IndexOf_PendingTeamId()
{
    return 14;
}
int __IndexOf_PendingTeamSourceUid()
{
    return 15;
}
int __IndexOf_bSwitchCancelInFlight()
{
    return 16;
}
int __IndexOf_SwitchCancelWaitTime()
{
    return 17;
}
int __IndexOf_LastSwitchCancelUid()
{
    return 18;
}
int __IndexOf_SwitchConfirmDialog()
{
    return 19;
}
int __IndexOf_SwitchConfirmProxy()
{
    return 20;
}
int __IndexOf_RecruitConfirmDialog()
{
    return 21;
}
int __IndexOf_RecruitConfirmProxy()
{
    return 22;
}
int __IndexOf_RecruitCommissionId()
{
    return 23;
}
int __IndexOf_bMatchRecruitPromptShown()
{
    return 24;
}
}
