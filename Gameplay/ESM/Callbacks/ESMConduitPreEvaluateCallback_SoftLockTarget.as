

class UESMConduitPreEvaluateCallback_SoftLockTarget : UESMConduitPreEvaluateCallback
{
    UPROPERTY()
    ULockTargetConfig Config;
    UPROPERTY()
    bool bOverrideMaxDistance = false;
    UPROPERTY()
    FESMBBVar_Float OverrideMaxDistance = 0.0f;
    UPROPERTY()
    bool bRepickTargetWhenExit = false;
    UPROPERTY()
    bool bWriteMultiLockTargetExtraInfo = true;


    UFUNCTION()
    void OnPreEvaluate_Implementation(const FESMContext &inout Context, const FFPTime &inout WorldTime) const
    {
        int local_1 = 0;
        int local_16 = 0;
        ::FLockTargetUtils::EnterSoftLock(Context.GetEntity(), WorldTime, this.bOverrideMaxDistance, local_1, false, this.bWriteMultiLockTargetExtraInfo, this.Config);
        FECSEntity local_8;
        float32 local_9 = 0.0f;
        if (local_16 && (int(local_16.GetType()) != 2))
        {
            local_8 = local_16.GetTargetEntity();
            local_9 = local_16.GetLockPointIndex();
        }
        ::FLockTargetUtils::ExitSoftLock(Context.GetEntity(), WorldTime, this.bOverrideMaxDistance, local_1, false, false, this.bRepickTargetWhenExit, this.Config, local_8, local_9);
        return;
    }
}

