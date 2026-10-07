

class UESMAction_CharacterGroundMovementInfo : UESMBPBaseSpanAction
{
    UPROPERTY()
    float32 PivotSpeedMin = 200.0f;
    UPROPERTY()
    float32 PivotSpeedMax = 550.0f;
    UPROPERTY()
    float32 PivotAngleAtMinSpeed = 70.0f;
    UPROPERTY()
    float32 PivotAngleAtMaxSpeed = 60.0f;
    UPROPERTY()
    float32 OrientationWarpingFullAngle = 15.0f;
    UPROPERTY()
    float32 OrientationWarpingZeroAngle = 45.0f;
    UPROPERTY()
    float32 OrientationWarpingIncreaseSpeed = 5.0f;
    UPROPERTY()
    float32 OrientationWarpingDecreaseSpeed = 8.0f;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_CharacterGroundMovementInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetPivotSpeedMin(this.PivotSpeedMin);
            local_6.SetPivotSpeedMax(this.PivotSpeedMax);
            local_6.SetPivotAngleAtMinSpeed(this.PivotAngleAtMinSpeed);
            local_6.SetPivotAngleAtMaxSpeed(this.PivotAngleAtMaxSpeed);
            local_6.SetOrientationWarpingFullAngle(this.OrientationWarpingFullAngle);
            local_6.SetOrientationWarpingZeroAngle(this.OrientationWarpingZeroAngle);
            local_6.SetOrientationWarpingIncreaseSpeed(this.OrientationWarpingIncreaseSpeed);
            local_6.SetOrientationWarpingDecreaseSpeed(this.OrientationWarpingDecreaseSpeed);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            Remove local_10;
            local_10.opCall();
        }
        return;
    }
}

