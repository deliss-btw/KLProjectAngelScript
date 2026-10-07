

class UESMAction_RootMotionScaleTweak : UESMBPBaseSpanAction
{
    UPROPERTY()
    FESMBBVar_Float HorizontalScale = 1.0f;
    UPROPERTY()
    FESMBBVar_Float VerticalScale = 1.0f;
    UPROPERTY()
    FESMBBVar_Float YawScale = 1.0f;

    UESMAction_RootMotionScaleTweak()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        this.UpdateExtraScale(Context, Time);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    void UpdateExtraScale(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        float32 local_7 = 0.0f;
        float32 local_8 = 0.0f;
        local_7 = local_7 - 1.0f;
        local_6.SetExtraHorizontalScale(local_7);
        local_8 = local_8 - 1.0f;
        local_6.SetExtraVerticalScale(local_8);
        local_7 = local_7 - 1.0f;
        local_6.SetExtraYawScale(local_7);
        return;
    }
}

