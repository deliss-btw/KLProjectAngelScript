
namespace FSocialTeamUtils
{
int GetMaxSocialMember()
{
    return 4;
}
void GetAllPlayerUidInWorld(TArray<uint> &inout Uids, TArray<FECSEntity> &inout Entities)
{
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    FECSRuntimeView local_42 = local_4.GetRuntimeView(EECSRuntimeViewType(2));
    Include local_46;
    local_46.opCall();
    FECSRuntimeViewIterator local_80 = local_42.Iterator();
    for (; local_80.CanProceed;)
    {
        const FECSEntity& local_118 = local_80.Proceed();
        Get local_122;
        Uids.Add(local_122.opCall().GetPlayerId());
        Entities.Add(local_118);
    }
    return;
}
uint64 GetSocialTeamId(const FECSEntity &inout Entity)
{
    if (Entity.IsValid() == false)
    {
        return 0;
    }
    Has local_8;
    bool local_2 = local_8.opCall();
    if (local_2)
    {
        Get local_12;
        return local_12.opCall().GetSocialTeamId();
    }
    return 0;
}
bool IsInSameSocialTeam(const FECSEntity &inout Entity1, const FECSEntity &inout Entity2)
{
    bool local_3;
    bool local_2 = !(false);
    if (!(Entity1.IsValid()) == local_2)
    {
        local_3 = true;
    }
    else
    {
        local_2 = !(Entity2.IsValid());
        local_2 = (local_2 == !(false));
        local_3 = local_2;
    }
    if (local_3)
    {
        return false;
    }
    Has local_8;
    local_3 = local_8.opCall();
    if (!(local_3))
    {
        local_2 = false;
    }
    else
    {
        local_2 = local_8.opCall();
    }
    if (local_2)
    {
        int64 local_18;
        int64 local_14;
        Get local_12;
        local_14 = local_12.opCall().GetSocialTeamId();
        local_18 = local_12.opCall().GetSocialTeamId();
        if (local_14 > 0 && (local_14 == local_18))
        {
            return true;
        }
    }
    return false;
}
FClientSocialTeamInfo ClientGetSocialTeamInfo()
{
    FClientSocialTeamInfo __r;
    FAngelscriptGameThreadScopeWorldContext local_2 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    UGameClientConnectionSubsystem local_6 = UGameClientConnectionSubsystem::Get();
    return __r;
}
bool ClientFindSocialTeamMemberInfo(const uint MemberID, FSocialTeamMember &out OutMember)
{
    FAngelscriptGameThreadScopeWorldContext local_34 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    for (auto& local_54 : UGameClientConnectionSubsystem::Get().ClientSocialTeamInfo.Members)
    {
        if (int(local_54.MemberID) == MemberID)
        {
            return true;
        }
    }
    return false;
}
FString ClientGetSocialTeamMemberNameByUid(const uint MemberID)
{
    if (!(ECS::GetRuntimeInfo().IsClient))
    {
        return "";
    }
    if (!(FASCommonUtils::GetLocalPlayerProxy().IsValid()))
    {
        return "";
    }
    FAngelscriptGameThreadScopeWorldContext local_12 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    UGameClientConnectionSubsystem local_18 = UGameClientConnectionSubsystem::Get();
    if (local_18.ClientSocialTeamInfo.TeamID > 0)
    {
        return local_18.ClientSocialTeamInfo.GetMemberNameByUid(MemberID);
    }
    return "";
}
void ServerUpdateCombatTeamBySocialTeam()
{
    int local_46 = 0;
    bool local_51 = false;
    Get local_66;
    int64 local_68;
    TArray<FECSEntity> local_88;
    int local_114 = 0;
    int local_120 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    XLog(ELog(27), "ServerUpdateCombatTeamBySocialTeam");
    TArray<FECSEntity> local_6;
    TMap<uint64, FTeamEntityList> local_26;
    BlueprintFunctions_Level::GetAllPlayerProxys(local_6);
    for (auto& local_40 : local_6)
    {
        if (local_46 && ((local_46.GetSocialTeamId() > 0)))
        {
            local_26.FindOrAdd(local_46.GetSocialTeamId()).Entities.Add(local_40);
        }
        XLog(ELog(27), FString().Append("ServerUpdateCombatTeamBySocialTeam PlayerEntity=").Append(local_40).Append(" SocialTeamId=").Append(local_46.GetSocialTeamId()));
    }
    for (auto& local_40 : local_6)
    {
        Get local_60;
        const FC_PlayerInTeam& local_62 = local_60.opCall();
        if (local_62)
        {
            if (local_62.GetTeamEntity().IsValid())
            {
                local_68 = local_66.opCall().GetSocialTeamId();
                local_51 = !(local_26.Contains(local_68));
                if (local_68 > 0 || !(local_26[local_68].Entities.Contains(local_40)))
                {
                    XLog(ELog(27), FString().Append("PlayerLeave CombatTeam PlayerEntity=").Append(local_40).Append(" OldTeamId=").Append(local_68));
                    FTeamUtils::RemoveMemberFromTeam(local_62.GetTeamEntity(), local_40, false);
                }
            }
        }
    }
    Has local_106;
    for (auto& local_86 : local_26)
    {
        local_68 = local_86.GetKey();
        if (local_88.Num() > 0)
        {
            FECSEntity local_94 = FTeamUtils::GetTeamEntityBySocialTeamId(local_68);
            if (!(local_94.IsValid()))
            {
                local_94 = FTeamUtils::CreateTeam(local_88[0], 0);
                Modify local_102;
                local_102.opCall().SetSocialTeamId(local_68);
                XLog(ELog(27), FString().Append("Create CombatTeam TeamEntity=").Append(local_94).Append(" SocialTeamId=").Append(local_68).Append(" Leader=").Append(local_88[0]));
            }
            for (auto& local_40 : local_88)
            {
                if (!(local_106.opCall()))
                {
                    XLog(ELog(27), FString().Append("Add to CombatTeam MemberEntity=").Append(local_40).Append(" TeamEntity=").Append(local_94).Append(" SocialTeamId=").Append(local_68));
                    FTeamUtils::AddMemberToTeam(local_94, local_40);
                    continue;
                }
                int64 local_48 = local_66.opCall().GetSocialTeamId();
            }
        }
    }
    FECSWorldPtr local_108 = ECS::GetECSWorld();
    TArray<FECSEntity> local_118 = local_114.AllTeams;
    for (auto& local_40 : local_118)
    {
        int local_122 = local_120.GetMembers().Num() - 1;
        for (; local_122 >= 0; --local_122)
        {
            if (!(local_120.GetMembers()[local_122].GetEntity().IsValid()))
            {
                XLog(ELog(27), FString().Append("Prune invalid CombatTeam member TeamEntity=").Append(local_40).Append(" SocialTeamId=").Append(local_120.GetSocialTeamId()));
                local_120.GetModify_Members().RemoveAt(local_122);
            }
        }
        if (local_120.GetMembers().Num() == 0)
        {
            XLog(ELog(27), FString().Append("Destroy CombatTeam TeamEntity=").Append(local_40).Append(" SocialTeamId=").Append(local_120.GetSocialTeamId()));
            FTeamUtils::DestroyTeam(local_40);
            continue;
        }
        XLog(ELog(27), FString().Append("Keep CombatTeam TeamEntity=").Append(local_40).Append(" SocialTeamId=").Append(local_120.GetSocialTeamId()).Append(" Members=").Append(local_120.GetMembers().Num()));
    }
    return;
}
void JoinSocialTeam(const FECSEntity &inout HostPlayer, const FECSEntity &inout GuestPlayer)
{
    int local_9;
    if (ECS::GetRuntimeInfo().IsClient)
    {
        return;
    }
    bool local_2 = !(false);
    if (!(HostPlayer.IsValid()) == local_2 || (!(GuestPlayer.IsValid()) == !(false)))
    {
        return;
    }
    if ((HostPlayer == GuestPlayer))
    {
        return;
    }
    Has local_8;
    local_8.opCall();
    Get local_14;
    local_9 = local_14.opCall().GetPlayerId();
    FSocialTeamUtils::ServerSendTeamUpRequest(GuestPlayer, local_9);
    return;
}
void LeaveSocialTeam(const FECSEntity &inout Entity, const uint LeaderUid)
{
    if (ECS::GetRuntimeInfo().IsClient)
    {
        return;
    }
    if (Entity.IsValid() == false)
    {
        return;
    }
    FSocialTeamUtils::ServerSendLeaveTeamRequest(Entity, FSocialTeamUtils::GetSocialTeamId(Entity));
    return;
}
UFUNCTION()
void ClinetToServerGetNearbyNoTeamPlayerList(const FECSEntity &inout Entity)
{
    if (!(ECS::GetRuntimeInfo().IsClient))
    {
        return;
    }
    if (Entity.IsValid() == false)
    {
        return;
    }
    SendEvent local_6;
    local_6.opCall(FFPTime(-1));
    return;
}
uint64 GetPlayerSocialTeamId(const FECSEntity &inout PlayerEntity)
{
    Get local_4;
    const FC_DSPlayerInfo& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.GetSocialTeamId();
    }
    return 0;
}
UFUNCTION()
void ClientSendTeamUp(const FECSEntity &inout Entity, const uint TargetUid)
{
    if (!(ECS::GetRuntimeInfo().IsClient) || !(Entity.IsValid()))
    {
        return;
    }
    FFPTime local_8 = FFPTime(-1);
    FCE_ClientToServerTeamUp local_12;
    local_12.TargetUid = TargetUid;
    return;
}
UFUNCTION()
void ClientSendLeaveTeam(const FECSEntity &inout Entity)
{
    if (!(ECS::GetRuntimeInfo().IsClient) || !(Entity.IsValid()))
    {
        return;
    }
    FFPTime local_8 = FFPTime(-1);
    FCE_ClientToServerLeaveTeam local_12;
    local_12.TeamId = FSocialTeamUtils::GetSocialTeamId(Entity);
    return;
}
UFUNCTION()
void ClientSendKickTeammate(const FECSEntity &inout Entity, const uint KickUid)
{
    if (!(ECS::GetRuntimeInfo().IsClient) || !(Entity.IsValid()))
    {
        return;
    }
    FFPTime local_8 = FFPTime(-1);
    FCE_ClientToServerKickTeammate local_12;
    local_12.TeamId = FSocialTeamUtils::GetSocialTeamId(Entity);
    local_12.KickUid = KickUid;
    return;
}
UFUNCTION()
void ClientSendTransferCaptain(const FECSEntity &inout Entity, const uint NewCaptainUid)
{
    if (!(ECS::GetRuntimeInfo().IsClient) || !(Entity.IsValid()))
    {
        return;
    }
    FFPTime local_8 = FFPTime(-1);
    FCE_ClientToServerTransferCaptain local_12;
    local_12.TeamId = FSocialTeamUtils::GetSocialTeamId(Entity);
    local_12.NewCaptainUid = NewCaptainUid;
    return;
}
UFUNCTION()
void ClientSendTeamInviteReply(const FECSEntity &inout Entity, const uint SourceUid, const bool bAccept)
{
    if (!(ECS::GetRuntimeInfo().IsClient) || !(Entity.IsValid()))
    {
        return;
    }
    FFPTime local_8 = FFPTime(-1);
    FCE_ClientToServerTeamInviteReply local_12;
    local_12.TeamId = FSocialTeamUtils::GetSocialTeamId(Entity);
    local_12.SourceUid = SourceUid;
    local_12.bAccept = bAccept;
    return;
}
UFUNCTION()
void ClientSendTeamApplyReply(const FECSEntity &inout Entity, const uint SourceUid, const bool bAccept)
{
    if (!(ECS::GetRuntimeInfo().IsClient) || !(Entity.IsValid()))
    {
        return;
    }
    FFPTime local_8 = FFPTime(-1);
    FCE_ClientToServerTeamApplyReply local_12;
    local_12.TeamId = FSocialTeamUtils::GetSocialTeamId(Entity);
    local_12.SourceUid = SourceUid;
    local_12.bAccept = bAccept;
    return;
}
void ServerSendTeamUpRequest(const FECSEntity &inout Entity, const uint TargetUid)
{
    if (ECS::GetRuntimeInfo().IsClient || !(Entity.IsValid()))
    {
        return;
    }
    FAngelscriptGameThreadScopeWorldContext local_4 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    UGameDSConnectionSubsystem::Get().SendTeamUpRequest(Entity, TargetUid);
    return;
}
void ServerSendLeaveTeamRequest(const FECSEntity &inout Entity, const uint64 TeamId)
{
    if (ECS::GetRuntimeInfo().IsClient || !(Entity.IsValid()))
    {
        return;
    }
    FAngelscriptGameThreadScopeWorldContext local_4 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    UGameDSConnectionSubsystem::Get().SendNewLeaveTeamRequest(Entity, TeamId);
    return;
}
void ServerSendKickTeammateRequest(const FECSEntity &inout Entity, const uint64 TeamId, const uint KickUid)
{
    if (ECS::GetRuntimeInfo().IsClient || !(Entity.IsValid()))
    {
        return;
    }
    FAngelscriptGameThreadScopeWorldContext local_4 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    UGameDSConnectionSubsystem::Get().SendKickTeammateRequest(Entity, TeamId, KickUid);
    return;
}
void ServerSendTransferCaptainRequest(const FECSEntity &inout Entity, const uint64 TeamId, const uint NewCaptainUid)
{
    if (ECS::GetRuntimeInfo().IsClient || !(Entity.IsValid()))
    {
        return;
    }
    FAngelscriptGameThreadScopeWorldContext local_4 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    UGameDSConnectionSubsystem::Get().SendTransferCaptainRequest(Entity, TeamId, NewCaptainUid);
    return;
}
void ServerSendTeamInviteReplyRequest(const FECSEntity &inout Entity, const uint64 TeamId, const uint SourceUid, const bool bAccept)
{
    if (ECS::GetRuntimeInfo().IsClient || !(Entity.IsValid()))
    {
        return;
    }
    FAngelscriptGameThreadScopeWorldContext local_4 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    UGameDSConnectionSubsystem::Get().SendTeamInviteReplyRequest(Entity, TeamId, SourceUid, bAccept);
    return;
}
void ServerSendTeamApplyReplyRequest(const FECSEntity &inout Entity, const uint64 TeamId, const uint SourceUid, const bool bAccept)
{
    if (ECS::GetRuntimeInfo().IsClient || !(Entity.IsValid()))
    {
        return;
    }
    FAngelscriptGameThreadScopeWorldContext local_4 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    UGameDSConnectionSubsystem::Get().SendTeamApplyReplyRequest(Entity, TeamId, SourceUid, bAccept);
    return;
}
}
