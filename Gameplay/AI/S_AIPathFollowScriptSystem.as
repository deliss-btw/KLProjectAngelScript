
const FConsoleVariable CVar_AI_DebugAIPathPoint = FConsoleVariable();
const FConsoleVariable CVar_AI_DebugEntityAIPathPoint = FConsoleVariable();
const FConsoleVariable CVar_AI_DebugAIPathPointEntityID = FConsoleVariable();
const FConsoleVariable CVar_AI_CloseAILerpToPath = FConsoleVariable();

class US_AIPathFollowScriptSystem : UECSScriptSystem
{
    UPROPERTY()
    int PathAnimationPredictionSamples = 5;
    UPROPERTY()
    float32 PathAnimationPredictionSamplesInterval = 100.0f;
    UPROPERTY()
    bool bDebugDrawPathAnimationPredictionSamples = false;
    UPROPERTY()
    float32 AIGroundMoveStuckThreshold = 0.075f;
    UPROPERTY()
    FFPTime AIGroundMoveStuckStatisStart = 0.65;
    UPROPERTY()
    FFPTime AIGroundMoveStuckStatisDuration = 1;
    UPROPERTY()
    bool bDoStandTurnWhenReached = false;
    UPROPERTY()
    float32 JumpMaxDistance = 1000.0f;
    UPROPERTY()
    float32 JumpMaxDistanceSQ = (this.JumpMaxDistance * this.JumpMaxDistance);
    float32 UseTargetDirectlyThreshold = 0.7f;
    float32 TryClosePathAlpha = 0.5f;
    float32 TryClosePathMaxDistance = 2000.0f;
    float32 TryClosePathAdvanceDistanceMin = 50.0f;
    float32 TryClosePathAdvanceDistanceMax = 500.0f;


