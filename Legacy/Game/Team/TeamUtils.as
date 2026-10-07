
namespace FTeamUtils
{
FECSEntity GetPawnEntityFromTeamMember(const FECSEntity &inout TeamMemberEntity, const bool bIfRidingGetRider = true)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        Get local_14;
        return bIfRidingGetRider ? FASCommonUtils::GetUniqueAvatarPawnEntity(TeamMemberEntity) : local_14.opCall().GetPlayerPawnEntity();
    }
    Has local_22;
    bool local_5_2 = local_22.opCall();
    if (local_5_2)
    {
        FECSEntity local_30;
        if (bIfRidingGetRider)
        {
            local_30 = FASCommonUtils::GetUniquePawnEntityFromAIController(TeamMemberEntity);
        }
        else
        {
            Get local_26;
            local_30 = FECSEntity(local_26.opCall().GetPawnEntity());
        }
        return local_30;
    }
    return ENTITY_NULL;
}
FECSEntity GetTeamEntityForPawn(const FECSEntity &inout PawnEntity)
{
    bool local_2 = !(false);
    if (!(PawnEntity.IsValid()) == local_2)
    {
        return ENTITY_NULL;
    }
    Get local_6;
    const FC_ControlledByPlayer& local_8 = local_6.opCall();
    if (local_8)
    {
        Get local_24;
        Has local_20;
        if (!(!(FECSEntity(local_8.GetPlayerEntity()).IsValid())) && local_20.opCall())
        {
            return local_24.opCall().GetTeamEntity();
        }
    }
    else
    {
        Get local_24;
        Has local_20;
        Get local_28;
        const FC_ControlledByAI& local_30 = local_28.opCall();
        if (local_30)
        {
            if (!(FECSEntity(local_30.GetControllerEntity()).IsValid()))
            {
                local_2 = false;
            }
            else
            {
                local_2 = local_20.opCall();
            }
            if (local_2)
            {
                return local_24.opCall().GetTeamEntity();
            }
        }
    }
    return ENTITY_NULL;
}
FECSEntity GetTeamEntityForController(const FECSEntity &inout ControllerEntity)
{
    if (!(ControllerEntity.IsValid()) == !(false))
    {
        return ENTITY_NULL;
    }
    Has local_6;
    bool local_2 = local_6.opCall();
    if (local_2)
    {
        Get local_10;
        return local_10.opCall().GetTeamEntity();
    }
    return ENTITY_NULL;
}
FECSEntity CreateTeam(const FECSEntity &inout Leader, const int TeamID = 0)
{
    bool local_1;
    int local_30 = 0;
    int local_40 = 0;
    bool local_2 = !(false);
    if (!(Leader.IsValid()) == local_2)
    {
        local_1 = true;
    }
    else
    {
        Has local_6;
        local_1 = local_6.opCall();
    }
    if (local_1)
    {
        return ENTITY_NULL;
    }
    FECSEntity local_18 = Leader.GetWorld().Create(EEntityType(9), n"Team");
    FC_NetRelevancePolicy local_23;
    Assign local_22;
    local_22.opCall(local_23).RelevancePolicyType = (5 != 0);
    local_30.SetTeamID(TeamID);
    local_30.AddMember(Leader);
    ModifyOrAdd local_34;
    local_34.opCall().SetTeamEntity(local_18);
    FECSWorldPtr local_12 = Leader.GetWorld();
    local_40.AllTeams.Add(local_18);
    return local_18;
}
void DestroyTeam(const FECSEntity &inout TeamEntity)
{
    if (TeamEntity.IsValid() == false)
    {
        return;
    }
    Get local_6;
    const FC_TeamInfo& local_8 = local_6.opCall();
    if (local_8)
    {
        for (auto& local_22 : local_8.GetMembers())
        {
            local_22;
            Remove local_26;
            local_26.opCall();
        }
    }
    FECSWorldPtr local_28 = TeamEntity.GetWorld();
    TeamEntity.DestroyDeferred();
    return;
}
void AddMemberToTeam(const FECSEntity &inout TeamEntity, const FECSEntity &inout InMember)
{
    int local_32 = 0;
    bool local_2 = !(false);
    if (!(TeamEntity.IsValid()) == local_2 || (!(InMember.IsValid()) == !(false)))
    {
        return;
    }
    FECSEntity local_8 = InMember;
    Has local_12;
    bool local_1 = local_12.opCall();
    if (local_1)
    {
    }
    else
    {
        Has local_16;
        local_16.opCall();
    }
    Get local_20;
    const FC_PlayerInTeam& local_22 = local_20.opCall();
    if (local_22)
    {
        if ((FECSEntity(local_22.GetTeamEntity()) == TeamEntity))
        {
            return;
        }
        FTeamUtils::RemoveMemberFromTeam(local_22.GetTeamEntity(), local_8, true);
    }
    local_32.AddMember(local_8);
    ModifyOrAdd local_36;
    local_36.opCall().SetTeamEntity(TeamEntity);
    FECSWorldPtr local_38 = TeamEntity.GetWorld();
    Modify local_42;
    FTeamUtils::TickTeamManagerExtraInfo(local_42.opCall());
    return;
}
void RemoveMemberFromTeam(const FECSEntity &inout TeamEntity, const FECSEntity &inout MemberToRemove, const bool bAutoDestroyTeam = true)
{
    int local_10 = 0;
    bool local_2 = !(false);
    if (!(TeamEntity.IsValid()) == local_2 || (!(MemberToRemove.IsValid()) == !(false)))
    {
        return;
    }
    local_10.RemoveMember(MemberToRemove);
    Remove local_14;
    local_14.opCall();
    if (local_10.GetMembers().Num() == 0)
    {
        if (bAutoDestroyTeam)
        {
            FTeamUtils::DestroyTeam(TeamEntity);
        }
    }
    FECSWorldPtr local_18 = TeamEntity.GetWorld();
    Modify local_22;
    FTeamUtils::TickTeamManagerExtraInfo(local_22.opCall());
    return;
}
void JoinCombatTeam(const FECSEntity &inout Inviter, const FECSEntity &inout Invitee)
{
    int local_28 = 0;
    if (ECS::GetRuntimeInfo().IsClient)
    {
        return;
    }
    bool local_2 = !(false);
    if (!(Inviter.IsValid()) == local_2 || (!(Invitee.IsValid()) == !(false)))
    {
        return;
    }
    FECSEntity local_8;
    Get local_12;
    const FC_PlayerInTeam& local_14 = local_12.opCall();
    local_8 = local_14 ? local_14.GetTeamEntity() : FTeamUtils::CreateTeam(Inviter, 0);
    if (local_8.IsValid())
    {
        FTeamUtils::AddMemberToTeam(local_8, Invitee);
        FFPTime local_26 = FFPTime(-1);
        local_28.Inviter = Inviter;
        local_28.Invitee = Invitee;
    }
    return;
}
void LeaveCombatTeam(const FECSEntity &inout Entity)
{
    if (ECS::GetRuntimeInfo().IsClient)
    {
        return;
    }
    if (Entity.IsValid() == false)
    {
        return;
    }
    FECSEntity local_6 = FTeamUtils::GetTeamEntityForController(Entity);
    if (local_6.IsValid())
    {
        FTeamUtils::RemoveMemberFromTeam(local_6, Entity, true);
    }
    return;
}
UFUNCTION()
FECSEntity GetPlayerOrAvatarTeamEntity(const FECSEntity &inout Entity)
{
    bool local_1;
    if (!(Entity))
    {
        return ENTITY_NULL;
    }
    Has local_6;
    if (local_6.opCall())
    {
        local_1 = true;
    }
    else
    {
        Has local_10;
        local_1 = local_10.opCall();
    }
    if (local_1)
    {
        return FTeamUtils::GetTeamEntityForPawn(Entity);
    }
    return FTeamUtils::GetTeamEntityForController(Entity);
}
UFUNCTION()
float32 GetTeamLinkEnergy(const FECSEntity &inout Entity)
{
    return 0.0f;
}
UFUNCTION()
void SetTeamLinkEnergy(const FECSEntity &inout Entity, const float32 LinkEnergy)
{
    return;
}
UFUNCTION()
void AddTeamLinkEnergy(const FECSEntity &inout Entity, const float32 AddLinkEnergy)
{
    return;
}
UFUNCTION()
bool IsPlayerOrAvatarInTeam(const FECSEntity &inout Entity, const FECSEntity &inout TeamEntity)
{
    if ((FTeamUtils::GetPlayerOrAvatarTeamEntity(Entity) == TeamEntity))
    {
        return true;
    }
    return false;
}
UFUNCTION()
bool IsInSameTeam(const FECSEntity &inout Entity1, const FECSEntity &inout Entity2)
{
    bool local_2 = !(false);
    if (!(Entity1.IsValid()) == local_2 || (!(Entity2.IsValid()) == !(false)))
    {
        return false;
    }
    FECSEntity local_8 = FASCommonUtils::GetUniquePlayerEntity(Entity1);
    if ((local_8 == FASCommonUtils::GetUniquePlayerEntity(Entity2)))
    {
        return true;
    }
    FECSEntity local_8_2 = FTeamUtils::GetPlayerOrAvatarTeamEntity(Entity1);
    if (!(local_8_2.IsValid()))
    {
        local_8_2 = FTeamUtils::GetTeamEntityForPawn(Entity1);
    }
    if (!(local_8_2.IsValid()))
    {
        return false;
    }
    FECSEntity local_16 = FTeamUtils::GetPlayerOrAvatarTeamEntity(Entity2);
    if (!(local_16.IsValid()))
    {
        local_16 = FTeamUtils::GetTeamEntityForPawn(Entity2);
    }
    if (!(local_16.IsValid()))
    {
        return false;
    }
    return (local_8_2 == local_16);
}
UFUNCTION()
void SpawnAITeammateForPlayer(const FECSEntity &inout PlayerPawnEntity, const TSubclassOf<AECSPrefab> &inout AITeammatePrefab, const FVector &inout SpawnLoc, const FRotator &inout SpawnRot)
{
    int local_22 = 0;
    FECSEntity local_8 = FASCommonUtils::GetUniquePlayerEntity(PlayerPawnEntity);
    if (local_8.IsValid() == false)
    {
        return;
    }
    if (ECS::RequestEntityByPrefabDeferred(AITeammatePrefab, SpawnLoc, SpawnRot, EPrefabCollisionAlignment(2), EECSRegType(0), false).IsValid())
    {
        local_22.PlayerEntity = local_8;
        FC_AIPlayerTag local_28;
        Assign local_26;
        local_26.opCall(local_28);
    }
    return;
}
TArray<FECSEntity> GetTeammates(const FECSEntity &inout Entity)
{
    TArray<FECSEntity> local_4;
    if (FTeamUtils::GetPlayerOrAvatarTeamEntity(Entity).IsValid())
    {
        Get local_18;
        const FC_TeamInfo& local_20 = local_18.opCall();
        if (local_20)
        {
            for (auto& local_34 : local_20.GetMembers())
            {
                if (local_34.GetEntity().IsValid())
                {
                    local_4.Add(local_34.GetEntity());
                }
            }
        }
    }
    return local_4;
}
TArray<FECSEntity> GetTeammatesInRange(const FECSEntity &inout Entity, const float32 Range)
{
    TArray<FECSEntity> local_4;
    if (FTeamUtils::GetPlayerOrAvatarTeamEntity(Entity).IsValid())
    {
        Get local_18;
        const FC_TeamInfo& local_20 = local_18.opCall();
        if (local_20)
        {
            for (auto& local_34 : local_20.GetMembers())
            {
                FECSEntity local_8 = FTeamUtils::GetPawnEntityFromTeamMember(local_34.GetEntity(), true);
                if (local_8.IsValid())
                {
                    if (FASCommonUtils::CalculateEntityDistance3D(Entity, local_8) < Range)
                    {
                        local_4.Add(local_8);
                    }
                }
            }
        }
    }
    return local_4;
}
bool IsAvatarInTeam(const FECSEntity &inout AvatarEntity)
{
    FECSEntity local_8 = FASCommonUtils::GetUniquePlayerEntity(AvatarEntity);
    if (local_8.IsValid())
    {
        Has local_14;
        if (local_14.opCall())
        {
            return true;
        }
    }
    return false;
}
bool IsTeamHasFakeCharacter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        if (local_12.GetRefCount() > 0)
        {
            return true;
        }
    }
    TArray<FECSEntity> local_22 = FTeamUtils::GetTeammates(Entity);
    for (auto& local_36 : local_22)
    {
        FASCommonUtils::GetUniqueAvatarPawnEntity(local_36);
        bool local_5_2 = local_4.opCall();
        if (local_5_2)
        {
            if (local_12.GetRefCount() > 0)
            {
                return true;
            }
        }
    }
    return false;
}
void TickTeamManagerExtraInfo(const FCS_TeamManager &inout TeamManager)
{
    int local_22;
    int local_82 = 0;
    for (auto& local_16 : TeamManager)
    {
        local_16;
        for (auto& local_36 : local_22.GetModify_Members())
        {
            FECSEntity local_40 = FECSEntity(local_36.GetEntity());
            if (!(local_40.IsValid()))
            {
                continue;
            }
            FECSEntity local_44 = FTeamUtils::GetPawnEntityFromTeamMember(local_40, true);
            if (local_44.IsValid())
            {
                Get local_52;
                local_36.SetPosition(local_52.opCall().GetPosition());
                local_36.SetAvatarConfig(TDataObjectPtr<FAvatarPrefabConfig>());
                if (!(local_82) || !((local_82.GetAttributeSet() != nullptr)))
                {
                    continue;
                }
                float32 local_100 = FGameAttributeUtils::GetAttributeValue(local_44, Attribute::HPMax, ECS::GetECSWorld().GetFixedTime().Time, false, 0.0f, false, FGameAttributeModificationValue());
                local_36.SetHealthRation(FGameAttributeUtils::GetAttributeValue(local_44, Attribute::HP, ECS::GetECSWorld().GetFixedTime().Time, false, 0.0f, false, FGameAttributeModificationValue()) / local_100);
            }
        }
    }
    return;
}
bool IsSingleTeamWorld()
{
    return (int(FTeamUtils::GetCombatTeamRule()) == 2);
}
bool IsPVXTeamWorld()
{
    return (int(FTeamUtils::GetCombatTeamRule()) == 3);
}
ECombatTeamRule GetCombatTeamRule()
{
    int local_51 = 0;
    if (FLevelUtils::GetCurrentLevelInfoConfig(nullptr).IsSet() && GetGameRuleConfig().IsSet())
    {
        return ECombatTeamRule(local_51);
    }
    return ECombatTeamRule(0);
}
bool GetIsInCityTeamState()
{
    int local_50 = 0;
    if (FLevelUtils::GetCurrentLevelInfoConfig(nullptr).IsSet() && (local_50 == 1 || (local_50 == 2)))
    {
        return true;
    }
    return false;
}
FECSEntity GetTeamEntityBySocialTeamId(const uint64 SocialTeamId)
{
    int local_8;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_28;
    for (auto& local_24 : local_8.AllTeams)
    {
        if (local_28.opCall().GetSocialTeamId() == SocialTeamId)
        {
            return local_24;
        }
    }
    return ENTITY_NULL;
}
bool FindTeamMemberInfo(const FECSEntity &inout Entity, FTeamMemberInfo &inout OutMemberInfo)
{
    if (FTeamUtils::GetPlayerOrAvatarTeamEntity(Entity))
    {
        Get local_14;
        const FC_TeamInfo& local_16 = local_14.opCall();
        if (local_16)
        {
            for (auto& local_30 : local_16.GetMembers())
            {
                if ((FECSEntity(local_30.GetEntity()) == Entity))
                {
                    OutMemberInfo = local_30;
                    return true;
                }
            }
        }
    }
    return false;
}
void HandlePlayerEnterForSingleTeam(const FECSEntity &inout PlayerEntity)
{
    int local_8 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (local_8.AllTeams.Num() > 0)
    {
        FTeamUtils::AddMemberToTeam(local_8.AllTeams[0], PlayerEntity);
        return;
    }
    TArray<FECSEntity> local_20 = FGameUtils::GetAllPlayerControllerEntities(true);
    if (local_20.Num() > 0)
    {
        FECSEntity local_24 = FTeamUtils::CreateTeam(local_20[0], 0);
        for (auto& local_42 : local_20)
        {
            FTeamUtils::AddMemberToTeam(local_24, local_42);
        }
    }
    return;
}
void HandlePlayerEnterForPVXTeam(const FECSEntity &inout PlayerEntity)
{
    int local_14 = 0;
    int local_17;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    if (!(local_6.opCall()))
    {
        return;
    }
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    int local_16 = FASCommonUtils::GetPlayerUidFromPlayerEntity(PlayerEntity);
    if (!(local_14.GetPlayerEntries().Contains(local_16)))
    {
        return;
    }
    local_17 = local_14.GetPlayerEntries()[local_16].GetTeamId();
    if ((local_17 < 0 || (local_17 >= 4)))
    {
        return;
    }
    Has local_24;
    bool local_19 = local_24.opCall();
    if (local_19)
    {
        return;
    }
    TArray<uint> local_28;
    for (auto& local_46 : local_14.GetPlayerEntries())
    {
        if (GetTeamId() != local_17)
        {
            continue;
        }
        local_28.Add(local_46.GetKey());
    }
    if (local_28.Num() < 2)
    {
        return;
    }
    TArray<FECSEntity> local_52;
    TArray<FECSEntity> local_60 = FGameUtils::GetAllPlayerControllerEntities(true);
    for (auto& local_74 : local_60)
    {
        if (local_28.Contains(FASCommonUtils::GetPlayerUidFromPlayerEntity(local_74)))
        {
            local_52.Add(local_74);
        }
    }
    if (local_52.Num() < 2)
    {
        return;
    }
    FECSEntity local_80 = FECSEntity(ENTITY_NULL);
    for (auto& local_74 : local_52)
    {
        bool local_19_2 = local_24.opCall();
        if (local_19_2)
        {
            Get local_84;
            local_80 = local_84.opCall().GetTeamEntity();
            break;
        }
    }
    if (local_80.IsValid())
    {
        FTeamUtils::AddMemberToTeam(local_80, PlayerEntity);
        return;
    }
    FECSEntity local_88 = FECSEntity(local_52[0]);
    FECSEntity local_96 = FTeamUtils::CreateTeam(local_88, local_17);
    for (auto& local_74 : local_52)
    {
        FTeamUtils::AddMemberToTeam(local_96, local_74);
    }
    return;
}
void HandlePlayerEnterForCombatTeam(const FECSEntity &inout PlayerEntity)
{
    Has local_4;
    int local_11;
    if (!(local_4.opCall()))
    {
        return;
    }
    Has local_10;
    bool local_5 = local_10.opCall();
    if (local_5)
    {
        return;
    }
    Get local_16;
    local_11 = local_16.opCall().GetTeam();
    TArray<FECSEntity> local_22;
    TArray<FECSEntity> local_30 = FGameUtils::GetAllPlayerControllerEntities(true);
    for (auto& local_44 : local_30)
    {
        if (local_4.opCall() && (local_16.opCall().GetTeam() == local_11))
        {
            local_22.Add(local_44);
        }
    }
    if (local_22.Num() < 2)
    {
        return;
    }
    FECSEntity local_52 = FECSEntity(ENTITY_NULL);
    for (auto& local_44 : local_22)
    {
        local_5 = local_10.opCall();
        if (local_5)
        {
            Get local_56;
            local_52 = local_56.opCall().GetTeamEntity();
            break;
        }
    }
    if (local_52.IsValid())
    {
        FTeamUtils::AddMemberToTeam(local_52, PlayerEntity);
        return;
    }
    FECSEntity local_60 = FECSEntity(local_22[0]);
    int local_46 = local_11;
    FECSEntity local_68 = FTeamUtils::CreateTeam(local_60, local_46);
    for (auto& local_44 : local_22)
    {
        FTeamUtils::AddMemberToTeam(local_68, local_44);
    }
    return;
}
}
