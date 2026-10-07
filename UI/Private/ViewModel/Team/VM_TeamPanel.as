
enum ETeamOtherPlayerOperatorType
{
    ViewInfo,
    SetCaptain,
    KickMember,
    Mute,
}

enum ETeamOperatorBtnType
{
    InviteTeam,
    MuteTeam,
    SpeakInTeam,
    LeaveTeam,
    InviteTeamIntoDS,
    MAX,
}

enum ETeamListenState
{
    NotListen,
    ListenSocialTeam,
    ListenCombatTeam,
    ListenCurrent,
}

enum ETeamSpeakState
{
    NotSpeak,
    SpeakSocialTeam,
    SpeakCombatTeam,
    SpeakCurrent,
}

namespace FVM_TeamPanel
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature InviteTeam = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature InviteTeamIntoDS = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature LeaveTeam = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature LeaveTeamComfirm = FEUIModelCallbackSignature();

}
struct FMsg_TeamPanelShoulderReleased : FEUIMessage
{
    FMsg_TeamPanelShoulderReleased()
    {
        return;
    }
}

struct FMsg_TeamTypeChanged : FEUIMessage
{
    FMsg_TeamTypeChanged()
    {
        return;
    }
}

struct FVM_TeamPanel : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TeammateInfo>> m_DisplayingTeammates;
    UPROPERTY()
    TEUIModelRef<FVM_TeamPanelTypeItem> m_SocialTeamTypeItem;
    UPROPERTY()
    TEUIModelRef<FVM_TeamPanelTypeItem> m_CombatTeamTypeItem;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TeamOperatorBtnItem>> m_TeamOperatorBtns;
    UPROPERTY()
    ETeamType m_SelectedTeamType;
    UPROPERTY()
    ETeamListenState m_ListenState;
    UPROPERTY()
    ETeamSpeakState m_SpeakState;
    UPROPERTY()
    TEUIModelRef<FM_SocialTeam> m_SocialTeam;
    UPROPERTY()
    TEUIModelRef<FM_CombatTeam> m_CombatTeam;
    UPROPERTY()
    bool m_bGamepadLeftShoulderPress;
    UPROPERTY()
    bool m_bIsSelfSpeaking;
    UPROPERTY()
    FEUITimerHandle m_SelfSpeakingPollTimer;

    FVM_TeamPanel()
    {
        this.m_SelectedTeamType = ETeamType(0);
        this.m_ListenState = ETeamListenState(1);
        this.m_SpeakState = ETeamSpeakState(0);
        this.m_bGamepadLeftShoulderPress = false;
        this.m_bIsSelfSpeaking = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_TeamPanel(const FVM_TeamPanel &inout Other)
    {
        this.m_SelectedTeamType = ETeamType(0);
        this.m_ListenState = ETeamListenState(1);
        this.m_SpeakState = ETeamSpeakState(0);
        this.m_bGamepadLeftShoulderPress = false;
        this.m_bIsSelfSpeaking = false;
        this.m_DisplayingTeammates = Other.m_DisplayingTeammates;
        this.m_SocialTeamTypeItem = Other.m_SocialTeamTypeItem;
        this.m_CombatTeamTypeItem = Other.m_CombatTeamTypeItem;
        this.m_TeamOperatorBtns = Other.m_TeamOperatorBtns;
        this.m_SelectedTeamType = Other.m_SelectedTeamType;
        this.m_ListenState = Other.m_ListenState;
        this.m_SpeakState = Other.m_SpeakState;
        this.m_SocialTeam = Other.m_SocialTeam;
        this.m_CombatTeam = Other.m_CombatTeam;
        this.m_bGamepadLeftShoulderPress = Other.m_bGamepadLeftShoulderPress;
        this.m_bIsSelfSpeaking = Other.m_bIsSelfSpeaking;
        this.m_SelfSpeakingPollTimer = Other.m_SelfSpeakingPollTimer;
        return;
    }
    FVM_TeamPanel& opAssign(const FVM_TeamPanel &inout Other)
    {
        this.m_DisplayingTeammates = Other.m_DisplayingTeammates;
        this.m_SocialTeamTypeItem = Other.m_SocialTeamTypeItem;
        this.m_CombatTeamTypeItem = Other.m_CombatTeamTypeItem;
        this.m_TeamOperatorBtns = Other.m_TeamOperatorBtns;
        this.m_SelectedTeamType = Other.m_SelectedTeamType;
        this.m_ListenState = Other.m_ListenState;
        this.m_SpeakState = Other.m_SpeakState;
        this.m_SocialTeam = Other.m_SocialTeam;
        this.m_CombatTeam = Other.m_CombatTeam;
        this.m_bGamepadLeftShoulderPress = Other.m_bGamepadLeftShoulderPress;
        this.m_bIsSelfSpeaking = Other.m_bIsSelfSpeaking;
        return Other.m_SelfSpeakingPollTimer;
    }
    bool HasAnyTeam() const
    {
        return this.HasSocialTeam() || this.HasCombatTeam();
    }
    bool HasMultipleTeams() const
    {
        return this.GetSocialTeam().IsValid() && this.GetCombatTeam().IsValid();
    }
    bool HasSocialTeam() const
    {
        return this.GetSocialTeam().IsValid();
    }
    bool HasCombatTeam() const
    {
        return this.GetCombatTeam().IsValid();
    }
    void PollSelfSpeakingState()
    {
        int local_10 = 0;
        int local_11 = 0;
        bool local_1 = false;
        if (UKLVOXBridge::IsVOXInitialized())
        {
            FECSWorldPtr local_4 = ECS::GetECSWorld();
            if (local_10)
            {
                if (!(local_10.LocalSocialRoomId.IsEmpty()) && this.HasOtherMembersInTeam(ETeamType(1)))
                {
                    local_11 = FMath::Max(0, UKLVOXBridge::GetSendStreamLevel(local_10.LocalSocialRoomId));
                }
                if (!(local_10.LocalBattleRoomId.IsEmpty()) && this.HasOtherMembersInTeam(ETeamType(2)))
                {
                    local_11 = FMath::Max(local_11, UKLVOXBridge::GetSendStreamLevel(local_10.LocalBattleRoomId));
                }
                local_1 = (local_11 > 3);
            }
        }
        this.SetbIsSelfSpeaking(local_1);
        return;
    }
    bool HasOtherMembersInTeam(const ETeamType InTeamType) const
    {
        if (int(InTeamType) == 1)
        {
            bool local_3 = this.GetSocialTeam().IsValid();
            if (!(local_3))
            {
                local_3 = false;
            }
            else
            {
                TEUIModelRef<FM_SocialTeam> local_6 = this.GetSocialTeam();
                local_3 = (GetMembers().Num() > 1);
            }
            return local_3;
        }
        if (int(InTeamType) == 2)
        {
            bool local_7;
            local_7 = this.GetCombatTeam().IsValid();
            if (!(local_7))
            {
                local_7 = false;
            }
            else
            {
                TEUIModelRef<FM_CombatTeam> local_10 = this.GetCombatTeam();
                local_7 = (GetMembers().Num() > 1);
            }
            return local_7;
        }
        return false;
    }
    bool IsCombatTeam() const
    {
        return this.HasCombatTeam() && (int(this.GetTeamType()) == 2);
    }
    bool IsSocialTeam() const
    {
        return this.HasSocialTeam() && (int(this.GetTeamType()) == 1);
    }
    float32 GetTeamLinkEnergyPercent() const
    {
        return 0.0f;
    }
    FText GetLinkOrExecuteBuffText() const
    {
        if (!(this.IsCombatTeam()))
        {
            return FText();
        }
        if (this.HasExecuteBuff())
        {
            return NSLOCTEXT("ExecuteBuffText", "Divine Burst");
        }
        return FText::Format(NSLOCTEXT("LinkBuffText", "Sync {0}%"), 0);
    }
    bool HasExecuteBuff() const
    {
        const UUtilitySettings local_4;
        if (!(this.IsCombatTeam()))
        {
            return false;
        }
        GetGameplaySettings<UUtilitySettings> local_6;
        local_4 = local_6;
        return FBuffUtils::HasBuff(this.GetContext().GetLocalPlayerPawn(), local_4.ExecuteBuffRef);
    }
    float32 GetExecuteBuffDurationPercentage() const
    {
        const UUtilitySettings local_4;
        int local_14 = 0;
        if (!(this.HasExecuteBuff()))
        {
            return 0.0f;
        }
        GetGameplaySettings<UUtilitySettings> local_6;
        local_4 = local_6;
        FBuffUtils::GetBuffInstance(this.GetContext().GetLocalPlayerPawn(), local_4.ExecuteBuffRef);
        if (!(local_14) || ((FFPTime(local_14.GetDuration()).opCmp(0.0) <= 0)))
        {
            return 0.0f;
        }
        FFPTime local_22 = (local_14.GetEndTime() - this.GetContext().Time);
        return FMath::Max(0.0f, float32((local_22 / local_14.GetDuration())));
    }
    bool HasFirstExecuteBuff() const
    {
        return (this.GetExecuteBuffStackCount() >= 1);
    }
    bool HasSecondExecuteBuff() const
    {
        return (this.GetExecuteBuffStackCount() >= 2);
    }
    bool HasThirdExecuteBuff() const
    {
        return (this.GetExecuteBuffStackCount() >= 3);
    }
    bool CanLeaveTeam() const
    {
        if (this.IsCombatTeam() && (int(::FTeamUtils::GetCombatTeamRule()) == 2))
        {
            return false;
        }
        bool local_1 = this.GetSocialTeam().IsValid();
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            TEUIModelRef<FM_SocialTeam> local_8 = this.GetSocialTeam();
            local_1 = (GetMembers().Num() <= 1);
        }
        if (local_1)
        {
            return false;
        }
        return true;
    }
    bool CanInvitationTeam() const
    {
        if (!(::FTeamUtils::GetIsInCityTeamState()))
        {
            return false;
        }
        if (this.IsSocialTeam() && (int(::FTeamUtils::GetCombatTeamRule()) == 2))
        {
            return false;
        }
        ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData();
        if (::FMS_LocalPlayerTeamData::Get(this.GetManager()).GetTeamMemberCount(ETeamType(1)) >= ::FSocialTeamUtils::GetMaxSocialMember())
        {
            return false;
        }
        return true;
    }
    bool CanInvitationTeamIntoDS() const
    {
        if (!(::FTeamUtils::GetIsInCityTeamState()))
        {
            return false;
        }
        if (this.IsSocialTeam() && (int(::FTeamUtils::GetCombatTeamRule()) == 2))
        {
            return false;
        }
        return true;
    }
    void InviteTeam()
    {
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_TeamInvitation);
        return;
    }
    void InviteTeamIntoDS()
    {
        ::FMS_FriendDataModel::Get(this.GetContext().UELocalPlayer).GS_AllTeammerAssembleReq();
        return;
    }
    void LeaveTeam()
    {
        if (!(this.CanLeaveTeam()))
        {
            return;
        }
        if (int(this.GetTeamType()) == 1)
        {
            this.LeaveTeamOpenDialog();
            return;
        }
        if ((int(this.GetTeamType())) == 2)
        {
            ECombatTeamRule local_5 = ::FTeamUtils::GetCombatTeamRule();
            int local_3 = int(local_5);
            if (local_3 <= 1)
            {
                if (local_3 != 1)
                {
                }
                else
                {
                    this.LeaveTeamOpenDialog();
                    return;
                }
            }
            XError(ELog(16), FString().Append("Invalid combat team rule for leaving team: ").Append(::FTeamUtils::GetCombatTeamRule()));
        }
        return;
    }
    bool LeaveTeamComfirm(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            ::FSocialTeamUtils::ClientSendLeaveTeam(this.GetContext().GetLocalPlayer());
        }
        return true;
    }
    void LeaveTeamOpenDialog()
    {
        FDialogModelCallback local_26;
        local_26.Bind(this, FVM_TeamPanel::LeaveTeamComfirm);
        FText local_30 = NSLOCTEXT("Cook", "TeamESCCancle", "иї”е›ћ");
        FText local_34 = NSLOCTEXT("Cook", "TeamESCConfirm", "зЎ®и®¤");
        FDialogCallback local_66 = FDialogCallback(local_26);
        FText local_70 = NSLOCTEXT("Cook", "TeamESCMessage", "жЇеђ¦зЎ®и®¤йЂЂе‡єйџдјЌ?");
        FText local_74 = NSLOCTEXT("Cook", "TeamESCTitle", "жЏђз¤є");
        FCommonDialogParam local_76;
        ::CommonPopup::Dialog_Decision(local_74, local_70, local_66, local_34, local_30, local_76);
        return;
    }
    void PostConstruct()
    {
        this.SetSocialTeamTypeItem(TEUIModelRef<FVM_TeamPanelTypeItem>(::FVM_TeamPanelTypeItem::Create(this.GetContext().Manager, (TEUIModelWeakRef<FVM_TeamPanel>(this)), ETeamType(1))));
        this.SetCombatTeamTypeItem(TEUIModelRef<FVM_TeamPanelTypeItem>(::FVM_TeamPanelTypeItem::Create(this.GetContext().Manager, (TEUIModelWeakRef<FVM_TeamPanel>(this)), ETeamType(2))));
        this.RefreshCachedTeamRefs();
        this.UpdateDefaultTeamType();
        this.SyncVoiceStateFromBackend();
        this.RefreshDisplayingTeammates();
        this.ScheduleTick(this.GetModify_SelfSpeakingPollTimer(), n"PollSelfSpeakingState", 0.2f, -1.0f);
        return;
    }
    void BeginDestroy()
    {
        this.ClearTimer(this.GetModify_SelfSpeakingPollTimer());
        return;
    }
    void OnSelectedTeamTypeChanged()
    {
        this.RefreshDisplayingTeammates();
        return;
    }
    void HandleSocialTeamChanged(const FMsg_SocialTeamChanged &inout Msg)
    {
        this.RefreshCachedTeamRefs();
        this.SyncVoiceStateFromBackend();
        return;
    }
    void HandleSocialTeamMemberChanged(const FMsg_SocialTeamMemberChanged &inout Msg)
    {
        if ((int(this.GetTeamType())) == 1)
        {
            this.RefreshDisplayingTeammates();
        }
        return;
    }
    void HandleCombatTeamChanged(const FMsg_CombatTeamChanged &inout Msg)
    {
        this.RefreshCachedTeamRefs();
        return;
    }
    void HandleCombatTeamMemberChanged(const FMsg_CombatTeamMemberChanged &inout Msg)
    {
        if ((int(this.GetTeamType())) == 2)
        {
            this.RefreshDisplayingTeammates();
        }
        return;
    }
    void OnVOXModeRestored(const FCE_VOXModeRestored &inout Event)
    {
        this.SyncVoiceStateFromBackend();
        this.NotifyVoiceBtnsChanged();
        return;
    }
    void InvalidateEntityCache()
    {
        this.RefreshCachedTeamRefs();
        this.UpdateDefaultTeamType();
        this.SyncVoiceStateFromBackend();
        return;
    }
    void UpdateDefaultTeamType()
    {
        if ((int(::FLevelUtils::GetCurrentLevelType())) == 3 || (int(::FLevelUtils::GetCurrentLevelType()) == 5))
        {
            this.SetTeamType(ETeamType(2));
            return;
        }
        this.SetTeamType(ETeamType(1));
        return;
    }
    void RefreshDisplayingTeammates()
    {
        if (int(this.GetTeamType()) == 1)
        {
            this.SetDisplayingTeammates(::FVM_TeammateInfo::CreateTeammatesFromSocialTeam(this.GetContext().Manager, this.GetSocialTeam()));
        }
        else
        {
            if (int(this.GetTeamType()) == 2)
            {
                this.SetDisplayingTeammates(::FVM_TeammateInfo::CreateTeammatesFromCombatTeam(this.GetContext().Manager, this.GetCombatTeam()));
            }
            else
            {
                this.GetModify_DisplayingTeammates().Empty(0);
            }
        }
        this.UpdateTeamOperactorBtnList();
        return;
    }
    void RefreshCachedTeamRefs()
    {
        this.SetSocialTeam(::FMS_PlayerSocialTeamData::Get(this.GetContext().Manager).GetLocalPlayerTeam());
        if (::FTeamUtils::GetIsInCityTeamState())
        {
            this.SetCombatTeam(TEUIModelRef<FM_CombatTeam>(nullptr));
            return;
        }
        this.SetCombatTeam(::FMS_PlayerCombatTeamData::Get(this.GetContext().Manager).GetLocalPlayerCombatTeam());
        return;
    }
    void OnSocialTeamRefChanged()
    {
        this.UpdateDefaultTeamType();
        this.RefreshDisplayingTeammates();
        return;
    }
    void OnCombatTeamRefChanged()
    {
        this.UpdateDefaultTeamType();
        this.RefreshDisplayingTeammates();
        return;
    }
    int GetExecuteBuffStackCount() const
    {
        const UUtilitySettings local_4;
        if (!(this.HasExecuteBuff()))
        {
            return 0;
        }
        GetGameplaySettings<UUtilitySettings> local_6;
        local_4 = local_6;
        return FBuffUtils::GetBuffInstance(this.GetContext().GetLocalPlayerPawn(), local_4.ExecuteBuffRef).GetStackCount();
    }
    bool HasSocialTeamOtherMembers() const
    {
        if (::FMS_PlayerSocialTeamData::Get(this.GetContext().Manager).IsLocalPlayerInTeam())
        {
            TEUIModelRef<FM_SocialTeam> local_4 = this.GetSocialTeam();
            return (GetMembers().Num() > 1);
        }
        return false;
    }
    ETeamType GetTeamType() const property
    {
        bool local_2 = this.HasSocialTeam();
        bool local_1 = this.HasCombatTeam();
        if ((local_2 && local_1))
        {
            return this.GetSelectedTeamType();
        }
        if (local_2)
        {
            return ETeamType(1);
        }
        if (local_1)
        {
            return ETeamType(2);
        }
        return ETeamType(0);
    }
    void SetTeamType(const ETeamType InTeamType) property
    {
        this.SetSelectedTeamType(ETeamType(InTeamType));
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_6);
        return;
    }
    EVOXVoiceMode ListenStateToVoiceMode(const ETeamListenState State) const
    {
        int local_1 = int(State);
        if (local_1 <= 2)
        {
            if (local_1 != 1)
            {
                if (local_1 != 2)
                {
                }
            }
            else
            {
                return EVOXVoiceMode(0);
            }
        }
        return EVOXVoiceMode(2);
    }
    EVOXVoiceMode SpeakStateToVoiceMode(const ETeamSpeakState State) const
    {
        int local_1 = int(State);
        if (local_1 <= 2)
        {
            if (local_1 != 1)
            {
                if (local_1 != 2)
                {
                }
            }
            else
            {
                return EVOXVoiceMode(0);
            }
        }
        return EVOXVoiceMode(2);
    }
    ETeamListenState VoiceModeToListenState(const EVOXVoiceMode Mode) const
    {
        int local_1 = int(Mode);
        if (local_1 <= 1)
        {
            if (local_1 != 0)
            {
                if (local_1 != 1)
                {
                }
            }
            else
            {
                return ETeamListenState(1);
            }
        }
        return ETeamListenState(0);
    }
    ETeamSpeakState VoiceModeToSpeakState(const EVOXVoiceMode Mode) const
    {
        int local_1 = int(Mode);
        if (local_1 <= 1)
        {
            if (local_1 != 0)
            {
                if (local_1 != 1)
                {
                }
            }
            else
            {
                return ETeamSpeakState(1);
            }
        }
        return ETeamSpeakState(0);
    }
    void SetListenStateDirect(const ETeamListenState NewState)
    {
        if ((int(this.GetListenState())) == (int(NewState)))
        {
            return;
        }
        this.SetListenState(ETeamListenState(NewState));
        ::VOXUtils::SetSpeakerMode(this.ListenStateToVoiceMode(ETeamListenState(this.GetListenState())));
        this.NotifyVoiceBtnsChanged();
        return;
    }
    void SetSpeakStateDirect(const ETeamSpeakState NewState)
    {
        if ((int(this.GetSpeakState())) == (int(NewState)))
        {
            return;
        }
        this.SetSpeakState(ETeamSpeakState(NewState));
        ::VOXUtils::SetMicMode(this.SpeakStateToVoiceMode(ETeamSpeakState(this.GetSpeakState())));
        this.NotifyVoiceBtnsChanged();
        return;
    }
    bool IsSpecialMapForVoice() const
    {
        if (::FTeamUtils::GetIsInCityTeamState())
        {
            return true;
        }
        return !(this.HasMultipleTeams());
    }
    void CycleListenState()
    {
        int local_6;
        int local_2 = int(this.GetToggleListenTarget());
        if ((int(this.GetListenState())) == 0)
        {
            local_6 = local_2;
        }
        else
        {
            local_6 = ETeamListenState(0);
        }
        this.SetListenState(ETeamListenState(local_6));
        ::VOXUtils::SetSpeakerMode(this.ListenStateToVoiceMode(ETeamListenState(this.GetListenState())));
        this.NotifyVoiceBtnsChanged();
        return;
    }
    void CycleSpeakState()
    {
        int local_6;
        int local_2 = int(this.GetToggleSpeakTarget());
        if ((int(this.GetSpeakState())) == 0)
        {
            local_6 = local_2;
        }
        else
        {
            local_6 = ETeamSpeakState(0);
        }
        this.SetSpeakState(ETeamSpeakState(local_6));
        ::VOXUtils::SetMicMode(this.SpeakStateToVoiceMode(ETeamSpeakState(this.GetSpeakState())));
        this.NotifyVoiceBtnsChanged();
        return;
    }
    ETeamListenState GetToggleListenTarget() const
    {
        if (::FTeamUtils::GetIsInCityTeamState())
        {
            return ETeamListenState(1);
        }
        return ETeamListenState(2);
    }
    ETeamSpeakState GetToggleSpeakTarget() const
    {
        if (::FTeamUtils::GetIsInCityTeamState())
        {
            return ETeamSpeakState(1);
        }
        return ETeamSpeakState(2);
    }
    void SyncVoiceStateFromBackend()
    {
        this.SetListenState(this.VoiceModeToListenState(::VOXUtils::GetSpeakerMode()));
        this.SetSpeakState(this.VoiceModeToSpeakState(::VOXUtils::GetMicMode()));
        return;
    }
    void NotifyShoulderReleased()
    {
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_6);
        return;
    }
    void NotifyVoiceBtnsChanged()
    {
        for (auto& local_16 : this.GetTeamOperatorBtns())
        {
            local_16;
            if ((int(GetButtonType())) == 1 || (int(GetButtonType()) == 2))
            {
                NotifyVoiceStateChanged();
            }
        }
        return;
    }
    void UpdateTeamOperactorBtnList()
    {
        this.GetModify_TeamOperatorBtns().Empty(0);
        if (this.CanInvitationTeam())
        {
            TEUIModelRef<FVM_TeamOperatorBtnItem> local_8 = TEUIModelRef<FVM_TeamOperatorBtnItem>(::FVM_TeamOperatorBtnItem::Create(this.GetContext().Manager, (TEUIModelWeakRef<FVM_TeamPanel>(this)), ETeamOperatorBtnType(0)));
            this.GetModify_TeamOperatorBtns().Add(local_8);
        }
        if (this.CanInvitationTeamIntoDS())
        {
            TEUIModelRef<FVM_TeamOperatorBtnItem> local_8_2 = TEUIModelRef<FVM_TeamOperatorBtnItem>(::FVM_TeamOperatorBtnItem::Create(this.GetContext().Manager, (TEUIModelWeakRef<FVM_TeamPanel>(this)), ETeamOperatorBtnType(4)));
            this.GetModify_TeamOperatorBtns().Add(local_8_2);
        }
        bool local_9 = false;
        if (this.IsSocialTeam())
        {
            TEUIModelRef<FM_SocialTeam> local_12 = this.GetSocialTeam();
            local_9 = (GetMembers().Num() > 1);
        }
        else
        {
            if (this.IsCombatTeam())
            {
                TEUIModelRef<FM_CombatTeam> local_16 = this.GetCombatTeam();
                local_9 = (GetMembers().Num() > 1);
            }
        }
        if (local_9)
        {
            TEUIModelRef<FVM_TeamOperatorBtnItem> local_8_3 = TEUIModelRef<FVM_TeamOperatorBtnItem>(::FVM_TeamOperatorBtnItem::Create(this.GetContext().Manager, (TEUIModelWeakRef<FVM_TeamPanel>(this)), ETeamOperatorBtnType(1)));
            this.GetModify_TeamOperatorBtns().Add(local_8_3);
            TEUIModelRef<FVM_TeamOperatorBtnItem> local_8_4 = TEUIModelRef<FVM_TeamOperatorBtnItem>(::FVM_TeamOperatorBtnItem::Create(this.GetContext().Manager, (TEUIModelWeakRef<FVM_TeamPanel>(this)), ETeamOperatorBtnType(2)));
            this.GetModify_TeamOperatorBtns().Add(local_8_4);
        }
        if (this.CanLeaveTeam())
        {
            TEUIModelRef<FVM_TeamOperatorBtnItem> local_8_5 = TEUIModelRef<FVM_TeamOperatorBtnItem>(::FVM_TeamOperatorBtnItem::Create(this.GetContext().Manager, (TEUIModelWeakRef<FVM_TeamPanel>(this)), ETeamOperatorBtnType(3)));
            this.GetModify_TeamOperatorBtns().Add(local_8_5);
        }
        if (this.GetTeamOperatorBtns().Num() > 0)
        {
            bool local_2 = true;
            int local_1 = this.GetTeamOperatorBtns().Num() - 1;
            local_2.SetbLast();
        }
        return;
    }
    const TArray<TEUIModelRef<FVM_TeammateInfo>> GetDisplayingTeammates() const property
    {
        const TArray<TEUIModelRef<FVM_TeammateInfo>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TeammateInfo>> GetModify_DisplayingTeammates() property
    {
        TArray<TEUIModelRef<FVM_TeammateInfo>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDisplayingTeammates(const TArray<TEUIModelRef<FVM_TeammateInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DisplayingTeammates = __Value;
        return;
    }
    TEUIModelRef<FVM_TeamPanelTypeItem> GetSocialTeamTypeItem() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SocialTeamTypeItem;
    }
    void SetSocialTeamTypeItem(const TEUIModelRef<FVM_TeamPanelTypeItem> &inout __Value) property
    {
        TEUIModelRef<FVM_TeamPanelTypeItem> local_2;
        local_2 = this.m_SocialTeamTypeItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SocialTeamTypeItem = __Value;
        return;
    }
    TEUIModelRef<FVM_TeamPanelTypeItem> GetCombatTeamTypeItem() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CombatTeamTypeItem;
    }
    void SetCombatTeamTypeItem(const TEUIModelRef<FVM_TeamPanelTypeItem> &inout __Value) property
    {
        TEUIModelRef<FVM_TeamPanelTypeItem> local_2;
        local_2 = this.m_CombatTeamTypeItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CombatTeamTypeItem = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TeamOperatorBtnItem>> GetTeamOperatorBtns() const property
    {
        const TArray<TEUIModelRef<FVM_TeamOperatorBtnItem>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TeamOperatorBtnItem>> GetModify_TeamOperatorBtns() property
    {
        TArray<TEUIModelRef<FVM_TeamOperatorBtnItem>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetTeamOperatorBtns(const TArray<TEUIModelRef<FVM_TeamOperatorBtnItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TeamOperatorBtns = __Value;
        return;
    }
    ETeamType GetSelectedTeamType() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SelectedTeamType;
    }
    void SetSelectedTeamType(const ETeamType __Value) property
    {
        if (int(this.m_SelectedTeamType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SelectedTeamType = __Value;
        return;
    }
    ETeamListenState GetListenState() const property
    {
        this.TrackPropertyRead(5);
        return this.m_ListenState;
    }
    void SetListenState(const ETeamListenState __Value) property
    {
        if (int(this.m_ListenState) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ListenState = __Value;
        return;
    }
    ETeamSpeakState GetSpeakState() const property
    {
        this.TrackPropertyRead(6);
        return this.m_SpeakState;
    }
    void SetSpeakState(const ETeamSpeakState __Value) property
    {
        if (int(this.m_SpeakState) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SpeakState = __Value;
        return;
    }
    TEUIModelRef<FM_SocialTeam> GetSocialTeam() const property
    {
        this.TrackPropertyRead(7);
        return this.m_SocialTeam;
    }
    void SetSocialTeam(const TEUIModelRef<FM_SocialTeam> &inout __Value) property
    {
        TEUIModelRef<FM_SocialTeam> local_2;
        local_2 = this.m_SocialTeam;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_SocialTeam = __Value;
        return;
    }
    TEUIModelRef<FM_CombatTeam> GetCombatTeam() const property
    {
        this.TrackPropertyRead(8);
        return this.m_CombatTeam;
    }
    void SetCombatTeam(const TEUIModelRef<FM_CombatTeam> &inout __Value) property
    {
        TEUIModelRef<FM_CombatTeam> local_2;
        local_2 = this.m_CombatTeam;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CombatTeam = __Value;
        return;
    }
    bool GetbGamepadLeftShoulderPress() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bGamepadLeftShoulderPress;
    }
    void SetbGamepadLeftShoulderPress(const bool __Value) property
    {
        if (!(this.m_bGamepadLeftShoulderPress) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bGamepadLeftShoulderPress = __Value;
        return;
    }
    bool GetbIsSelfSpeaking() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bIsSelfSpeaking;
    }
    void SetbIsSelfSpeaking(const bool __Value) property
    {
        if (!(this.m_bIsSelfSpeaking) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bIsSelfSpeaking = __Value;
        return;
    }
    const FEUITimerHandle GetSelfSpeakingPollTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FEUITimerHandle GetModify_SelfSpeakingPollTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetSelfSpeakingPollTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_SelfSpeakingPollTimer = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TeamPanel
{
    UPROPERTY()
    bool HasAnyTeam;
    UPROPERTY()
    bool HasMultipleTeams;
    UPROPERTY()
    bool HasSocialTeam;
    UPROPERTY()
    bool HasCombatTeam;
    UPROPERTY()
    bool IsCombatTeam;
    UPROPERTY()
    bool IsSocialTeam;
    UPROPERTY()
    float32 TeamLinkEnergyPercent;
    UPROPERTY()
    FText LinkOrExecuteBuffText;
    UPROPERTY()
    bool HasExecuteBuff;
    UPROPERTY()
    float32 ExecuteBuffDurationPercentage;
    UPROPERTY()
    bool HasFirstExecuteBuff;
    UPROPERTY()
    bool HasSecondExecuteBuff;
    UPROPERTY()
    bool HasThirdExecuteBuff;
    UPROPERTY()
    bool CanLeaveTeam;
    UPROPERTY()
    bool CanInvitationTeam;
    UPROPERTY()
    bool CanInvitationTeamIntoDS;
    UPROPERTY()
    TEUIModelRef<FVM_TeamPanel> Self;


}

namespace FVM_TeamPanel
{
FVM_TeamPanel& Create(const UObject ContextObject)
{
    return FVM_TeamPanel::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_TeamPanel CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_TeamPanel __r;
    TEUIModelRef<FVM_TeamPanel> local_6 = TEUIModelRef<FVM_TeamPanel>(EUIInternal::MakeModelWithManager(Manager, FVM_TeamPanel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayingTeammates";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TeammateInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SocialTeamTypeItem";
    local_14.TypeName = "TEUIModelRef<FVM_TeamPanelTypeItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CombatTeamTypeItem";
    local_14.TypeName = "TEUIModelRef<FVM_TeamPanelTypeItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeamOperatorBtns";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TeamOperatorBtnItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasAnyTeam";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasMultipleTeams";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasSocialTeam";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasCombatTeam";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsSelfSpeaking";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsCombatTeam";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSocialTeam";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeamLinkEnergyPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LinkOrExecuteBuffText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasExecuteBuff";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExecuteBuffDurationPercentage";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasFirstExecuteBuff";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasSecondExecuteBuff";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasThirdExecuteBuff";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanLeaveTeam";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanInvitationTeam";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanInvitationTeamIntoDS";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TeamPanel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TeamPanel;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnSelectedTeamTypeChanged";
    local_24.DirtyFlags.Set(FVM_TeamPanel::__IndexOf_SelectedTeamType());
    Result.DirtyFunctions.Add(local_24);
    FEUIModelMsgHandleDefine local_34;
    local_34.FunctionName = "__HandleSocialTeamChanged";
    local_34.MessageTypeName = "Msg_SocialTeamChanged";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    local_34.FunctionName = "__HandleSocialTeamMemberChanged";
    local_34.MessageTypeName = "Msg_SocialTeamMemberChanged";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    local_34.FunctionName = "__HandleCombatTeamChanged";
    local_34.MessageTypeName = "Msg_CombatTeamChanged";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    local_34.FunctionName = "__HandleCombatTeamMemberChanged";
    local_34.MessageTypeName = "Msg_CombatTeamMemberChanged";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    FEUIModelEventDefine local_44;
    local_44.FunctionName = "__OnVOXModeRestored";
    local_44.EventType = FCE_VOXModeRestored;
    Result.EventFunctions.Add(local_44);
    local_24.FunctionName = "__OnSocialTeamRefChanged";
    local_24.DirtyFlags.Set(FVM_TeamPanel::__IndexOf_SocialTeam());
    Result.DirtyFunctions.Add(local_24);
    local_24.FunctionName = "__OnCombatTeamRefChanged";
    local_24.DirtyFlags.Set(FVM_TeamPanel::__IndexOf_CombatTeam());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TeamPanel;
}
void __OnSelectedTeamTypeChanged(FVM_TeamPanel &inout Model)
{
    Model.OnSelectedTeamTypeChanged();
    return;
}
void __HandleSocialTeamChanged(FVM_TeamPanel &inout Model, const FMsg_SocialTeamChanged &inout Message)
{
    Model.HandleSocialTeamChanged(Message);
    return;
}
void __HandleSocialTeamMemberChanged(FVM_TeamPanel &inout Model, const FMsg_SocialTeamMemberChanged &inout Message)
{
    Model.HandleSocialTeamMemberChanged(Message);
    return;
}
void __HandleCombatTeamChanged(FVM_TeamPanel &inout Model, const FMsg_CombatTeamChanged &inout Message)
{
    Model.HandleCombatTeamChanged(Message);
    return;
}
void __HandleCombatTeamMemberChanged(FVM_TeamPanel &inout Model, const FMsg_CombatTeamMemberChanged &inout Message)
{
    Model.HandleCombatTeamMemberChanged(Message);
    return;
}
void __OnVOXModeRestored(FVM_TeamPanel &inout Model, const FCE_VOXModeRestored &inout Event)
{
    Model.OnVOXModeRestored(Event);
    return;
}
void __OnSocialTeamRefChanged(FVM_TeamPanel &inout Model)
{
    Model.OnSocialTeamRefChanged();
    return;
}
void __OnCombatTeamRefChanged(FVM_TeamPanel &inout Model)
{
    Model.OnCombatTeamRefChanged();
    return;
}
TArray<TEUIModelRef<FVM_TeammateInfo>> __UIGetter_DisplayingTeammates(const FVM_TeamPanel &inout Model)
{
    return Model.GetDisplayingTeammates();
}
TEUIModelRef<FVM_TeamPanelTypeItem> __UIGetter_SocialTeamTypeItem(const FVM_TeamPanel &inout Model)
{
    return Model.GetSocialTeamTypeItem();
}
TEUIModelRef<FVM_TeamPanelTypeItem> __UIGetter_CombatTeamTypeItem(const FVM_TeamPanel &inout Model)
{
    return Model.GetCombatTeamTypeItem();
}
TArray<TEUIModelRef<FVM_TeamOperatorBtnItem>> __UIGetter_TeamOperatorBtns(const FVM_TeamPanel &inout Model)
{
    return Model.GetTeamOperatorBtns();
}
bool __UIGetter_HasAnyTeam(const FVM_TeamPanel &inout Model)
{
    return Model.HasAnyTeam();
}
bool __UIGetter_HasMultipleTeams(const FVM_TeamPanel &inout Model)
{
    return Model.HasMultipleTeams();
}
bool __UIGetter_HasSocialTeam(const FVM_TeamPanel &inout Model)
{
    return Model.HasSocialTeam();
}
bool __UIGetter_HasCombatTeam(const FVM_TeamPanel &inout Model)
{
    return Model.HasCombatTeam();
}
bool __UIGetter_bIsSelfSpeaking(const FVM_TeamPanel &inout Model)
{
    return Model.GetbIsSelfSpeaking();
}
bool __UIGetter_IsCombatTeam(const FVM_TeamPanel &inout Model)
{
    return Model.IsCombatTeam();
}
bool __UIGetter_IsSocialTeam(const FVM_TeamPanel &inout Model)
{
    return Model.IsSocialTeam();
}
float32 __UIGetter_TeamLinkEnergyPercent(const FVM_TeamPanel &inout Model)
{
    return Model.GetTeamLinkEnergyPercent();
}
FText __UIGetter_LinkOrExecuteBuffText(const FVM_TeamPanel &inout Model)
{
    return Model.GetLinkOrExecuteBuffText();
}
bool __UIGetter_HasExecuteBuff(const FVM_TeamPanel &inout Model)
{
    return Model.HasExecuteBuff();
}
float32 __UIGetter_ExecuteBuffDurationPercentage(const FVM_TeamPanel &inout Model)
{
    return Model.GetExecuteBuffDurationPercentage();
}
bool __UIGetter_HasFirstExecuteBuff(const FVM_TeamPanel &inout Model)
{
    return Model.HasFirstExecuteBuff();
}
bool __UIGetter_HasSecondExecuteBuff(const FVM_TeamPanel &inout Model)
{
    return Model.HasSecondExecuteBuff();
}
bool __UIGetter_HasThirdExecuteBuff(const FVM_TeamPanel &inout Model)
{
    return Model.HasThirdExecuteBuff();
}
bool __UIGetter_CanLeaveTeam(const FVM_TeamPanel &inout Model)
{
    return Model.CanLeaveTeam();
}
bool __UIGetter_CanInvitationTeam(const FVM_TeamPanel &inout Model)
{
    return Model.CanInvitationTeam();
}
bool __UIGetter_CanInvitationTeamIntoDS(const FVM_TeamPanel &inout Model)
{
    return Model.CanInvitationTeamIntoDS();
}
TEUIModelRef<FVM_TeamPanel> __UIGetter_Self(const FVM_TeamPanel &inout Model)
{
    return TEUIModelRef<FVM_TeamPanel>(Model);
}
int __IndexOf_DisplayingTeammates()
{
    return 0;
}
int __IndexOf_SocialTeamTypeItem()
{
    return 1;
}
int __IndexOf_CombatTeamTypeItem()
{
    return 2;
}
int __IndexOf_TeamOperatorBtns()
{
    return 3;
}
int __IndexOf_SelectedTeamType()
{
    return 4;
}
int __IndexOf_ListenState()
{
    return 5;
}
int __IndexOf_SpeakState()
{
    return 6;
}
int __IndexOf_SocialTeam()
{
    return 7;
}
int __IndexOf_CombatTeam()
{
    return 8;
}
int __IndexOf_bGamepadLeftShoulderPress()
{
    return 9;
}
int __IndexOf_bIsSelfSpeaking()
{
    return 10;
}
int __IndexOf_SelfSpeakingPollTimer()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_TeamPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
