

class UEQG_CombatUnstuckPoint : UEnvQueryGenerator_ECS_BlueprintBase
{
    UPROPERTY()
    float32 MinDistance = 200.0f;
    UPROPERTY()
    float32 MaxDistance = 800.0f;
    UPROPERTY()
    float32 HexRingWorldDistance = 260.0f;
    UPROPERTY()
    float32 FanAngleDegrees = 45.0f;
    UPROPERTY()
    int MaxPointChecks = 256;
    UPROPERTY()
    float32 MaxHeightDifference = 300.0f;
    UPROPERTY()
    bool bDebugDraw = false;
    UPROPERTY()
    float32 DebugDrawDuration = 5.0f;
    UPROPERTY()
    float32 AlignmentScoreMax = 1.0f;
    UPROPERTY()
    float32 DistScoreMax = 1.0f;
    UPROPERTY()
    float32 GoalScoreMax = 100.0f;

    default GeneratedItemType = UEnvQueryItemType_Point;


    UFUNCTION()
    void DoItemGenerationFromEntities_Implementation(const TArray<FECSEntityId> &inout ContextEntities) const
    {
        bool local_29;
        int local_46 = 0;
        float32 local_53;
        float32 local_54;
        Get local_58;
        bool local_79;
        float32 local_83;
        int local_86 = 0;
        float32 local_103;
        bool local_107;
        int local_118 = 0;
        AECSRegionVolume local_120;
        float32 local_4 = FMath::Max(this.HexRingWorldDistance, 1.0f);
        float32 local_1 = local_4 / 1.7320508f;
        int local_9 = FMath::Max(this.MaxPointChecks, 1);
        float32 local_10 = FMath::Cos(FMath::DegreesToRadians(FMath::Clamp(this.FanAngleDegrees, 1.0f, 180.0f)));
        float32 local_13 = this.MinDistance / local_4;
        int local_7 = FMath::Max(FMath::CeilToInt(local_13), 1);
        float32 local_13_2 = this.MaxDistance / local_4;
        int local_6 = FMath::Max(FMath::CeilToInt(local_13_2), local_7);
        for (auto& local_32 : ContextEntities)
        {
            FECSEntity local_40 = FECSEntity(local_32);
            if (!(local_40.IsValid()))
            {
                continue;
            }
            if (!(local_46))
            {
                continue;
            }
            FVector local_52 = local_46.GetPosition();
            local_53 = 90.0f;
            local_54 = 50.0f;
            const FC_Collision& local_60 = local_58.opCall();
            if (local_60)
            {
                local_53 = local_60.GetScaledHalfHeight();
                local_54 = local_60.GetScaledRadius();
            }
            float32 local_3 = float32(local_52.Z) - local_53;
            float32 local_12 = FMath::Max(this.MaxHeightDifference, 1.0f);
            FECSEntity local_36 = FECSEntity(::FAIKnowledgeUtils::GetAIBlackboardValueEntityId(local_40, n"TargetEntityID"));
            FVector local_78(FVector::ZeroVector);
            local_79 = false;
            float local_82 = 1e30;
            local_83 = 50.0f;
            if (local_36.IsValid())
            {
                if (local_86)
                {
                    local_78 = local_86.GetPosition();
                    local_79 = true;
                    FVector local_98 = (local_78 - local_52);
                    local_98.Z = 0.0;
                    local_82 = (local_98.X * local_98.X) + (local_98.Y * local_98.Y);
                }
                local_60 = local_58.opCall();
                if (local_60)
                {
                    local_83 = local_60.GetScaledRadius();
                }
            }
            float32 local_13_3 = local_54 + local_83;
            if (local_79)
            {
                local_103 = local_13_3 * local_13_3;
            }
            else
            {
                local_103 = -1.0f;
            }
            if (local_79)
            {
                float32 local_61 = FMath::Max((float32(FMath::Sqrt(local_82)) - local_13_3), 0.0f);
                local_82 = local_61 * local_61;
            }
            FVector local_98_2(FVector::ZeroVector);
            local_107 = false;
            if (::FEcologySceneInfoUtils::FindCreatureTargetCombatRegion(local_40).IsValid())
            {
                if (local_118)
                {
                    AActor local_122;
                    local_120 = Cast<AECSRegionVolume>(local_122);
                    if (local_120 != nullptr)
                    {
                        FBox local_166 = local_120.GetBounds().GetBox();
                        local_29 = local_166.IsValid;
                        if (local_29)
                        {
                            local_98_2 = local_166.GetCenter();
                            local_98_2.Z = local_52.Z;
                            local_107 = true;
                        }
                    }
                }
            }
            if (!(local_79) && !(local_107))
            {
                continue;
            }
            int local_168 = 0;
            FVector local_174(FVector::ZeroVector);
            if (local_79)
            {
                FVector local_92 = (local_78 - local_52);
                local_92.Z = 0.0;
                if (local_92.SizeSquared2D() <= 1.0)
                {
                    local_92 = FVector(1.0, 0.0, 0.0);
                }
                local_92.Normalize(9.99999993922529e-9);
                float local_64_3;
                float local_102_2 = FMath::Atan2(local_92.Y, local_92.X);
                float32 local_106 = float32(local_102_2);
                if (this.bDebugDraw)
                {
                    local_64_3 = local_3;
                    float32 local_61_2 = float32(local_52.Y);
                    FVector local_180 = FVector(float32(local_52.X), local_61_2, local_64_3);
                    local_61_2 = this.MaxDistance;
                    local_64_3 = local_92.Y * local_61_2;
                    local_61_2 = this.MaxDistance;
                    local_102_2 = local_92.X * local_61_2;
                    FVector local_202 = (local_180 + FVector(local_102_2, local_64_3, 0.0));
                    FECSDebugDraw::DrawDebugLine(n"PathFindingDebugDraw", local_180, local_202, FColor::Cyan, FColor::Cyan, this.DebugDrawDuration, uint8(0), 3.0f);
                }
                local_29 = this.TryScanHexRingWithFan(local_40, local_52, local_92, local_1, local_7, local_6, local_10, local_106, local_82, local_78, local_103, local_3, local_12, local_168, local_9, local_174);
                if (local_29)
                {
                    if (this.bDebugDraw)
                    {
                        FECSDebugDraw::DrawDebugSphere(n"PathFindingDebugDraw", local_174, 60.0f, 12, FColor::Blue, FColor::Blue, this.DebugDrawDuration, uint8(0), 5.0f);
                    }
                    this.AddGeneratedVector(local_174);
                    continue;
                }
            }
            if (local_107)
            {
                FVector local_194 = (local_98_2 - local_52);
                float local_188_2 = 0.0;
                local_194.Z = 0.0;
                if (local_194.SizeSquared2D() <= 1.0)
                {
                    local_194 = FVector(1.0, 0.0, 0.0);
                }
                local_194.Normalize(9.99999993922529e-9);
                float local_64_4;
                float local_100_3 = FMath::Atan2(local_194.Y, local_194.X);
                float32 local_65 = float32(local_100_3);
                if (this.bDebugDraw)
                {
                    local_64_4 = float32(local_52.Y);
                    float32 local_61_3 = float32(local_52.X);
                    FVector local_186 = FVector(local_61_3, local_64_4, local_3);
                    local_188_2 = local_194.Y * this.MaxDistance;
                    local_100_3 = local_194.X * this.MaxDistance;
                    FVector local_180_2 = (local_186 + FVector(local_100_3, local_188_2, 0.0));
                    FECSDebugDraw::DrawDebugLine(n"PathFindingDebugDraw", local_186, local_180_2, FColor::Magenta, FColor::Magenta, this.DebugDrawDuration, uint8(0), 3.0f);
                }
                bool local_167 = this.TryScanHexRingWithFan(local_40, local_52, local_194, local_1, local_7, local_6, local_10, local_65, local_82, local_78, local_103, local_3, local_12, local_168, local_9, local_174);
                if (local_167)
                {
                    if (this.bDebugDraw)
                    {
                        FECSDebugDraw::DrawDebugSphere(n"PathFindingDebugDraw", local_174, 60.0f, 12, FColor::Blue, FColor::Blue, this.DebugDrawDuration, uint8(0), 5.0f);
                    }
                    this.AddGeneratedVector(local_174);
                    continue;
                }
            }
        }
        return;
    }
    FVector RotateAroundZ(const FVector &inout InVector, const float32 AngleRadians) const
    {
        float32 local_2 = FMath::Cos(AngleRadians);
        float32 local_1 = FMath::Sin(AngleRadians);
        float local_10_2 = (InVector.X * local_1) + (InVector.Y * local_2);
        return FVector((InVector.X * local_2) - (InVector.Y * local_1), local_10_2, InVector.Z);
    }
    int GetFirstIndexOfRing(const int Ring) const
    {
        if (Ring <= 0)
        {
            return 0;
        }
        return (((Ring - 1) * 3) * Ring) + 1;
    }
    bool TryScanHexRingWithFan(const FECSEntity &inout InQuerier, const FVector &inout QuerierPos, const FVector &inout Axis, const float32 HexRadius, const int StartRing, const int EndRing, const float32 CosThreshold, const float32 RotationRadians, const float BossToPlayerDistSq, const FVector &inout PlayerPos, const float32 GoalRadiusSq, const float32 BossFootZ, const float32 MaxHeightDiff, int &inout PointChecks, const int EffectiveMaxChecks, FVector &out OutPoint) const
    {
        bool local_12;
        float32 local_109;
        FString local_120;
        bool local_131;
        FVector local_6;
        OutPoint = local_6;
        bool local_11 = false;
        bool local_13 = false;
        float32 local_14 = -1.0f;
        FVector local_20(FVector::ZeroVector);
        int local_21 = StartRing;
        for (; local_21 <= EndRing; ++local_21)
        {
            int local_23 = this.GetFirstIndexOfRing(local_21);
            int local_22 = local_21 * 6;
            int local_25 = 0;
            for (; local_25 < local_22; ++local_25)
            {
                FHexCoord local_30 = ::FEcologyHexUtils::GetHexCoordAtIndex(local_23 + local_25);
                FVector local_46 = FHexCoord::HexToWorld3D(local_30, HexRadius, 0.0f);
                FVector local_52 = (QuerierPos + this.RotateAroundZ(local_46, RotationRadians));
                local_52.Z = BossFootZ;
                FVector local_58 = (local_52 - QuerierPos);
                local_58.Z = 0.0;
                float local_60 = local_58.X * local_58.X;
                float local_70 = local_58.Y * local_58.Y;
                float local_72 = local_60 + local_70;
                if (local_72 < (this.MinDistance * this.MinDistance) || (local_72 > (this.MaxDistance * this.MaxDistance)))
                {
                    continue;
                }
                local_60 = FMath::Sqrt(local_72);
                float32 local_10 = float32(local_60);
                if (local_10 <= 1.0f)
                {
                    continue;
                }
                local_70 = local_58.X * Axis.X;
                local_60 = local_70 + (local_58.Y * Axis.Y);
                float32 local_7 = float32(local_60);
                if (local_7 < (local_10 * CosThreshold))
                {
                    continue;
                }
                ++PointChecks;
                if (PointChecks > EffectiveMaxChecks)
                {
                    if (local_11)
                    {
                        OutPoint = local_20;
                        return true;
                    }
                    return false;
                }
                FVector local_66 = FVector(100.0, 100.0, MaxHeightDiff);
                bool local_73 = FAIPathFollowUtils::IsPointOnNavigation(InQuerier, local_52, local_66);
                if (!(local_73))
                {
                    if (this.bDebugDraw)
                    {
                        FECSDebugDraw::DrawDebugSphere(n"PathFindingDebugDraw", local_52, 30.0f, 8, FColor::Red, FColor::Red, this.DebugDrawDuration, uint8(0), 3.0f);
                    }
                    continue;
                }
                FVector local_82 = FAIPathFollowUtils::ProjectPointToNavigation(InQuerier, local_52, local_66);
                local_60 = BossFootZ;
                local_60 = FMath::Abs(local_82.Z - local_60);
                if (local_60 > MaxHeightDiff)
                {
                    if (this.bDebugDraw)
                    {
                        FECSDebugDraw::DrawDebugSphere(n"PathFindingDebugDraw", local_82, 30.0f, 8, FColor::Yellow, FColor::Yellow, this.DebugDrawDuration, uint8(0), 3.0f);
                    }
                    continue;
                }
                local_52 = local_82;
                if (this.bDebugDraw)
                {
                    FECSDebugDraw::DrawDebugSphere(n"PathFindingDebugDraw", local_52, 30.0f, 8, FColor::Green, FColor::Green, this.DebugDrawDuration, uint8(0), 3.0f);
                }
                local_12 = (local_72 < BossToPlayerDistSq);
                float32 local_75 = (local_7 / local_10) - CosThreshold;
                float32 local_94 = (local_75 / FMath::Max(1.0f - CosThreshold, 0.001f)) * this.AlignmentScoreMax;
                float local_95 = local_10 - this.MinDistance;
                local_75 = this.MaxDistance - this.MinDistance;
                float32 local_97 = local_95 / FMath::Max(local_75, 1.0f);
                if (local_12)
                {
                    local_75 = local_97 * this.DistScoreMax;
                }
                else
                {
                    local_95 = 1.0f - local_97;
                    local_75 = local_95 * this.DistScoreMax;
                }
                local_70 = (float32(PlayerPos.Y) - float32(local_52.Y));
                float local_98 = float32(local_52.X);
                FVector local_92 = FVector((float32(PlayerPos.X) - local_98), local_70, 0.0);
                local_70 = local_92.Y * local_92.Y;
                if (GoalRadiusSq < 0.0f || (float32(((local_92.X * local_92.X) + local_70)) > GoalRadiusSq))
                {
                    local_109 = this.GoalScoreMax;
                }
                else
                {
                    local_109 = 0.0f;
                }
                local_95 = local_94 + local_75;
                float32 local_110 = local_95 + local_109;
                if (this.bDebugDraw)
                {
                    FECSDebugDraw::DrawDebugString(n"PathFindingDebugDraw", (local_52 + FVector(0.0, 0.0, 150.0)), FString().Append("T:").Append(FString::ApplyFormat(local_110, ".2f")), FColor::Purple, 1.0f, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), int(this.DebugDrawDuration));
                    FECSDebugDraw::DrawDebugString(n"PathFindingDebugDraw", (local_52 + FVector(0.0, 0.0, 120.0)), FString().Append("A:").Append(FString::ApplyFormat(local_94, ".2f")), FColor::Blue, 1.0f, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), this.DebugDrawDuration);
                    FECSDebugDraw::DrawDebugString(n"PathFindingDebugDraw", (local_52 + FVector(0.0, 0.0, 90.0)), FString().Append("D:").Append(FString::ApplyFormat(local_75, ".2f")), FColor::Yellow, 1.0f, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), this.DebugDrawDuration);
                    FECSDebugDraw::DrawDebugString(n"PathFindingDebugDraw", (local_52 + FVector(0.0, 0.0, 60.0)), FString().Append("G:").Append(FString::ApplyFormat(local_109, ".0f")), FColor::White, 1.0f, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), this.DebugDrawDuration);
                    local_98 = this.DebugDrawDuration;
                    FColor local_112 = FColor(uint8(0), uint8(0), uint8(0), uint8(0));
                    if (local_12)
                    {
                        local_120 = "SAFE";
                    }
                    else
                    {
                        local_120 = "UNSAFE";
                    }
                    FECSDebugDraw::DrawDebugString(n"PathFindingDebugDraw", (local_52 + FVector(0.0, 0.0, 30.0)), local_120);
                }
                local_131 = false;
                if (!(local_11))
                {
                    local_131 = true;
                }
                else
                {
                    if (local_12 && !(local_13))
                    {
                        local_131 = true;
                    }
                    else
                    {
                        bool local_83;
                        local_83 = !(local_12);
                        local_83 = local_83 == !(local_13) && (local_110 > local_14);
                        if (local_83)
                        {
                            local_131 = true;
                        }
                    }
                }
                if (local_131)
                {
                    local_11 = true;
                    local_13 = local_12;
                    local_14 = local_110;
                    local_20 = local_52;
                }
            }
        }
        if (local_11)
        {
            OutPoint = local_20;
            return true;
        }
        return false;
    }
}

