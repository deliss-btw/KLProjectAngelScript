
namespace __INTENRAL_FC_EcosimAIV2Team_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2Team> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2Team>();
    const FC_EcosimAIV2Team DefaultValue = FC_EcosimAIV2Team();
}
namespace __INTENRAL_FC_EcosimAIV2TeamMember_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2TeamMember> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2TeamMember>();
    const FC_EcosimAIV2TeamMember DefaultValue = FC_EcosimAIV2TeamMember();

}
struct FEcosimAIV2TeamMemberInfo
{
    UPROPERTY()
    FECSEntity Entity;
    UPROPERTY()
    FVector OffsetFromLeader;

    FEcosimAIV2TeamMemberInfo()
    {
        return;
    }
}

struct FEcosimaiV2TeamMoveContext
{
    UPROPERTY()
    FVector TargetLocation;
    UPROPERTY()
    FRotator TargetRotation;

    FEcosimaiV2TeamMoveContext()
    {
        return;
    }
}

struct FEcosimAIV2CenterlineNode
{
    UPROPERTY()
    float XOffset;
    UPROPERTY()
    float XMin;
    UPROPERTY()
    float XMax;
    UPROPERTY()
    float YMin;
    UPROPERTY()
    float YMax;
    UPROPERTY()
    FECSEntity Entity;


}

struct FEcosimAIV2Centerline
{
    UPROPERTY()
    TArray<FEcosimAIV2CenterlineNode> Nodes;

    FEcosimAIV2Centerline()
    {
        return;
    }
    float QuerySideExtent(const float MemberXMin, const float MemberXMax, const bool bLeft) const
    {
        float local_10;
        float local_12;
        float local_26;
        float local_28;
        float local_30;
        if (this.Num() == 0)
        {
            return 0.0;
        }
        float local_8 = 0.0;
        float local_6 = MemberXMin + MemberXMax;
        local_12 = 0.5;
        local_6 = local_6 * local_12;
        int local_13 = 0;
        for (; local_13 < this.Num(); ++local_13)
        {
            const FEcosimAIV2CenterlineNode& local_16 = this[local_13];
            local_10 = local_16.XMin;
            if (local_10 <= MemberXMax && ((local_16.XMax >= MemberXMin)))
            {
                if (bLeft)
                {
                    local_12 = local_16.YMin;
                    local_12 = -local_12;
                    local_10 = local_12;
                }
                else
                {
                    local_10 = local_16.YMax;
                }
                local_12 = FMath::Max(local_8, local_10);
                local_8 = local_12;
            }
        }
        if (local_8 == 0.0)
        {
            float local_20;
            local_20 = this[0].XMin;
            if (local_6 < local_20)
            {
                if (bLeft)
                {
                    local_20 = this[0].YMin;
                    local_20 = -local_20;
                    local_12 = local_20;
                }
                else
                {
                    local_20 = this[0].YMax;
                    local_12 = local_20;
                }
                local_8 = local_12;
            }
            else
            {
                local_12 = this[(this.Num() - 1)].XMax;
                if (local_6 > local_12)
                {
                    const FEcosimAIV2CenterlineNode& local_16_2 = this[(this.Num() - 1)];
                    if (bLeft)
                    {
                        local_12 = local_16_2.YMin;
                        local_12 = -local_12;
                        local_20 = local_12;
                    }
                    else
                    {
                        local_20 = local_16_2.YMax;
                    }
                    local_8 = local_20;
                }
                else
                {
                    int local_13_2 = 0;
                    for (; local_13_2 < (this.Num() - 1); ++local_13_2)
                    {
                        const FEcosimAIV2CenterlineNode& local_16_3 = this[local_13_2];
                        const FEcosimAIV2CenterlineNode& local_24 = this[local_13_2 + 1];
                        local_20 = local_16_3.XMax;
                        if (local_6 >= local_20 && ((local_6 <= local_24.XMin)))
                        {
                            local_20 = local_24.XMin;
                            local_12 = local_16_3.XMax;
                            local_20 = local_20 - local_12;
                            if (local_20 != 0.0)
                            {
                                local_12 = local_16_3.XMax;
                                local_10 = local_6 - local_12;
                                local_28 = local_10 / local_20;
                            }
                            else
                            {
                                local_28 = 0.0;
                            }
                            if (bLeft)
                            {
                                local_12 = local_16_3.YMin;
                                local_12 = -local_12;
                                local_26 = local_12;
                            }
                            else
                            {
                                local_26 = local_16_3.YMax;
                            }
                            if (bLeft)
                            {
                                local_12 = local_24.YMin;
                                local_12 = -local_12;
                                local_30 = local_12;
                            }
                            else
                            {
                                local_30 = local_24.YMax;
                            }
                            local_8 = FMath::Max(local_8, FMath::Lerp(local_26, local_30, local_28));
                        }
                    }
                }
            }
        }
        return local_8;
    }
    float GetLeftExtentAtX(const float MemberXMin, const float MemberXMax) const
    {
        return this.QuerySideExtent(MemberXMin, MemberXMax, true);
    }
    float GetRightExtentAtX(const float MemberXMin, const float MemberXMax) const
    {
        return this.QuerySideExtent(MemberXMin, MemberXMax, false);
    }
    void AddNode(const float XOffset, const float BoundsMinX, const float BoundsMaxX, const float InYMin, const float InYMax, const FECSEntity &inout Entity)
    {
        FEcosimAIV2CenterlineNode local_14;
        local_14.XOffset = XOffset;
        local_14.XMin = (XOffset + BoundsMinX);
        local_14.XMax = (XOffset + BoundsMaxX);
        local_14.YMin = InYMin;
        local_14.YMax = InYMax;
        local_14.Entity = Entity;
        int local_17 = 0;
        int local_19 = 0;
        for (; local_19 < this.Num(); )
        {
            if (this[local_19].XOffset > XOffset)
            {
                local_17 = local_19;
                break;
            }
            local_17 = local_19 + 1;
            ++local_19;
        }
        this.Insert(local_14, local_17);
        return;
    }
    void Clear()
    {
        this.Empty(0);
        return;
    }
}

