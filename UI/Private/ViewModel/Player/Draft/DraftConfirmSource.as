

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
        UObject local_32;
        TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> local_4;
        int local_40 = 0;
        TEUIModelRef<FM_Draft> local_6 = TEUIModelRef<FM_Draft>(Business);
        if (!(local_6.IsValid()))
        {
            return local_4;
        }
        TEUIModelRef<FM_Player> local_12 = ::FMS_PlayerData::Get(Context.Manager).GetLocalPlayerData();
        int local_13 = GetPlayerUid();
        for (auto& local_28 : local_6.opArrow().GetDraftPlayers())
        {
            if (!(local_28.opArrow().GetPlayer().IsValid()))
            {
                continue;
            }
            TEUIModelRef<FVM_TeammateInfo> local_30;
            TEUIModelRef<FM_Player> local_12_2 = local_28.opArrow().GetPlayer();
            ::FMS_LocalPlayerTeamData::Get(Context.Manager).GetTeamMemberInAnyTeam(local_32);
            if (local_32.IsValid())
            {
                local_30 = TEUIModelRef<FVM_TeammateInfo>(::FVM_TeammateInfo::Create(local_32, Context.Manager));
            }
            else
            {
                TEUIModelRef<FM_Player> local_12_3 = local_28.opArrow().GetPlayer();
                local_40.SetPlayer(local_12_3);
                local_30 = TEUIModelRef<FVM_TeammateInfo>(::FVM_TeammateInfo::Create(Context.Manager, (TEUIModelRef<FM_TeamMember>(local_40))));
            }
            TEUIModelRef<FVM_TeamMemberPrepareItem> local_42 = TEUIModelRef<FVM_TeamMemberPrepareItem>(::FVM_TeamMemberPrepareItem::Create(Context.Manager, local_30));
            TEUIModelRef<FM_Player> local_12_4 = local_28.opArrow().GetPlayer();
            bool local_9 = (GetPlayerUid() == local_13);
            local_9.SetbSelf();
            local_9 = (local_28.opArrow().GetDraftInviteReply() == 1);
            local_9.SetbReady();
            local_9 = (local_28.opArrow().GetDraftInviteReply() == 2);
            local_9.SetbReject();
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
            (local_12.opArrow().GetDraftInviteReply() == 1).SetbReady();
            (local_12.opArrow().GetDraftInviteReply() == 2).SetbReject();
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
            ::CommonPopup::Tips(NSLOCTEXT("DraftInviteTimeOut_UnknownPlayer", "еЊ№й…Ќе¤±иґҐпјЊжњ‰зЋ©е®¶жњЄе‡†е¤‡"), local_16);
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
            ::CommonPopup::Tips(NSLOCTEXT("PlayerLeaveTeam", "е·Із¦»ејЂеЊ№й…ЌйџдјЌ"), local_16);
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
                ::CommonPopup::Tips(FText::Format(NSLOCTEXT("DraftInviteTimeOut", "еЊ№й…Ќе¤±иґҐпјЊзЋ©е®¶ {0} жњЄе‡†е¤‡"), ::DraftPlayerUtils::FormatDraftPlayerNames(local_24)), local_40);
            }
            else
            {
                ::CommonPopup::Tips(NSLOCTEXT("DraftInviteTimeOut_UnknownPlayer", "еЊ№й…Ќе¤±иґҐпјЊжњ‰зЋ©е®¶жњЄе‡†е¤‡"), local_40);
            }
            return;
        }
        if (local_1 == 3)
        {
            TArray<TEUIModelRef<FM_DraftPlayer>> local_20 = Draft.opArrow().FindDraftPlayersWithReplyType(2);
            if (!(local_20.IsEmpty()))
            {
                ::CommonPopup::Tips(FText::Format(NSLOCTEXT("DraftInviteReject", "еЊ№й…Ќе¤±иґҐпјЊзЋ©е®¶ {0} ж‹’з»ќиї›е…Ґе§”ж‰"), ::DraftPlayerUtils::FormatDraftPlayerNames(local_20)), local_40);
            }
            else
            {
                ::CommonPopup::Tips(NSLOCTEXT("DraftInviteReject_UnknownPlayer", "еЊ№й…Ќе¤±иґҐпјЊжњ‰зЋ©е®¶ж‹’з»ќиї›е…Ґе§”ж‰"), local_40);
            }
            return;
        }
        if (local_1 == 2)
        {
            ::CommonPopup::Tips(NSLOCTEXT("DraftInviteInterrupt", "йџдјЌдєєж•°еЏ‘з”џеЏеЊ–пјЊиЇ·й‡Ќж–°ејЂеђЇеЊ№й…Ќ"), local_40);
            return;
        }
        if (local_1 == 5)
        {
            ::CommonPopup::Tips(NSLOCTEXT("DraftInviteMemberOffline", "еЊ№й…Ќе¤±иґҐпјЊйџдјЌж€ђе‘з¦»зєї"), local_40);
            return;
        }
        ::CommonPopup::Tips(NSLOCTEXT("DraftInviteFail", "еЊ№й…Ќе¤±иґҐ"), local_40);
        return;
    }
}

