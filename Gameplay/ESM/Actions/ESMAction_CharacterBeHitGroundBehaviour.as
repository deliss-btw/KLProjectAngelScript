

struct FESMCharacterBeHitGroundBehaviourInstanceData
{
    UPROPERTY()
    bool bInProcess;


}

class UESMAction_CharacterBeHitGroundBehaviour : UESMAction_CharacterBeHitBehaviourBase
{
    UPROPERTY()
    bool bAllowRootRotation = false;
    UPROPERTY()
    bool bUseYDirRootAsset = false;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMCharacterBeHitGroundBehaviourInstanceData);
    }
    UFUNCTION()
    EESMActionExitPolicy GetExitPolicy_Implementation() const
    {
        return EESMActionExitPolicy(2);
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void Preview_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time)
    {
        int local_10 = 0;
        int local_16 = 0;
        FFPTime local_2 = FFPTime(Time.ActionLastTime);
        FFPTime local_4 = FFPTime(Time.ActionTime);
        float local_20 = (local_2 / Time.ActionDuration);
        float local_18 = (local_4 / Time.ActionDuration);
        float local_28 = FMath::Lerp(0.0, 1.0, local_20);
        float local_22 = FMath::Lerp(0.0, 1.0, local_18) - local_28;
        float local_32 = local_22 * 500.0;
        FVector local_44 = local_10.GetRotation().GetForwardVector().opNeg().opMul_r(local_32);
        local_16.AddDeltaMove(local_44, Time.WorldTime);
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        this.DisposeEnter(Context, Time);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        this.DisposeExit(Context, Time);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_24 = 0;
        int local_30 = 0;
        FESMCharacterBeHitGroundBehaviourInstanceData& local_2 = this.ModifyInstanceData(Context);
        Has local_6;
        Has local_12;
        Has local_18;
        if (!(local_6.opCall()) || !(local_12.opCall()) || !(local_18.opCall()))
        {
            return;
        }
        FVector local_56 = this.CalculateDeltaMovementRatio(Context, float32(Time.ActionDuration.ToSeconds()), local_30.GetStrikePushBack(), FFPTime(Time.ActionLastTime), FFPTime(Time.ActionTime), 0.0f);
        FVector local_62;
        if (this.bUseYDirRootAsset)
        {
            local_62 = FVector((local_56.Y * local_30.GetStrikePushBack().X), (local_56.Y * local_30.GetStrikePushBack().Y), 0.0);
        }
        else
        {
            local_62 = FVector(local_56.X * local_30.GetStrikePushBack().X, (local_56.X * local_30.GetStrikePushBack().Y), 0.0);
        }
        local_24.AddDeltaMove(local_62, Time.WorldTime);
        if (local_30.GetbRootMotionDisable() && !(local_30.GetbAddRootMotionDisableCounter()))
        {
            FC_RootMotionDisableCounter& local_76;
            local_76.SetCounter((local_76.GetCounter() + 1));
            local_30.SetbAddRootMotionDisableCounter(true);
        }
        else
        {
            FC_RootMotionDisableCounter& local_76;
            if (!(local_30.GetbRootMotionDisable()) && local_30.GetbAddRootMotionDisableCounter())
            {
                Modify local_82;
                local_76 = local_82.opCall();
                if (local_76)
                {
                    local_76.SetCounter((local_76.GetCounter() - 1));
                    if (local_76.GetCounter() == 0)
                    {
                        Remove local_86;
                        local_86.opCall();
                    }
                }
                local_30.SetbAddRootMotionDisableCounter(false);
            }
        }
        return;
    }
    FESMCharacterBeHitGroundBehaviourInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMCharacterBeHitGroundBehaviourInstanceData __r;
        return __r;
    }
    FESMCharacterBeHitGroundBehaviourInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMCharacterBeHitGroundBehaviourInstanceData __r;
        return __r;
    }
    void DisposeEnter(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        FESMCharacterBeHitGroundBehaviourInstanceData& local_2 = this.ModifyInstanceData(Context);
        local_8.SetbProcessed(true);
        local_8.SetProcessActionCounter((local_8.GetProcessActionCounter() + 1));
        if (local_8.GetbRootMotionDisable() && !(local_8.GetbAddRootMotionDisableCounter()))
        {
            ModifyOrAdd local_16;
            FC_RootMotionDisableCounter& local_18 = local_16.opCall();
            if (local_18)
            {
                local_18.SetCounter((local_18.GetCounter() + 1));
            }
            local_8.SetbAddRootMotionDisableCounter(true);
            if (this.bAllowRootRotation)
            {
                Assign local_22;
                local_22.opCall(FC_RootMotionDisableButAllowRotationTag());
            }
        }
        local_2.bInProcess = true;
        return;
    }
    void DisposeExit(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.ClearDeltaMove();
        Modify local_12;
        FC_CharacterPassiveMovement& local_14 = local_12.opCall();
        if (local_14)
        {
            local_14.SetProcessActionCounter((local_14.GetProcessActionCounter() - 1));
            if (local_14.GetbAddRootMotionDisableCounter())
            {
                Modify local_22;
                FC_RootMotionDisableCounter& local_24 = local_22.opCall();
                if (local_24)
                {
                    local_24.SetCounter((local_24.GetCounter() - 1));
                    if (local_24.GetCounter() == 0)
                    {
                        Remove local_28;
                        local_28.opCall();
                    }
                }
                local_14.SetbAddRootMotionDisableCounter(false);
                if (this.bAllowRootRotation)
                {
                    Remove local_32;
                    local_32.opCall();
                }
            }
            if (local_14.GetProcessActionCounter() <= 0)
            {
                local_14.SetbProcessed(false);
            }
        }
        return;
    }
}

