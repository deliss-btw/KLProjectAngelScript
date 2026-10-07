
const FConsoleVariable CVar_AI_DebugAIPathPointSimulate = FConsoleVariable();
const FConsoleVariable CVar_AI_DebugAIPathPointModeSimulate = FConsoleVariable();
const FConsoleVariable CVar_AI_UseMovementControlAirCheck = FConsoleVariable();
const FConsoleVariable CVar_AI_ObstacleDetourCheckInterval = FConsoleVariable();
const FConsoleVariable CVar_AI_ObstacleDetourMaxCheckDistance = FConsoleVariable();
const FConsoleVariable CVar_AI_DebugObstacleDetour = FConsoleVariable();
const FConsoleVariable CVar_AI_RVOPathSimulateCorridorEnable = FConsoleVariable();
const FConsoleVariable CVar_AI_RVOPathSimulateCorridorDebug = FConsoleVariable();
const FConsoleVariable CVar_AI_RVOPathSimulateCorridorDrawPath = FConsoleVariable();
const FConsoleVariable CVar_AI_DebugRigidbodyFacing = FConsoleVariable();
const FConsoleVariable CVar_AI_LeapOffIntervalRatio = FConsoleVariable();
const FConsoleVariable CVar_AI_SimulateStuck = FConsoleVariable();
const FName DebugDrawKey_AIPathSimulate = n"AIPathSimulate";
const float32 AI_RVOPathSimulateCorridorMinAvoidDistance = 180f;
const float32 AI_RVOPathSimulateCorridorMaxAvoidDistance = 500f;
const float32 AI_RVOPathSimulateCorridorMinSideOffset = 90f;
const float32 AI_RVOPathSimulateCorridorMaxSideOffset = 300f;
const float32 AI_RVOPathSimulateCorridorRecreateCooldown = 0.6f;
const float32 AI_RVOPathSimulateCorridorTTL = 1.5f;
const float32 AI_RVOPathSimulateCorridorMaxAvoidanceSignalAge = 0.15f;

class US_AIPathSimulateSystem : UECSScriptSystem
{
    UPROPERTY()
    int PathAnimationPredictionSamples = 8;
    UPROPERTY()
    float32 PathAnimationPredictionSamplesInterval = 200.0f;
    UPROPERTY()
    float32 PathAnimationPredictionNextDeltaTime = 0.1f;


