

class UESMAction_SplineMoveRootMotion : UESMAction_SplineMoveRootMotionBase
{
    UPROPERTY()
    bool bScaleRootMotionSpeedBySplinePeak = true;
    UPROPERTY()
    float32 RootMotionSpeedPct = 1.0f;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_2 = 0;
        bool local_7;
        local_2.SetbUseRootMotionSpeed(true);
        local_2.SetRootMotionSpeedPct(this.RootMotionSpeedPct);
        if (this.bScaleRootMotionSpeedBySplinePeak)
        {
            float32 local_8 = this.CalcRootMotionLength(Context);
            Has local_14;
            if (!(local_14.opCall()))
            {
                local_7 = false;
            }
            else
            {
                Has local_18;
                local_7 = local_18.opCall();
            }
            if (local_7)
            {
                FC_SplineInfo local_32;
                if (local_32)
                {
                    float32 local_37;
                    if (local_32.GetSpline() == nullptr)
                    {
                        return;
                    }
                    local_37 = local_32.PeekPointSplineDistance;
                    if ((local_37 > 0.0f && (local_8 > 0.0f)))
                    {
                        local_2.SetPeakDistanceOnSpline(local_37);
                        float32 local_9 = local_37 / local_8;
                        local_2.SetRootMotionSpeedPct(local_9);
                        local_2.SetbReachedPeak(false);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_RuntimeSplineMoveState& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetbUseRootMotionSpeed(false);
        }
        return;
    }
}

