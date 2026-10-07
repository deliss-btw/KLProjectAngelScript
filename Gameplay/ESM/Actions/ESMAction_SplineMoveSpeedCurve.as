

class UESMAction_SplineMoveSpeedCurve : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool bScaleStartSpeedByDistance = false;
    UPROPERTY()
    float32 StandardDistance = 1000.0f;
    UPROPERTY()
    float32 StandardStartSpeed = 1000.0f;
    UPROPERTY()
    float32 MinSpeed = 500.0f;
    UPROPERTY()
    float32 MaxSpeed = 10000.0f;
    UPROPERTY()
    FRuntimeFloatCurve SpeedPctCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 1.0f);


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_6;
        FC_RuntimeSplineMoveState& local_2 = local_6.opCall();
        if (local_2)
        {
            FECSWorldPtr local_10 = Context.GetECSWorld();
            Get local_14;
            local_2.SetSpeedCurveStartTime(local_14.opCall().Time);
            local_2.SetStartSpeedOnFromCurve(this.StandardStartSpeed);
            if (this.bScaleStartSpeedByDistance)
            {
                float32 local_15 = local_2.GetSplineTotalLength() - local_2.GetDistanceOnSpline();
                if (local_15 > 0.0f)
                {
                    float32 local_16 = local_15 / this.StandardDistance;
                    local_2.SetStartSpeedOnFromCurve(this.StandardStartSpeed * local_16);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_6;
        FC_RuntimeSplineMoveState& local_2 = local_6.opCall();
        if (local_2)
        {
            local_2.SetbHasSpeedFromCurve(false);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_6;
        FC_RuntimeSplineMoveState& local_2 = local_6.opCall();
        if (local_2)
        {
            float32 local_22;
            FECSWorldPtr local_10 = Context.GetECSWorld();
            Get local_14;
            float32 local_23 = this.SpeedPctCurve.GetFloatValue(float32(((FFPTime(local_14.opCall().Time) - local_2.GetSpeedCurveStartTime()).ToSeconds())), 0.0f);
            local_22 = local_2.GetStartSpeedOnFromCurve() * local_23;
            local_22 = FMath::Clamp(local_22, this.MinSpeed, this.MaxSpeed);
            local_2.SetSpeedFromCurve(local_22);
            local_2.SetbHasSpeedFromCurve(true);
        }
        return;
    }
}