    void EnableAIPathSimulateDebugDraw() const
    {
        FECSDebugDraw::SetDebugKeyEnable(DebugDrawKey_AIPathSimulate, true);
        FECSDebugDraw::SetDebugKeyUnfiltered(DebugDrawKey_AIPathSimulate, true);
        return;
    }
    UFUNCTION()
    void Job_SimulateMoveDataSync(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, FC_Transform &inout Transform, FC_AIPathSimulate &inout C_Simulate) const
    {
        int local_12 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            if (C_Simulate.GetSyncedSimulateSourceIndex() > local_12.GetSimulateList().Num())
            {
                C_Simulate.SetSyncedSimulateSourceIndex(local_12.GetSimulateList().Num());
            }
            if (C_Simulate.GetSyncedSimulateSourceIndex() < local_12.GetSimulateList().Num())
            {
                int local_15;
                local_15 = C_Simulate.GetSyncedSimulateSourceIndex();
                for (; local_15 < local_12.GetSimulateList().Num(); )
                {
                    C_Simulate.GetSimulateList().Add(local_12.GetSimulateList()[local_15]);
                    ++local_15;
                }
                C_Simulate.SetSyncedSimulateSourceIndex(local_12.GetSimulateList().Num());
            }
        }
        return;
    }
    UFUNCTION()
    void Job_SimulateMove(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, FC_Transform &inout Transform, FC_AIPathSimulate &inout C_Simulate) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    bool IsRVOLocalCorridorMoveType(const EAISimulateMoveType MoveType) const
    {
        return (int(MoveType) == 1);
    }
    FVector GetCurrentSegmentStartForRVO(const FC_Transform &inout Transform, const FC_AIPathSimulate &inout C_Simulate) const
    {
        if (C_Simulate.GetCurrentSimulateIndex() > 0 && C_Simulate.GetSimulateList().IsValidIndex((C_Simulate.GetCurrentSimulateIndex() - 1)))
        {
            return C_Simulate.GetSimulateList()[(C_Simulate.GetCurrentSimulateIndex() - 1)].GetTargetPoint();
        }
        return Transform.GetPosition();
    }
    FVector ProjectPointAheadOnSegment2D(const FVector &inout Position, const FVector &inout SegStart, const FVector &inout SegEnd, const float32 AheadDistance) const
    {
        FVector local_6 = Position;
        FVector local_12 = SegStart;
        FVector local_18 = SegEnd;
        local_6.Z = 0.0;
        local_12.Z = 0.0;
        local_18.Z = 0.0;
        FVector local_32 = (local_18 - local_12);
        float32 local_34 = float32(local_32.Size2D());
        if (local_34 < 1.0f)
        {
            return SegEnd;
        }
        FVector local_26 = (local_32 / local_34);
        FVector local_58 = (SegStart + (local_26 * (FMath::Clamp(float32(((local_6 - local_12).DotProduct(local_26))) + AheadDistance, 0.0f, local_34))));
        local_58.Z = SegEnd.Z;
        return local_58;
    }
    float32 GetDistanceToSegment2D(const FVector &inout Position, const FVector &inout SegStart, const FVector &inout SegEnd) const
    {
        FVector local_6 = Position;
        FVector local_12 = SegStart;
        FVector local_18 = SegEnd;
        local_6.Z = 0.0;
        local_12.Z = 0.0;
        local_18.Z = 0.0;
        FVector local_32 = (local_18 - local_12);
        float local_20_4 = local_32.SizeSquared();
        float32 local_34 = float32(local_20_4);
        if (local_34 < 0.0001f)
        {
            float local_20_5 = (local_6 - local_18).Size();
            return float32(local_20_5);
        }
        float local_20_6 = (local_6 - local_12).DotProduct(local_32);
        float local_20_7 = FMath::Clamp((float32(local_20_6) / local_34), 0.0f, 1.0f);
        float local_20_8 = (local_6 - (local_12 + (local_32 * local_20_7))).Size();
        return float32(local_20_8);
    }
    bool IsRVOLocalCorridorDebugTarget(const FECSEntity &inout Entity) const
    {
        int local_2 = CVar_AI_RVOPathSimulateCorridorDebug.GetInt();
        return local_2 == 1 || (local_2 == Entity.GetIdValue());
    }
    bool IsRVOLocalCorridorPathDrawTarget(const FECSEntity &inout Entity) const
    {
        int local_2 = CVar_AI_RVOPathSimulateCorridorDrawPath.GetInt();
        return local_2 == 1 || (local_2 == Entity.GetIdValue());
    }
    void ClearRVOLocalCorridor(const FECSEntity &inout Entity) const
    {
        this.ClearRVOLocalCorridorWithReason(Entity, "clear");
        return;
    }
    void ClearRVOLocalCorridorWithReason(const FECSEntity &inout Entity, const FString &inout Reason) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            if (this.IsRVOLocalCorridorDebugTarget(Entity))
            {
                FC_AIRVOLocalCorridor local_12;
                int local_17 = Entity.GetIdValue();
                XLog(ELog(14), FString().Append("RVO Corridor Clear Entity=").Append(local_17).Append(" Reason=").Append(Reason).Append(" Active=").Append(local_12.bActive).Append(" Anchor=").Append(local_12.AnchorSimulateIndex).Append(" CurrentPoint=").Append(local_12.CurrentPointIndex).Append("/").Append(local_12.Points.Num()).Append(" Elapsed=").Append(local_12.ElapsedTime));
            }
            Remove local_24;
            local_24.opCall();
        }
        return;
    }
    FVector BuildRVOCorridorSideDirection(const FECSEntity &inout Entity, const FVector &inout DesiredDir, const FVector &inout RVOAdjustedDir) const
    {
        FVector local_6 = DesiredDir;
        FVector local_12 = RVOAdjustedDir;
        local_6.Z = 0.0;
        local_12.Z = 0.0;
        if (local_6.IsNearlyZero(9.999999747378752e-5))
        {
            local_6 = local_12;
        }
        if (local_6.IsNearlyZero(9.999999747378752e-5))
        {
            return FVector::ZeroVector;
        }
        local_6 = local_6.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        local_12 = local_12.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        float local_14_3 = -local_6.X;
        FVector local_22 = FVector(local_6.Y, local_14_3, 0.0);
        float32 local_34 = float32(local_12.DotProduct(local_22));
        if (FMath::Abs(local_34) > 0.05f)
        {
            FVector local_42;
            if (local_34 > 0.0f)
            {
                local_42 = local_22;
            }
            else
            {
                local_42 = local_22.opNeg();
            }
            return local_42;
        }
        FVector local_42;
        int local_44 = Entity.GetIdValue() % 2;
        if (local_44 == 0)
        {
            local_42 = local_22;
        }
        else
        {
            local_42 = local_22.opNeg();
        }
        return local_42;
    }
    float32 GetRVOCorridorAvoidDistance(const float32 AgentRadius) const
    {
        return FMath::Clamp(AgentRadius * 2.5f, 180.0f, 500.0f);
    }
    float32 GetRVOCorridorSideOffset(const float32 AgentRadius) const
    {
        return FMath::Clamp(AgentRadius, 90.0f, 300.0f);
    }
    FVector BuildRVOCorridorAvoidPoint(const FECSEntity &inout Entity, const FC_Transform &inout Transform, const FC_AIPathSimulate &inout C_Simulate, const FSimulateData &inout SegmentData, const FVector &inout MoveInput, const FVector &inout AvoidDir, float32 &inout OutAvoidDistance, float32 &inout OutSideOffset, FVector &inout OutSideDir, float32 &inout OutAgentRadius) const
    {
        FVector local_12 = this.GetCurrentSegmentStartForRVO(Transform, C_Simulate);
        FVector local_18(SegmentData.GetTargetPoint());
        OutAgentRadius = FECSAIUtils::GetEntityAgentRadius(Entity);
        OutSideDir = this.BuildRVOCorridorSideDirection(Entity, MoveInput, AvoidDir);
        OutAvoidDistance = this.GetRVOCorridorAvoidDistance(OutAgentRadius);
        OutSideOffset = this.GetRVOCorridorSideOffset(OutAgentRadius);
        FVector local_40 = ((this.ProjectPointAheadOnSegment2D(Transform.GetPosition(), local_12, local_18, OutAvoidDistance)) + (OutSideDir * OutSideOffset));
        local_40.Z = Transform.GetPosition().Z;
        return local_40;
    }
    void DrawRVOLocalCorridorPathComparison(const FECSEntity &inout Entity, const FC_Transform &inout Transform, const FC_AIPathSimulate &inout C_Simulate, const FSimulateData &inout SegmentData, const FC_AIRVOLocalCorridor &inout Corridor) const
    {
        int local_41 = 0;
        if (!(this.IsRVOLocalCorridorPathDrawTarget(Entity)))
        {
            return;
        }
        FVector local_14 = FVector(0.0, 0.0, 35.0);
        FVector local_32 = (FVector(Transform.GetPosition()) + local_14);
        int local_33 = C_Simulate.GetCurrentSimulateIndex();
        for (; local_33 < C_Simulate.GetSimulateList().Num(); )
        {
            const FSimulateData& local_38 = C_Simulate.GetSimulateList()[local_33];
            int local_35 = int(local_38.GetMoveType());
            local_41 = int(SegmentData.GetMoveType());
            if (local_35 != local_41)
            {
                break;
            }
            FVector local_26 = (FVector(local_38.GetTargetPoint()) + local_14);
            DebugDraw::DrawDebugLine(this.GetWorld(), local_32, local_26, FColor::Yellow, false, -1.0f, uint8(0), 0.0f);
            DebugDraw::DrawDebugSphere(this.GetWorld(), local_26, 24.0f, 8, FColor::Yellow, false, -1.0f, uint8(0), 0.0f);
            local_32 = local_26;
            ++local_33;
        }
        FVector local_48 = FVector(Transform.GetPosition());
        FVector local_8 = (local_48 + local_14);
        FVector local_48_2 = FVector(0.0, 0.0, 20.0);
        FVector local_60 = (local_8 + local_48_2);
        int local_33_2 = Corridor.CurrentPointIndex;
        while (local_33_2 < local_41)
        {
            FVector local_48_3 = Corridor.Points[local_33_2];
            FVector local_26_2 = (local_48_3 + local_14);
            local_48_3 = (local_26_2 + FVector(0.0, 0.0, 20.0));
            DebugDraw::DrawDebugLine(this.GetWorld(), local_60, local_48_3, FColor::Green, false, -1.0f, uint8(0), 0.0f);
            DebugDraw::DrawDebugSphere(this.GetWorld(), local_48_3, 30.0f, 8, FColor::Green, false, -1.0f, uint8(0), 0.0f);
            local_60 = local_48_3;
            ++local_33_2;
            local_41 = Corridor.Points.Num();
        }
        int local_33_3 = C_Simulate.GetCurrentSimulateIndex();
        for (; local_33_3 < C_Simulate.GetSimulateList().Num(); )
        {
            const FSimulateData& local_38_2 = C_Simulate.GetSimulateList()[local_33_3];
            if (int(local_38_2.GetMoveType()) != int(SegmentData.GetMoveType()))
            {
                break;
            }
            FVector local_66(local_38_2.GetTargetPoint());
            FVector local_8_2 = (local_66 + local_14);
            FVector local_26_3 = FVector(0.0, 0.0, 20.0);
            local_66 = (local_8_2 + local_26_3);
            DebugDraw::DrawDebugLine(this.GetWorld(), local_60, local_66, FColor::Green, false, -1.0f, uint8(0), 0.0f);
            DebugDraw::DrawDebugSphere(this.GetWorld(), local_66, 24.0f, 8, FColor::Green, false, -1.0f, uint8(0), 0.0f);
            local_60 = local_66;
            ++local_33_3;
        }
        return;
    }
    void ApplyRVOLocalCorridor(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, FC_Transform &inout Transform, FC_AIPathSimulate &inout C_Simulate, const FSimulateData &inout SegmentData, FAIPathSimulateMoveParam &inout MoveParam) const
    {
        if (SegmentData.GetbIsChainedStartEntryPrefix())
        {
            this.ClearRVOLocalCorridorWithReason(Entity, "chained_start_entry_prefix");
            return;
        }
        float local_4 = FixedTime.DeltaTime.ToSeconds();
        float32 local_5 = float32(local_4);
        float32 local_6 = 2.0f;
        float32 local_8 = 4.0f;
        float32 local_11 = 0.5f;
        if (!(CVar_AI_RVOPathSimulateCorridorEnable.GetBool()))
        {
            this.ClearRVOLocalCorridorWithReason(Entity, "disabled");
            C_Simulate.SetRVOLocalCorridorCreateCooldown(0.0f);
            return;
        }
        if (C_Simulate.GetRVOLocalCorridorCreateCooldown() > 0.0f)
        {
            float32 local_2 = C_Simulate.GetRVOLocalCorridorCreateCooldown() - local_5;
            C_Simulate.SetRVOLocalCorridorCreateCooldown(FMath::Max(0.0f, local_2));
        }
        if (!(MoveParam.bHasMoveInput) || !(this.IsRVOLocalCorridorMoveType(EAISimulateMoveType(SegmentData.GetMoveType()))))
        {
            this.ClearRVOLocalCorridorWithReason(Entity, "invalid_move_input_or_type");
            C_Simulate.SetRVOLocalCorridorCreateCooldown(0.0f);
            return;
        }
        bool local_1 = this.IsRVOLocalCorridorDebugTarget(Entity);
        Has local_22;
        bool local_15 = local_22.opCall();
        if (!(local_15))
        {
            C_Simulate.SetRVOLocalCorridorCreateCooldown(0.0f);
        }
        bool local_23 = true;
        Modify local_28;
        FC_AIRVOLocalCorridor& local_30 = local_28.opCall();
        if (local_30)
        {
            Get local_38;
            if (!(local_15))
            {
                this.ClearRVOLocalCorridorWithReason(Entity, "avoidance_movement_gone");
                return;
            }
            if (local_30.bActive && (int(local_30.AnchorSimulateIndex) == C_Simulate.GetCurrentSimulateIndex()) && local_30.Points.IsValidIndex(int(local_30.CurrentPointIndex)) && (local_30.ElapsedTime <= 1.5f))
            {
                if (int(local_30.CurrentPointIndex) == 0)
                {
                    const FC_AIAvoidanceMovement& local_34 = local_38.opCall();
                    if (local_34)
                    {
                        float local_4_2 = (FFPTime(FixedTime.Time) - local_34.UpdateTime).ToSeconds();
                        float32 local_2_2 = float32(local_4_2);
                        if (local_2_2 <= 0.15f)
                        {
                            FVector local_56 = FVector(local_34.WorldInputByVelocity.X, local_34.WorldInputByVelocity.Y, local_34.WorldInputByVelocity.Z);
                            local_56.Z = 0.0;
                            if (!(local_56.IsNearlyZero(9.999999747378752e-5)))
                            {
                                float32 local_61 = 0.0f;
                                float32 local_62 = 0.0f;
                                FVector local_63 = 0.0f;
                                FVector local_70(FVector::ZeroVector);
                                FVector local_76(local_30.Points[int(local_30.CurrentPointIndex)]);
                                FVector local_50 = this.BuildRVOCorridorAvoidPoint(Entity, Transform, C_Simulate, SegmentData, MoveParam.MoveInput, local_56, local_61, local_62, local_70, local_63);
                                int local_31 = int(local_30.CurrentPointIndex);
                                local_30.Points[local_31] = local_50;
                                if (local_1 && (float32(((local_76 - local_50).Size2D())) > 1.0f))
                                {
                                    XLog(ELog(14), FString().Append("RVO Corridor Refresh Entity=").Append(Entity.GetIdValue()).Append(" SimIndex=").Append(C_Simulate.GetCurrentSimulateIndex()).Append(" OldPoint=").Append(local_76).Append(" NewPoint=").Append(local_50).Append(" RVOInput=").Append(local_56).Append(" AvoidanceAge=").Append(local_2_2).Append(" SideDir=").Append(local_70));
                                }
                            }
                        }
                    }
                }
                local_23 = false;
                if (local_1)
                {
                    FVector local_50_2(local_30.Points[int(local_30.CurrentPointIndex)]);
                    FVector local_94 = (FVector(Transform.GetPosition()) - local_50_2);
                    FVector local_63_2 = this.GetDistanceToSegment2D(Transform.GetPosition(), this.GetCurrentSegmentStartForRVO(Transform, C_Simulate), SegmentData.GetTargetPoint());
                    int local_87 = Entity.GetIdValue();
                    XLog(ELog(14), FString().Append("RVO Corridor Reuse Entity=").Append(local_87).Append(" SimIndex=").Append(C_Simulate.GetCurrentSimulateIndex()).Append(" CurrentPoint=").Append(local_30.CurrentPointIndex).Append("/").Append(local_30.Points.Num()).Append(" DistToPoint=").Append(float32(local_94.Size2D())).Append(" DistToSegment=").Append(local_63_2).Append(" Pos=").Append(Transform.GetPosition()).Append(" Point=").Append(local_50_2).Append(" Elapsed=").Append(local_30.ElapsedTime));
                }
            }
            else
            {
                this.ClearRVOLocalCorridorWithReason(Entity, "existing_invalid_or_expired");
            }
        }
        if (local_23 && (C_Simulate.GetRVOLocalCorridorCreateCooldown() > 0.0f))
        {
            if (local_1)
            {
                XLog(ELog(14), FString().Append("RVO Corridor SkipCreate Entity=").Append(Entity.GetIdValue()).Append(" Reason=create_cooldown SimIndex=").Append(C_Simulate.GetCurrentSimulateIndex()).Append(" Cooldown=").Append(C_Simulate.GetRVOLocalCorridorCreateCooldown()));
            }
            return;
        }
        if (local_23)
        {
            Get local_38;
            const FC_AIAvoidanceMovement& local_34_2 = local_38.opCall();
            if (local_34_2)
            {
                float32 local_12 = float32(((FFPTime(FixedTime.Time) - local_34_2.UpdateTime).ToSeconds()));
                if (local_12 > 0.15f)
                {
                    if (local_1)
                    {
                        XLog(ELog(14), FString().Append("RVO Corridor SkipCreate Entity=").Append(Entity.GetIdValue()).Append(" Reason=stale_avoidance_signal SimIndex=").Append(C_Simulate.GetCurrentSimulateIndex()).Append(" AvoidanceAge=").Append(local_12));
                    }
                    return;
                }
                FVector local_94_2 = FVector(local_34_2.WorldInputByVelocity.X, local_34_2.WorldInputByVelocity.Y, local_34_2.WorldInputByVelocity.Z);
                local_94_2.Z = 0.0;
                if (!(local_94_2.IsNearlyZero(9.999999747378752e-5)))
                {
                    FVector local_82 = this.GetCurrentSegmentStartForRVO(Transform, C_Simulate);
                    FVector local_76_2(SegmentData.GetTargetPoint());
                    float32 local_62_2 = 0.0f;
                    float32 local_61_2 = 0.0f;
                    FVector local_63_3 = 0.0f;
                    FVector local_70_2(FVector::ZeroVector);
                    FVector local_50_3 = this.BuildRVOCorridorAvoidPoint(Entity, Transform, C_Simulate, SegmentData, MoveParam.MoveInput, local_94_2, local_62_2, local_61_2, local_70_2, local_63_3);
                    local_30.bActive = true;
                    local_30.AnchorSimulateIndex = C_Simulate.GetCurrentSimulateIndex();
                    local_30.Points.Empty(0);
                    local_30.Points.Add(local_50_3);
                    local_30.CurrentPointIndex = 0;
                    local_30.ElapsedTime = 0.0f;
                    local_30.AllowedOffset = FMath::Max(local_63_3 * local_6, 300.0f);
                    local_30.HardRepathOffset = FMath::Max(local_63_3 * local_8, 800.0f);
                    if (local_1)
                    {
                        XLog(ELog(14), FString().Append("RVO Corridor Create Entity=").Append(Entity.GetIdValue()).Append(" SimIndex=").Append(C_Simulate.GetCurrentSimulateIndex()).Append(" Pos=").Append(Transform.GetPosition()).Append(" SegStart=").Append(local_82).Append(" SegEnd=").Append(local_76_2).Append(" MoveInput=").Append(MoveParam.MoveInput).Append(" RVOInput=").Append(local_94_2).Append(" AvoidanceAge=").Append(local_12).Append(" SideDir=").Append(local_70_2).Append(" AvoidDistance=").Append(local_62_2).Append(" SideOffset=").Append(local_61_2).Append(" AvoidPoint=").Append(local_50_3).Append(" AgentRadius=").Append(local_63_3).Append(" DistToSegment=").Append(this.GetDistanceToSegment2D(Transform.GetPosition(), local_82, local_76_2)));
                    }
                }
                else
                {
                    if (local_1)
                    {
                        XLog(ELog(14), FString().Append("RVO Corridor SkipCreate Entity=").Append(Entity.GetIdValue()).Append(" Reason=zero_avoid_dir SimIndex=").Append(C_Simulate.GetCurrentSimulateIndex()).Append(" RVOInput=").Append(local_94_2));
                    }
                }
            }
            else
            {
                if (local_1)
                {
                    XLog(ELog(14), FString().Append("RVO Corridor SkipCreate Entity=").Append(Entity.GetIdValue()).Append(" Reason=no_FC_AIAvoidanceMovement SimIndex=").Append(C_Simulate.GetCurrentSimulateIndex()));
                }
            }
        }
        FC_AIRVOLocalCorridor& local_30_2 = local_28.opCall();
        if (local_30_2)
        {
            local_30_2.ElapsedTime = (local_30_2.ElapsedTime + local_5);
            if (!(local_30_2.bActive) || (int(local_30_2.AnchorSimulateIndex) != C_Simulate.GetCurrentSimulateIndex()) || (local_30_2.ElapsedTime > 1.5f))
            {
                this.ClearRVOLocalCorridorWithReason(Entity, "inactive_anchor_mismatch_or_ttl");
                return;
            }
            while (local_30_2.Points.IsValidIndex(int(local_30_2.CurrentPointIndex)) && ((float32(((FVector(Transform.GetPosition()) - local_30_2.Points[int(local_30_2.CurrentPointIndex)])).Size2D()) < FMath::Max(100.0f, (FECSAIUtils::GetEntityAgentRadius(Entity) * local_11)))))
            {
                if (local_1)
                {
                    FVector local_82_2 = FVector(local_30_2.Points[int(local_30_2.CurrentPointIndex)]);
                    float local_4_5 = (FVector(Transform.GetPosition()) - local_82_2).Size2D();
                    XLog(ELog(14), FString().Append("RVO Corridor Advance Entity=").Append(Entity.GetIdValue()).Append(" SimIndex=").Append(C_Simulate.GetCurrentSimulateIndex()).Append(" FromPoint=").Append(local_30_2.CurrentPointIndex).Append(" Dist=").Append(float32(local_4_5)).Append(" Pos=").Append(Transform.GetPosition()).Append(" Point=").Append(local_82_2));
                }
                ++local_30_2.CurrentPointIndex;
            }
            if (!(local_30_2.Points.IsValidIndex(int(local_30_2.CurrentPointIndex))))
            {
                C_Simulate.SetRVOLocalCorridorCreateCooldown(0.6f);
                this.ClearRVOLocalCorridorWithReason(Entity, "all_points_reached");
                return;
            }
            int local_32 = int(local_30_2.CurrentPointIndex);
            FVector local_56_2 = (FVector(local_30_2.Points[local_32]) - Transform.GetPosition());
            local_56_2.Z = 0.0;
            MoveParam.SetMoveInput(local_56_2.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
            this.DrawRVOLocalCorridorPathComparison(Entity, Transform, C_Simulate, SegmentData, local_30_2);
            if (local_1)
            {
                int local_106;
                float local_4_7 = local_56_2.Size2D();
                float32 local_105 = float32(local_4_7);
                FVector local_94_3 = FVector(local_30_2.Points[int(local_30_2.CurrentPointIndex)]);
                int local_87_2 = Entity.GetIdValue();
                XLog(ELog(14), FString().Append("RVO Corridor Apply Entity=").Append(local_87_2).Append(" SimIndex=").Append(C_Simulate.GetCurrentSimulateIndex()).Append(" CurrentPoint=").Append(local_30_2.CurrentPointIndex).Append("/").Append(local_30_2.Points.Num()).Append(" DistToPoint=").Append(local_105).Append(" MoveInput=").Append(MoveParam.MoveInput).Append(" Pos=").Append(Transform.GetPosition()).Append(" Target=").Append(local_94_3).Append(" Elapsed=").Append(local_30_2.ElapsedTime));
                this.EnableAIPathSimulateDebugDraw();
                FVector local_70_3(Transform.GetPosition());
                local_106 = int(local_30_2.CurrentPointIndex);
                for (; local_106 < local_30_2.Points.Num(); )
                {
                    FECSDebugDraw::DrawDebugSphere(DebugDrawKey_AIPathSimulate, (FVector(local_30_2.Points[local_106]) + FVector(0.0, 0.0, 20.0)), 40.0f, 8, FColor::Cyan, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
                    FVector local_100 = (FVector(local_30_2.Points[local_106]) + FVector(0.0, 0.0, 20.0));
                    FECSDebugDraw::DrawDebugLine(DebugDrawKey_AIPathSimulate, (local_70_3 + FVector(0.0, 0.0, 20.0)), local_100, FColor::Cyan, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
                    local_70_3 = local_30_2.Points[local_106];
                    ++local_106;
                }
            }
        }
        return;
    }
    void StuckJump(const FECSEntity &inout Entity, FC_AIPathSimulate &inout C_Simulate, FC_Transform &inout Transform) const
    {
        bool local_14 = false;
        float32 local_38;
        FNameHandle_EntityBBVar local_78;
        FNameHandle_EntityBBVarVector local_94;
        if (C_Simulate.GetCurrentSimulateIndex() < C_Simulate.GetSimulateList().Num())
        {
            FVector local_10(FVector::ZeroVector);
            FSimulateData& local_12 = C_Simulate.GetSimulateList()[C_Simulate.GetCurrentSimulateIndex()];
            if (int(local_12.GetMoveType()) == 1 || (int(local_12.GetMoveType()) == 2) || (int(local_12.GetMoveType()) == 5) || (int(local_12.GetMoveType()) == 6) || (int(local_12.GetMoveType()) == 7))
            {
                FVector local_32 = (FVector(local_12.GetTargetPoint()) - Transform.GetPosition());
                float32 local_37 = float32(local_32.Size());
                if (local_37 > 0.0001f)
                {
                    local_10 = (FVector(Transform.GetPosition()) + ((local_32 / local_37) * (FMath::Min(1000.0f, local_37))));
                }
                else
                {
                    FVector local_20_2 = (Transform.GetRotation().GetForwardVector() * 1000.0);
                    local_10 = (FVector(Transform.GetPosition()) + local_20_2);
                }
            }
            else
            {
                return;
            }
            int local_1 = CVar_AI_DebugAIPathPointSimulate.GetInt();
            if (local_1 == 1 || (local_1 == Entity.GetIdValue()))
            {
                this.EnableAIPathSimulateDebugDraw();
                FECSDebugDraw::DrawDebugSphere(DebugDrawKey_AIPathSimulate, (local_10 + FVector(0.0, 0.0, 5.0)), 50.0f, 8, FColor::Blue, FColor::Blue, 20.0f, uint8(0), 0.0f);
            }
            Get local_56;
            if (local_56.opCall().GetMoveAbilityConfig() && local_14)
            {
                int local_61;
                local_61 = 1;
                ECS::GetContextDeltaTime();
                ECS::GetContextTime();
                ::FAINavigationUtils::GetAIMoveAbilityTrigger();
                local_78;
                if (Entity.HasEntityBB(local_78))
                {
                    FNameHandle_EntityBBVarEnum local_82;
                    int local_51 = local_61;
                    local_82;
                    Entity.SetBB_Enum(local_82, n"MoveAbility.eMoveAbilityType");
                }
                local_78;
                if (Entity.HasEntityBB(local_78))
                {
                    Has local_86;
                    local_14 = local_86.opCall();
                    if (local_14)
                    {
                        Get local_90;
                        local_38 = local_90.opCall().GetScaledHalfHeight();
                    }
                    else
                    {
                        local_38 = 0.0f;
                    }
                    FVector local_20_3 = (local_10 + FVector(0.0, 0.0, local_38));
                    local_94;
                }
                local_78;
                if (Entity.HasEntityBB(local_78))
                {
                    FNameHandle_EntityBBVarFloat local_98;
                    local_98;
                    Entity.SetBB_Float(local_98, n"MoveAbility.fNormalizedUpstairsHeight");
                }
                return;
            }
            ECS::GetContextDeltaTime();
            ECS::GetContextTime();
            ::FAINavigationUtils::GetAIJumpTriggerV2();
            local_78;
            if (Entity.HasEntityBB(local_78))
            {
                local_94;
            }
        }
        return;
    }
    void LinearMove(const FECSEntity &inout Entity, FC_Transform &inout Transform, FSimulateData &inout SegmentData, const FSimulateData &inout NextSegmentCopy, FAIPathSimulateMoveParam &inout MoveParam) const
    {
        FVector local_18 = (FVector(SegmentData.GetTargetPoint()) - Transform.GetPosition());
        float local_22 = local_18.Size2D();
        float local_24 = 1.0;
        if (local_22 > 1.0)
        {
            local_24 = FMath::Lerp(0.75, 1.0, FMath::Clamp(local_22 / 100.0, 0.0, 1.0));
        }
        FVector local_38 = local_18;
        if (SegmentData.GetbIsChainedStartEntryPrefix())
        {
            local_38.Z = 0.0;
        }
        local_38 = (local_38.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * local_24);
        MoveParam.SetMoveInput(local_38);
        MoveParam.MoveSimulateType = SegmentData.GetMoveSimulateType();
        MoveParam.MoveStance = SegmentData.GetMoveStance();
        MoveParam.bUseAIControlledMotion = SegmentData.GetbUseAIControlledMotion();
        if (MoveParam.bUseAIControlledMotion)
        {
            MoveParam.AIControllMotionTarget = SegmentData.GetTargetPoint();
            MoveParam.bOnlyHorizontal = true;
            if (int(SegmentData.GetMoveType()) == (int(NextSegmentCopy.GetMoveType())))
            {
                MoveParam.HasNextTarget = true;
                MoveParam.AIControllMotionNextTarget = NextSegmentCopy.GetTargetPoint();
                MoveParam.bOnlyHorizontal = true;
            }
        }
        if (CVar_AI_DebugAIPathPointModeSimulate.GetBool())
        {
            if (local_38.SizeSquared() > 1e-6)
            {
                float32 local_45 = 200.0f;
                FVector local_58 = (FVector(Transform.GetPosition()) + FVector(0.0, 0.0, 50.0));
                FVector local_12 = (local_58 + (local_38 * local_45));
                this.EnableAIPathSimulateDebugDraw();
                FECSDebugDraw::DrawDebugDirectionalArrow(DebugDrawKey_AIPathSimulate, local_58, local_12, 50.0f, FLinearColor::Blue.ToFColor(true), FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
            }
        }
        float local_28_2 = (FVector(Transform.GetPosition()) - SegmentData.GetTargetPoint()).Size2D();
        float32 local_46 = ::FAINavigationUtils::GetToleranceDistance();
        if (SegmentData.GetbIsChainedStartEntryPrefix())
        {
            float32 local_77;
            local_77 = 35.0f;
            if (UGameplayConfigsManager::GetAIMoveSettings().IsValid())
            {
                UAIMoveSettings local_80;
                local_77 = local_80.ChainedStartEntryPrefixTolerance;
            }
            local_46 = FMath::Clamp(local_77, 10.0f, local_46);
        }
        if (local_28_2 < (local_46))
        {
            SegmentData.SetSimulateState(EAIPathSimulateState(2));
        }
        return;
    }
    void LinearMove_Fly(const FECSEntity &inout Entity, FC_Transform &inout Transform, FSimulateData &inout SegmentData, const FSimulateData &inout NextSegmentCopy, FAIPathSimulateMoveParam &inout MoveParam) const
    {
        float32 local_89;
        FVector local_18 = (FVector(SegmentData.GetTargetPoint()) - Transform.GetPosition());
        FRotator local_30 = FAIInputUtils::GetAimInput(Transform.GetPosition(), SegmentData.GetTargetPoint(), Transform.GetRotation().GetUpVector());
        FVector local_36(FVector::ForwardVector);
        FVector local_42 = local_18;
        local_42.Normalize(9.99999993922529e-9);
        MoveParam.InputSpace = EAIInputSpace(0);
        MoveParam.SetMoveInput(local_36);
        MoveParam.bHorizontalOnly = false;
        MoveParam.MoveSimulateType = SegmentData.GetMoveSimulateType();
        MoveParam.MoveStance = SegmentData.GetMoveStance();
        MoveParam.SetViewInput(local_30);
        MoveParam.bUseAIControlledMotion = SegmentData.GetbUseAIControlledMotion();
        if (MoveParam.bUseAIControlledMotion)
        {
            MoveParam.AIControllMotionTarget = SegmentData.GetTargetPoint();
            if (int(SegmentData.GetMoveType()) == (int(NextSegmentCopy.GetMoveType())))
            {
                MoveParam.HasNextTarget = true;
                MoveParam.AIControllMotionNextTarget = NextSegmentCopy.GetTargetPoint();
            }
        }
        if (CVar_AI_DebugAIPathPointModeSimulate.GetBool())
        {
            if ((local_42.SizeSquared()) > (1e-6))
            {
                float32 local_55 = 200.0f;
                FVector local_70 = (FVector(Transform.GetPosition()) + FVector(0.0, 0.0, 50.0));
                FVector local_6 = (local_70 + (local_42 * local_55));
                this.EnableAIPathSimulateDebugDraw();
                FECSDebugDraw::DrawDebugDirectionalArrow(DebugDrawKey_AIPathSimulate, local_70, local_6, 50.0f, FLinearColor::Blue.ToFColor(true), FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
            }
        }
        float local_64_2 = (FVector(Transform.GetPosition()) - SegmentData.GetTargetPoint()).Size();
        if (MoveParam.bUseAIControlledMotion)
        {
            local_89 = 10.0f;
        }
        else
        {
            local_89 = ::FAINavigationUtils::GetToleranceDistance() * 10.0f;
        }
        if (local_64_2 < (local_89))
        {
            SegmentData.SetSimulateState(EAIPathSimulateState(2));
        }
        return;
    }
    bool JumpSorption(const FECSEntity &inout Entity, FC_Transform &inout Transform, FSimulateData &inout SegmentData) const
    {
        if (SegmentData.GetbSorptionCompleted())
        {
            return false;
        }
        bool local_1 = (SegmentData.GetJumpSorptionTargetLocation().Size() > 0.0);
        bool local_2 = (SegmentData.GetTurnTargetDirection().SizeSquared() > 0.0);
        if (!(local_1) && !(local_2))
        {
            return false;
        }
        if (!(local_1) && local_2)
        {
            float local_6 = Transform.GetRotation().GetForwardVector().Y;
            FVector local_26 = FVector(Transform.GetRotation().GetForwardVector().X, local_6, 0.0).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            float local_36 = SegmentData.GetTurnTargetDirection().Y;
            local_6 = SegmentData.GetTurnTargetDirection().X;
            FVector local_32 = FVector(local_6, local_36, 0.0).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            if (local_26.IsNearlyZero(9.999999747378752e-5) || local_32.IsNearlyZero(9.999999747378752e-5))
            {
                SegmentData.SetbSorptionCompleted(true);
                return false;
            }
            if (float32(local_26.DotProduct(local_32)) >= FMath::Cos(FMath::DegreesToRadians(10.0f)))
            {
                if (SegmentData.GetElapsedTime() > 0.0f)
                {
                    SegmentData.SetElapsedTime(0.0f);
                }
                SegmentData.SetbSorptionCompleted(true);
                return false;
            }
        }
        if (SegmentData.GetElapsedTime() == 0.0f && local_1)
        {
            SegmentData.SetJumpSorptionStartLocation(Transform.GetPosition());
        }
        SegmentData.SetElapsedTime((SegmentData.GetElapsedTime() + ECS::GetContextDeltaTime()));
        float32 local_43_2 = FMath::Clamp((SegmentData.GetElapsedTime() / 0.2f), 0.0f, 1.0f);
        FVector local_42;
        if (local_1)
        {
            local_42 = FMath::Lerp(SegmentData.GetJumpSorptionStartLocation(), SegmentData.GetJumpSorptionTargetLocation(), local_43_2);
        }
        else
        {
            local_42 = Transform.GetPosition();
        }
        FC_AIPathFollowRequestTeleport local_78;
        local_78.Location = local_42;
        if (local_2)
        {
            FVector local_20 = (FVector(SegmentData.GetTurnTargetDirection().X, SegmentData.GetTurnTargetDirection().Y, 0.0)).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            if (local_20.IsNearlyZero(9.999999747378752e-5))
            {
                local_20 = FVector::ForwardVector;
            }
            FQuat local_96 = FQuat::FindBetweenNormals(FVector::ForwardVector, local_20);
            local_78.Rotation = FQuat::Slerp(Transform.GetRotation(), local_96, local_43_2);
            local_78.bUseRotation = true;
        }
        if (local_43_2 >= 1.0f)
        {
            SegmentData.SetJumpSorptionTargetLocation(FVector::ZeroVector);
            SegmentData.SetTurnTargetDirection(FVector::ZeroVector);
            SegmentData.SetElapsedTime(0.0f);
            SegmentData.SetbSorptionCompleted(true);
        }
        return true;
    }
    void JumpMove(const FECSEntity &inout Entity, FC_Transform &inout Transform, FC_AIPathSimulate &inout C_Simulate, FSimulateData &inout SegmentData) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void TakeOffMove(const FECSEntity &inout Entity, FC_Transform &inout Transform, FSimulateData &inout SegmentData) const
    {
        if (!(SegmentData.GetbHasTrigger()))
        {
            ECS::GetContextDeltaTime();
            ECS::GetContextTime();
            ::FAINavigationUtils::GetGroundToAirTrigger();
            if (::AIPathSimulateHelper::IsEntityInAir(Entity))
            {
                SegmentData.SetbHasTrigger(true);
            }
        }
        if (::AIPathSimulateHelper::IsEntityInAir(Entity))
        {
            SegmentData.SetSimulateState(EAIPathSimulateState(2));
        }
        return;
    }
    void LandMove(const FECSEntity &inout Entity, FC_Transform &inout Transform, FSimulateData &inout SegmentData) const
    {
        if (!(SegmentData.GetbHasTrigger()))
        {
            ECS::GetContextDeltaTime();
            ECS::GetContextTime();
            ::FAINavigationUtils::GetAirToGroundTrigger();
            if (!(::AIPathSimulateHelper::IsEntityInAir(Entity)))
            {
                SegmentData.SetbHasTrigger(true);
            }
        }
        if (!(::AIPathSimulateHelper::IsEntityInAir(Entity)))
        {
            SegmentData.SetSimulateState(EAIPathSimulateState(2));
        }
        return;
    }
    void KeepForwardMove(const FECSEntity &inout Entity, FC_Transform &inout Transform, FSimulateData &inout SegmentData, FAIPathSimulateMoveParam &inout MoveParam) const
    {
        MoveParam.SetMoveInput(Transform.GetRotation().GetForwardVector());
        MoveParam.MoveSimulateType = SegmentData.GetMoveSimulateType();
        MoveParam.MoveStance = SegmentData.GetMoveStance();
        MoveParam.bUseAIControlledMotion = SegmentData.GetbUseAIControlledMotion();
        return;
    }
    void KeepMoveToTarget(const FECSEntity &inout Entity, FC_Transform &inout Transform, FSimulateData &inout SegmentData, FAIPathSimulateMoveParam &inout MoveParam) const
    {
        float local_22 = (FVector(SegmentData.GetTargetPoint()) - Transform.GetPosition()).Size2D();
        float local_24 = 1.0;
        if (local_22 > 1.0)
        {
            local_24 = FMath::Lerp(0.75, 1.0, FMath::Clamp(local_22 / 100.0, 0.0, 1.0));
        }
        FVector local_6 = ((FVector(SegmentData.GetTargetPoint()) - Transform.GetPosition()).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * local_24);
        MoveParam.SetMoveInput(local_6);
        MoveParam.MoveSimulateType = SegmentData.GetMoveSimulateType();
        MoveParam.MoveStance = SegmentData.GetMoveStance();
        MoveParam.bUseAIControlledMotion = SegmentData.GetbUseAIControlledMotion();
        if (CVar_AI_DebugAIPathPointModeSimulate.GetBool())
        {
            if (local_6.SizeSquared() > 1e-6)
            {
                float32 local_41 = 200.0f;
                FVector local_54 = (FVector(Transform.GetPosition()) + FVector(0.0, 0.0, 50.0));
                FVector local_12 = (local_54 + (local_6 * local_41));
                this.EnableAIPathSimulateDebugDraw();
                FECSDebugDraw::DrawDebugDirectionalArrow(DebugDrawKey_AIPathSimulate, local_54, local_12, 50.0f, FLinearColor::Blue.ToFColor(true), FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
            }
        }
        return;
    }
    void DoStandTurn(const FECSEntity &inout Entity, FC_Transform &inout Transform, FSimulateData &inout SegmentData, FAIPathSimulateMoveParam &inout MoveParam, const FCS_FixedTime &inout FixedTime) const
    {
        FGameplayTag local_6 = FGameplayTag::RequestGameplayTag(n"ESM.MotionFlag.GroundTurnInplace", true);
        SegmentData.SetElapsedTime((SegmentData.GetElapsedTime() + float32(FixedTime.DeltaTime.ToSeconds())));
        if (SegmentData.GetElapsedTime() >= 5.0f)
        {
            XError(ELog(14), FString().Append("[S_AIPathSimulateSystem] DoStandTurn timeout! Entity=").Append(Entity.GetIdValue()).Append(", ElapsedTime=").Append(SegmentData.GetElapsedTime()).Append(", bHasTrigger=").Append(SegmentData.GetbHasTrigger()));
            SegmentData.SetSimulateState(EAIPathSimulateState(2));
            return;
        }
        if (!(SegmentData.GetbHasTrigger()))
        {
            FNameHandle_EntityBBVar local_58;
            FAIInputUtils::SimulateViewInput(Entity, SegmentData.GetTurnTargetDirection().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector).Rotation());
            ECS::GetContextDeltaTime();
            ECS::GetContextTime();
            ::FAINavigationUtils::GetAIMoveAbilityTrigger();
            local_58;
            if (Entity.HasEntityBB(local_58))
            {
                FNameHandle_EntityBBVarEnum local_64;
                local_64;
                Entity.SetBB_Enum(local_64, n"MoveAbility.eMoveAbilityType");
            }
            if (Entity.MatchGameplayTag(local_6))
            {
                SegmentData.SetbHasTrigger(true);
            }
        }
        else
        {
            if (!(Entity.MatchGameplayTag(local_6)))
            {
                SegmentData.SetSimulateState(EAIPathSimulateState(2));
            }
        }
        return;
    }
    void FillAIPredictedMovePathForAnimation(const FECSEntity &inout Entity, const FC_Transform &inout Transform, const FC_AIPathSimulate &inout C_Simulate, const EAISimulateMoveType CurMoveType) const
    {
        int local_2 = 0;
        FTransform local_36;
        float32 local_58;
        float local_110;
        if (int(CurMoveType) == 9)
        {
            local_36 = FTransform(Transform.GetRotation(), Transform.GetPosition(), FVector::OneVector);
            local_2.NextDeltaTransform = local_36;
            return;
        }
        float32 local_37 = this.PathAnimationPredictionNextDeltaTime;
        bool local_9 = (int(CurMoveType) == 2);
        FVector local_46(FVector::ZeroVector);
        Get local_50;
        const FC_Rigidbody& local_52 = local_50.opCall();
        if (local_52)
        {
            local_46 = local_52.GetVelocity();
        }
        if (local_9)
        {
            local_58 = float32(local_46.Size());
        }
        else
        {
            local_58 = float32(local_46.Size2D());
        }
        float32 local_38 = local_58 * local_37;
        FVector local_66 = Transform.GetPosition();
        FVector local_78 = Transform.GetRotation().GetForwardVector();
        bool local_39 = local_38 > 0.0001f && (C_Simulate.GetCurrentSimulateIndex() < C_Simulate.GetSimulateList().Num());
        if (local_39)
        {
            int local_87;
            float32 local_80 = local_38;
            FVector local_86 = Transform.GetPosition();
            local_87 = C_Simulate.GetCurrentSimulateIndex();
            while (local_39)
            {
                const FSimulateData& local_90 = C_Simulate.GetSimulateList()[local_87];
                if (int(local_90.GetMoveType()) != (int(CurMoveType)))
                {
                    break;
                }
                FVector local_98(local_90.GetTargetPoint());
                if (!(local_9))
                {
                    local_98.Z = Transform.GetPosition().Z;
                }
                FVector local_72 = (local_98 - local_86);
                if (local_9)
                {
                    local_110 = local_72.Size();
                }
                else
                {
                    local_110 = local_72.Size2D();
                }
                if (local_110 < 0.0001)
                {
                    local_86 = local_98;
                }
                else
                {
                    FVector local_104 = local_72.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                    if ((float32(local_110)) >= local_80)
                    {
                        local_66 = (local_86 + (local_104 * local_80));
                        local_78 = local_104;
                        local_80 = 0.0f;
                    }
                    else
                    {
                        local_80 = local_80 - float32(local_110);
                        local_86 = local_98;
                        local_78 = local_104;
                    }
                }
                ++local_87;
                if (local_87 >= C_Simulate.GetSimulateList().Num())
                {
                    local_39 = false;
                    continue;
                }
                local_39 = (local_80 > 0.0f);
            }
            if (local_80 > 0.0001f)
            {
                local_66 = local_86;
            }
        }
        FRotator local_128 = local_78.Rotation();
        local_2.NextDeltaTransform = local_36;
        return;
    }
    void MoveStateSummary(const FECSEntity &inout Entity, FC_Transform &inout Transform, FC_AIPathSimulate &inout C_Simulate, FAIPathSimulateMoveParam &inout MoveParam) const
    {
        bool local_10;
        int local_92 = 0;
        int local_101;
        C_Simulate.SetDistanceToCurrentEnd(0.0);
        if (C_Simulate.GetCurrentSimulateIndex() < C_Simulate.GetSimulateList().Num())
        {
            FSimulateData& local_8 = C_Simulate.GetSimulateList()[C_Simulate.GetCurrentSimulateIndex()];
            if (int(local_8.GetMoveType()) == 1 || (int(local_8.GetMoveType()) == 2) || (int(local_8.GetMoveType()) == 5) || (int(local_8.GetMoveType()) == 6) || (int(local_8.GetMoveType()) == 7))
            {
                C_Simulate.SetDistanceToCurrentEnd((FVector(local_8.GetTargetPoint()) - Transform.GetPosition()).Size2D());
            }
            else
            {
                if (int(local_8.GetMoveType()) == 9)
                {
                    C_Simulate.SetDistanceToCurrentEnd(0.0);
                }
            }
        }
        else
        {
            int local_29 = 0;
            for (; local_29 < C_Simulate.GetSimulateList().Num(); ++local_29)
            {
                FSimulateData& local_8_2 = C_Simulate.GetSimulateList()[local_29];
                if (int(local_8_2.GetSimulateState()) != 2)
                {
                    ELog local_44;
                    FString local_40 = "  SimulatePath: ";
                    FString local_36 = local_8_2.GetTargetPoint().ToString();
                    FString local_40_2 = (local_44 + "State: ");
                    EAIPathSimulateState local_30 = local_8_2.GetSimulateState();
                    (local_40_2 + local_44);
                }
            }
            return;
        }
        EAISimulateMoveType local_46;
        local_46 = C_Simulate.GetSimulateList()[C_Simulate.GetCurrentSimulateIndex()].GetMoveType();
        if (int(FAIInputUtils::GetMoveStanceAtLayer(Entity, ECharacterMoveStanceLayer(3))) != int(MoveParam.MoveStance))
        {
            FECSWorldPtr local_52 = Entity.GetWorld();
            Get local_56;
            FAIInputUtils::ChangeMoveStance(MoveParam.MoveStance, Entity, local_56.opCall().Time, ECharacterMoveStanceLayer(3));
        }
        if (MoveParam.bHasMoveInput)
        {
            C_Simulate.SetbHasLastRequestedMoveInput(true);
            C_Simulate.SetLastRequestedMoveInput(MoveParam.MoveInput);
            C_Simulate.SetLastRequestedInputSpace(MoveParam.InputSpace);
            C_Simulate.SetLastRequestedMoveSimulateType(MoveParam.MoveSimulateType);
            C_Simulate.SetbLastRequestedUseAIControlledMotion(MoveParam.bUseAIControlledMotion);
            FAIInputUtils::SimulateMoveInputInSpace(Entity, MoveParam.MoveInput, MoveParam.InputSpace, MoveParam.MoveSimulateType, MoveParam.bHorizontalOnly);
            int local_4 = CVar_AI_DebugRigidbodyFacing.GetInt();
            if (local_4 == 1 || (local_4 == Entity.GetIdValue()))
            {
                FVector local_16 = MoveParam.MoveInput.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                if (local_16.SizeSquared() > (1e-6))
                {
                    FVector local_76 = (FVector(Transform.GetPosition()) + FVector(0.0, 0.0, 80.0));
                    FVector local_22 = (local_76 + (local_16 * 250.0));
                    this.EnableAIPathSimulateDebugDraw();
                    FECSDebugDraw::DrawDebugDirectionalArrow(DebugDrawKey_AIPathSimulate, local_76, local_22, 50.0f, FColor::Yellow, FColor::Yellow, 5.0f, uint8(0), 0.0f);
                }
            }
        }
        else
        {
            C_Simulate.SetbHasLastRequestedMoveInput(false);
            C_Simulate.SetLastRequestedMoveInput(FVector::ZeroVector);
            C_Simulate.SetLastRequestedInputSpace(EAIInputSpace(1));
            C_Simulate.SetLastRequestedMoveSimulateType(EAIMoveSimulateType(0));
            C_Simulate.SetbLastRequestedUseAIControlledMotion(MoveParam.bUseAIControlledMotion);
            FAIInputUtils::SimulateMoveInputInSpace(Entity, FVector::ZeroVector, EAIInputSpace(1), EAIMoveSimulateType(0), true);
        }
        if (MoveParam.bHasViewInput)
        {
            FAIInputUtils::SimulateViewInput(Entity, MoveParam.ViewInput);
        }
        if (MoveParam.bUseAIControlledMotion)
        {
            local_92.GetModify_PathPoints().Empty(0);
            int local_4_2 = 0;
            int local_93 = 0;
            Get local_100;
            const FC_AIRVOLocalCorridor& local_96 = local_100.opCall();
            if (local_96)
            {
                local_10 = local_96.bActive && (int(local_96.AnchorSimulateIndex) == C_Simulate.GetCurrentSimulateIndex());
                if (local_10)
                {
                    local_101 = int(local_96.CurrentPointIndex);
                    for (; local_101 < local_96.Points.Num(); )
                    {
                        FAIControlledMotionPathPoint local_110;
                        local_110.SetPosition(local_96.Points[local_101]);
                        local_110.SetSimulateIndex(-1);
                        local_92.GetModify_PathPoints().Add(FAIControlledMotionPathPoint());
                        ++local_4_2;
                        ++local_93;
                        ++local_101;
                    }
                }
            }
            local_10 = C_Simulate.GetSimulateList().IsValidIndex(C_Simulate.GetCurrentSimulateIndex()) && C_Simulate.GetSimulateList()[C_Simulate.GetCurrentSimulateIndex()].GetbIsChainedStartEntryPrefix();
            local_101 = C_Simulate.GetCurrentSimulateIndex();
            for (; local_101 < C_Simulate.GetSimulateList().Num(); ++local_101)
            {
                FSimulateData& local_8_3 = C_Simulate.GetSimulateList()[local_101];
                if (int(local_8_3.GetMoveType()) == int(local_46))
                {
                    FAIControlledMotionPathPoint local_110;
                    local_110.SetPosition(local_8_3.GetTargetPoint());
                    local_110.SetSimulateIndex(local_101);
                    local_92.GetModify_PathPoints().Add(local_110);
                    ++local_4_2;
                    if (local_10)
                    {
                        break;
                    }
                    continue;
                }
                break;
            }
            local_92.SetbOnlyHorizontal(MoveParam.bOnlyHorizontal);
            if (local_93 > 0 && this.IsRVOLocalCorridorDebugTarget(Entity))
            {
                XLog(ELog(14), FString().Append("RVO Corridor ControlledMotion Entity=").Append(Entity.GetIdValue()).Append(" SimIndex=").Append(C_Simulate.GetCurrentSimulateIndex()).Append(" Injected=").Append(local_93).Append(" TotalPathPoints=").Append(local_4_2).Append(" UseControlledMotion=").Append(MoveParam.bUseAIControlledMotion));
            }
        }
        else
        {
            bool local_5;
            Has local_116;
            local_5 = local_116.opCall();
            if (local_5)
            {
                Remove local_120;
                local_120.opCall();
            }
        }
        if (C_Simulate.GetCurrentSimulateIndex() < C_Simulate.GetSimulateList().Num())
        {
            int local_121;
            local_121 = C_Simulate.GetSimulateList()[C_Simulate.GetCurrentSimulateIndex()].GetMoveType();
            this.FillAIPredictedMovePathForAnimation(Entity, Transform, C_Simulate, EAISimulateMoveType(local_121));
        }
        this.UpdateOffPathState(Entity, Transform, C_Simulate);
        this.StuckCheck(Entity, Transform, C_Simulate);
        this.MovementStateCheck(Entity, C_Simulate);
        return;
    }
    void MovementStateCheck(const FECSEntity &inout Entity, FC_AIPathSimulate &inout C_Simulate) const
    {
        if (!(::FASCommonUtils::IsBossPrefab(Entity)))
        {
            return;
        }
        if (C_Simulate.GetCurrentSimulateIndex() >= C_Simulate.GetSimulateList().Num())
        {
            return;
        }
        EAISimulateMoveType local_4;
        local_4 = C_Simulate.GetSimulateList()[C_Simulate.GetCurrentSimulateIndex()].GetMoveType();
        bool local_1 = ::AIPathSimulateHelper::IsEntityInAir(Entity);
        if ((int(local_4) == 1 && local_1))
        {
            ELog local_12;
            C_Simulate.SetbMovementStateMismatch(true);
            int local_2 = C_Simulate.GetCurrentSimulateIndex();
            FString::Format(Entity.GetIdValue(), "AIPathSimulate MovementStateMismatch: EntityID:{0} expected Ground but InAir, segment={1}", local_12);
            return;
        }
        if ((int(local_4) == 2 && !(local_1)))
        {
            ELog local_12;
            C_Simulate.SetbMovementStateMismatch(true);
            int local_2_2 = C_Simulate.GetCurrentSimulateIndex();
            FString::Format(Entity.GetIdValue(), "AIPathSimulate MovementStateMismatch: EntityID:{0} expected Air but OnGround, segment={1}", local_12);
        }
        return;
    }
    float32 GetPointSegmentDistance(const FVector &inout InPos, const FVector &inout InSegStart, const FVector &inout InSegEnd, const bool bUse2D) const
    {
        FVector local_6 = InPos;
        FVector local_12 = InSegStart;
        FVector local_18 = InSegEnd;
        if (bUse2D)
        {
            local_12.Z = 0.0;
            local_18.Z = 0.0;
            local_20 = 0.0;
            local_6.Z = 0.0;
        }
        FVector local_32 = (local_18 - local_12);
        float local_20_2 = local_32.SizeSquared();
        float32 local_34 = float32(local_20_2);
        if (local_34 < 0.0001f)
        {
            local_20_2 = (local_6 - local_18).Size();
            return float32(local_20_2);
        }
        local_20_2 = (local_6 - local_12).DotProduct(local_32);
        local_20_2 = FMath::Clamp((float32(local_20_2) / local_34), 0.0f, 1.0f);
        local_20_2 = (local_6 - (local_12 + (local_32 * local_20_2))).Size();
        return float32(local_20_2);
    }
    void UpdateOffPathState(const FECSEntity &inout Entity, FC_Transform &inout Transform, FC_AIPathSimulate &inout C_Simulate) const
    {
        bool local_11;
        float32 local_48;
        if (C_Simulate.GetCurrentSimulateIndex() < C_Simulate.GetSimulateList().Num())
        {
            Get local_10;
            const FC_AIRVOLocalCorridor& local_6 = local_10.opCall();
            if (local_6)
            {
                if (local_6.bActive && (int(local_6.AnchorSimulateIndex) == C_Simulate.GetCurrentSimulateIndex()) && (local_6.Points.Num() > 0))
                {
                    FVector local_18(Transform.GetPosition());
                    if (int(local_6.CurrentPointIndex) > 0 && local_6.Points.IsValidIndex((int(local_6.CurrentPointIndex) - 1)))
                    {
                        local_18 = local_6.Points[(int(local_6.CurrentPointIndex) - 1)];
                    }
                    C_Simulate.SetOffsetDistanceToCurrentSegment(this.GetDistanceToSegment2D(Transform.GetPosition(), local_18, FVector(local_6.Points[FMath::Clamp(int(local_6.CurrentPointIndex), 0, (local_6.Points.Num() - 1))])));
                    return;
                }
            }
            FSimulateData& local_30 = C_Simulate.GetSimulateList()[C_Simulate.GetCurrentSimulateIndex()];
            if (int(local_30.GetMoveType()) == 1 || (int(local_30.GetMoveType()) == 2) || (int(local_30.GetMoveType()) == 5) || (int(local_30.GetMoveType()) == 6) || (int(local_30.GetMoveType()) == 7))
            {
                local_11 = (int(local_30.GetMoveType()) == 1);
                if (C_Simulate.GetCurrentSimulateIndex() <= 0)
                {
                    FVector local_44 = (FVector(Transform.GetPosition()) - local_30.GetTargetPoint());
                    if (local_11)
                    {
                        local_48 = float32(local_44.Size2D());
                    }
                    else
                    {
                        local_48 = float32(local_44.Size());
                    }
                    C_Simulate.SetOffsetDistanceToCurrentSegment(local_48);
                }
                else
                {
                    FVector local_18_2(C_Simulate.GetSimulateList()[(C_Simulate.GetCurrentSimulateIndex() - 1)].GetTargetPoint());
                    FVector local_44_2(local_30.GetTargetPoint());
                    local_48 = this.GetPointSegmentDistance(Transform.GetPosition(), local_18_2, local_44_2, local_11);
                    if (C_Simulate.GetSimulateList().IsValidIndex((C_Simulate.GetCurrentSimulateIndex() - 2)))
                    {
                        FVector local_56(C_Simulate.GetSimulateList()[(C_Simulate.GetCurrentSimulateIndex() - 2)].GetTargetPoint());
                        local_48 = FMath::Min(local_48, this.GetPointSegmentDistance(Transform.GetPosition(), local_56, local_18_2, local_11));
                    }
                    C_Simulate.SetOffsetDistanceToCurrentSegment(local_48);
                }
            }
            return;
        }
        C_Simulate.SetOffsetDistanceToCurrentSegment(0.0f);
        return;
    }
    void StuckCheck(const FECSEntity &inout Entity, FC_Transform &inout Transform, FC_AIPathSimulate &inout C_Simulate) const
    {
        if (C_Simulate.GetCurrentSimulateIndex() < C_Simulate.GetSimulateList().Num())
        {
            FSimulateData& local_8 = C_Simulate.GetSimulateList()[C_Simulate.GetCurrentSimulateIndex()];
            if (int(local_8.GetMoveType()) == 1 || (int(local_8.GetMoveType()) == 2) || (int(local_8.GetMoveType()) == 5) || (int(local_8.GetMoveType()) == 6) || (int(local_8.GetMoveType()) == 7) || (int(local_8.GetMoveType()) == 3) || (int(local_8.GetMoveType()) == 4))
            {
                FVector local_28 = (FVector(Transform.GetPosition()) - C_Simulate.GetLastTickPostion());
                FVector local_22 = (C_Simulate.GetRecentOffset() + local_28);
                C_Simulate.SetRecentOffset(local_22);
                C_Simulate.SetRecentOffset2D((C_Simulate.GetRecentOffset2D() + FVector2D(local_28.X, local_28.Y)));
                C_Simulate.SetLastTickPostion(Transform.GetPosition());
                C_Simulate.SetStuckCheckElapsedTime((C_Simulate.GetStuckCheckElapsedTime() + ECS::GetContextDeltaTime()));
                float32 local_43_2 = float32(C_Simulate.GetRecentOffset().Size());
                if (local_43_2 >= 100.0f)
                {
                    if (C_Simulate.GetbStuck())
                    {
                        XWarning(ELog(14), FString::Format("StuckCheck: RECOVERED EntityID:{0} Pos:{1} Displacement:{2}", Entity.GetIdValue(), Transform.GetPosition().ToString(), local_43_2));
                    }
                    C_Simulate.SetRecentOffset(FVector::ZeroVector);
                    C_Simulate.SetRecentOffset2D(FVector2D(0.0, 0.0));
                    C_Simulate.SetStuckCheckElapsedTime(0.0f);
                    C_Simulate.SetbStuck(false);
                    return;
                }
                if (C_Simulate.GetStuckCheckElapsedTime() >= 3.0f)
                {
                    int local_3 = CVar_AI_DebugAIPathPointSimulate.GetInt();
                    if (local_3 == 1 || (local_3 == Entity.GetIdValue()))
                    {
                        this.EnableAIPathSimulateDebugDraw();
                        FECSDebugDraw::DrawDebugSphere(DebugDrawKey_AIPathSimulate, (FVector(C_Simulate.GetLastTickPostion()) + FVector(0.0, 0.0, 5.0)), 50.0f, 8, FColor::Red, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
                        FVector local_16 = (FVector(C_Simulate.GetLastTickPostion()) + FVector(0.0, 0.0, 500.0));
                        FECSDebugDraw::DrawDebugLine(DebugDrawKey_AIPathSimulate, (FVector(C_Simulate.GetLastTickPostion()) + FVector(0.0, 0.0, 5.0)), local_16, FColor::Red, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
                    }
                    if (C_Simulate.GetbHasStuckUpstairs())
                    {
                        C_Simulate.SetbUpstairsTryFailed(true);
                        C_Simulate.SetbSessionStuckSnapshotValid(true);
                        C_Simulate.SetSessionStuckSnapshotPosition(Transform.GetPosition());
                        C_Simulate.SetSessionStuckSnapshotNetOffset(C_Simulate.GetRecentOffset());
                        C_Simulate.SetSessionStuckSnapshotElapsedTime(C_Simulate.GetStuckCheckElapsedTime());
                        C_Simulate.SetSessionStuckSnapshotSimulateIndex(C_Simulate.GetCurrentSimulateIndex());
                        C_Simulate.SetSessionStuckSnapshotSegmentTarget(local_8.GetTargetPoint());
                        C_Simulate.SetbStuck(true);
                        C_Simulate.SetRecentOffset(FVector::ZeroVector);
                        C_Simulate.SetRecentOffset2D(FVector2D(0.0, 0.0));
                        C_Simulate.SetStuckCheckElapsedTime(0.0f);
                        return;
                    }
                    C_Simulate.SetbNeedStuckTryUpstairs(true);
                    C_Simulate.SetbStuck(false);
                    XVerbose(ELog(14), FString::Format("StuckCheck: STUCK TryUpstairs EntityID:{0} Pos:{1} ElapsedTime:{2} Displacement:{3}", Entity.GetIdValue(), Transform.GetPosition().ToString(), C_Simulate.GetStuckCheckElapsedTime(), local_43_2));
                    C_Simulate.SetRecentOffset(FVector::ZeroVector);
                    C_Simulate.SetRecentOffset2D(FVector2D(0.0, 0.0));
                    C_Simulate.SetStuckCheckElapsedTime(0.0f);
                }
            }
        }
        return;
    }
    void UpdateSimulateSegment(const FECSEntity &inout Entity, FC_Transform &inout Transform, FC_AIPathSimulate &inout C_Simulate, FAIPathSimulateMoveParam &inout MoveParam) const
    {
        bool local_7 = false;
        Get local_6;
        const FC_AIControlledMotion& local_2 = local_6.opCall();
        if (local_2)
        {
            if (CVar_AI_DebugAIPathPointSimulate.GetInt() > 0)
            {
                int local_10 = 1128792064;
                FVector local_42 = (FVector(Transform.GetPosition()) + FVector(0.0, 0.0, 50.0));
                FVector local_18 = (FVector(local_2.GetMoveNextTarget()) + FVector(0.0, 0.0, 50.0));
                this.EnableAIPathSimulateDebugDraw();
                local_7 = true;
                FECSDebugDraw::DrawDebugDirectionalArrow(DebugDrawKey_AIPathSimulate, local_42, local_18, 50.0f, FLinearColor::Purple.ToFColor(local_7), FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
            }
            if (C_Simulate.GetCurrentSimulateIndex() <= local_2.GetReachedPoint().GetSimulateIndex())
            {
                int local_58;
                local_58 = C_Simulate.GetCurrentSimulateIndex();
                while (local_7)
                {
                    C_Simulate.GetSimulateList()[local_58].SetSimulateState(EAIPathSimulateState(EAIPathSimulateState(2)));
                    C_Simulate.SetCurrentSimulateIndex(local_58);
                    ++local_58;
                    if (local_58 > local_2.GetReachedPoint().GetSimulateIndex())
                    {
                        local_7 = false;
                        continue;
                    }
                    local_7 = (local_58 < C_Simulate.GetSimulateList().Num());
                }
            }
            Remove local_64;
            local_64.opCall();
        }
        if (C_Simulate.GetCurrentSimulateIndex() < C_Simulate.GetSimulateList().Num())
        {
            FSimulateData& local_66 = C_Simulate.GetSimulateList()[C_Simulate.GetCurrentSimulateIndex()];
            if (int(local_66.GetMoveType()) == 0 || (int(local_66.GetSimulateState()) == 2))
            {
                this.EndSimulateSegment(Entity, local_66, MoveParam);
                local_66.SetSimulateState(EAIPathSimulateState(EAIPathSimulateState(2)));
                C_Simulate.SetCurrentSimulateIndex((C_Simulate.GetCurrentSimulateIndex() + 1));
                if (C_Simulate.GetCurrentSimulateIndex() < C_Simulate.GetSimulateList().Num())
                {
                    FSimulateData& local_70 = C_Simulate.GetSimulateList()[C_Simulate.GetCurrentSimulateIndex()];
                    this.EnterSegment(Transform, C_Simulate, local_70);
                }
            }
        }
        return;
    }
    void EndSimulateSegment(const FECSEntity &inout Entity, const FSimulateData &inout SegmentData, FAIPathSimulateMoveParam &inout MoveParam) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void EnterSegment(FC_Transform &inout Transform, FC_AIPathSimulate &inout C_Simulate, FSimulateData &inout NextSegment) const
    {
        C_Simulate.SetDistanceToCurrentEnd((FVector(NextSegment.GetTargetPoint()) - Transform.GetPosition()).Size2D());
        C_Simulate.SetOffsetDistanceToCurrentSegment(0.0f);
        C_Simulate.SetRecentOffset(FVector::ZeroVector);
        C_Simulate.SetRecentOffset2D(FVector2D::ZeroVector);
        C_Simulate.SetbNeedStuckTryUpstairs(false);
        C_Simulate.SetStuckCheckElapsedTime(0.0f);
        C_Simulate.SetbHasStuckUpstairs(false);
        C_Simulate.SetbUpstairsTryFailed(false);
        C_Simulate.SetbStuck(false);
        C_Simulate.SetLastTickPostion(Transform.GetPosition());
        NextSegment.SetSimulateState(EAIPathSimulateState(1));
        return;
    }
    void DebugDrawSimulatePath(const FC_AIPathSimulate &inout C_Simulate, const FC_Transform &inout Transform) const
    {
        bool local_25;
        if (C_Simulate.GetSimulateList().Num() == 0)
        {
            return;
        }
        if (this.GetWorld() == nullptr)
        {
            return;
        }
        this.EnableAIPathSimulateDebugDraw();
        int local_1 = CVar_AI_DebugAIPathPointModeSimulate.GetInt();
        float32 local_8 = 20.0f;
        FVector local_16(C_Simulate.GetSimulateList()[0].GetTargetPoint());
        int local_17 = 0;
        for (; local_17 < C_Simulate.GetSimulateList().Num(); ++local_17)
        {
            const FSimulateData& local_20 = C_Simulate.GetSimulateList()[local_17];
            FLinearColor local_24;
            local_25 = false;
            switch (int(local_20.GetMoveType()))
            {
            case 1:
            {
                local_24 = FLinearColor::Green;
                break;
            }
            case 2:
            {
                local_24 = FLinearColor::Blue;
                break;
            }
            case 5:
            {
                local_24 = FLinearColor::Red;
                break;
            }
            case 6:
            {
                local_24 = FLinearColor(0.6f, 0.2f, 0.8f, 1.0f);
                break;
            }
            case 7:
            {
                local_24 = FLinearColor(0.6f, 0.2f, 0.8f, 1.0f);
                break;
            }
            case 8:
            {
                local_24 = FLinearColor(1.0f, 0.5f, 0.0f, 1.0f);
                break;
            }
            case 4:
            {
                local_24 = FLinearColor(0.0f, 0.12f, 0.81f, 1.0f);
                break;
            }
            case 3:
            case 9:
            {
                local_25 = true;
                break;
            }
            default:
            {
                local_24 = FLinearColor::White;
            }
            }
            if (!(local_25))
            {
                if (local_1 == 0)
                {
                    FLinearColor local_38 = FLinearColor(FLinearColor::White);
                    FLinearColor local_42 = FLinearColor(FLinearColor::Green);
                    FLinearColor local_46 = FLinearColor(FLinearColor::Yellow);
                    if (local_17 < C_Simulate.GetCurrentSimulateIndex())
                    {
                        local_24 = local_38;
                    }
                    else
                    {
                        local_24 = local_17 == C_Simulate.GetCurrentSimulateIndex() ? local_42 : local_46;
                    }
                }
                FVector local_76 = (FVector(local_20.GetTargetPoint()) + FVector(0.0, 0.0, 5.0));
                FColor local_78 = local_24.ToFColor(true);
                FECSDebugDraw::DrawDebugSphere(DebugDrawKey_AIPathSimulate, local_76, local_8, 8, local_78, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
                FECSDebugDraw::DrawDebugPoint(DebugDrawKey_AIPathSimulate, local_76, 10.0f, local_78, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0));
                if (local_17 > 0)
                {
                    FECSDebugDraw::DrawDebugLine(DebugDrawKey_AIPathSimulate, (local_16 + FVector(0.0, 0.0, 5.0)), local_76, local_78, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
                }
                local_16 = local_20.GetTargetPoint();
            }
        }
        return;
    }
    bool TryProjectObstacleDetourPointToGround(const FECSEntity &inout Entity, const FVector &inout Point, FVector &out OutProjectedPoint) const
    {
        FVector local_6;
        OutProjectedPoint = local_6;
        FVector local_18 = FVector(100.0, 100.0, 2000.0);
        if (FAIPathFollowUtils::IsPointOnNavigation(Entity, Point, local_18))
        {
            OutProjectedPoint = FAIPathFollowUtils::ProjectPointToNavigation(Entity, Point, local_18);
            return true;
        }
        OutProjectedPoint = Point;
        return false;
    }
    void AddObstacleDetourGroundPointIfDistinct(TArray<FVector> &inout Points, const FVector &inout Point) const
    {
        int local_1 = 1112014848;
        if ((Points.Num() == 0 || ((((Point - Points.Last(0))).Size2D() >= 50.0))))
        {
            Points.Add(Point);
        }
        return;
    }
    bool IsObstacleDetourPointInList(const TArray<FVector> &inout Points, const FVector &inout Point, const float32 Tolerance) const
    {
        for (auto& local_16 : Points)
        {
            if (Point.Equals(local_16, Tolerance))
            {
                return true;
            }
        }
        return false;
    }
    float32 GetObstacleDetourPointDistanceToSegment2D(const FVector &inout Point, const FVector &inout SegmentStart, const FVector &inout SegmentEnd) const
    {
        FVector local_6 = Point;
        FVector local_12 = SegmentStart;
        FVector local_18 = SegmentEnd;
        local_6.Z = 0.0;
        local_12.Z = 0.0;
        local_18.Z = 0.0;
        FVector local_32 = (local_18 - local_12);
        float local_20_4 = local_32.SizeSquared();
        float32 local_34 = float32(local_20_4);
        if (local_34 <= 0.0001f)
        {
            float local_20_5 = (local_6 - local_12).Size2D();
            return float32(local_20_5);
        }
        float local_20_6 = (local_6 - local_12).DotProduct(local_32);
        float local_20_7 = FMath::Clamp((float32(local_20_6) / local_34), 0.0f, 1.0f);
        float local_20_8 = (local_6 - (local_12 + (local_32 * local_20_7))).Size2D();
        return float32(local_20_8);
    }
    bool IsObstacleDetourPointOnSamplePolyline2D(const TArray<FVector> &inout SamplePositions, const FVector &inout Point, const float32 Tolerance) const
    {
        if (SamplePositions.Num() == 0)
        {
            return false;
        }
        int local_4 = 0;
        for (; local_4 < SamplePositions.Num(); ++local_4)
        {
            if ((FVector(SamplePositions[local_4]) - Point).Size2D() <= Tolerance)
            {
                return true;
            }
        }
        int local_4_2 = 0;
        for (; local_4_2 < (SamplePositions.Num() - 1); ++local_4_2)
        {
            if (this.GetObstacleDetourPointDistanceToSegment2D(Point, SamplePositions[local_4_2], SamplePositions[(local_4_2 + 1)]) <= Tolerance)
            {
                return true;
            }
        }
        return false;
    }
    bool BuildObstacleDetourGroundedKeyPositions(const FECSEntity &inout Entity, const TArray<FVector> &inout InPositions, TArray<FVector> &out OutPositions) const
    {
        TArray<FVector> local_4;
        OutPositions = local_4;
        OutPositions.Reset(0);
        if (InPositions.Num() < 2)
        {
            return false;
        }
        int local_8 = 0;
        for (; local_8 < InPositions.Num(); ++local_8)
        {
            FVector local_14(InPositions[local_8]);
            if (local_8 == 0)
            {
                this.AddObstacleDetourGroundPointIfDistinct(OutPositions, local_14);
                continue;
            }
            FVector local_20(FVector::ZeroVector);
            this.TryProjectObstacleDetourPointToGround(Entity, local_14, local_20);
            this.AddObstacleDetourGroundPointIfDistinct(OutPositions, local_20);
        }
        return (OutPositions.Num() >= 2);
    }
    bool CompactObstacleDetourModifiedPositions(const TArray<FVector> &inout ModifiedSamplePositions, const TArray<FVector> &inout GroundedKeyPositions, const TArray<FVector> &inout GroundedSamplePositions, TArray<FVector> &out OutPositions) const
    {
        bool local_7;
        TArray<FVector> local_4;
        OutPositions = local_4;
        OutPositions.Reset(0);
        if (ModifiedSamplePositions.Num() < 2)
        {
            return false;
        }
        int local_8 = 1084227584;
        int local_10 = 1103626240;
        bool local_11 = false;
        int local_12 = 0;
        for (; local_12 < ModifiedSamplePositions.Num(); ++local_12)
        {
            FVector local_18(ModifiedSamplePositions[local_12]);
            local_7 = (local_12 == 0) || (local_12 == (ModifiedSamplePositions.Num() - 1));
            bool local_19 = this.IsObstacleDetourPointInList(GroundedKeyPositions, local_18, 5.0f);
            bool local_21 = !(this.IsObstacleDetourPointOnSamplePolyline2D(GroundedSamplePositions, local_18, 25.0f));
            if (((local_7 || local_19) || local_21))
            {
                this.AddObstacleDetourGroundPointIfDistinct(OutPositions, local_18);
                if (local_21)
                {
                    local_11 = true;
                }
            }
        }
        return OutPositions.Num() >= 2 && local_11;
    }
    bool BuildObstacleDetourGroundedPositions(const FECSEntity &inout Entity, const TArray<FVector> &inout InPositions, TArray<FVector> &out OutPositions) const
    {
        TArray<FVector> local_4;
        OutPositions = local_4;
        OutPositions.Reset(0);
        if (InPositions.Num() < 2)
        {
            return false;
        }
        int local_8 = 1133903872;
        int local_10 = 0;
        for (; local_10 < (InPositions.Num() - 1); )
        {
            FVector local_18(InPositions[local_10]);
            FVector local_24(InPositions[local_10 + 1]);
            FVector local_30(FVector::ZeroVector);
            if (local_10 == 0)
            {
                this.AddObstacleDetourGroundPointIfDistinct(OutPositions, local_18);
            }
            FVector local_38 = (local_24 - local_18);
            float local_40 = local_38.Size2D();
            float32 local_9 = float32(local_40);
            if (local_9 > 300.0f)
            {
                int local_6 = FMath::FloorToInt(local_9 / 300.0f);
                int local_42 = 1;
                for (; local_42 <= local_6; ++local_42)
                {
                    float32 local_31 = local_42;
                    local_31 = (local_31 * 300.0f) / local_9;
                    if (local_31 >= 1.0f)
                    {
                        continue;
                    }
                    local_40 = local_31;
                    local_38 = FMath::Lerp(local_18, local_24, local_40);
                    this.TryProjectObstacleDetourPointToGround(Entity, local_38, local_30);
                    this.AddObstacleDetourGroundPointIfDistinct(OutPositions, local_30);
                }
            }
            this.TryProjectObstacleDetourPointToGround(Entity, local_24, local_30);
            this.AddObstacleDetourGroundPointIfDistinct(OutPositions, local_30);
            ++local_10;
        }
        return (OutPositions.Num() >= 2);
    }
    UFUNCTION()
    void ServerJob_ObstacleDetourCheck(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, FC_Transform &inout Transform, FC_AIPathSimulate &inout C_Simulate) const
    {
        if (C_Simulate.GetCurrentSimulateIndex() >= C_Simulate.GetSimulateList().Num())
        {
            return;
        }
        if (C_Simulate.GetSimulateList()[C_Simulate.GetCurrentSimulateIndex()].GetbIsChainedStartEntryPrefix())
        {
            return;
        }
        if (C_Simulate.GetObstacleDetourCheckTimer() > 0.0f)
        {
            C_Simulate.SetObstacleDetourCheckTimer((C_Simulate.GetObstacleDetourCheckTimer() + float32(FixedTime.DeltaTime.ToSeconds())));
            if (C_Simulate.GetObstacleDetourCheckTimer() < CVar_AI_ObstacleDetourCheckInterval.GetFloat())
            {
                return;
            }
        }
        C_Simulate.SetObstacleDetourCheckTimer(float32(FixedTime.DeltaTime.ToSeconds()));
        Get local_18;
        FVector local_14 = local_18.opCall().GetPosition();
        int local_2 = CVar_AI_DebugObstacleDetour.GetInt();
        this.ObstacleDetourRebuild(Entity, C_Simulate, (local_2 == 1) || (local_2 == Entity.GetIdValue()));
        return;
    }
    void ObstacleDetourRebuild(const FECSEntity &inout Entity, FC_AIPathSimulate &inout C_Simulate, const bool bDrawDebug) const
    {
        int local_1;
        int local_17;
        bool local_25;
        EAISimulateMoveType local_40;
        bool local_42;
        bool local_61;
        bool local_107;
        local_1 = C_Simulate.GetCurrentSimulateIndex();
        if (local_1 >= C_Simulate.GetSimulateList().Num())
        {
            return;
        }
        float32 local_5 = CVar_AI_ObstacleDetourMaxCheckDistance.GetFloat();
        Get local_16;
        FVector local_12 = local_16.opCall().GetPosition();
        local_17 = C_Simulate.GetCurrentSimulateIndex();
        FVector local_24(C_Simulate.GetSimulateList()[local_17].GetTargetPoint());
        local_25 = C_Simulate.GetSimulateList()[local_17].GetbIsObstacleDetour();
        int local_2 = C_Simulate.GetSimulateList().Num();
        int local_27 = -1;
        Has local_32;
        bool local_3 = local_32.opCall();
        if (local_3)
        {
            Get local_36;
            local_27 = local_36.opCall().GetSimulateList().Num();
        }
        int local_37 = -1;
        int local_38 = -1;
        int local_39 = local_1;
        for (; local_39 < C_Simulate.GetSimulateList().Num(); ++local_39)
        {
            local_40 = C_Simulate.GetSimulateList()[local_39].GetMoveType();
            bool local_3_2 = (int(local_40) == 1);
            float local_60 = (FVector(C_Simulate.GetSimulateList()[local_39].GetTargetPoint()) - local_12).Size2D();
            local_61 = C_Simulate.GetSimulateList()[local_39].GetbIsObstacleDetour();
            if (local_3_2)
            {
                int local_43 = C_Simulate.GetCurrentSimulateIndex();
                local_42 = (local_39 == local_43);
                if (!(local_42) && (local_60 > local_5))
                {
                    if (local_37 >= 0)
                    {
                        break;
                    }
                    continue;
                }
                if (local_37 < 0)
                {
                    local_37 = local_39;
                }
                local_38 = local_39;
                continue;
            }
            if (local_37 >= 0)
            {
                break;
            }
        }
        if (local_37 < 0 || (local_38 < local_37))
        {
            return;
        }
        TArray<FVector> local_68;
        TArray<int> local_72;
        FVector local_50 = local_12;
        int local_39_2 = -1;
        local_42 = false;
        int local_73 = local_37;
        for (; local_73 <= local_38; ++local_73)
        {
            if (C_Simulate.GetSimulateList()[local_73].GetbIsObstacleDetour())
            {
                local_42 = true;
                break;
            }
        }
        if (local_42)
        {
            int local_26 = local_37 - 1;
            for (; local_26 >= 0; --local_26)
            {
                if (!(C_Simulate.GetSimulateList()[local_26].GetbIsObstacleDetour()))
                {
                    local_50 = C_Simulate.GetSimulateList()[local_26].GetTargetPoint();
                    local_39_2 = local_26;
                    break;
                }
            }
        }
        local_68.Add(local_50);
        int local_26_2 = local_37;
        for (; local_26_2 <= local_38; ++local_26_2)
        {
            if (!(C_Simulate.GetSimulateList()[local_26_2].GetbIsObstacleDetour()))
            {
                local_68.Add(C_Simulate.GetSimulateList()[local_26_2].GetTargetPoint());
                local_72.Add(local_26_2);
            }
        }
        TArray<FVector> local_78;
        TArray<FVector> local_82;
        bool local_63 = this.BuildObstacleDetourGroundedKeyPositions(Entity, local_68, local_78);
        bool local_3_3 = this.BuildObstacleDetourGroundedPositions(Entity, local_68, local_82);
        if (local_63)
        {
            local_68 = local_78;
        }
        if (bDrawDebug)
        {
            FVector local_88(FVector::ZeroVector);
            if (local_68.Num() > 1)
            {
                local_88 = local_68[1];
            }
            float32 local_4 = float32(((local_24 - local_12).Size2D()));
            float32 local_89 = float32(((local_50 - local_12).Size2D()));
            int local_43_2 = local_25 ? 1 : 0;
            XLog(ELog(14), FString().Append("[AIObstacleDetourDiag][BuildInput] Entity=").Append(Entity.GetIdValue()).Append(" OldCurrent=").Append(local_17).Append(" OldSimNum=").Append(local_2).Append(" OldSyncNum=").Append(local_27).Append(" RunStart=").Append(local_37).Append(" RunEnd=").Append(local_38).Append(" Agent=").Append(local_12).Append(" OldTarget=").Append(local_24).Append(" OldTargetDist=").Append(local_4).Append(" OldTargetDetour=").Append(local_43_2).Append(" RunHasDetour=").Append(local_42 ? 1 : 0).Append(" AnchorIdx=").Append(local_39_2).Append(" PathStart=").Append(local_50).Append(" PathStartDist=").Append(local_89).Append(" OriginalNum=").Append(local_68.Num()).Append(" FirstOriginalTarget=").Append(local_88));
        }
        if (local_68.Num() < 2)
        {
            if (bDrawDebug)
            {
                XLog(ELog(14), FString().Append("[AIObstacleDetourDiag][SkipTooFewOriginal] Entity=").Append(Entity.GetIdValue()).Append(" OldCurrent=").Append(local_17).Append(" RunStart=").Append(local_37).Append(" RunEnd=").Append(local_38).Append(" OriginalNum=").Append(local_68.Num()).Append(" SimNum=").Append(C_Simulate.GetSimulateList().Num()));
            }
            return;
        }
        TArray<FVector> local_102 = local_68;
        TArray<FVector> local_106;
        local_107 = false;
        if (local_3_3)
        {
            local_106 = local_82;
            if (FAIPathFindingUtils::DetourPathPositionsAroundObstacles(this.GetWorld(), Entity, local_106, local_5, bDrawDebug))
            {
                TArray<FVector> local_114;
                if (this.CompactObstacleDetourModifiedPositions(local_106, local_68, local_82, local_114))
                {
                    local_102 = local_114;
                }
                else
                {
                    local_102 = local_68;
                }
            }
        }
        else
        {
            local_107 = FAIPathFindingUtils::DetourPathPositionsAroundObstacles(this.GetWorld(), Entity, local_102, local_5, bDrawDebug);
        }
        bool local_115 = false;
        int local_73_2 = local_37;
        for (; local_73_2 <= local_38; ++local_73_2)
        {
            if (C_Simulate.GetSimulateList()[local_73_2].GetbIsObstacleDetour())
            {
                local_115 = true;
                break;
            }
        }
        if (!(local_107) && !(local_115))
        {
            if (bDrawDebug)
            {
                XLog(ELog(14), FString().Append("[AIObstacleDetourDiag][SkipNoChange] Entity=").Append(Entity.GetIdValue()).Append(" OldCurrent=").Append(local_17).Append(" RunStart=").Append(local_37).Append(" RunEnd=").Append(local_38).Append(" OriginalNum=").Append(local_68.Num()).Append(" ModifiedNum=").Append(local_102.Num()).Append(" ExistingDetour=").Append(local_115 ? 1 : 0));
            }
            return;
        }
        int local_73_3 = local_102.Num();
        int local_116 = 0;
        FVector local_88_2(FVector::ZeroVector);
        if (local_107 && ((C_Simulate.GetCurrentSimulateIndex() < C_Simulate.GetSimulateList().Num())) && C_Simulate.GetSimulateList()[C_Simulate.GetCurrentSimulateIndex()].GetbIsObstacleDetour())
        {
            int local_125;
            FVector local_122(C_Simulate.GetSimulateList()[C_Simulate.GetCurrentSimulateIndex()].GetTargetPoint());
            FVector local_88_3 = local_122;
            int local_123 = -1;
            int local_124 = 1;
            for (; local_124 < local_102.Num(); ++local_124)
            {
                if (local_102[local_124].Equals(local_122, 50.0))
                {
                    local_123 = local_124;
                    break;
                }
            }
            if (local_123 > 1)
            {
                int local_43_3 = local_123 - 1;
                local_116 = local_43_3;
                local_125 = 0;
                for (; local_125 < local_43_3; )
                {
                    local_102.RemoveAt(1);
                    ++local_125;
                }
            }
            int local_91_2 = local_123;
            if (bDrawDebug)
            {
                XLog(ELog(14), FString().Append("[AIObstacleDetourDiag][TrimCurrent] Entity=").Append(Entity.GetIdValue()).Append(" Current=").Append(C_Simulate.GetCurrentSimulateIndex()).Append(" CurrentTarget=").Append(local_88_3).Append(" MatchIdx=").Append(local_91_2).Append(" RemoveCount=").Append(local_116).Append(" ModifiedBefore=").Append(local_73_3).Append(" ModifiedAfter=").Append(local_102.Num()));
            }
        }
        if (bDrawDebug)
        {
            int local_125;
            FVector local_122_2(FVector::ZeroVector);
            float32 local_89_2 = -1.0f;
            float32 local_4_2 = 0.0f;
            if (local_102.Num() > 1)
            {
                local_122_2 = local_102[1];
                local_89_2 = float32(((local_122_2 - local_12).Size2D()));
                FVector local_138 = local_16.opCall().GetRotation().GetForwardVector().GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
                local_4_2 = float32((local_138.DotProduct((local_122_2 - local_12).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector))));
            }
            int local_124_2 = local_107 ? 1 : 0;
            int local_123_2 = local_115 ? 1 : 0;
            local_125 = local_42 ? 1 : 0;
            local_26_2 = local_102.Num();
            int local_43_4 = local_68.Num();
            XLog(ELog(14), FString().Append("[AIObstacleDetourDiag][RebuildBefore] Entity=").Append(Entity.GetIdValue()).Append(" OldCurrent=").Append(local_17).Append(" OldSimNum=").Append(local_2).Append(" OldSyncNum=").Append(local_27).Append(" RunStart=").Append(local_37).Append(" RunEnd=").Append(local_38).Append(" bModified=").Append(local_124_2).Append(" ExistingDetour=").Append(local_123_2).Append(" RunHasDetour=").Append(local_125).Append(" AnchorIdx=").Append(local_39_2).Append(" PathStart=").Append(local_50).Append(" Agent=").Append(local_12).Append(" OriginalNum=").Append(local_43_4).Append(" ModifiedBeforeTrim=").Append(local_73_3).Append(" ModifiedAfterTrim=").Append(local_26_2).Append(" FirstModified=").Append(local_122_2).Append(" FirstModifiedDist=").Append(local_89_2).Append(" FirstModifiedForwardDot=").Append(local_4_2));
        }
        this.RebuildSimulateRunWithDetour(Entity, C_Simulate, local_37, local_38, local_68, local_102, local_107);
        if (bDrawDebug)
        {
            int local_125;
            Get local_36;
            bool local_139;
            bool local_62;
            local_125 = -1;
            local_62 = local_32.opCall();
            if (local_62)
            {
                local_125 = local_36.opCall().GetSimulateList().Num();
            }
            FVector local_138_2(FVector::ZeroVector);
            local_139 = false;
            float32 local_4_3 = -1.0f;
            int local_43_5 = C_Simulate.GetCurrentSimulateIndex();
            if (C_Simulate.GetSimulateList().IsValidIndex(local_43_5))
            {
                local_138_2 = C_Simulate.GetSimulateList()[C_Simulate.GetCurrentSimulateIndex()].GetTargetPoint();
                local_43_5 = C_Simulate.GetCurrentSimulateIndex();
                local_139 = C_Simulate.GetSimulateList()[local_43_5].GetbIsObstacleDetour();
                local_4_3 = float32(((local_138_2 - local_12).Size2D()));
            }
            local_26_2 = local_139 ? 1 : 0;
            local_43_5 = C_Simulate.GetSimulateList().Num();
            XLog(ELog(14), FString().Append("[AIObstacleDetourDiag][RebuildAfter] Entity=").Append(Entity.GetIdValue()).Append(" OldCurrent=").Append(local_17).Append(" NewCurrent=").Append(C_Simulate.GetCurrentSimulateIndex()).Append(" RunStart=").Append(local_37).Append(" OldSimNum=").Append(local_2).Append(" NewSimNum=").Append(local_43_5).Append(" OldSyncNum=").Append(local_27).Append(" NewSyncNum=").Append(local_125).Append(" NewTarget=").Append(local_138_2).Append(" NewTargetDist=").Append(local_4_3).Append(" NewTargetDetour=").Append(local_26_2));
        }
        return;
    }
    void RebuildSimulateRunWithDetour(const FECSEntity &inout Entity, FC_AIPathSimulate &inout C_Simulate, const int RunStart, const int RunEnd, const TArray<FVector> &inout OriginalPositions, const TArray<FVector> &inout ModifiedPositions, const bool bHasDetour) const
    {
        int local_87;
        TArray<FSimulateData> local_4;
        int local_7 = RunEnd + 1;
        for (; local_7 < C_Simulate.GetSimulateList().Num(); )
        {
            local_4.Add(C_Simulate.GetSimulateList()[local_7]);
            ++local_7;
        }
        FSimulateData local_46 = FSimulateData(C_Simulate.GetSimulateList()[RunStart]);
        C_Simulate.GetSimulateList().SetNum(RunStart);
        int local_7_2 = 1;
        for (; local_7_2 < ModifiedPositions.Num(); )
        {
            FSimulateData local_84 = local_46;
            local_84.SetTargetPoint(ModifiedPositions[local_7_2]);
            local_84.SetMoveType(EAISimulateMoveType(1));
            local_84.SetSimulateState(EAIPathSimulateState(0));
            local_84.SetbHasTrigger(false);
            bool local_8 = true;
            local_87 = local_8;
            int local_88 = 1;
            for (; local_88 < OriginalPositions.Num(); ++local_88)
            {
                if (ModifiedPositions[local_7_2].Equals(OriginalPositions[local_88], 2.0))
                {
                    local_8 = false;
                    local_87 = local_8;
                    break;
                }
            }
            local_84.SetbIsObstacleDetour((local_87 != 0));
            C_Simulate.GetSimulateList().Add(local_84);
            ++local_7_2;
        }
        C_Simulate.GetSimulateList().Append(local_4);
        C_Simulate.SetCurrentSimulateIndex(RunStart);
        Has local_96;
        bool local_8_2 = local_96.opCall();
        if (local_8_2)
        {
            Remove local_100;
            local_100.opCall();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SimulateMoveDataSync() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_60;
        int local_188 = 0;
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
                this.Job_SimulateMoveDataSync(local_6, local_40, local_42, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_Transform> local_56;
                local_56.opCall(local_42);
                local_60.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_98).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_98.Iterator();
        for (; local_150.CanProceed;)
        {
            local_40 = local_150.Proceed();
            ++local_116;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_SimulateMoveDataSync(local_6, local_188, local_42, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_Transform>(local_40).opCall(local_42);
            local_60.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SimulateMove() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_60;
        int local_188 = 0;
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
                this.Job_SimulateMove(local_6, local_40, local_42, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_Transform> local_56;
                local_56.opCall(local_42);
                local_60.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_98).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_98.Iterator();
        for (; local_150.CanProceed;)
        {
            local_40 = local_150.Proceed();
            ++local_116;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_SimulateMove(local_6, local_188, local_42, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_Transform>(local_40).opCall(local_42);
            local_60.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ObstacleDetourCheck() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_60;
        int local_192 = 0;
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
                this.ServerJob_ObstacleDetourCheck(local_6, local_40, local_42, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_Transform> local_56;
                local_56.opCall(local_42);
                local_60.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_120 = 0;
        FECSRuntimeViewIterator local_154 = local_98.Iterator();
        for (; local_154.CanProceed;)
        {
            local_40 = local_154.Proceed();
            ++local_120;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_ObstacleDetourCheck(local_6, local_192, local_42, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_Transform>(local_40).opCall(local_42);
            local_60.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_120);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

namespace AIPathSimulateHelper
{
bool IsEntityInAir(const FECSEntity &inout Entity)
{
    if (CVar_AI_UseMovementControlAirCheck.GetBool())
    {
        Get local_6;
        const FC_CharacterMovementControl& local_8 = local_6.opCall();
        if (local_8)
        {
            return local_8.GetbFlyingMovement() && !(local_8.GetbFlyFloating());
        }
        return false;
    }
    Get local_14;
    const FC_CharacterMovement& local_16 = local_14.opCall();
    if (local_16)
    {
        return local_16.GetbAirborne();
    }
    return false;
}
}
