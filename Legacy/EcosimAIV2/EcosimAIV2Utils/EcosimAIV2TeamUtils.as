
namespace FEcosimAIV2Utils
{
bool IsMountOrCoachEntity(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return false;
    }
    return Entity.MatchGameplayTag(GameplayTags::EntityMark_Type_Mount) || Entity.MatchGameplayTag(GameplayTags::EntityMark_Type_Coach);
}
bool IsPlayerAvatarEntity(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return false;
    }
    if (FEcosimAIV2Utils::IsMountOrCoachEntity(Entity))
    {
        return false;
    }
    Has local_6;
    if (!(local_6.opCall()))
    {
        return false;
    }
    return Entity.MatchGameplayTag(GameplayTags::EntityMark_Type_Avatar);
}
FECSEntity ResolveControllingPersonEntity(const FECSEntity &inout Entity)
{
    bool local_8 = false;
    bool local_10;
    FECSEntity local_4 = Entity;
    int local_5 = 0;
    while (local_8)
    {
        if (!(FEcosimAIV2Utils::IsMountOrCoachEntity(local_4)))
        {
            return local_4;
        }
        local_10 = false;
        Get local_14;
        const FC_MountIsDrivenBy& local_16 = local_14.opCall();
        if (local_16)
        {
            if (local_16.GetDriverEntity().IsValid())
            {
                local_4 = local_16.GetDriverEntity();
                local_10 = true;
            }
        }
        if (!(local_10))
        {
            Get local_20;
            const FC_ChainParentInfo& local_22 = local_20.opCall();
            if (local_22)
            {
                if (local_22.GetParent().IsValid())
                {
                    local_4 = local_22.GetParent();
                    local_10 = true;
                }
            }
        }
        if (!(local_10))
        {
            return ENTITY_NULL;
        }
        ++local_5;
        if (local_5 >= 8)
        {
            local_8 = false;
            continue;
        }
        local_8 = local_4.IsValid();
    }
    return ENTITY_NULL;
}
int GetEntityLeaderPriority(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return 0;
    }
    FECSEntity local_10 = FEcosimAIV2Utils::GetMemberMainEntityWithPlan(Entity);
    if (!(local_10.IsValid()) || (local_10 == Entity))
    {
        return 0;
    }
    if (local_10.MatchGameplayTag(GameplayTags::EntityMark_Type_Coach))
    {
        return 2;
    }
    if (local_10.MatchGameplayTag(GameplayTags::EntityMark_Type_Mount))
    {
        return 1;
    }
    return 0;
}
FECSEntity GetMemberMainEntityWithPlan(const FECSEntity &inout EntityMember)
{
    FECSEntity local_4;
    FECSEntity local_8;
    TArray<FECSEntity> local_12;
    FEcosimAIV2Utils::GetControlledTargets(EntityMember, true, local_12);
    int local_14 = 0;
    for (; local_14 < local_12.Num(); ++local_14)
    {
        FECSEntity local_20 = local_12[local_14];
        if (local_20.IsValid())
        {
            if (local_20.MatchGameplayTag(GameplayTags::EntityMark_Type_Coach))
            {
                local_4 = local_20;
                continue;
            }
            if (local_20.MatchGameplayTag(GameplayTags::EntityMark_Type_Mount))
            {
                local_8 = local_20;
            }
        }
    }
    if (local_4.IsValid())
    {
        return local_4;
    }
    if (local_8.IsValid())
    {
        return local_8;
    }
    return EntityMember;
}
FECSEntity GetMountOrSelf(const FECSEntity &inout Entity)
{
    TArray<FECSEntity> local_4;
    FEcosimAIV2Utils::GetControlledTargets(Entity, false, local_4);
    int local_6 = 0;
    for (; local_6 < local_4.Num(); local_6 = local_6 + 1)
    {
        if (local_4[local_6].IsValid() && local_4[local_6].MatchGameplayTag(GameplayTags::EntityMark_Type_Mount))
        {
            return local_4[local_6];
        }
    }
    return Entity;
}
float32 BoundsLength(const FBox3f &inout B)
{
    return (B.Max.X - B.X);
}
float32 BoundsWidth(const FBox3f &inout B)
{
    return (B.Max.Y - B.Y);
}
FVector BoundsCenter(const FBox3f &inout B)
{
    return FVector(((B.Max.X + B.Min.X) * 0.5f), ((B.Max.Y + B.Min.Y) * 0.5f), ((B.Max.Z + B.Min.Z) * 0.5f));
}
FBox3f DefaultBounds()
{
    FBox3f local_7;
    local_7.Min = FVector3f(-25.0f, -25.0f, 0.0f);
    local_7.Max = FVector3f(25.0f, 25.0f, 0.0f);
    return local_7;
}
FBox3f MakeBounds2D(const FVector2D &inout BMin, const FVector2D &inout BMax)
{
    FBox3f local_7;
    local_7.Min = FVector3f(float32(BMin.X), float32(BMin.Y), 0.0f);
    local_7.Max = FVector3f(float32(BMax.X), float32(BMax.Y), 0.0f);
    return local_7;
}
FBox3f GetEntityPushColliderBounds(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_PushColliderConfig& local_6 = local_4.opCall();
    if (local_6)
    {
        FBox3f local_14 = local_6.PushColliderBoundingBox;
        Get local_18;
        const FC_PushColliderBoundFix& local_20 = local_18.opCall();
        if (local_20)
        {
            local_14 = local_20.FixedPushColliderBoundingBox;
        }
        return local_14;
    }
    return FEcosimAIV2Utils::DefaultBounds();
}
FBox3f GetTeamMemberBounds(const FECSEntity &inout Entity)
{
    FECSEntity local_8 = FEcosimAIV2Utils::GetMemberMainEntityWithPlan(Entity);
    if (local_8.IsValid() && !((local_8 == Entity)) && local_8.MatchGameplayTag(GameplayTags::EntityMark_Type_Coach))
    {
        TArray<FECSEntity> local_14;
        FEcosimAIV2Utils::GetControlledTargets(Entity, true, local_14);
        local_8 = Entity;
        int local_15 = 0;
        for (; local_15 < local_14.Num(); ++local_15)
        {
            if (local_14[local_15].IsValid() && local_14[local_15].MatchGameplayTag(GameplayTags::EntityMark_Type_Mount))
            {
                local_8 = local_14[local_15];
                break;
            }
        }
    }
    FBox3f local_31 = FEcosimAIV2Utils::GetEntityPushColliderBounds(local_8);
    if (!((local_8 == Entity)) && Entity.IsValid())
    {
        FBox3f local_24 = FEcosimAIV2Utils::GetEntityPushColliderBounds(Entity);
        local_31.Min.X = FMath::Min(local_31.Min.X, int(local_24.Min.X));
        local_31.Min.Y = FMath::Min(local_31.Min.Y, int(local_24.Min.Y));
        local_31.Min.Z = FMath::Min(local_31.Min.Z, int(local_24.Min.Z));
        local_31.Max.X = FMath::Max(local_31.Max.X, int(local_24.Max.X));
        local_31.Max.Y = FMath::Max(local_31.Max.Y, int(local_24.Max.Y));
        local_31.Max.Z = FMath::Max(local_31.Max.Z, int(local_24.Max.Z));
    }
    return local_31;
}
FVector2D GetTeamMemberSize(const FECSEntity &inout Entity)
{
    FBox3f local_14 = FEcosimAIV2Utils::GetTeamMemberBounds(Entity);
    return FVector2D(FEcosimAIV2Utils::BoundsLength(local_14), FEcosimAIV2Utils::BoundsWidth(local_14));
}
FBox3f GetTeamMemberBoundsFromPrefab(const TSubclassOf<AECSPrefab> &inout PrefabClass)
{
    if ((PrefabClass == nullptr))
    {
        return FEcosimAIV2Utils::DefaultBounds();
    }
    if (PrefabClass.GetDefaultObject() == nullptr)
    {
        return FEcosimAIV2Utils::DefaultBounds();
    }
    AECSPrefab::GetComponentConfigValue local_16;
    const FC_PushColliderConfig& local_18 = local_16.opCall();
    if (local_18)
    {
        return local_18.PushColliderBoundingBox;
    }
    return FEcosimAIV2Utils::DefaultBounds();
}
bool PrefabHasHighPriorityTag(const TSubclassOf<AECSPrefab> &inout PrefabClass)
{
    if ((PrefabClass == nullptr))
    {
        return false;
    }
    if (PrefabClass.GetDefaultObject() == nullptr)
    {
        return false;
    }
    AECSPrefab::GetComponentConfigValue local_10;
    const FC_GameplayTagsConfig& local_12 = local_10.opCall();
    if (local_12)
    {
        return local_12.InitGameplayTags.HasTag(GameplayTags::EcosimAIV2_Mark_HighPriority);
    }
    return false;
}
FECSEntity PrecreateConvoyTeam(const TArray<TSubclassOf<AECSPrefab>> &inout OrderedPrefabs, const float32 InLengthOffset, const float32 InWidthOffset)
{
    FECSEntity local_8 = FEcosimAIV2Utils::CreateTeamEntity();
    Modify local_12;
    FC_EcosimAIV2Team& local_14 = local_12.opCall();
    if (local_14)
    {
        local_14.LengthOffset = InLengthOffset;
        local_14.WidthOffset = InWidthOffset;
        local_14.PrecreatedSlots.Empty(0);
        int local_17 = 0;
        for (; local_17 < OrderedPrefabs.Num(); )
        {
            FEcosimAIV2TeamSlot local_40;
            local_40.PrefabClass = OrderedPrefabs[local_17];
            local_40.bHighPriority = FEcosimAIV2Utils::PrefabHasHighPriorityTag(OrderedPrefabs[local_17]);
            FBox3f local_54 = FEcosimAIV2Utils::GetTeamMemberBoundsFromPrefab(OrderedPrefabs[local_17]);
            local_40.BoundsMin = FVector2D(local_54.Min.X, local_54.Min.Y);
            local_40.BoundsMax = FVector2D(local_54.Max.X, local_54.Max.Y);
            local_14.PrecreatedSlots.Add(local_40);
            ++local_17;
        }
        local_14.ComputePrecreatedLayout();
    }
    return local_8;
}
int GetTeamSlotCount(const FECSEntity &inout TeamEntity)
{
    Get local_4;
    const FC_EcosimAIV2Team& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.PrecreatedSlots.Num();
    }
    return 0;
}
FTransform GetSlotWorldTransform(const FECSEntity &inout TeamEntity, const int SlotIndex, const FTransform &inout AnchorTransform)
{
    FTransform local_24 = AnchorTransform;
    Get local_28;
    const FC_EcosimAIV2Team& local_30 = local_28.opCall();
    if (local_30)
    {
        if (SlotIndex >= 0 && (SlotIndex < local_30.PrecreatedSlots.Num()))
        {
            local_24.SetLocation((AnchorTransform.GetLocation() + FRotator(AnchorTransform.GetRotation()).RotateVector(FVector(local_30.PrecreatedSlots[SlotIndex].OffsetFromCenter))));
            local_24.SetRotation(AnchorTransform.GetRotation());
        }
    }
    return local_24;
}
void BindEntityToSlot(const FECSEntity &inout TeamEntity, const int SlotIndex, const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()) || !(TeamEntity.IsValid()))
    {
        return;
    }
    FEcosimAIV2Utils::AddEntityToTeamEntity(Entity, TeamEntity);
    Modify local_6;
    FC_EcosimAIV2Team& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.BindPrecreatedSlot(SlotIndex, Entity);
    }
    return;
}
FECSEntity CreateTeamEntity()
{
    int local_18 = 0;
    FECSEntity local_12;
    ECS::GetECSWorld().Create(EEntityType(9), local_12);
    local_18.TeamEntity = local_12;
    XLog(ELog(0), FString().Append("CreateTeamEntity: ").Append(local_12));
    return local_12;
}
FECSEntity GetOrCreateTeamEntityForTarget(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_EcosimAIV2TeamMember& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.TeamEntity;
    }
    FECSEntity local_16 = FEcosimAIV2Utils::CreateTeamEntity();
    FEcosimAIV2Utils::AddEntityToTeamEntity(Entity, local_16);
    XLog(ELog(0), FString().Append("CreateTeamEntity: ").Append(local_16));
    return local_16;
}
FECSEntity CreateMetaEntityAtTargetPointEntity(const FECSEntity &inout TargetPointEntity)
{
    int local_8 = 0;
    if (!(TargetPointEntity.IsValid()))
    {
        return ENTITY_NULL;
    }
    UCombatGlobalSettings local_10 = UCombatGlobalSettings::Get();
    FRotator local_18 = FRotator(local_8.GetRotation());
    FECSEntity local_24;
    XLog(ELog(0), FString().Append("CreateMetaEntity: ").Append(local_24));
    return local_24;
}
FECSEntity CreateNewMetaEntityToTeamEntityAtTargetPointEntity(const FECSEntity &inout TeamEntity, const FECSEntity &inout TargetPointEntity, const FVector2D &inout EntitySize, const bool bIsHighPriority)
{
    if (!(TeamEntity.IsValid()) || !(TargetPointEntity.IsValid()))
    {
        XLog(ELog(0), FString().Append("CreateNewMetaEntityToTeamEntityAtTargetPointEntity: TeamEntity:").Append(TeamEntity).Append(", TargetPointEntity:").Append(TargetPointEntity));
        return ENTITY_NULL;
    }
    FECSEntity local_12 = FEcosimAIV2Utils::CreateMetaEntityAtTargetPointEntity(TargetPointEntity);
    if (!(local_12.IsValid()))
    {
        return ENTITY_NULL;
    }
    FEcosimAIV2Utils::AddMetaEntityToTeamEntity(local_12, TeamEntity, EntitySize, bIsHighPriority);
    return local_12;
}
void AddMetaEntityToTeamEntity(const FECSEntity &inout MetaEntity, const FECSEntity &inout TeamEntity, const FVector2D &inout EntitySize, const bool bIsHighPriority)
{
    int local_14 = 0;
    if (!(MetaEntity.IsValid()) || !(TeamEntity.IsValid()))
    {
        return;
    }
    Modify local_6;
    FC_EcosimAIV2Team& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.AddMember(MetaEntity);
        local_14.TeamEntity = TeamEntity;
        if (bIsHighPriority)
        {
            FC_EcosimAIV2EntityMarkHighPriorityTag local_26;
            Assign local_24;
            local_24.opCall(local_26);
        }
        XLog(ELog(0), FString().Append("AddMetaEntityToTeamEntity: Add ").Append(MetaEntity).Append(" To ").Append(TeamEntity));
    }
    return;
}
void MetaEntityRequestMove(const FECSEntity &inout MetaEntity)
{
    Get local_4;
    if (local_4.opCall())
    {
        Modify local_12;
        FC_EcosimAIV2Team& local_14 = local_12.opCall();
        if (local_14)
        {
            local_14.RequestMove(MetaEntity);
        }
    }
    return;
}
void EntityRequestMoveInTeam(const FECSEntity &inout Entity)
{
    Get local_4;
    if (local_4.opCall())
    {
        Modify local_12;
        FC_EcosimAIV2Team& local_14 = local_12.opCall();
        if (local_14)
        {
            local_14.RequestMove(Entity);
        }
    }
    return;
}
void EntityQuitMoveInTeam(const FECSEntity &inout Entity)
{
    Get local_4;
    if (local_4.opCall())
    {
        Modify local_12;
        FC_EcosimAIV2Team& local_14 = local_12.opCall();
        if (local_14)
        {
            local_14.QuitMove(Entity);
        }
    }
    return;
}
void SetTeamEntityTargetTransform(const FECSEntity &inout TeamEntity, const FTransform &inout Transform)
{
    Modify local_4;
    FC_EcosimAIV2Team& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.TargetTransform = Transform;
    }
    return;
}
void SetTeamSideBalanceTolerance(const FECSEntity &inout TeamEntity, const int InSideBalanceTolerance)
{
    Modify local_4;
    FC_EcosimAIV2Team& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.SideBalanceTolerance = FMath::Max(0, InSideBalanceTolerance);
    }
    return;
}
bool IsEntityInTeamMovingState(const FECSEntity &inout Entity)
{
    Get local_4;
    if (local_4.opCall())
    {
        Get local_12;
        const FC_EcosimAIV2Team& local_14 = local_12.opCall();
        if (local_14)
        {
            return local_14.IsInMovingState(Entity);
        }
    }
    return false;
}
bool GetOtherTeamMemberEntity(const FECSEntity &inout Entity, TArray<FTargetEntity> &out OtherMemberEntityList)
{
    TArray<FTargetEntity> local_4;
    OtherMemberEntityList = local_4;
    Get local_8;
    if (local_8.opCall())
    {
        Get local_16;
        const FC_EcosimAIV2Team& local_18 = local_16.opCall();
        if (local_18)
        {
            OtherMemberEntityList = local_18.EntityMemberList;
            FTargetEntity local_20 = FTargetEntity(Entity);
            return true;
        }
    }
    return false;
}
void AddEntityToTeamEntity(const FECSEntity &inout Entity, const FECSEntity &inout TeamEntity)
{
    int local_14 = 0;
    if (!(Entity.IsValid()) || !(TeamEntity.IsValid()))
    {
        return;
    }
    Modify local_6;
    FC_EcosimAIV2Team& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.AddMember(Entity);
        local_14.TeamEntity = TeamEntity;
        XLog(ELog(0), FString().Append("AddEntityToTeamEntity: Add ").Append(Entity).Append(" To ").Append(TeamEntity));
    }
    return;
}
void SetTeamCaptain(const FECSEntity &inout TeamEntity, const FECSEntity &inout InCaptainEntity)
{
    if (!(TeamEntity.IsValid()) || !(InCaptainEntity.IsValid()))
    {
        return;
    }
    Modify local_6;
    FC_AIGroupData& local_8 = local_6.opCall();
    if (local_8)
    {
        if (!(local_8.CaptainEntity.IsValid()))
        {
            local_8.CaptainEntity = InCaptainEntity;
            InCaptainEntity.AddGameplayTag(GameplayTags::EcosimAIV2_Mark_HighPriority, NAME_None);
        }
    }
    return;
}
FECSEntity GetOrUpdateTeamCaptainEntity(const FECSEntity &inout TeamEntity)
{
    bool local_1;
    if (!(TeamEntity.IsValid()))
    {
        return ENTITY_NULL;
    }
    Get local_6;
    const FC_EcosimAIV2Team& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.LeaderEntity;
    }
    FECSEntity local_12 = FECSEntity(ENTITY_NULL);
    Get local_16;
    const FC_AIGroupData& local_18 = local_16.opCall();
    if (local_18)
    {
        if (local_18.CaptainEntity.IsValid())
        {
            return local_18.CaptainEntity;
        }
        for (auto& local_32 : local_18.MemberEntityInfos)
        {
            if (!(local_32.MemberEntity.IsValid()))
            {
                local_1 = false;
            }
            else
            {
                Has local_36;
                local_1 = local_36.opCall();
            }
            local_1 = local_1 && !(FEcosimAIV2Utils::IsMountOrCoachEntity(local_32.MemberEntity));
            if (local_1)
            {
                local_12 = local_32.MemberEntity;
                break;
            }
        }
    }
    if (local_12.IsValid())
    {
        FEcosimAIV2Utils::SetTeamCaptain(TeamEntity, local_12);
        return local_12;
    }
    return ENTITY_NULL;
}
}
