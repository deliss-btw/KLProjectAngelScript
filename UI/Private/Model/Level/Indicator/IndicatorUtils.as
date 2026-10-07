
namespace IndicatorUtils
{
bool IsSpotOutOfScreen(const TEUIModelRef<FM_Spot> &inout Spot)
{
    AActor local_72;
    FMS_UIViewProjection& local_2 = FMS_UIViewProjection::Get(Spot.opArrow().GetContext().Manager);
    if (!(local_2.IsSnapshotValid()))
    {
        return true;
    }
    if (!(local_2.IsPositionOutOfScreen(PresentationSpotUtils::GetSpotLocation(Spot), 0.0f)))
    {
        return false;
    }
    FECSEntityId local_17 = GetOwnerEntityId(Spot.opArrow());
    FECSEntity local_16 = FECSEntity(local_17);
    if (local_16)
    {
        float32 local_11 = local_2.GetHalfFOVDegrees();
        FVector local_10 = local_2.GetCameraLocation();
        TArray<FLockPointInfo> local_34;
        Get local_38;
        const FC_InterpoTime& local_40 = local_38.opCall();
        if (local_40)
        {
            FLockTargetUtils::GetLockPointsFromEntity(local_16, local_34, local_40.Time, true);
        }
        for (auto& local_54 : local_34)
        {
            if (!(local_2.IsPositionOutOfScreen(local_54.Position, IndicatorUtils_Internal::RadiusToScreenRatio(local_54.Radius, float32(local_10.Distance(local_54.Position)), local_11))))
            {
                return false;
            }
        }
        Get local_62;
        const FC_IndicatorConfig& local_64 = local_62.opCall();
        if (local_64)
        {
            if (local_72 != nullptr)
            {
                for (auto& local_86 : local_64.ExtraOutScreenCheckSockets)
                {
                    FName local_88 = local_86.SocketName;
                    if (local_88.IsNone())
                    {
                        continue;
                    }
                    FVector local_30 = local_72.GetSocketLocation(local_88);
                    if (!(local_2.IsPositionOutOfScreen(local_30, IndicatorUtils_Internal::RadiusToScreenRatio(local_86.SocketRadius, float32(local_10.Distance(local_30)), local_11))))
                    {
                        return false;
                    }
                }
            }
        }
    }
    return true;
}
float32 ProjectSpotToIndicatorAngle(const FVector &inout SpotLocation, const APlayerController PlayerController)
{
    float32 local_66;
    APlayerCameraManager local_2 = PlayerController.PlayerCameraManager;
    if (!(IsValid(local_2)))
    {
        return 0.0f;
    }
    FTransform local_28;
    local_28.SetLocation(local_2.GetCameraLocation());
    local_28.SetRotation(local_2.GetCameraRotation().Quaternion());
    FVector local_34 = local_28.InverseTransformPositionNoScale(SpotLocation);
    float32 local_4 = float32((FMath::UnwindDegrees(FMath::RadiansToDegrees(FMath::Atan2(local_34.Y, local_34.X)))));
    float32 local_61 = FMath::Abs(local_4);
    float32 local_62 = IndicatorUtils_Internal::GetHalfFOVInDegrees(local_2);
    bool local_3 = (local_62 > local_61);
    int local_65 = 1117126656;
    if (local_3)
    {
        local_66 = (local_61 / local_62) * 75.0f;
    }
    else
    {
        float32 local_63_2 = ((local_61 - local_62) / (180.0f - local_62)) * 105.0f;
        local_66 = local_63_2 + 75.0f;
    }
    return FMath::Sign(local_4) * local_66;
}
}
namespace IndicatorUtils_Internal
{
float32 GetHalfFOVInDegrees(const APlayerCameraManager PlayerCameraManager)
{
    if (!(IsValid(PlayerCameraManager)))
    {
        return 0.0f;
    }
    return (PlayerCameraManager.GetFOVAngle() / 2.0f);
}
float32 RadiusToScreenRatio(const float32 Radius, const float32 Distance, const float32 HalfFOVInDegrees)
{
    if ((HalfFOVInDegrees <= 0.0001f || (Distance <= 0.0001f)))
    {
        return 0.0f;
    }
    return (Radius / (Distance * FMath::Tan(FMath::DegreesToRadians(HalfFOVInDegrees))));
}
}
