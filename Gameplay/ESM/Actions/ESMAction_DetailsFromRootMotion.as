

class UESMAction_DetailsFromRootMotion : UESMBPBaseSpanAction
{
    UPROPERTY()
    FRotator3f AnimForwardDir;
    UPROPERTY()
    float32 BlendAngleMin = 45.0f;
    UPROPERTY()
    float32 BlendAngleMax = 60.0f;
    UPROPERTY()
    float32 MaxExceedYawSpeed = 45.0f;
    UPROPERTY()
    float32 MaxExceedYawSpeedRatio = 1.55f;


    UFUNCTION()
    int GetActionPriority_Implementation() const
    {
        return -1;
    }
    UFUNCTION()
    EESMActionExitPolicy GetExitPolicy_Implementation() const
    {
        return EESMActionExitPolicy(2);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        int local_16 = 0;
        int local_54 = 0;
        local_6.SetStartTime(Time.WorldLastTime);
        local_6.SetEndTime(FFPTime(-1));
        local_6.SetLastSpeed(0.0f);
        local_6.SetDebugDistanceMoved(0.0f);
        local_6.SetAnimForwardDir(this.AnimForwardDir);
        local_6.SetBlendAngleMin(this.BlendAngleMin);
        local_6.SetBlendAngleMax(this.BlendAngleMax);
        local_6.SetMaxExceedYawSpeed(this.MaxExceedYawSpeed);
        local_6.SetMaxExceedYawSpeedRatio(this.MaxExceedYawSpeedRatio);
        local_6.SetBeforeMoveRotation(FRotator3f(local_16.GetRotation().Rotator()));
        local_6.SetTargetMoveDirWorldSpace((FQuat4f(local_16.GetRotation()) * this.AnimForwardDir.Quaternion()).GetForwardVector());
        local_54.SetCounter((local_54.GetCounter() + 1));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        if (local_6)
        {
            local_6.SetEndTime(Time.WorldTime);
        }
        Modify local_14;
        FC_RootMotionInfoNeeded& local_10 = local_14.opCall();
        if (local_10)
        {
            local_10.SetCounter((local_10.GetCounter() - 1));
            if (local_10.GetCounter() <= 0)
            {
                int local_15_2 = local_10.GetCounter();
                Remove local_20;
                local_20.opCall();
            }
        }
        return;
    }
}

class UESMAction_DetailsFromRootMotionParam : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool bApplyYaw = false;
    UPROPERTY()
    bool bAllowTurningBackward = false;
    UPROPERTY()
    bool bApplyDesiredRotationAsMoveInputDir = false;
    UPROPERTY()
    bool bBlendApplyYaw = false;
    UPROPERTY()
    float32 ApplyYawWeightStart = 1.0f;
    UPROPERTY()
    float32 ApplyYawWeightEnd = 0.0f;


    UFUNCTION()
    bool NeedTick_Implementation() const
    {
        return this.bBlendApplyYaw;
    }
    UFUNCTION()
    int GetActionPriority_Implementation() const
    {
        return -2;
    }
    UFUNCTION()
    EESMActionExitPolicy GetExitPolicy_Implementation() const
    {
        return EESMActionExitPolicy(2);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_CharacterAccelerationFromRootMotion& local_6 = local_4.opCall();
        if (local_6)
        {
            if (this.bApplyYaw)
            {
                local_6.SetApplyYawWeight(1.0f);
            }
            if (this.bAllowTurningBackward)
            {
                local_6.SetbAllowTurningBackward(true);
            }
            if (this.bApplyDesiredRotationAsMoveInputDir)
            {
                local_6.SetbUseDesiredRotationAsMoveInputDir(true);
            }
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_17;
        if ((this.bBlendApplyYaw && this.bApplyYaw))
        {
            ModifyOrAdd local_6;
            FC_CharacterAccelerationFromRootMotion& local_8 = local_6.opCall();
            if (local_8)
            {
                FFPTime local_12 = FFPTime(Time.ActionDuration);
                if (local_12.opCmp(0.0) >= 0)
                {
                    local_17 = float32((FFPTime(Time.ActionTime) / Time.ActionDuration));
                }
                else
                {
                    local_17 = 1.0f;
                }
                local_8.SetApplyYawWeight(FMath::Lerp(this.ApplyYawWeightStart, this.ApplyYawWeightEnd, local_17));
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        if (local_6)
        {
            if (this.bApplyYaw)
            {
                local_6.SetApplyYawWeight(0.0f);
            }
            if (this.bAllowTurningBackward)
            {
                local_6.SetbAllowTurningBackward(false);
            }
            if (this.bApplyDesiredRotationAsMoveInputDir)
            {
                local_6.SetbUseDesiredRotationAsMoveInputDir(false);
            }
        }
        return;
    }
}