struct FEcosimAIV2TeamSlot
{
    UPROPERTY()
    TSubclassOf<AECSPrefab> PrefabClass;
    UPROPERTY()
    bool bHighPriority = false;
    UPROPERTY()
    FVector2D BoundsMin = FVector2D(-25.0, -25.0);
    UPROPERTY()
    FVector2D BoundsMax = FVector2D(25.0, 25.0);
    UPROPERTY()
    FVector OffsetFromCenter = FVector::ZeroVector;
    UPROPERTY()
    FECSEntity Entity = ENTITY_NULL;


}

struct FEcosimAIV2LayoutDesc
{
    UPROPERTY()
    bool bHighPriority = false;
    UPROPERTY()
    FVector2D BoundsMin = FVector2D(-25.0, -25.0);
    UPROPERTY()
    FVector2D BoundsMax = FVector2D(25.0, 25.0);


}

struct FC_EcosimAIV2Team : FECSComponent
{
    UPROPERTY()
    TArray<FTargetEntity> EntityMemberList;
    UPROPERTY()
    TMap<FECSEntity, FEcosimaiV2TeamMoveContext> EntityMemberMoveContextMap;
    UPROPERTY()
    TMap<FECSEntity, FEcosimAIV2TeamMemberInfo> EntityTeamMemberInfoMap;
    UPROPERTY()
    FTransform TargetTransform;
    UPROPERTY()
    FECSEntity TeamEntity = ENTITY_NULL;
    UPROPERTY()
    FECSEntity LeaderEntity;
    UPROPERTY()
    float32 LengthOffset = 100.0f;
    UPROPERTY()
    float32 WidthOffset = 100.0f;
    UPROPERTY()
    int SideBalanceTolerance = 2;
    UPROPERTY()
    FEcosimAIV2Centerline Centerline;
    UPROPERTY()
    TArray<FEcosimAIV2TeamSlot> PrecreatedSlots;


