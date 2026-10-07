
namespace FriendUtil
{
bool IsFriendSystemOpen()
{
    return FMS_SystemControl::Get(FASCommonUtils::GetLocalPlayerController()).IsSystemUnlock(ESystemModule(12), false);
}
FText GetTabDisplayName(const EChatFriendTab Tab)
{
    const UChatSettings local_2;
    GetGameplaySettings<UChatSettings> local_4;
    local_2 = local_4;
    if ((!((local_2 != nullptr))))
    {
        return FText();
    }
    if (local_2.FriendTabNameTextDataMap.Contains(Tab))
    {
        return ChatSystemUtil::ResolveKLTextData(local_2.FriendTabNameTextDataMap[Tab]);
    }
    return FText();
}
FText GetFriendSystemOpenTips()
{
    const UChatSettings local_2;
    GetGameplaySettings<UChatSettings> local_4;
    int local_14 = 0;
    local_2 = local_4;
    FText local_12;
    if ((!((local_2 != nullptr))))
    {
        return local_12;
    }
    int local_13 = 0;
    TDataObjectPtr<FSystemControlConfig> local_16 = local_2.FriendSystemControlConfig;
    if (local_16.IsSet())
    {
        local_13 = local_14;
    }
    local_12 = ChatSystemUtil::ResolveKLTextData(local_2.FriendSystemOpenTipsTextData);
    return FText::Format(local_12, local_13);
}
FText GetNoFriendTipsTips()
{
    const UChatSettings local_2;
    GetGameplaySettings<UChatSettings> local_4;
    local_2 = local_4;
    if ((!((local_2 != nullptr))))
    {
        return FText();
    }
    return ChatSystemUtil::ResolveKLTextData(local_2.NoFriendTipsTextData);
}
FText GetFriendNumTips()
{
    const UChatSettings local_2;
    GetGameplaySettings<UChatSettings> local_4;
    local_2 = local_4;
    if ((!((local_2 != nullptr))))
    {
        return FText();
    }
    return FText::Format(ChatSystemUtil::ResolveKLTextData(local_2.FriendNumTipsTextData), FriendUtil::GetFriendNum(), FriendUtil::GetFriendNumMax());
}
int GetFriendNumMax()
{
    const UChatSettings local_2;
    GetGameplaySettings<UChatSettings> local_4;
    int local_11 = 0;
    local_2 = local_4;
    if (local_2 != nullptr)
    {
        TDataObjectPtr<FFriendSettingsConfig> local_10 = local_2.FriendSettingsConfig;
        if (local_10.IsSet())
        {
            return local_11;
        }
    }
    return 200;
}
int GetFriendNum()
{
    return FMS_FriendDataModel::Get(FASCommonUtils::GetLocalPlayerController()).GetFriendList().Num();
}
FString GetFriendName(const uint PlayerUid)
{
    FString local_4;
    FMS_PlayerData& local_8 = FMS_PlayerData::Get(FASCommonUtils::GetLocalPlayerController());
    if (local_8)
    {
        TEUIModelRef<FM_Player> local_12 = local_8.GetCachedPlayerData(PlayerUid);
        if (local_12)
        {
            if ((int(local_12.opArrow().GetNickNameAttr().GetTrust())) >= 3)
            {
                local_4 = local_12.opArrow().GetNickName();
            }
        }
    }
    if (local_4.IsEmpty())
    {
        FPlayerBriefInfo local_40;
        if (FriendUtil::TryGetFriendBrief(PlayerUid, local_40))
        {
            local_4 = local_40.GetNickname();
        }
    }
    return local_4;
}
bool IsFriend(const uint PlayerUid)
{
    if (PlayerUid == 0)
    {
        return false;
    }
    APlayerController local_6 = FASCommonUtils::GetLocalPlayerController();
    if ((!((local_6 != nullptr))))
    {
        return false;
    }
    FMS_FriendDataModel& local_8 = FMS_FriendDataModel::Get(local_6);
    if (local_8)
    {
        return local_8.GetFriendUidToIndex().Contains(PlayerUid);
    }
    return false;
}
bool HasPendingFriendApply(const uint ApplicantUid)
{
    if (ApplicantUid == 0)
    {
        return false;
    }
    return FMS_FriendDataModel::Get(FASCommonUtils::GetLocalPlayerController()).GetApplyUidToIndex().Contains(ApplicantUid);
}
void HandleApplyFriend(const uint ApplicantUid, const EPendingConfirmAction Action)
{
    if (ApplicantUid == 0)
    {
        return;
    }
    bool local_2 = FriendUtil::HasPendingFriendApply(ApplicantUid);
    if (!(local_2))
    {
        return;
    }
    FEUIModelRef local_14 = FEUIModelRef(FMS_FriendDataModel::Get(FASCommonUtils::GetLocalPlayerController()));
    FEUIMessageBus::Publish(EUIMessageBus);
    FMsg_HandleFriendApply local_16;
    local_16.FriendUid = ApplicantUid;
    local_16.bAccept = (int(Action) == 1);
    return;
}
bool TryGetFriendBrief(const uint PlayerUid, FPlayerBriefInfo &inout OutBrief)
{
    if (PlayerUid == 0)
    {
        return false;
    }
    FMS_FriendDataModel& local_6 = FMS_FriendDataModel::Get(FASCommonUtils::GetLocalPlayerController());
    if (!(local_6.GetFriendUidToIndex().Contains(PlayerUid)))
    {
        return false;
    }
    int local_8 = local_6.GetFriendUidToIndex()[PlayerUid];
    OutBrief = GetBrief();
    return true;
}
bool TryGetPendingApplyApplicantBrief(const uint ApplicantUid, FPlayerBriefInfo &inout OutApplicantBrief)
{
    if (ApplicantUid == 0)
    {
        return false;
    }
    FMS_FriendDataModel& local_6 = FMS_FriendDataModel::Get(FASCommonUtils::GetLocalPlayerController());
    if (!(local_6.GetApplyUidToIndex().Contains(ApplicantUid)))
    {
        return false;
    }
    int local_8 = local_6.GetApplyUidToIndex()[ApplicantUid];
    OutApplicantBrief = GetBrief();
    return true;
}
bool IsInLastSearchResults(const uint PlayerUid)
{
    if (PlayerUid == 0)
    {
        return false;
    }
    const TArray<TEUIModelRef<FM_FriendRow>>& local_6 = FMS_FriendDataModel::Get(FASCommonUtils::GetLocalPlayerController()).GetSearchResults();
    int local_7 = 0;
    for (; local_7 < local_6.Num(); ++local_7)
    {
        if (GetBrief().GetUid() == PlayerUid)
        {
            return true;
        }
    }
    return false;
}
int GetPendingApplyCount()
{
    return FMS_FriendDataModel::Get(FASCommonUtils::GetLocalPlayerController()).GetApplyList().Num();
}
TArray<uint> GetAllOnlineFriend()
{
    TArray<uint> local_4;
    for (auto& local_22 : FMS_FriendDataModel::Get(FASCommonUtils::GetLocalPlayerController()).GetFriendList())
    {
        local_22;
        if (GetBrief().GetbIsOnline())
        {
            local_4.Add(GetFriendUid());
        }
    }
    return local_4;
}
void PublishDeferredPopup(const bool bWeakTips, const FText &inout Content)
{
    if (Content.IsEmpty())
    {
        return;
    }
    FEUIModelRef local_12 = FEUIModelRef(FMS_FriendDataModel::Get(FASCommonUtils::GetLocalPlayerController()));
    FEUIMessageBus::Publish(EUIMessageBus);
    FMsg_FriendUtilDeferredPopup local_14;
    local_14.bWeakTips = bWeakTips;
    local_14.Content = Content;
    return;
}
void ShowAddSelfAsFriendTips()
{
    const UChatSettings local_2;
    GetGameplaySettings<UChatSettings> local_4;
    local_2 = local_4;
    if ((!((local_2 != nullptr))))
    {
        return;
    }
    FText local_16 = ChatSystemUtil::ResolveKLTextData(local_2.AddSelfAsFriendTipsTextData);
    if (local_16.IsEmpty())
    {
        return;
    }
    FriendUtil::PublishDeferredPopup(false, local_16);
    return;
}
void ShowSearchFriendEmptyWeakTips()
{
    const UChatSettings local_2;
    GetGameplaySettings<UChatSettings> local_4;
    local_2 = local_4;
    FText local_10;
    if (local_2 != nullptr)
    {
        local_10 = ChatSystemUtil::ResolveKLTextData(local_2.SearchFriendEmptyTipsTextData);
    }
    if (local_10.IsEmpty())
    {
        local_10 = NSLOCTEXT("Friend", "SearchFriendEmpty", "иЇ·иѕ“е…ҐеҐЅеЏ‹жµз§°ж€–UID");
    }
    FriendUtil::PublishDeferredPopup(true, local_10);
    return;
}
}
