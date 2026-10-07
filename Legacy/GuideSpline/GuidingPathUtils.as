
namespace FGuidingPathUtils
{
void EmitOrQueueGuidingPathRequest(const FECSEntity &inout Requester, const int Kind, const FECSEntity &inout TargetEntity, const FVector2D &inout TargetLocation2D, const FVector &inout TargetLocation, const bool bHasTargetLocation)
{
    FC_GuidingPathRequestThrottle local_6;
    local_6.PendingKind = Kind;
    local_6.PendingTargetEntity = TargetEntity;
    local_6.PendingTargetLocation2D = TargetLocation2D;
    local_6.PendingTargetLocation = TargetLocation;
    local_6.bHasNewRequest = true;
    return;
}
UFUNCTION()
void RequestGuidingPathToEntityID(const FECSEntityId &inout EntityId, const FECSEntity &inout Requester)
{
    Has local_4;
    local_4.opCall();
    Has local_10;
    local_10.opCall();
    FC_GuidingPathManualUpdateTag local_16;
    Assign local_14;
    local_14.opCall(local_16);
    FGuidingPathUtils::EmitOrQueueGuidingPathRequest(Requester, 1, FECSEntity(EntityId), FVector2D::ZeroVector, FVector::ZeroVector, false);
    return;
}
UFUNCTION()
void RequestGuidingPathToLocation2D(const FVector2D &inout Position2D, const FECSEntity &inout Requester)
{
    Has local_4;
    local_4.opCall();
    Has local_10;
    local_10.opCall();
    FC_GuidingPathManualUpdateTag local_16;
    Assign local_14;
    local_14.opCall(local_16);
    FGuidingPathUtils::EmitOrQueueGuidingPathRequest(Requester, 2, FECSEntity(), Position2D, FVector::ZeroVector, false);
    return;
}
UFUNCTION()
void RequestGuidingPathToLocation(const FVector &inout Position, const FECSEntity &inout Requester)
{
    Has local_4;
    local_4.opCall();
    Has local_10;
    local_10.opCall();
    FC_GuidingPathManualUpdateTag local_16;
    Assign local_14;
    local_14.opCall(local_16);
    FGuidingPathUtils::EmitOrQueueGuidingPathRequest(Requester, 3, FECSEntity(), FVector2D(Position.X, Position.Y), Position, true);
    return;
}
UFUNCTION()
void RequestGuidingPathCancel(const FECSEntity &inout Requester)
{
    Modify local_4;
    FC_GuidingPathRequestThrottle& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.bHasNewRequest = false;
        local_6.bPending = false;
        local_6.PendingKind = 0;
        local_6.LastFireTime = -1;
    }
    if (FGuidingPathUtils::ExistsAnyGuidingPath(Requester))
    {
        SendEvent local_12;
        local_12.opCall(FFPTime(-1));
    }
    return;
}
void ServerCancelGuidingPath(const FECSEntity &inout Player)
{
    Remove local_4;
    local_4.opCall();
    Remove local_10;
    local_10.opCall();
    return;
}
UFUNCTION()
void ServerSetGuidingPathTargetEntity(const FECSEntity &inout Entity, const FECSEntity &inout Requester, const bool bManual)
{
    Has local_4;
    local_4.opCall();
    FC_GuidingPathUpdateInfo local_12;
    local_12.TargetEntity = Entity;
    local_12.bPendingManualResult = bManual;
    SendEvent local_16;
    local_16.opCall(FFPTime(-1));
    return;
}
UFUNCTION()
void ServerSetGuidingPathTargetLocation(const FVector &inout Location, const FECSEntity &inout Requester, const bool bManual)
{
    Has local_4;
    local_4.opCall();
    FC_GuidingPathUpdateInfo local_12;
    local_12.TargetEntity = FECSEntity();
    local_12.TargetLocation = Location;
    local_12.bPendingManualResult = bManual;
    SendEvent local_20;
    local_20.opCall(FFPTime(-1));
    return;
}
UFUNCTION()
bool ExistsAnyGuidingPath(const FECSEntity &inout Requester)
{
    Has local_4;
    local_4.opCall();
    Get local_10;
    const FC_GuidingPathPoints& local_12 = local_10.opCall();
    if (local_12)
    {
        return local_12.GetbLastFindPathSuccess();
    }
    return false;
}
UFUNCTION()
FECSEntityId GetGuidingPathTargetEntityID(const FECSEntity &inout Requester)
{
    Has local_4;
    local_4.opCall();
    Get local_10;
    const FC_GuidingPathPoints& local_12 = local_10.opCall();
    if (local_12)
    {
        if (local_12.GetbLastFindPathSuccess())
        {
            return local_12.GetTargetEntity().GetId();
        }
    }
    return FECSEntityId();
}
UFUNCTION()
TDataObjectPtr<FBasePrefabConfig> GetGuidingPathTargetEntityConfig(const FECSEntity &inout Requester)
{
    Has local_4;
    local_4.opCall();
    Get local_10;
    const FC_GuidingPathPoints& local_12 = local_10.opCall();
    if (local_12)
    {
        if (local_12.GetbLastFindPathSuccess())
        {
            return local_12.GetTargetEntityPrefabConfig();
        }
    }
    return TDataObjectPtr<FBasePrefabConfig>();
}
UFUNCTION()
bool IsGuidingPathToEntity(const FECSEntity &inout Requester)
{
    Has local_4;
    local_4.opCall();
    Get local_10;
    const FC_GuidingPathPoints& local_12 = local_10.opCall();
    if (local_12)
    {
        FECSEntityId local_13;
        return local_12.GetbLastFindPathSuccess() && !((local_12.GetTargetEntity().GetId() == local_13));
    }
    return false;
}
bool GetGuidingPathTargetLocation(const FECSEntity &inout RequesterPawn, const FVector2D &inout Position2D, FVector &inout OutLocation)
{
    GetDefaulted local_10;
    FVector local_6 = local_10.opCall().GetPosition();
    float32 local_11 = 1000000.0f;
    FVector local_28 = FVector(Position2D.X, Position2D.Y, (local_6.Z + local_11));
    float local_30_2 = local_6.Z - local_11;
    FVector local_18 = FVector(Position2D.X, Position2D.Y, local_30_2);
    FHitResult local_102;
    FCollisionQueryParams local_140;
    FCollisionResponseParams local_151;
    bool local_154 = FPhysicsUtils::LineTraceSingle(RequesterPawn, false, EPhysicsTraceTag(31), local_102, local_28, local_18, FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)), local_140, local_151);
    if (local_154)
    {
        OutLocation = local_102.Location;
        return true;
    }
    return false;
}
bool GetGuidingPathTargetLocationFromHint(const FECSEntity &inout RequesterPawn, const FVector &inout HintLocation, FVector &inout OutLocation)
{
    float32 local_3 = 3000.0f;
    FVector local_20 = FVector(HintLocation.X, HintLocation.Y, (HintLocation.Z + 50.0f));
    float local_22_2 = HintLocation.Z - local_3;
    FVector local_10 = FVector(HintLocation.X, HintLocation.Y, local_22_2);
    FHitResult local_94;
    FCollisionQueryParams local_132;
    FCollisionResponseParams local_143;
    bool local_146 = FPhysicsUtils::LineTraceSingle(RequesterPawn, false, EPhysicsTraceTag(31), local_94, local_20, local_10, FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)), local_132, local_143);
    if (local_146)
    {
        OutLocation = local_94.Location;
        return true;
    }
    OutLocation = HintLocation;
    return true;
}
}
