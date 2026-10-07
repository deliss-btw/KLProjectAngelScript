
namespace FSimplifiedSpatialAudioUtils
{
    const FConsoleVariable CVar_SimplifiedSpatialAudio_Log = FConsoleVariable();
    const FConsoleVariable CVar_SimplifiedSpatialAudio_VerboseLog = FConsoleVariable();
    const float32 DefaultDisabledDistance = 10000f;
    const float32 DefaultBasic3DDistance = 5000f;
    const float32 DefaultSimpleReflectionDistance = 2000f;
    const float32 DefaultFullReflectionDistance = 1000f;

UFUNCTION()
bool EnableLog()
{
    return FSimplifiedSpatialAudioUtils::CVar_SimplifiedSpatialAudio_Log.GetBool();
}
UFUNCTION()
bool EnableVerboseLog()
{
    return FSimplifiedSpatialAudioUtils::CVar_SimplifiedSpatialAudio_VerboseLog.GetBool();
}
UFUNCTION()
bool HasNearbySpatialAudioVolume(const FVector &inout Location, const float32 Radius)
{
    AAkSpatialAudioVolume local_28;
    if (ECS::GetUEWorld() == nullptr)
    {
        return false;
    }
    TArray<AActor> local_10;
    GetAllActorsOfClass(AAkSpatialAudioVolume, local_10);
    for (auto local_26 : local_10)
    {
        local_28 = Cast<AAkSpatialAudioVolume>(local_26);
        if (local_28 != nullptr)
        {
            float32 local_47 = float32(Location.Distance(local_28.GetActorLocation()));
            if (local_47 <= Radius)
            {
                XLogIf(FSimplifiedSpatialAudioUtils::EnableVerboseLog(), ELog(1), (FString("HasNearbySpatialAudioVolume: Found volume at distance ") + local_47));
                return true;
            }
        }
    }
    XLogIf(FSimplifiedSpatialAudioUtils::EnableVerboseLog(), ELog(1), (FString("HasNearbySpatialAudioVolume: No volumes found within radius ") + Radius));
    return false;
}
UFUNCTION()
void AssignSimplifiedSpatialAudio(const FECSEntity &inout Entity)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        FC_SimplifiedSpatialAudio local_8;
        local_8.VolumeCenter = FVector::ZeroVector;
        local_8.VolumeExtent = FVector(100.0, 100.0, 100.0);
        local_8.bIsActive = true;
        XLogIf(FSimplifiedSpatialAudioUtils::EnableLog(), ELog(1), (FString("SimplifiedSpatialAudioUtils: Assigned component to entity ") + Entity.GetEntityName()));
    }
    return;
}
UFUNCTION()
FVector GetListenerPosition()
{
    int local_8 = 0;
    int local_26 = 0;
    if (!(ECS::GetECSWorld().IsValid()))
    {
        XLogIf(FSimplifiedSpatialAudioUtils::EnableVerboseLog(), ELog(1), "GetListenerPosition: World is not valid");
        return FVector::ZeroVector;
    }
    if (!(local_8))
    {
        XLogIf(FSimplifiedSpatialAudioUtils::EnableVerboseLog(), ELog(1), "GetListenerPosition: LocalPlayer is null");
        return FVector::ZeroVector;
    }
    if (!(local_8.GetPlayerPawnEntity().IsValid()))
    {
        XLogIf(FSimplifiedSpatialAudioUtils::EnableVerboseLog(), ELog(1), "GetListenerPosition: PlayerPawnEntity is not valid");
        return FVector::ZeroVector;
    }
    Has local_24;
    bool local_5 = local_24.opCall();
    if (local_5)
    {
        FString local_38 = (FString("GetListenerPosition: Got player position at ") + local_26.GetPosition());
        XLogIf(FSimplifiedSpatialAudioUtils::EnableVerboseLog(), ELog(1), local_38);
        return local_26.GetPosition();
    }
    XLogIf(FSimplifiedSpatialAudioUtils::EnableVerboseLog(), ELog(1), "GetListenerPosition: PlayerPawnEntity has no FC_Transform");
    return FVector::ZeroVector;
}
UFUNCTION()
void UpdateBasic3DPosition(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_SimplifiedSpatialAudio &inout SpatialAudio)
{
    SpatialAudio.VolumeCenter = Transform.GetPosition();
    SpatialAudio.CurrentReflectionPoints.Empty(0);
    SpatialAudio.CurrentReverbValue = 0.0f;
    return;
}
UFUNCTION()
void UpdateSimpleReflections(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_SimplifiedSpatialAudio &inout SpatialAudio)
{
    FVector local_12 = FSimplifiedSpatialAudioUtils::GetListenerPosition();
    if ((local_12 == FVector::ZeroVector))
    {
        return;
    }
    SpatialAudio.CurrentReflectionPoints = FSimplifiedSpatialAudioUtils::CalculateSimpleReflections(Transform.GetPosition(), local_12, SpatialAudio);
    return;
}
UFUNCTION()
void UpdateFullReflections(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_SimplifiedSpatialAudio &inout SpatialAudio)
{
    FSimplifiedSpatialAudioUtils::UpdateSimpleReflections(Entity, Transform, SpatialAudio);
    return;
}
UFUNCTION()
void UpdateSimpleReverb(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_SimplifiedSpatialAudio &inout SpatialAudio)
{
    FVector local_12 = FSimplifiedSpatialAudioUtils::GetListenerPosition();
    if ((local_12 == FVector::ZeroVector))
    {
        return;
    }
    SpatialAudio.CurrentReverbValue = FSimplifiedSpatialAudioUtils::CalculateSimpleReverb(local_12, SpatialAudio);
    return;
}
UFUNCTION()
void PrecomputeReflectionPoints(FC_SimplifiedSpatialAudio &inout Volume)
{
    if (Volume.bReflectionDataPrecomputed)
    {
        return;
    }
    Volume.ReflectionPoints.Empty(0);
    Volume.ReflectionPlanes.Empty(0);
    FVector local_14;
    FVector local_20 = (local_14 - Volume.VolumeExtent);
    FVector local_8 = (local_14 + Volume.VolumeExtent);
    Volume.ReflectionPlanes.Add(FPlane(local_8, FVector::UpVector));
    Volume.ReflectionPlanes.Add(FPlane(local_20, FVector::UpVector.opNeg()));
    Volume.ReflectionPlanes.Add(FPlane(local_8, FVector::ForwardVector));
    Volume.ReflectionPlanes.Add(FPlane(local_20, FVector::ForwardVector.opNeg()));
    Volume.ReflectionPlanes.Add(FPlane(local_8, FVector::RightVector));
    Volume.ReflectionPlanes.Add(FPlane(local_20, FVector::RightVector.opNeg()));
    int local_37 = 0;
    for (; local_37 < Volume.ReflectionPlanes.Num(); )
    {
        FVector local_26 = ((FVector(FPlane(Volume.ReflectionPlanes[local_37]).GetNormal()) * Volume.MaxReflectionDistance) * 0.5);
        FVector local_64;
        Volume.ReflectionPoints.Add((local_64 + local_26));
        ++local_37;
    }
    Volume.bReflectionDataPrecomputed = true;
    int local_2 = Volume.ReflectionPoints.Num();
    FString local_72 = (FString("SimplifiedSpatialAudio: Precomputed ") + local_2);
    FString local_68 = (local_72 + " reflection points for volume");
    XLogIf(FSimplifiedSpatialAudioUtils::EnableLog(), ELog(1), local_68);
    return;
}
UFUNCTION()
bool TraceSimpleRay(const FVector &inout Start, const FVector &inout End, const FC_SimplifiedSpatialAudio &inout Volume, FVector &inout HitPoint)
{
    FVector local_18 = (Volume.VolumeCenter - Volume.VolumeExtent);
    FVector local_6 = (Volume.VolumeCenter + Volume.VolumeExtent);
    FVector local_24 = (End - Start).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    float32 local_35 = 0.0f;
    float32 local_36 = (float32(((End - Start).Size())));
    int local_37 = 0;
    for (; local_37 < 3; ++local_37)
    {
        if (FMath::Abs(local_24[local_37]) < 1e-6)
        {
            if (Start[local_37] < local_18[local_37] || (Start[local_37] > local_6[local_37]))
            {
                return false;
            }
            continue;
        }
        float local_42 = Start[local_37];
        local_42 = (local_18[local_37] - local_42) / local_24[local_37];
        float32 local_33 = float32(local_42);
        local_42 = Start[local_37];
        local_42 = (local_6[local_37] - local_42) / local_24[local_37];
        float32 local_46 = float32(local_42);
        if (local_33 > local_46)
        {
            float32 local_50 = local_33;
            local_33 = local_46;
            local_46 = local_50;
        }
        local_35 = FMath::Max(local_35, local_33);
        local_36 = FMath::Min(local_36, local_46);
        if (local_35 > local_36)
        {
            return false;
        }
    }
    if (local_35 <= local_36)
    {
        HitPoint = (Start + (local_24 * local_35));
        return true;
    }
    return false;
}
UFUNCTION()
bool IsPointInVolume(const FVector &inout Point, const FC_SimplifiedSpatialAudio &inout Volume)
{
    FVector local_18 = (Volume.VolumeCenter - Volume.VolumeExtent);
    FVector local_6 = (Volume.VolumeCenter + Volume.VolumeExtent);
    return (Point.X >= local_18.X && (Point.X <= local_6.X) && (Point.Y >= local_18.Y) && (Point.Y <= local_6.Y) && (Point.Z >= local_18.Z) && (Point.Z <= local_6.Z));
}
UFUNCTION()
float32 CalculateAcousticAttenuation(const FVector &inout Emitter, const FVector &inout Listener, const FC_SimplifiedSpatialAudio &inout Volume)
{
    float32 local_14 = FMath::Max(0.0f, (1.0f - ((float32(((Listener - Emitter).Size()))) / Volume.MaxReflectionDistance)));
    float32 local_15 = 1.0f;
    if (FSimplifiedSpatialAudioUtils::IsPointInVolume(Listener, Volume))
    {
        local_15 = 0.8f;
    }
    return local_14 * local_15;
}
UFUNCTION()
ESpatialAudioLODLevel GetLODLevel(const FVector &inout Emitter, const FVector &inout Listener, const float32 Distance)
{
    if (Distance >= 10000.0f)
    {
        return ESpatialAudioLODLevel(0);
    }
    if (Distance >= 5000.0f)
    {
        return ESpatialAudioLODLevel(1);
    }
    if (Distance >= 2000.0f)
    {
        return ESpatialAudioLODLevel(2);
    }
    return ESpatialAudioLODLevel(3);
}
UFUNCTION()
TArray<FVector> CalculateSimpleReflections(const FVector &inout Emitter, const FVector &inout Listener, const FC_SimplifiedSpatialAudio &inout Volume)
{
    TArray<FVector> local_4;
    if (!(Volume.bEnableReflections) || (Volume.ReflectionPoints.Num() == 0))
    {
        return local_4;
    }
    TArray<FVector> local_12;
    local_12.Add(FVector::ForwardVector);
    local_12.Add(FVector::RightVector);
    local_12.Add(FVector::UpVector);
    local_12.Add(FVector::ForwardVector.opNeg());
    local_12.Add(FVector::RightVector.opNeg());
    local_12.Add(FVector::UpVector.opNeg());
    int local_19 = 0;
    int local_20 = 0;
    for (; local_20 < local_12.Num(); ++local_20)
    {
        if (local_19 >= int(Volume.MaxReflectionRays))
        {
            break;
        }
        FVector local_18 = (Emitter + (local_12[local_20] * Volume.MaxReflectionDistance));
        FVector local_42;
        if (FSimplifiedSpatialAudioUtils::TraceSimpleRay(Emitter, local_18, Volume, local_42))
        {
            local_4.Add((local_42 + ((Listener - local_42).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * 50.0)));
            ++local_19;
        }
    }
    return local_4;
}
UFUNCTION()
float32 CalculateSimpleReverb(const FVector &inout Position, const FC_SimplifiedSpatialAudio &inout Volume)
{
    if (!(Volume.bEnableReverb))
    {
        return 0.0f;
    }
    float32 local_2 = float32(((Position - Volume.VolumeCenter).Size()));
    float32 local_3 = float32(Volume.VolumeExtent.GetMax());
    if (local_2 > local_3)
    {
        return 0.0f;
    }
    float32 local_15 = 1.0f - (local_2 / local_3);
    float32 local_14 = Volume.ReverbGain * local_15;
    return FMath::Clamp(local_14, 0.0f, 1.0f);
}
UFUNCTION()
void UpdatePerformanceStats(const float32 UpdateTime)
{
    FString local_8 = (FString("SimplifiedSpatialAudio Performance: UpdateTime=") + UpdateTime);
    FString local_4 = (local_8 + "ms");
    XLogIf(FSimplifiedSpatialAudioUtils::EnableVerboseLog(), ELog(1), local_4);
    return;
}
UFUNCTION()
void GetPerformanceStats(float32 &inout AverageTime, float32 &inout MaxTime, int &inout TotalCount)
{
    AverageTime = 0.0f;
    MaxTime = 0.0f;
    TotalCount = 0;
    return;
}
UFUNCTION()
void ResetPerformanceStats()
{
    return;
}
UFUNCTION()
void SetGlobalLODSettings(const FSimplifiedSpatialAudioLODSettings &inout Settings)
{
    XLogIf(FSimplifiedSpatialAudioUtils::EnableLog(), ELog(1), "SimplifiedSpatialAudio: LOD settings ignored in simplified version");
    return;
}
UFUNCTION()
FSimplifiedSpatialAudioLODSettings GetGlobalLODSettings()
{
    FSimplifiedSpatialAudioLODSettings local_8;
    local_8.DisabledDistance = 10000.0f;
    local_8.Basic3DDistance = 5000.0f;
    local_8.SimpleReflectionDistance = 2000.0f;
    local_8.FullReflectionDistance = 1000.0f;
    return local_8;
}
}
