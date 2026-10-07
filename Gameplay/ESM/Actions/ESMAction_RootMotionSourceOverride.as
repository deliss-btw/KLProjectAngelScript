
enum ERootMotionOverrideValueSource
{
    FixedSpeed,
    CurvedDistanceOrAngle,
}


struct FRootMotionSourceOverrideAxis
{
    UPROPERTY()
    ERootMotionOverrideModType ModifyType;
    UPROPERTY()
    ERootMotionOverrideValueSource ModifySource;
    UPROPERTY()
    float32 FixedSpeed;
    UPROPERTY()
    FRuntimeFloatCurve DistanceOrAngleCurve;


}

struct FRootMotionSourceOverrideData
{
    UPROPERTY()
    FRootMotionSourceOverrideAxis X;
    UPROPERTY()
    FRootMotionSourceOverrideAxis Y;
    UPROPERTY()
    FRootMotionSourceOverrideAxis Z;
    UPROPERTY()
    FRootMotionSourceOverrideAxis Yaw;

    FRootMotionSourceOverrideData()
    {
        return;
    }
}

class UESMAction_RootMotionSourceOverride : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FRootMotionSourceOverrideData Data;
    UPROPERTY()
    bool bShowPreviewTrajectory = true;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.SpecificStateMachineName = n"MainSM";
        return;
    }
    UFUNCTION()
    bool IsNotifyTypeAllowed_Implementation(const EESMNotifyType InType) const
    {
        return (int(InType) == 1);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_2 = 0;
        int local_10 = 0;
        local_2.SetOverrideMod(ERootMotionOverrideModAxis(0), this.Data.X.ModifyType);
        local_2.SetOverrideMod(ERootMotionOverrideModAxis(1), this.Data.Y.ModifyType);
        local_2.SetOverrideMod(ERootMotionOverrideModAxis(2), this.Data.Z.ModifyType);
        local_2.SetOverrideMod(ERootMotionOverrideModAxis(3), this.Data.Yaw.ModifyType);
        this.ApplyAxisDeltas(local_2, Time);
        this.InitSampleAxisConfigs(local_10);
        this.UpdateSampleTime(local_10, Time);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_6;
        FC_RootMotionOverride& local_2 = local_6.opCall();
        if (local_2)
        {
            this.ApplyAxisDeltas(local_2, Time);
        }
        Modify local_14;
        FC_RootMotionOverrideSampleInfo& local_10 = local_14.opCall();
        if (local_10)
        {
            this.UpdateSampleTime(local_10, Time);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        Remove local_10;
        local_10.opCall();
        return;
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void Gizmos_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time)
    {
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        return;
    }
    void ApplyAxisDeltas(FC_RootMotionOverride &inout Comp, const FESMActionTime &inout Time) const
    {
        float32 local_8;
        float32 local_9;
        float32 local_7 = float32((Time.ActionTime.ToSeconds() - Time.ActionLastTime.ToSeconds()));
        FFPTime local_12 = FFPTime(Time.ActionDuration);
        if (local_12.opCmp(0.0) > 0)
        {
            float local_4_2 = (FFPTime(Time.ActionLastTime) / Time.ActionDuration);
            local_8 = float32(local_4_2);
            local_9 = float32((FFPTime(Time.ActionTime) / Time.ActionDuration));
            if (local_7 < 0.0f)
            {
                float32 local_1 = float32(Time.ActionDuration.ToSeconds());
                local_7 = local_7 + local_1;
            }
        }
        else
        {
            local_8 = float32(Time.ActionLastTime.ToSeconds());
            local_9 = float32(Time.ActionTime.ToSeconds());
        }
        FVector local_20(FVector::ZeroVector);
        float32 local_1_2 = this.ComputeAxisDelta(this.Data.X, local_7, local_8, local_9);
        local_20.X = local_1_2;
        local_1_2 = this.ComputeAxisDelta(this.Data.Y, local_7, local_8, local_9);
        local_20.Y = local_1_2;
        local_1_2 = this.ComputeAxisDelta(this.Data.Z, local_7, local_8, local_9);
        local_20.Z = local_1_2;
        Comp.PosDelta += local_20;
        local_1_2 = this.ComputeAxisDelta(this.Data.Yaw, local_7, local_8, local_9);
        float32 local_27 = Comp.YawDelta + local_1_2;
        return;
    }
    void InitSampleAxisConfigs(FC_RootMotionOverrideSampleInfo &inout SampleInfo) const
    {
        SampleInfo.SetAxisConfig(ERootMotionOverrideModAxis(0), this.Data.X.ModifyType, (int(this.Data.X.ModifySource) == 1), int(this.Data.X.FixedSpeed), this.Data.X.DistanceOrAngleCurve);
        SampleInfo.SetAxisConfig(ERootMotionOverrideModAxis(1), this.Data.Y.ModifyType, (int(this.Data.Y.ModifySource) == 1), int(this.Data.Y.FixedSpeed), this.Data.Y.DistanceOrAngleCurve);
        SampleInfo.SetAxisConfig(ERootMotionOverrideModAxis(2), this.Data.Z.ModifyType, (int(this.Data.Z.ModifySource) == 1), int(this.Data.Z.FixedSpeed), this.Data.Z.DistanceOrAngleCurve);
        SampleInfo.SetAxisConfig(ERootMotionOverrideModAxis(3), this.Data.Yaw.ModifyType, (int(this.Data.Yaw.ModifySource) == 1), int(this.Data.Yaw.FixedSpeed), this.Data.Yaw.DistanceOrAngleCurve);
        return;
    }
    void UpdateSampleTime(FC_RootMotionOverrideSampleInfo &inout SampleInfo, const FESMActionTime &inout Time) const
    {
        FFPTime local_2 = FFPTime(Time.ActionDuration);
        if (local_2.opCmp(0.0) > 0)
        {
            float32 local_7 = float32((FFPTime(Time.ActionLastTime) / Time.ActionDuration));
            local_7 = float32((FFPTime(Time.ActionTime) / Time.ActionDuration));
            local_7 = float32(Time.ActionDuration.ToSeconds());
            float32 local_12 = FMath::Max(float32(((FFPTime(Time.ActionDuration) - Time.ActionTime).ToSeconds())), 0.0f);
            return;
        }
        return;
    }
    float32 ComputeAxisDelta(const FRootMotionSourceOverrideAxis &inout Axis, const float32 DeltaSeconds, const float32 LastT, const float32 T) const
    {
        if (int(Axis.ModifyType) == 0)
        {
            return 0.0f;
        }
        if (int(Axis.ModifySource) == 0)
        {
            return (Axis.FixedSpeed * DeltaSeconds);
        }
        if (T < LastT)
        {
            return (Axis.DistanceOrAngleCurve.GetFloatValue(1.0f, 0.0f) - Axis.DistanceOrAngleCurve.GetFloatValue(LastT, 0.0f)) + (Axis.DistanceOrAngleCurve.GetFloatValue(T, 0.0f) - Axis.DistanceOrAngleCurve.GetFloatValue(0.0f, 0.0f));
        }
        return (Axis.DistanceOrAngleCurve.GetFloatValue(T, 0.0f) - Axis.DistanceOrAngleCurve.GetFloatValue(LastT, 0.0f));
    }
}

