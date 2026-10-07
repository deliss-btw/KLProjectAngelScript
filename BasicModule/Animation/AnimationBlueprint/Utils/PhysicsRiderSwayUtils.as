

struct FRiderSwayControlSetting
{
    UPROPERTY()
    FPhysicsControlControlAndModifierUpdates ControlAndModifierUpdates;

    FRiderSwayControlSetting()
    {
        return;
    }
}

struct FRiderSwayParams
{
    UPROPERTY()
    float32 SpeedBoostMultiplier = 2.0f;
    UPROPERTY()
    float32 SpeedMapRange = 100.0f;
    UPROPERTY()
    float32 AccelBoostMultiplier = 3.0f;
    UPROPERTY()
    float32 AccelBoostRange = 600.0f;
    UPROPERTY()
    float32 AccelSmoothSpeed = 5.0f;
    UPROPERTY()
    float32 AngularBoostMultiplier = 3.0f;
    UPROPERTY()
    float32 AngularSpeedBoostRange = 90.0f;
    UPROPERTY()
    float32 AngularSmoothSpeed = 8.0f;
    UPROPERTY()
    float32 HeadNeckWsMultiplierScale = 0.4f;
    UPROPERTY()
    FName HeadConstraintName;
    UPROPERTY()
    FName NeckConstraintName;
    UPROPERTY()
    float32 VelocitySmoothSpeed = 3.0f;
    UPROPERTY()
    float32 MultiplierUpSpeed = 8.0f;
    UPROPERTY()
    float32 MultiplierDownSpeed = 3.0f;
    UPROPERTY()
    FVector PrevLocation = FVector::ZeroVector;
    UPROPERTY()
    bool bHasPrevLocation = false;
    UPROPERTY()
    FVector SmoothedVelocity = FVector::ZeroVector;
    UPROPERTY()
    FVector PrevSmoothedVelocity = FVector::ZeroVector;
    UPROPERTY()
    FVector SmoothedAccel = FVector::ZeroVector;
    UPROPERTY()
    float32 PrevYaw = 0.0f;
    UPROPERTY()
    bool bHasPrevYaw = false;
    UPROPERTY()
    float32 SmoothedAngularSpeed = 0.0f;
    UPROPERTY()
    float32 CurrentMultiplier = 1.0f;
    UPROPERTY()
    float32 DebugSpeedSize = 0.0f;
    UPROPERTY()
    float32 DebugAccelSize = 0.0f;
    UPROPERTY()
    float32 DebugAngularSpeed = 0.0f;


}

