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
        int local_16 = 0;
        int local_4 = this.bOverrideMaxDistance;
        ::FLockTargetUtils::EnterSoftLock(Context.GetEntity(), WorldTime, (local_4 != 0), this.OverrideMaxDistance.GetValue(Context.GetEntityBB()), false, this.bWriteMultiLockTargetExtraInfo, this.Config);
        FECSEntity local_8;
        int local_9 = -1;
        if (!(local_16))
        {
            local_4 = 0;
        }
        else
        {
            local_4 = (int(local_16.GetType()) != 2);
        }
        if (local_4 != 0)
        {
            local_8 = local_16.GetTargetEntity();
            local_9 = local_16.GetLockPointIndex();
        }
        ::FLockTargetUtils::ExitSoftLock(Context.GetEntity(), WorldTime, (this.bOverrideMaxDistance), this.OverrideMaxDistance.GetValue(Context.GetEntityBB()), false, false, (this.bRepickTargetWhenExit), this.Config, local_8, local_9);
        return;
    }
}

