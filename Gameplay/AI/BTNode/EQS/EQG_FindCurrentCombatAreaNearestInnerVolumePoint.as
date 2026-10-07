

class UEQG_FindCurrentCombatAreaNearestInnerVolumePoint : UEnvQueryGenerator_ECS_BlueprintBase
{
    UPROPERTY()
    float32 HexStepDistance = 200.0f;
    UPROPERTY()
    float32 HexForwardFanAngleDegrees = 120.0f;
    UPROPERTY()
    int MaxPointChecks = 256;
    UPROPERTY()
    bool bDebugDrawPoints = false;

    default GeneratedItemType = UEnvQueryItemType_Point;


    UFUNCTION()
    void DoItemGenerationFromEntities_Implementation(const TArray<FECSEntityId> &inout ContextEntities) const
    {
        int local_38 = 0;
        int local_48 = 0;
        AECSCombatRegionVolume local_50;
        bool local_114;
        bool local_123;
        float32 local_4 = FMath::Max(this.HexStepDistance, 1.0f);
        int local_8 = FMath::Max(this.MaxPointChecks, 1);
        for (auto& local_24 : ContextEntities)
        {
            FECSEntity local_32 = FECSEntity(local_24);
            if (!(local_32.IsValid()))
            {
                continue;
            }
            if (!(local_38))
            {
                continue;
            }
            if (!(::FEcologySceneInfoUtils::FindCreatureTargetCombatRegion(local_32).IsValid()))
            {
                continue;
            }
            if (!(local_48))
            {
                continue;
            }
            AActor local_52;
            local_50 = Cast<AECSCombatRegionVolume>(local_52);
            if (local_50 == nullptr)
            {
                continue;
            }
            int local_6 = local_50.PreferAreaPoints.Num();
            if (local_6 < 3)
            {
                continue;
            }
            FVector local_60 = local_38.GetPosition();
            Get local_36;
            FVector local_66 = local_36.opCall().GetPosition();
            FVector local_78 = this.ComputePreferAreaCentroid(local_50, local_66);
            local_78.Z = local_60.Z;
            if (this.bDebugDrawPoints)
            {
                FECSDebugDraw::DrawDebugSphere(n"PathFindingDebugDraw", local_78, 80.0f, 12, FColor::Purple, FColor::Purple, 30.0f, uint8(0), 5.0f);
                int local_82 = 0;
                while (local_82 < local_6)
                {
                    FVector local_72 = local_50.PreferAreaPoints[local_82];
                    FVector local_94 = (local_72 + local_66);
                    local_94.Z = local_60.Z;
                    FECSDebugDraw::DrawDebugSphere(n"PathFindingDebugDraw", local_94, 50.0f, 8, FColor::Purple, FColor::Purple, 30.0f, uint8(0), 4.0f);
                    local_6 = local_82 + 1;
                    local_6 = local_6 % local_50.PreferAreaPoints.Num();
                    local_72 = local_50.PreferAreaPoints[local_6];
                    FVector local_88 = (local_72 + local_66);
                    local_88.Z = local_60.Z;
                    FECSDebugDraw::DrawDebugLine(n"PathFindingDebugDraw", local_94, local_88, FColor::Purple, FColor::Purple, 30.0f, uint8(0), 3.0f);
                    ++local_82;
                    local_6 = local_50.PreferAreaPoints.Num();
                }
            }
            local_6 = 0;
            if (local_50.IsPointInPreferArea(local_60))
            {
                this.AddGeneratedVector(local_60);
                if (this.bDebugDrawPoints)
                {
                    FECSDebugDraw::DrawDebugSphere(n"PathFindingDebugDraw", local_60, 60.0f, 12, FColor::Green, FColor::Green, 30.0f, uint8(0), 5.0f);
                }
                continue;
            }
            ++local_6;
            FVector local_102 = (local_78 - local_60);
            local_102.Z = 0.0;
            if (local_102.SizeSquared2D() <= 1.0)
            {
                local_102 = FVector(1.0, 0.0, 0.0);
            }
            local_102.Normalize(9.99999993922529e-9);
            FVector local_72_2 = (local_78 - local_60);
            float local_80 = local_72_2.Size2D() * 2.0;
            if (local_80 <= 1.0)
            {
                local_80 = local_4;
            }
            float local_104 = local_4;
            float local_106 = local_80 / local_104;
            int local_7 = FMath::Max(FMath::CeilToInt(local_106), 1);
            float local_108;
            local_106 = FMath::Atan2(local_102.Y, local_102.X);
            float32 local_3 = float32(local_106);
            float32 local_110 = FMath::Clamp(this.HexForwardFanAngleDegrees, 0.0f, 180.0f) * 0.5f;
            float32 local_2 = FMath::Cos(FMath::DegreesToRadians(local_110));
            local_114 = false;
            int local_115 = 1;
            for (; (int(local_115) <= int(local_7)) && (!(local_114)); ++local_115)
            {
                int local_5 = this.GetFirstIndexOfRing(local_115);
                int local_117 = local_115 * 6;
                FVector local_94_2(FVector::ZeroVector);
                float32 local_119 = -2.0f;
                float local_122 = 0.0;
                local_123 = false;
                int local_124 = 0;
                for (; local_124 < local_117; ++local_124)
                {
                    FHexCoord local_128 = ::FEcologyHexUtils::GetHexCoordAtIndex(local_5 + local_124);
                    local_72_2 = FHexCoord::HexToWorld3D(local_128, local_4, 0.0f);
                    FVector local_138 = (local_60 + this.RotateAroundZ(local_72_2, local_3));
                    FVector local_144 = (local_138 - local_60);
                    local_144.Z = 0.0;
                    local_104 = local_144.X * local_102.X;
                    local_106 = local_144.Y;
                    local_106 = local_106 * local_102.Y;
                    local_108 = local_104 + local_106;
                    float32 local_109 = float32(local_108);
                    local_104 = local_144.X * local_144.X;
                    local_106 = local_144.Y;
                    local_106 = local_106 * local_144.Y;
                    local_106 = FMath::Sqrt(local_104 + local_106);
                    float32 local_157 = float32(local_106);
                    if (local_157 <= 1.0f)
                    {
                        continue;
                    }
                    if (local_109 < (local_157 * local_2))
                    {
                        continue;
                    }
                    ++local_6;
                    if (local_6 > local_8)
                    {
                        if (local_123)
                        {
                            this.AddGeneratedVector(local_94_2);
                            local_114 = true;
                        }
                        break;
                    }
                    bool local_116 = local_50.IsPointInPreferArea(local_138);
                    if (this.bDebugDrawPoints)
                    {
                        if (local_116)
                        {
                        }
                        else
                        {
                        }
                        FColor local_160;
                        FECSDebugDraw::DrawDebugSphere(n"PathFindingDebugDraw", local_138, 40.0f, 8, local_160, local_160, 30.0f, uint8(0), 3.0f);
                    }
                    if (local_116)
                    {
                        float32 local_112 = local_109 / local_157;
                        local_108 = local_144.X * local_144.X;
                        local_104 = local_144.Y;
                        local_104 = local_104 * local_144.Y;
                        local_106 = local_108 + local_104;
                        if (!(local_123) || (local_112 > (local_119 + 0.0001f)) || (FMath::Abs((local_112 - local_119)) <= 0.0001f && (local_106 < local_122)))
                        {
                            local_123 = true;
                            local_94_2 = local_138;
                            local_119 = local_112;
                            local_122 = local_106;
                        }
                    }
                }
                if (local_123 && !(local_114))
                {
                    this.AddGeneratedVector(local_94_2);
                    local_114 = true;
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
    FVector ComputePreferAreaCentroid(const AECSCombatRegionVolume CombatVolume, const FVector &inout VolumeWorldPos) const
    {
        FVector local_6(FVector::ZeroVector);
        int local_8 = CombatVolume.PreferAreaPoints.Num();
        int local_9 = 0;
        for (; local_9 < local_8; )
        {
            local_6 += CombatVolume.PreferAreaPoints[local_9];
            ++local_9;
        }
        FVector local_16 = (local_6 / local_8);
        return (local_16 + VolumeWorldPos);
    }
}

