class USocialViewPageOperator_OpenPage : USocialViewPageOperator
{
    USocialViewPageOperator_OpenPage()
    {
        super();
        return;
    }
    bool ShouldShow(const FSocialViewPageOperatorContext &inout Context) const
    {
        return true;
    }
    void Execute(const FSocialViewPageOperatorContext &inout Context, const TDataObjectPtr<FSocialViewPageButtonConfig> &inout ButtonConfig)
    {
        if (ButtonConfig && !(ButtonConfig.opArrow().PageWidget.IsNull()))
        {
            ::FVM_SocialViewPage::ClosePage(Context.LocalPlayer);
            FEUIWidget::AddWidgetByClass(Context.LocalPlayer, ButtonConfig.opArrow().PageWidget);
            return;
        }
        FCommonTipsParam local_12;
        ::CommonPopup::Tips(NSLOCTEXT("SocialViewPage", "OpenPageError", "页面配置未找到"), local_12);
        return;
    }
}

class USocialViewPageOperator_Chat : USocialViewPageOperator
{
    USocialViewPageOperator_Chat()
    {
        super();
        return;
    }
    bool ShouldShow(const FSocialViewPageOperatorContext &inout Context) const
    {
        bool local_4 = ::FMS_SystemControl::Get(Context.LocalPlayer).IsSystemUnlock(ESystemModule(108), false);
        return (!(Context.bIsSelf) && local_4);
    }
    void Execute(const FSocialViewPageOperatorContext &inout Context, const TDataObjectPtr<FSocialViewPageButtonConfig> &inout ButtonConfig)
    {
        if (int(Context.TargetPlayerUid) == 0)
        {
            return;
        }
        ::FVM_SocialViewPage::ClosePage(Context.LocalPlayer);
        ::FVMS_ChatMain::Get(Context.LocalPlayer.GetWorld()).BeginChatWithPlayer(int(Context.TargetPlayerUid));
        return;
    }
}

class USocialViewPageOperator_AddFriend : USocialViewPageOperator
{
    USocialViewPageOperator_AddFriend()
    {
        super();
        return;
    }
    bool ShouldShow(const FSocialViewPageOperatorContext &inout Context) const
    {
        bool local_4 = ::FMS_SystemControl::Get(Context.LocalPlayer).IsSystemUnlock(ESystemModule(12), false);
        if (!(local_4))
        {
            return false;
        }
        if ((Context.bIsSelf || Context.bIsFriend))
        {
            return false;
        }
        return true;
    }
    void Execute(const FSocialViewPageOperatorContext &inout Context, const TDataObjectPtr<FSocialViewPageButtonConfig> &inout ButtonConfig)
    {
        if (int(Context.TargetPlayerUid) == 0)
        {
            return;
        }
        if (Context.bIsSelf)
        {
            ::FriendUtil::ShowAddSelfAsFriendTips();
            return;
        }
        ::FMS_FriendDataModel::Get(Context.LocalPlayer).GS_SendFriendApply(int(Context.TargetPlayerUid), FString());
        return;
    }
}