    bool FindNextFollowPosition(FC_AIPathFollow &inout PathFollow, const FVector &inout Location, const bool bIgnoreZ, FVector &inout OutPathStartPosition, const bool bCheckPathDir = false, const FVector &inout Forward = FVector::ZeroVector) const
    {
        if (PathFollow.bHasReach)
        {
            return false;
        }
        int local_3 = PathFollow.CurrentPath.Num() - 1;
        int local_5 = PathFollow.GetCurrentPathIdx();
        float32 local_7 = PathFollow.CurrentPathDeltaAlpha;
        float32 local_6 = local_7;
        if (local_5 >= 0 && (local_5 <= local_3))
        {
            float local_58;
            bool local_8;
            FVector& local_10 = PathFollow.CurrentPath[local_5];
            FVector local_16 = (local_10 - Location);
            if (bIgnoreZ)
            {
                local_16.Z = 0.0;
            }
            if (local_5 == local_3 && ((local_16.SizeSquared() <= FMath::Square(PathFollow.AcceptableRadius))))
            {
                PathFollow.SetCurrentPathIdx((PathFollow.GetCurrentPathIdx() + 1));
                return false;
            }
            if (local_5 > 0)
            {
                int local_4 = local_5 - 1;
            }
            else
            {
            }
            FVector local_34;
            FVector local_22 = (local_10 - local_34);
            if (bIgnoreZ)
            {
                local_22.Z = 0.0;
            }
            float local_26_2 = local_22.Size();
            FVector local_40 = local_22.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            FVector local_48 = (Location - local_34);
            if (bIgnoreZ)
            {
                local_48.Z = 0.0;
            }
            float local_42_2 = local_48.DotProduct(local_40);
            local_58 = local_42_2;
            float local_56 = local_48.Size();
            if (local_56 > FMath::Abs(local_42_2))
            {
                local_7 = float32(((local_56 * local_56) - (local_42_2 * local_42_2)));
            }
            else
            {
                local_7 = 0.0f;
            }
            float32 local_27 = PathFollow.PathPointTolerance;
            float32 local_61 = PathFollow.PathPointTolerance;
            local_27 = local_27 * local_61;
            float local_66 = FMath::Max(100.0, local_27);
            if (local_66 > local_7)
            {
                local_58 = FMath::Sqrt((local_66 - local_7)) + local_42_2;
            }
            float local_64_2 = local_26_2 * local_6;
            if (local_58 < local_64_2)
            {
                local_58 = local_64_2;
            }
            local_8 = (local_58 >= local_26_2);
            if (local_8 && bCheckPathDir && (local_26_2 > 0.5) && (local_7 > 4.0f))
            {
                if (local_40.DotProduct(Forward) <= 0.75)
                {
                    local_8 = false;
                }
            }
            if (local_8)
            {
                ++local_5;
                if (local_5 <= local_3)
                {
                    float local_70 = local_58 - local_26_2;
                    FVector local_80 = (FVector(PathFollow.CurrentPath[local_5]) - PathFollow.CurrentPath[(local_5 - 1)]);
                    if (bIgnoreZ)
                    {
                        local_80.Z = 0.0;
                    }
                    float local_74 = local_80.Size();
                    if (local_74 > 0.0)
                    {
                        float32 local_6_3 = float32((local_70 / local_74));
                    }
                }
            }
            else
            {
                FVector local_86 = (local_40 * local_58);
                OutPathStartPosition = (local_86 + local_34);
                if (local_26_2 > 0.0)
                {
                    local_61 = float32((local_58 / local_26_2));
                }
                else
                {
                    local_61 = 1.0f;
                }
                float32 local_6_4 = local_61;
            }
            PathFollow.SetCurrentPathIdx(FMath::Min(local_5, local_3));
            local_61 = PathFollow.CurrentPathDeltaAlpha;
            float32 local_27_2 = PathFollow.CurrentPathMaxDeltaAlpha;
            float32 local_89 = FMath::Max(local_27_2, local_61);
            return true;
        }
        return false;
    }
    bool UpdateCycleTurn(FC_AIPathFollow &inout PathFollow, const FC_CharacterMovementParam &inout MovementParam, const FVector &inout Location, const FVector &inout Forward, FVector &inout OutTarget, bool &inout bDoTurnStand) const
    {
        if (PathFollow.GetCurrentPathIdx() >= 0)
        {
            float32 local_4 = 1.2f;
            float32 local_9 = MovementParam.MoveSpeed;
            float32 local_5 = float32(FECSWorld::FixedFrameInterval.ToSeconds());
            local_9 = local_9 * local_5;
            float32 local_6 = MovementParam.MoveSpeed;
            local_5 = FMath::DegreesToRadians(MovementParam.TurnSpeed);
            local_6 = local_6 / local_5;
            local_5 = local_6 + local_9;
            float32 local_10 = local_5 * local_4;
            local_5 = local_10 * local_10;
            if (PathFollow.GetCurrentPathIdx() == (PathFollow.CurrentPath.Num() - 1))
            {
                FVector& local_16 = PathFollow.CurrentPath[PathFollow.GetCurrentPathIdx()];
                float32 local_12 = float32(local_16.DistSquared2D(Location));
                if (local_12 <= local_5)
                {
                    FVector local_30 = (local_16 - Location);
                    local_30.Z = 0.0;
                    FVector local_24 = FVector(Forward.X, Forward.Y, 0.0);
                    local_30.Normalize(9.99999993922529e-9);
                    local_24.Normalize(9.99999993922529e-9);
                    if (local_24.DotProduct(local_30) < 0.5)
                    {
                        bDoTurnStand = true;
                    }
                    if (local_12 <= (local_6 * local_6))
                    {
                        PathFollow.SetCurrentPathIdx(PathFollow.GetCurrentPathIdx() + 1);
                    }
                    OutTarget = local_16;
                    return true;
                }
            }
            else
            {
                if (PathFollow.GetCurrentPathIdx() < (PathFollow.CurrentPath.Num() - 1))
                {
                    FVector& local_16_2 = PathFollow.CurrentPath[PathFollow.GetCurrentPathIdx()];
                    float32 local_11 = float32(local_16_2.DistSquared2D(Location));
                    int local_44 = 1145569280;
                    if (PathFollow.GetCurrentPathIdx() == 0)
                    {
                        if (local_11 <= local_5)
                        {
                            FVector local_50 = (local_16_2 - Location.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
                            if (local_50.DotProduct(Forward) < 0.0 || (local_11 <= 800.0f))
                            {
                                PathFollow.SetCurrentPathIdx(PathFollow.GetCurrentPathIdx() + 1);
                            }
                            OutTarget = PathFollow.CurrentPath[PathFollow.GetCurrentPathIdx()];
                            return true;
                        }
                    }
                    else
                    {
                        if (local_11 <= (local_5 * 2.1f))
                        {
                            float32 local_93;
                            FVector3f local_62 = FVector3f((local_16_2 - (PathFollow.CurrentPath[PathFollow.GetCurrentPathIdx() - 1])));
                            FVector3f local_59 = FVector3f(((PathFollow.CurrentPath[PathFollow.GetCurrentPathIdx() + 1]) - local_16_2));
                            float32 local_12_2 = local_59.Z;
                            local_62.Normalize(1e-8f);
                            local_59.Normalize(1e-8f);
                            FVector3f local_65 = local_62.CrossProduct(local_59);
                            FVector3f local_68 = (local_59 - local_62);
                            FVector3f local_80 = ((local_68 * local_10) + FVector3f(local_16_2));
                            FVector3f local_74 = (local_80 - FVector3f(Location));
                            FVector3f local_83 = FVector3f((local_16_2 - Location));
                            local_12_2 = local_74.Z;
                            local_17 = local_74.Size();
                            if (CVar_AI_DebugAIPathPoint.GetBool())
                            {
                                DebugDraw::DrawDebugPoint(this.GetWorld(), local_16_2, 20.0f, FColor::Red, false, 5.0f, uint8(0));
                                FVector local_30_2 = (FVector(local_68).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * 500.0);
                                DebugDraw::DrawDebugDirectionalArrow(this.GetWorld(), local_16_2, (local_16_2 + local_30_2), 20.0f, FColor::Red, false, 5.0f, uint8(0), 0.0f);
                            }
                            local_93 = local_68.CrossProduct(local_83).Z;
                            if ((local_93 * local_68.CrossProduct(local_62).Z) > 0.0f)
                            {
                                if (local_17 > (local_10 + 0.5f))
                                {
                                    float32 local_92 = FMath::Acos(local_10 / local_17);
                                    FVector3f local_86 = local_74.RotateAngleAxis(FMath::DegreesToRadians(local_92), local_65).opNeg();
                                    FVector3f local_71_2 = (local_86.GetSafeNormal(1e-8f, FVector3f::ZeroVector) * local_10);
                                    OutTarget = FVector((local_71_2 + local_80));
                                }
                                else
                                {
                                    OutTarget = local_16_2;
                                }
                            }
                            else
                            {
                                if (local_83.DotProduct(FVector3f(Forward)) < 0.0f || (local_11 <= 800.0f))
                                {
                                    PathFollow.SetCurrentPathIdx(PathFollow.GetCurrentPathIdx() + 1);
                                }
                                OutTarget = PathFollow.CurrentPath[PathFollow.GetCurrentPathIdx()];
                            }
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }
    FVector GetGroundMoveInput(const FC_Transform &inout Transform, const FC_AIPathFollow &inout PathFollow, const FVector &inout TargetPosition) const
    {
        float local_14 = (TargetPosition - Transform.GetPosition()).Size2D();
        if (local_14 > 1.0)
        {
            return ((TargetPosition - Transform.GetPosition()).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector) * (FMath::Lerp(0.75, 1.0, FMath::Clamp(local_14 / 100.0, 0.0, 1.0))));
        }
        else
        {
            int local_33 = PathFollow.GetCurrentPathIdx() + 1;
            if (local_33 < PathFollow.CurrentPath.Num())
            {
                FVector local_6_2 = (FVector(PathFollow.CurrentPath[local_33]) - Transform.GetPosition());
                return local_6_2.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            }
            else
            {
                return Transform.GetRotation().GetForwardVector();
            }
        }
    }
    bool FindNextAirFollowPosition(FC_AIPathFollow &inout PathFollow, const FVector &inout Location, const FVector &inout CurrentForward, FVector &inout OutTarget, const bool bFlyColliisonCheckedStuck) const
    {
        float local_82;
        if (PathFollow.bHasReach)
        {
            return false;
        }
        OutTarget = Location;
        FVector local_8;
        bool local_11 = this.FindNextFollowPosition(PathFollow, Location, false, local_8, false, FVector::ZeroVector);
        if (local_11)
        {
            OutTarget = PathFollow.CurrentPath[PathFollow.GetCurrentPathIdx()];
            if (PathFollow.GetCurrentPathIdx() > 0)
            {
                FVector local_20(PathFollow.CurrentPath[(PathFollow.GetCurrentPathIdx() - 1)]);
                FVector local_26(PathFollow.CurrentPath[PathFollow.GetCurrentPathIdx()]);
                FVector local_32 = (local_26 - local_20);
                float local_40 = local_32.Size();
                FVector local_38 = local_32.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                float local_50 = FMath::Abs(local_38.Z);
                if (local_50 <= this.UseTargetDirectlyThreshold || bFlyColliisonCheckedStuck)
                {
                    float local_70;
                    float local_62;
                    float local_60 = FMath::Max(0.0, (Location - local_20).DotProduct(local_38));
                    float local_42 = this.TryClosePathAlpha * local_40;
                    local_62 = FMath::Min(local_42, this.TryClosePathMaxDistance);
                    float local_50_2 = FMath::Clamp(CurrentForward.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector).DotProduct(local_38), 0.0, 1.0);
                    local_70 = float(this.TryClosePathAdvanceDistanceMax);
                    float local_66 = FMath::Lerp(float(this.TryClosePathAdvanceDistanceMin), local_70, local_50_2);
                    if (bFlyColliisonCheckedStuck)
                    {
                        float local_72 = 0.2 * local_40;
                        local_62 = FMath::Min(local_72, this.TryClosePathMaxDistance);
                    }
                    local_70 = local_60 + local_66;
                    if (local_70 < local_62)
                    {
                        local_70 = local_62;
                    }
                    local_70 = FMath::Clamp(local_70, 0.0, local_40);
                    OutTarget = ((local_38 * local_70) + local_20);
                    if (local_62 > 0.0)
                    {
                        float local_68_2 = local_70 / local_62;
                        local_82 = FMath::Clamp(local_68_2, 0.1, 1.0);
                    }
                    else
                    {
                        local_82 = 1.0;
                    }
                    local_42 = 1.0;
                    if (local_82 < local_42)
                    {
                        FVector local_58_2 = ((local_38 * local_60) + local_20);
                        FVector local_80_2 = (Location - local_58_2);
                        FVector local_90 = (local_80_2 + OutTarget);
                        local_90.Z = OutTarget.Z;
                        OutTarget = FMath::Lerp(local_90, OutTarget, local_82);
                    }
                }
            }
            else
            {
                if (PathFollow.CurrentPath.Num() > 1)
                {
                    FVector local_20_2(PathFollow.CurrentPath[PathFollow.GetCurrentPathIdx()]);
                    FVector local_32_2(PathFollow.CurrentPath[(PathFollow.GetCurrentPathIdx() + 1)]);
                    FVector local_80_3 = (local_32_2 - local_20_2);
                    float local_72_2 = local_80_3.Size();
                    float local_42_2 = 0.0;
                    if (local_72_2 > local_42_2)
                    {
                        FVector local_26_2 = (local_80_3 / local_72_2);
                        local_42_2 = 9.99999993922529e-9;
                        float local_40_2 = CurrentForward.GetSafeNormal(local_42_2, FVector::ZeroVector).DotProduct(local_26_2);
                        local_42_2 = FMath::Clamp(local_40_2, 0.0, 1.0);
                        local_40_2 = float(this.TryClosePathAdvanceDistanceMax);
                        OutTarget = FMath::Lerp(local_20_2, local_32_2, FMath::Clamp((FMath::Lerp(float(this.TryClosePathAdvanceDistanceMin), local_40_2, local_42_2)) / local_72_2, 0.0, 1.0));
                    }
                }
            }
        }
        return local_11;
    }
    bool EnhanceInputIfShouldNeverStop(FC_AIPathFollow &inout PathFollow, const FC_Transform &inout Transform, FVector &inout InOutInput) const
    {
        if (int(PathFollow.StopType) != 0 && InOutInput.IsNearlyZero(9.999999747378752e-5))
        {
            if (int(PathFollow.StopType) == 1)
            {
                if (PathFollow.bMoveByPath)
                {
                    if (PathFollow.CurrentPath.Num() > 0)
                    {
                        InOutInput = (FVector(PathFollow.CurrentPath.Last(0)) - Transform.GetPosition()).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                        return true;
                    }
                }
                else
                {
                    FVector local_20_2 = (FVector(PathFollow.TargetLocation) - Transform.GetPosition());
                    InOutInput = local_20_2.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                    return true;
                }
            }
            else
            {
                if (int(PathFollow.StopType) == 2)
                {
                    InOutInput = Transform.GetRotation().GetForwardVector();
                    return true;
                }
            }
        }
        return false;
    }
    bool HandleJumpOrTeleport(const bool bForceJump, FVector &inout TargetPosition, const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_AIPathFollow &inout PathFollow) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    EAIMoveSimulateType TriggerTurnStand(FC_AIPathFollow &inout PathFollow, const FECSEntity &inout Entity, const bool bNeedTurn) const
    {
        FFPTime local_2 = FFPTime();
        FFPTime local_6 = FFPTime(ECS::GetContextTime());
        bool local_11 = bNeedTurn && ((local_6 - PathFollow.StandTurnStartTime).opCmp(1) >= 0);
        UCharacterGlobalSetting local_16 = ::UCharacterGlobalSetting::Get();
        if (local_16 != nullptr)
        {
            if (local_11)
            {
                if (this.bDoStandTurnWhenReached)
                {
                    FAIInputUtils::SimulateActionInput(Entity, local_16.TurnStandTrigger);
                }
                PathFollow.StandTurnStartTime = local_6;
            }
        }
        FFPTime local_18 = FFPTime();
        if (int(PathFollow.MoveSimulateType) == 1 && ((local_6 - PathFollow.StandTurnStartTime).opCmp(1) <= 0))
        {
            return EAIMoveSimulateType(0);
        }
        return EAIMoveSimulateType(PathFollow.MoveSimulateType);
    }
    bool HasGraoundMoveHasReaced(const FC_AIPathFollow &inout PathFollow, const FC_Transform &inout Transform) const
    {
        int local_22;
        bool local_21 = ((FVector(PathFollow.TargetLocation) - Transform.GetPosition()).SizeSquared2D() <= FMath::Square(PathFollow.AcceptableRadius)) || (int(PathFollow.bHasReach) != 0);
        if (PathFollow.TargetDirection.IsZero())
        {
            return local_21;
        }
        bool local_1 = (((FMath::Acos(PathFollow.TargetDirection.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector).DotProduct(Transform.GetRotation().GetForwardVector().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)))) * 57.29577791868205) < 45.0);
        if (!(local_21))
        {
            local_22 = 0;
        }
        else
        {
            local_22 = local_1;
        }
        return (local_22 != 0);
    }
    UFUNCTION()
    FVector GetClosestPointOnLineSegment(const FVector &inout Point, const FVector &inout LineStart, const FVector &inout LineEnd) const
    {
        FVector local_12 = (LineEnd - LineStart);
        FVector local_6 = (Point - LineStart);
        float local_22 = local_12.SizeSquared();
        float32 local_23 = float32(local_22);
        if (local_23 < 0.0001f)
        {
            return LineStart;
        }
        float local_22_2 = local_6.DotProduct(local_12);
        float local_22_3 = FMath::Clamp((float32(local_22_2) / local_23), 0.0f, 1.0f);
        return (LineStart + (local_12 * local_22_3));
    }
    void GetClosePathPoint(FC_AIPathFollow &inout PathFollow, const FC_Transform &inout Transform) const
    {
        TArray<FVector> local_4;
        if (PathFollow.CurrentPath.Num() < 2)
        {
            PathFollow.ApproachPathPrediction.Empty(0);
            return;
        }
        int local_8 = -1;
        float local_10 = 999999999.0;
        FVector local_18;
        int local_19 = 0;
        while (local_19 < 0)
        {
            FVector local_26(PathFollow.CurrentPath[local_19]);
            FVector local_44 = this.GetClosestPointOnLineSegment(Transform.GetPosition(), local_26, FVector(PathFollow.CurrentPath[local_19 + 1]));
            float local_12 = Transform.GetPosition().DistSquared(local_44);
            if (local_12 < local_10)
            {
                local_10 = local_12;
                local_18 = local_44;
                local_8 = local_19;
            }
            ++local_19;
        }
        if (local_8 == -1)
        {
            PathFollow.ApproachPathPrediction.Empty(0);
            return;
        }
        FVector local_44_2 = local_18;
        int local_19_2 = local_8;
        float32 local_48 = this.PathAnimationPredictionSamplesInterval * this.PathAnimationPredictionSamples;
        if ((!(PathFollow.CurrentPath.IsValidIndex(PathFollow.GetCurrentPathIdx() + 1))))
        {
            PathFollow.ApproachPathPrediction.Empty(0);
            return;
        }
        float local_46 = ((FVector(PathFollow.CurrentPath[local_19_2 + 1])) - local_44_2).Size();
        while ((local_48 > 0.0f && (local_19_2 < (PathFollow.CurrentPath.Num() - 1))))
        {
            if (local_46 >= this.PathAnimationPredictionSamplesInterval)
            {
                FVector local_26_2 = ((FVector(PathFollow.CurrentPath[(local_19_2 + 1)]) - PathFollow.CurrentPath[local_19_2]).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * this.PathAnimationPredictionSamplesInterval);
                FVector local_56_2 = (local_44_2 + local_26_2);
                local_4.Add(local_56_2);
                FVector local_44_3 = local_56_2;
                local_48 = local_48 - this.PathAnimationPredictionSamplesInterval;
                local_46 = local_46 - this.PathAnimationPredictionSamplesInterval;
            }
            else
            {
                FVector local_44_4 = PathFollow.CurrentPath[local_19_2 + 1];
                ++local_19_2;
                if (local_19_2 < (PathFollow.CurrentPath.Num() - 1))
                {
                    FVector local_26_3 = (FVector(PathFollow.CurrentPath[(local_19_2 + 1)]) - local_44_4);
                    local_46 = local_26_3.Size();
                }
            }
        }
        PathFollow.ApproachPathPrediction = local_4;
        if (this.bDebugDrawPathAnimationPredictionSamples)
        {
            for (auto& local_72 : local_4)
            {
                DebugDraw::DrawDebugPoint(this.GetWorld(), local_72, 15.0f, FColor::Blue, false, -1.0f, uint8(0));
            }
        }
        return;
    }
    void UpdateGroundPathFollowToAIInput(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_AIPathFollow &inout PathFollow) const
    {
        FVector local_6 = Transform.GetPosition();
        bool local_7 = false;
        FVector local_14;
        FVector local_20(FVector::ZeroVector);
        if (!(this.HasGraoundMoveHasReaced(PathFollow, Transform)) && !(PathFollow.bHasReach))
        {
            bool local_29 = this.FindNextFollowPosition(PathFollow, local_6, true, local_14, true, Transform.GetRotation().GetForwardVector());
            if (local_29 && PathFollow.CurrentPath.IsValidIndex(PathFollow.GetCurrentPathIdx()))
            {
                FVector local_38(PathFollow.CurrentPath[PathFollow.GetCurrentPathIdx()]);
                if (!(this.HandleJumpOrTeleport(false, local_38, Entity, Transform, PathFollow)))
                {
                    Get local_42;
                    const FC_CharacterMovementParam& local_44 = local_42.opCall();
                    if (local_44)
                    {
                        this.UpdateCycleTurn(PathFollow, local_44, local_6, Transform.GetRotation().GetForwardVector(), local_38, local_7);
                    }
                }
                local_20 = this.GetGroundMoveInput(Transform, PathFollow, local_38);
            }
            else
            {
            }
        }
        else
        {
        }
        if (PathFollow.EstimatedReachedRemained > 0.0f)
        {
            this.GetClosePathPoint(PathFollow, Transform);
        }
        this.EnhanceInputIfShouldNeverStop(PathFollow, Transform, local_20);
        FAIInputUtils::SimulateMoveInputWorld(Entity, local_20, this.TriggerTurnStand(PathFollow, Entity, local_7), true);
        if (CVar_AI_DebugAIPathPoint.GetBool())
        {
            DebugDraw::DrawDebugDirectionalArrow(this.GetWorld(), Transform.GetPosition(), (FVector(Transform.GetPosition()) + (local_20.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * 500.0)), 20.0f, FColor::Green, false, -1.0f, uint8(0), 0.0f);
        }
        return;
    }
    void UpdateGroundNoPathFollowToAIInput(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_AIPathFollow &inout PathFollow) const
    {
        if (PathFollow.bMoveByPath)
        {
            return;
        }
        FVector local_8 = Transform.GetPosition();
        FVector local_16;
        FVector local_22;
        FVector local_28(FVector::ZeroVector);
        if (((FVector(PathFollow.TargetLocation) - local_8).SizeSquared2D()) > FMath::Square(PathFollow.AcceptableRadius) && !(PathFollow.bHasReach))
        {
            FVector local_54(PathFollow.TargetLocation);
            local_22 = local_54;
            if (!(this.HandleJumpOrTeleport(false, local_54, Entity, Transform, PathFollow)))
            {
            }
            float local_46 = (local_54 - local_8).Size2D();
            if (local_46 > 1.0)
            {
                if (PathFollow.InputOverride.Size() > 0.0)
                {
                    local_28 = PathFollow.InputOverride;
                }
                else
                {
                    local_28 = (((local_54 - local_8).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector)) * (FMath::Lerp(0.75, 1.0, FMath::Clamp(local_46 / 100.0, 0.0, 1.0))));
                }
            }
            else
            {
                if (int(PathFollow.StopType) == 1)
                {
                    local_28 = (local_54 - local_8).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                }
                else
                {
                    local_28 = Transform.GetRotation().GetForwardVector();
                }
            }
        }
        else
        {
            if (int(PathFollow.StopType) == 1 && (PathFollow.InputOverride.Size() > 0.0))
            {
                local_28 = PathFollow.InputOverride;
            }
        }
        this.EnhanceInputIfShouldNeverStop(PathFollow, Transform, local_28);
        FAIInputUtils::SimulateMoveInputWorld(Entity, local_28, this.TriggerTurnStand(PathFollow, Entity, (false != 0)), true);
        if (CVar_AI_DebugAIPathPoint.GetBool())
        {
            DebugDraw::DrawDebugDirectionalArrow(this.GetWorld(), Transform.GetPosition(), (FVector(Transform.GetPosition()) + (local_28.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * 500.0)), 20.0f, FColor::Green, false, -1.0f, uint8(0), 0.0f);
        }
        if (CVar_AI_DebugAIPathPointEntityID.GetInt() == Entity.GetIdValue())
        {
            DebugDraw::DrawDebugSphere(this.GetWorld(), Transform.GetPosition(), 100.0f, 20, FColor::Green, false, -1.0f, uint8(0), 0.0f);
            DebugDraw::DrawDebugSphere(this.GetWorld(), local_22, 100.0f, 20, FColor::Red, false, -1.0f, uint8(0), 0.0f);
            FVector local_40_2 = (local_28.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * 500.0);
            DebugDraw::DrawDebugDirectionalArrow(this.GetWorld(), Transform.GetPosition(), (FVector(Transform.GetPosition()) + local_40_2), 20.0f, FColor::Green, false, -1.0f, uint8(0), 0.0f);
        }
        return;
    }
    bool HasMountEntity(const FECSEntity &inout Entity) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            Get local_10;
            return local_10.opCall().GetMountEntity().IsValid();
        }
        return false;
    }
    FECSEntityId GetMountEntityID(const FECSEntity &inout Entity) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            Get local_10;
            return local_10.opCall().GetMountEntity().GetId();
        }
        return ENTITY_ID_NULL;
    }
    int FindGroundStartPathIndex(const FVector &inout CurrentPosition, const TArray<FVector> &inout Path) const
    {
        if (Path.Num() == 0)
        {
            return -1;
        }
        if (Path.Num() == 1)
        {
            return 0;
        }
        float local_6 = 3.4028234663852886e38;
        int local_9 = 0;
        int local_10 = 0;
        for (; local_10 < (Path.Num() - 1); ++local_10)
        {
            FVector local_18(Path[local_10]);
            float local_8 = CurrentPosition.DistSquared(this.GetClosestPointOnLineSegment(CurrentPosition, local_18, FVector(Path[local_10 + 1])));
            if (local_6 > local_8)
            {
                local_6 = local_8;
                local_9 = local_10;
            }
        }
        return local_9;
    }
    UFUNCTION()
    void Job_UpdateCurrentPathIdx(const FECSEntity &inout Entity, FC_AIPathFollow &inout PathFollow, const FC_Transform &inout Transform) const
    {
        int local_12;
        if (PathFollow.GetCurrentPathIdx() < 0)
        {
            Has local_8;
            bool local_3 = local_8.opCall();
            if (local_3)
            {
                local_12 = this.FindGroundStartPathIndex(Transform.GetPosition(), PathFollow.CurrentPath);
            }
            else
            {
                local_12 = FAINavigationUtils::FindNextPathIndex(Transform.GetPosition(), PathFollow.CurrentPath, int(PathFollow.PathPointTolerance), 0, -1);
            }
            PathFollow.SetCurrentPathIdx(local_12);
            PathFollow.StartLocation = Transform.GetPosition();
            FC_AIPathFollowAddContext local_18;
            local_18.NextIdxRatio = 0.0;
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateGroundPathFollow(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_AIPathFollow &inout PathFollow) const
    {
        int local_26 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            return;
        }
        FECSEntity local_10 = Entity;
        if (this.HasMountEntity(Entity) && !((this.GetMountEntityID(Entity) == ENTITY_ID_NULL)))
        {
            local_10 = FECSEntity(this.GetMountEntityID(Entity));
            local_5 = (int(PathFollow.MoveSimulateType) == 1);
            if (!(local_26.GetbSprintOn()) != !(local_5))
            {
                local_26.SetbSprintOn(local_5);
            }
        }
        if (PathFollow.bMoveByPath)
        {
            Get local_30;
            this.UpdateGroundPathFollowToAIInput(FixedTime, local_10, local_30.opCall(), PathFollow);
        }
        else
        {
            Get local_30;
            this.UpdateGroundNoPathFollowToAIInput(FixedTime, local_10, local_30.opCall(), PathFollow);
        }
        if (CVar_AI_DebugAIPathPoint.GetBool())
        {
            ECharacterMoveStance local_31 = FAIInputUtils::GetMoveStance(Entity);
            FColor local_34;
            if ((int(local_31)) == 0)
            {
                local_34 = FColor::White;
            }
            else
            {
                if (int(local_31) == 2)
                {
                }
                else
                {
                }
            }
            DebugDraw::DrawDebugSphere(this.GetWorld(), (FVector(Transform.GetPosition()) + FVector(0.0, 0.0, 300.0)), 20.0f, 8, local_34, false, -1.0f, uint8(0), 0.0f);
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateAirPathFollow(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_Transform &inout Transform, FC_AIPathFollow &inout PathFollow) const
    {
        FVector local_6 = Transform.GetPosition();
        FVector local_12(FVector::ZeroVector);
        FVector local_58;
        if (PathFollow.bMoveByPath)
        {
            bool local_21;
            local_21 = this.FindNextFollowPosition(PathFollow, local_6, false, FVector(), false, FVector::ZeroVector) && PathFollow.CurrentPath.IsValidIndex(PathFollow.GetCurrentPathIdx());
            if (local_21)
            {
                local_12 = (FVector(PathFollow.CurrentPath[PathFollow.GetCurrentPathIdx()]) - local_6).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            }
            else
            {
            }
        }
        else
        {
            bool local_21;
            FVector local_36_2 = (FVector(PathFollow.TargetLocation) - local_6);
            if (local_36_2.SizeSquared() <= FMath::Square(PathFollow.AcceptableRadius))
            {
                local_21 = true;
            }
            else
            {
                local_21 = PathFollow.bHasReach;
            }
            if (!(local_21))
            {
                float local_42 = local_36_2.Size();
                if (local_42 > 1.0)
                {
                    if (PathFollow.InputOverride.Size() > 0.0)
                    {
                        local_12 = PathFollow.InputOverride;
                    }
                    else
                    {
                        local_12 = (local_36_2.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * (FMath::Lerp(0.75, 1.0, FMath::Clamp(local_42 / 100.0, 0.0, 1.0))));
                    }
                }
                else
                {
                    if (int(PathFollow.StopType) == 1)
                    {
                        local_58 = local_36_2.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                    }
                    else
                    {
                        local_58 = Transform.GetRotation().GetForwardVector();
                    }
                    local_12 = local_58;
                }
            }
            else
            {
                if (int(PathFollow.StopType) == 1 && (PathFollow.InputOverride.Size() > 0.0))
                {
                    local_12 = PathFollow.InputOverride;
                }
            }
        }
        this.EnhanceInputIfShouldNeverStop(PathFollow, Transform, local_12);
        if (PathFollow.bMoveByPath)
        {
            if (local_12.SizeSquared() > 9.999999747378752e-5)
            {
                FVector local_30 = (FVector(Transform.GetPosition()) + local_12);
                FAIInputUtils::SimulateViewInput(Entity, FAIInputUtils::GetAimInput(Transform.GetPosition(), local_30, Transform.GetRotation().GetUpVector()));
                FAIInputUtils::SimulateMoveInputLocal(Entity, FVector::ForwardVector, EAIMoveSimulateType(PathFollow.MoveSimulateType), false);
            }
            else
            {
                FAIInputUtils::SimulateMoveInputLocal(Entity, FVector::ZeroVector, EAIMoveSimulateType(PathFollow.MoveSimulateType), false);
            }
            return;
        }
        FAIInputUtils::SimulateMoveInputWorld(Entity, local_12, EAIMoveSimulateType(PathFollow.MoveSimulateType), false);
        return;
    }
    UFUNCTION()
    void Job_DebugDrawFollowPath(const FC_AIPathFollow &inout PathFollow) const
    {
        int local_3 = 0;
        int local_1 = 0;
        while (local_1 < local_3)
        {
            if (local_1 == PathFollow.GetCurrentPathIdx())
            {
                DebugDraw::DrawDebugSphere(this.GetWorld(), PathFollow.CurrentPath[local_1], 100.0f, 12, FColor::Red, false, -1.0f, uint8(0), 1.0f);
            }
            FColor local_11 = FColor(FColor::Green);
            local_3 = PathFollow.CurrentPath.Num();
            local_3 = local_3 - 1;
            if (local_1 == local_3)
            {
                local_11 = FColor::Yellow;
            }
            DebugDraw::DrawDebugPoint(this.GetWorld(), PathFollow.CurrentPath[local_1], 10.0f, local_11, false, -1.0f, uint8(0));
            ++local_1;
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateMoveViewInput(const FECSEntity &inout Entity, const FC_AIPathFollow &inout PathFollow, const FC_AICommandPathFollow &inout CommandPathFollow) const
    {
        Get local_42;
        if ((!((FECSEntityId(PathFollow.ViewEntityID) == ENTITY_ID_NULL))))
        {
            FECSEntity local_6 = FECSEntity(PathFollow.ViewEntityID);
            if (local_6.IsValid())
            {
                if ((!((Entity == local_6))))
                {
                    FVector local_16;
                    Get local_20;
                    const FC_TransformHistory& local_22 = local_20.opCall();
                    if (local_22)
                    {
                        float32 local_23 = FECSAIUtils::GetSystemLatencyInternal();
                        FECSWorldPtr local_26 = Entity.GetWorld();
                        Get local_30;
                        local_16 = FECSAIPredictionUtils::PredictLocation(local_22, local_30.opCall().Time, local_23, 0.0f, 0.0f);
                    }
                    else
                    {
                        local_16 = local_42.opCall().GetPosition();
                    }
                    FAIInputUtils::SimulateViewInput(Entity, FAIInputUtils::GetAimInput(local_42.opCall().GetPosition(), local_16, FVector::UpVector));
                    return;
                }
            }
        }
        FAIInputUtils::SimulateViewInput(Entity, local_42.opCall().GetRotation().Rotator());
        return;
    }
    UFUNCTION()
    void Job_TickCommandPathFollowState(const FECSEntity &inout Entity, FC_AIPathFollow &inout PathFollow, FC_AICommandPathFollow &inout CommandPathFollow) const
    {
        if (CommandPathFollow.GetbIsFinalMovement() && (PathFollow.EstimatedReachedRemained <= FECSAIUtils::GetSystemLatencyInternal()))
        {
            PathFollow.bHasReach = true;
        }
        if (PathFollow.bHasReach)
        {
            bool local_8;
            if (int(PathFollow.StopType) == 0)
            {
                CommandPathFollow.SetbIsMoveFinish(true);
                return;
            }
            local_8 = false;
            if (!(PathFollow.CanStopGameplayTagContainer.IsEmpty()))
            {
                local_8 = FAICommonUtils::QueryTagContainerCondition(Entity, PathFollow.CanStopGameplayTagContainer, EESMBlackboardConditionTagQueryType(PathFollow.CanStopTagQueryType));
            }
            CommandPathFollow.SetbIsMoveFinish(local_8);
        }
        return;
    }
    UFUNCTION()
    void Job_RevisePath(const FCS_FixedTime &inout Time, FC_AIPathFindingResultDispatcher &inout PathDispatcher, const FC_AICommand &inout Command) const
    {
        int local_3 = 0;
        if (PathDispatcher.ShouldDispatch(Time.Time) && (PathDispatcher.FullPath.Num() > 0))
        {
            if (CVar_AI_DebugAIPathPoint.GetBool())
            {
                int local_5 = 0;
                while (local_5 < local_3)
                {
                    FVector local_12(PathDispatcher.FullPath[local_5]);
                    FVector local_18(PathDispatcher.FullPath[local_5 + 1]);
                    DebugDraw::DrawDebugLine(this.GetWorld(), local_12, local_18, FColor::Orange, false, -1.0f, uint8(0), 0.0f);
                    ++local_5;
                    local_3 = PathDispatcher.FullPath.Num();
                    local_3 = local_3 - 1;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TickAIPathFollow(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_AIPathFollow &inout PathFollow, FC_AICommandPathFollow &inout CommandPathFollow) const
    {
        this.Job_UpdateCurrentPathIdx(Entity, PathFollow, Transform);
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            this.Job_UpdateGroundPathFollow(FixedTime, Entity, Transform, PathFollow);
        }
        Has local_10;
        bool local_5_2 = local_10.opCall();
        if (local_5_2)
        {
            this.Job_UpdateAirPathFollow(Entity, FixedTime, Transform, PathFollow);
        }
        else
        {
            this.Job_UpdateMoveViewInput(Entity, PathFollow, CommandPathFollow);
        }
        this.Job_TickCommandPathFollowState(Entity, PathFollow, CommandPathFollow);
        return;
    }
    FVector FindClosestPointOnSegment(const FVector &inout SegP0, const FVector &inout SegP1, const FVector &inout Point) const
    {
        FVector local_12 = (SegP1 - SegP0);
        if (local_12.SizeSquared() == 0.0)
        {
            return SegP0;
        }
        FVector local_6 = (Point - SegP0);
        return (SegP0 + local_12.opMul_r((FMath::Clamp((local_6.DotProduct(local_12) / local_12.SizeSquared()), 0.0, 1.0))));
    }
    UFUNCTION()
    void Job_ApplyAIPathFollowTeleport(const FC_AIPathFollowRequestTeleport &inout Teleport, const FECSEntity &inout Entity) const
    {
        if (Teleport.bUseRotation)
        {
            Entity.TeleportTo(Teleport.Location, Teleport.Rotation, FFPTime(-1));
        }
        else
        {
            Entity.TeleportTo(Teleport.Location, FFPTime(-1));
        }
        Remove local_10;
        local_10.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_OnAIPathFollowRemove(const FECSEntity &inout Entity, const FC_AIPathFollow &inout PathFollow) const
    {
        int local_34 = 0;
        if (Entity.IsValid() && this.HasMountEntity(Entity) && !((this.GetMountEntityID(Entity) == ENTITY_ID_NULL)))
        {
            FECSEntity local_12 = FECSEntity(this.GetMountEntityID(Entity));
            FAIInputUtils::SimulateMoveInputLocal(local_12, FVector::ZeroVector, EAIMoveSimulateType(0), true);
            Get local_22;
            Has local_18;
            if (local_18.opCall() && local_22.opCall().GetbSprintOn())
            {
                FECSWorldPtr local_28 = Entity.GetWorld();
                local_34.TargetEntity = local_12;
            }
            return;
        }
        return;
    }
    ECharacterMoveStance GetMoveStanceResult(const FECSEntity &inout Entity) const
    {
        return FAIInputUtils::GetMoveStance(Entity);
    }
    UFUNCTION()
    void Job_HandleAIMoveStanceChangeRequestEvent(const FCE_AIMoveStanceChangeRequest &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Entity);
        FECSWorldPtr local_6 = local_4.GetWorld();
        Get local_10;
        FAIInputUtils::ChangeMoveStance(Event.NewStance, local_4, local_10.opCall().Time, Event.MoveStanceLayer);
        if (this.HasMountEntity(local_4))
        {
            FECSEntity local_24 = FECSEntity(this.GetMountEntityID(local_4));
            if (Event.bClear)
            {
                FECSWorldPtr local_6_2 = local_4.GetWorld();
                FAIInputUtils::ChangeMoveStance(ECharacterMoveStance(0), local_24, local_10.opCall().Time, Event.MoveStanceLayer);
            }
            else
            {
                FECSWorldPtr local_6_3 = local_4.GetWorld();
                FAIInputUtils::ChangeMoveStance(this.GetMoveStanceResult(local_4), local_24, local_10.opCall().Time, Event.MoveStanceLayer);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleAIMoveStanceClearRequestEvent(const FCE_AIMoveStanceClearRequest &inout Event) const
    {
        Get local_16;
        FECSEntity local_4 = FECSEntity(Event.Entity);
        if (!(FECSEntity::Has<FC_AIPathFollow>(local_4).opCall()))
        {
            if (Event.bClear)
            {
                FECSWorldPtr local_12 = local_4.GetWorld();
                FAIInputUtils::ChangeMoveStance(ECharacterMoveStance(0), local_4, local_16.opCall().Time, Event.MoveStanceLayer);
            }
            if (this.HasMountEntity(local_4))
            {
                FECSEntity local_28 = FECSEntity(this.GetMountEntityID(local_4));
                if (Event.bClear)
                {
                    FECSWorldPtr local_12_2 = local_4.GetWorld();
                    FAIInputUtils::ChangeMoveStance(ECharacterMoveStance(0), local_28, local_16.opCall().Time, Event.MoveStanceLayer);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleAIStopMoveAndSprintEvent(const FCE_AIStopMoveAndSprint &inout Event) const
    {
        if (!(FECSEntity(Event.TargetEntity).IsValid()))
        {
            return;
        }
        Has local_10;
        Get local_14;
        if (local_10.opCall() && local_14.opCall().GetbSprintOn())
        {
            Modify local_20;
            local_20.opCall().SetbSprintOn(false);
        }
        return;
    }
    UFUNCTION()
    void Job_HandleAIChangeMountMoveStanceEvent(const FCE_AIChangeMountMoveStance &inout Event) const
    {
        FECSEntity local_4 = Event.TargetEntity;
        if (!(local_4.IsValid()))
        {
            return;
        }
        FECSWorldPtr local_8 = local_4.GetWorld();
        Get local_12;
        FAIInputUtils::ChangeMoveStance(Event.NewStance, local_4, local_12.opCall().Time, Event.MoveStanceLayer);
        return;
    }
    UFUNCTION()
    void Monitor_OnMountIsRiddenByAssign(const FECSEntity &inout Entity, const FC_MountIsDrivenBy &inout RiddenBy) const
    {
        if (RiddenBy.IsDriverActive())
        {
            const FECSEntity& local_4 = RiddenBy.GetDriverEntity();
            if (!(FECSEntity::Has<FC_AIPathFollow>(local_4).opCall()))
            {
                return;
            }
            ECharacterMoveStance local_9 = this.GetMoveStanceResult(local_4);
            ECharacterMoveStance local_10 = this.GetMoveStanceResult(Entity);
            if ((int(local_9)) != (int(local_10)))
            {
                FCE_AIChangeMountMoveStance local_26;
                FECSWorldPtr local_20 = Entity.GetWorld();
                local_26.TargetEntity = Entity;
                local_26.NewStance = ECharacterMoveStance(local_9);
                local_26.MoveStanceLayer = ECharacterMoveStanceLayer(1);
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnMountIsRiddenByRemove(const FECSEntity &inout Entity, const FC_MountIsDrivenBy &inout RiddenBy) const
    {
        int local_24 = 0;
        if (!(Entity.IsValid()))
        {
            return;
        }
        FAIInputUtils::SimulateMoveInputLocal(Entity, FVector::ZeroVector, EAIMoveSimulateType(0), true);
        Has local_6;
        Get local_10;
        if (local_6.opCall() && local_10.opCall().GetbSprintOn())
        {
            FECSWorldPtr local_18 = Entity.GetWorld();
            local_24.TargetEntity = Entity;
        }
        return;
    }
    UFUNCTION()
    void Job_DebugDrawEntityFollowPath() const
    {
        bool local_10;
        int local_18 = 0;
        int local_24 = 0;
        if (!(FECSEntity(CVar_AI_DebugEntityAIPathPoint.GetInt()).IsValid()))
        {
            local_10 = true;
        }
        else
        {
            Has local_14;
            local_10 = local_14.opCall();
        }
        if (local_10)
        {
            return;
        }
        if (!(local_18))
        {
            return;
        }
        int local_23 = 0;
        while (local_23 < local_24)
        {
            if (local_23 == local_18.GetCurrentPathIdx())
            {
                DebugDraw::DrawDebugSphere(this.GetWorld(), local_18.CurrentPath[local_23], 100.0f, 12, FColor::Red, false, -1.0f, uint8(0), 1.0f);
            }
            FColor local_31 = FColor(FColor::Green);
            local_24 = local_18.CurrentPath.Num();
            local_24 = local_24 - 1;
            if (local_23 == local_24)
            {
                local_31 = FColor::Yellow;
            }
            DebugDraw::DrawDebugPoint(this.GetWorld(), local_18.CurrentPath[local_23], 10.0f, local_31, false, -1.0f, uint8(0));
            if (local_23 > 0)
            {
                DebugDraw::DrawDebugLine(this.GetWorld(), local_18.CurrentPath[local_23 - 1], local_18.CurrentPath[local_23], local_31, false, -1.0f, uint8(0), 0.0f);
            }
            ++local_23;
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateCurrentPathIdx() const
    {
        int local_136 = 0;
        int local_138 = 0;
        int local_144 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_AIPathFollowScriptSystem::Job_UpdateCurrentPathIdx"));
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Include local_56;
        local_56.opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_94 = local_48.Iterator();
        for (; local_94.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_133 = FECSEntityScopeCycleCounter(local_94.Proceed());
            this.Job_UpdateCurrentPathIdx(local_136, local_138, local_144);
            MarkModifiedIfDirty local_152;
            local_152.opCall(local_138);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateGroundPathFollow() const
    {
        int local_10 = 0;
        int local_148 = 0;
        int local_150 = 0;
        int local_156 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_AIPathFollowScriptSystem::Job_UpdateGroundPathFollow"));
        const FCS_FixedTime& local_6 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        int local_12 = 0;
        int local_11 = local_12;
        FECSRuntimeView local_52 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        FECSRuntimeView::Include<FC_Transform>(local_52).opCall();
        Include local_60;
        local_60.opCall();
        Include local_64;
        local_64.opCall();
        Include local_68;
        local_68.opCall();
        Exclude(local_52).opCall();
        FECSRuntimeViewIterator local_106 = local_52.Iterator();
        for (; local_106.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_145 = FECSEntityScopeCycleCounter(local_106.Proceed());
            this.Job_UpdateGroundPathFollow(local_10, local_148, local_150, local_156);
            MarkModifiedIfDirty local_164;
            local_164.opCall(local_156);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateAirPathFollow() const
    {
        int local_10 = 0;
        int local_148 = 0;
        int local_150 = 0;
        int local_156 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_AIPathFollowScriptSystem::Job_UpdateAirPathFollow"));
        const FCS_FixedTime& local_6 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        int local_12 = 0;
        int local_11 = local_12;
        FECSRuntimeView local_52 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        FECSRuntimeView::Include<FC_Transform>(local_52).opCall();
        Include local_60;
        local_60.opCall();
        Include local_64;
        local_64.opCall();
        Include local_68;
        local_68.opCall();
        Exclude(local_52).opCall();
        FECSRuntimeViewIterator local_106 = local_52.Iterator();
        for (; local_106.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_145 = FECSEntityScopeCycleCounter(local_106.Proceed());
            this.Job_UpdateAirPathFollow(local_148, local_10, local_150, local_156);
            MarkModifiedIfDirty local_164;
            local_164.opCall(local_156);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DebugDrawFollowPath() const
    {
        int local_36 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(CVar_AI_DebugAIPathPoint.GetBool()) == !(false))
        {
            return;
        }
        int local_6 = 0;
        int local_5 = local_6;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_DebugDrawFollowPath(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Exclude(local_78).opCall();
        bool local_3 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_78.Iterator();
        for (; local_122.CanProceed;)
        {
            const FECSEntity& local_158 = local_122.Proceed();
            ++local_88;
            if (local_3)
            {
                local_2.AddViewCacheEntity(local_158.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_158);
            this.Job_DebugDrawFollowPath(local_36);
        }
        local_2.UpdateCachedEntityCount(local_88);
        if (local_3)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateMoveViewInput() const
    {
        int local_140 = 0;
        int local_142 = 0;
        int local_148 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_AIPathFollowScriptSystem::Job_UpdateMoveViewInput"));
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Include local_56;
        local_56.opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_98 = local_48.Iterator();
        for (; local_98.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_137 = FECSEntityScopeCycleCounter(local_98.Proceed());
            this.Job_UpdateMoveViewInput(local_140, local_142, local_148);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCommandPathFollowState() const
    {
        int local_136 = 0;
        int local_138 = 0;
        int local_144 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_AIPathFollowScriptSystem::Job_TickCommandPathFollowState"));
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Include local_56;
        local_56.opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_94 = local_48.Iterator();
        for (; local_94.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_133 = FECSEntityScopeCycleCounter(local_94.Proceed());
            this.Job_TickCommandPathFollowState(local_136, local_138, local_144);
            MarkModifiedIfDirty local_152;
            local_152.opCall(local_138);
            MarkModifiedIfDirty local_156;
            local_156.opCall(local_144);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RevisePath() const
    {
        int local_6 = 0;
        int local_40 = 0;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_RevisePath(local_6, local_40, local_46);
                local_54.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_92).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_92.Iterator();
        for (; local_140.CanProceed;)
        {
            const FECSEntity& local_176 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_176.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_176);
            this.Job_RevisePath(local_6, local_40, local_46);
            local_54.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickAIPathFollow() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        MarkModifiedIfDirty local_66;
        int local_198 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_TickAIPathFollow(local_6, local_40, local_42, local_48, local_54);
                local_62.opCall(local_48);
                local_66.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_104 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Include local_120;
        local_120.opCall();
        Exclude(local_104).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_126 = 0;
        FECSRuntimeViewIterator local_160 = local_104.Iterator();
        for (; local_160.CanProceed;)
        {
            local_40 = local_160.Proceed();
            ++local_126;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickAIPathFollow(local_6, local_198, local_42, local_48, local_54);
            local_62.opCall(local_48);
            local_66.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_126);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ApplyAIPathFollowTeleport() const
    {
        int local_36 = 0;
        const FECSEntity& local_42;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ApplyAIPathFollowTeleport(local_36, local_42);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_42 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_42);
            this.Job_ApplyAIPathFollowTeleport(local_36, local_166);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnAIPathFollowRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorAIPathFollowOnRemoveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnAIPathFollowRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleAIMoveStanceChangeRequestEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AIMoveStanceChangeRequest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AIMoveStanceChangeRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleAIMoveStanceChangeRequestEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleAIMoveStanceClearRequestEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AIMoveStanceClearRequest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AIMoveStanceClearRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleAIMoveStanceClearRequestEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleAIStopMoveAndSprintEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AIStopMoveAndSprint> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AIStopMoveAndSprint& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleAIStopMoveAndSprintEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleAIChangeMountMoveStanceEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AIChangeMountMoveStance> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AIChangeMountMoveStance& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleAIChangeMountMoveStanceEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnMountIsRiddenByAssign() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorMountIsDrivenByOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnMountIsRiddenByAssign(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnMountIsRiddenByRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorMountIsDrivenByOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnMountIsRiddenByRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DebugDrawEntityFollowPath() const
    {
        ECS::GetContextJob();
        if ((CVar_AI_DebugEntityAIPathPoint.GetInt() != 0) == false)
        {
            return;
        }
        this.Job_DebugDrawEntityFollowPath();
        return;
    }
}

