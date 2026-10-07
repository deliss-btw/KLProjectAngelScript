
namespace FVM_TeammateInfo
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClickTeamItem = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ViewInfo = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature KickMember = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature KickMemberConfirm = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SetCaptain = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SetCaptainConfirm = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ToggleMute = FEUIModelCallbackSignature();

}
struct FVM_TeammateInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_TeamMember> m_TeamMember;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerInfo> m_PlayerInfo;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerHpBar> m_PlayerHpBar;
    UPROPERTY()
    TEUIModelRef<FVM_BuffInfo> m_PlayerBuffInfo;
    UPROPERTY()
    TEUIModelRef<FVM_TeammateMessageBubbleManager> m_TeammateMessageBubble;
    UPROPERTY()
    TEUIModelRef<FVM_Index> m_Index;
    UPROPERTY()
    TEUIModelRef<FM_Player> m_Player;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerBasicItem> m_PlayerBasicItem;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerBasicItemExtend> m_PlayerBasicItemExtend;
    UPROPERTY()
    FCommonHoverHandle m_HoverHandle;
    UPROPERTY()
    FFPTime m_HoverOpenTime;
    UPROPERTY()
    FFPTime m_HoverAutoCloseDelay;
    UPROPERTY()
    TEUIModelRef<FVM_BtnOperationList> m_HoverListModel;
    UPROPERTY()
    uint m_PendingKickMemberTargetUid;
    UPROPERTY()
    uint m_PendingSetCaptainTargetUid;
    UPROPERTY()
    bool m_bIsMuted;
    UPROPERTY()
    bool m_bIsSpeaking;
    UPROPERTY()
    FEUITimerHandle m_SpeakingPollTimer;

    FVM_TeammateInfo()
    {
        this.m_HoverAutoCloseDelay = FFPTime(1.0);
        this.m_PendingKickMemberTargetUid = 0;
        this.m_PendingSetCaptainTargetUid = 0;
        this.m_bIsMuted = false;
        this.m_bIsSpeaking = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TeammateInfo' by default constructor.");
        return;
    }
    FVM_TeammateInfo(const FVM_TeammateInfo &inout Other)
    {
        this.m_HoverAutoCloseDelay = FFPTime(1.0);
        this.m_PendingKickMemberTargetUid = 0;
        this.m_PendingSetCaptainTargetUid = 0;
        this.m_bIsMuted = false;
        this.m_bIsSpeaking = false;
        this.m_TeamMember = Other.m_TeamMember;
        this.m_PlayerInfo = Other.m_PlayerInfo;
        this.m_PlayerHpBar = Other.m_PlayerHpBar;
        this.m_PlayerBuffInfo = Other.m_PlayerBuffInfo;
        this.m_TeammateMessageBubble = Other.m_TeammateMessageBubble;
        this.m_Index = Other.m_Index;
        this.m_Player = Other.m_Player;
        this.m_PlayerBasicItem = Other.m_PlayerBasicItem;
        this.m_PlayerBasicItemExtend = Other.m_PlayerBasicItemExtend;
        this.m_HoverOpenTime = Other.m_HoverOpenTime;
        this.m_HoverAutoCloseDelay = Other.m_HoverAutoCloseDelay;
        this.m_HoverListModel = Other.m_HoverListModel;
        this.m_PendingKickMemberTargetUid = int(Other.m_PendingKickMemberTargetUid);
        this.m_PendingSetCaptainTargetUid = int(Other.m_PendingSetCaptainTargetUid);
        this.m_bIsMuted = Other.m_bIsMuted;
        this.m_bIsSpeaking = Other.m_bIsSpeaking;
        this.m_SpeakingPollTimer = Other.m_SpeakingPollTimer;
        return;
    }
    FVM_TeammateInfo(const TEUIModelRef<FM_TeamMember> &inout InTeamMember)
    {
        this.m_HoverAutoCloseDelay = FFPTime(1.0);
        this.m_PendingKickMemberTargetUid = 0;
        this.m_PendingSetCaptainTargetUid = 0;
        this.m_bIsMuted = false;
        this.m_bIsSpeaking = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTeamMember(InTeamMember);
        return;
    }
    FVM_TeammateInfo& opAssign(const FVM_TeammateInfo &inout Other)
    {
        this.m_TeamMember = Other.m_TeamMember;
        this.m_PlayerInfo = Other.m_PlayerInfo;
        this.m_PlayerHpBar = Other.m_PlayerHpBar;
        this.m_PlayerBuffInfo = Other.m_PlayerBuffInfo;
        this.m_TeammateMessageBubble = Other.m_TeammateMessageBubble;
        this.m_Index = Other.m_Index;
        this.m_Player = Other.m_Player;
        this.m_PlayerBasicItem = Other.m_PlayerBasicItem;
        this.m_PlayerBasicItemExtend = Other.m_PlayerBasicItemExtend;
        this.m_HoverOpenTime = Other.m_HoverOpenTime;
        this.m_HoverAutoCloseDelay = Other.m_HoverAutoCloseDelay;
        this.m_HoverListModel = Other.m_HoverListModel;
        this.m_PendingKickMemberTargetUid = int(Other.m_PendingKickMemberTargetUid);
        this.m_PendingSetCaptainTargetUid = int(Other.m_PendingSetCaptainTargetUid);
        this.m_bIsMuted = Other.m_bIsMuted;
        this.m_bIsSpeaking = Other.m_bIsSpeaking;
        return Other.m_SpeakingPollTimer;
    }
    int GetTeamMemberDisplaySequenceNum() const
    {
        return (this.GetTeamMember().opArrow().GetMemberIndex() + 1);
    }
    bool IsSelf() const
    {
        if (!(this.GetTeamMember().opArrow().GetPlayer()))
        {
            return false;
        }
        int local_11 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(this.GetContext().GetLocalPlayer());
        TEUIModelRef<FM_Player> local_4 = this.GetTeamMember().opArrow().GetPlayer();
        return (GetPlayerUid() == local_11);
    }
    bool IsCaptain() const
    {
        return this.GetTeamMember().opArrow().IsCaptain();
    }
    bool IsSocialTeam() const
    {
        return (int(this.GetTeamMember().opArrow().GetTeamType()) == 1);
    }
    bool IsCombatTeam() const
    {
        return (int(this.GetTeamMember().opArrow().GetTeamType()) == 2);
    }
    void OnClientVOXStateChanged(const FCS_ClientVOXState &inout VOXState)
    {
        this.RefreshMuteState(VOXState);
        return;
    }
    void RefreshMuteState(const FCS_ClientVOXState &inout VOXState)
    {
        bool local_1 = false;
        bool local_2 = this.GetTeamMember().opArrow().GetPlayer();
        if (!(local_2))
        {
            local_2 = false;
        }
        else
        {
            local_2 = VOXState;
        }
        if (local_2)
        {
            TEUIModelRef<FM_Player> local_6 = this.GetTeamMember().opArrow().GetPlayer();
            local_1 = VOXState.MutedPlayerUids.Contains(GetPlayerUid());
        }
        this.SetbIsMuted(local_1);
        return;
    }
    void PollSpeakingState()
    {
        bool local_1 = false;
        if (this.GetTeamMember().opArrow().GetPlayer())
        {
            TEUIModelRef<FM_Player> local_6 = this.GetTeamMember().opArrow().GetPlayer();
            local_1 = ::VOXUtils::IsPlayerSpeaking(GetPlayerUid());
        }
        this.SetbIsSpeaking(local_1);
        return;
    }
    bool IsTaunting() const
    {
        FECSEntity local_4 = this.GetPlayerEntity();
        Has local_8;
        return local_8.opCall();
    }
    bool IsNearDeath() const
    {
        FECSEntity local_4 = this.GetPlayerPawnEntity();
        Has local_8;
        return local_8.opCall();
    }
    bool IsDead() const
    {
        FECSEntity local_4 = this.GetPlayerPawnEntity();
        Has local_8;
        return local_8.opCall();
    }
    ESlateVisibility GetShowSkillHint() const
    {
        int local_10;
        FECSEntity local_4 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        Has local_8;
        bool local_9 = local_8.opCall();
        if (local_9)
        {
            local_10 = 0;
        }
        else
        {
            local_10 = 1;
        }
        return ESlateVisibility(local_10);
    }
    FEUIInputAction GetShowSkillHintIA() const
    {
        const UUtilitySettings local_12;
        bool local_9 = FECSEntity::Has<FC_TeamMemberInfoSkillHintTag>(::FASCommonUtils::GetLocalPlayerPawnEntity()).opCall();
        if (local_9)
        {
            GetGameplaySettings<UUtilitySettings> local_14;
            local_12 = local_14;
            int local_21 = this.GetIndex().opArrow().GetDisplayIndex() - 1;
            if (local_12.TeamInfoSkillHintIAMap.Contains(local_21))
            {
                return FEUIInputAction(FCharacterInputUtils::GetInputActionByMainInputName(::FASCommonUtils::GetLocalPlayerPawnEntity(), local_12.TeamInfoSkillHintIAMap[local_21].CoreTriggerItem.MainInputName.Name));
            }
        }
        return FEUIInputAction();
    }
    bool IsDeadOrNearDeath() const
    {
        return this.IsNearDeath() || this.IsDead();
    }
    bool IsAlive() const
    {
        return !(this.IsDeadOrNearDeath());
    }
    bool IsNotDead() const
    {
        return !(this.IsDead());
    }
    int GetStatusIndex() const
    {
        if (this.GetPlayer())
        {
            if (!(this.GetPlayer().opArrow().GetIsOnline()))
            {
                return 2;
            }
            if (!(this.GetPlayer().opArrow().IsInSameMapWithLocalPlayer()))
            {
                return 3;
            }
        }
        if (this.IsDead())
        {
            return 1;
        }
        return 0;
    }
    float32 GetNearDeathBarPercent() const
    {
        FECSEntity local_4 = this.GetPlayerPawnEntity();
        Get local_8;
        const FC_NearDeathInfo& local_10 = local_8.opCall();
        if (local_10)
        {
            if (local_10.GetMaxNearDeathHP() > 0.0f)
            {
                return (local_10.GetNearDeathHP() / local_10.GetMaxNearDeathHP());
            }
        }
        return 1.0f;
    }
    bool ShouldDisplayPlayerSocialStatus() const
    {
        if (!(this.IsSocialTeam()))
        {
            return false;
        }
        if (this.GetPlayer())
        {
            if (this.GetPlayer().opArrow().IsInSameMapWithLocalPlayer() && this.GetPlayer().opArrow().GetIsOnline())
            {
                return false;
            }
        }
        return true;
    }
    FText GetIndexText() const
    {
        return FText::Format(FText::AsCultureInvariant("{0}."), this.GetIndex().opArrow().GetDisplayIndex());
    }
    void PostConstruct()
    {
        this.OnPlayerPawnEntityChanged();
        this.ScheduleTick(this.GetModify_SpeakingPollTimer(), n"PollSpeakingState", 0.2f, -1.0f);
        return;
    }
    void BeginDestroy()
    {
        this.ClearTimer(this.GetModify_SpeakingPollTimer());
        this.CloseHoverMenu();
        return;
    }
    void CloseHoverMenu()
    {
        if (this.GetHoverHandle())
        {
            ::CommonPopup::CloseHover(this.GetHoverHandle(), this.GetManager(), false);
            this.SetHoverHandle(FCommonHoverHandle::InvalidHandle);
            this.SetHoverListModel(TEUIModelRef<FVM_BtnOperationList>(nullptr));
        }
        return;
    }
    void Tick()
    {
        if (!(this.GetHoverHandle()))
        {
            return;
        }
        FFPTime local_6 = (FFPTime(this.GetContext().Time) - this.GetHoverOpenTime());
        if (local_6.opCmp(this.GetHoverAutoCloseDelay()) > 0)
        {
            if (!(this.GetHoverListModel().IsValid() && this.GetHoverListModel().opArrow().GetbIsHovering()))
            {
                this.CloseHoverMenu();
            }
        }
        return;
    }
    void OnTeamPanelShoulderReleased(const FMsg_TeamPanelShoulderReleased &inout Msg)
    {
        this.CloseHoverMenu();
        return;
    }
    void OnHoverListModelHoverStateChanged()
    {
        return;
    }
    void OnTeamMemberIndexChanged()
    {
        this.SetIndex(TEUIModelRef<FVM_Index>(::FVM_Index::Create(this.GetContext().Manager, this.GetTeamMember().opArrow().GetMemberIndex())));
        return;
    }
    void OnClickTeamItem(const UWidget Widget)
    {
        const UTeamSettings local_8;
        this.CloseHoverMenu();
        if (this.IsSelf())
        {
            return;
        }
        TArray<TEUIModelRef<FVM_BtnOperationItem>> local_6;
        GetGameplaySettings<UTeamSettings> local_10;
        local_8 = local_10;
        if (local_8.OperatorIconConfigs.Contains(ETeamOtherPlayerOperatorType(0)))
        {
            FOperatorBtnData local_108;
            TEUIModelRef<FVM_BtnOperationItem> local_110 = TEUIModelRef<FVM_BtnOperationItem>(::FVM_BtnOperationItem::Create(this.GetContext().Manager, local_108.ButtonText, local_108.Icon));
            GetOnClickGoToCallback().Bind(this, FVM_TeammateInfo::ViewInfo);
            FEUIModelRef(this).SetClickModelRef();
            local_6.Add(local_110);
        }
        if (this.IsSocialTeam() && ::FMS_LocalPlayerTeamData::Get(this.GetManager()).SelfIsSocialTeamCaptain())
        {
            if (local_8.OperatorIconConfigs.Contains(ETeamOtherPlayerOperatorType(1)))
            {
                FOperatorBtnData local_108;
                TEUIModelRef<FVM_BtnOperationItem> local_110 = TEUIModelRef<FVM_BtnOperationItem>(::FVM_BtnOperationItem::Create(this.GetContext().Manager, local_108.ButtonText, local_108.Icon));
                GetOnClickGoToCallback().Bind(this, FVM_TeammateInfo::SetCaptain);
                FEUIModelRef(this).SetClickModelRef();
                local_6.Add(local_110);
            }
        }
        if (this.IsSocialTeam() && ::FMS_LocalPlayerTeamData::Get(this.GetManager()).SelfIsSocialTeamCaptain())
        {
            if (local_8.OperatorIconConfigs.Contains(ETeamOtherPlayerOperatorType(2)))
            {
                FOperatorBtnData local_108;
                TEUIModelRef<FVM_BtnOperationItem> local_110 = TEUIModelRef<FVM_BtnOperationItem>(::FVM_BtnOperationItem::Create(this.GetContext().Manager, local_108.ButtonText, local_108.Icon));
                GetOnClickGoToCallback().Bind(this, FVM_TeammateInfo::KickMember);
                FEUIModelRef(this).SetClickModelRef();
                local_6.Add(local_110);
            }
        }
        if (local_8.OperatorIconConfigs.Contains(ETeamOtherPlayerOperatorType(3)))
        {
            bool local_119;
            FOperatorBtnData local_108;
            local_119 = this.GetTeamMember().opArrow().GetPlayer();
            if (!(local_119))
            {
                local_119 = false;
            }
            else
            {
                TEUIModelRef<FM_Player> local_130 = this.GetTeamMember().opArrow().GetPlayer();
                local_119 = ::VOXUtils::IsPlayerMuted(GetPlayerUid());
            }
            FText local_142 = local_119 ? NSLOCTEXT("Team", "UnmutePlayer", "еЏ–ж¶€йќ™йџі") : local_108.ButtonText;
            TEUIModelRef<FVM_BtnOperationItem> local_112 = TEUIModelRef<FVM_BtnOperationItem>(::FVM_BtnOperationItem::Create(this.GetContext().Manager, local_142, local_108.Icon));
            TEUIModelRef<FVM_BtnOperationItem> local_110;
            GetOnClickGoToCallback().Bind(this, FVM_TeammateInfo::ToggleMute);
            FEUIModelRef(this).SetClickModelRef();
            local_6.Add(local_112);
        }
        TEUIModelRef<FVM_BtnOperationList> local_144 = TEUIModelRef<FVM_BtnOperationList>(::FVM_BtnOperationList::Create(this.GetContext().Manager, local_6));
        if (local_6.IsEmpty())
        {
            this.CloseHoverMenu();
            return;
        }
        this.SetHoverListModel(local_144);
        FEUIModelContainer local_160;
        local_160.AddModel(local_144.opImplConv(), false);
        this.SetHoverHandle(::CommonPopup::HoverCustom(Widget, local_8.ListInfoHover, local_160, true, true, ECommonHoverLayout(0), EEUILayoutLayer(0), false));
        this.SetHoverOpenTime(this.GetContext().Time);
        return;
    }
    bool ViewInfo(const FEUIModelRef &inout ModelRef)
    {
        ::FVM_SocialViewPage::GotoPage(this.GetContext().UELocalPlayer, this.GetTeamMember().opArrow().GetPlayer(), ESocialViewPageOpenType(4), 0);
        this.CloseHoverMenu();
        return true;
    }
    bool KickMember(const FEUIModelRef &inout ModelRef)
    {
        this.SetPendingKickMemberTargetUid(0);
        if (this.GetTeamMember().opArrow().GetPlayer())
        {
            TEUIModelRef<FM_Player> local_6 = this.GetTeamMember().opArrow().GetPlayer();
            this.SetPendingKickMemberTargetUid(GetPlayerUid());
        }
        FDialogModelCallback local_34;
        local_34.Bind(this, FVM_TeammateInfo::KickMemberConfirm);
        TEUIModelRef<FM_Player> local_6_2 = this.GetTeamMember().opArrow().GetPlayer();
        FString local_42;
        local_42.GetNickName();
        FText local_54 = FText::Format(NSLOCTEXT("Team", "KickMemberMessage", "жЇеђ¦зЎ®и®¤иЇ·з¦»{0}"), FText::FromString(local_42));
        FCommonDialogParam local_88;
        ::CommonPopup::Dialog_Decision(NSLOCTEXT("Team", "KickMemberTitle", "жЏђз¤є"), local_54, FDialogCallback(local_34), NSLOCTEXT("Team", "KickMemberConfirm", "жЇ"), NSLOCTEXT("Team", "KickMemberCancel", "еђ¦"), local_88);
        this.CloseHoverMenu();
        return true;
    }
    bool KickMemberConfirm(const FCommonDialogAnswer &inout Answer)
    {
        int local_1;
        local_1 = this.GetPendingKickMemberTargetUid();
        this.SetPendingKickMemberTargetUid(0);
        if (int(Answer.AnswerType) != 1)
        {
            return true;
        }
        if (local_1 == 0)
        {
            return true;
        }
        bool local_6 = !(this.GetTeamMember().opArrow().GetPlayer());
        if (local_6)
        {
            local_6 = true;
        }
        else
        {
            TEUIModelRef<FM_Player> local_10 = this.GetTeamMember().opArrow().GetPlayer();
            local_6 = (GetPlayerUid() != local_1);
        }
        if (local_6)
        {
            FCommonTipsParam local_20;
            ::CommonPopup::WeakTips(NSLOCTEXT("Team", "TeamChangedCannotKick", "йџдјЌе·ІеЏ‘з”џеЏеЊ–"), local_20);
            return true;
        }
        ::FSocialTeamUtils::ClientSendKickTeammate(this.GetContext().GetLocalPlayer(), local_1);
        return true;
    }
    bool SetCaptain(const FEUIModelRef &inout ModelRef)
    {
        this.SetPendingSetCaptainTargetUid(0);
        if (this.GetTeamMember().opArrow().GetPlayer())
        {
            TEUIModelRef<FM_Player> local_6 = this.GetTeamMember().opArrow().GetPlayer();
            this.SetPendingSetCaptainTargetUid(GetPlayerUid());
        }
        FDialogModelCallback local_34;
        local_34.Bind(this, FVM_TeammateInfo::SetCaptainConfirm);
        TEUIModelRef<FM_Player> local_6_2 = this.GetTeamMember().opArrow().GetPlayer();
        FString local_42;
        local_42.GetNickName();
        FText local_54 = FText::Format(NSLOCTEXT("Team", "SetCaptainMessage", "жЇеђ¦зЎ®и®¤е°†йџй•їиЅ¬и®©з»™{0}"), FText::FromString(local_42));
        FCommonDialogParam local_88;
        ::CommonPopup::Dialog_Decision(NSLOCTEXT("Team", "SetCaptainTitle", "жЏђз¤є"), local_54, FDialogCallback(local_34), NSLOCTEXT("Team", "SetCaptainConfirm", "жЇ"), NSLOCTEXT("Team", "SetCaptainCancel", "еђ¦"), local_88);
        this.CloseHoverMenu();
        return true;
    }
    bool SetCaptainConfirm(const FCommonDialogAnswer &inout Answer)
    {
        int local_1;
        local_1 = this.GetPendingSetCaptainTargetUid();
        this.SetPendingSetCaptainTargetUid(0);
        if (int(Answer.AnswerType) != 1)
        {
            return true;
        }
        if (local_1 == 0)
        {
            return true;
        }
        bool local_6 = !(this.GetTeamMember().opArrow().GetPlayer());
        if (local_6)
        {
            local_6 = true;
        }
        else
        {
            TEUIModelRef<FM_Player> local_10 = this.GetTeamMember().opArrow().GetPlayer();
            local_6 = (GetPlayerUid() != local_1);
        }
        if (local_6)
        {
            FCommonTipsParam local_20;
            ::CommonPopup::WeakTips(NSLOCTEXT("Team", "TeamChangedCannotSetCaptain", "йџдјЌе·ІеЏ‘з”џеЏеЊ–"), local_20);
            return true;
        }
        ::FSocialTeamUtils::ClientSendTransferCaptain(this.GetContext().GetLocalPlayer(), local_1);
        return true;
    }
    bool ToggleMute(const FEUIModelRef &inout ModelRef)
    {
        int local_6;
        if (!(this.GetTeamMember().opArrow().GetPlayer()))
        {
            this.CloseHoverMenu();
            return true;
        }
        TEUIModelRef<FM_Player> local_4 = this.GetTeamMember().opArrow().GetPlayer();
        local_6 = GetPlayerUid();
        if (::VOXUtils::IsPlayerMuted(local_6))
        {
            FCommonTipsParam local_28;
            FString local_12;
            ::VOXUtils::UnmutePlayer(local_6);
            TEUIModelRef<FM_Player> local_4_2 = this.GetTeamMember().opArrow().GetPlayer();
            local_12.GetNickName();
            ::CommonPopup::WeakTips(FText::Format(NSLOCTEXT("Team", "UnmutedPlayer", "е·ІеЏ–ж¶€йќ™йџі{0}"), FText::FromString(local_12)), local_28);
        }
        else
        {
            FCommonTipsParam local_28;
            FString local_12;
            ::VOXUtils::MutePlayer(local_6);
            TEUIModelRef<FM_Player> local_4_3 = this.GetTeamMember().opArrow().GetPlayer();
            local_12.GetNickName();
            ::CommonPopup::WeakTips(FText::Format(NSLOCTEXT("Team", "MutedPlayer", "е·Ійќ™йџі{0}"), FText::FromString(local_12)), local_28);
        }
        this.CloseHoverMenu();
        return true;
    }
    void OnTeamMemberPlayerChanged()
    {
        TEUIModelRef<FM_Player> local_4 = this.GetTeamMember().opArrow().GetPlayer();
        this.SetPlayer(local_4);
        this.SetPlayerInfo(TEUIModelRef<FVM_PlayerInfo>(::FVM_PlayerInfo::Create(this.GetContext().Manager, this.GetPlayer())));
        if (this.GetPlayer())
        {
            TEUIModelRef<FM_Player> local_4_2 = this.GetPlayer();
            this.SetPlayerBasicItem(TEUIModelRef<FVM_PlayerBasicItem>(::FVM_PlayerBasicItem::Create(this.GetContext().Manager, ::FMS_PlayerBriefInfo::Get(this.GetManager()).CacheFromPlayer())));
            this.RefreshPlayerBasicItemExtend();
        }
        this.OnPlayerEntityChanged();
        bool local_55 = this.GetTeamMember().opArrow().GetPlayer();
        if (!(local_55))
        {
            local_55 = false;
        }
        else
        {
            TEUIModelRef<FM_Player> local_54 = this.GetTeamMember().opArrow().GetPlayer();
            local_55 = ::VOXUtils::IsPlayerMuted(GetPlayerUid());
        }
        this.SetbIsMuted(local_55);
        return;
    }
    void OnPlayerLevelAttrChanged()
    {
        this.RefreshPlayerDisplay();
        return;
    }
    void OnPlayerDivineSkillAttrChanged()
    {
        this.RefreshPlayerDisplay();
        return;
    }
    void OnPlayerCurrentAvatarAttrChanged()
    {
        this.RefreshPlayerDisplay();
        return;
    }
    void OnPlayerNickNameAttrChanged()
    {
        this.RefreshPlayerDisplay();
        return;
    }
    void OnPlayerIsOnlineAttrChanged()
    {
        this.RefreshPlayerDisplay();
        return;
    }
    void OnLocalPlayerLevelRefresh(const FMsg_LocalPlayerLevelRefresh &inout Msg)
    {
        if (this.IsSelf())
        {
            this.RefreshPlayerDisplay();
        }
        return;
    }
    void RefreshPlayerDisplay()
    {
        this.SetPlayerInfo(TEUIModelRef<FVM_PlayerInfo>(::FVM_PlayerInfo::Create(this.GetContext().Manager, this.GetPlayer())));
        if (this.GetPlayer())
        {
            TEUIModelRef<FM_Player> local_2 = this.GetPlayer();
            this.SetPlayerBasicItem(TEUIModelRef<FVM_PlayerBasicItem>(::FVM_PlayerBasicItem::Create(this.GetContext().Manager, ::FMS_PlayerBriefInfo::Get(this.GetManager()).CacheFromPlayer())));
            this.RefreshPlayerBasicItemExtend();
        }
        return;
    }
    void RefreshPlayerBasicItemExtend()
    {
        this.SetPlayerBasicItemExtend(TEUIModelRef<FVM_PlayerBasicItemExtend>(::FVM_PlayerBasicItemExtend::Create(this.GetContext().Manager)));
        TEUIModelRef<FVM_PlayerBasicItemExtend> local_2 = this.GetPlayerBasicItemExtend();
        (int(::FLevelUtils::GetCurrentLevelType()) != 5).SetbShowLevelText();
        return;
    }
    void HandlePlayerEntityChanged(const FMsg_PlayerEntityChanged &inout Msg)
    {
        this.OnPlayerEntityChanged();
        return;
    }
    void HandlePlayerPawnEntityChanged(const FMsg_PlayerPawnEntityChanged &inout Msg)
    {
        this.OnPlayerPawnEntityChanged();
        return;
    }
    void OnPlayerEntityChanged()
    {
        if (this.GetPlayer())
        {
            this.SetTeammateMessageBubble(TEUIModelRef<FVM_TeammateMessageBubbleManager>(::FVM_TeammateMessageBubbleManager::Create(this.GetContext().Manager, this.GetPlayer().opArrow().GetPlayerEntity())));
            this.OnPlayerPawnEntityChanged();
        }
        return;
    }
    void OnPlayerPawnEntityChanged()
    {
        if (this.GetPlayer())
        {
            this.SetPlayerHpBar(TEUIModelRef<FVM_PlayerHpBar>(::FVM_PlayerHpBar::Create(this.GetContext().Manager, this.GetPlayer().opArrow().GetPlayerPawnEntity())));
            this.SetPlayerBuffInfo(TEUIModelRef<FVM_BuffInfo>(::FVM_BuffInfo::Create(this.GetContext().Manager, this.GetPlayer().opArrow().GetPlayerPawnEntity())));
        }
        return;
    }
    FECSEntity GetPlayerPawnEntity() const property
    {
        if (this.GetPlayer())
        {
            return this.GetPlayer().opArrow().GetPlayerPawnEntity();
        }
        return ENTITY_NULL;
    }
    FECSEntity GetPlayerEntity() const property
    {
        if (this.GetPlayer())
        {
            return this.GetPlayer().opArrow().GetPlayerEntity();
        }
        return ENTITY_NULL;
    }
    TEUIModelRef<FM_TeamMember> GetTeamMember() const property
    {
        this.TrackPropertyRead(0);
        return this.m_TeamMember;
    }
    void SetTeamMember(const TEUIModelRef<FM_TeamMember> &inout __Value) property
    {
        TEUIModelRef<FM_TeamMember> local_2;
        local_2 = this.m_TeamMember;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeamMember = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerInfo> GetPlayerInfo() const property
    {
        this.TrackPropertyRead(1);
        return this.m_PlayerInfo;
    }
    void SetPlayerInfo(const TEUIModelRef<FVM_PlayerInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerInfo> local_2;
        local_2 = this.m_PlayerInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PlayerInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerHpBar> GetPlayerHpBar() const property
    {
        this.TrackPropertyRead(2);
        return this.m_PlayerHpBar;
    }
    void SetPlayerHpBar(const TEUIModelRef<FVM_PlayerHpBar> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerHpBar> local_2;
        local_2 = this.m_PlayerHpBar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PlayerHpBar = __Value;
        return;
    }
    TEUIModelRef<FVM_BuffInfo> GetPlayerBuffInfo() const property
    {
        this.TrackPropertyRead(3);
        return this.m_PlayerBuffInfo;
    }
    void SetPlayerBuffInfo(const TEUIModelRef<FVM_BuffInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_BuffInfo> local_2;
        local_2 = this.m_PlayerBuffInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PlayerBuffInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_TeammateMessageBubbleManager> GetTeammateMessageBubble() const property
    {
        this.TrackPropertyRead(4);
        return this.m_TeammateMessageBubble;
    }
    void SetTeammateMessageBubble(const TEUIModelRef<FVM_TeammateMessageBubbleManager> &inout __Value) property
    {
        TEUIModelRef<FVM_TeammateMessageBubbleManager> local_2;
        local_2 = this.m_TeammateMessageBubble;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TeammateMessageBubble = __Value;
        return;
    }
    TEUIModelRef<FVM_Index> GetIndex() const property
    {
        this.TrackPropertyRead(5);
        return this.m_Index;
    }
    void SetIndex(const TEUIModelRef<FVM_Index> &inout __Value) property
    {
        TEUIModelRef<FVM_Index> local_2;
        local_2 = this.m_Index;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_Index = __Value;
        return;
    }
    TEUIModelRef<FM_Player> GetPlayer() const property
    {
        this.TrackPropertyRead(6);
        return this.m_Player;
    }
    void SetPlayer(const TEUIModelRef<FM_Player> &inout __Value) property
    {
        TEUIModelRef<FM_Player> local_2;
        local_2 = this.m_Player;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_Player = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerBasicItem> GetPlayerBasicItem() const property
    {
        this.TrackPropertyRead(7);
        return this.m_PlayerBasicItem;
    }
    void SetPlayerBasicItem(const TEUIModelRef<FVM_PlayerBasicItem> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerBasicItem> local_2;
        local_2 = this.m_PlayerBasicItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_PlayerBasicItem = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerBasicItemExtend> GetPlayerBasicItemExtend() const property
    {
        this.TrackPropertyRead(8);
        return this.m_PlayerBasicItemExtend;
    }
    void SetPlayerBasicItemExtend(const TEUIModelRef<FVM_PlayerBasicItemExtend> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerBasicItemExtend> local_2;
        local_2 = this.m_PlayerBasicItemExtend;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_PlayerBasicItemExtend = __Value;
        return;
    }
    const FCommonHoverHandle GetHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FCommonHoverHandle GetModify_HoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        return;
    }
    const FFPTime GetHoverOpenTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FFPTime GetModify_HoverOpenTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetHoverOpenTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_HoverOpenTime = __Value;
        return;
    }
    const FFPTime GetHoverAutoCloseDelay() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FFPTime GetModify_HoverAutoCloseDelay() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetHoverAutoCloseDelay(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_HoverAutoCloseDelay = __Value;
        return;
    }
    TEUIModelRef<FVM_BtnOperationList> GetHoverListModel() const property
    {
        this.TrackPropertyRead(12);
        return this.m_HoverListModel;
    }
    void SetHoverListModel(const TEUIModelRef<FVM_BtnOperationList> &inout __Value) property
    {
        TEUIModelRef<FVM_BtnOperationList> local_2;
        local_2 = this.m_HoverListModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_HoverListModel = __Value;
        return;
    }
    uint GetPendingKickMemberTargetUid() const property
    {
        this.TrackPropertyRead(13);
        return this.m_PendingKickMemberTargetUid;
    }
    void SetPendingKickMemberTargetUid(const uint __Value) property
    {
        if (this.m_PendingKickMemberTargetUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_PendingKickMemberTargetUid = __Value;
        return;
    }
    uint GetPendingSetCaptainTargetUid() const property
    {
        this.TrackPropertyRead(14);
        return this.m_PendingSetCaptainTargetUid;
    }
    void SetPendingSetCaptainTargetUid(const uint __Value) property
    {
        if (this.m_PendingSetCaptainTargetUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_PendingSetCaptainTargetUid = __Value;
        return;
    }
    bool GetbIsMuted() const property
    {
        this.TrackPropertyRead(15);
        return this.m_bIsMuted;
    }
    void SetbIsMuted(const bool __Value) property
    {
        if (!(this.m_bIsMuted) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_bIsMuted = __Value;
        return;
    }
    bool GetbIsSpeaking() const property
    {
        this.TrackPropertyRead(16);
        return this.m_bIsSpeaking;
    }
    void SetbIsSpeaking(const bool __Value) property
    {
        if (!(this.m_bIsSpeaking) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_bIsSpeaking = __Value;
        return;
    }
    const FEUITimerHandle GetSpeakingPollTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    FEUITimerHandle GetModify_SpeakingPollTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetSpeakingPollTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_SpeakingPollTimer = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TeammateInfo
{
    UPROPERTY()
    int TeamMemberDisplaySequenceNum;
    UPROPERTY()
    bool IsSelf;
    UPROPERTY()
    bool IsCaptain;
    UPROPERTY()
    bool IsSocialTeam;
    UPROPERTY()
    bool IsCombatTeam;
    UPROPERTY()
    bool IsTaunting;
    UPROPERTY()
    bool IsNearDeath;
    UPROPERTY()
    bool IsDead;
    UPROPERTY()
    ESlateVisibility ShowSkillHint;
    UPROPERTY()
    FEUIInputAction ShowSkillHintIA;
    UPROPERTY()
    bool IsDeadOrNearDeath;
    UPROPERTY()
    bool IsAlive;
    UPROPERTY()
    bool IsNotDead;
    UPROPERTY()
    int StatusIndex;
    UPROPERTY()
    float32 NearDeathBarPercent;
    UPROPERTY()
    bool ShouldDisplayPlayerSocialStatus;
    UPROPERTY()
    FText IndexText;
    UPROPERTY()
    TEUIModelRef<FVM_TeammateInfo> Self;


}

namespace FVM_TeammateInfo
{
TArray<TEUIModelRef<FVM_TeammateInfo>> CreateTeammatesFromSocialTeam(const UObject ContextObject, const TEUIModelRef<FM_SocialTeam> &inout SocialTeam)
{
    TArray<TEUIModelRef<FVM_TeammateInfo>> local_4;
    if (!(SocialTeam.IsValid()))
    {
        return local_4;
    }
    for (auto& local_20 : SocialTeam.opArrow().GetMembers())
    {
        local_4.Add(TEUIModelRef<FVM_TeammateInfo>(FVM_TeammateInfo::Create(ContextObject, local_20)));
    }
    return local_4;
}
TArray<TEUIModelRef<FVM_TeammateInfo>> CreateTeammatesFromCombatTeam(const UObject ContextObject, const TEUIModelRef<FM_CombatTeam> &inout CombatTeam)
{
    TArray<TEUIModelRef<FVM_TeammateInfo>> local_4;
    if (!(CombatTeam.IsValid()))
    {
        return local_4;
    }
    for (auto& local_20 : CombatTeam.opArrow().GetMembers())
    {
        local_4.Add(TEUIModelRef<FVM_TeammateInfo>(FVM_TeammateInfo::Create(ContextObject, local_20)));
    }
    return local_4;
}
FVM_TeammateInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_TeamMember> &inout TeamMember)
{
    return FVM_TeammateInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), TeamMember);
}
FVM_TeammateInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_TeamMember> &inout TeamMember)
{
    FVM_TeammateInfo __r;
    TEUIModelRef<FVM_TeammateInfo> local_6 = TEUIModelRef<FVM_TeammateInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TeammateInfo::ModelId, 0, TeamMember));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_TeammateInfo;
}
void __OnClientVOXStateChanged(FVM_TeammateInfo &inout Model, const FECSEntity &inout Entity, const FCS_ClientVOXState &inout Component)
{
    Get local_4;
    Model.OnClientVOXStateChanged(local_4.opCall());
    return;
}
void __Tick(FVM_TeammateInfo &inout Model)
{
    Model.Tick();
    return;
}
void __OnTeamPanelShoulderReleased(FVM_TeammateInfo &inout Model, const FMsg_TeamPanelShoulderReleased &inout Message)
{
    Model.OnTeamPanelShoulderReleased(Message);
    return;
}
void __OnHoverListModelHoverStateChanged(FVM_TeammateInfo &inout Model)
{
    Model.OnHoverListModelHoverStateChanged();
    return;
}
void __OnTeamMemberIndexChanged(FVM_TeammateInfo &inout Model)
{
    Model.OnTeamMemberIndexChanged();
    return;
}
void __OnTeamMemberPlayerChanged(FVM_TeammateInfo &inout Model)
{
    Model.OnTeamMemberPlayerChanged();
    return;
}
void __OnPlayerLevelAttrChanged(FVM_TeammateInfo &inout Model)
{
    Model.OnPlayerLevelAttrChanged();
    return;
}
void __OnPlayerDivineSkillAttrChanged(FVM_TeammateInfo &inout Model)
{
    Model.OnPlayerDivineSkillAttrChanged();
    return;
}
void __OnPlayerCurrentAvatarAttrChanged(FVM_TeammateInfo &inout Model)
{
    Model.OnPlayerCurrentAvatarAttrChanged();
    return;
}
void __OnPlayerNickNameAttrChanged(FVM_TeammateInfo &inout Model)
{
    Model.OnPlayerNickNameAttrChanged();
    return;
}
void __OnPlayerIsOnlineAttrChanged(FVM_TeammateInfo &inout Model)
{
    Model.OnPlayerIsOnlineAttrChanged();
    return;
}
void __OnLocalPlayerLevelRefresh(FVM_TeammateInfo &inout Model, const FMsg_LocalPlayerLevelRefresh &inout Message)
{
    Model.OnLocalPlayerLevelRefresh(Message);
    return;
}
void __HandlePlayerEntityChanged(FVM_TeammateInfo &inout Model, const FMsg_PlayerEntityChanged &inout Message)
{
    Model.HandlePlayerEntityChanged(Message);
    return;
}
void __HandlePlayerPawnEntityChanged(FVM_TeammateInfo &inout Model, const FMsg_PlayerPawnEntityChanged &inout Message)
{
    Model.HandlePlayerPawnEntityChanged(Message);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TEUIModelRef<FVM_PlayerInfo> __UIGetter_PlayerInfo(const FVM_TeammateInfo &inout Model)
{
    return Model.GetPlayerInfo();
}
TEUIModelRef<FVM_PlayerHpBar> __UIGetter_PlayerHpBar(const FVM_TeammateInfo &inout Model)
{
    return Model.GetPlayerHpBar();
}
TEUIModelRef<FVM_BuffInfo> __UIGetter_PlayerBuffInfo(const FVM_TeammateInfo &inout Model)
{
    return Model.GetPlayerBuffInfo();
}
TEUIModelRef<FVM_TeammateMessageBubbleManager> __UIGetter_TeammateMessageBubble(const FVM_TeammateInfo &inout Model)
{
    return Model.GetTeammateMessageBubble();
}
TEUIModelRef<FVM_Index> __UIGetter_Index(const FVM_TeammateInfo &inout Model)
{
    return Model.GetIndex();
}
TEUIModelRef<FVM_PlayerBasicItem> __UIGetter_PlayerBasicItem(const FVM_TeammateInfo &inout Model)
{
    return Model.GetPlayerBasicItem();
}
TEUIModelRef<FVM_PlayerBasicItemExtend> __UIGetter_PlayerBasicItemExtend(const FVM_TeammateInfo &inout Model)
{
    return Model.GetPlayerBasicItemExtend();
}
bool __UIGetter_bIsMuted(const FVM_TeammateInfo &inout Model)
{
    return Model.GetbIsMuted();
}
bool __UIGetter_bIsSpeaking(const FVM_TeammateInfo &inout Model)
{
    return Model.GetbIsSpeaking();
}
int __UIGetter_TeamMemberDisplaySequenceNum(const FVM_TeammateInfo &inout Model)
{
    return Model.GetTeamMemberDisplaySequenceNum();
}
bool __UIGetter_IsSelf(const FVM_TeammateInfo &inout Model)
{
    return Model.IsSelf();
}
bool __UIGetter_IsCaptain(const FVM_TeammateInfo &inout Model)
{
    return Model.IsCaptain();
}
bool __UIGetter_IsSocialTeam(const FVM_TeammateInfo &inout Model)
{
    return Model.IsSocialTeam();
}
bool __UIGetter_IsCombatTeam(const FVM_TeammateInfo &inout Model)
{
    return Model.IsCombatTeam();
}
bool __UIGetter_IsTaunting(const FVM_TeammateInfo &inout Model)
{
    return Model.IsTaunting();
}
bool __UIGetter_IsNearDeath(const FVM_TeammateInfo &inout Model)
{
    return Model.IsNearDeath();
}
bool __UIGetter_IsDead(const FVM_TeammateInfo &inout Model)
{
    return Model.IsDead();
}
ESlateVisibility __UIGetter_ShowSkillHint(const FVM_TeammateInfo &inout Model)
{
    return Model.GetShowSkillHint();
}
FEUIInputAction __UIGetter_ShowSkillHintIA(const FVM_TeammateInfo &inout Model)
{
    return Model.GetShowSkillHintIA();
}
bool __UIGetter_IsDeadOrNearDeath(const FVM_TeammateInfo &inout Model)
{
    return Model.IsDeadOrNearDeath();
}
bool __UIGetter_IsAlive(const FVM_TeammateInfo &inout Model)
{
    return Model.IsAlive();
}
bool __UIGetter_IsNotDead(const FVM_TeammateInfo &inout Model)
{
    return Model.IsNotDead();
}
int __UIGetter_StatusIndex(const FVM_TeammateInfo &inout Model)
{
    return Model.GetStatusIndex();
}
float32 __UIGetter_NearDeathBarPercent(const FVM_TeammateInfo &inout Model)
{
    return Model.GetNearDeathBarPercent();
}
bool __UIGetter_ShouldDisplayPlayerSocialStatus(const FVM_TeammateInfo &inout Model)
{
    return Model.ShouldDisplayPlayerSocialStatus();
}
FText __UIGetter_IndexText(const FVM_TeammateInfo &inout Model)
{
    return Model.GetIndexText();
}
TEUIModelRef<FVM_TeammateInfo> __UIGetter_Self(const FVM_TeammateInfo &inout Model)
{
    return TEUIModelRef<FVM_TeammateInfo>(Model);
}
int __IndexOf_TeamMember()
{
    return 0;
}
int __IndexOf_PlayerInfo()
{
    return 1;
}
int __IndexOf_PlayerHpBar()
{
    return 2;
}
int __IndexOf_PlayerBuffInfo()
{
    return 3;
}
int __IndexOf_TeammateMessageBubble()
{
    return 4;
}
int __IndexOf_Index()
{
    return 5;
}
int __IndexOf_Player()
{
    return 6;
}
int __IndexOf_PlayerBasicItem()
{
    return 7;
}
int __IndexOf_PlayerBasicItemExtend()
{
    return 8;
}
int __IndexOf_HoverHandle()
{
    return 9;
}
int __IndexOf_HoverOpenTime()
{
    return 10;
}
int __IndexOf_HoverAutoCloseDelay()
{
    return 11;
}
int __IndexOf_HoverListModel()
{
    return 12;
}
int __IndexOf_PendingKickMemberTargetUid()
{
    return 13;
}
int __IndexOf_PendingSetCaptainTargetUid()
{
    return 14;
}
int __IndexOf_bIsMuted()
{
    return 15;
}
int __IndexOf_bIsSpeaking()
{
    return 16;
}
int __IndexOf_SpeakingPollTimer()
{
    return 17;
}
}
namespace __GeneratedProperties_FVM_TeammateInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