struct FESMCharacterBeHitAirBehaviourInstanceData
{
    UPROPERTY()
    float32 Duration;
    UPROPERTY()
    bool bInProcess;
    UPROPERTY()
    float32 MaxCurveHeight = -1.0f;


}

class UESMAction_CharacterBeHitAirBehaviour : UESMAction_CharacterBeHitBehaviourBase
{
    UPROPERTY()
    bool bAllowRootRotation = false;
    UPROPERTY()
    bool bUseYDirRootAsset = false;
    UPROPERTY()
    bool bCalculateSpeedByBlowHeight = false;
    UPROPERTY()
    bool bUseRootMotionZ = false;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMCharacterBeHitAirBehaviourInstanceData);
    }
    UFUNCTION()
    EESMCalculateSpeedType GetCalculatePlaySpeedType_Implementation() const
    {
        if (this.bCalculateSpeedByBlowHeight)
        {
            return EESMCalculateSpeedType(2);
        }
        return EESMCalculateSpeedType(0);
    }
    UFUNCTION()
    bool IsNotifyTypeAllowed_Implementation(const EESMNotifyType InType) const
    {
        return (int(InType) == 1);
    }
    UFUNCTION()
    float32 CalculatePlaySpeed_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_12 = 0;
        if (!(this.bCalculateSpeedByBlowHeight))
        {
            return 1.0f;
        }
        FESMCharacterBeHitAirBehaviourInstanceData local_4;
        if (local_4.MaxCurveHeight <= 0.0f)
        {
            return 1.0f;
        }
        float32 local_14 = FMath::Sqrt(local_4.MaxCurveHeight / FMath::Max(local_12.GetStrikeBlowUpHeight(), 0.01f));
        GetDefaulted local_22;
        local_14 = local_14 * FMath::Sqrt(FMath::Max(local_22.opCall().GetGravityScale(), 0.01f));
        return local_14;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        this.DisposeEnter(Context, Time);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        this.DisposeExit(Context, Time);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_24 = 0;
        int local_30 = 0;
        int local_36 = 0;
        FESMCharacterBeHitAirBehaviourInstanceData& local_2 = this.ModifyInstanceData(Context);
        Has local_6;
        Has local_12;
        Has local_18;
        if (!(local_6.opCall()) || !(local_12.opCall()) || !(local_18.opCall()))
        {
            return;
        }
        local_24.SetbAirborne(true);
        FFPTime local_38 = FFPTime(Time.ActionLastTime);
        FFPTime local_40 = FFPTime(Time.ActionTime);
        if (local_2.MaxCurveHeight == -1.0f)
        {
            local_2.MaxCurveHeight = this.GetMaxCurveZHeight(Context);
        }
        FVector local_62 = this.CalculateDeltaMovementRatio(Context, float32(Time.ActionDuration.ToSeconds()), local_36.GetStrikePushBack(), local_38, local_40, local_2.MaxCurveHeight * 2.0f);
        FVector local_68;
        if (this.bUseYDirRootAsset)
        {
            local_68 = FVector((local_62.Y * local_36.GetStrikePushBack().X), (local_62.Y * local_36.GetStrikePushBack().Y), 0.0);
        }
        else
        {
            local_68 = FVector(local_62.X * local_36.GetStrikePushBack().X, (local_62.X * local_36.GetStrikePushBack().Y), 0.0);
        }
        if (this.bUseRootMotionZ)
        {
            local_68.Z = (local_62.Z * local_2.MaxCurveHeight);
        }
        else
        {
            local_68.Z = (local_62.Z * local_36.GetStrikeBlowUpHeight());
        }
        local_30.AddDeltaMove(local_68, Time.WorldTime);
        if (local_36.GetbRootMotionDisable() && !(local_36.GetbAddRootMotionDisableCounter()))
        {
            FC_RootMotionDisableCounter& local_82;
            local_82.SetCounter((local_82.GetCounter() + 1));
            local_36.SetbAddRootMotionDisableCounter(true);
        }
        else
        {
            FC_RootMotionDisableCounter& local_82;
            if (!(local_36.GetbRootMotionDisable()) && local_36.GetbAddRootMotionDisableCounter())
            {
                Modify local_88;
                local_82 = local_88.opCall();
                if (local_82)
                {
                    local_82.SetCounter((local_82.GetCounter() - 1));
                    if (local_82.GetCounter() == 0)
                    {
                        Remove local_92;
                        local_92.opCall();
                    }
                }
                local_36.SetbAddRootMotionDisableCounter(false);
            }
        }
        return;
    }
    FESMCharacterBeHitAirBehaviourInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMCharacterBeHitAirBehaviourInstanceData __r;
        return __r;
    }
    FESMCharacterBeHitAirBehaviourInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMCharacterBeHitAirBehaviourInstanceData __r;
        return __r;
    }
    void DisposeEnter(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        int local_14 = 0;
        FESMCharacterBeHitAirBehaviourInstanceData& local_2 = this.ModifyInstanceData(Context);
        local_14.SetbAirborne(true);
        local_8.SetbProcessed(true);
        local_8.SetProcessActionCounter((local_8.GetProcessActionCounter() + 1));
        if (local_8.GetbRootMotionDisable() && !(local_8.GetbAddRootMotionDisableCounter()))
        {
            ModifyOrAdd local_22;
            FC_RootMotionDisableCounter& local_24 = local_22.opCall();
            if (local_24)
            {
                local_24.SetCounter((local_24.GetCounter() + 1));
            }
            local_8.SetbAddRootMotionDisableCounter(true);
            if (this.bAllowRootRotation)
            {
                Assign local_28;
                local_28.opCall(FC_RootMotionDisableButAllowRotationTag());
            }
        }
        local_2.bInProcess = true;
        if (local_2.MaxCurveHeight == -1.0f)
        {
            local_2.MaxCurveHeight = this.GetMaxCurveZHeight(Context);
        }
        return;
    }
    void DisposeExit(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.ClearDeltaMove();
        Modify local_18;
        FC_CharacterPassiveMovement& local_20 = local_18.opCall();
        if (local_20)
        {
            local_20.SetProcessActionCounter((local_20.GetProcessActionCounter() - 1));
            if (local_20.GetbAddRootMotionDisableCounter())
            {
                Modify local_28;
                FC_RootMotionDisableCounter& local_30 = local_28.opCall();
                if (local_30)
                {
                    local_30.SetCounter((local_30.GetCounter() - 1));
                    if (local_30.GetCounter() == 0)
                    {
                        Remove local_34;
                        local_34.opCall();
                    }
                }
                local_20.SetbAddRootMotionDisableCounter(false);
                if (this.bAllowRootRotation)
                {
                    Remove local_38;
                    local_38.opCall();
                }
            }
            if (local_20.GetProcessActionCounter() <= 0)
            {
                local_20.SetbProcessed(false);
            }
        }
        return;
    }
}

