
namespace MissionNetUtils
{
EMissionStatus GSStatusToMissionStatus(const uint NetMissionStatus)
{
    if (NetMissionStatus == 0)
    {
        return EMissionStatus(0);
    }
    if (NetMissionStatus == 1)
    {
        return EMissionStatus(1);
    }
    if (NetMissionStatus == 2)
    {
        return EMissionStatus(2);
    }
    if (NetMissionStatus == 3)
    {
        return EMissionStatus(3);
    }
    if (NetMissionStatus == 4)
    {
        return EMissionStatus(4);
    }
    return EMissionStatus(0);
}
TMap<uint, FMissionDetail> ConvertPlayerMissionInfo(const FPbDsPlayerMissionInfo &inout GsMissionInfo)
{
    TMap<uint, FMissionDetail> local_20;
    int local_21 = 0;
    for (; local_21 < GsMissionInfo.GetMissionInfo_Num(); ++local_21)
    {
        FPbMissionInfo local_34 = GsMissionInfo.GetMissionInfo_Index(local_21);
        TDataObjectPtr<FMissionConfig> local_68 = MissionUtils::FindMissionConfig(local_34.GetMissionId());
        if (!(local_68))
        {
            XError(ELog(63), FString().Append("ConvertPlayerMissionInfo: MissionConfig not found for MissionId: ").Append(local_34.GetMissionId()));
            continue;
        }
        FMissionDetail local_210;
        local_210.SetMissionConfig(local_68);
        local_210.SetMissionStatus(EMissionStatus(1));
        int local_23 = local_34.GetMissionPhaseId();
        if (local_23 != 0)
        {
            local_210.SetActivePhaseConfig(MissionUtils::FindMissionPhaseConfig(local_34.GetMissionPhaseId()));
            if (!(local_210.GetActivePhaseConfig().IsSet()))
            {
                XError(ELog(63), FString().Append("ConvertPlayerMissionInfo: MissionPhaseConfig not found for MissionPhaseId: ").Append(local_34.GetMissionPhaseId()));
            }
        }
        int local_237 = 0;
        for (; local_237 < local_34.GetHistoryMissionPhaseInfo_Num(); )
        {
            FPbMissionPhaseInfo local_248 = local_34.GetHistoryMissionPhaseInfo_Index(local_237);
            int& local_262 = int(local_210.GetModify_MissionPhaseStatusMap().FindOrAdd(local_248.GetMissionPhaseId()));
            int& local_262_2 = (int(MissionNetUtils::GSStatusToMissionStatus(local_248.GetMissionPhaseStatus())) != 0);
            ++local_237;
        }
        local_23 = local_210.GetActivePhaseId();
        if (local_23 != 0 && !(local_210.GetMissionPhaseStatusMap().Contains(local_23)))
        {
            local_210.GetModify_MissionPhaseStatusMap().Add(local_23, EMissionStatus(1));
        }
        local_20.Add(local_34.GetMissionId(), local_210);
    }
    return local_20;
}
TArray<FMissionTransitionInfo> ConvertMissionStatusChangeNotify(const TArray<FPbMissionStatusChange> &inout ServerData)
{
    TArray<FMissionTransitionInfo> local_4;
    for (auto& local_20 : ServerData)
    {
        FMissionTransitionInfo local_26;
        local_26.MissionId = local_20.GetMissionId();
        int local_28 = local_20.GetMissionStatus();
        local_26.CurMissionStatus = EMissionStatus(local_28);
        int local_29 = 0;
        for (; local_29 < local_20.GetMissionPhaseChangeInfos_Num(); )
        {
            FPbMissionStatusChangeInfo local_40 = local_20.GetMissionPhaseChangeInfos_Index(local_29);
            FStatusTransitionInfo local_56;
            local_56.SetMissionId(local_20.GetMissionId());
            local_56.SetMissionPhaseId(local_40.GetMissionPhaseId());
            local_28 = int(MissionNetUtils::GSStatusToMissionStatus(local_40.GetPrevStatus()));
            local_56.SetOldStatus(EMissionStatus(local_28));
            local_28 = int(MissionNetUtils::GSStatusToMissionStatus(local_40.GetNowStatus()));
            local_56.SetNewStatus(EMissionStatus(local_28));
            local_26.PhaseTransitionInfos.Add(local_56);
            ++local_29;
        }
        local_4.Add(local_26);
    }
    return local_4;
}
void HandleMissionStatusChangeNotify(const FECSEntity &inout PlayerEntity, const TArray<FPbMissionStatusChange> &inout MissionStatusChanges)
{
    int local_20 = 0;
    if (MissionStatusChanges.Num() == 0)
    {
        return;
    }
    TArray<FMissionTransitionInfo> local_8 = MissionNetUtils::ConvertMissionStatusChangeNotify(MissionStatusChanges);
    FFPTime local_18 = FFPTime(-1);
    local_20.PlayerEntityId = PlayerEntity.GetId();
    local_20.TransitionInfos = local_8;
    return;
}
void RequestGSMissionPhaseStatusChange(const FECSEntity &inout PlayerEntity, const uint MissionId, const uint MissionPhaseId, const EMissionStatus NewStatus)
{
    int local_6 = 0;
    if (local_6)
    {
        XLog(ELog(63), FString().Append("[Mission] RequestGSMissionPhaseStatusChange: ").Append(MissionId).Append(" ").Append(MissionPhaseId).Append(" ").Append(NewStatus));
        FPbMissionPhaseCompleteReq local_18;
        local_18.SetMissionId(MissionId);
        local_18.SetMissionPhaseId(MissionPhaseId);
        local_18.SetMissionPhaseStatus(int(NewStatus));
        UGameDSConnectionSubsystem::Get().SendProtoWrapperByPlayerUid(local_6.GetPlayerId(), local_18.ToWrapper());
        return;
    }
    XLog(ELog(63), FString().Append("[Mission] Failed to find PlayerController: ").Append(PlayerEntity));
    return;
}
}
