
namespace FM_CommissionPopup
{
    const int ModelId = 0;

}
struct FM_CommissionPopup : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    int m_Nop;
    UPROPERTY()
    bool m_bCommissionFinishShowSettlement;
    UPROPERTY()
    bool m_bCommissionFinishMedalCalShowTimeEnd;
    UPROPERTY()
    bool m_bCommissionFinishWaitTeamPageShow;
    UPROPERTY()
    bool m_bCommissionFinishWaitTeamPageShowEnd;
    UPROPERTY()
    bool m_bSkipRewardPopups;
    UPROPERTY()
    bool m_bCachedRaceCommission;
    UPROPERTY()
    int m_CommissionFullScreenRewardPopupId;
    UPROPERTY()
    bool m_bWaitingForFullScreenRelease;
    UPROPERTY()
    bool m_bFullScreenFlowStarted;
    UPROPERTY()
    bool m_bFullScreenRewardPopOpened;
    UPROPERTY()
    FFPTime m_CommissionFinishShowSettlementTime;
    UPROPERTY()
    FFPTime m_CommissionFinishMedalCalShowTime;
    UPROPERTY()
    FFPTime m_CommissionFinishTeamPageShowTime;
    UPROPERTY()
    FFPTime m_CommissionFinishTeamPageShowEndTime;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionFinish> m_CommissionFinishReward;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionFinish> m_CommissionFinishTeam;
    UPROPERTY()
    FEUIWidgetRef m_CommissionFinishRewardWidget;
    UPROPERTY()
    FEUIWidgetRef m_CommissionFinishTeamWidget;

    FM_CommissionPopup()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FM_CommissionPopup(const FM_CommissionPopup &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FM_CommissionPopup& opAssign(const FM_CommissionPopup &inout Other)
    {
        this.m_Nop = int(Other.m_Nop);
        this.m_bCommissionFinishShowSettlement = Other.m_bCommissionFinishShowSettlement;
        this.m_bCommissionFinishMedalCalShowTimeEnd = Other.m_bCommissionFinishMedalCalShowTimeEnd;
        this.m_bCommissionFinishWaitTeamPageShow = Other.m_bCommissionFinishWaitTeamPageShow;
        this.m_bCommissionFinishWaitTeamPageShowEnd = Other.m_bCommissionFinishWaitTeamPageShowEnd;
        this.m_bSkipRewardPopups = Other.m_bSkipRewardPopups;
        this.m_bCachedRaceCommission = Other.m_bCachedRaceCommission;
        this.m_CommissionFullScreenRewardPopupId = int(Other.m_CommissionFullScreenRewardPopupId);
        this.m_bWaitingForFullScreenRelease = Other.m_bWaitingForFullScreenRelease;
        this.m_bFullScreenFlowStarted = Other.m_bFullScreenFlowStarted;
        this.m_bFullScreenRewardPopOpened = Other.m_bFullScreenRewardPopOpened;
        this.m_CommissionFinishShowSettlementTime = Other.m_CommissionFinishShowSettlementTime;
        this.m_CommissionFinishMedalCalShowTime = Other.m_CommissionFinishMedalCalShowTime;
        this.m_CommissionFinishTeamPageShowTime = Other.m_CommissionFinishTeamPageShowTime;
        this.m_CommissionFinishTeamPageShowEndTime = Other.m_CommissionFinishTeamPageShowEndTime;
        this.m_CommissionFinishReward = Other.m_CommissionFinishReward;
        this.m_CommissionFinishTeam = Other.m_CommissionFinishTeam;
        this.m_CommissionFinishRewardWidget = Other.m_CommissionFinishRewardWidget;
        return Other.m_CommissionFinishTeamWidget;
    }
    void PostConstruct()
    {
        if (::PlayerNotify::IsNotifyPending(EPlayerNotify(0)))
        {
            this.OnCommissionStart();
        }
        if (::PlayerNotify::IsNotifyPending(EPlayerNotify(1)))
        {
            this.OnCommissionEnd();
        }
        return;
    }
    void OnNotify(const FCE_OnReceivePlayerNotify &inout Event)
    {
        if (int(Event.NotifyType) == 0)
        {
            this.OnCommissionStart();
            return;
        }
        if (int(Event.NotifyType) == 1)
        {
            this.OnCommissionEnd();
        }
        return;
    }
    void OnCommissionStart()
    {
        int local_8 = 0;
        int local_114 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (!(local_8))
        {
            return;
        }
        TDataObjectPtr<FCommissionConfig> local_34 = local_8.CommissionConfig;
        if (local_34)
        {
            if (::CommissionUtils::GetCommissionTypeConfig(local_34.opArrow().CommissionType))
            {
                FECSWorldPtr local_2_2 = ECS::GetECSWorld();
                UCommissionSettings local_116 = ::CommissionUtils::GetCommissionSettings();
                TArray<FTextArgument> local_122;
                Make local_128;
                local_122.Add(local_128.opImplConv());
                Make local_142;
                local_122.Add(local_142.opImplConv());
                ::MessageHintUtils::ShowMessageHint(local_114.PlayerEntity, local_116.CommissionStartPopup, local_122);
            }
        }
        ::PlayerNotify::ResponseToNotify(EPlayerNotify(0));
        this.SetbSkipRewardPopups(false);
        this.SetbFullScreenRewardPopOpened(false);
        return;
    }
    void OnCommissionEnd()
    {
        int local_10 = 0;
        FCS_CommissionInfo local_18;
        int local_24 = 0;
        Make local_136;
        Make local_150;
        this.SetbCommissionFinishShowSettlement(false);
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        if (!(local_10))
        {
            return;
        }
        ::PlayerNotify::ResponseToNotify(EPlayerNotify(1));
        FECSWorldPtr local_4_2 = ECS::GetECSWorld();
        if (!(local_18))
        {
            return;
        }
        if (local_18.bSkipRewardUI)
        {
            return;
        }
        FECSWorldPtr local_4_3 = ECS::GetECSWorld();
        UCommissionSettings local_26 = ::CommissionUtils::GetCommissionSettings();
        TDataObjectPtr<FCommissionConfig> local_52 = local_18.CommissionConfig;
        if (local_52)
        {
            if (::CommissionUtils::GetCommissionTypeConfig(ECommissionType(local_52.opArrow().CommissionType)))
            {
                if (local_10.GetbSuccess())
                {
                    TArray<FTextArgument> local_130;
                    local_130.Add(local_136.opImplConv());
                    local_130.Add(local_150.opImplConv());
                    ::MessageHintUtils::ShowMessageHint(local_24.PlayerEntity, local_26.CommissionSuccessPopup, local_130);
                }
                else
                {
                    TArray<FTextArgument> local_130;
                    local_130.Add(local_136.opImplConv());
                    local_130.Add(local_150.opImplConv());
                    ::MessageHintUtils::ShowMessageHint(local_24.PlayerEntity, local_26.CommissionFailPopup, local_130);
                }
            }
        }
        else
        {
            XError(ELog(22), "[Commission] CommissionInfo is not set");
            return;
        }
        this.SetbSkipRewardPopups(((int(local_18.CommissionConfig.opArrow().CommissionType) == 5) && !(local_10.GetbSuccess())) || (int(local_18.CommissionConfig.opArrow().CommissionType) == 3));
        if (this.GetbSkipRewardPopups())
        {
            XLog(ELog(22), FString().Append("[Commission] Skip reward popups for ").Append(local_18.CommissionConfig.ToString()));
            return;
        }
        this.SetbCommissionFinishShowSettlement(true);
        this.SetCommissionFinishShowSettlementTime(FFPTime(local_26.DelaySettlementTime));
        return;
    }
    FGameplayTag GetFullScreenRewardPopupType() const
    {
        return FGameplayTag::RequestGameplayTag(n"UI.Type.Commonpupop.CommissionFullScreenReward", true);
    }
    void EnqueueFullScreenReward()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void StartFullScreenRewardFlow()
    {
        this.SetbWaitingForFullScreenRelease(false);
        this.SetbFullScreenFlowStarted(true);
        this.SetbFullScreenRewardPopOpened(true);
        this.OnStartCommissionSettlement();
        return;
    }
    void OnCommonPopupManagerChanged(const FCE_NotifyCommonPopupManagerChanged &inout Event)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void AbortFullScreenRewardFlow()
    {
        XLog(ELog(22), FString().Append("[CommonPopup] Commission full-screen reward interrupted, PopupId=").Append(this.GetCommissionFullScreenRewardPopupId()));
        this.SetCommissionFullScreenRewardPopupId(INDEX_NONE);
        this.SetbWaitingForFullScreenRelease(false);
        this.SetbFullScreenFlowStarted(false);
        this.SetbCommissionFinishShowSettlement(false);
        this.SetbCommissionFinishMedalCalShowTimeEnd(false);
        this.SetbCommissionFinishWaitTeamPageShow(false);
        this.SetbCommissionFinishWaitTeamPageShowEnd(false);
        if (this.GetCommissionFinishReward())
        {
            TEUIModelRef<FVM_CommissionFinish> local_10 = this.GetCommissionFinishReward();
            true.SetbPendingClose();
        }
        if (this.GetCommissionFinishTeam())
        {
            bool local_7_2 = true;
            TEUIModelRef<FVM_CommissionFinish> local_10_2 = this.GetCommissionFinishTeam();
            local_7_2.SetbPendingClose();
        }
        return;
    }
    void EndFullScreenRewardFlow(const FString &inout Reason)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnStartCommissionSettlement()
    {
        float32 local_15 = 0.0f;
        this.SetbCommissionFinishShowSettlement(false);
        UCommissionSettings local_4 = ::CommissionUtils::GetCommissionSettings();
        this.SetCommissionFinishReward(TEUIModelRef<FVM_CommissionFinish>(::FVM_CommissionFinish::Create(this.GetContext().Manager)));
        this.SetCommissionFinishRewardWidget(FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_CommissionFinished, this.GetCommissionFinishReward().opImplConv()));
        if (!(this.GetCommissionFinishRewardWidget()))
        {
            this.EndFullScreenRewardFlow("WidgetCreationFailed");
            return;
        }
        this.SetbCommissionFinishMedalCalShowTimeEnd(true);
        this.SetbCommissionFinishWaitTeamPageShow(true);
        this.SetbCommissionFinishWaitTeamPageShowEnd(true);
        this.SetbCachedRaceCommission(this.GetCommissionFinishReward().opArrow().GetbIsRaceCommission());
        if (this.GetCommissionFinishReward().opArrow().GetbIsRaceCommission())
        {
        }
        else
        {
        }
        FFPTime local_14 = FFPTime(local_15);
        this.SetCommissionFinishMedalCalShowTime(local_14);
        FFPTime local_14_2 = FFPTime(this.GetCommissionFinishMedalCalShowTime());
        FFPTime local_22 = (local_14_2 + FFPTime(local_4.CommissionFinishRweardLifetime));
        FFPTime local_14_3 = local_22;
        this.SetCommissionFinishTeamPageShowTime(local_14_3);
        FFPTime local_20 = FFPTime(this.GetCommissionFinishMedalCalShowTime());
        FFPTime local_14_4 = FFPTime(local_4.CommissionFinishRweardLifetime);
        FFPTime local_22_2 = (local_20 + local_14_4);
        FFPTime local_14_5 = (local_22_2 + FFPTime(local_4.CommissionFiniSocialPageLifetime));
        FFPTime local_22_3 = local_14_5;
        this.SetCommissionFinishTeamPageShowEndTime(local_22_3);
        return;
    }
    void OnCommissionRewardPageCalHide()
    {
        this.SetbCommissionFinishMedalCalShowTimeEnd(false);
        if (this.GetCommissionFinishReward())
        {
            TEUIModelRef<FVM_CommissionFinish> local_4 = this.GetCommissionFinishReward();
            true.SetStateChange();
        }
        return;
    }
    void OnCommissionEndRewardPageHide()
    {
        this.SetbCommissionFinishWaitTeamPageShow(false);
        if (this.GetCommissionFinishReward())
        {
            TEUIModelRef<FVM_CommissionFinish> local_4 = this.GetCommissionFinishReward();
            true.SetbPendingClose();
        }
        return;
    }
    void OnCommissionEndTeamPageShow()
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (!(0))
        {
            return;
        }
        ::CommissionUtils::GetCommissionSettings();
        this.SetCommissionFinishTeam(TEUIModelRef<FVM_CommissionFinish>(::FVM_CommissionFinish::Create(this.GetContext().Manager)));
        this.GetCommissionFinishTeam();
        FEUIWidgetRef local_20;
        this.SetCommissionFinishTeamWidget(local_20);
        return;
    }
    void OnCommissionEndTeamPageShowCloseButton()
    {
        this.SetbCommissionFinishWaitTeamPageShowEnd(false);
        if (this.GetCommissionFinishTeam())
        {
            TEUIModelRef<FVM_CommissionFinish> local_4 = this.GetCommissionFinishTeam();
            true.SetbCanClose();
            bool local_1 = true;
            TEUIModelRef<FVM_CommissionFinish> local_4_2 = this.GetCommissionFinishTeam();
            local_1.SetbPendingClose();
        }
        return;
    }
    void Tick()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void SkipCurrentWaitPhase()
    {
        if (this.GetbCachedRaceCommission())
        {
            return;
        }
        UCommissionSettings local_4 = ::CommissionUtils::GetCommissionSettings();
        if (this.GetbCommissionFinishMedalCalShowTimeEnd())
        {
            this.SetCommissionFinishTeamPageShowTime(FFPTime(local_4.CommissionFinishRweardLifetime));
            this.SetCommissionFinishTeamPageShowEndTime(FFPTime((local_4.CommissionFinishRweardLifetime + local_4.CommissionFiniSocialPageLifetime)));
            this.OnCommissionRewardPageCalHide();
            return;
        }
        if (this.GetbCommissionFinishWaitTeamPageShow())
        {
            this.SetCommissionFinishTeamPageShowEndTime(FFPTime(local_4.CommissionFiniSocialPageLifetime));
            this.OnCommissionEndRewardPageHide();
            this.OnCommissionEndTeamPageShow();
            return;
        }
        if (this.GetbCommissionFinishWaitTeamPageShowEnd())
        {
            this.OnCommissionEndTeamPageShowCloseButton();
            if (this.GetCommissionFinishTeam())
            {
                TEUIModelRef<FVM_CommissionFinish> local_16 = this.GetCommissionFinishTeam();
                true.SetbPendingClose();
            }
        }
        return;
    }
    void UpdateSkipButtonState()
    {
        bool local_2 = !(this.GetbCachedRaceCommission()) && this.GetbCommissionFinishMedalCalShowTimeEnd();
        bool local_3 = !(this.GetbCachedRaceCommission()) && !(this.GetbCommissionFinishMedalCalShowTimeEnd()) && this.GetbCommissionFinishWaitTeamPageShow();
        bool local_1 = !(this.GetbCachedRaceCommission()) && !(this.GetbCommissionFinishMedalCalShowTimeEnd()) && !(this.GetbCommissionFinishWaitTeamPageShow()) && this.GetbCommissionFinishWaitTeamPageShowEnd();
        if (local_2)
        {
            this.ApplySkipCountdown(this.GetCommissionFinishReward(), true, this.GetCommissionFinishMedalCalShowTime());
        }
        else
        {
            if (local_3)
            {
                this.ApplySkipCountdown(this.GetCommissionFinishReward(), true, this.GetCommissionFinishTeamPageShowTime());
            }
            else
            {
                this.ApplySkipCountdown(this.GetCommissionFinishReward(), false, FFPTime());
            }
        }
        if (local_1)
        {
            this.ApplySkipCountdown(this.GetCommissionFinishTeam(), true, this.GetCommissionFinishTeamPageShowEndTime());
            return;
        }
        this.ApplySkipCountdown(this.GetCommissionFinishTeam(), false, FFPTime());
        return;
    }
    void ApplySkipCountdown(const TEUIModelRef<FVM_CommissionFinish> &inout VMRef, const bool bShow, const FFPTime &inout Remaining)
    {
        if (!(VMRef))
        {
            return;
        }
        FVM_CommissionFinish local_4;
        local_4.SetbShowSkipButton(bShow);
        if (bShow)
        {
            local_4.SetSkipCountdownSeconds(FMath::Max(0, FMath::CeilToInt(Remaining.ToSeconds())));
        }
        return;
    }
    int GetNop() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Nop;
    }
    void SetNop(const int __Value) property
    {
        if (this.m_Nop == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Nop = __Value;
        return;
    }
    bool GetbCommissionFinishShowSettlement() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bCommissionFinishShowSettlement;
    }
    void SetbCommissionFinishShowSettlement(const bool __Value) property
    {
        if (!(this.m_bCommissionFinishShowSettlement) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bCommissionFinishShowSettlement = __Value;
        return;
    }
    bool GetbCommissionFinishMedalCalShowTimeEnd() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bCommissionFinishMedalCalShowTimeEnd;
    }
    void SetbCommissionFinishMedalCalShowTimeEnd(const bool __Value) property
    {
        if (!(this.m_bCommissionFinishMedalCalShowTimeEnd) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bCommissionFinishMedalCalShowTimeEnd = __Value;
        return;
    }
    bool GetbCommissionFinishWaitTeamPageShow() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bCommissionFinishWaitTeamPageShow;
    }
    void SetbCommissionFinishWaitTeamPageShow(const bool __Value) property
    {
        if (!(this.m_bCommissionFinishWaitTeamPageShow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bCommissionFinishWaitTeamPageShow = __Value;
        return;
    }
    bool GetbCommissionFinishWaitTeamPageShowEnd() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bCommissionFinishWaitTeamPageShowEnd;
    }
    void SetbCommissionFinishWaitTeamPageShowEnd(const bool __Value) property
    {
        if (!(this.m_bCommissionFinishWaitTeamPageShowEnd) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bCommissionFinishWaitTeamPageShowEnd = __Value;
        return;
    }
    bool GetbSkipRewardPopups() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bSkipRewardPopups;
    }
    void SetbSkipRewardPopups(const bool __Value) property
    {
        if (!(this.m_bSkipRewardPopups) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bSkipRewardPopups = __Value;
        return;
    }
    bool GetbCachedRaceCommission() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bCachedRaceCommission;
    }
    void SetbCachedRaceCommission(const bool __Value) property
    {
        if (!(this.m_bCachedRaceCommission) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bCachedRaceCommission = __Value;
        return;
    }
    int GetCommissionFullScreenRewardPopupId() const property
    {
        this.TrackPropertyRead(7);
        return this.m_CommissionFullScreenRewardPopupId;
    }
    void SetCommissionFullScreenRewardPopupId(const int __Value) property
    {
        if (this.m_CommissionFullScreenRewardPopupId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_CommissionFullScreenRewardPopupId = __Value;
        return;
    }
    bool GetbWaitingForFullScreenRelease() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bWaitingForFullScreenRelease;
    }
    void SetbWaitingForFullScreenRelease(const bool __Value) property
    {
        if (!(this.m_bWaitingForFullScreenRelease) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bWaitingForFullScreenRelease = __Value;
        return;
    }
    bool GetbFullScreenFlowStarted() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bFullScreenFlowStarted;
    }
    void SetbFullScreenFlowStarted(const bool __Value) property
    {
        if (!(this.m_bFullScreenFlowStarted) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bFullScreenFlowStarted = __Value;
        return;
    }
    bool GetbFullScreenRewardPopOpened() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bFullScreenRewardPopOpened;
    }
    void SetbFullScreenRewardPopOpened(const bool __Value) property
    {
        if (!(this.m_bFullScreenRewardPopOpened) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bFullScreenRewardPopOpened = __Value;
        return;
    }
    const FFPTime GetCommissionFinishShowSettlementTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FFPTime GetModify_CommissionFinishShowSettlementTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetCommissionFinishShowSettlementTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_CommissionFinishShowSettlementTime = __Value;
        return;
    }
    const FFPTime GetCommissionFinishMedalCalShowTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FFPTime GetModify_CommissionFinishMedalCalShowTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetCommissionFinishMedalCalShowTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_CommissionFinishMedalCalShowTime = __Value;
        return;
    }
    const FFPTime GetCommissionFinishTeamPageShowTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FFPTime GetModify_CommissionFinishTeamPageShowTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetCommissionFinishTeamPageShowTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_CommissionFinishTeamPageShowTime = __Value;
        return;
    }
    const FFPTime GetCommissionFinishTeamPageShowEndTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    FFPTime GetModify_CommissionFinishTeamPageShowEndTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetCommissionFinishTeamPageShowEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_CommissionFinishTeamPageShowEndTime = __Value;
        return;
    }
    TEUIModelRef<FVM_CommissionFinish> GetCommissionFinishReward() const property
    {
        this.TrackPropertyRead(15);
        return this.m_CommissionFinishReward;
    }
    void SetCommissionFinishReward(const TEUIModelRef<FVM_CommissionFinish> &inout __Value) property
    {
        TEUIModelRef<FVM_CommissionFinish> local_2;
        local_2 = this.m_CommissionFinishReward;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_CommissionFinishReward = __Value;
        return;
    }
    TEUIModelRef<FVM_CommissionFinish> GetCommissionFinishTeam() const property
    {
        this.TrackPropertyRead(16);
        return this.m_CommissionFinishTeam;
    }
    void SetCommissionFinishTeam(const TEUIModelRef<FVM_CommissionFinish> &inout __Value) property
    {
        TEUIModelRef<FVM_CommissionFinish> local_2;
        local_2 = this.m_CommissionFinishTeam;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_CommissionFinishTeam = __Value;
        return;
    }
    const FEUIWidgetRef GetCommissionFinishRewardWidget() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    FEUIWidgetRef GetModify_CommissionFinishRewardWidget() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetCommissionFinishRewardWidget(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_CommissionFinishRewardWidget = __Value;
        return;
    }
    const FEUIWidgetRef GetCommissionFinishTeamWidget() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(18);
        return __r;
    }
    FEUIWidgetRef GetModify_CommissionFinishTeamWidget() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(18);
        return __r;
    }
    void SetCommissionFinishTeamWidget(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_CommissionFinishTeamWidget = __Value;
        return;
    }
}

