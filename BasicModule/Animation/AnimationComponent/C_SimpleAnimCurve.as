

class UESMAction_SimpleAnimCurve : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool bEnablePositionX = false;
    UPROPERTY()
    float32 FactorPositionX = 1.0f;
    UPROPERTY()
    FRuntimeFloatCurve PositionXCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    bool bEnablePositionY = false;
    UPROPERTY()
    float32 FactorPositionY = 1.0f;
    UPROPERTY()
    FRuntimeFloatCurve PositionYCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    bool bEnablePositionZ = false;
    UPROPERTY()
    float32 FactorPositionZ = 1.0f;
    UPROPERTY()
    FRuntimeFloatCurve PositionZCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    bool bEnableRotationX = false;
    UPROPERTY()
    float32 FactorRotationX = 1.0f;
    UPROPERTY()
    FRuntimeFloatCurve RotationXCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    bool bEnableRotationY = false;
    UPROPERTY()
    float32 FactorRotationY = 1.0f;
    UPROPERTY()
    FRuntimeFloatCurve RotationYCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    bool bEnableRotationZ = false;
    UPROPERTY()
    float32 FactorRotationZ = 1.0f;
    UPROPERTY()
    FRuntimeFloatCurve RotationZCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    bool bUseRotationPivot = false;
    UPROPERTY()
    FVector RotationPivotOffset = FVector::ZeroVector;
    UPROPERTY()
    bool bEnableUniformScale = false;
    UPROPERTY()
    float32 FactorUniformScale = 1.0f;
    UPROPERTY()
    FRuntimeFloatCurve UniformScaleCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 1.0f);
    UPROPERTY()
    bool bEnableScaleX = false;
    UPROPERTY()
    float32 FactorScaleX = 1.0f;
    UPROPERTY()
    FRuntimeFloatCurve ScaleXCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    bool bEnableScaleY = false;
    UPROPERTY()
    float32 FactorScaleY = 1.0f;
    UPROPERTY()
    FRuntimeFloatCurve ScaleYCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    bool bEnableScaleZ = false;
    UPROPERTY()
    float32 FactorScaleZ = 1.0f;
    UPROPERTY()
    FRuntimeFloatCurve ScaleZCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    bool bUseScalePivot = false;
    UPROPERTY()
    FVector ScalePivotOffset = FVector::ZeroVector;


    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FVector local_6;
        FRotator local_12;
        FVector local_18;
        this.CalcCurveTransform(Time, local_6, local_12, local_18);
        AActor local_22 = Context.GetEntity().GetMutableActor();
        if (local_22 != nullptr)
        {
            UStaticMeshComponent local_28 = Cast<UStaticMeshComponent>(local_22.GetComponentByClass(UStaticMeshComponent));
            if (local_28 != nullptr)
            {
                local_28.SetRelativeLocation(local_6);
                local_28.SetRelativeRotation(local_12);
                local_28.SetRelativeScale3D(local_18);
            }
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        return;
    }
    void CalcCurveTransform(const FESMActionTime &inout Time, FVector &inout OutLocation, FRotator &inout OutRotation, FVector &inout OutScale) const
    {
        FVector local_18;
        OutLocation = FVector::ZeroVector;
        OutRotation = FRotator::ZeroRotator;
        OutScale = FVector::OneVector;
        float32 local_1 = 0.0f;
        float local_6 = Time.ActionDuration.ToSeconds();
        float32 local_2 = float32(local_6);
        if (local_2 > 0.0f)
        {
            float local_6_2 = Time.ActionLastTime.ToSeconds();
            local_1 = FMath::Clamp((float32(local_6_2) / local_2), 0.0f, 1.0f);
        }
        if (this.bEnablePositionX)
        {
            float32 local_10 = this.PositionXCurve.GetFloatValue(local_1, 0.0f) * this.FactorPositionX;
            OutLocation.X = local_10;
        }
        if (this.bEnablePositionY)
        {
            OutLocation.Y = (this.PositionYCurve.GetFloatValue(local_1, 0.0f) * this.FactorPositionY);
        }
        if (this.bEnablePositionZ)
        {
            OutLocation.Z = (this.PositionZCurve.GetFloatValue(local_1, 0.0f) * this.FactorPositionZ);
        }
        if (this.bEnableRotationX)
        {
            OutRotation.Pitch = (this.RotationXCurve.GetFloatValue(local_1, 0.0f) * this.FactorRotationX);
        }
        if (this.bEnableRotationY)
        {
            OutRotation.Yaw = (this.RotationYCurve.GetFloatValue(local_1, 0.0f) * this.FactorRotationY);
        }
        if (this.bEnableRotationZ)
        {
            OutRotation.Roll = (this.RotationZCurve.GetFloatValue(local_1, 0.0f) * this.FactorRotationZ);
        }
        if (this.bEnableUniformScale)
        {
            float32 local_10_7 = this.UniformScaleCurve.GetFloatValue(local_1, 0.0f) * this.FactorUniformScale;
            OutScale = FVector(local_10_7, local_10_7, local_10_7);
        }
        if (this.bEnableScaleX)
        {
            OutScale.X = (this.ScaleXCurve.GetFloatValue(local_1, 0.0f) * this.FactorScaleX);
        }
        if (this.bEnableScaleY)
        {
            OutScale.Y = (this.ScaleYCurve.GetFloatValue(local_1, 0.0f) * this.FactorScaleY);
        }
        if (this.bEnableScaleZ)
        {
            OutScale.Z = (this.ScaleZCurve.GetFloatValue(local_1, 0.0f) * this.FactorScaleZ);
        }
        if ((this.bUseRotationPivot || this.bUseScalePivot))
        {
            if (this.bUseRotationPivot)
            {
                local_18 = this.RotationPivotOffset;
            }
            else
            {
                local_18 = FVector::ZeroVector;
            }
            FVector local_36;
            if (this.bUseScalePivot)
            {
                local_36 = this.ScalePivotOffset;
            }
            else
            {
                local_36 = FVector::ZeroVector;
            }
            FVector local_54 = (FVector(FVector::ZeroVector) - local_36);
            FVector local_54_2 = (local_36 + (local_54 * OutScale));
            FVector local_42_2 = (local_18 + OutRotation.RotateVector((local_54_2 - local_18)));
            OutLocation = (local_42_2 + OutLocation);
        }
        return;
    }
}

