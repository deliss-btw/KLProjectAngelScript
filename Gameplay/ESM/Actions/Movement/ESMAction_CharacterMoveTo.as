

struct FESMCharacterMoveToInstanceData
{
    UPROPERTY()
    FVector DeltaMovement;
    UPROPERTY()
    FRotator DelayTurnRotation = FRotator::ZeroRotator;
    UPROPERTY()
    FRotator MoveDirection = FRotator::ZeroRotator;

    FESMCharacterMoveToInstanceData()
    {
        return;
    }
}

class UESMAction_CharacterMoveTo : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    ECharacterDirectionType DirectionType = ECharacterDirectionType(6);
    UPROPERTY()
    FRuntimeFloatCurve ForwardCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    bool bDisableAdjustDistanceWhenClose = false;
    UPROPERTY()
    FESMBBVar_Float ForwardDistScale = 1.0f;
    UPROPERTY()
    FESMBBVar_Float LockTargetDistanceOffset = 100.0f;
    UPROPERTY()
    bool CalcSelfAndTargetRadius = false;
    UPROPERTY()
    bool bThroughLockTarget = false;
    UPROPERTY()
    FVector2D ForwardBlendInOut = FVector2D(0.1, 0.0);
    UPROPERTY()
    FNameHandle_EntityBBVarVector WorldSpaceLocation;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity CustomEntity;
    UPROPERTY()
    bool bEnableZMovement = false;
    UPROPERTY()
    bool bApplyRightOffset = false;
    UPROPERTY()
    FRuntimeFloatCurve RightOffsetCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    bool bCopyForwardDistToRightOffsetDist = false;
    UPROPERTY()
    FESMBBVar_Float RightOffsetDistScale = 0.0f;
    UPROPERTY()
    bool bEnableDelayTurnSpeed = false;
    UPROPERTY()
    float32 DelayTurnSpeed = 0.0f;
    UPROPERTY()
    FRuntimeFloatCurve DelayTurnWeight = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 1.0f);


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMCharacterMoveToInstanceData);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_14 = 0;
        float32 local_29 = 0.0f;
        float32 local_30 = 0.0f;
        int local_66 = 0;
        float32 local_87 = 0.0f;
        float32 local_88;
        float32 local_105;
        bool local_123;
        bool local_139;
        float32 local_173;
        if (FFPTime(Time.ActionDuration).opCmp(0.0) <= 0)
        {
            return;
        }
        const FECSEntity& local_8 = Context.GetEntity();
        FVector local_20(FVector::ZeroVector);
        FVector local_26(FVector::ZeroVector);
        if (int(this.DirectionType) != 4)
        {
            FVector local_80;
            FQuat local_40;
            if (int(this.DirectionType) == 6 && this.bThroughLockTarget)
            {
                FQuat local_52;
                local_40 = local_52;
            }
            else
            {
                if (int(this.DirectionType) == 8)
                {
                    if (Context.GetEntity().GetBB_Entity(this.CustomEntity).IsValid())
                    {
                        local_80 = (FVector(local_66.GetPosition()) - 0.GetPosition());
                        local_40 = local_80.Rotation().Quaternion();
                    }
                }
                else
                {
                    local_40 = ::FCharacterDirectionUtils::GetTargetRotationQuat(Context.GetEntity(), this.DirectionType, this.bEnableZMovement);
                }
            }
            local_80 = local_40.GetForwardVector();
            local_80 = (local_80.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * local_30);
            local_20 = local_80;
            if (this.bApplyRightOffset)
            {
                local_88 = this.bCopyForwardDistToRightOffsetDist ? local_30 : local_29;
                local_80 = local_40.GetRightVector();
                local_80 = (local_80.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * local_88);
                local_26 = local_80;
            }
        }
        else
        {
            FVector local_104;
            FVector local_80;
            if (int(this.DirectionType) == 4)
            {
                bool local_41 = !(false);
                Has local_92;
                if (!(local_92.opCall()) == local_41)
                {
                    return;
                }
                if (this.bApplyRightOffset)
                {
                    if ((local_20 == FVector::ZeroVector))
                    {
                        local_104 = local_66.GetRotation().GetRightVector();
                    }
                    else
                    {
                        local_80 = local_20.Rotation().Quaternion().GetRightVector();
                        local_104 = local_80;
                    }
                    if (this.bCopyForwardDistToRightOffsetDist)
                    {
                        local_105 = float32(local_20.Size());
                    }
                    else
                    {
                        local_105 = local_87;
                    }
                    local_26 = (local_104 * local_105);
                }
            }
        }
        if (this.bEnableDelayTurnSpeed)
        {
            FESMCharacterMoveToInstanceData& local_108 = this.ModifyInstanceData(Context);
            local_87 = float32((Time.ActionTime.ToSeconds() / Time.ActionDuration.ToSeconds()));
            FRotator local_86 = local_66.GetRotation().Rotator();
            if (this.DelayTurnWeight.GetFloatValue(local_87, 0.0f) > 0.0f)
            {
                local_108.DelayTurnRotation = FMath::LerpShortestPath(local_86, local_108.DelayTurnRotation, this.DelayTurnWeight.GetFloatValue(local_87, 0.0f));
            }
            if (this.DelayTurnSpeed > 0.0f)
            {
                local_108.DelayTurnRotation = FMath::RInterpConstantTo(local_108.DelayTurnRotation, local_86, float32(Time.ActionDeltaTime.ToSeconds()), this.DelayTurnSpeed);
            }
            FRotator local_116 = local_108.DelayTurnRotation;
            local_20 = (local_116 - local_86).RotateVector(local_20);
        }
        local_29 = float32((Time.ActionLastTime.ToSeconds() / Time.ActionDuration.ToSeconds()));
        float local_110_2 = Time.ActionTime.ToSeconds();
        local_110_2 = local_110_2 / Time.ActionDuration.ToSeconds();
        local_88 = float32(local_110_2);
        local_123 = true;
        if (int(this.DirectionType) == 6)
        {
            FVector local_104;
            FVector local_80;
            Get local_128;
            const FC_LockTarget& local_130 = local_128.opCall();
            if (local_130)
            {
                Get local_64;
                local_104 = FVector(local_64.opCall().GetPosition());
                FVector local_138 = local_64.opCall().GetPosition();
                bool local_41_2 = !(false);
                if (!(this.bThroughLockTarget) == local_41_2)
                {
                    if (!(this.bDisableAdjustDistanceWhenClose && local_130.GetbCachedValidLockTargetPosition()))
                    {
                        local_139 = false;
                    }
                    else
                    {
                        local_41_2 = !(local_130.IsEnableLockAdjust(local_8));
                        local_41_2 = (local_41_2 == !(false));
                        local_139 = local_41_2;
                    }
                    if (local_139)
                    {
                        local_123 = false;
                    }
                    else
                    {
                        if (this.bEnableZMovement)
                        {
                            if (local_104.Distance(local_138) < local_87)
                            {
                                local_123 = false;
                            }
                        }
                        else
                        {
                            if (this.CalcSelfAndTargetRadius)
                            {
                                if (::FASCommonUtils::CalculateEntityDistance2D(local_8, local_130.GetTargetEntity(), true) < local_87)
                                {
                                    local_123 = false;
                                }
                            }
                            else
                            {
                                if (local_104.Dist2D(local_138) < local_87)
                                {
                                }
                            }
                        }
                    }
                }
                else
                {
                    Get local_144;
                    float32 local_131 = local_144.opCall().GetScaledRadius();
                    local_30 = local_144.opCall().GetScaledRadius();
                    FVector local_152 = local_80;
                    float32 local_145 = local_87 + local_131;
                    local_110_2 = (local_145 + local_30);
                    local_80 = (local_152 * local_110_2);
                    if (local_152.DotProduct((((local_104 + local_80) - local_138).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector))) < 0.0)
                    {
                        local_123 = false;
                    }
                }
            }
        }
        if (local_123)
        {
            float32 local_145_2 = this.ForwardCurve.GetFloatValue(local_29, 0.0f);
            local_110_2 = (this.ForwardCurve.GetFloatValue(local_88, 0.0f) - local_145_2);
            FVector local_158 = (local_14.GetPosDelta() + (local_20 * local_110_2));
            local_14.SetPosDelta(local_158);
            local_14.SetHorizontalWeight(1.0f);
        }
        if (this.bApplyRightOffset)
        {
            local_87 = this.RightOffsetCurve.GetFloatValue(local_29, 0.0f);
            local_30 = this.RightOffsetCurve.GetFloatValue(local_88, 0.0f);
            local_110_2 = (local_30 - local_87);
            FVector local_158_2 = (local_26 * local_110_2);
            FVector local_164_2 = (local_14.GetPosDelta() + local_158_2);
            local_14.SetPosDelta(local_164_2);
        }
        if (!(this.bEnableZMovement))
        {
            local_14.SetPosDelta(FVector(local_14.GetPosDelta().X, local_14.GetPosDelta().Y, 0.0));
        }
        float32 local_145_3 = float32(this.ForwardBlendInOut.X);
        local_30 = float32(this.ForwardBlendInOut.Y);
        local_87 = float32(Time.ActionTime.ToSeconds());
        float32 local_140 = FMathUtils::InverseLerpPreferTo(local_87, 0.0f, local_145_3);
        float32 local_131_2 = FMathUtils::InverseLerpPreferTo(Time.ActionTime, Time.ActionDuration, (FFPTime(Time.ActionDuration) - FFPTime(local_30)));
        local_87 = local_140 * local_131_2;
        float32 local_167 = local_140 * local_131_2;
        if (local_87 > 0.0f)
        {
            local_105 = local_145_3 / local_87;
        }
        else
        {
            local_105 = 0.0f;
        }
        if (local_167 > 0.0f)
        {
            local_173 = local_145_3 / local_167;
        }
        else
        {
            local_173 = 0.0f;
        }
        float local_4_6 = Time.ActionDeltaTime.ToSeconds();
        local_14.SetHorizontalWeight(MathUtils::FMoveTowardsByDuration(local_14.GetHorizontalWeight(), local_87, float32(local_4_6), local_105));
        if (this.bEnableZMovement)
        {
            local_14.SetVerticalWeight(local_14.GetHorizontalWeight());
        }
        local_4_6 = Time.ActionDeltaTime.ToSeconds();
        local_14.SetYawWeight(MathUtils::FMoveTowardsByDuration(local_14.GetYawWeight(), local_167, float32(local_4_6), local_173));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    FESMCharacterMoveToInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMCharacterMoveToInstanceData __r;
        return __r;
    }
    FESMCharacterMoveToInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMCharacterMoveToInstanceData __r;
        return __r;
    }
}

