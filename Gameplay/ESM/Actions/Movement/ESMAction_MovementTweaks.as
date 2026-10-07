

class UESMAction_PassThroughCharacter : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool DisableMoveCollision = true;
    UPROPERTY()
    bool DisablePushCollider = true;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_14 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        Has local_6;
        if (local_6.opCall() == false)
        {
            return;
        }
        if (this.DisableMoveCollision)
        {
            local_14.GetMoveCollisionOptions().IncreaseDisableCounter();
        }
        if (this.DisablePushCollider)
        {
            local_14.GetPushColliderOptions().IncreaseDisableCounter();
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_20 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        Has local_6;
        if (local_6.opCall() == false)
        {
            return;
        }
        bool local_8 = !(local_20.GetMoveCollisionOptions().IsActive());
        if (this.DisableMoveCollision)
        {
            local_20.GetMoveCollisionOptions().DecreaseDisableCounter();
        }
        if (this.DisablePushCollider)
        {
            local_20.GetPushColliderOptions().DecreaseDisableCounter();
        }
        return;
    }
}

class UESMAction_IgnoreMovementCollision : UESMBPBaseSpanAction
{
    UESMAction_IgnoreMovementCollision()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_14 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        Has local_6;
        if (local_6.opCall() == false)
        {
            return;
        }
        local_14.SetCounter((local_14.GetCounter() + 1));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        Modify local_6;
        FC_IgnoreMovementCollisionCounter& local_8 = local_6.opCall();
        if (local_8)
        {
            int local_10 = local_8.GetCounter();
            local_8.SetCounter((local_8.GetCounter() - 1));
        }
        return;
    }
}

class UESMAction_MovementSideSlideTweaks : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bEnhanceSlipery = false;
    UPROPERTY()
    float32 SlideEnhanceRatioForStatic = 0.5f;
    UPROPERTY()
    float32 SlideEnhanceRatioForDynamic = 0.5f;
    UPROPERTY()
    float32 NerfSlideAngleForStatic = 0.0f;
    UPROPERTY()
    float32 NerfSlideAngleForDynamic = 90.0f;
    UPROPERTY()
    float32 NerfSlideForwardYaw = 0.0f;
    UPROPERTY()
    float32 SlideDecayRatioForStatic = 0.0f;
    UPROPERTY()
    float32 SlideDecayRatioForDynamic = 0.0f;


    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.bExclusive = true;
        OutParam.IdentifyName = n"SlideTweaks";
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        Modify local_6;
        FC_CharacterMovementNew& local_8 = local_6.opCall();
        if (local_8)
        {
            if (this.bEnhanceSlipery)
            {
                local_8.GetModify_SlideParamForStatic().SetSlideRatio(FKinematicMoveCollisionUtils::GetSlideRatioFromConfigRatio(this.SlideEnhanceRatioForStatic));
                local_8.GetModify_SlideParamForDynamic().SetSlideRatio(FKinematicMoveCollisionUtils::GetSlideRatioFromConfigRatio(this.SlideEnhanceRatioForDynamic));
                return;
            }
            local_8.GetModify_SlideParamForStatic().SetSlideNerf(FKinematicMoveCollisionUtils::GetSlideNerfFromConfigAngle(this.NerfSlideAngleForStatic));
            local_8.GetModify_SlideParamForDynamic().SetSlideNerf(FKinematicMoveCollisionUtils::GetSlideNerfFromConfigAngle(this.NerfSlideAngleForDynamic));
            local_8.SetSlideForwardYaw(this.NerfSlideForwardYaw);
            local_8.GetModify_SlideParamForStatic().SetSlideRatio(FKinematicMoveCollisionUtils::GetSlideRatioFromConfigRatio(-this.SlideDecayRatioForStatic));
            local_8.GetModify_SlideParamForDynamic().SetSlideRatio(FKinematicMoveCollisionUtils::GetSlideRatioFromConfigRatio(-this.SlideDecayRatioForDynamic));
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        Modify local_6;
        FC_CharacterMovementNew& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.SetSlideForwardYaw(0.0f);
        }
        return;
    }
}

