

class UESMAction_DirectionalPushOut : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    float32 VelocityThreshold = 100.0f;
    UPROPERTY()
    float32 PreventSlideAngle = -1.0f;
    UPROPERTY()
    float32 FullSlideAngle = -1.0f;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_2 = 0;
        local_2.SetVelocityThreshold(this.VelocityThreshold);
        local_2.SetPreventSlideAngle(this.PreventSlideAngle);
        local_2.SetFullSlideAngle(this.FullSlideAngle);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}

