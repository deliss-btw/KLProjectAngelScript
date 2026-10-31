class UCommissionDraftTypeAdapter : UDraftTypeAdapterBase
{
    default SupportedTypedDraftDataModelType = FM_Commission;
    default ServerDraftType = 1;

    UCommissionDraftTypeAdapter()
    {
        super();
        return;
    }
    FEUIModelRef GetTypedDraftData(const FEUIModelContext &inout Context, const FPbDraftInfo &inout ServerDraftInfo) const
    {
        FPbCommissionInfo local_10 = ServerDraftInfo.GetCommissionInfo();
        FM_Commission& local_22 = ::FM_Commission::Create(Context.Manager);
        local_22.SetFromServerData(local_10, false);
        return FEUIModelRef(local_22);
    }
    FEUIModelContainer MakeViewModels(const FEUIModelContext &inout Context, const FEUIModelRef &inout TypedDraftData) const
    {
        return FEUIModelContainer(::FVM_CommissionInfo::Create(Context.Manager, TEUIModelRef<FM_Commission>(TypedDraftData)));
    }
    bool HandleDraftInviteFail(const FEUIModelContext &inout Context, const TEUIModelRef<FM_Draft> &inout FailedDraft) const
    {
        int local_22 = 0;
        FCommonTipsParam local_34;
        if (FailedDraft.opArrow().GetDraftInviteResult() == 6)
        {
            TArray<TEUIModelRef<FM_DraftPlayer>> local_8 = FailedDraft.opArrow().FindDraftPlayersWithReplyType(4);
            if (!(local_8.IsEmpty()))
            {
                FText local_16 = ::DraftPlayerUtils::FormatDraftPlayerNames(local_8);
                FText local_30 = FText::Format(NSLOCTEXT("CommissionInviteFail_CommissionNotActive", "玩家 {0} 未解锁契约 {1}，无法开启该契约"), local_16, local_22.GetCommissionConfig().opArrow().CommissionName);
                ::CommonPopup::Tips(local_30, local_34);
                return true;
            }
            TArray<TEUIModelRef<FM_DraftPlayer>> local_12 = FailedDraft.opArrow().FindDraftPlayersWithReplyType(3);
            if (!(local_12.IsEmpty()))
            {
                FText local_30_2 = ::DraftPlayerUtils::FormatDraftPlayerNames(local_12);
                FText local_16_2 = FText::Format(NSLOCTEXT("CommissionInviteFail_InCommission", "玩家 {0} 已在契约中，无法开启契约"), local_30_2);
                ::CommonPopup::Tips(local_16_2, local_34);
                return true;
            }
            TArray<TEUIModelRef<FM_DraftPlayer>> local_8_2 = FailedDraft.opArrow().FindDraftPlayersWithReplyType(8);
            if (!(local_8_2.IsEmpty()))
            {
                FText local_16_3 = ::DraftPlayerUtils::FormatDraftPlayerNames(local_8_2);
                FText local_30_3 = FText::Format(NSLOCTEXT("CommissionInviteFail_Banned", "组队成员 {0} 违规状态，无法进入契约"), local_16_3);
                ::CommonPopup::Tips(local_30_3, local_34);
                return true;
            }
            TArray<TEUIModelRef<FM_DraftPlayer>> local_12_2 = FailedDraft.opArrow().FindDraftPlayersWithReplyType(7);
            if (!(local_12_2.IsEmpty()))
            {
                FText local_30_4 = ::DraftPlayerUtils::FormatDraftPlayerNames(local_12_2);
                FText local_16_4 = FText::Format(NSLOCTEXT("CommissionInviteFail_ClientVersionNotMatch", "玩家 {0} 的版本过低，无法开启契约"), local_30_4);
                ::CommonPopup::Tips(local_16_4, local_34);
                return true;
            }
            FText local_16_5 = NSLOCTEXT("CommissionInviteFail_MemberCondNotMeet", "有成员未满足契约接取条件，无法开启契约");
            ::CommonPopup::Tips(local_16_5, local_34);
            return true;
        }
        return false;
    }
}