namespace FM_CommissionPopup
{
FM_CommissionPopup& Create(const UObject ContextObject)
{
    return FM_CommissionPopup::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_CommissionPopup CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_CommissionPopup __r;
    TEUIModelRef<FM_CommissionPopup> local_6 = TEUIModelRef<FM_CommissionPopup>(EUIInternal::MakeModelWithManager(Manager, FM_CommissionPopup::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelEventDefine local_10;
    local_10.FunctionName = "__OnNotify";
    local_10.EventType = FCE_OnReceivePlayerNotify;
    Result.EventFunctions.Add(local_10);
    local_10.FunctionName = "__OnCommonPopupManagerChanged";
    local_10.EventType = FCE_NotifyCommonPopupManagerChanged;
    Result.EventFunctions.Add(local_10);
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_CommissionPopup;
}
void __OnNotify(FM_CommissionPopup &inout Model, const FCE_OnReceivePlayerNotify &inout Event)
{
    Model.OnNotify(Event);
    return;
}
void __OnCommonPopupManagerChanged(FM_CommissionPopup &inout Model, const FCE_NotifyCommonPopupManagerChanged &inout Event)
{
    Model.OnCommonPopupManagerChanged(Event);
    return;
}
void __Tick(FM_CommissionPopup &inout Model)
{
    Model.Tick();
    return;
}
int __IndexOf_Nop()
{
    return 0;
}
int __IndexOf_bCommissionFinishShowSettlement()
{
    return 1;
}
int __IndexOf_bCommissionFinishMedalCalShowTimeEnd()
{
    return 2;
}
int __IndexOf_bCommissionFinishWaitTeamPageShow()
{
    return 3;
}
int __IndexOf_bCommissionFinishWaitTeamPageShowEnd()
{
    return 4;
}
int __IndexOf_bSkipRewardPopups()
{
    return 5;
}
int __IndexOf_bCachedRaceCommission()
{
    return 6;
}
int __IndexOf_CommissionFullScreenRewardPopupId()
{
    return 7;
}
int __IndexOf_bWaitingForFullScreenRelease()
{
    return 8;
}
int __IndexOf_bFullScreenFlowStarted()
{
    return 9;
}
int __IndexOf_bFullScreenRewardPopOpened()
{
    return 10;
}
int __IndexOf_CommissionFinishShowSettlementTime()
{
    return 11;
}
int __IndexOf_CommissionFinishMedalCalShowTime()
{
    return 12;
}
int __IndexOf_CommissionFinishTeamPageShowTime()
{
    return 13;
}
int __IndexOf_CommissionFinishTeamPageShowEndTime()
{
    return 14;
}
int __IndexOf_CommissionFinishReward()
{
    return 15;
}
int __IndexOf_CommissionFinishTeam()
{
    return 16;
}
int __IndexOf_CommissionFinishRewardWidget()
{
    return 17;
}
int __IndexOf_CommissionFinishTeamWidget()
{
    return 18;
}
}