    void AddMember(const FECSEntity &inout EntityMember)
    {
        this.AddUnique(FTargetEntity(EntityMember));
        return;
    }
    bool IsHostileToTeam(const FECSEntity &inout Candidate) const
    {
        if (!(Candidate.IsValid()))
        {
            return false;
        }
        FECSEntity local_10;
        if (this.TeamEntity.IsValid())
        {
            local_10 = this.TeamEntity;
        }
        else
        {
            local_10 = ENTITY_NULL;
        }
        if (local_10.IsValid())
        {
            Get local_14;
            const FC_EcosimAIV2TargetRelation& local_16 = local_14.opCall();
            if (local_16)
            {
                FEcosimAIV2TargetRelationDetail local_20;
                if (local_16.TargetRelationMap.Find(FTargetEntity(Candidate), local_20))
                {
                    if ((int(local_20.TargetRelation)) == 2)
                    {
                        return true;
                    }
                }
            }
        }
        for (auto& local_40 : this)
        {
            if (!(FECSEntity(local_40.GetEntity()).IsValid()))
            {
                continue;
            }
            Get local_48;
            const FC_EcosimAIV2DamageRelationOverride& local_50 = local_48.opCall();
            if (local_50)
            {
                FEcosimAIV2DamageRelationOverrideData local_52;
                if (local_50.GetDamageRelationOverrideMap().Find(FTargetEntity(Candidate), local_52))
                {
                    if ((int(local_52.GetDamageRelation())) == 2)
                    {
                        return true;
                    }
                }
            }
        }
        return false;
    }
    bool IsValidLeaderCandidate(const FECSEntity &inout Candidate) const
    {
        if (!(Candidate.IsValid()))
        {
            return false;
        }
        if (::FEcosimAIV2Utils::IsMountOrCoachEntity(Candidate))
        {
            return false;
        }
        if (!(this.Contains(FTargetEntity(Candidate))))
        {
            return false;
        }
        if (::FEcosimAIV2Utils::IsPlayerAvatarEntity(Candidate) && this.IsHostileToTeam(Candidate))
        {
            return false;
        }
        return true;
    }
    void ResolveLeader()
    {
        if (this.EntityMemberMoveContextMap.Num() == 0)
        {
            if (this.LeaderEntity.IsValid())
            {
                this.LeaderEntity = ENTITY_NULL;
            }
            return;
        }
        FECSEntity local_8 = FECSEntity(ENTITY_NULL);
        for (auto& local_22 : this)
        {
            FECSEntity local_26 = FECSEntity(local_22.GetEntity());
            if (!(this.IsValidLeaderCandidate(local_26)))
            {
                continue;
            }
            if (::FEcosimAIV2Utils::IsPlayerAvatarEntity(local_26))
            {
                local_8 = local_26;
                break;
            }
        }
        if (!(local_8.IsValid()))
        {
            FECSEntity local_26_2 = FECSEntity(ENTITY_NULL);
            FECSEntity local_34 = FECSEntity(ENTITY_NULL);
            for (auto& local_22 : this)
            {
                FECSEntity local_38 = FECSEntity(local_22.GetEntity());
                if (!(local_38.IsValid()))
                {
                    continue;
                }
                if (!(local_38.MatchGameplayTag(GameplayTags::EcosimAIV2_Mark_HighPriority)))
                {
                    continue;
                }
                TArray<FECSEntity> local_42;
                Get local_46;
                const FC_ChainParentInfo& local_48 = local_46.opCall();
                if (local_48)
                {
                    if (local_48.GetParent().IsValid())
                    {
                        local_42.AddUnique(local_48.GetParent());
                    }
                }
                TArray<FECSEntity> local_52;
                ::FEcosimAIV2Utils::GetEntityRelationSources(local_38, EEcosimAIV2EntityRelation(2), EEcosimAIV2RelationType(2), local_52);
                for (auto& local_68 : local_52)
                {
                    if (local_68.IsValid())
                    {
                        local_42.AddUnique(local_68);
                    }
                }
                for (auto& local_68 : local_42)
                {
                    FECSEntity local_30 = ::FEcosimAIV2Utils::ResolveControllingPersonEntity(local_68);
                    if (!(this.IsValidLeaderCandidate(local_30)))
                    {
                        continue;
                    }
                    if (::FEcosimAIV2Utils::IsPlayerAvatarEntity(local_30))
                    {
                        local_26_2 = local_30;
                        break;
                    }
                    if (!(local_34.IsValid()))
                    {
                        local_34 = local_30;
                    }
                }
                if (local_26_2.IsValid())
                {
                    break;
                }
            }
            if (local_26_2.IsValid())
            {
                local_8 = local_26_2;
            }
            else
            {
                if (local_34.IsValid())
                {
                    local_8 = local_34;
                }
            }
        }
        if (!(local_8.IsValid()))
        {
            int local_73 = -1;
            for (auto& local_92 : this.EntityMemberMoveContextMap)
            {
                FECSEntity local_30_2 = FECSEntity(local_92.GetKey());
                if (!(this.IsValidLeaderCandidate(local_30_2)))
                {
                    continue;
                }
                int local_2 = ::FEcosimAIV2Utils::GetEntityLeaderPriority(local_30_2);
                if (local_2 > local_73)
                {
                    local_73 = local_2;
                    local_8 = local_30_2;
                }
            }
        }
        if (!(local_8.IsValid()))
        {
            for (auto& local_92 : this.EntityMemberMoveContextMap)
            {
                FECSEntity local_38_2 = FECSEntity(local_92.GetKey());
                if (this.IsValidLeaderCandidate(local_38_2))
                {
                    local_8 = local_38_2;
                    break;
                }
            }
        }
        if (!(local_8.IsValid()))
        {
            for (auto& local_22 : this)
            {
                FECSEntity local_30_3 = FECSEntity(local_22.GetEntity());
                if (this.IsValidLeaderCandidate(local_30_3))
                {
                    local_8 = local_30_3;
                    break;
                }
            }
        }
        FECSEntity local_38_3 = this.LeaderEntity;
        this.LeaderEntity = local_8;
        if ((!((this.LeaderEntity == local_38_3))))
        {
            this.UpdateTeamMoveContext();
        }
        return;
    }
    FECSEntity RequestMove(const FECSEntity &inout EntityMember)
    {
        int local_26 = 0;
        FECSEntity local_4 = EntityMember;
        if (!(this.Contains(FTargetEntity(local_4))))
        {
            return ENTITY_NULL;
        }
        FEcosimaiV2TeamMoveContext local_20;
        if (local_4.IsValid())
        {
            local_20.TargetLocation = local_26.GetPosition();
            local_20.TargetRotation = FRotator(local_26.GetRotation());
        }
        this.UpdateTeamMoveContext();
        return local_4;
    }
    void QuitMove(const FECSEntity &inout EntityMember)
    {
        if (this.EntityMemberMoveContextMap.Contains(FECSEntity(EntityMember)))
        {
            this.UpdateTeamMoveContext();
        }
        return;
    }
    bool IsInMovingState(const FECSEntity &inout EntityMember) const
    {
        FECSEntity local_4 = EntityMember;
        return this.EntityMemberMoveContextMap.Contains(local_4) && this.EntityTeamMemberInfoMap.Contains(local_4);
    }
    bool GetMoveContext(const FECSEntity &inout EntityMember, FEcosimaiV2TeamMoveContext &out TeamMoveContext) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    bool IsEntityHighPriority(const FECSEntity &inout Entity) const
    {
        if (::FEcosimAIV2Utils::IsPlayerAvatarEntity(Entity))
        {
            return true;
        }
        FECSEntity local_10 = ::FEcosimAIV2Utils::GetMemberMainEntityWithPlan(Entity);
        if (local_10.MatchGameplayTag(GameplayTags::EcosimAIV2_Mark_HighPriority))
        {
            return true;
        }
        return false;
    }
    FECSEntity GetTeamCenterAnchorEntity() const
    {
        if (!(this.LeaderEntity.IsValid()))
        {
            return this.LeaderEntity;
        }
        FECSEntity local_10 = ::FEcosimAIV2Utils::GetMemberMainEntityWithPlan(this.LeaderEntity);
        if (local_10.IsValid() && local_10.MatchGameplayTag(GameplayTags::EntityMark_Type_Coach))
        {
            return local_10;
        }
        return this.LeaderEntity;
    }
    void BuildConvoyLayout(const TArray<FEcosimAIV2LayoutDesc> &inout Descs, const int PreferredLeaderIndex, TArray<FVector> &out OutOffsets) const
    {
        TArray<FVector> local_4;
        OutOffsets = local_4;
        OutOffsets.Empty(0);
        if (Descs.Num() == 0)
        {
            return;
        }
        TArray<int> local_12;
        TArray<int> local_16;
        int local_17 = 0;
        for (; local_17 < Descs.Num(); ++local_17)
        {
            if (Descs[local_17].bHighPriority)
            {
                local_12.Add(local_17);
                continue;
            }
            local_16.Add(local_17);
        }
        if (local_12.Num() > 0)
        {
            this.ArrangeHighSpine(Descs, PreferredLeaderIndex, local_12, local_16, OutOffsets);
        }
        else
        {
            this.ArrangeNoHighParity(Descs, PreferredLeaderIndex, OutOffsets);
        }
        return;
    }
    void ArrangeHighSpine(const TArray<FEcosimAIV2LayoutDesc> &inout Descs, const int PreferredLeaderIndex, const TArray<int> &inout InHighIdx, const TArray<int> &inout InNormalIdx, TArray<FVector> &out OutOffsets) const
    {
        int local_10;
        float local_52;
        FBox3f local_60;
        float local_72;
        float local_74;
        int local_79;
        TArray<FVector> local_4;
        OutOffsets = local_4;
        OutOffsets.Empty(0);
        int local_6 = 0;
        for (; local_6 < Descs.Num(); )
        {
            OutOffsets.Add(FVector::ZeroVector);
            ++local_6;
        }
        if (Descs.Num() == 0 || (InHighIdx.Num() == 0))
        {
            return;
        }
        if (PreferredLeaderIndex >= 0 && (PreferredLeaderIndex < Descs.Num()))
        {
            local_10 = PreferredLeaderIndex;
        }
        else
        {
            local_10 = InHighIdx[0];
        }
        TArray<int> local_14;
        TArray<int> local_18;
        int local_19 = 0;
        for (; local_19 < InHighIdx.Num(); ++local_19)
        {
            if (InHighIdx[local_19] != local_10)
            {
                local_14.Add(InHighIdx[local_19]);
            }
        }
        int local_19_2 = 0;
        for (; local_19_2 < InNormalIdx.Num(); ++local_19_2)
        {
            if (InNormalIdx[local_19_2] != local_10)
            {
                local_18.Add(InNormalIdx[local_19_2]);
            }
        }
        OutOffsets[local_10] = FVector::ZeroVector;
        FEcosimAIV2Centerline local_24;
        FBox3f local_38 = ::FEcosimAIV2Utils::MakeBounds2D(Descs[local_10].BoundsMin, Descs[local_10].BoundsMax);
        if (local_14.Num() > 0)
        {
            int local_53;
            float local_42;
            FBox3f local_31;
            local_42 = local_38.Max.Y;
            float local_48;
            local_24.AddNode(0.0, local_38.Min.X, local_38.Max.X, local_38.Min.Y, local_42, ENTITY_NULL);
            float local_50 = local_38.Min.X;
            int local_19_3 = 0;
            for (; local_19_3 < local_14.Num(); )
            {
                local_53 = local_14[local_19_3];
                local_31 = ::FEcosimAIV2Utils::MakeBounds2D(Descs[local_53].BoundsMin, Descs[local_53].BoundsMax);
                local_48 = this.LengthOffset;
                local_48 = (local_50 - local_48) - local_31.Max.X;
                local_50 = local_48 + local_31.Min.X;
                OutOffsets[local_53] = FVector(local_48, 0.0, 0.0);
                local_42 = local_31.Min.X;
                local_24.AddNode(local_48, local_42, local_31.Max.X, local_31.Min.Y, local_31.Max.Y, ENTITY_NULL);
                ++local_19_3;
            }
        }
        if (local_18.Num() > 0)
        {
            int local_53;
            float local_42;
            FBox3f local_31;
            if (local_14.Num() == 0)
            {
                local_52 = local_38.Max.Y;
                local_24.AddNode(0.0, local_38.Min.X, local_38.Max.X, local_38.Min.Y, local_52, ENTITY_NULL);
            }
            int local_19_4 = 0;
            float local_50_2 = 0.0;
            float local_48_2 = 0.0;
            float local_70 = 0.0;
            if (local_19_4 < local_18.Num())
            {
                local_53 = local_18[local_19_4];
                local_60 = ::FEcosimAIV2Utils::MakeBounds2D(Descs[local_53].BoundsMin, Descs[local_53].BoundsMax);
                if (local_14.Num() == 0)
                {
                    local_72 = 0.0;
                    float local_46_2 = -local_38.Min.Y;
                    local_52 = this.WidthOffset;
                    float32 local_39_2 = local_60.Min.Y;
                    local_39_2 = -local_39_2;
                    local_52 = (local_46_2 + local_52) + local_39_2;
                    local_52 = -local_52;
                    local_74 = local_52;
                }
                else
                {
                    local_72 = local_38.Min.X - local_60.Max.X;
                    local_52 = local_60.Min.X;
                    local_52 = local_24.GetLeftExtentAtX(local_72 + local_52, local_72 + local_60.Max.X);
                    local_42 = local_52 + this.WidthOffset;
                    local_74 = (-(local_42 + -local_60.Min.Y));
                }
                local_70 = local_72 + local_60.Max.X;
                local_50_2 = local_72 + local_60.Min.X;
                OutOffsets[local_53] = FVector(local_72, local_74, 0.0);
                local_19_4 = local_19_4 + 1;
            }
            if (local_19_4 < local_18.Num())
            {
                local_53 = local_18[local_19_4];
                local_31 = ::FEcosimAIV2Utils::MakeBounds2D(Descs[local_53].BoundsMin, Descs[local_53].BoundsMax);
                if (local_14.Num() == 0)
                {
                    local_52 = 0.0;
                    local_72 = (local_38.Max.Y + this.WidthOffset) + local_31.Max.Y;
                }
                else
                {
                    local_52 = local_38.Min.X - local_31.Max.X;
                    float local_46_3 = local_52 + local_31.Max.X;
                    float local_78_2 = local_52 + local_31.Min.X;
                    local_42 = local_24.GetRightExtentAtX(local_78_2, local_46_3);
                    local_74 = this.WidthOffset;
                    local_72 = (local_42 + local_74) + local_31.Max.Y;
                }
                OutOffsets[local_53] = FVector(local_52, local_72, 0.0);
                local_74 = local_31.Min.X;
                local_48_2 = local_52 + local_74;
                local_19_4 = local_19_4 + 1;
            }
            local_53 = local_19_4;
            for (; local_53 < local_18.Num(); )
            {
                local_79 = local_18[local_53];
                bool local_9 = local_60 = ::FEcosimAIV2Utils::MakeBounds2D(Descs[local_79].BoundsMin, Descs[local_79].BoundsMax);
                if (local_50_2 >= local_48_2)
                {
                    local_74 = local_50_2 - this.LengthOffset;
                    local_52 = local_74 - local_60.Max.X;
                    local_50_2 = local_52 + local_60.Min.X;
                    if (local_14.Num() == 0)
                    {
                        float local_78_3 = -local_38.Min.Y;
                        local_74 = this.WidthOffset;
                        float local_44_5 = local_78_3 + local_74;
                        float32 local_75_2 = local_60.Min.Y;
                        local_75_2 = -local_75_2;
                        local_78_3 = local_75_2;
                        local_74 = local_44_5 + local_78_3;
                        local_74 = -local_74;
                        local_42 = local_74;
                    }
                    else
                    {
                        local_74 = local_52 + local_60.Max.X;
                        float local_46_4 = (local_24.GetLeftExtentAtX(local_52 + local_60.Min.X, local_74)) + this.WidthOffset;
                        float local_44_6 = -local_60.Min.Y;
                        local_72 = local_46_4 + local_44_6;
                        local_72 = -local_72;
                        local_42 = local_72;
                    }
                }
                else
                {
                    float local_78_4 = local_48_2 - this.LengthOffset;
                    local_52 = local_78_4 - local_60.Max.X;
                    local_48_2 = local_52 + local_60.Min.X;
                    if (local_14.Num() == 0)
                    {
                        local_78_4 = this.WidthOffset;
                        local_42 = (local_38.Max.Y + local_78_4) + local_60.Max.Y;
                    }
                    else
                    {
                        local_78_4 = local_52 + local_60.Max.X;
                        local_74 = (local_24.GetRightExtentAtX(local_52 + local_60.Min.X, local_78_4)) + this.WidthOffset;
                        local_42 = local_74 + local_60.Max.Y;
                    }
                }
                OutOffsets[local_79] = FVector(local_52, local_42, 0.0);
                ++local_53;
            }
        }
        return;
    }
    void ArrangeNoHighParity(const TArray<FEcosimAIV2LayoutDesc> &inout Descs, const int PreferredLeaderIndex, TArray<FVector> &out OutOffsets) const
    {
        int local_9;
        float local_16;
        int local_26;
        FBox3f local_40;
        float local_46;
        float local_48;
        float local_68;
        TArray<FVector> local_4;
        OutOffsets = local_4;
        int local_6 = Descs.Num();
        OutOffsets.Empty(0);
        int local_7 = 0;
        for (; local_7 < local_6; )
        {
            OutOffsets.Add(FVector::ZeroVector);
            ++local_7;
        }
        if (local_6 == 0)
        {
            return;
        }
        TArray<int> local_14;
        bool local_8 = ((local_6 % 2) == 1);
        float local_20 = 0.0;
        float local_24 = 0.0;
        if (local_8)
        {
            if ((PreferredLeaderIndex >= 0 && (PreferredLeaderIndex < local_6)))
            {
                local_9 = PreferredLeaderIndex;
            }
            else
            {
                local_9 = 0;
            }
            OutOffsets[local_9] = FVector::ZeroVector;
            local_26 = 0;
            for (; local_26 < local_6; ++local_26)
            {
                if (local_26 != local_9)
                {
                    local_14.Add(local_26);
                }
            }
            local_40 = ::FEcosimAIV2Utils::MakeBounds2D(Descs[local_9].BoundsMin, Descs[local_9].BoundsMax);
            float32 local_41 = -local_40.Min.Y;
            local_20 = local_41;
            local_24 = local_40.Max.Y;
            local_16 = local_40.Min.X - this.LengthOffset;
        }
        else
        {
            local_26 = 0;
            for (; local_26 < local_6; )
            {
                local_14.Add(local_26);
                ++local_26;
            }
            local_16 = 0.0;
        }
        local_9 = 0;
        while (local_9 < local_14.Num())
        {
            local_26 = local_14[local_9];
            FBox3f local_33 = ::FEcosimAIV2Utils::MakeBounds2D(Descs[local_26].BoundsMin, Descs[local_26].BoundsMax);
            float local_44_2 = local_16 - local_33.Max.X;
            if (local_8)
            {
                float local_22 = local_20 + this.WidthOffset;
                local_46 = -local_33.Min.Y;
                local_22 = local_22 + local_46;
                local_22 = -local_22;
                local_48 = local_22;
            }
            else
            {
                local_46 = (this.WidthOffset * 0.5f);
                float local_22_2 = -local_33.Min.Y;
                local_46 = local_46 + local_22_2;
                local_46 = -local_46;
                local_48 = local_46;
            }
            OutOffsets[local_26] = FVector(local_44_2, local_48, 0.0);
            local_46 = ::FEcosimAIV2Utils::BoundsLength(local_33);
            if ((local_9 + 1) < local_14.Num())
            {
                int local_57;
                local_57 = local_14[local_9 + 1];
                local_40 = ::FEcosimAIV2Utils::MakeBounds2D(Descs[local_57].BoundsMin, Descs[local_57].BoundsMax);
                float local_22_3 = local_16 - local_40.Max.X;
                if (local_8)
                {
                    local_68 = (local_24 + this.WidthOffset) + local_40.Max.Y;
                }
                else
                {
                    local_68 = (this.WidthOffset * 0.5f) + local_40.Max.Y;
                }
                OutOffsets[local_57] = FVector(local_22_3, local_68, 0.0);
                local_46 = FMath::Max(local_46, ::FEcosimAIV2Utils::BoundsLength(local_40));
            }
            local_16 = local_16 - (local_46 + this.LengthOffset);
            local_9 = local_9 + 2;
        }
        return;
    }
    void ComputePrecreatedLayout()
    {
        if (this.PrecreatedSlots.Num() == 0)
        {
            return;
        }
        TArray<FEcosimAIV2LayoutDesc> local_8;
        int local_9 = 0;
        for (; local_9 < this.PrecreatedSlots.Num(); )
        {
            FEcosimAIV2LayoutDesc local_20;
            local_20.bHighPriority = this.PrecreatedSlots[local_9].bHighPriority;
            local_20.BoundsMin = this.PrecreatedSlots[local_9].BoundsMin;
            local_20.BoundsMax = this.PrecreatedSlots[local_9].BoundsMax;
            local_8.Add(local_20);
            ++local_9;
        }
        TArray<FVector> local_24;
        this.BuildConvoyLayout(local_8, -1, local_24);
        int local_9_2 = 0;
        for (; local_9_2 < this.PrecreatedSlots.Num(); )
        {
            this.PrecreatedSlots[local_9_2].OffsetFromCenter = local_24[local_9_2];
            ++local_9_2;
        }
        return;
    }
    void BindPrecreatedSlot(const int SlotIndex, const FECSEntity &inout InEntity)
    {
        if (SlotIndex < 0 || (SlotIndex >= this.PrecreatedSlots.Num()) || !(InEntity.IsValid()))
        {
            return;
        }
        this.PrecreatedSlots[SlotIndex].Entity = InEntity;
        this.AddMember(InEntity);
        return;
    }
    float GetMemberFormationLocalX(const FECSEntity &inout Member, const FVector &inout AnchorPos, const FVector &inout AnchorForward) const
    {
        ::FEcosimAIV2Utils::GetMemberMainEntityWithPlan(Member);
        GetDefaulted local_18;
        return (FVector(local_18.opCall().GetPosition()) - AnchorPos).DotProduct(AnchorForward);
    }
    void MoveClosestMembersToOtherSide(TArray<FECSEntity> &inout FromMembers, TArray<FECSEntity> &inout ToMembers, const int MoveCount, const FVector &inout AnchorPos, const FVector &inout AnchorRight) const
    {
        int local_1 = 0;
        for (; local_1 < MoveCount; )
        {
            if (FromMembers.Num() == 0)
            {
                break;
            }
            int local_6 = 0;
            float local_8 = 1e30;
            int local_11 = 0;
            for (; local_11 < FromMembers.Num(); ++local_11)
            {
                FECSEntity local_20 = ::FEcosimAIV2Utils::GetMemberMainEntityWithPlan(FromMembers[local_11]);
                GetDefaulted local_30;
                float local_10 = (FVector(local_30.opCall().GetPosition()) - AnchorPos).DotProduct(AnchorRight);
                float local_32 = 0.0;
                if (local_10 < local_32)
                {
                    local_32 = local_10;
                    local_32 = -local_32;
                    local_10 = local_32;
                }
                if (local_10 < local_8)
                {
                    local_8 = local_10;
                    local_6 = local_11;
                }
            }
            FECSEntity local_20_2 = FECSEntity(FromMembers[local_6]);
            FromMembers.RemoveAt(local_6);
            ToMembers.Add(local_20_2);
            ++local_1;
        }
        return;
    }
    void SortMembersFrontToBack(TArray<FECSEntity> &inout Members, const FVector &inout AnchorPos, const FVector &inout AnchorForward) const
    {
        int local_1 = 0;
        for (; local_1 < Members.Num(); ++local_1)
        {
            int local_5 = local_1;
            float local_10 = this.GetMemberFormationLocalX(Members[local_1], AnchorPos, AnchorForward);
            int local_12 = local_1 + 1;
            for (; local_12 < Members.Num(); ++local_12)
            {
                float local_8 = this.GetMemberFormationLocalX(Members[local_12], AnchorPos, AnchorForward);
                if (local_8 > local_10)
                {
                    local_10 = local_8;
                    local_5 = local_12;
                }
            }
            if (local_5 != local_1)
            {
                FECSEntity local_18 = FECSEntity(Members[local_1]);
                Members[local_1] = Members[local_5];
                Members[local_5] = local_18;
            }
        }
        return;
    }
    void RebalanceNormalSideMembers(TArray<FECSEntity> &inout LeftMembers, TArray<FECSEntity> &inout RightMembers, const FVector &inout AnchorPos, const FVector &inout AnchorRight, const FVector &inout AnchorForward) const
    {
        int local_4 = FMath::Max(0, this.SideBalanceTolerance);
        int local_3 = RightMembers.Num() - LeftMembers.Num();
        if (local_3 > local_4)
        {
            this.MoveClosestMembersToOtherSide(RightMembers, LeftMembers, local_3 - local_4, AnchorPos, AnchorRight);
        }
        else
        {
            int local_2 = -local_3;
            if (local_2 > local_4)
            {
                local_2 = local_3;
                local_2 = -local_2;
                this.MoveClosestMembersToOtherSide(LeftMembers, RightMembers, local_2 - local_4, AnchorPos, AnchorRight);
            }
        }
        this.SortMembersFrontToBack(LeftMembers, AnchorPos, AnchorForward);
        this.SortMembersFrontToBack(RightMembers, AnchorPos, AnchorForward);
        return;
    }
    void UpdateTeamMoveContext()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}

