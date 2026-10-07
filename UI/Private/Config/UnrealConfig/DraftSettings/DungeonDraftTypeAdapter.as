

class UDungeonDraftTypeAdapter : UDraftTypeAdapterBase
{
    default SupportedTypedDraftDataModelType = FM_Dungeon;
    default ServerDraftType = 2;

    UDungeonDraftTypeAdapter()
    {
        super();
        return;
    }
    FEUIModelRef GetTypedDraftData(const FEUIModelContext &inout Context, const FPbDraftInfo &inout ServerDraftInfo) const
    {
        FPbDungeonInfo local_10 = ServerDraftInfo.GetDungeonInfo();
        FM_Dungeon& local_22 = ::FM_Dungeon::Create(Context.Manager);
        local_22.SetFromServerData(local_10, false);
        return FEUIModelRef(local_22);
    }
    FEUIModelContainer MakeViewModels(const FEUIModelContext &inout Context, const FEUIModelRef &inout TypedDraftData) const
    {
        TEUIModelRef<FM_Dungeon> local_2 = TEUIModelRef<FM_Dungeon>(TypedDraftData);
        return FEUIModelContainer();
    }
    bool HandleDraftInviteFail(const FEUIModelContext &inout Context, const TEUIModelRef<FM_Draft> &inout FailedDraft) const
    {
        if (FailedDraft.opArrow().GetDraftInviteResult() == 6)
        {
            FCommonTipsParam local_12;
            ::CommonPopup::Tips(NSLOCTEXT("DungeonInviteFail_MemberCondNotMeet", "жњ‰ж€ђе‘жњЄж»Ўи¶іе§”ж‰жЋҐеЏ–жќЎд»¶пјЊж— жі•ејЂеђЇењ°з‰ў"), local_12);
            return true;
        }
        return false;
    }
}

