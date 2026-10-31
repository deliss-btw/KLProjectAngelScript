class UESMAction_AirMovementFloating : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FESMBBVar_Float FloatingHeightMin = -1.0f;
    UPROPERTY()
    FESMBBVar_Float FloatingHeight = 300.0f;
    UPROPERTY()
    FESMBBVar_Float FloatingAdjustSpeed = 600.0f;

    UESMAction_AirMovementFloating()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        float32 local_10 = 0.0f;
        float32 local_11 = 0.0f;
        float32 local_14 = 0.0f;
        const FECSEntity& local_2 = Context.GetEntity();
        if (local_8)
        {
            local_8.SetbFlyFloating(true);
            float32 local_12 = FMath::Min(local_10, local_11);
            float32 local_13 = FMath::Max(local_10, local_11);
            if (local_12 < 0.0f)
            {
            }
            else
            {
            }
            local_8.SetFloatingHeight(local_13);
            local_8.SetFloatingHeightMin(local_12);
            local_8.SetFloatingAdjustSpeed(local_14);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        if (local_8)
        {
            local_8.SetbFlyFloating(false);
        }
        return;
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.bExclusive = true;
        OutParam.IdentifyName = UESMAction_AirMovementFloating.opArrow().GetFName();
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        bool local_2 = this.IsFloatingHeightParamValid(this.FloatingHeightMin);
        bool local_1 = this.IsFloatingHeightParamValid(this.FloatingHeight);
        if ((local_2 && local_1))
        {
            return FString().Append("空中悬浮模式: 高度范围 [").Append(this.GetFloatingHeightParamStr(this.FloatingHeightMin)).Append("，").Append(this.GetFloatingHeightParamStr(this.FloatingHeight)).Append("], 调整速度 ").Append(this.GetFloatingHeightParamStr(this.FloatingAdjustSpeed)).Append(" ");
        }
        else
        {
            if (local_2)
            {
                return FString().Append("空中悬浮模式: 固定高度 ").Append(this.GetFloatingHeightParamStr(this.FloatingHeightMin)).Append(", 调整速度 ").Append(this.GetFloatingHeightParamStr(this.FloatingAdjustSpeed)).Append(" ");
            }
            else
            {
                if (local_1)
                {
                    return FString().Append("空中悬浮模式: 固定高度 ").Append(this.GetFloatingHeightParamStr(this.FloatingHeight)).Append(", 调整速度 ").Append(this.GetFloatingHeightParamStr(this.FloatingAdjustSpeed)).Append(" ");
                }
                else
                {
                    return FString().Append("空中悬浮模式: 高度非法, 调整速度 ").Append(this.GetFloatingHeightParamStr(this.FloatingAdjustSpeed));
                }
            }
        }
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (!(this.FloatingHeightMin.bReadVar) && !(this.FloatingHeight.bReadVar))
        {
            if (this.FloatingHeightMin.Value < 0.0f && (this.FloatingHeight.Value < 0.0f))
            {
                Info.AddDataInvalidComment(EESMDataValidType(2), "悬浮高度下界和悬浮高度上界不能同时小于0");
                return;
            }
            if (this.FloatingHeight.Value > 0.0f && (this.FloatingHeightMin.Value > this.FloatingHeight.Value))
            {
                Info.AddDataInvalidComment(EESMDataValidType(2), "悬浮高度下界不能大于悬浮高度上界");
            }
        }
        return;
    }
    bool IsFloatingHeightParamValid(const FESMBBVar_Float &inout FloatParam) const
    {
        return (FloatParam.bReadVar || (FloatParam.Value >= 0.0f));
    }
    FString GetFloatingHeightParamStr(const FESMBBVar_Float &inout FloatParam) const
    {
        FString local_16;
        if (FloatParam.bReadVar)
        {
            local_16 = FloatParam.ToString();
        }
        else
        {
            local_16 = FString().Append(uint(int(FloatParam.Value)));
        }
        return local_16;
    }
}

class UESMAction_SwoopMove : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    float32 SwoopAngle = 45.0f;
    UPROPERTY()
    FRuntimeFloatCurve VelocityRatioCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 1.0f);
    UPROPERTY()
    float32 ExitGroundHeight = 300.0f;
    UPROPERTY()
    FNameHandle_ESMBBTrigger ExitTrigger;

    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_2 = 0;
        int local_8 = 0;
        int local_14 = 0;
        FHitResult local_90;
        FCollisionQueryParams local_128;
        local_128.bTraceComplex = false;
        FVector local_156(local_8.GetPosition());
        float32 local_137 = -this.ExitGroundHeight;
        FVector local_162 = (local_156 + FVector(0.0, 0.0, local_137));
        FCollisionResponseParams local_178;
        bool local_180 = FPhysicsUtils::SweepSingle(Context.GetEntity(), false, EPhysicsTraceTag(11), local_90, local_8.GetPosition(), local_162, FQuat::Identity, FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)), FCollisionShape::MakeCapsule(local_2.GetScaledRadius(), local_2.GetScaledHalfHeight()), local_128, local_178);
        if (local_180)
        {
            FESMTriggerUtils::ActivateTrigger(Context.GetEntity(), Context.GetBlackboard().GetTriggerStorage(), this.ExitTrigger.Name, Context.Time.WorldTime, FFPTime(0.1), 0);
            local_14.SetbFlyFloating(true);
            local_14.SetFloatingHeight(this.ExitGroundHeight);
        }
        FVector local_190 = local_14.GetMovementInput();
        FVector local_136 = local_190.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        if (!(local_180))
        {
            local_136 = local_8.GetRotation().GetForwardVector().RotateAngleAxis(this.SwoopAngle, local_8.GetRotation().GetRightVector());
        }
        FC_CharacterMovementParam local_24;
        local_14.SetMovementInput((local_136.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * FMath::Min(local_190.Size(), local_24.MoveSpeed)));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        if (local_8)
        {
            local_8.SetbFlyFloating(false);
        }
        return;
    }
}

