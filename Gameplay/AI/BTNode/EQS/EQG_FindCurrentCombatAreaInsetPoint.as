

class UEQG_FindCurrentCombatAreaInsetPoint : UEnvQueryGenerator_ECS_BlueprintBase
{
    UPROPERTY()
    float32 InsetDistance = 2000.0f;
    UPROPERTY()
    int InsetCheckDirections = 24;
    UPROPERTY()
    float32 HexStepDistance = 200.0f;
    UPROPERTY()
    float32 HexForwardFanAngleDegrees = 120.0f;
    UPROPERTY()
    int MaxPointChecks = 256;
    UPROPERTY()
    bool bDebugEmitAllCandidatePoints = false;
    UPROPERTY()
    bool bDebugDrawInsetSampleSpheres = false;

    default GeneratedItemType = UEnvQueryItemType_Point;


    UFUNCTION()
    void DoItemGenerationFromEntities_Implementation(const TArray<FECSEntityId> &inout ContextEntities) const
    {
        int local_64 = 0;
        int local_74 = 0;
        AECSRegionVolume local_76;
        bool local_219;
        float32 local_1 = this.InsetDistance;
        int local_3 = this.InsetCheckDirections;
        TArray<FVector> local_8;
        if (local_1 > 0.0f)
        {
            int local_11 = FMath::Max(local_3, 8);
            float local_18 = 6.283185307179586 / float(local_11);
            int local_19 = 0;
            for (; local_19 < local_11; )
            {
                float local_14 = local_18 * float(local_19);
                float local_34 = float32((FMath::Sin(local_14) * local_1));
                float local_16 = FMath::Cos(local_14);
                local_16 = local_16 * local_1;
                float local_36 = float32(local_16);
                local_8.Add(FVector(local_36, local_34, 0.0));
                ++local_19;
            }
        }
        for (auto& local_50 : ContextEntities)
        {
            FECSEntity local_58 = FECSEntity(local_50);
            if (!(local_58.IsValid()))
            {
                continue;
            }
            if (!(local_64))
            {
                continue;
            }
            if (!(::FEcologySceneInfoUtils::FindCreatureTargetCombatRegion(local_58).IsValid()))
            {
                continue;
            }
            if (!(local_74))
            {
                continue;
            }
            AActor local_78;
            local_76 = Cast<AECSRegionVolume>(local_78);
            if ((!((local_76 != nullptr))))
            {
                continue;
            }
            FVector local_86 = local_64.GetPosition();
            FBox local_128 = local_76.GetBounds().GetBox();
            if (!(local_128.IsValid))
            {
                continue;
            }
            if (this.bDebugDrawInsetSampleSpheres)
            {
                FBox local_100 = local_76.GetVolumeBoundsWithCache().GetBox();
                XLog(ELog(30), FString().Append("[VolDebug] VolumeOrigin=").Append(local_76.GetActorLocation()).Append(" Scale=").Append(local_76.GetActorScale3D()));
                FVector local_154 = FVector(local_128.Max);
                FVector local_166 = (local_154 - local_128.Min);
                XLog(ELog(30), FString().Append("[VolDebug] AABB(Direct) Min=").Append(local_128.Min).Append(" Max=").Append(local_128.Max).Append(" Size=").Append(local_166));
                XLog(ELog(30), FString().Append("[VolDebug] AABB(Cached) Min=").Append(local_100.Min).Append(" Max=").Append(local_100.Max));
                XLog(ELog(30), FString().Append("[VolDebug] QuerierPos=").Append(local_86).Append(" Quick=").Append(local_76.QuickEncompassesPoint(local_86)).Append(" Precise=").Append(local_76.EncompassesPoint(local_86, 0.0f)));
                local_154 = FVector(local_128.Min.X, local_128.Min.Y, local_86.Z);
                local_166 = FVector(local_128.Max.X, local_128.Min.Y, local_86.Z);
                FVector local_174 = FVector(local_128.Max.X, local_128.Max.Y, local_86.Z);
                FVector local_180 = FVector(local_128.Min.X, local_128.Max.Y, local_86.Z);
                FECSDebugDraw::DrawDebugLine(n"PathFindingDebugDraw", local_154, local_166, FColor::Yellow, FColor::Yellow, 30.0f, uint8(0), 3.0f);
                FECSDebugDraw::DrawDebugLine(n"PathFindingDebugDraw", local_166, local_174, FColor::Yellow, FColor::Yellow, 30.0f, uint8(0), 3.0f);
                FECSDebugDraw::DrawDebugLine(n"PathFindingDebugDraw", local_174, local_180, FColor::Yellow, FColor::Yellow, 30.0f, uint8(0), 3.0f);
                FECSDebugDraw::DrawDebugLine(n"PathFindingDebugDraw", local_180, local_154, FColor::Yellow, FColor::Yellow, 30.0f, uint8(0), 3.0f);
                FVector local_186 = local_128.GetCenter();
                local_186.Z = local_86.Z;
                int local_19_2 = 36;
                float32 local_201 = 200.0f;
                float local_36_2 = (FVector(local_128.Max) - local_128.Min).Size();
                float32 local_2 = float32(local_36_2);
                TArray<FVector> local_206;
                int local_11_2 = 0;
                for (; local_11_2 < local_19_2; )
                {
                    local_36_2 = local_19_2;
                    local_36_2 = (6.283185307179586 / local_36_2) * float(local_11_2);
                    FVector local_192 = FVector(float32(FMath::Cos(local_36_2)), float32(FMath::Sin(local_36_2)), 0.0);
                    FVector local_218 = local_186;
                    local_219 = false;
                    float32 local_220 = 0.0f;
                    for (; local_220 <= local_2; local_220 = local_220 + local_201)
                    {
                        FVector local_212 = (local_186 + (local_192 * local_220));
                        if (local_76.EncompassesPoint(local_212, 0.0f))
                        {
                            local_218 = local_212;
                            local_219 = true;
                            continue;
                        }
                        if (local_219)
                        {
                            break;
                        }
                    }
                    if (local_219)
                    {
                    }
                    else
                    {
                    }
                    local_206.Add();
                    ++local_11_2;
                }
                local_11_2 = 0;
                for (; local_11_2 < local_206.Num(); )
                {
                    int local_10 = (local_11_2 + 1) % local_206.Num();
                    FECSDebugDraw::DrawDebugLine(n"PathFindingDebugDraw", local_206[local_11_2], local_206[local_10], FColor::Cyan, FColor::Cyan, 30.0f, uint8(0), 3.0f);
                    FECSDebugDraw::DrawDebugSphere(n"PathFindingDebugDraw", local_206[local_11_2], 40.0f, 6, FColor::Cyan, FColor::Cyan, 30.0f, uint8(0), 2.0f);
                    ++local_11_2;
                }
            }
            FVector local_226 = local_128.GetCenter();
            FVector local_30 = FVector(FVector::ZeroVector);
            bool local_230 = this.TryFindPointByHexHalfFan(local_86, local_226, local_128, local_76, local_1, local_8, this.bDebugEmitAllCandidatePoints, local_30);
            if (local_230)
            {
                FVector local_192_2 = FVector(FVector::ZeroVector);
                if (this.TrySnapPointToGround(local_58, local_30, local_192_2))
                {
                    this.AddGeneratedVector(local_192_2);
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
    bool IsPointInInsetSafeZone(const FVector &inout Point, const AECSRegionVolume CombatVolume, const TArray<FVector> &inout InsetOffsets) const
    {
        if (!((CombatVolume != nullptr)) || !(CombatVolume.QuickEncompassesPoint(Point)))
        {
            if (this.bDebugDrawInsetSampleSpheres)
            {
                XLog(ELog(30), FString().Append("[InsetCheck] CenterInvalid Point=").Append(Point));
            }
            return false;
        }
        if (InsetOffsets.Num() <= 0)
        {
            return true;
        }
        int local_10 = 0;
        for (; local_10 < InsetOffsets.Num(); ++local_10)
        {
            FVector local_22 = (Point + InsetOffsets[local_10]);
            bool local_2 = CombatVolume.QuickEncompassesPoint(local_22);
            if (this.bDebugDrawInsetSampleSpheres)
            {
                XLog(ELog(30), FString().Append("[InsetCheck] SampleIdx=").Append(local_10).Append(" Inside=").Append(local_2).Append(" SamplePoint=").Append(local_22));
                if (local_2)
                {
                }
                else
                {
                }
                if (local_2)
                {
                }
                else
                {
                }
                FECSDebugDraw::DrawDebugSphere(n"PathFindingDebugDraw", local_22, 50.0f, 12);
            }
            if (!(local_2))
            {
                return false;
            }
        }
        return true;
    }
    bool PassBoundsCoarseFilter(const FVector &inout Point, const FBox &inout CombatBounds, const float32 SafeInset) const
    {
        if (!(CombatBounds.IsValid))
        {
            return false;
        }
        if (!(CombatBounds.IsInside(Point)))
        {
            return false;
        }
        if (SafeInset <= 0.0f)
        {
            return true;
        }
        return (FMath::Min(FMath::Min((Point.X - CombatBounds.Min.X), (CombatBounds.Max.X - Point.X)), FMath::Min((Point.Y - CombatBounds.Min.Y), (CombatBounds.Max.Y - Point.Y))) >= SafeInset);
    }
    bool TrySnapPointToGround(const FECSEntity &inout TraceEntity, const FVector &inout Point, FVector &out OutGroundPoint) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    bool TryFindPointByHexHalfFan(const FVector &inout QuerierPos, const FVector &inout BoundsCenter, const FBox &inout CombatBounds, const AECSRegionVolume CombatVolume, const float32 SafeInset, const TArray<FVector> &inout InsetOffsets, const bool bEmitAllCandidates, FVector &out OutPoint) const
    {
        bool local_48;
        FVector local_6;
        OutPoint = local_6;
        float32 local_10 = FMath::Max(this.HexStepDistance, 1.0f);
        int local_14 = FMath::Max(this.MaxPointChecks, 1);
        FVector local_26 = (BoundsCenter - QuerierPos);
        local_26.Z = 0.0;
        if (local_26.SizeSquared2D() <= 1.0)
        {
            local_26 = FVector(1.0, 0.0, 0.0);
        }
        local_26.Normalize(9.99999993922529e-9);
        int local_35 = 0;
        if (local_35 < local_14)
        {
            ++local_35;
            if (bEmitAllCandidates)
            {
                this.AddGeneratedVector(QuerierPos);
            }
            if (!(bEmitAllCandidates) && this.PassBoundsCoarseFilter(QuerierPos, CombatBounds, SafeInset) && this.IsPointInInsetSafeZone(QuerierPos, CombatVolume, InsetOffsets))
            {
                OutPoint = QuerierPos;
                return true;
            }
        }
        else
        {
            return false;
        }
        FVector local_20 = (BoundsCenter - QuerierPos);
        float local_34 = local_20.Size2D();
        if (local_34 <= 1.0)
        {
            local_34 = local_10;
        }
        int local_11 = FMath::Max(FMath::CeilToInt((local_34 / local_10)), 1);
        float32 local_8 = float32((FMath::Atan2(local_26.Y, local_26.X)));
        float32 local_41 = FMath::Clamp(this.HexForwardFanAngleDegrees, 0.0f, 180.0f) * 0.5f;
        float32 local_7 = FMath::Cos(FMath::DegreesToRadians(local_41));
        int local_45 = 1;
        for (; local_45 <= local_11; ++local_45)
        {
            int local_12 = this.GetFirstIndexOfRing(local_45);
            int local_46 = local_45 * 6;
            local_48 = false;
            FVector local_54(FVector::ZeroVector);
            float32 local_55 = -2.0f;
            float local_58 = 0.0;
            int local_59 = 0;
            for (; local_59 < local_46; ++local_59)
            {
                FHexCoord local_63 = ::FEcologyHexUtils::GetHexCoordAtIndex(local_12 + local_59);
                FVector local_20_2 = FHexCoord::HexToWorld3D(local_63, local_10, 0.0f);
                FVector local_78 = (QuerierPos + this.RotateAroundZ(local_20_2, local_8));
                FVector local_84 = (local_78 - QuerierPos);
                local_84.Z = 0.0;
                float local_38_2 = local_84.X * local_26.X;
                float local_28_4 = local_84.Y * local_26.Y;
                float local_30_2 = local_38_2 + local_28_4;
                float32 local_44 = float32(local_30_2);
                local_38_2 = local_84.X * local_84.X;
                local_28_4 = local_84.Y;
                local_28_4 = local_28_4 * local_84.Y;
                local_30_2 = local_38_2 + local_28_4;
                local_28_4 = FMath::Sqrt(local_30_2);
                float32 local_91 = float32(local_28_4);
                if (local_91 <= 1.0f)
                {
                    continue;
                }
                float32 local_92 = local_91 * local_7;
                if (local_44 < local_92)
                {
                    continue;
                }
                ++local_35;
                if (local_35 > local_14)
                {
                    if ((!(bEmitAllCandidates)) && local_48)
                    {
                        OutPoint = local_54;
                        return true;
                    }
                    return false;
                }
                if (bEmitAllCandidates)
                {
                    this.AddGeneratedVector(local_78);
                }
                if (!(bEmitAllCandidates) && !(this.PassBoundsCoarseFilter(local_78, CombatBounds, SafeInset)))
                {
                    continue;
                }
                if (!(bEmitAllCandidates) && this.IsPointInInsetSafeZone(local_78, CombatVolume, InsetOffsets))
                {
                    local_92 = local_44 / local_91;
                    local_38_2 = local_84.X * local_84.X;
                    local_30_2 = local_84.Y;
                    local_30_2 = local_30_2 * local_84.Y;
                    local_28_4 = local_38_2 + local_30_2;
                    if (!(local_48) || (local_92 > (local_55 + 0.0001f)) || (FMath::Abs((local_92 - local_55)) <= 0.0001f && (local_28_4 < local_58)))
                    {
                        local_48 = true;
                        local_54 = local_78;
                        local_55 = local_92;
                        local_58 = local_28_4;
                    }
                }
            }
            if ((!(bEmitAllCandidates)) && local_48)
            {
                OutPoint = local_54;
                return true;
            }
        }
        if (bEmitAllCandidates)
        {
            return false;
        }
        return false;
    }
}

