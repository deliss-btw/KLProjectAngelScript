
namespace FSplineMoveUtils
{
void FindBestSplinePoint(FVector &inout EntryPointLocation, float &inout SplineStartLocationDistance, const USplineComponent SplineComponent, const FECSEntity &inout Entity, const float32 FindBestPointDistanceWeight = 0.5f, const float32 FindBestPointAngleWeight = 0.5f, const float32 FindBestPointSampleInterval = 1000.0f)
{
    int local_6 = 0;
    FVector local_12 = local_6.GetPosition();
    FQuat local_20 = local_6.GetRotation();
    FVector local_26 = local_20.Vector();
    float local_34 = 999999.0;
    float32 local_37 = 0.0f;
    float32 local_38 = SplineComponent.GetSplineLength();
    while (true)
    {
        if (local_37 >= local_38)
        {
            break;
        }
        FVector local_32 = SplineComponent.GetLocationAtDistanceAlongSpline(local_37, ESplineCoordinateSpace(1));
        float local_60 = (local_32.Distance(local_12) * FindBestPointDistanceWeight) + (((FSplineMoveUtils::GetFlyToPointTurnAngle(local_12, local_32, local_26)) + FSplineMoveUtils::GetTurnToPointDirAngle(local_12, local_32, SplineComponent.GetDirectionAtDistanceAlongSpline(local_37, ESplineCoordinateSpace(1)))) * FindBestPointAngleWeight);
        FECSDebugDraw::DrawDebugString(n"SplineMove", (local_32 + FVector(0.0, 0.0, 200.0)), (FString("") + local_60), FColor(FColor::Blue), 1.0f, FColor(FColor::Blue), 10.0f);
        FECSDebugDraw::DrawDebugSphere(n"SplineMove", local_32, 100.0f, 10, FColor(FColor::Blue), FColor(FColor::Blue), 10.0f, uint8(0), 0.0f);
        if (local_60 < local_34)
        {
            local_34 = local_60;
            EntryPointLocation = local_32;
            SplineStartLocationDistance = local_37;
        }
        local_37 = local_37 + FindBestPointSampleInterval;
    }
    return;
}
float GetFlyToPointTurnAngle(const FVector &inout StartLocation, const FVector &inout TargetLocation, const FVector &inout StartForward)
{
    return FMath::RadiansToDegrees(FMath::Acos(StartForward.DotProduct((TargetLocation - StartLocation).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector))));
}
float GetTurnToPointDirAngle(const FVector &inout StartLocation, const FVector &inout TargetLocation, const FVector &inout PointForward)
{
    return FMath::RadiansToDegrees(FMath::Acos(PointForward.DotProduct((TargetLocation - StartLocation).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector))));
}
}
