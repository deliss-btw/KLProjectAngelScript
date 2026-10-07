
namespace AutoTest::API::TeamAPI
{
uint GetAvatarTeamId()
{
    int local_16 = 0;
    int local_22 = 0;
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_8.IsValid()), "AvatarEntity is invalid.");
    bool local_9 = !(local_16);
    ThrowIf(local_9, "FC_ControlledByPlayer is null.");
    if (!(local_22) || !(local_22.GetTeamEntity().IsValid()))
    {
        return 0;
    }
    return local_22.GetTeamEntity().GetIdValue();
}
void SendTeamUpRequest(const uint TargetUid)
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalPlayerEntity();
    ThrowIf(!(local_8.IsValid()), "PlayerEntity is invalid.");
    FSocialTeamUtils::ClientSendTeamUp(local_8, TargetUid);
    return;
}
uint GetSelfUid()
{
    int local_16 = 0;
    ThrowIf(!(AutoTest::CommonUtils::GetLocalPlayerEntity().IsValid()), "PlayerEntity is invalid.");
    bool local_9 = !(local_16);
    ThrowIf(local_9, "FC_PlayerController is null.");
    return local_16.GetPlayerId();
}
void LeaveTeam()
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalPlayerEntity();
    ThrowIf(!(local_8.IsValid()), "PlayerEntity is invalid.");
    FSocialTeamUtils::ClientSendLeaveTeam(local_8);
    return;
}
uint GetTeamLeaderId()
{
    FAngelscriptGameThreadScopeWorldContext local_2 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    return UGameClientConnectionSubsystem::Get().ClientSocialTeamInfo.LeaderID;
}
void TransferLeader(const uint NewLeaderUid)
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalPlayerEntity();
    ThrowIf(!(local_8.IsValid()), "PlayerEntity is invalid.");
    FSocialTeamUtils::ClientSendTransferCaptain(local_8, NewLeaderUid);
    return;
}
int GetTeamMemberCount()
{
    FAngelscriptGameThreadScopeWorldContext local_2 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    return UGameClientConnectionSubsystem::Get().ClientSocialTeamInfo.Members.Num();
}
}