class USocialViewPageOperator_DeleteFriend : USocialViewPageOperator
{
    USocialViewPageOperator_DeleteFriend()
    {
        super();
        return;
    }
    bool ShouldShow(const FSocialViewPageOperatorContext &inout Context) const
    {
        bool local_4 = ::FMS_SystemControl::Get(Context.LocalPlayer).IsSystemUnlock(ESystemModule(12), false);
        if (!(local_4))
        {
            return false;
        }
        if ((Context.bIsSelf || !(Context.bIsFriend)))
        {
            return false;
        }
        return true;
    }
    void Execute(const FSocialViewPageOperatorContext &inout Context, const TDataObjectPtr<FSocialViewPageButtonConfig> &inout ButtonConfig)
    {
        const UChatSettings local_6;
        if (int(Context.TargetPlayerUid) == 0)
        {
            return;
        }
        GetGameplaySettings<UChatSettings> local_8;
        local_6 = local_8;
        FText local_18 = ::ChatSystemUtil::ResolveKLTextData(local_6.DeleteFriendConfirmTitleTextData);
        FText local_38 = FText::Format(::ChatSystemUtil::ResolveKLTextData(local_6.DeleteFriendConfirmMessageTextData), FText::FromString(::FriendUtil::GetFriendName(int(Context.TargetPlayerUid))));
        FText local_30 = ::ChatSystemUtil::ResolveKLTextData(local_6.DeleteFriendConfirmButtonTextData);
        FText local_34 = ::ChatSystemUtil::ResolveKLTextData(local_6.DeleteFriendCancelButtonTextData);
        FDialogDynamicCallback local_50;
        local_50.BindUFunction(this, n"OnConfirmDeleteFriend");
        FCommonDialogParam local_86;
        ::CommonPopup::Dialog_Decision(Context.LocalPlayer, local_18, local_38, FDialogCallback(local_50), local_30, local_34, local_86);
        return;
    }
    UFUNCTION()
    bool OnConfirmDeleteFriend(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            ULocalPlayer local_6 = ::FASCommonUtils::GetLocalPlayerController().GetLocalPlayer();
            int local_16 = ::FVMS_SocialViewPage::Get(local_6.GetWorld()).GetPlayerUid();
            if (local_16 > 0)
            {
                ::FMS_FriendDataModel::Get(local_6).GS_DeleteFriend(local_16);
            }
        }
        return true;
    }
}

class USocialViewPageOperator_InviteToDS : USocialViewPageOperator
{
    USocialViewPageOperator_InviteToDS()
    {
        super();
        return;
    }
    bool ShouldShow(const FSocialViewPageOperatorContext &inout Context) const
    {
        if ((Context.bIsSelf || !(Context.bIsFriend)))
        {
            return false;
        }
        if (!(::FTeamUtils::GetIsInCityTeamState()))
        {
            return false;
        }
        return true;
    }
    void Execute(const FSocialViewPageOperatorContext &inout Context, const TDataObjectPtr<FSocialViewPageButtonConfig> &inout ButtonConfig)
    {
        if (int(Context.TargetPlayerUid) == 0)
        {
            return;
        }
        ::FMS_FriendDataModel::Get(Context.LocalPlayer).GS_FriendAssembleReq(int(Context.TargetPlayerUid));
        return;
    }
}

class USocialViewPageOperator_InviteJoinTeam : USocialViewPageOperator
{
    USocialViewPageOperator_InviteJoinTeam()
    {
        super();
        return;
    }
    bool ShouldShow(const FSocialViewPageOperatorContext &inout Context) const
    {
        if (::FMS_PlayerSocialTeamData::Get(Context.LocalPlayer.GetWorld()).IsLocalPlayerInTeam() && (::FMS_LocalPlayerTeamData::Get(Context.LocalPlayer.GetWorld()).GetTeamMemberCount(ETeamType(1)) >= ::FSocialTeamUtils::GetMaxSocialMember()))
        {
            return false;
        }
        if (int(Context.TargetTeamStatus) != 2)
        {
            return false;
        }
        if (!(Context.TargetPlayerModel.IsValid()))
        {
            return false;
        }
        if (::FMS_LocalPlayerTeamData::Get(Context.LocalPlayer.GetWorld()).IsTeamMember(Context.TargetPlayerModel, ETeamType(1)))
        {
            return false;
        }
        return true;
    }
    void Execute(const FSocialViewPageOperatorContext &inout Context, const TDataObjectPtr<FSocialViewPageButtonConfig> &inout ButtonConfig)
    {
        if (!(Context.TargetPlayerModel.IsValid()))
        {
            return;
        }
        ::FSocialTeamUtils::ClientSendTeamUp(Context.LocalPlayerEntity, int(Context.TargetPlayerUid));
        FCommonTipsParam local_10;
        ::CommonPopup::Tips(NSLOCTEXT("TeamInvitationItem", "SendTeamUpRequest", "邀请请求已发送"), local_10);
        return;
    }
}

