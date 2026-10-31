class UDraftConfirmSource : UTeamMemberConfirmSourceBase
{
    UDraftConfirmSource()
    {
        super();
        return;
    }
    float32 GetReplyTimeout(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        const UDraftSettings local_2;
        GetGameplaySettings<UDraftSettings> local_4;
        local_2 = local_4;
        return local_2.DraftReplyTimeout;
    }
    TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> BuildMembers(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> local_4;
        int local_40 = 0;
        TEUIModelRef<FM_Draft> local_6 = TEUIModelRef<FM_Draft>(Business);
        if (!(local_6.IsValid()))
        {
            return local_4;
        }
        int local_13 = ::FMS_PlayerData::Get(Context.Manager).GetLocalPlayerData().Get().GetPlayerUid();
        for (auto& local_28 : local_6.opArrow().GetDraftPlayers())
        {
            if (!(local_28.opArrow().GetPlayer().IsValid()))
            {
                continue;
            }
            TEUIModelRef<FVM_TeammateInfo> local_30;
            TEUIModelRef<FM_TeamMember> local_32 = ::FMS_LocalPlayerTeamData::Get(Context.Manager).GetTeamMemberInAnyTeam(local_28.opArrow().GetPlayer());
            if (local_32.IsValid())
            {
                local_30 = TEUIModelRef<FVM_TeammateInfo>(::FVM_TeammateInfo::Create(Context.Manager, local_32));
            }
            else
            {
                TEUIModelRef<FM_Player> local_12 = local_28.opArrow().GetPlayer();
                local_40.SetPlayer(local_12);
                local_30 = TEUIModelRef<FVM_TeammateInfo>(::FVM_TeammateInfo::Create(Context.Manager, (TEUIModelRef<FM_TeamMember>(local_40))));
            }
            TEUIModelRef<FVM_TeamMemberPrepareItem> local_42 = TEUIModelRef<FVM_TeamMemberPrepareItem>(::FVM_TeamMemberPrepareItem::Create(Context.Manager, local_30));
            local_42.Get().SetbSelf((local_28.opArrow().GetPlayer().Get().GetPlayerUid() == local_13));
            local_42.Get().SetbReady((local_28.opArrow().GetDraftInviteReply() == 1));
            local_42.Get().SetbReject((local_28.opArrow().GetDraftInviteReply() == 2));
            local_4.Add(local_42);
        }
        return local_4;
    }
    void RefreshMembers(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business, const TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> &inout Members) const
    {
        TEUIModelRef<FM_Draft> local_2 = TEUIModelRef<FM_Draft>(Business);
        bool local_5 = !(local_2.IsValid());
        if (local_5)
        {
            return;
        }
        int local_6 = 0;
        while (local_5)
        {
            const TEUIModelRef<FM_DraftPlayer>& local_12 = local_2.opArrow().GetDraftPlayers()[local_6];
            Members[local_6].Get().SetbReady((local_12.opArrow().GetDraftInviteReply() == 1));
            Members[local_6].Get().SetbReject((local_12.opArrow().GetDraftInviteReply() == 2));
            ++local_6;
            if (local_6 >= Members.Num())
            {
                local_5 = false;
                continue;
            }
            local_5 = (local_6 < local_2.opArrow().GetDraftPlayers().Num());
        }
        return;
    }
    int GetReplyStatusIndex(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        TEUIModelRef<FM_Draft> local_2 = TEUIModelRef<FM_Draft>(Business);
        if (!(local_2.IsValid()))
        {
            return 0;
        }
        if (!(local_2.opArrow().FindDraftPlayersWithReplyType(2).IsEmpty()))
        {
            return 2;
        }
        TEUIModelRef<FM_DraftPlayer> local_14 = local_2.opArrow().GetLocalDraftPlayer();
        if (local_14.IsValid() && (local_14.opArrow().GetDraftInviteReply() == 1))
        {
            return 1;
        }
        return 0;
    }
    FText GetReplyProgressText(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        TEUIModelRef<FM_Draft> local_2 = TEUIModelRef<FM_Draft>(Business);
        if (!(local_2.IsValid()))
        {
            return FText();
        }
        int local_11 = 0;
        for (auto& local_26 : local_2.opArrow().GetDraftPlayers())
        {
            if (local_26.opArrow().GetDraftInviteReply() == 1)
            {
                ++local_11;
            }
        }
        return FText::Format(FText::AsCultureInvariant("{0}/{1}"), local_11, local_2.opArrow().GetDraftPlayers().Num());
    }
    FText GetWarningText(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        TEUIModelRef<FM_Draft> local_2 = TEUIModelRef<FM_Draft>(Business);
        if (!(local_2.IsValid()))
        {
            return FText();
        }
        TArray<TEUIModelRef<FM_Player>> local_14;
        for (auto& local_28 : local_2.opArrow().GetDraftPlayers())
        {
            if (local_28.opArrow().GetPlayer().IsValid())
            {
                local_14.Add(local_28.opArrow().GetPlayer());
            }
        }
        return ::TeamMemberConfirmUtils::BuildMissingIllustrateWarning(local_14);
    }
    bool IsNoneReject(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        TEUIModelRef<FM_Draft> local_2 = TEUIModelRef<FM_Draft>(Business);
        if (!(local_2.IsValid()))
        {
            return true;
        }
        return local_2.opArrow().FindDraftPlayersWithReplyType(2).IsEmpty();
    }
    TSoftClassPtr<UEUIUserWidget> GetContentWidgetClass(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        const UDraftSettings local_18;
        TEUIModelRef<FM_Draft> local_2 = TEUIModelRef<FM_Draft>(Business);
        if (!(local_2.IsValid()))
        {
            return TSoftClassPtr<UEUIUserWidget>();
        }
        GetGameplaySettings<UDraftSettings> local_20;
        local_18 = local_20;
        return local_18.GetDraftTypeAdapterWidgetClass(local_2.opArrow().GetTypedDraftData().GetStructType());
    }
    FEUIModelContainer GetContentModel(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        const UDraftSettings local_22;
        TEUIModelRef<FM_Draft> local_2 = TEUIModelRef<FM_Draft>(Business);
        if (!(local_2.IsValid()))
        {
            return FEUIModelContainer();
        }
        GetGameplaySettings<UDraftSettings> local_24;
        local_22 = local_24;
        const UDraftTypeAdapterBase local_32 = local_22.GetDraftTypeAdapter(local_2.opArrow().GetTypedDraftData().GetStructType());
        if (local_32 != nullptr)
        {
            return local_32.MakeViewModels(Context, local_2.opArrow().GetTypedDraftData());
        }
        return FEUIModelContainer();
    }
    void OnAgree(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        TEUIModelRef<FM_Draft> local_2 = TEUIModelRef<FM_Draft>(Business);
        if (local_2.IsValid())
        {
            local_2.opArrow().RequestReplyDraftInvite(true);
        }
        return;
    }
    void OnReject(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        TEUIModelRef<FM_Draft> local_2 = TEUIModelRef<FM_Draft>(Business);
        if (local_2.IsValid())
        {
            local_2.opArrow().RequestReplyDraftInvite(false);
        }
        return;
    }
    void OnCancel(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        TEUIModelRef<FM_Draft> local_2 = TEUIModelRef<FM_Draft>(Business);
        if (local_2.IsValid())
        {
            local_2.opArrow().RequestReplyDraftInvite(false);
        }
        return;
    }
    int GetCloseRequest(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        TEUIModelRef<FM_Draft> local_2 = TEUIModelRef<FM_Draft>(Business);
        if (!(local_2.IsValid()))
        {
            return 0;
        }
        if (local_2.opArrow().GetDraftInviteResult() == 4)
        {
            return 1;
        }
        if (local_2.opArrow().GetDraftInviteResult() == 1)
        {
            return 0;
        }
        int64 local_14 = ::FSocialTeamUtils::GetSocialTeamId(Context.GetLocalPlayer());
        if (local_14 == 0)
        {
            return 1;
        }
        int local_7 = local_2.opArrow().GetDraftInviteResult();
        if (local_7 != 0)
        {
            return 2;
        }
        return 0;
    }
    float32 GetCloseDelay(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        const UDraftSettings local_2;
        GetGameplaySettings<UDraftSettings> local_4;
        local_2 = local_4;
        return local_2.DraftFailWaitTime;
    }
    void OnBeforeClose(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        TEUIModelRef<FM_Draft> local_2 = TEUIModelRef<FM_Draft>(Business);
        if (!(local_2.IsValid()))
        {
            return;
        }
        if (local_2.opArrow().GetDraftInviteResult() == 4)
        {
            FCommonTipsParam local_16;
            ::CommonPopup::Tips(NSLOCTEXT("DraftInviteTimeOut_UnknownPlayer", "匹配失败，有玩家未准备"), local_16);
            return;
        }
        if (local_2.opArrow().GetDraftInviteResult() == 1)
        {
            return;
        }
        int64 local_22 = ::FSocialTeamUtils::GetSocialTeamId(Context.GetLocalPlayer());
        if (local_22 == 0)
        {
            FCommonTipsParam local_16;
            ::CommonPopup::Tips(NSLOCTEXT("PlayerLeaveTeam", "已离开匹配队伍"), local_16);
            return;
        }
        this.ShowFailTips(Context, local_2);
        return;
    }
    void OnDestroy(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        TEUIModelRef<FM_Draft> local_2 = TEUIModelRef<FM_Draft>(Business);
        if (local_2.IsValid())
        {
            local_2.opArrow().DeleteDraft();
        }
        return;
    }
    void ShowFailTips(const FEUIModelContext &inout Context, const TEUIModelRef<FM_Draft> &inout Draft) const
    {
        int local_1;
        const UDraftSettings local_4;
        FCommonTipsParam local_40;
        local_1 = Draft.opArrow().GetDraftInviteResult();
        GetGameplaySettings<UDraftSettings> local_6;
        local_4 = local_6;
        const UDraftTypeAdapterBase local_14 = local_4.GetDraftTypeAdapter(Draft.opArrow().GetTypedDraftData().GetStructType());
        if (local_14 != nullptr)
        {
            if (local_14.HandleDraftInviteFail(Context, Draft))
            {
                return;
            }
        }
        if (local_1 == 4)
        {
            TArray<TEUIModelRef<FM_DraftPlayer>> local_24 = Draft.opArrow().FindDraftPlayersWithReplyType(0);
            if (!(local_24.IsEmpty()))
            {
                ::CommonPopup::Tips(FText::Format(NSLOCTEXT("DraftInviteTimeOut", "匹配失败，玩家 {0} 未准备"), ::DraftPlayerUtils::FormatDraftPlayerNames(local_24)), local_40);
            }
            else
            {
                ::CommonPopup::Tips(NSLOCTEXT("DraftInviteTimeOut_UnknownPlayer", "匹配失败，有玩家未准备"), local_40);
            }
            return;
        }
        if (local_1 == 3)
        {
            TArray<TEUIModelRef<FM_DraftPlayer>> local_20 = Draft.opArrow().FindDraftPlayersWithReplyType(2);
            if (!(local_20.IsEmpty()))
            {
                ::CommonPopup::Tips(FText::Format(NSLOCTEXT("DraftInviteReject", "匹配失败，玩家 {0} 拒绝进入委托"), ::DraftPlayerUtils::FormatDraftPlayerNames(local_20)), local_40);
            }
            else
            {
                ::CommonPopup::Tips(NSLOCTEXT("DraftInviteReject_UnknownPlayer", "匹配失败，有玩家拒绝进入委托"), local_40);
            }
            return;
        }
        if (local_1 == 2)
        {
            ::CommonPopup::Tips(NSLOCTEXT("DraftInviteInterrupt", "队伍人数发生变化，请重新开启匹配"), local_40);
            return;
        }
        if (local_1 == 5)
        {
            ::CommonPopup::Tips(NSLOCTEXT("DraftInviteMemberOffline", "匹配失败，队伍成员离线"), local_40);
            return;
        }
        ::CommonPopup::Tips(NSLOCTEXT("DraftInviteFail", "匹配失败"), local_40);
        return;
    }
}