struct FC_EcosimAIV2TeamMember : FECSComponent
{
    UPROPERTY()
    FECSEntity TeamEntity;

    FC_EcosimAIV2TeamMember()
    {
        return;
    }
}

namespace ECSFunc_FC_EcosimAIV2Team
{
UFUNCTION()
bool HasEcosimAIV2Team(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2Team);
}
FC_EcosimAIV2Team& AssignEcosimAIV2Team(const FECSEntity &inout Entity, const FC_EcosimAIV2Team &inout DefaultValue = FC_EcosimAIV2Team())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2Team, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2Team_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2Team &inout DefaultValue = FC_EcosimAIV2Team())
{
    ECSFunc_FC_EcosimAIV2Team::AssignEcosimAIV2Team(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2Team& ModifyEcosimAIV2Team(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2Team));
    return local_12.GetComp();
}
FC_EcosimAIV2Team& ModifyOrAddEcosimAIV2Team(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2Team));
    return local_12.GetComp();
}
const FC_EcosimAIV2Team& GetEcosimAIV2Team(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2Team));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2Team GetEcosimAIV2Team_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2Team __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2Team::GetEcosimAIV2Team(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2Team GetDefaultedEcosimAIV2Team(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2Team __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2Team);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_EcosimAIV2Team GetDefaultedEcosimAIV2Team_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2Team __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2Team(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2Team);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TeamOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2Team, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TeamOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2Team, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TeamOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2Team, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TeamOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2Team, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TeamOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2Team, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2TeamLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2Team, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2TeamActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2Team, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2TeamModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2Team, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2TeamMember
{
UFUNCTION()
bool HasEcosimAIV2TeamMember(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TeamMember);
}
FC_EcosimAIV2TeamMember& AssignEcosimAIV2TeamMember(const FECSEntity &inout Entity, const FC_EcosimAIV2TeamMember &inout DefaultValue = FC_EcosimAIV2TeamMember())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TeamMember, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2TeamMember_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2TeamMember &inout DefaultValue = FC_EcosimAIV2TeamMember())
{
    ECSFunc_FC_EcosimAIV2TeamMember::AssignEcosimAIV2TeamMember(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2TeamMember& ModifyEcosimAIV2TeamMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TeamMember));
    return local_12.GetComp();
}
FC_EcosimAIV2TeamMember& ModifyOrAddEcosimAIV2TeamMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TeamMember));
    return local_12.GetComp();
}
const FC_EcosimAIV2TeamMember& GetEcosimAIV2TeamMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TeamMember));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2TeamMember GetEcosimAIV2TeamMember_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2TeamMember __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2TeamMember::GetEcosimAIV2TeamMember(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2TeamMember GetDefaultedEcosimAIV2TeamMember(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2TeamMember __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TeamMember);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_EcosimAIV2TeamMember GetDefaultedEcosimAIV2TeamMember_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2TeamMember __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2TeamMember(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TeamMember);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TeamMemberOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2TeamMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TeamMemberOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2TeamMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TeamMemberOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2TeamMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TeamMemberOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2TeamMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TeamMemberOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2TeamMember, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2TeamMemberLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2TeamMember, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2TeamMemberActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2TeamMember, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2TeamMemberModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2TeamMember, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_EcosimAIV2Team_LeaderEntity(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().LeaderEntity);
    return;
}
}