class USocialViewPageOperator_RequestJoinTeam : USocialViewPageOperator
{
    USocialViewPageOperator_RequestJoinTeam()
    {
        super();
        return;
    }
    bool ShouldShow(const FSocialViewPageOperatorContext &inout Context) const
    {
        if (int(Context.TargetTeamStatus) != 1)
        {
            return false;
        }
        if (!(Context.TargetPlayerModel.IsValid()))
        {
            return false;
        }
        if (::FMS_LocalPlayerTeamData::Get(Context.LocalPlayer.GetWorld()).IsTeamMember(Context.TargetPlayerModel, ETeamType(1)))
        {
            return false;
        }
        return true;
    }
    void Execute(const FSocialViewPageOperatorContext &inout Context, const TDataObjectPtr<FSocialViewPageButtonConfig> &inout ButtonConfig)
    {
        if (!(Context.TargetPlayerModel.IsValid()))
        {
            return;
        }
        if (::FMS_LocalPlayerTeamData::Get(Context.LocalPlayer.GetWorld()).IsInTeam(ETeamType(1)))
        {
            FDialogDynamicCallback local_10;
            local_10.BindUFunction(this, n"OnConfirmJoinTeamWhenInTeam");
            FText local_16 = NSLOCTEXT("Team", "JoinTeamWhenInTeamCancel", "否");
            FText local_20 = NSLOCTEXT("Team", "JoinTeamWhenInTeamConfirm", "是");
            FDialogCallback local_52 = FDialogCallback(local_10);
            FText local_56 = NSLOCTEXT("Team", "JoinTeamWhenInTeamMessage", "是否离开当前队伍并申请入队？");
            FText local_60 = NSLOCTEXT("Team", "JoinTeamWhenInTeamTitle", "提示");
            FCommonDialogParam local_62;
            ::CommonPopup::Dialog_Decision(Context.LocalPlayer, local_60, local_56, local_52, local_20, local_16, local_62);
            return;
        }
        ::FSocialTeamUtils::ClientSendTeamUp(Context.LocalPlayerEntity, int(Context.TargetPlayerUid));
        FCommonTipsParam local_68;
        ::CommonPopup::Tips(NSLOCTEXT("TeamInvitationItem", "SendJoinTeamRequest", "加入请求已发送"), local_68);
        return;
    }
    UFUNCTION()
    bool OnConfirmJoinTeamWhenInTeam(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            int local_16 = ::FVMS_SocialViewPage::Get(::FASCommonUtils::GetLocalPlayerController().GetLocalPlayer().GetWorld()).GetPlayerUid();
            if (local_16 > 0)
            {
                ::FSocialTeamUtils::ClientSendTeamUp(::FASCommonUtils::GetLocalUniquePlayerEntity(), local_16);
                FCommonTipsParam local_28;
                ::CommonPopup::Tips(NSLOCTEXT("TeamInvitationItem", "SendJoinTeamRequest", "加入请求已发送"), local_28);
            }
        }
        return true;
    }
}