namespace FPhysicsRiderSwayUtils
{
void InitializeRiderSway(FRiderSwayControlSetting &inout OutSetting, FRiderSwayParams &inout Params)
{
    Params.CurrentMultiplier = 1.0f;
    FPhysicsRiderSwayUtils::WriteMultiplierToSetting(Params.CurrentMultiplier, Params, OutSetting);
    return;
}
void UpdateRiderSway(const float32 DeltaTime, const FVector &inout CurrentLocation, const float32 CurrentYaw, FRiderSwayParams &inout Params, FRiderSwayControlSetting &inout OutSetting)
{
    if (DeltaTime <= 0.0f)
    {
        return;
    }
    FVector local_8(FVector::ZeroVector);
    if (Params.bHasPrevLocation)
    {
        FVector local_14 = (CurrentLocation - Params.PrevLocation);
        local_8 = (local_14 / DeltaTime);
    }
    Params.PrevLocation = CurrentLocation;
    Params.bHasPrevLocation = true;
    Params.SmoothedVelocity.X = FMath::FInterpTo(Params.SmoothedVelocity.X, local_8.X, DeltaTime, Params.VelocitySmoothSpeed);
    Params.SmoothedVelocity.Y = FMath::FInterpTo(Params.SmoothedVelocity.Y, local_8.Y, DeltaTime, Params.VelocitySmoothSpeed);
    Params.SmoothedVelocity.Z = FMath::FInterpTo(Params.SmoothedVelocity.Z, local_8.Z, DeltaTime, Params.VelocitySmoothSpeed);
    FVector local_14_2 = (Params.SmoothedVelocity - Params.PrevSmoothedVelocity);
    FVector local_22 = (local_14_2 / DeltaTime);
    Params.PrevSmoothedVelocity = Params.SmoothedVelocity;
    Params.SmoothedAccel.X = FMath::FInterpTo(Params.SmoothedAccel.X, local_22.X, DeltaTime, Params.AccelSmoothSpeed);
    Params.SmoothedAccel.Y = FMath::FInterpTo(Params.SmoothedAccel.Y, local_22.Y, DeltaTime, Params.AccelSmoothSpeed);
    Params.SmoothedAccel.Z = FMath::FInterpTo(Params.SmoothedAccel.Z, local_22.Z, DeltaTime, Params.AccelSmoothSpeed);
    float32 local_37 = 0.0f;
    if (Params.bHasPrevYaw)
    {
        local_37 = FMath::Abs(FMath::FindDeltaAngleDegrees(Params.PrevYaw, CurrentYaw)) / DeltaTime;
    }
    Params.PrevYaw = CurrentYaw;
    Params.bHasPrevYaw = true;
    Params.SmoothedAngularSpeed = FMath::FInterpTo(Params.SmoothedAngularSpeed, local_37, DeltaTime, Params.AngularSmoothSpeed);
    float32 local_39 = float32(Params.SmoothedVelocity.Size());
    float32 local_40 = float32(Params.SmoothedAccel.Size());
    Params.DebugSpeedSize = local_39;
    Params.DebugAccelSize = local_40;
    Params.DebugAngularSpeed = Params.SmoothedAngularSpeed;
    float32 local_41 = local_39 / FMath::Max(Params.SpeedMapRange, 1.0f);
    float32 local_38 = ((FMath::Clamp(local_41, 0.0f, 1.0f) * Params.SpeedBoostMultiplier) + 1.0f) + (FMath::Clamp((local_40 / FMath::Max(Params.AccelBoostRange, 1.0f)), 0.0f, 1.0f) * Params.AccelBoostMultiplier);
    local_38 = local_38 + (FMath::Clamp((Params.SmoothedAngularSpeed / FMath::Max(Params.AngularSpeedBoostRange, 1.0f)), 0.0f, 1.0f) * Params.AngularBoostMultiplier);
    float32 local_48_2 = Params.CurrentMultiplier;
    if (local_38 > local_48_2)
    {
    }
    else
    {
    }
    Params.CurrentMultiplier = FMath::FInterpTo(Params.CurrentMultiplier, local_38, DeltaTime, local_48_2);
    FPhysicsRiderSwayUtils::WriteMultiplierToSetting(Params.CurrentMultiplier, Params, OutSetting);
    return;
}
void WriteMultiplierToSetting(const float32 Multiplier, FRiderSwayParams &inout Params, FRiderSwayControlSetting &inout OutSetting)
{
    FPhysicsControlSparseMultiplier local_30;
    local_30.LinearStrengthMultiplier = FVector(Multiplier);
    local_30.AngularStrengthMultiplier = Multiplier;
    FPhysicsControlNamedControlMultiplierParameters local_70;
    local_70.Name = FName("WorldSpace");
    local_70.Data = local_30;
    OutSetting.ControlAndModifierUpdates.ControlMultiplierUpdates.Empty(0);
    OutSetting.ControlAndModifierUpdates.ControlMultiplierUpdates.Add(local_70);
    if (Params.HeadNeckWsMultiplierScale < 1.0f)
    {
        float32 local_75 = Multiplier * Params.HeadNeckWsMultiplierScale;
        FPhysicsControlSparseMultiplier local_108;
        local_108.LinearStrengthMultiplier = FVector(local_75);
        if (!(Params.HeadConstraintName.IsNone()))
        {
            FPhysicsControlNamedControlMultiplierParameters local_140;
            local_140.Name = Params.HeadConstraintName;
            local_140.Data = local_108;
            OutSetting.ControlAndModifierUpdates.ControlMultiplierUpdates.Add(local_140);
        }
        if (!(Params.NeckConstraintName.IsNone()))
        {
            FPhysicsControlNamedControlMultiplierParameters local_140;
            local_140.Name = Params.NeckConstraintName;
            local_140.Data = local_108;
            OutSetting.ControlAndModifierUpdates.ControlMultiplierUpdates.Add(local_140);
        }
    }
    return;
}
}
