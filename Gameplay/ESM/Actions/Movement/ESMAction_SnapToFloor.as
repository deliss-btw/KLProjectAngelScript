

class UESMAction_SnapToFloor : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool bEnableSnapToFloor = true;
    UPROPERTY()
    bool bSmoothDisableSnapToFloor = false;
    UPROPERTY()
    float32 SnapWeightBlendOutTime = 0.1f;
    UPROPERTY()
    float32 SnapWeightBlendInTime = 0.2f;
    UPROPERTY()
    bool bHoldBlendInWhileIdle = true;
    UPROPERTY()
    float32 IdleRestoreMaxAngle = 0.5f;
    UPROPERTY()
    float32 ResumeHorizontalMoveDistanceCm = 3.0f;
    UPROPERTY()
    uint8 TracePointNum = (3 != 0);
    UPROPERTY()
    float32 TraceRadiusX = 50.0f;
    UPROPERTY()
    float32 TraceRadiusY = 50.0f;
    UPROPERTY()
    float32 UpOffset = 50.0f;
    UPROPERTY()
    float32 DownOffset = 50.0f;
    UPROPERTY()
    float32 MaxSlopeAngle = 60.0f;
    UPROPERTY()
    float32 RollAxisWeight = 1.0f;
    UPROPERTY()
    bool bUseSnapWeightCurve = false;
    UPROPERTY()
    float32 SnapWeight = 1.0f;
    UPROPERTY()
    FRuntimeFloatCurve SnapWeightCurve = FRuntimeCurveUtils::CreateConst(1.0f);
    UPROPERTY()
    float32 SnapWeightCurveBlendInTime = 0.0f;
    UPROPERTY()
    FVector3f TracePointOffset;
    UPROPERTY()
    bool bDisablePositionCorrection = false;
    UPROPERTY()
    bool bForceSnapToFloor = false;
    UPROPERTY()
    int TracePointsPerFrame = 1;
    UPROPERTY()
    float32 PlaneRotationSlerpRatio = 0.25f;
    UPROPERTY()
    float32 RollSmoothFactor = 0.4f;
    UPROPERTY()
    float32 PlaneLocationSlerpRatio = 0.25f;
    UPROPERTY()
    float32 MaxGroundRotationSpeedDegPerSecond = 90.0f;
    UPROPERTY()
    float32 StepRejectGapRatio = 0.55f;
    UPROPERTY()
    float32 StepRejectMinGapCm = 25.0f;
    UPROPERTY()
    float32 StepRejectLargeMinGapCm = 25.0f;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_32 = 0;
        int local_50 = 0;
        Assign local_96;
        Assign local_102;
        int local_106 = 0;
        int local_108 = 0;
        int local_120 = 0;
        bool local_150;
        if (this.bEnableSnapToFloor)
        {
            int local_67;
            int local_65;
            int local_36;
            Remove local_6;
            local_6.opCall();
            Remove local_10;
            local_10.opCall();
            Remove local_14;
            local_14.opCall();
            Assign local_18;
            local_18.opCall(FC_SnapToFloorDirtyTag());
            if (this.bForceSnapToFloor)
            {
                Assign local_24;
                local_24.opCall(FC_ForceSnapToFloorTag());
            }
            local_32.SetTracePointNum(uint8(this.TracePointNum));
            local_32.SetTraceRadiusX(this.TraceRadiusX);
            local_32.SetTraceRadiusY(this.TraceRadiusY);
            local_32.SetUpOffset(this.UpOffset);
            local_32.SetDownOffset(this.DownOffset);
            local_32.SetMaxSlopeAngle(this.MaxSlopeAngle);
            local_32.SetRollAxisWeight(this.RollAxisWeight);
            local_32.SetSnapWeight(this.SnapWeight);
            local_32.SetTracePointOffset(this.TracePointOffset);
            local_32.SetTracePointsPerFrame(this.TracePointsPerFrame);
            local_32.SetPlaneRotationSlerpRatio(this.PlaneRotationSlerpRatio);
            local_32.SetRollSmoothFactor(this.RollSmoothFactor);
            local_32.SetPlaneLocationSlerpRatio(this.PlaneLocationSlerpRatio);
            local_32.SetMaxGroundRotationSpeedDegPerSecond(this.MaxGroundRotationSpeedDegPerSecond);
            local_32.SetStepRejectGapRatio(this.StepRejectGapRatio);
            local_32.SetStepRejectMinGapCm(this.StepRejectMinGapCm);
            local_32.SetStepRejectLargeMinGapCm(this.StepRejectLargeMinGapCm);
            local_32.InitGroundPlaneTraceParams();
            if (this.bUseSnapWeightCurve)
            {
                local_36 = 1000;
                Has local_40;
                bool local_1 = local_40.opCall();
                if (local_1)
                {
                    Get local_44;
                    local_36 = local_44.opCall().GetCurrentWeightQ();
                }
                int local_52 = FMath::Clamp(local_36, 0, 1000);
                local_50.SetBlendStartWeightQ(local_52);
                local_52 = ECS::FlatTimeToFrame(FFPTime(FMath::Max(this.SnapWeightCurveBlendInTime, 0.0f)));
                local_50.SetBlendDurationFrames(local_52);
                local_50.SetCurveDurationFrames(FMath::Max(1, ECS::FlatTimeToFrame(Time.ActionDuration)));
                int local_59 = 33;
                TArray<int16> local_64;
                local_65 = 0;
                for (; local_65 < 33; )
                {
                    int local_69 = FMath::Clamp(FMath::RoundToInt((this.SnapWeightCurve.GetFloatValue((local_65 / 32.0f), 0.0f) * 1000.0f)), 0, 1000);
                    local_64.Add(local_69);
                    ++local_65;
                }
                local_50.SetCurveSamplesQ(local_64);
                int local_68 = local_64[0];
                if (local_50.GetBlendDurationFrames() > 0)
                {
                    local_67 = local_50.GetBlendStartWeightQ();
                }
                else
                {
                    local_67 = local_68;
                }
                local_50.SetCurrentWeightQ(local_67);
            }
            else
            {
                Remove local_74;
                local_74.opCall();
            }
            ModifyOrAdd local_78;
            local_78.opCall();
            ModifyOrAdd local_82;
            local_82.opCall();
            if (this.bDisablePositionCorrection)
            {
                Assign local_86;
                local_86.opCall(FC_SnapToFloorIgnoreCorrectionTag());
            }
            return;
        }
        if (this.bSmoothDisableSnapToFloor)
        {
            int local_67;
            int local_65;
            int local_36;
            Has local_92;
            if (!(local_92.opCall()))
            {
                local_96.opCall(FC_DisableSnapToFloorTag());
                local_102.opCall(FC_SnapToFloorPendingResetTag());
                return;
            }
            Has local_114;
            bool local_1_2 = local_114.opCall();
            if (!(local_1_2))
            {
                local_120.SetCurrentWeightQ(1000);
                local_120.SetBlendElapsedFrames(0);
                local_120.SetBlendDurationFrames(0);
                local_120.SetSuppressRefCount(0);
                local_120.SetPhase(ESnapToFloorApplyWeightPhase(0));
                local_120.SetBlendOutPitchQ(0);
                local_120.SetBlendOutRollQ(0);
                local_120.SetBlendInDurationFrames(0);
                int local_52_2 = local_106.GetTargetRevision();
                local_120.SetWaitTargetRevision(local_52_2);
                local_120.SetbHoldBlendInWhileIdle(true);
                local_120.SetIdleRestoreMaxAngleQ(500);
                local_120.SetResumeHorizontalMoveDistanceQ(30);
                local_120.SetResumeAnchorXQ(0);
                local_120.SetResumeAnchorYQ(0);
                local_120.SetbResumeAnchorInitialized(false);
                local_120.SetResumeMoveTickCount(0);
            }
            else
            {
                int local_52_3 = local_120.GetSuppressRefCount();
                if ((!((local_52_3 >= 0))))
                {
                    local_120.SetSuppressRefCount(0);
                }
            }
            local_65 = local_120.GetSuppressRefCount();
            local_120.SetSuppressRefCount((local_65 + 1));
            if (local_65 == 0)
            {
                FRotator local_138 = FQuat(local_108.GetGroundPlaneRotation()).Rotator();
                int local_52_4 = FMath::RoundToInt((local_138.Pitch * 1000.0));
                local_120.SetBlendOutPitchQ(local_52_4);
                local_52_4 = FMath::RoundToInt((local_138.Roll * 1000.0));
                local_120.SetBlendOutRollQ(local_52_4);
                local_120.SetCurrentWeightQ(1000);
                local_52_4 = local_106.GetTargetRevision();
                local_120.SetWaitTargetRevision(local_52_4);
                this.BeginSmoothBlendOut(local_120);
            }
            else
            {
                int local_52_5 = ECS::FlatTimeToFrame(FFPTime(FMath::Max(this.SnapWeightBlendInTime, 0.0f)));
                int local_69_3 = FMath::Max(FMath::RoundToInt((FMath::Clamp(this.IdleRestoreMaxAngle, 0.0f, 90.0f) * 1000.0f)), 0);
                local_67 = FMath::Max(FMath::RoundToInt((FMath::Clamp(this.ResumeHorizontalMoveDistanceCm, 0.0f, 10000.0f) * 10.0f)), 0);
                if (local_120.GetBlendInDurationFrames() != local_52_5)
                {
                    local_150 = false;
                }
                else
                {
                    bool local_149 = (!(local_120.GetbHoldBlendInWhileIdle()) == !(this.bHoldBlendInWhileIdle));
                    local_150 = local_149;
                }
                if (!(local_150 && (local_120.GetIdleRestoreMaxAngleQ() == local_69_3)))
                {
                }
                else
                {
                    local_36 = local_120.GetResumeHorizontalMoveDistanceQ();
                }
            }
            return;
        }
        local_96.opCall(FC_DisableSnapToFloorTag());
        local_102.opCall(FC_SnapToFloorPendingResetTag());
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_12 = 0;
        Has local_6;
        if (!(this.bEnableSnapToFloor) || !(this.bUseSnapWeightCurve) || !(local_6.opCall()))
        {
            return;
        }
        int local_14 = local_12.GetCurveSamplesQ().Num();
        if (!((local_14 >= 2)))
        {
            return;
        }
        int local_17 = FMath::Max(1, local_12.GetCurveDurationFrames());
        int local_16 = FMath::Clamp(ECS::FlatTimeToFrame(Time.ActionTime), 0, local_17);
        int64 local_22 = local_16;
        int64 local_24 = (local_14 - 1);
        local_22 = local_22 * local_24;
        int64 local_24_2 = local_17;
        int local_15 = FMath::IntegerDivisionTrunc(local_22, local_24_2);
        int local_27 = local_12.GetCurveSamplesQ()[(local_14 - 1)];
        int local_13_2 = local_27;
        if (local_15 < (local_14 - 1))
        {
            int64 local_24_4 = local_22 - (local_15 * local_17);
            int local_27_2 = local_12.GetCurveSamplesQ()[local_15];
            int local_26 = local_27_2;
            int local_27_3 = local_12.GetCurveSamplesQ()[(local_15 + 1)];
            int local_31 = local_27_3;
            int64 local_30 = local_17;
            int local_32 = FMath::IntegerDivisionTrunc(((local_31 - local_26) * local_24_4), local_30);
            local_13_2 = local_26 + local_32;
        }
        int local_32_2 = local_12.GetBlendDurationFrames();
        if (local_32_2 > 0 && (local_16 < local_12.GetBlendDurationFrames()))
        {
            local_32_2 = local_12.GetBlendDurationFrames();
            int64 local_34 = local_32_2;
            int64 local_30_2 = local_16 * 1000;
            local_32_2 = FMath::Clamp(FMath::IntegerDivisionTrunc(local_30_2, local_34), 0, 1000);
            local_30_2 = local_12.GetBlendStartWeightQ() * (1000 - local_32_2);
            local_12.SetCurrentWeightQ(FMath::IntegerDivisionTrunc(local_30_2 + (local_13_2 * local_32_2), 1000));
            return;
        }
        local_12.SetCurrentWeightQ(local_13_2);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_30;
        Remove local_34;
        int local_40 = 0;
        int local_48 = 0;
        if (this.bEnableSnapToFloor)
        {
            Assign local_6;
            local_6.opCall(FC_DisableSnapToFloorTag());
            Assign local_12;
            local_12.opCall(FC_SnapToFloorPendingResetTag());
            if (this.bForceSnapToFloor)
            {
                Remove local_18;
                local_18.opCall();
            }
            if (this.bDisablePositionCorrection)
            {
                Remove local_22;
                local_22.opCall();
            }
            return;
        }
        if (this.bSmoothDisableSnapToFloor)
        {
            Has local_26;
            if (!(local_26.opCall()))
            {
                local_30.opCall();
                local_34.opCall();
                return;
            }
            if (!((local_40.GetSuppressRefCount() > 0)))
            {
                local_40.SetSuppressRefCount(0);
            }
            else
            {
                local_40.SetSuppressRefCount((local_40.GetSuppressRefCount() - 1));
            }
            if (local_40.GetSuppressRefCount() == 0)
            {
                local_48.SetbLastFullRefreshTrusted(false);
                local_40.SetWaitTargetRevision(local_48.GetTargetRevision());
                local_40.SetbResumeAnchorInitialized(false);
                local_40.SetResumeMoveTickCount(0);
                Assign local_52;
                local_52.opCall(FC_SnapToFloorDirtyTag());
                if (int(local_40.GetPhase()) != 1 || (local_40.GetCurrentWeightQ() <= 0))
                {
                    local_40.SetCurrentWeightQ(0);
                    local_40.SetBlendElapsedFrames(0);
                    local_40.SetBlendDurationFrames(0);
                    local_40.SetPhase(ESnapToFloorApplyWeightPhase(ESnapToFloorApplyWeightPhase(3)));
                }
            }
            return;
        }
        local_30.opCall();
        local_34.opCall();
        return;
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return false;
    }
    void BeginSmoothBlendOut(FC_SnapToFloorApplyWeightBlend &inout ApplyWeightBlend) const
    {
        ApplyWeightBlend.SetCurrentWeightQ(FMath::Clamp(ApplyWeightBlend.GetCurrentWeightQ(), 0, 1000));
        ApplyWeightBlend.SetBlendElapsedFrames(0);
        ApplyWeightBlend.SetBlendDurationFrames(ECS::FlatTimeToFrame(FFPTime(FMath::Max(this.SnapWeightBlendOutTime, 0.0f))));
        ApplyWeightBlend.SetBlendInDurationFrames(ECS::FlatTimeToFrame(FFPTime(FMath::Max(this.SnapWeightBlendInTime, 0.0f))));
        ApplyWeightBlend.SetbHoldBlendInWhileIdle(this.bHoldBlendInWhileIdle);
        ApplyWeightBlend.SetIdleRestoreMaxAngleQ(FMath::Max(FMath::RoundToInt(FMath::Clamp(this.IdleRestoreMaxAngle, 0.0f, 90.0f) * 1000.0f), 0));
        ApplyWeightBlend.SetResumeHorizontalMoveDistanceQ(FMath::Max(FMath::RoundToInt(FMath::Clamp(this.ResumeHorizontalMoveDistanceCm, 0.0f, 10000.0f) * 10.0f), 0));
        ApplyWeightBlend.SetResumeAnchorXQ(0);
        ApplyWeightBlend.SetResumeAnchorYQ(0);
        ApplyWeightBlend.SetbResumeAnchorInitialized(false);
        ApplyWeightBlend.SetResumeMoveTickCount(0);
        ApplyWeightBlend.SetPhase(ESnapToFloorApplyWeightPhase(1));
        if (ApplyWeightBlend.GetBlendDurationFrames() <= 0)
        {
            ApplyWeightBlend.SetCurrentWeightQ(0);
            ApplyWeightBlend.SetPhase(ESnapToFloorApplyWeightPhase(2));
        }
        return;
    }
}

