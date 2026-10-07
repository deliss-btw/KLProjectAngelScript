
namespace FWaterAudioUtils
{
    const FConsoleVariable CVar_WaterAudio_Log = FConsoleVariable();
    const FConsoleVariable CVar_WaterAudio_VerboseLog = FConsoleVariable();

UFUNCTION()
bool EnableLog()
{
    return FWaterAudioUtils::CVar_WaterAudio_Log.GetBool();
}
UFUNCTION()
bool EnableVerboseLog()
{
    return FWaterAudioUtils::CVar_WaterAudio_VerboseLog.GetBool();
}
UFUNCTION()
float32 CalculateDistanceToPolygon(const FVector &inout Point, const TArray<FVector> &inout PolygonVertices, FVector &inout OutNearestPoint)
{
    if (PolygonVertices.Num() < 3)
    {
        OutNearestPoint = Point;
        return 0.0f;
    }
    float32 local_5 = 1000000.0f;
    FVector local_12 = Point;
    XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("CalculateDistanceToPolygon: Checking point (").Append(FString::ApplyFormat(Point.X, ".2f")).Append(", ").Append(FString::ApplyFormat(Point.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(Point.Z, ".2f")).Append(") against ").Append(PolygonVertices.Num()).Append(" vertices"));
    int local_32 = 0;
    for (; local_32 < PolygonVertices.Num(); ++local_32)
    {
        FVector local_38(PolygonVertices[local_32]);
        int local_1 = (local_32 + 1) % PolygonVertices.Num();
        FVector local_44(PolygonVertices[local_1]);
        FVector local_58 = FWaterAudioUtils::GetClosestPointOnLineSegment(Point, local_38, local_44);
        float32 local_4 = float32(Point.Distance(local_58));
        XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("CalculateDistanceToPolygon: Segment ").Append(local_32).Append(": (").Append(FString::ApplyFormat(local_38.X, ".2f")).Append(", ").Append(FString::ApplyFormat(local_38.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(local_38.Z, ".2f")).Append(") to (").Append(FString::ApplyFormat(local_44.X, ".2f")).Append(", ").Append(FString::ApplyFormat(local_44.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(local_44.Z, ".2f")).Append(")"));
        XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("CalculateDistanceToPolygon: Closest point on segment = (").Append(FString::ApplyFormat(local_58.X, ".2f")).Append(", ").Append(FString::ApplyFormat(local_58.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(local_58.Z, ".2f")).Append("), distance = ").Append(FString::ApplyFormat(local_4, ".2f")));
        if (local_4 < local_5)
        {
            local_5 = local_4;
            local_12 = local_58;
            XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("CalculateDistanceToPolygon: New nearest point found at (").Append(FString::ApplyFormat(local_12.X, ".2f")).Append(", ").Append(FString::ApplyFormat(local_12.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(local_12.Z, ".2f")).Append(")"));
        }
    }
    OutNearestPoint = local_12;
    FString local_30_2 = FString();
    XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), local_30_2.Append("CalculateDistanceToPolygon: Final nearest point = (").Append(FString::ApplyFormat(OutNearestPoint.X, ".2f")).Append(", ").Append(FString::ApplyFormat(OutNearestPoint.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(OutNearestPoint.Z, ".2f")).Append("), distance = ").Append(FString::ApplyFormat(local_5, ".2f")));
    return local_5;
}
UFUNCTION()
bool IsPointInPolygon(const FVector &inout Point, const TArray<FVector> &inout PolygonVertices)
{
    bool local_3;
    if (PolygonVertices.Num() < 3)
    {
        XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("IsPointInPolygon: Not enough vertices (").Append(PolygonVertices.Num()).Append(" < 3)"));
        return false;
    }
    XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("IsPointInPolygon: Checking point (").Append(FString::ApplyFormat(Point.X, ".2f")).Append(", ").Append(FString::ApplyFormat(Point.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(Point.Z, ".2f")).Append(")"));
    XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("IsPointInPolygon: Polygon has ").Append(PolygonVertices.Num()).Append(" vertices"));
    int local_25 = 0;
    for (; local_25 < (FMath::Min(5, PolygonVertices.Num())); )
    {
        FVector local_34(PolygonVertices[local_25]);
        local_3 = FWaterAudioUtils::EnableVerboseLog();
        XLogIf(local_3, ELog(1), FString().Append("IsPointInPolygon: Vertex ").Append(local_25).Append(" = (").Append(FString::ApplyFormat(local_34.X, ".2f")).Append(", ").Append(FString::ApplyFormat(local_34.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(local_34.Z, ".2f")).Append(")"));
        ++local_25;
    }
    bool local_35 = false;
    int local_2 = PolygonVertices.Num() - 1;
    int local_36 = 0;
    for (; local_36 < PolygonVertices.Num(); )
    {
        FVector local_34_2(PolygonVertices[local_36]);
        FVector local_42(PolygonVertices[local_2]);
        if (FWaterAudioUtils::IsPointOnLineSegment(Point, local_34_2, local_42))
        {
            XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("IsPointInPolygon: Point is on boundary between vertices ").Append(local_36).Append(" and ").Append(local_2));
            return true;
        }
        local_3 = !((local_34_2.Y > Point.Y));
        bool local_45 = !((local_42.Y > Point.Y));
        if (local_3 == local_45)
        {
            local_3 = false;
        }
        else
        {
            float local_44 = local_42.X - local_34_2.X;
            float local_12 = Point.Y - local_34_2.Y;
            float local_48 = local_44 * local_12;
            local_12 = local_42.Y;
            local_12 = local_12 - local_34_2.Y;
            local_44 = local_48 / local_12;
            local_3 = (Point.X < (local_44 + local_34_2.X));
        }
        if (local_3)
        {
            local_35 = !(local_35);
            FString local_24 = FString();
            local_45 = FWaterAudioUtils::EnableVerboseLog();
            XLogIf(local_45, ELog(1), local_24.Append("IsPointInPolygon: Crossing edge ").Append(local_36).Append("->").Append(local_2).Append(", bInside = ").Append(local_35));
        }
        local_2 = local_36;
        ++local_36;
    }
    XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("IsPointInPolygon: Final result = ").Append(local_35));
    return local_35;
}
UFUNCTION()
bool IsPointOnLineSegment(const FVector &inout Point, const FVector &inout LineStart, const FVector &inout LineEnd)
{
    if (Point.X < FMath::Min(LineStart.X, LineEnd.X) || ((Point.X > FMath::Max(LineStart.X, LineEnd.X))) || ((Point.Y < FMath::Min(LineStart.Y, LineEnd.Y))) || ((Point.Y > FMath::Max(LineStart.Y, LineEnd.Y))))
    {
        return false;
    }
    FVector local_22 = (LineEnd - LineStart);
    return (FMath::Abs(float32((local_22.CrossProduct((Point - LineStart)).Z))) < 0.1f);
}
UFUNCTION()
FVector GetClosestPointOnLineSegment(const FVector &inout Point, const FVector &inout LineStart, const FVector &inout LineEnd)
{
    FVector local_12 = (LineEnd - LineStart);
    FVector local_6 = (Point - LineStart);
    float local_22 = local_12.SizeSquared();
    float32 local_23 = float32(local_22);
    if (local_23 < 0.0001f)
    {
        return LineStart;
    }
    float local_22_2 = local_6.DotProduct(local_12);
    float local_22_3 = FMath::Clamp((float32(local_22_2) / local_23), 0.0f, 1.0f);
    return (LineStart + (local_12 * local_22_3));
}
UFUNCTION()
bool DoLinesIntersect(const FVector &inout Line1Start, const FVector &inout Line1End, const FVector &inout Line2Start, const FVector &inout Line2End)
{
    FVector local_12 = (Line1End - Line1Start);
    FVector local_6 = (Line2End - Line2Start);
    FVector local_18 = (Line2Start - Line1Start);
    float local_28 = local_12.CrossProduct(local_6).Z;
    float32 local_29 = float32(local_28);
    float local_28_2 = local_18.CrossProduct(local_6).Z;
    float32 local_25 = float32(local_28_2);
    float local_28_3 = local_18.CrossProduct(local_12).Z;
    float32 local_30 = float32(local_28_3);
    if (FMath::Abs(local_29) < 0.0001f)
    {
        return false;
    }
    float32 local_31 = local_25 / local_29;
    float32 local_32 = local_30 / local_29;
    return (local_31 >= 0.0f && (local_31 <= 1.0f) && (local_32 >= 0.0f) && (local_32 <= 1.0f));
}
UFUNCTION()
bool CalculatePerpendicularWaterPoint(const FVector &inout CharacterPosition, const TArray<FVector> &inout WaterVertices, FVector &inout OutPerpendicularPoint)
{
    if (WaterVertices.Num() < 3)
    {
        return false;
    }
    FVector local_10;
    FWaterAudioUtils::CalculateDistanceToPolygon(CharacterPosition, WaterVertices, local_10);
    FVector local_24 = (local_10 - CharacterPosition);
    FVector local_32 = local_24.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    FVector local_24_2 = FVector(0.0, 0.0, 1.0);
    FVector local_38 = local_32.CrossProduct(local_24_2).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    OutPerpendicularPoint = (local_10 + FVector(0.0, 0.0, 10.0f));
    return true;
}
UFUNCTION()
bool ExtractWaterSplineVertices(const AWaterBodyLake WaterBody, TArray<FVector> &inout OutVertices)
{
    if (WaterBody == nullptr)
    {
        return false;
    }
    UWaterSplineComponent local_6 = Cast<UWaterSplineComponent>(WaterBody.GetComponentByClass(UWaterSplineComponent));
    if (local_6 == nullptr)
    {
        return false;
    }
    OutVertices.Empty(0);
    int local_9 = local_6.GetNumberOfSplinePoints();
    XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("ExtractWaterSplineVertices: Found ").Append(local_9).Append(" spline points"));
    if (local_9 < 3)
    {
        XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("ExtractWaterSplineVertices: Not enough points (").Append(local_9).Append(" < 3)"));
        return false;
    }
    int local_16 = 0;
    for (; local_16 < local_9; )
    {
        FVector local_32 = local_6.GetLocationAtSplinePoint(local_16, ESplineCoordinateSpace(1));
        OutVertices.Add(local_32);
        XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("ExtractWaterSplineVertices: Point ").Append(local_16).Append(" = (").Append(FString::ApplyFormat(local_32.X, ".2f")).Append(", ").Append(FString::ApplyFormat(local_32.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(local_32.Z, ".2f")).Append(")"));
        ++local_16;
    }
    XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("ExtractWaterSplineVertices: Successfully extracted ").Append(OutVertices.Num()).Append(" vertices"));
    return true;
}
UFUNCTION()
int PlayWaterAudio(const FECSEntity &inout Entity, const FVector &inout Position, const FName &inout EventName)
{
    return FGameAudioUtils::PlayEventAtLocation(EventName, Entity, FLoadEventCallback(), Position, FQuat4f::Identity, FGameAudioUtils::GetCachedAudioWorld(), false, true);
}
UFUNCTION()
void StopWaterAudio(const int AudioID)
{
    if (AudioID >= 0)
    {
        FGameAudioUtils::StopSound(AudioID);
    }
    return;
}
UFUNCTION()
void UpdateWaterAudioPosition(const int AudioID, const FVector &inout NewPosition)
{
    if (AudioID >= 0)
    {
        int local_3 = AudioID;
        bool local_2 = FGameAudioUtils::UpdateAudioPositionBySoundID(local_3, NewPosition, FQuat4f::Identity);
        if (local_2)
        {
            XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("UpdateWaterAudioPosition: Successfully updated audio ").Append(AudioID).Append(" position to (").Append(FString::ApplyFormat(NewPosition.X, ".2f")).Append(", ").Append(FString::ApplyFormat(NewPosition.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(NewPosition.Z, ".2f")).Append(")"));
            return;
        }
        XWarning(ELog(1), FString().Append("UpdateWaterAudioPosition: Failed to update audio ").Append(AudioID).Append(" position"));
    }
    return;
}
UFUNCTION()
void FindWaterBodiesInWorld(const UWorld World, TArray<TWeakObjectPtr<AWaterBodyLake>> &inout OutWaterBodies)
{
    AWaterBodyLake local_26;
    if (World == nullptr)
    {
        return;
    }
    OutWaterBodies.Empty(0);
    TArray<AActor> local_8;
    GetAllActorsOfClass(AWaterBodyLake, local_8);
    for (auto local_24 : local_8)
    {
        local_26 = Cast<AWaterBodyLake>(local_24);
        if (local_26 != nullptr)
        {
            OutWaterBodies.Add(TWeakObjectPtr<AWaterBodyLake>(local_26));
        }
    }
    return;
}
UFUNCTION()
void FindWaterBodiesInRadius(const UWorld World, const FVector &inout Center, const float32 Radius, TArray<TWeakObjectPtr<AWaterBodyLake>> &inout OutWaterBodies)
{
    AWaterBodyLake local_14;
    AWaterBodyLake local_30;
    if (World == nullptr)
    {
        return;
    }
    OutWaterBodies.Empty(0);
    TArray<AActor> local_8;
    GetAllActorsOfClass(AWaterBodyLake, local_8);
    for (auto local_28 : local_8)
    {
        local_30 = Cast<AWaterBodyLake>(local_28);
        if (local_30 != nullptr)
        {
            float32 local_49 = float32(Center.Distance(local_30.GetActorLocation()));
            if ((local_49 <= Radius && (local_49 < Radius)))
            {
                float32 local_11 = local_49;
                local_14 = local_30;
            }
        }
    }
    if (local_14 != nullptr)
    {
        OutWaterBodies.Add(TWeakObjectPtr<AWaterBodyLake>(local_14));
    }
    return;
}
UFUNCTION()
bool FindNearestWaterBody(const FVector &inout Position, const TArray<TWeakObjectPtr<AWaterBodyLake>> &inout WaterBodies, AWaterBodyLake &inout OutNearestWaterBody, FVector &inout OutNearestWaterPoint, float32 &inout OutDistance)
{
    AWaterBodyLake local_10;
    AWaterBodyLake local_26;
    FScopeCycleCounter local_1 = FScopeCycleCounter(FStatID(n"WaterAudio_FindNearestWaterBody"), false);
    if (WaterBodies.Num() == 0)
    {
        return false;
    }
    float32 local_6 = 100000000.0f;
    for (auto& local_24 : WaterBodies)
    {
        local_24;
        if (local_26 != nullptr)
        {
            UWaterSplineComponent local_30 = Cast<UWaterSplineComponent>(local_26.GetComponentByClass(UWaterSplineComponent));
            if (local_30 != nullptr)
            {
                FVector local_46 = local_30.FindLocationClosestToWorldLocation(Position, ESplineCoordinateSpace(1));
                float32 local_7 = float32(Position.Distance(local_46));
                XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("FindNearestWaterBody: Distance to water body = ").Append(FString::ApplyFormat(local_7, ".2f")));
                if (local_7 < local_6)
                {
                    local_6 = local_7;
                    local_10 = local_26;
                    OutNearestWaterPoint = local_46;
                }
            }
            else
            {
                FVector local_38 = local_26.GetActorLocation();
                float32 local_47 = float32(Position.Distance(local_38));
                if (local_47 < local_6)
                {
                    local_6 = local_47;
                    local_10 = local_26;
                    OutNearestWaterPoint = local_38;
                }
            }
        }
    }
    if (local_10 != nullptr)
    {
        OutNearestWaterBody = local_10;
        OutDistance = local_6;
        return true;
    }
    return false;
}
UFUNCTION()
void UpdateWaterBodyData(const FECSEntity &inout Entity, FC_WaterAudio &inout WaterAudio, const AWaterBodyLake WaterBody)
{
    if ((!((WaterAudio.TargetWaterBody == WaterBody))))
    {
        WaterAudio.TargetWaterBody = WaterBody;
        XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("WaterAudioSystem: Updated water body data for entity ").Append(Entity.GetEntityName()));
    }
    return;
}
UFUNCTION()
void CalculateAudioPosition(const FECSEntity &inout Entity, FC_WaterAudio &inout WaterAudio, const FVector &inout PlayerLocation, const AWaterBodyLake &inout InWaterBody, const FVector &inout InNearestWaterPoint, const float32 PreCalculatedDistance = -1.0f)
{
    FASProfilingScope local_1 = FASProfilingScope(n"WaterAudio", 2);
    if ((WaterAudio.TargetWaterBody == nullptr))
    {
        return;
    }
    XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("CalculateAudioPosition: Player at (").Append(FString::ApplyFormat(PlayerLocation.X, ".2f")).Append(", ").Append(FString::ApplyFormat(PlayerLocation.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(PlayerLocation.Z, ".2f")).Append(")"));
    FVector local_34;
    bool local_7 = FWaterAudioUtils::IsInWaterByRaycast(PlayerLocation, 1000.0f, local_34);
    XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("CalculateAudioPosition: IsInsideWater = ").Append(local_7));
    XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("CalculateAudioPosition: Current AudioState = ").Append(WaterAudio.AudioState));
    if (local_7)
    {
        WaterAudio.AudioState = EWaterAudioState(1);
        XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("CalculateAudioPosition: Setting state to Inside"));
        WaterAudio.AudioPosition = local_34;
        WaterAudio.NearestWaterPoint = local_34;
        WaterAudio.DistanceToWater = float32(PlayerLocation.Distance(local_34));
        FString local_26_2 = FString();
        XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), local_26_2.Append("CalculateAudioPosition: Player Z = ").Append(FString::ApplyFormat(PlayerLocation.Z, ".2f")).Append(", Water Intersection Z = ").Append(FString::ApplyFormat(local_34.Z, ".2f")));
        FString local_22_2 = FString();
        XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), local_22_2.Append("CalculateAudioPosition: Water intersection point = (").Append(FString::ApplyFormat(local_34.X, ".2f")).Append(", ").Append(FString::ApplyFormat(local_34.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(local_34.Z, ".2f")).Append(")"));
        FString local_22_3 = FString();
        XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), local_22_3.Append("CalculateAudioPosition: Distance to water intersection = ").Append(FString::ApplyFormat(WaterAudio.DistanceToWater, ".2f")));
    }
    else
    {
        WaterAudio.AudioState = EWaterAudioState(0);
        XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("CalculateAudioPosition: Setting state to Outside"));
        if (PreCalculatedDistance >= 0.0f)
        {
            if (Cast<UWaterSplineComponent>(InWaterBody.GetComponentByClass(UWaterSplineComponent)) != nullptr)
            {
                WaterAudio.NearestWaterPoint = InNearestWaterPoint;
                WaterAudio.AudioPosition = InNearestWaterPoint;
                WaterAudio.DistanceToWater = PreCalculatedDistance;
                FString local_26_3 = FString();
                XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), local_26_3.Append("CalculateAudioPosition: Using pre-calculated distance = ").Append(FString::ApplyFormat(PreCalculatedDistance, ".2f")).Append(", nearest point at (").Append(FString::ApplyFormat(InNearestWaterPoint.X, ".2f")).Append(", ").Append(FString::ApplyFormat(InNearestWaterPoint.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(InNearestWaterPoint.Z, ".2f")).Append(")"));
            }
            else
            {
                AWaterBodyLake local_48 = WaterAudio.TargetWaterBody;
                FVector local_62 = local_48.GetActorLocation();
                WaterAudio.NearestWaterPoint = local_62;
                WaterAudio.AudioPosition = local_62;
                WaterAudio.DistanceToWater = PreCalculatedDistance;
                FString local_26_4 = FString();
                XLogIf(FWaterAudioUtils::EnableVerboseLog(), ELog(1), local_26_4.Append("CalculateAudioPosition: Using pre-calculated distance = ").Append(FString::ApplyFormat(PreCalculatedDistance, ".2f")).Append(", water body location at (").Append(FString::ApplyFormat(local_62.X, ".2f")).Append(", ").Append(FString::ApplyFormat(local_62.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(local_62.Z, ".2f")).Append(")"));
            }
        }
    }
    return;
}
UFUNCTION()
bool CalculateRayWaterIntersection(const FVector &inout RayOrigin, const TArray<FVector> &inout WaterVertices, FVector &inout OutIntersectionPoint)
{
    if (WaterVertices.Num() < 3)
    {
        return false;
    }
    FVector local_28 = (RayOrigin + FVector(0.0, 0.0, 200.0));
    FVector local_16 = FVector(0.0, 0.0, -1.0);
    int local_35 = 1;
    for (; local_35 < (WaterVertices.Num() - 1); ++local_35)
    {
        FVector local_42(WaterVertices[0]);
        FVector local_48(WaterVertices[local_35]);
        FVector local_54(WaterVertices[local_35 + 1]);
        FVector local_60;
        if (FWaterAudioUtils::RayTriangleIntersection(local_28, local_16, local_42, local_48, local_54, local_60))
        {
            OutIntersectionPoint = local_60;
            return true;
        }
    }
    return false;
}
UFUNCTION()
bool RayTriangleIntersection(const FVector &inout RayOrigin, const FVector &inout RayDirection, const FVector &inout V0, const FVector &inout V1, const FVector &inout V2, FVector &inout OutIntersectionPoint)
{
    FVector local_12 = (V1 - V0);
    FVector local_6 = (V2 - V0);
    FVector local_18 = RayDirection.CrossProduct(local_6);
    float local_28 = local_12.DotProduct(local_18);
    float32 local_29 = float32(local_28);
    if (FMath::Abs(local_29) < 0.0001f)
    {
        return false;
    }
    float32 local_30 = 1.0f / local_29;
    FVector local_24 = (RayOrigin - V0);
    float local_28_2 = local_24.DotProduct(local_18);
    float32 local_25 = local_30 * float32(local_28_2);
    if (local_25 < 0.0f || (local_25 > 1.0f))
    {
        return false;
    }
    FVector local_38 = local_24.CrossProduct(local_12);
    float local_28_3 = RayDirection.DotProduct(local_38);
    float32 local_32_2 = local_30 * float32(local_28_3);
    if (local_32_2 < 0.0f || ((local_25 + local_32_2) > 1.0f))
    {
        return false;
    }
    float local_28_4 = local_6.DotProduct(local_38);
    float32 local_39_2 = local_30 * float32(local_28_4);
    if (local_39_2 > 0.0001f)
    {
        OutIntersectionPoint = (RayOrigin + (RayDirection * local_39_2));
        return true;
    }
    return false;
}
UFUNCTION()
void UpdateAudioPlayback(const FECSEntity &inout Entity, FC_WaterAudio &inout WaterAudio)
{
    FASProfilingScope local_1 = FASProfilingScope(n"WaterAudio", 2);
    float32 local_4 = WaterAudio.AttenuationRadius;
    if (local_4 <= 0.0f)
    {
        local_4 = FGameAudioSettings::Get().DefaultWaterAudioAttenuationRadius;
    }
    bool local_6 = (WaterAudio.DistanceToWater <= local_4);
    if (local_6 && !(WaterAudio.bIsAudioPlaying))
    {
        FWaterAudioUtils::StartWaterAudio(Entity, WaterAudio);
    }
    else
    {
        if (!(local_6) && WaterAudio.bIsAudioPlaying)
        {
            FWaterAudioUtils::StopWaterAudioForEntity(Entity, WaterAudio);
        }
        else
        {
            if (local_6 && WaterAudio.bIsAudioPlaying)
            {
                FWaterAudioUtils::UpdateAudioPosition(Entity, WaterAudio);
            }
        }
    }
    return;
}
UFUNCTION()
void StartWaterAudio(const FECSEntity &inout Entity, FC_WaterAudio &inout WaterAudio)
{
    UAkAudioEvent local_12;
    FASProfilingScope local_1 = FASProfilingScope(n"WaterAudio", 2);
    FName local_5(FGameAudioSettings::Get().DefaultWaterAudioEventName);
    if (local_5.IsNone())
    {
        return;
    }
    TSoftObjectPtr<UAkAudioEvent> local_22 = TSoftObjectPtr<UAkAudioEvent>(FGameAudioSettings::Get().DefaultWaterAudioEvent);
    if (local_22.IsNull())
    {
        return;
    }
    if (!(local_22.IsNull()))
    {
        if (local_12 == nullptr)
        {
            local_12 = (Cast<UAkAudioEvent>(local_22.ToSoftObjectPath().TryLoad()));
        }
        if (local_12 != nullptr)
        {
            WaterAudio.AttenuationRadius = local_12.MaxAttenuationRadius;
        }
        else
        {
            XWarning(ELog(1), FString().Append("WaterAudioSystem: Failed to load DefaultWaterAudioEvent from soft reference"));
        }
    }
    if (local_12 == nullptr)
    {
        FString local_40 = UKlAudioAssetLoader::GetInstance().GetEventPath(local_5);
        if (!(local_40.IsEmpty()))
        {
            TSoftObjectPtr<UAkAudioEvent> local_68 = TSoftObjectPtr<UAkAudioEvent>(FSoftObjectPath(local_40));
            if (local_68.IsValid())
            {
                if (local_12 == nullptr)
                {
                    local_12 = (Cast<UAkAudioEvent>(local_68.ToSoftObjectPath().TryLoad()));
                }
                if (local_12 != nullptr)
                {
                    WaterAudio.AttenuationRadius = local_12.MaxAttenuationRadius;
                    XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("WaterAudioSystem: Using audio event by name '").Append(local_5).Append("', set WaterAudio.AttenuationRadius to default"));
                }
                else
                {
                    XWarning(ELog(1), FString().Append("WaterAudioSystem: Failed to load audio event by name '").Append(local_5).Append("' from path '").Append(local_40).Append("'"));
                }
            }
            else
            {
                XWarning(ELog(1), FString().Append("WaterAudioSystem: Audio event path '").Append(local_40).Append("' is not valid for event name '").Append(local_5).Append("'"));
            }
        }
        else
        {
            XWarning(ELog(1), FString().Append("WaterAudioSystem: Could not find event path for event name '").Append(local_5).Append("'"));
        }
    }
    if (local_12 == nullptr)
    {
        WaterAudio.AttenuationRadius = FGameAudioSettings::Get().DefaultWaterAudioAttenuationRadius;
        XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("WaterAudioSystem: No audio event loaded, using default attenuation radius"));
    }
    int local_2 = FWaterAudioUtils::PlayWaterAudio(Entity, WaterAudio.AudioPosition, local_5);
    if (local_2 > 0)
    {
        WaterAudio.CurrentAudioID = local_2;
        WaterAudio.bIsAudioPlaying = true;
        WaterAudio.LastAudioPosition = WaterAudio.AudioPosition;
        XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("WaterAudioSystem: Started water audio for entity ").Append(Entity.GetEntityName()).Append(", AudioID: ").Append(local_2).Append(", Position: (").Append(FString::ApplyFormat(WaterAudio.AudioPosition.X, ".1f")).Append(", ").Append(FString::ApplyFormat(WaterAudio.AudioPosition.Y, ".1f")).Append(", ").Append(FString::ApplyFormat(WaterAudio.AudioPosition.Z, ".1f")).Append("), AttenuationRadius: ").Append(WaterAudio.LastAudioPosition));
    }
    else
    {
        XWarning(ELog(1), FString().Append("WaterAudioSystem: Failed to start water audio for entity ").Append(Entity.GetEntityName()));
    }
    return;
}
UFUNCTION()
void StopWaterAudioForEntity(const FECSEntity &inout Entity, FC_WaterAudio &inout WaterAudio)
{
    if (WaterAudio.bIsAudioPlaying)
    {
        FWaterAudioUtils::StopWaterAudio(int(WaterAudio.CurrentAudioID));
        WaterAudio.bIsAudioPlaying = false;
        WaterAudio.CurrentAudioID = -1;
        WaterAudio.AttenuationRadius = 0.0f;
        XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("WaterAudioSystem: Stopped water audio for entity ").Append(Entity.GetEntityName()));
    }
    return;
}
UFUNCTION()
void UpdateAudioPosition(const FECSEntity &inout Entity, FC_WaterAudio &inout WaterAudio)
{
    float32 local_1 = 50.0f;
    float32 local_2 = float32(WaterAudio.AudioPosition.Distance(WaterAudio.LastAudioPosition));
    if (local_2 > local_1)
    {
        XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("UpdateAudioPosition: Position changed by ").Append(FString::ApplyFormat(local_2, ".2f")).Append(" (threshold: ").Append(FString::ApplyFormat(local_1, ".2f")).Append("), updating audio position"));
        FWaterAudioUtils::UpdateWaterAudioPosition(int(WaterAudio.CurrentAudioID), WaterAudio.AudioPosition);
        WaterAudio.LastAudioPosition = WaterAudio.AudioPosition;
    }
    return;
}
UFUNCTION()
void InitializeWaterBodies(const UWorld WorldContext, TArray<TWeakObjectPtr<AWaterBodyLake>> &inout CachedWaterBodies, bool &inout bWaterBodiesInitialized)
{
    if (bWaterBodiesInitialized)
    {
        return;
    }
    if (WorldContext == nullptr)
    {
        return;
    }
    FWaterAudioUtils::FindWaterBodiesInWorld(WorldContext, CachedWaterBodies);
    bWaterBodiesInitialized = true;
    XLogIf(FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("WaterAudioSystem: Found ").Append(CachedWaterBodies.Num()).Append(" water bodies in world"));
    return;
}
UFUNCTION()
bool IsInWaterByRaycast(const FVector &inout Position, const float32 TraceDistance, FVector &inout OutWaterIntersectionPoint)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
}
