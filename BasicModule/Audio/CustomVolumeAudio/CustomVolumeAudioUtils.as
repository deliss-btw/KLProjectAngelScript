
namespace FCustomVolumeAudioUtils
{
UFUNCTION()
bool EnableLog()
{
    return false;
}
UFUNCTION()
bool EnableVerboseLog()
{
    return false;
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
    XLogIf(FCustomVolumeAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("CalculateDistanceToPolygon: Checking point (").Append(FString::ApplyFormat(Point.X, ".2f")).Append(", ").Append(FString::ApplyFormat(Point.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(Point.Z, ".2f")).Append(") against ").Append(PolygonVertices.Num()).Append(" vertices"));
    int local_32 = 0;
    for (; local_32 < PolygonVertices.Num(); ++local_32)
    {
        FVector local_38(PolygonVertices[local_32]);
        int local_1 = (local_32 + 1) % PolygonVertices.Num();
        FVector local_44(PolygonVertices[local_1]);
        FVector local_58 = FCustomVolumeAudioUtils::GetClosestPointOnLineSegment(Point, local_38, local_44);
        float32 local_4 = float32(Point.Distance(local_58));
        XLogIf(FCustomVolumeAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("CalculateDistanceToPolygon: Segment ").Append(local_32).Append(": (").Append(FString::ApplyFormat(local_38.X, ".2f")).Append(", ").Append(FString::ApplyFormat(local_38.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(local_38.Z, ".2f")).Append(") to (").Append(FString::ApplyFormat(local_44.X, ".2f")).Append(", ").Append(FString::ApplyFormat(local_44.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(local_44.Z, ".2f")).Append(")"));
        XLogIf(FCustomVolumeAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("CalculateDistanceToPolygon: Closest point on segment = (").Append(FString::ApplyFormat(local_58.X, ".2f")).Append(", ").Append(FString::ApplyFormat(local_58.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(local_58.Z, ".2f")).Append("), distance = ").Append(FString::ApplyFormat(local_4, ".2f")));
        if (local_4 < local_5)
        {
            local_5 = local_4;
            local_12 = local_58;
            XLogIf(FCustomVolumeAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("CalculateDistanceToPolygon: New nearest point found at (").Append(FString::ApplyFormat(local_12.X, ".2f")).Append(", ").Append(FString::ApplyFormat(local_12.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(local_12.Z, ".2f")).Append(")"));
        }
    }
    OutNearestPoint = local_12;
    FString local_30_2 = FString();
    XLogIf(FCustomVolumeAudioUtils::EnableLog(), ELog(1), local_30_2.Append("CalculateDistanceToPolygon: Final nearest point = (").Append(FString::ApplyFormat(OutNearestPoint.X, ".2f")).Append(", ").Append(FString::ApplyFormat(OutNearestPoint.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(OutNearestPoint.Z, ".2f")).Append("), distance = ").Append(FString::ApplyFormat(local_5, ".2f")));
    return local_5;
}
UFUNCTION()
bool IsPointInPolygon(const FVector &inout Point, const TArray<FVector> &inout PolygonVertices)
{
    bool local_3;
    if (PolygonVertices.Num() < 3)
    {
        XLogIf(FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("IsPointInPolygon: Not enough vertices (").Append(PolygonVertices.Num()).Append(" < 3)"));
        return false;
    }
    XLogIf(FCustomVolumeAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("IsPointInPolygon: Checking point (").Append(FString::ApplyFormat(Point.X, ".2f")).Append(", ").Append(FString::ApplyFormat(Point.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(Point.Z, ".2f")).Append(")"));
    XLogIf(FCustomVolumeAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("IsPointInPolygon: Polygon has ").Append(PolygonVertices.Num()).Append(" vertices"));
    bool local_25 = false;
    int local_1 = PolygonVertices.Num() - 1;
    int local_27 = 0;
    for (; local_27 < PolygonVertices.Num(); )
    {
        FVector local_34(PolygonVertices[local_27]);
        FVector local_40(PolygonVertices[local_1]);
        if (FCustomVolumeAudioUtils::IsPointOnLineSegment(Point, local_34, local_40))
        {
            XLogIf(FCustomVolumeAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("IsPointInPolygon: Point is on boundary between vertices ").Append(local_27).Append(" and ").Append(local_1));
            return true;
        }
        local_3 = !((local_34.Y > Point.Y));
        bool local_43 = !((local_40.Y > Point.Y));
        if (local_3 == local_43)
        {
            local_3 = false;
        }
        else
        {
            float local_42 = local_40.X - local_34.X;
            float local_12 = Point.Y - local_34.Y;
            float local_46 = local_42 * local_12;
            local_12 = local_40.Y;
            local_12 = local_12 - local_34.Y;
            local_42 = local_46 / local_12;
            local_3 = (Point.X < (local_42 + local_34.X));
        }
        if (local_3)
        {
            local_25 = !(local_25);
            FString local_8 = FString();
            local_43 = FCustomVolumeAudioUtils::EnableVerboseLog();
            XLogIf(local_43, ELog(1), local_8.Append("IsPointInPolygon: Crossing edge ").Append(local_27).Append("->").Append(local_1).Append(", bInside = ").Append(local_25));
        }
        local_1 = local_27;
        ++local_27;
    }
    XLogIf(FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("IsPointInPolygon: Final result = ").Append(local_25));
    return local_25;
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
bool ExtractVolumeSplineVertices(const ACustomConvexVolume Volume, TArray<FVector> &inout OutVertices)
{
    if (Volume == nullptr)
    {
        return false;
    }
    USplineComponent local_6 = Volume.Spline;
    if (local_6 == nullptr)
    {
        return false;
    }
    OutVertices.Empty(0);
    int local_7 = local_6.GetNumberOfSplinePoints();
    XLogIf(FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("ExtractVolumeSplineVertices: Found ").Append(local_7).Append(" spline points"));
    if (local_7 < 3)
    {
        XLogIf(FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("ExtractVolumeSplineVertices: Not enough points (").Append(local_7).Append(" < 3)"));
        return false;
    }
    int local_14 = 0;
    for (; local_14 < local_7; )
    {
        FVector local_30 = local_6.GetLocationAtSplinePoint(local_14, ESplineCoordinateSpace(1));
        OutVertices.Add(local_30);
        XLogIf(FCustomVolumeAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("ExtractVolumeSplineVertices: Point ").Append(local_14).Append(" = (").Append(FString::ApplyFormat(local_30.X, ".2f")).Append(", ").Append(FString::ApplyFormat(local_30.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(local_30.Z, ".2f")).Append(")"));
        ++local_14;
    }
    XLogIf(FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("ExtractVolumeSplineVertices: Successfully extracted ").Append(OutVertices.Num()).Append(" vertices"));
    return true;
}
UFUNCTION()
bool IsPointInCustomVolume(const FVector &inout Point, const ACustomConvexVolume Volume)
{
    if (Volume == nullptr)
    {
        return false;
    }
    TArray<FVector> local_6;
    if (!(FCustomVolumeAudioUtils::ExtractVolumeSplineVertices(Volume, local_6)))
    {
        return false;
    }
    if (!(FCustomVolumeAudioUtils::IsPointInPolygon(Point, local_6)))
    {
        return false;
    }
    float32 local_7 = 1000000.0f;
    float32 local_9 = -1000000.0f;
    for (auto& local_24 : local_6)
    {
        local_7 = FMath::Min(local_7, float32(local_24.Z));
        float32 local_27 = float32(local_24.Z);
        local_9 = FMath::Max(local_9, local_27);
    }
    float32 local_28 = Volume.ShapeHeight;
    float32 local_29 = Volume.ShapeDescent;
    float32 local_27_2 = local_7 - local_29;
    float32 local_30 = local_9 + (local_28 - local_29);
    bool local_1 = (Point.Z >= local_27_2) && (Point.Z <= local_30);
    XLogIf(FCustomVolumeAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("IsPointInCustomVolume: Point Z = ").Append(FString::ApplyFormat(Point.Z, ".2f")).Append(", Volume Z range = [").Append(FString::ApplyFormat(local_27_2, ".2f")).Append(", ").Append(FString::ApplyFormat(local_30, ".2f")).Append("], InHeightRange = ").Append(local_1));
    return local_1;
}
UFUNCTION()
float32 CalculateDistanceToCustomVolume(const FVector &inout Point, const ACustomConvexVolume Volume, FVector &inout OutNearestPoint)
{
    if (Volume == nullptr)
    {
        OutNearestPoint = Point;
        return 1000000.0f;
    }
    TArray<FVector> local_6;
    if (!(FCustomVolumeAudioUtils::ExtractVolumeSplineVertices(Volume, local_6)))
    {
        OutNearestPoint = Point;
        return 1000000.0f;
    }
    if (FCustomVolumeAudioUtils::IsPointInCustomVolume(Point, Volume))
    {
        OutNearestPoint = Point;
        return 0.0f;
    }
    float32 local_2 = FCustomVolumeAudioUtils::CalculateDistanceToPolygon(Point, local_6, OutNearestPoint);
    float32 local_8 = 1000000.0f;
    float32 local_9 = -1000000.0f;
    for (auto& local_24 : local_6)
    {
        local_8 = FMath::Min(local_8, float32(local_24.Z));
        float32 local_27 = float32(local_24.Z);
        local_9 = FMath::Max(local_9, local_27);
    }
    float32 local_28 = Volume.ShapeHeight;
    float32 local_29 = Volume.ShapeDescent;
    float32 local_27_2 = local_8 - local_29;
    float32 local_30 = local_9 + (local_28 - local_29);
    float32 local_32 = 0.0f;
    if (Point.Z < local_27_2)
    {
        local_32 = local_27_2 - float32(Point.Z);
    }
    else
    {
        if (Point.Z > local_30)
        {
            local_32 = float32(Point.Z) - local_30;
        }
    }
    float32 local_7_3 = FMath::Sqrt(((local_2 * local_2) + (local_32 * local_32)));
    FString local_40 = FString();
    bool local_1 = FCustomVolumeAudioUtils::EnableVerboseLog();
    XLogIf(local_1, ELog(1), local_40.Append("CalculateDistanceToCustomVolume: 2D Distance = ").Append(FString::ApplyFormat(local_2, ".2f")).Append(", Height Distance = ").Append(FString::ApplyFormat(local_32, ".2f")).Append(", Final Distance = ").Append(FString::ApplyFormat(local_7_3, ".2f")));
    return local_7_3;
}
UFUNCTION()
void FindCustomVolumesInRadius(const UWorld World, const FVector &inout Center, const float32 Radius, TArray<TWeakObjectPtr<ACustomConvexVolume>> &inout OutVolumes)
{
    ACustomConvexVolume local_26;
    if (World == nullptr)
    {
        return;
    }
    OutVolumes.Empty(0);
    TArray<AActor> local_8;
    GetAllActorsOfClass(ACustomConvexVolume, local_8);
    for (auto local_24 : local_8)
    {
        local_26 = Cast<ACustomConvexVolume>(local_24);
        if (local_26 != nullptr)
        {
            if (float32(Center.Distance(local_26.GetActorLocation())) <= Radius)
            {
                OutVolumes.Add(TWeakObjectPtr<ACustomConvexVolume>(local_26));
            }
        }
    }
    return;
}
UFUNCTION()
bool FindNearestCustomVolume(const FVector &inout Position, const TArray<TWeakObjectPtr<ACustomConvexVolume>> &inout Volumes, ACustomConvexVolume &inout OutNearestVolume, float32 &inout OutDistance)
{
    ACustomConvexVolume local_8;
    ACustomConvexVolume local_24;
    if (Volumes.Num() == 0)
    {
        return false;
    }
    float32 local_4 = 1000000.0f;
    for (auto& local_22 : Volumes)
    {
        local_22;
        if (local_24 == nullptr)
        {
            continue;
        }
        FVector local_32;
        float32 local_5 = FCustomVolumeAudioUtils::CalculateDistanceToCustomVolume(Position, local_24, local_32);
        if (local_5 < local_4)
        {
            local_4 = local_5;
            local_8 = local_24;
        }
    }
    if (local_8 != nullptr)
    {
        OutNearestVolume = local_8;
        OutDistance = local_4;
        return true;
    }
    return false;
}
UFUNCTION()
void ShowCustomVolume(const ACustomConvexVolume Volume)
{
    if (Volume == nullptr)
    {
        return;
    }
    Volume.ShowVolumeMesh();
    return;
}
UFUNCTION()
void HideCustomVolume(const ACustomConvexVolume Volume)
{
    if (Volume == nullptr)
    {
        return;
    }
    Volume.HideVolumeMesh();
    return;
}
UFUNCTION()
void UpdateCustomVolumeData(const FECSEntity &inout Entity, FC_CustomVolumeAudio &inout VolumeAudio, const ACustomConvexVolume Volume)
{
    if ((!((VolumeAudio.TargetVolume == Volume))))
    {
        VolumeAudio.TargetVolume = Volume;
        VolumeAudio.VolumeAreaType = Volume.AreaType;
        FName local_10 = Entity.GetEntityName();
        FString local_8 = FString();
        bool local_3 = FCustomVolumeAudioUtils::EnableLog();
        XLogIf(local_3, ELog(1), local_8.Append("UpdateCustomVolumeData: Updated volume data for entity ").Append(local_10).Append(", AreaType = ").Append(VolumeAudio.VolumeAreaType));
    }
    return;
}
UFUNCTION()
void CalculateAudioPosition(const FECSEntity &inout Entity, FC_CustomVolumeAudio &inout VolumeAudio, const FVector &inout PlayerLocation)
{
    if ((VolumeAudio.TargetVolume == nullptr))
    {
        return;
    }
    XLogIf(FCustomVolumeAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("CalculateAudioPosition: Player at (").Append(FString::ApplyFormat(PlayerLocation.X, ".2f")).Append(", ").Append(FString::ApplyFormat(PlayerLocation.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(PlayerLocation.Z, ".2f")).Append(")"));
    ACustomConvexVolume local_26;
    bool local_3 = FCustomVolumeAudioUtils::IsPointInCustomVolume(PlayerLocation, local_26);
    XLogIf(FCustomVolumeAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("CalculateAudioPosition: IsInsideVolume = ").Append(local_3));
    if (local_3)
    {
        VolumeAudio.AudioState = ECustomVolumeAudioState(1);
        XLogIf(FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("CalculateAudioPosition: Setting state to Inside"));
        VolumeAudio.AudioPosition = PlayerLocation;
        VolumeAudio.NearestVolumePoint = PlayerLocation;
        VolumeAudio.DistanceToVolume = 0.0f;
        return;
    }
    VolumeAudio.AudioState = ECustomVolumeAudioState(0);
    XLogIf(FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("CalculateAudioPosition: Setting state to Outside"));
    FVector local_34;
    float32 local_28_2 = FCustomVolumeAudioUtils::CalculateDistanceToCustomVolume(PlayerLocation, local_26, local_34);
    VolumeAudio.NearestVolumePoint = local_34;
    VolumeAudio.AudioPosition = local_34;
    VolumeAudio.DistanceToVolume = local_28_2;
    FString local_8 = FString();
    XLogIf(FCustomVolumeAudioUtils::EnableVerboseLog(), ELog(1), local_8.Append("CalculateAudioPosition: Distance to nearest volume point = ").Append(FString::ApplyFormat(local_28_2, ".2f")));
    return;
}
UFUNCTION()
FSimpleAudioSet GetAudioSetByAreaType(const ECustomAreaType AreaType)
{
    FSimpleAudioSet __r;
    FCustomVolumeAudioConfigUtils::GetAudioSetByAreaType(ECustomAreaType(AreaType));
    return __r;
}
UFUNCTION()
float32 GetAttenuationRadiusByAreaType(const int AreaType)
{
    return FGameAudioSettings::Get().DefaultCustomVolumeAudioAttenuationRadius;
}
UFUNCTION()
float32 GetSearchRadiusByAreaType(const int AreaType)
{
    return FGameAudioSettings::Get().CustomVolumeAudioSearchRadius;
}
UFUNCTION()
int PlayCustomVolumeAudio(const FECSEntity &inout Entity, const FVector &inout Position, const FName &inout EventName)
{
    return FGameAudioUtils::PlayEventAtLocation(EventName, Entity, FLoadEventCallback(), Position, FQuat4f::Identity, FGameAudioUtils::GetCachedAudioWorld(), false, true);
}
UFUNCTION()
int PlayCustomVolumeAudioSet(const FECSEntity &inout Entity, const FVector &inout Position, const FSimpleAudioSet &inout AudioSet)
{
    float32 local_34 = 0.0f;
    if (!(AudioSet.State.IsNull()))
    {
        FGameAudioUtils::SetAudioState(AudioSet.State, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
    }
    if (!(AudioSet.Switch.IsNull()))
    {
        FGameAudioUtils::SetAudioSwitch(FName(AudioSet.Switch.GetAssetName()), Entity, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
    }
    for (auto& local_32 : AudioSet.RtpcMap)
    {
        FGameAudioUtils::SetAudioRtpc(local_32.GetKey(), Entity, local_34, 0, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
    }
    if (!(AudioSet.Event.IsNull()))
    {
        return FGameAudioUtils::PlayEventAtLocation(FName(AudioSet.Event.GetAssetName()), Entity, FLoadEventCallback(), Position, FQuat4f::Identity, FGameAudioUtils::GetCachedAudioWorld(), false, true);
    }
    return -1;
}
UFUNCTION()
void StopCustomVolumeAudio(const int AudioID)
{
    if (AudioID >= 0)
    {
        FGameAudioUtils::StopSound(AudioID);
    }
    return;
}
UFUNCTION()
void UpdateCustomVolumeAudioPosition(const int AudioID, const FVector &inout NewPosition)
{
    if (AudioID >= 0)
    {
        int local_3 = AudioID;
        bool local_2 = FGameAudioUtils::UpdateAudioPositionBySoundID(local_3, NewPosition, FQuat4f::Identity);
        if (local_2)
        {
            XLogIf(FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("UpdateCustomVolumeAudioPosition: Successfully updated audio ").Append(AudioID).Append(" position to (").Append(FString::ApplyFormat(NewPosition.X, ".2f")).Append(", ").Append(FString::ApplyFormat(NewPosition.Y, ".2f")).Append(", ").Append(FString::ApplyFormat(NewPosition.Z, ".2f")).Append(")"));
            return;
        }
        XWarning(ELog(1), FString().Append("UpdateCustomVolumeAudioPosition: Failed to update audio ").Append(AudioID).Append(" position"));
    }
    return;
}
UFUNCTION()
void UpdateAudioPlayback(const FECSEntity &inout Entity, FC_CustomVolumeAudio &inout VolumeAudio)
{
    if (int(VolumeAudio.AudioState) == 1)
    {
        if (!(VolumeAudio.bIsAudioPlaying))
        {
            FCustomVolumeAudioUtils::StartCustomVolumeAudio(Entity, VolumeAudio);
        }
        else
        {
            FCustomVolumeAudioUtils::UpdateAudioPosition(Entity, VolumeAudio);
        }
        return;
    }
    float32 local_5 = VolumeAudio.AttenuationRadius;
    if (local_5 <= 0.0f)
    {
        local_5 = FGameAudioSettings::Get().DefaultCustomVolumeAudioAttenuationRadius;
    }
    bool local_4 = (VolumeAudio.DistanceToVolume <= local_5);
    if (local_4 && !(VolumeAudio.bIsAudioPlaying))
    {
        FCustomVolumeAudioUtils::StartCustomVolumeAudio(Entity, VolumeAudio);
        return;
    }
    if ((!(local_4) && VolumeAudio.bIsAudioPlaying))
    {
        FCustomVolumeAudioUtils::StopCustomVolumeAudioForEntity(Entity, VolumeAudio);
        return;
    }
    if (local_4 && VolumeAudio.bIsAudioPlaying)
    {
        FCustomVolumeAudioUtils::UpdateAudioPosition(Entity, VolumeAudio);
    }
    return;
}
UFUNCTION()
void StartCustomVolumeAudio(const FECSEntity &inout Entity, FC_CustomVolumeAudio &inout VolumeAudio)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
UFUNCTION()
void StopCustomVolumeAudioForEntity(const FECSEntity &inout Entity, FC_CustomVolumeAudio &inout VolumeAudio)
{
    if (VolumeAudio.bIsAudioPlaying)
    {
        FCustomVolumeAudioUtils::StopCustomVolumeAudio(int(VolumeAudio.CurrentAudioID));
        VolumeAudio.bIsAudioPlaying = false;
        VolumeAudio.CurrentAudioID = -1;
        XLogIf(FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("StopCustomVolumeAudioForEntity: Stopped audio for entity ").Append(Entity.GetEntityName()));
    }
    return;
}
UFUNCTION()
void UpdateAudioPosition(const FECSEntity &inout Entity, FC_CustomVolumeAudio &inout VolumeAudio)
{
    float32 local_1 = 50.0f;
    float32 local_2 = float32(VolumeAudio.AudioPosition.Distance(VolumeAudio.LastAudioPosition));
    if (local_2 > local_1)
    {
        XLogIf(FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("UpdateAudioPosition: Position changed by ").Append(FString::ApplyFormat(local_2, ".2f")).Append(" (threshold: ").Append(FString::ApplyFormat(local_1, ".2f")).Append("), updating audio position"));
        FCustomVolumeAudioUtils::UpdateCustomVolumeAudioPosition(int(VolumeAudio.CurrentAudioID), VolumeAudio.AudioPosition);
        VolumeAudio.LastAudioPosition = VolumeAudio.AudioPosition;
    }
    return;
}
UFUNCTION()
void RemoveCustomVolumeAudio(const FECSEntity &inout Entity)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        Get local_10;
        FCustomVolumeAudioUtils::StopCustomVolumeAudio(local_10.opCall().CurrentAudioID);
        Remove local_16;
        local_16.opCall();
        XLogIf(FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("RemoveCustomVolumeAudio: Removed FC_CustomVolumeAudio from entity ").Append(Entity.GetEntityName()));
    }
    return;
}
UFUNCTION()
void ForceRefreshCustomVolumeCache(TArray<TWeakObjectPtr<ACustomConvexVolume>> &inout CachedVolumes, bool &inout bVolumesInitialized)
{
    bVolumesInitialized = false;
    CachedVolumes.Empty(0);
    XLog(ELog(1), "ForceRefreshCustomVolumeCache: Force refreshed CustomConvexVolume cache");
    return;
}
UFUNCTION()
int GetCachedCustomVolumeCount(const TArray<TWeakObjectPtr<ACustomConvexVolume>> &inout CachedVolumes)
{
    return CachedVolumes.Num();
}
UFUNCTION()
void ManuallyAssignCustomVolumeAudio(const FECSEntity &inout Entity)
{
    if (Entity.IsValid())
    {
        XWarning(ELog(1), "ManuallyAssignCustomVolumeAudio: This function should be called from System class");
    }
    return;
}
UFUNCTION()
void ManuallyRemoveCustomVolumeAudio(const FECSEntity &inout Entity)
{
    if (Entity.IsValid())
    {
        FCustomVolumeAudioUtils::RemoveCustomVolumeAudio(Entity);
    }
    return;
}
}
