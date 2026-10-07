

class UESMAction_SteeringOffsetCurve : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    UCurveFloat SteeringOffsetCurve;
    UPROPERTY()
    float32 AngleOffset = 0.0f;


    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        if (this.SteeringOffsetCurve != nullptr)
        {
            return this.SteeringOffsetCurve.GetName();
        }
        return "(жњЄй…ЌзЅ®ж›Ізєї)";
    }
    UFUNCTION()
    bool IsNotifyTypeAllowed_Implementation(const EESMNotifyType InType) const
    {
        return (int(InType) == 1 || (int(InType) == 2));
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        float32 local_8 = 0.0f;
        FVector local_24 = local_6.GetAcceleration().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        if (!(local_24.IsNearlyZero(9.999999747378752e-5)) && ((this.SteeringOffsetCurve != nullptr)))
        {
            FVector local_34(local_6.GetTransformForwardVector());
            float local_18 = -local_34.Y;
            local_8 = this.SteeringOffsetCurve.GetFloatValue(((float32((FMath::RadiansToDegrees(FMath::Atan2(local_24.DotProduct(FVector(local_18, local_34.X, 0.0).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)), local_24.DotProduct(local_34)))))) + this.AngleOffset));
        }
        Modify local_62;
        FC_CharacterGroundMovementInfo& local_64 = local_62.opCall();
        if (local_64)
        {
            local_64.SetSteeringOffsetYaw(local_8);
        }
        return;
    }
}

