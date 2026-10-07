

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
        ::CommonPopup::Tips(NSLOCTEXT("SocialViewPage", "OpenPageError", "йЎµйќўй…ЌзЅ®жњЄж‰ѕе€°"), local_12);
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
        ULocalPlayer local_18;
        ::ChatSystemUtil::ResolveKLTextData(local_18);
        FText::Format(::ChatSystemUtil::ResolveKLTextData(local_6.DeleteFriendConfirmMessageTextData), FText::FromString(::FriendUtil::GetFriendName(int(Context.TargetPlayerUid))));
        ::ChatSystemUtil::ResolveKLTextData(local_6.DeleteFriendConfirmButtonTextData);
        ::ChatSystemUtil::ResolveKLTextData(local_6.DeleteFriendCancelButtonTextData);
        FDialogDynamicCallback local_50;
        local_50.BindUFunction(this, n"OnConfirmDeleteFriend");
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
        ::CommonPopup::Tips(NSLOCTEXT("TeamInvitationItem", "SendTeamUpRequest", "й‚ЂиЇ·иЇ·ж±‚е·ІеЏ‘йЂЃ"), local_10);
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
            NSLOCTEXT("Team", "JoinTeamWhenInTeamCancel", "еђ¦");
            NSLOCTEXT("Team", "JoinTeamWhenInTeamMessage", "жЇеђ¦з¦»ејЂеЅ“е‰ЌйџдјЌе№¶з”іиЇ·е…Ґйџпјџ");
            ULocalPlayer local_60;
            NSLOCTEXT(local_60, "Team", "JoinTeamWhenInTeamTitle");
            return;
        }
        ::FSocialTeamUtils::ClientSendTeamUp(Context.LocalPlayerEntity, int(Context.TargetPlayerUid));
        FCommonTipsParam local_68;
        ::CommonPopup::Tips(NSLOCTEXT("TeamInvitationItem", "SendJoinTeamRequest", "еЉ е…ҐиЇ·ж±‚е·ІеЏ‘йЂЃ"), local_68);
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
                ::CommonPopup::Tips(NSLOCTEXT("TeamInvitationItem", "SendJoinTeamRequest", "еЉ е…ҐиЇ·ж±‚е·ІеЏ‘йЂЃ"), local_28);
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
        FString local_10;
        local_10.GetNickName();
        FText::Format(NSLOCTEXT("Team", "KickMemberMessage", "жЇеђ¦зЎ®и®¤иЇ·з¦»{0}"), FText::FromString(local_10));
        FDialogDynamicCallback local_26;
        local_26.BindUFunction(this, n"OnConfirmKickOut");
        NSLOCTEXT("Team", "KickPlayerCancel", "еђ¦");
        NSLOCTEXT("Team", "KickPlayerConfirm", "жЇ");
        ULocalPlayer local_6;
        NSLOCTEXT(local_6, "Team", "KickPlayerTitle");
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
                ::CommonPopup::Tips(NSLOCTEXT("TeamInvitationItem", "KikOutPlayerFrom", "е·ІиЇ·з¦»зЋ©е®¶"), local_28);
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
        FString local_10;
        local_10.GetNickName();
        FText::Format(NSLOCTEXT("Mail", "SetCaptainMessage", "жЇеђ¦зЎ®и®¤е°†йџй•їиЅ¬и®©з»™{0}"), FText::FromString(local_10));
        FDialogDynamicCallback local_26;
        local_26.BindUFunction(this, n"OnConfirmGiveLeader");
        NSLOCTEXT("Team", "GiveTeamLeaderCancel", "еђ¦");
        NSLOCTEXT("Team", "GiveTeamLeaderConfirm", "жЇ");
        ULocalPlayer local_6;
        NSLOCTEXT(local_6, "Team", "GiveTeamLeaderTitle");
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
                ::CommonPopup::Tips(NSLOCTEXT("TeamInvitationItem", "GiveTeamLeaderTeam", "е·ІиЅ¬з§»йџй•ї"), local_28);
            }
        }
        return true;
    }
}

