

class UESMAction_CharacterFootLockInfo : UESMBPBaseSpanAction
{
    UPROPERTY()
    float32 FootLockDecreaseSpeed = 15.0f;
    UPROPERTY()
    float32 FootLockRecoverSpeed = 5.0f;
    UPROPERTY()
    float32 FootLockInputChangeAngle = 30.0f;
    UPROPERTY()
    float32 FootLockInputChangeDuration = 0.3f;
    UPROPERTY()
    float32 FootLockQuickChangeThreshold = 0.4f;
    UPROPERTY()
    float32 FootLockCirclingUnlockCycles = 1.6f;
    UPROPERTY()
    float32 FootLockCirclingUnlockDuration = 0.8f;
    UPROPERTY()
    float32 StopStartTransitionDecreaseSpeed = 15.0f;
    UPROPERTY()
    float32 StopStartTransitionRecoverSpeed = 5.0f;
    UPROPERTY()
    float32 StopStartTransitionDuration = 0.3f;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_CharacterFootLockInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetFootLockDecreaseSpeed(this.FootLockDecreaseSpeed);
            local_6.SetFootLockRecoverSpeed(this.FootLockRecoverSpeed);
            local_6.SetFootLockInputChangeAngle(this.FootLockInputChangeAngle);
            local_6.SetFootLockInputChangeDuration(this.FootLockInputChangeDuration);
            local_6.SetFootLockQuickChangeThreshold(this.FootLockQuickChangeThreshold);
            local_6.SetFootLockCirclingUnlockCycles(this.FootLockCirclingUnlockCycles);
            local_6.SetFootLockCirclingUnlockDuration(this.FootLockCirclingUnlockDuration);
            local_6.SetStopStartTransitionDecreaseSpeed(this.StopStartTransitionDecreaseSpeed);
            local_6.SetStopStartTransitionRecoverSpeed(this.StopStartTransitionRecoverSpeed);
            local_6.SetStopStartTransitionDuration(this.StopStartTransitionDuration);
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

