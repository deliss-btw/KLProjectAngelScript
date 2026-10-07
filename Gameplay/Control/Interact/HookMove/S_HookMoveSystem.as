
const FConsoleVariable CVar_HookMovePowFactor = FConsoleVariable();

class US_HookMoveSystem : UECSScriptSystem
{
    UPROPERTY()
    float32 TurnSpeedYaw = 720.0f;


    UFUNCTION()
    void Job_TickRuntimeHookMoveTarget(FC_RuntimeHookMoveTarget &inout RuntimeHookMoveTarget, const FC_Transform &inout Transform, const FC_Collision &inout Collision) const
    {
        if (!(RuntimeHookMoveTarget.GetbUseDefaultTarget()))
        {
            RuntimeHookMoveTarget.SetFinalTargetLocation(RuntimeHookMoveTarget.GetInitTargetLocation());
            FVector local_14 = (RuntimeHookMoveTarget.GetFinalTargetLocation() + FVector(RuntimeHookMoveTarget.GetTargetRangeConfig().GetOffset()));
            RuntimeHookMoveTarget.SetFinalTargetLocation(local_14);
            FVector local_14_2 = (RuntimeHookMoveTarget.GetFinalTargetLocation() + FVector(0.0, 0.0, Collision.GetScaledHalfHeight()));
            RuntimeHookMoveTarget.SetFinalTargetLocation(local_14_2);
            if (RuntimeHookMoveTarget.GetTargetRangeConfig().GetCrossOverRadius() > 0.0f)
            {
                FVector local_8_2 = (RuntimeHookMoveTarget.GetFinalTargetLocation() + ((FVector(RuntimeHookMoveTarget.GetTargetLocation()) - Transform.GetPosition()).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector) * RuntimeHookMoveTarget.GetTargetRangeConfig().GetCrossOverRadius()));
                RuntimeHookMoveTarget.SetFinalTargetLocation(local_8_2);
            }
            FVector local_8_3 = (FVector(RuntimeHookMoveTarget.GetTargetLocation()) - Transform.GetPosition());
            float local_22 = local_8_3.Size2D();
            RuntimeHookMoveTarget.SetTargetLerpRatio(FMath::Max(RuntimeHookMoveTarget.GetTargetLerpRatio(), MathUtils::InverseLerp(float32(local_22), RuntimeHookMoveTarget.GetInitDistanceToTarget(), (RuntimeHookMoveTarget.GetInitDistanceToTarget() * RuntimeHookMoveTarget.GetTargetRangeConfig().GetLockDistRatio()))));
            RuntimeHookMoveTarget.SetTargetLocation(FMath::Lerp(RuntimeHookMoveTarget.GetInitTargetLocation(), RuntimeHookMoveTarget.GetFinalTargetLocation(), RuntimeHookMoveTarget.GetTargetLerpRatio()));
        }
        FVector local_30_2 = (FVector(RuntimeHookMoveTarget.GetTargetLocation()) - Transform.GetPosition());
        RuntimeHookMoveTarget.SetDistanceToTarget(float32(local_30_2.Size2D()));
        return;
    }
    UFUNCTION()
    void Job_TickHookMoveMotion(const FECSEntity &inout Entity, FC_RuntimeHookMoveTarget &inout RuntimeHookMoveTarget, FC_Rigidbody &inout RigidBody, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        FC_HookMoveConfig local_12;
        float32 local_46;
        float32 local_47;
        float32 local_59;
        float32 local_60;
        int local_86 = 0;
        if (FFPTime(RuntimeHookMoveTarget.GetTotalMoveTime()).opCmp(0.0) < 0)
        {
            return;
        }
        FFPTime local_2 = (RuntimeHookMoveTarget.GetTotalMoveTime() + FixedTime.DeltaTime);
        RuntimeHookMoveTarget.SetTotalMoveTime(local_2);
        if (!(local_12))
        {
            return;
        }
        FVector local_28 = (FVector(RuntimeHookMoveTarget.GetTargetLocation()) - Transform.GetPosition());
        FVector3f local_31 = FVector3f(local_28);
        float32 local_33 = local_31.Size();
        float32 local_32 = local_31.Size2D();
        float32 local_34 = float32((RuntimeHookMoveTarget.GetFinalTargetLocation().Z - Transform.GetPosition().Z));
        FVector local_28_2 = (FVector(RuntimeHookMoveTarget.GetFinalTargetLocation()) - Transform.GetPosition());
        FVector3f local_15 = FVector3f(local_28_2);
        float32 local_35 = local_15.Size2D();
        FVector3f local_50;
        if (local_35 > 0.0f)
        {
            local_46 = local_15.X;
            local_46 = local_46 / local_35;
            local_50 = FVector3f(local_46, (local_15.Y / local_35), 0.0f);
        }
        else
        {
            local_50 = FVector3f::ZeroVector;
        }
        float local_4_2 = RuntimeHookMoveTarget.GetTotalMoveTime().ToSeconds();
        local_46 = local_12.SpeedCurve.GetFloatValue(float32(local_4_2), 0.0f);
        float32 local_51 = local_46 * local_12.MoveSpeed;
        if (local_32 > 0.0f && (local_12.HorizontalSpeedByDistCurve.GetNumKeys() > 0))
        {
            float32 local_55 = (local_12.HorizontalSpeedByDistCurve.GetFloatValue(local_32, 0.0f) * local_33) / local_32;
            local_46 = FMath::Min(local_46, local_55);
        }
        float32 local_42_2 = local_12.MoveSpeed;
        float32 local_52_2 = local_46 * local_42_2;
        if (local_33 > 0.0f)
        {
            local_42_2 = local_52_2 * local_32;
            local_47 = local_42_2 / local_33;
        }
        else
        {
            local_47 = 0.0f;
        }
        if (local_33 > 0.0f)
        {
            float32 local_58;
            local_42_2 = local_52_2 * local_31.Z;
            local_58 = local_42_2 / local_33;
        }
        else
        {
            float32 local_58;
            local_58 = 0.0f;
        }
        if (!(local_12.ApproachConfig.GetbAccurateApproach()))
        {
            return;
        }
        local_59 = CVar_HookMovePowFactor.GetFloat();
        local_60 = local_12.ApproachConfig.GetMaxApproachTime();
        if (!(RuntimeHookMoveTarget.GetbIsApproaching()) && (local_47 > 0.0f))
        {
            float32 local_58;
            float32 local_56_2 = local_59 + 1.0f;
            local_42_2 = local_32 * local_56_2;
            local_56_2 = local_42_2 / local_47;
            if (local_56_2 < local_60)
            {
                RuntimeHookMoveTarget.SetbIsApproaching(true);
                RuntimeHookMoveTarget.SetApproachingVerticalSpeed(local_58);
            }
        }
        FVector local_66;
        if (RuntimeHookMoveTarget.GetbIsApproaching())
        {
            float32 local_58;
            float32 local_70;
            local_58 = RuntimeHookMoveTarget.GetApproachingVerticalSpeed();
            float local_38_2 = FixedTime.DeltaTime.ToSeconds();
            float32 local_56_3 = float32(local_38_2);
            local_42_2 = local_32 * (local_59 + 1.0f);
            float32 local_55_2 = local_42_2 / FMath::Max(local_47, 0.001f);
            float32 local_57 = FMath::Clamp(local_55_2, local_56_3, local_60);
            if (local_55_2 != local_57)
            {
                local_55_2 = local_57;
            }
            local_70 = local_12.ApproachConfig.GetFinalDownSpeed();
            float32 local_69 = local_34 * 2.0f;
            float32 local_68 = local_69 / local_55_2;
            local_69 = local_68 + local_70;
            local_58 = FMath::Max(local_58, local_69);
            local_42_2 = local_58 + local_70;
            local_68 = local_42_2 / local_55_2;
            RuntimeHookMoveTarget.SetApproachingVerticalSpeed(local_58 - (FMath::Max(1980.0f, local_68) * local_56_3));
            float32 local_71 = local_58 + RuntimeHookMoveTarget.GetApproachingVerticalSpeed();
            float32 local_67 = local_71 / 2.0f;
            FVector local_28_3 = FVector(local_50);
            local_66 = ((local_28_3 * local_47) + FVector(0.0, 0.0, local_67));
            local_66 = local_66.GetClampedToMaxSize(local_51);
        }
        else
        {
            float32 local_58;
            FVector local_28_4 = FVector(local_50);
            FVector local_22_2 = (local_28_4 * local_47);
            FVector local_28_5 = (FVector(FVector::UpVector) * local_58);
            local_66 = (local_22_2 + local_28_5);
        }
        local_86.SetPosDelta((local_66 * FixedTime.DeltaTime.ToSeconds()));
        local_86.SetHorizontalWeight(1.0f);
        local_86.SetVerticalWeight(1.0f);
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveSplineMoveParam(const FECSEntity &inout Entity, const FC_RuntimeSplineMoveState &inout RuntimeSplineMoveState) const
    {
        if (Entity.IsValid())
        {
            Remove local_6;
            local_6.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_TickRuntimeSplineMove(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_RuntimeSplineMoveState &inout RuntimeSplineMoveState) const
    {
        int local_24 = 0;
        int local_90 = 0;
        if ((FECSEntity(RuntimeSplineMoveState.GetSplineEntity()) == ENTITY_NULL))
        {
            return;
        }
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        Get local_16;
        USplineComponent local_12 = local_16.opCall().GetSpline();
        if (local_12 == nullptr)
        {
            return;
        }
        float32 local_31 = float32(ECS::GetContextDeltaTime().ToSeconds());
        FTransform local_84 = local_12.GetTransformAtSplinePoint((local_12.GetNumberOfSplinePoints() - 1), ESplineCoordinateSpace(1), false);
        local_90.SetPosDelta(FVector::ZeroVector);
        local_90.SetYawDelta(0.0f);
        local_90.SetHorizontalWeight(1.0f);
        local_90.SetVerticalWeight(1.0f);
        local_90.SetYawWeight(1.0f);
        FVector local_96 = Transform.GetPosition();
        float32 local_25 = float32(Transform.GetRotation().Rotator().Yaw);
        if (RuntimeSplineMoveState.GetbReachedPeak())
        {
            this.FallToSplineEnd(Entity, local_96, local_25, local_84, RuntimeSplineMoveState, local_90, local_31);
            return;
        }
        this.MoveAlongSpline(Entity, local_96, local_25, local_84, local_12, local_24, RuntimeSplineMoveState, local_90, local_31);
        return;
    }
    void FallToSplineEnd(const FECSEntity &inout Entity, const FVector &inout CharacterLocation, const float32 CharacterYaw, const FTransform &inout MoveEndTrans, FC_RuntimeSplineMoveState &inout RuntimeSplineMoveState, FC_CustomMotion &inout CustomMotion, const float32 DeltaTime) const
    {
        CustomMotion.SetPosDelta((FVector(RuntimeSplineMoveState.GetFallToEndVelocity()) * DeltaTime));
        float32 local_33 = float32((MoveEndTrans.GetRotation().Rotator().Yaw - CharacterYaw));
        CustomMotion.SetYawDelta(local_33);
        RuntimeSplineMoveState.GetModify_FallToEndVelocity().Z = (RuntimeSplineMoveState.GetModify_FallToEndVelocity().Z + (RuntimeSplineMoveState.GetFallToEndAccelerationZ() * DeltaTime));
        RuntimeSplineMoveState.SetFallToEndTimeLeft((RuntimeSplineMoveState.GetFallToEndTimeLeft() - DeltaTime));
        float32 local_33_4 = RuntimeSplineMoveState.GetFallToEndTimeLeft();
        if (local_33_4 <= 0.0f)
        {
            RuntimeSplineMoveState.SetbIsMoving(false);
        }
        return;
    }
    void MoveAlongSpline(const FECSEntity &inout Entity, const FVector &inout CharacterLocation, const float32 CharacterYaw, const FTransform &inout MoveEndTrans, const USplineComponent Spline, const FC_SplineMoveConfig &inout SplineMoveConfig, FC_RuntimeSplineMoveState &inout RuntimeSplineMoveState, FC_CustomMotion &inout CustomMotion, const float32 DeltaTime) const
    {
        bool local_13;
        float32 local_2 = RuntimeSplineMoveState.GetConfigSpeed() * DeltaTime;
        float32 local_1 = this.TurnSpeedYaw * DeltaTime;
        FVector local_20;
        if (RuntimeSplineMoveState.GetCurrentOffsetIndex() >= 0)
        {
            local_20 = SplineMoveConfig.SplineOffsets[RuntimeSplineMoveState.GetCurrentOffsetIndex()];
        }
        else
        {
            local_20 = FVector::ZeroVector;
        }
        FVector local_48 = (MoveEndTrans.GetLocation() + MoveEndTrans.GetRotation().RotateVector(local_20));
        if (RuntimeSplineMoveState.GetbUseRootMotionSpeed())
        {
            Has local_52;
            if (!(local_52.opCall()))
            {
                local_13 = false;
            }
            else
            {
                Has local_56;
                local_13 = local_56.opCall();
            }
            if (local_13)
            {
                Get local_62;
                local_2 = float32(local_62.opCall().PosDelta.Size());
                local_2 = local_2 * RuntimeSplineMoveState.GetRootMotionSpeedPct();
            }
            else
            {
                Get local_68;
                const FC_Rigidbody& local_70 = local_68.opCall();
                if (local_70)
                {
                    local_2 = float32(local_70.GetVelocity().Size()) * DeltaTime;
                }
            }
        }
        else
        {
            if (RuntimeSplineMoveState.GetbHasSpeedFromCurve())
            {
                local_2 = RuntimeSplineMoveState.GetSpeedFromCurve() * DeltaTime;
            }
        }
        if (RuntimeSplineMoveState.GetbMovingToStart())
        {
            float32 local_85;
            FVector local_10 = RuntimeSplineMoveState.GetCurrentOffsetIndex() >= 0 ? RuntimeSplineMoveState.GetStartLocationOnSpline() : Spline.GetLocationAtSplinePoint(0, ESplineCoordinateSpace(1));
            FVector local_42 = (local_10 - CharacterLocation);
            float local_64_2 = local_42.Size();
            float32 local_3 = float32(local_64_2);
            if (local_3 < local_2)
            {
                RuntimeSplineMoveState.SetbMovingToStart(false);
                local_2 = local_2 - local_3;
                RuntimeSplineMoveState.SetDistanceOnSpline(SplineMoveConfig.StartDistanceOnSpline);
            }
            else
            {
                CustomMotion.SetPosDelta((local_42.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * local_2));
                local_64_2 = local_42.Rotation().Yaw;
                local_64_2 = local_64_2 - CharacterYaw;
                local_85 = float32(local_64_2);
                CustomMotion.SetYawDelta(local_85);
            }
        }
        if (!(RuntimeSplineMoveState.GetbMovingToStart()) && (local_2 > 0.0f))
        {
            float32 local_85;
            local_85 = RuntimeSplineMoveState.GetDistanceOnSpline();
            local_85 = local_85 + local_2;
            RuntimeSplineMoveState.SetDistanceOnSpline(local_85);
            local_85 = RuntimeSplineMoveState.GetDistanceOnSpline();
            FTransform local_144 = Spline.GetTransformAtDistanceAlongSpline(local_85, ESplineCoordinateSpace(1), false);
            FRotator local_92 = local_144.Rotator();
            FVector local_26 = (local_144.GetLocation() + local_92.RotateVector(local_20));
            CustomMotion.SetPosDelta((local_26 - CharacterLocation));
            local_85 = float32((local_92.Yaw - CharacterYaw));
            CustomMotion.SetYawDelta(local_85);
            local_85 = RuntimeSplineMoveState.GetPeakDistanceOnSpline();
            if (local_85 > 0.0f && ((RuntimeSplineMoveState.GetDistanceOnSpline() > RuntimeSplineMoveState.GetPeakDistanceOnSpline())))
            {
                RuntimeSplineMoveState.SetbReachedPeak(true);
                FVector local_84 = (FVector(CustomMotion.GetPosDelta()) / DeltaTime);
                float local_94 = local_84.Size2D();
                float32 local_151 = float32(local_94);
                FVector local_42_2 = (local_48 - local_26);
                RuntimeSplineMoveState.SetFallToEndVelocity(local_84);
                if (local_151 > 0.0f)
                {
                    local_94 = local_42_2.Size2D();
                    local_85 = float32(local_94) / local_151;
                    RuntimeSplineMoveState.SetFallToEndTimeLeft(local_85);
                    if (local_85 > 0.0f)
                    {
                        local_94 = RuntimeSplineMoveState.GetFallToEndVelocity().Z;
                        local_94 = local_42_2.Z - (float32(local_94) * local_85);
                        RuntimeSplineMoveState.SetFallToEndAccelerationZ((float32(local_94) * 2.0f) / (local_85 * local_85));
                    }
                }
            }
            else
            {
                local_85 = RuntimeSplineMoveState.GetSplineTotalLength();
                if (RuntimeSplineMoveState.GetDistanceOnSpline() > local_85)
                {
                    RuntimeSplineMoveState.SetDistanceOnSpline(local_85);
                    CustomMotion.SetPosDelta((local_48 - CharacterLocation));
                    CustomMotion.SetYawDelta(float32((MoveEndTrans.GetRotation().Rotator().Yaw - CharacterYaw)));
                    RuntimeSplineMoveState.SetbIsMoving(false);
                }
            }
        }
        float32 local_159 = float32(FRotator::NormalizeAxis(CustomMotion.GetYawDelta()));
        if (FMath::Abs(local_159) > local_1)
        {
            float32 local_85;
            local_85 = FMath::Sign(local_159);
            CustomMotion.SetYawDelta(local_85 * local_1);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TickSuperHookFlyItem(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, FC_SuperHookFlyItem &inout SuperHookFlyItem) const
    {
        USplineComponent local_14;
        bool local_15;
        int local_116 = 0;
        float local_8 = (FFPTime(FixedTime.Time) - SuperHookFlyItem.StartTime).ToSeconds();
        float32 local_9 = float32(local_8);
        if (local_14 != nullptr)
        {
            FC_SplineMoveConfig local_22;
            float32 local_23 = local_9;
            if (SuperHookFlyItem.MovementConfig.DistanceCurveTime > 0.0f)
            {
                local_23 = local_9 / SuperHookFlyItem.MovementConfig.DistanceCurveTime;
            }
            SuperHookFlyItem.DistanceAtSpline = FMath::Min(((SuperHookFlyItem.MovementConfig.DistanceCurve.GetFloatValue(local_23, 0.0f)) * SuperHookFlyItem.MovementConfig.DistanceCurveValuePct), local_14.GetSplineLength());
            float32 local_25 = FMath::Clamp((SuperHookFlyItem.DistanceAtSpline / local_22.StartDistanceOnSpline), 0.0f, 1.0f);
            FTransform local_80 = local_14.GetTransformAtDistanceAlongSpline(SuperHookFlyItem.DistanceAtSpline, ESplineCoordinateSpace(1), false);
            FVector local_86(local_80.GetLocation());
            FRotator local_104 = local_80.Rotator();
            if (!(SuperHookFlyItem.OwnerPlayerEntity.IsValid()))
            {
                local_15 = false;
            }
            else
            {
                Has local_108;
                local_15 = local_108.opCall();
            }
            if (local_15)
            {
                if (local_116.GetCurrentOffsetIndex() >= 0)
                {
                    FVector local_130 = (FVector(local_22.SplineOffsets[local_116.GetCurrentOffsetIndex()]) * local_25);
                    local_86 += local_104.RotateVector(local_130);
                }
            }
            Entity.MoveTo(local_86.AddZ(SuperHookFlyItem.MovementConfig.OffsetZ), local_104.Quaternion(), FFPTime(-1));
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickRuntimeHookMoveTarget() const
    {
        int local_36 = 0;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_56;
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
                this.Job_TickRuntimeHookMoveTarget(local_36, local_42, local_48);
                local_56.opCall(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_94).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_94.Iterator();
        for (; local_150.CanProceed;)
        {
            const FECSEntity& local_186 = local_150.Proceed();
            ++local_116;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_186.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_186);
            this.Job_TickRuntimeHookMoveTarget(local_36, local_42, local_48);
            local_56.opCall(local_36);
        }
        local_2.UpdateCachedEntityCount(local_116);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickHookMoveMotion() const
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
                this.Job_TickHookMoveMotion(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_42);
                local_66.opCall(local_48);
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
            this.Job_TickHookMoveMotion(local_198, local_42, local_48, local_54, local_6);
            local_62.opCall(local_42);
            local_66.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_126);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveSplineMoveParam() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorRuntimeSplineMoveStateOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveSplineMoveParam(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickRuntimeSplineMove() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_180 = 0;
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
                this.Job_TickRuntimeSplineMove(local_36, local_38, local_44);
                local_52.opCall(local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_TickRuntimeSplineMove(local_180, local_38, local_44);
            local_52.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickSuperHookFlyItem() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
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
                this.ServerJob_TickSuperHookFlyItem(local_40, local_6, local_42);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_TickSuperHookFlyItem(local_174, local_6, local_42);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