class USocialViewPageOperator_KickOutTeam : USocialViewPageOperator
{
    USocialViewPageOperator_KickOutTeam()
    {
        super();
        return;
    }
    bool ShouldShow(const FSocialViewPageOperatorContext &inout Context) const
    {
        if (!(::FMS_LocalPlayerTeamData::Get(Context.LocalPlayer.GetWorld()).SelfIsSocialTeamCaptain()))
        {
            return false;
        }
        if (!(Context.TargetPlayerModel.IsValid()))
        {
            return false;
        }
        if (!(::FMS_LocalPlayerTeamData::Get(Context.LocalPlayer.GetWorld()).IsTeamMember(Context.TargetPlayerModel, ETeamType(1))))
        {
            return false;
        }
        return true;
    }
    void Execute(const FSocialViewPageOperatorContext &inout Context, const TDataObjectPtr<FSocialViewPageButtonConfig> &inout ButtonConfig)
    {
        if (!(Context.TargetPlayerModel.IsValid()))
        {
            return;
        }
        FText local_22 = FText::Format(NSLOCTEXT("Team", "KickMemberMessage", "是否确认请离{0}"), FText::FromString(Context.TargetPlayerModel.Get().GetNickName()));
        FDialogDynamicCallback local_26;
        local_26.BindUFunction(this, n"OnConfirmKickOut");
        FText local_14 = NSLOCTEXT("Team", "KickPlayerCancel", "否");
        FText local_18 = NSLOCTEXT("Team", "KickPlayerConfirm", "是");
        FDialogCallback local_60 = FDialogCallback(local_26);
        FText local_6 = NSLOCTEXT("Team", "KickPlayerTitle", "提示");
        FCommonDialogParam local_62;
        ::CommonPopup::Dialog_Decision(Context.LocalPlayer, local_6, local_22, local_60, local_18, local_14, local_62);
        return;
    }
    UFUNCTION()
    bool OnConfirmKickOut(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            int local_16 = ::FVMS_SocialViewPage::Get(::FASCommonUtils::GetLocalPlayerController().GetLocalPlayer().GetWorld()).GetPlayerUid();
            if (local_16 > 0)
            {
                ::FSocialTeamUtils::ClientSendKickTeammate(::FASCommonUtils::GetLocalUniquePlayerEntity(), local_16);
                FCommonTipsParam local_28;
                ::CommonPopup::Tips(NSLOCTEXT("TeamInvitationItem", "KikOutPlayerFrom", "已请离玩家"), local_28);
            }
        }
        return true;
    }
}

class USocialViewPageOperator_GiveTeamLeader : USocialViewPageOperator
{
    USocialViewPageOperator_GiveTeamLeader()
    {
        super();
        return;
    }
    bool ShouldShow(const FSocialViewPageOperatorContext &inout Context) const
    {
        if (!(::FMS_LocalPlayerTeamData::Get(Context.LocalPlayer.GetWorld()).SelfIsSocialTeamCaptain()))
        {
            return false;
        }
        if (!(Context.TargetPlayerModel.IsValid()))
        {
            return false;
        }
        if (!(::FMS_LocalPlayerTeamData::Get(Context.LocalPlayer.GetWorld()).IsTeamMember(Context.TargetPlayerModel, ETeamType(1))))
        {
            return false;
        }
        return true;
    }
    void Execute(const FSocialViewPageOperatorContext &inout Context, const TDataObjectPtr<FSocialViewPageButtonConfig> &inout ButtonConfig)
    {
        if (!(Context.TargetPlayerModel.IsValid()))
        {
            return;
        }
        FText local_22 = FText::Format(NSLOCTEXT("Mail", "SetCaptainMessage", "是否确认将队长转让给{0}"), FText::FromString(Context.TargetPlayerModel.Get().GetNickName()));
        FDialogDynamicCallback local_26;
        local_26.BindUFunction(this, n"OnConfirmGiveLeader");
        FText local_14 = NSLOCTEXT("Team", "GiveTeamLeaderCancel", "否");
        FText local_18 = NSLOCTEXT("Team", "GiveTeamLeaderConfirm", "是");
        FDialogCallback local_60 = FDialogCallback(local_26);
        FText local_6 = NSLOCTEXT("Team", "GiveTeamLeaderTitle", "提示");
        FCommonDialogParam local_62;
        ::CommonPopup::Dialog_Decision(Context.LocalPlayer, local_6, local_22, local_60, local_18, local_14, local_62);
        return;
    }
    UFUNCTION()
    bool OnConfirmGiveLeader(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            int local_16 = ::FVMS_SocialViewPage::Get(::FASCommonUtils::GetLocalPlayerController().GetLocalPlayer().GetWorld()).GetPlayerUid();
            if (local_16 > 0)
            {
                ::FSocialTeamUtils::ClientSendTransferCaptain(::FASCommonUtils::GetLocalUniquePlayerEntity(), local_16);
                FCommonTipsParam local_28;
                ::CommonPopup::Tips(NSLOCTEXT("TeamInvitationItem", "GiveTeamLeaderTeam", "已转移队长"), local_28);
            }
        }
        return true;
    }
}

