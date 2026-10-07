
namespace FMovementUtils
{
bool TryComputeNonPenetrateLocation(const FHitResult &inout Hit, const FVector &inout CurrentLocation, const float32 SkinOffset, FVector &inout OutSafeLocation)
{
    if (Hit.GetbStartPenetrating())
    {
        if (Hit.PenetrationDepth <= 0.0f)
        {
            return false;
        }
        OutSafeLocation = (CurrentLocation + (FVector(Hit.Normal) * (Hit.PenetrationDepth + SkinOffset)));
    }
    else
    {
        FVector local_24(Hit.Location);
        FVector local_10_2 = (FVector(Hit.Normal) * SkinOffset);
        OutSafeLocation = (local_24 + local_10_2);
    }
    return true;
}
void ApplyNonPenetrateCorrectionIfNeeded(const FECSEntity &inout Entity, const FPropMovementExtraConfig &inout ExtraConfig, const FHitResult &inout Hit, const FVector &inout NowLocation)
{
    if (!(ExtraConfig.GetbAdjustToNonPenetratePositionWhenHit()))
    {
        return;
    }
    FVector local_8;
    if (!(FMovementUtils::TryComputeNonPenetrateLocation(Hit, NowLocation, ExtraConfig.GetNonPenetrateSkinOffset(), local_8)))
    {
        return;
    }
    Modify local_14;
    FC_MovementInfo& local_16 = local_14.opCall();
    if (local_16)
    {
        local_16.SetMoveTotalTime(FFPTime(0));
    }
    ModifyOrAdd local_24;
    local_24.opCall().SetDeltaMovement((local_8 - NowLocation));
    return;
}
bool SamplePredictPath(const TArray<FKLPredictProjectilePathPointData> &inout PathData, const float32 Time, FVector &inout OutLocation, FVector &inout OutVelocity)
{
    if (PathData.Num() == 0)
    {
        return false;
    }
    float32 local_4 = PathData[0].Time;
    if (Time <= local_4)
    {
        OutLocation = PathData[0].Location;
        OutVelocity = FVector(PathData[0].Velocity);
        return true;
    }
    int local_2 = PathData.Num() - 1;
    float32 local_4_2 = PathData[local_2].Time;
    if (Time >= local_4_2)
    {
        OutLocation = PathData[local_2].Location;
        OutVelocity = FVector(PathData[local_2].Velocity);
        return true;
    }
    int local_12 = 0;
    int local_13 = local_2;
    while ((local_13 - local_12) > 1)
    {
        int local_14_2 = local_12 + FMath::IntegerDivisionTrunc(local_13 - local_12, 2);
        float32 local_4_3 = PathData[local_14_2].Time;
        if (local_4_3 <= Time)
        {
            local_12 = local_14_2;
        }
        else
        {
            local_13 = local_14_2;
        }
    }
    const FKLPredictProjectilePathPointData& local_18 = PathData[local_12];
    const FKLPredictProjectilePathPointData& local_20 = PathData[local_13];
    float32 local_4_4 = local_20.Time - local_18.Time;
    float32 local_23 = 0.0f;
    if (local_4_4 > 1e-8f)
    {
        local_23 = (Time - local_18.Time) / local_4_4;
    }
    OutLocation = FMath::Lerp(local_18.Location, local_20.Location, local_23);
    OutVelocity = FMath::Lerp(FVector(local_18.Velocity), FVector(local_20.Velocity), local_23);
    return true;
}
bool GetPredictLocationAndVelocity(const FECSEntity &inout Entity, const float32 SampleTime, FVector &inout OutPredictLocation, FVector &inout OutPredictVelocity)
{
    int local_10 = 0;
    if (!(Entity.IsValid()))
    {
        return false;
    }
    Get local_6;
    if (local_6.opCall())
    {
        if (local_10.Num() > 0)
        {
            float32 local_14 = local_10[(local_10.Num() - 1)].Time;
            if (SampleTime <= local_14)
            {
                if (FMovementUtils::SamplePredictPath(local_10, SampleTime, OutPredictLocation, OutPredictVelocity))
                {
                    return true;
                }
            }
        }
    }
    return false;
}
bool IsCanonicalPropPredictPath(const FECSEntity &inout Entity)
{
    bool local_7;
    Get local_4;
    const FC_ThrowPredictPathKey& local_6 = local_4.opCall();
    if (local_6)
    {
        if (!((int(local_6.GetKeyInfo().GetTargetType())) == 1 && (FECSEntityId(local_6.GetKeyInfo().GetPropEntityId()) == Entity.GetId())))
        {
            local_7 = false;
        }
        else
        {
            Has local_18;
            local_7 = local_18.opCall();
        }
        return local_7;
    }
    return false;
}
void TickThrowMovement(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FThrowMovementConfigData &inout Config, const FC_Transform &inout Transform)
{
    int local_34 = 0;
    int local_44 = 0;
    float local_8 = (FFPTime(MovementInfo.GetMoveTime()) - MovementInfo.GetLastMoveTime()).ToSeconds();
    if (local_8 <= 0.0)
    {
        return;
    }
    bool local_10 = false;
    FVector local_16(FVector::ZeroVector);
    FVector local_22(FVector::ZeroVector);
    bool local_9 = FMovementUtils::IsCanonicalPropPredictPath(Entity);
    float32 local_25 = float32(MovementInfo.GetMoveTime().ToSeconds());
    float32 local_24 = float32(MovementInfo.GetLastMoveTime().ToSeconds());
    if (FMovementUtils::GetPredictLocationAndVelocity(Entity, local_25, local_16, local_22))
    {
        local_10 = true;
    }
    else
    {
        Get local_30;
        if (local_30.opCall())
        {
            if (local_34.Num() > 0)
            {
                float32 local_37;
                local_37 = local_34[(local_34.Num() - 1)].Time;
                if (local_24 < local_37 && (local_25 > local_37) && FMovementUtils::SamplePredictPath(local_34, local_37, local_16, local_22))
                {
                    local_10 = true;
                }
            }
        }
    }
    if (local_10)
    {
        FVector local_74;
        FVector local_50(FVector::ZeroVector);
        FVector local_56(FVector::ZeroVector);
        FMovementUtils::GetPredictLocationAndVelocity(Entity, local_24, local_50, local_56);
        if (local_9)
        {
            local_74 = (local_16 - Transform.GetPosition());
        }
        else
        {
            local_74 = (local_16 - local_50);
        }
        local_44.SetDeltaMovement(local_74);
        MovementInfo.SetVelocity(local_22);
    }
    else
    {
        FVector local_74;
        FVector local_84(MovementInfo.GetVelocity());
        FVector local_62 = (local_84 + ((FVector(0.0, 0.0, -980.0) * Config.GetGravityScale()) * local_8));
        MovementInfo.SetVelocity(local_62);
        local_74 = (local_62 * local_8);
        local_44.SetDeltaMovement((local_44.GetDeltaMovement() + local_74));
    }
    if (Config.GetbPitchToMoveDir())
    {
        FVector local_74;
        bool local_38 = local_9 && local_10;
        FRotator local_96 = (local_38 ? local_22 : local_44.GetDeltaMovement()).ToOrientationRotator();
        local_96.Roll = Transform.GetRotation().Rotator().Roll;
        local_44.SetNextRotation(FQuat4f(local_96.Quaternion()));
    }
    return;
}
void TickSimpleProjectileMovement(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FSimpleProjectileMovementConfigData &inout Config, const FC_Transform &inout Transform)
{
    int local_46 = 0;
    float local_8 = (FFPTime(MovementInfo.GetMoveTime()) - MovementInfo.GetLastMoveTime()).ToSeconds();
    if (local_8 <= 0.0)
    {
        return;
    }
    FVector local_40(MovementInfo.GetVelocity());
    FVector local_34 = (FVector(0.0, 0.0, -980.0) * Config.GetGravityScale());
    FVector local_34_2 = (local_40 + (local_34 * local_8));
    FVector local_40_2 = (local_34_2 * local_8);
    local_46.SetDeltaMovement((local_46.GetDeltaMovement() + local_40_2));
    if (Config.GetbPitchToMoveDir())
    {
        FRotator local_58 = local_46.GetDeltaMovement().ToOrientationRotator();
        local_58.Roll = Transform.GetRotation().Rotator().Roll;
        local_46.SetNextRotation(FQuat4f(local_58.Quaternion()));
    }
    return;
}
void TickCurveMovement(const FECSEntity &inout Entity, const FCurveMovementConfigData &inout CurveMove, const FC_Transform &inout Transform, const FQuat &inout CurveRotation, const float32 SampleLastTime, const float32 SampleTime)
{
    int local_44 = 0;
    if ((SampleTime - SampleLastTime) <= 0.0f)
    {
        return;
    }
    FVector local_10;
    if ((int(CurveMove.GetCurveValueType())) == 0)
    {
        local_10 = (CurveMove.GetMovementCurve().opArrow().GetVectorValue(SampleTime) - CurveMove.GetMovementCurve().opArrow().GetVectorValue(SampleLastTime));
    }
    else
    {
        if ((int(CurveMove.GetCurveValueType())) == 1)
        {
            local_10 = CurveMove.GetMovementCurve().opArrow().GetVectorValue(SampleTime);
        }
    }
    if (CurveMove.GetbScaleHeight())
    {
        local_10 = (local_10 * CurveMove.GetCurveScaleRatio());
    }
    else
    {
        local_10.X = (local_10.X * CurveMove.GetCurveScaleRatio());
        float local_36_2 = local_10.Y;
        local_36_2 = local_36_2 * CurveMove.GetCurveScaleRatio();
        local_10.Y = local_36_2;
    }
    if (CurveMove.GetbRotateCurveByForwardDirection())
    {
        local_10 = Transform.GetRotation().RotateVector(local_10);
    }
    else
    {
        local_10 = CurveRotation.RotateVector(local_10);
    }
    if (CurveMove.GetbRotateEntityToMoveDirection())
    {
        FRotator local_56 = local_10.ToOrientationRotator();
        local_56.Roll = Transform.GetRotation().Rotator().Roll;
        local_44.SetNextRotation(FQuat4f(local_56.Quaternion()));
    }
    local_44.SetDeltaMovement(local_10);
    return;
}
void TickCurveRotation(const FECSEntity &inout Entity, const FCurveRotationConfigData &inout CurveRotation, const FC_Transform &inout Transform, const float32 SampleLastTime, const float32 SampleTime)
{
    if ((SampleTime - SampleLastTime) <= 0.0f)
    {
        return;
    }
    FVector local_18 = CurveRotation.GetCurve().opArrow().GetVectorValue(SampleTime);
    FRotator local_24 = FRotator(local_18.Y, local_18.Z, local_18.X);
    FQuat local_40;
    FQuat local_48;
    if ((int(CurveRotation.GetCurveValueType())) == 0)
    {
        FVector local_10 = CurveRotation.GetCurve().opArrow().GetVectorValue(SampleLastTime);
        FRotator local_64 = FRotator(local_10.Y, local_10.Z, local_10.X);
        local_40 = (local_64.Quaternion().Inverse() * local_24.Quaternion());
    }
    else
    {
        local_40 = local_24.Quaternion();
    }
    Get local_92;
    const FC_DeltaMovement& local_94 = local_92.opCall();
    if (local_94)
    {
        if (local_94.GetHasNextRotation())
        {
            local_48 = (FQuat(local_94.GetNextRotation()) * local_40);
        }
        else
        {
            local_48 = (FQuat(Transform.GetRotation()) * local_40);
        }
    }
    else
    {
        local_48 = (FQuat(Transform.GetRotation()) * local_40);
    }
    local_94.SetNextRotation(FQuat4f(local_48));
    return;
}
FECSEntity GetTrackTargetEntity(const FTrackTargetParams &inout Params, const FECSEntity &inout Entity, const FECSEntity &inout OwnerEntity, const FNameHandle_EntityBBVarEntity &inout BBVar, const ULockTargetConfig TrackSoftLockConfig, const FFPTime &inout Time)
{
    FECSEntity local_4;
    if (int(Params.TrackTargetEntity) == 0)
    {
        Get local_12;
        const FC_LockTarget& local_14 = local_12.opCall();
        if (local_14)
        {
            local_4 = local_14.GetTargetEntity();
        }
    }
    else
    {
        Get local_12;
        if (int(Params.TrackTargetEntity) == 1)
        {
            FECSEntity local_22 = OwnerEntity.GetBB_Entity(BBVar);
            if (local_22.IsValid())
            {
                local_4 = local_22;
            }
        }
        else
        {
            if (int(Params.TrackTargetEntity) == 2)
            {
                const FC_LockTarget& local_14_2 = local_12.opCall();
                if (local_14_2)
                {
                    local_4 = local_14_2.GetTargetEntity();
                }
                if (TrackSoftLockConfig != nullptr && (local_4 == ENTITY_NULL))
                {
                    FFPTime local_68;
                    FLockTargetUtils::GetInitOverrideInfo(OwnerEntity, local_68);
                    FLockTargetResult local_86;
                    local_4 = local_86.LockTarget;
                }
            }
        }
    }
    if ((local_4 == ENTITY_NULL) && Params.bAutoTrackNearestEnemyWhenNoTarget)
    {
        local_4 = FMovementUtils::PickNearestEnemyEntity(OwnerEntity, Params.NearestEnemySearchRadius);
    }
    return local_4;
}
void SetTrackInfo(const FECSEntity &inout Entity, const FECSEntity &inout OwnerEntity, const FTrackTargetParams &inout Params, const FFPTime &inout Time)
{
    bool local_2;
    int local_12 = 0;
    int local_30 = 0;
    int local_36 = 0;
    int local_130 = 0;
    bool local_1 = false;
    if (int(Params.TrackType) == 0)
    {
        bool local_24;
        local_12.SetTrackTarget(FTargetEntity(FMovementUtils::GetTrackTargetEntity(Params, Entity, OwnerEntity, Params.TrackTargetEntityBBVar, Params.TrackSoftLockConfig, Time)));
        local_12.SetTrackType(ETrackRuntimeType(0));
        local_1 = !((local_12.GetTrackTarget().GetEntity().GetId() == ENTITY_ID_NULL));
        local_2 = !((Params.TrackEntitySocket == NAME_None));
        if (local_2)
        {
            local_12.SetTrackEntitySocket(Params.TrackEntitySocket);
        }
        else
        {
            local_24 = local_1 && (int(Params.TrackTargetEntity) == 0 || (int(Params.TrackTargetEntity) == 2));
            if (local_24)
            {
                FECSEntity local_16 = local_12.GetTrackTarget().GetEntity();
                if (!(local_30))
                {
                    local_2 = false;
                }
                else
                {
                    local_2 = local_36;
                }
                if (local_2)
                {
                    if (local_30.GetLockPointIndex() >= 0 && (local_30.GetLockPointIndex() < local_36.GetLockPoints().Num()))
                    {
                        local_12.SetTrackEntitySocket(local_36.GetLockPoints()[local_30.GetLockPointIndex()].GetLockSocket());
                    }
                }
            }
        }
    }
    else
    {
        bool local_24;
        if (int(Params.TrackType) == 1)
        {
            FVector local_42 = FVector(FVector::ZeroVector);
            FQuat local_52 = FQuat(FQuat::Identity);
            if (FMovementUtils::GetTrackTargetEntity(Params, Entity, OwnerEntity, Params.TrackTargetEntityBBVar, Params.TrackSoftLockConfig, Time).IsValid())
            {
                Get local_60;
                local_42 = local_60.opCall().GetPosition();
                local_42 = (local_42 + local_60.opCall().GetRotation().RotateVector(Params.TrackTargetPosConfig.ForwardOffset));
                local_1 = true;
            }
            local_12.SetTrackType(ETrackRuntimeType(1));
            local_12.SetTrackPos(local_42);
        }
        else
        {
            if (int(Params.TrackType) == 2)
            {
                FVector local_42_2 = FVector(FVector::ZeroVector);
                FQuat local_52_2 = FQuat(FQuat::Identity);
                FECSEntity local_56 = FMovementUtils::GetTrackTargetEntity(Params, Entity, OwnerEntity, Params.TrackTargetEntityBBVar, Params.TrackSoftLockConfig, Time);
                if (local_56.IsValid())
                {
                    Get local_76;
                    const FC_TransformHistory& local_78 = local_76.opCall();
                    if (local_78)
                    {
                        FC_Transform local_100;
                        FFPTime local_112 = (ECS::GetContextTime() - FFPTime(Params.TrackTargetHistoryPosConfig.GetSeconds()));
                        local_78.GetInterpoValue(local_112, local_100);
                        local_42_2 = local_100.GetPosition();
                        local_52_2 = local_100.GetRotation();
                    }
                    local_12.SetTrackTargetHistoryPosConfig(Params.TrackTargetHistoryPosConfig);
                    local_1 = true;
                }
                local_42_2 = (local_42_2 + local_52_2.RotateVector(Params.TrackTargetHistoryPosConfig.GetForwardOffset()));
                local_12.SetTrackType(ETrackRuntimeType(2));
                local_12.SetTrackPos(local_42_2);
                local_12.SetTrackTarget(FTargetEntity(local_56));
            }
            else
            {
                if (int(Params.TrackType) == 3)
                {
                    FVector local_66 = FCharacterInputUtils::GetViewOffset(Entity, Time);
                    FRotator local_124 = FCharacterInputUtils::GetViewInputDir(Entity, Time);
                    FVector local_42_3 = (FVector(local_130.GetPosition()) + local_66);
                    FVector local_72 = FMath::RayPlaneIntersection(local_42_3, FVector(local_124.GetForwardVector()), FPlane(local_130.GetPosition(), local_124.GetForwardVector()));
                    FVector local_136 = (local_72 + (local_124.GetForwardVector() * Params.TrackAimTraceLength));
                    FHitResult local_230;
                    FCollisionQueryParams local_268;
                    local_268.AddIgnoredEntityId(OwnerEntity.GetId());
                    FCollisionResponseParams local_278;
                    local_24 = FPhysicsUtils::LineTraceSingle(OwnerEntity, true, EPhysicsTraceTag(30), local_230, local_72, local_136, ECollisionChannel(14), local_268, local_278);
                    if (local_24)
                    {
                        local_12.SetTrackPos(local_230.Location);
                    }
                    else
                    {
                        local_12.SetTrackPos(local_136);
                    }
                    local_12.SetTrackType(ETrackRuntimeType(1));
                    local_1 = true;
                }
                else
                {
                    if (int(Params.TrackType) == 4)
                    {
                        FVector local_164 = FCharacterInputUtils::GetViewOffset(OwnerEntity, Time);
                        FRotator local_118 = FCharacterInputUtils::GetViewInputDir(OwnerEntity, Time);
                        FVector local_158_2 = (FVector(local_130.GetPosition()) + local_164);
                        FVector local_66_2 = FMath::RayPlaneIntersection(local_158_2, FVector(local_118.GetForwardVector()), FPlane(local_130.GetPosition(), local_118.GetForwardVector()));
                        FVector local_42_4 = (local_118.GetForwardVector() * Params.TrackAimTraceLength);
                        FVector local_72_2 = (local_66_2 + local_42_4);
                        FHitResult local_230;
                        FCollisionQueryParams local_268;
                        local_268.AddIgnoredEntityId(OwnerEntity.GetId());
                        FCollisionResponseParams local_278;
                        bool local_270 = FPhysicsUtils::LineTraceSingle(OwnerEntity, true, EPhysicsTraceTag(30), local_230, local_66_2, local_72_2, ECollisionChannel(14), local_268, local_278);
                        if (local_270)
                        {
                            if (int(local_230.ECSEntityId) > 0)
                            {
                                local_12.SetTrackTarget(FTargetEntity(FECSEntity(int(local_230.ECSEntityId))));
                                local_12.SetTrackType(ETrackRuntimeType(0));
                                local_12.SetTrackEntitySocket(Params.TrackEntitySocket);
                            }
                            else
                            {
                                local_12.SetTrackType(ETrackRuntimeType(1));
                                local_12.SetTrackPos(local_230.Location);
                            }
                        }
                        else
                        {
                            local_12.SetTrackType(ETrackRuntimeType(1));
                            local_12.SetTrackPos(local_72_2);
                        }
                        local_1 = true;
                    }
                    else
                    {
                        if (int(Params.TrackType) == 5)
                        {
                            local_12.SetTrackTarget(FTargetEntity(FMovementUtils::GetTrackTargetEntity(Params, Entity, OwnerEntity, Params.TrackTargetEntityBBVar, Params.TrackSoftLockConfig, Time)));
                            local_12.SetTrackType(ETrackRuntimeType(3));
                            local_1 = !((local_12.GetTrackTarget().GetEntity().GetId() == ENTITY_ID_NULL));
                        }
                    }
                }
            }
        }
    }
    if (Params.bUseDefaultPosWhenNoTargetEntity && !(local_1))
    {
        local_12.SetTrackType(ETrackRuntimeType(1));
        local_12.SetTrackPos((FVector(local_130.GetPosition()) + local_130.GetRotation().RotateVector(Params.DefaultPosOffset)));
    }
    return;
}
FECSEntity PickNearestEnemyEntity(const FECSEntity &inout OwnerEntity, const float32 Radius)
{
    int local_144 = 0;
    Get local_4;
    FECSRuntimeQuery local_48 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(OwnerEntity, local_4.opCall().GetPosition(), Radius, EECSQueryRegsitryType(3), false);
    Include local_92;
    local_92.opCall();
    Include local_96;
    local_96.opCall();
    Exclude(local_48).opCall();
    GetDefaulted local_104;
    local_48.FilterByFaction(local_104.opCall().GetFactionId(), uint8(2));
    FECSEntity local_110;
    float local_114 = Radius * Radius;
    FVector local_122 = local_4.opCall().GetPosition();
    if (local_48.GetAllEntities().Num() > 0)
    {
        for (auto& local_142 : local_48.GetAllEntities())
        {
            if ((local_142 == OwnerEntity))
            {
                continue;
            }
            if (!(local_144))
            {
                continue;
            }
            float local_112 = (FVector(local_144.GetPosition()) - local_122).SizeSquared();
            if (local_112 < local_114)
            {
                local_114 = local_112;
                local_110 = local_142;
            }
        }
    }
    return local_110;
}
void TickTrackMovement(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FTrackMovementConfigData &inout Config, FC_TrackRuntime &inout Track, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime)
{
    bool local_19;
    int local_26 = 0;
    bool local_53;
    int local_130 = 0;
    UProjectileTimelineAsset local_250;
    float local_6 = (FFPTime(MovementInfo.GetMoveTime()) - MovementInfo.GetLastMoveTime()).ToSeconds();
    if (local_6 <= 0.0)
    {
        return;
    }
    Track.SetTrackTime((Track.GetTrackTime() + float32(local_6)));
    if (int(Track.GetTrackType()) == 0)
    {
        if (FMath::IsNearlyZero(Track.GetTrackTime(), 1e-8f) && !(Track.GetTrackTarget().GetEntity().IsValid()))
        {
            Track.SetbTrackSuccess(true);
        }
    }
    else
    {
        if (int(Track.GetTrackType()) == 1)
        {
            if (FMath::IsNearlyZero(Track.GetTrackTime(), 1e-8f))
            {
                Track.SetbTrackSuccess(true);
            }
        }
        else
        {
            if (int(Track.GetTrackType()) == 2)
            {
                if (FMath::IsNearlyZero(Track.GetTrackTime(), 1e-8f) && !(Track.GetTrackTarget().GetEntity().IsValid()))
                {
                    Track.SetbTrackSuccess(true);
                }
            }
            else
            {
                if (int(Track.GetTrackType()) == 3)
                {
                    if (FMath::IsNearlyZero(Track.GetTrackTime(), 1e-8f) && !(Track.GetTrackTarget().GetEntity().IsValid()))
                    {
                        Track.SetbTrackSuccess(true);
                    }
                }
            }
        }
    }
    if (Track.GetbTrackSuccess() && Config.bContinueTrackEvenSuccess)
    {
        Track.SetbTrackSuccess(false);
    }
    if (Track.GetbTrackSuccess())
    {
        if (!(Config.bStopMoveAfterApproch))
        {
            local_26.SetDeltaMovement((FVector(MovementInfo.GetVelocity()) * local_6));
        }
        return;
    }
    FVector local_44(Track.GetLastTargetPosition());
    if (int(Track.GetTrackType()) == 0)
    {
        Get local_48;
        if (Track.GetTrackTarget().GetEntity().IsValid())
        {
            FECSEntity local_18 = Track.GetTrackTarget().GetEntity();
            const FC_Transform& local_50 = local_48.opCall();
            if (local_50)
            {
                local_44 = local_50.GetPosition();
                if (!((Track.GetTrackEntitySocket() == NAME_None)))
                {
                    local_53 = false;
                    FTransform local_88 = FTransformUtils::GetSocketTransformInGameMesh(Track.GetTrackTarget().GetEntity(), Track.GetTrackEntitySocket(), FixedTime.Time, local_53, FDownsampleConfig());
                    if (local_53)
                    {
                        local_44 = local_88.GetLocation();
                    }
                }
                local_44 = (local_44 + local_50.GetRotation().RotateVector(Track.GetTrackTargetOffset()));
                Track.SetLastTargetPosition(local_44);
            }
        }
    }
    else
    {
        Get local_48;
        if (int(Track.GetTrackType()) == 1)
        {
            local_44 = Track.GetTrackPos();
            Track.SetLastTargetPosition(local_44);
        }
        else
        {
            if (int(Track.GetTrackType()) == 2)
            {
                if (Track.GetTrackTarget().GetEntity().IsValid())
                {
                    FQuat local_124 = FQuat(FQuat::Identity);
                    FC_Transform local_152;
                    FFPTime local_4_2 = ECS::GetContextTime();
                    float local_8 = Track.GetTrackTargetHistoryPosConfig().GetSeconds();
                    FFPTime local_156 = (local_4_2 - FFPTime(local_8));
                    local_130.GetInterpoValue(local_156, local_152);
                    local_44 = local_152.GetPosition();
                    local_44 = (local_44 + local_152.GetRotation().RotateVector(Track.GetTrackTargetHistoryPosConfig().GetForwardOffset()));
                    Track.SetTrackPos(local_44);
                    Track.SetLastTargetPosition(local_44);
                }
            }
            else
            {
                if (int(Track.GetTrackType()) == 3)
                {
                    local_53 = false;
                    Get local_160;
                    FECSEntity local_58 = FECSEntity(local_160.opCall().GetOwnerEntity());
                    Get local_164;
                    const FC_LockTarget& local_166 = local_164.opCall();
                    if (local_166)
                    {
                        FLockPointInfo local_182;
                        if (FLockTargetUtils::GetLogicLockTargetInfo(local_58, local_182))
                        {
                            Track.SetLastTargetPosition(local_182.Position);
                            local_53 = true;
                        }
                        else
                        {
                            if (local_166.GetbCachedValidLockTargetPosition())
                            {
                                Track.SetLastTargetPosition(local_166.GetLogicLockTargetPosition());
                                local_53 = true;
                            }
                        }
                    }
                    if (!(local_53) && Track.GetTrackTarget().GetEntity().IsValid())
                    {
                        FECSEntity local_18_2 = Track.GetTrackTarget().GetEntity();
                        local_44 = local_48.opCall().GetPosition();
                        Track.SetLastTargetPosition(local_44);
                    }
                }
            }
        }
    }
    local_19 = ((int(Config.TrackMovementAxis) & 1) == 0);
    local_53 = ((int(Config.TrackMovementAxis) & 2) == 0);
    bool local_186 = ((int(Config.TrackMovementAxis) & 4) == 0);
    FVector local_32 = MovementInfo.GetVelocity().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    if (local_32.IsZero())
    {
        local_32 = Transform.GetRotation().GetForwardVector();
    }
    if (local_19)
    {
        float local_8_2 = Transform.GetPosition().X;
        local_44.X = local_8_2;
        local_8_2 = 0.0;
        local_32.X = 0.0;
    }
    if (local_53)
    {
        float local_8_3 = Transform.GetPosition().Y;
        local_44.Y = local_8_3;
        local_8_3 = 0.0;
        local_32.Y = 0.0;
    }
    if (local_186)
    {
        float local_8_4 = Transform.GetPosition().Z;
        local_44.Z = local_8_4;
        local_8_4 = 0.0;
        local_32.Z = 0.0;
    }
    if (local_32.IsZero())
    {
        if (!(local_19))
        {
            local_32.X = 1.0;
        }
        if (!(local_53))
        {
            local_32.Y = 1.0;
        }
        if (!(local_186))
        {
            local_32.Z = 1.0;
        }
    }
    float32 local_10 = Config.GetCurrentMoveSpeed(Track.GetTrackTime());
    FVector local_194 = (local_44 - Transform.GetPosition());
    FVector local_202 = local_194.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    float local_8_8 = local_6 * Config.GetCurrentTurnSpeed(Track.GetTrackTime());
    if (FMath::RadiansToDegrees(FMath::Acos(local_202.DotProduct(local_32))) <= local_8_8)
    {
        local_32 = local_202;
    }
    else
    {
        local_32 = local_32.RotateAngleAxis(local_8_8, local_32.CrossProduct(local_202));
    }
    float local_212 = local_10 * local_6;
    FVector local_38 = (local_32 * local_212);
    float local_214 = FMath::Clamp(local_194.DotProduct(local_32), 0.0, local_212);
    FVector local_234 = (FVector(Transform.GetPosition()) + (local_32 * local_214));
    if (((local_44 - local_234).Size()) <= (local_212 + Config.CloseDistance))
    {
        Track.SetbTrackSuccess(true);
        if (Config.bStopMoveAfterApproch)
        {
            local_38 = (local_234 - Transform.GetPosition());
        }
        if (!(Track.GetbHasTriggerTrackReachEvent()))
        {
            Track.SetbHasTriggerTrackReachEvent(true);
            Get local_238;
            const FC_ProjectileTimelineEventTriggerConfig& local_240 = local_238.opCall();
            if (local_240)
            {
                Get local_244;
                if (local_244.opCall())
                {
                    if (local_250 != nullptr)
                    {
                        FProjectileTimelineUtils::TriggerTrackReachEventReaction(local_240.TriggerReactions, Entity, local_250.TimelineConfigData, Transform.GetPosition(), FQuat4f(Transform.GetRotation()), Entity, FixedTime.Time);
                    }
                }
            }
        }
    }
    if (local_19)
    {
        local_38.X = local_26.GetDeltaMovement().X;
    }
    if (local_53)
    {
        local_38.Y = local_26.GetDeltaMovement().Y;
    }
    if (local_186)
    {
        local_38.Z = local_26.GetDeltaMovement().Z;
    }
    if (!(Config.bKeepTransformRotation))
    {
        FRotator local_268 = local_32.ToOrientationRotator();
        local_268.Roll = Transform.GetRotation().Rotator().Roll;
        local_26.SetNextRotation(FQuat4f(local_268.Quaternion()));
    }
    local_26.SetDeltaMovement(local_38);
    return;
}
void TickFixedDurationMovement(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FFixedDurationMovementConfigData &inout Config, const FC_FixedDurationMovementRuntime &inout Runtime, const FC_Transform &inout Transform)
{
    int local_46 = 0;
    float local_74;
    float local_2 = MovementInfo.GetMoveTotalTime().ToSeconds();
    if (local_2 <= 0.0)
    {
        return;
    }
    float local_4 = (FFPTime(MovementInfo.GetMoveTime()) - MovementInfo.GetLastMoveTime()).ToSeconds();
    if (local_4 <= 0.0)
    {
        return;
    }
    Get local_20;
    const FC_PlayerController& local_22 = local_20.opCall();
    if (local_22)
    {
        Runtime.Target = local_22.GetPlayerPawnEntity();
    }
    else
    {
        FECSEntity local_16 = Runtime.Target;
    }
    Get local_32;
    FVector local_28 = local_32.opCall().GetPosition();
    float local_12 = MovementInfo.GetMoveTime().ToSeconds();
    float local_34 = local_12 / local_2;
    float32 local_37 = Config.GetMoveDistanceRatioCurve().GetFloatValue(float32(local_34), 0.0f);
    float local_34_2 = (1.0f - local_37) * local_2;
    if (local_34_2 > 0.0)
    {
        FVector local_52;
        float32 local_36 = Config.GetInitialVelocityRatioCurve().GetFloatValue(float32((local_12 / local_2)), 0.0f);
        if (local_36 > 0.0f)
        {
            FVector local_66 = (Runtime.InitialVelocity * local_36);
            local_52 = (local_66 * local_4);
        }
        FVector local_66_2 = (local_28 - Transform.GetPosition());
        if (local_37 > 0.0f)
        {
            local_74 = (local_66_2.Size() / local_34_2) * local_4;
        }
        else
        {
            local_74 = 0.0;
        }
        FVector local_72_2 = (local_66_2.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * (FMath::Min(local_74, (local_28 - Transform.GetPosition()).Size())));
        local_46.SetDeltaMovement((local_72_2 + local_52));
    }
    else
    {
        FVector local_72_3 = (local_28 - Transform.GetPosition());
        local_46.SetDeltaMovement(local_72_3);
    }
    return;
}
void TickGroundMovement(const FECSEntity &inout Entity, FC_LifeTime &inout LifeTime, const FGroundMovementConfigData &inout Config, const FC_MovementInfo &inout MovementInfo, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime)
{
    int local_6 = 0;
    float32 local_21;
    UProjectileTimelineAsset local_180;
    if (!(local_6) || local_6.GetDeltaMovement().IsZero())
    {
        return;
    }
    if (Config.GetHeightFromGround() != 0.0f)
    {
        local_21 = Config.GetHeightFromGround();
    }
    else
    {
        local_21 = 1.0f;
    }
    float local_24 = local_21;
    float local_18 = local_24;
    FVector local_42 = (FVector(Transform.GetPosition()) + local_6.GetDeltaMovement());
    float local_24_2 = Transform.GetPosition().Z - local_18;
    local_42.Z = local_24_2;
    float local_24_3 = local_6.GetDeltaMovement().Size2D(FVector::UpVector);
    float local_52 = FMath::Clamp((FMath::Tan(FMath::DegreesToRadians(Config.GetMaxInclinationUpAngle())) * local_24_3), 0.0, 10000.0);
    float local_46 = FMath::Tan(FMath::DegreesToRadians(Config.GetMaxInclinationDownAngle()));
    float local_44_2 = local_46 * local_24_3;
    float local_46_2 = FMath::Clamp(local_44_2, 0.0, 10000.0);
    float local_54 = local_42.Z + local_52;
    FVector local_60 = FVector(local_42.X, local_42.Y, local_54);
    FVector local_66 = FVector(local_42.X, local_42.Y, (local_42.Z - local_46_2));
    TArray<FHitResult> local_70;
    FCollisionQueryParams local_108;
    local_108.bTraceComplex = false;
    FVector3f local_111 = FVector3f(FVector3f::ZeroVector);
    FECSDebugDraw::DrawDebugLine(n"GroundMovement", local_60, local_66, FColor::Green, FColor::Green, -1.0f, uint8(1), 2.0f);
    FCollisionResponseParams local_124;
    bool local_7 = FPhysicsUtils::LineTraceMulti(Entity, false, EPhysicsTraceTag(9), local_70, local_60, local_66, FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)), local_108, local_124);
    if (local_7)
    {
        local_7 = false;
        for (auto& local_140 : local_70)
        {
            if (!(local_140.GetbStartPenetrating()))
            {
                local_42 = local_140.Location;
                local_111 = FVector3f(local_140.ImpactNormal);
                local_7 = true;
                break;
            }
        }
    }
    if (local_7)
    {
        local_42.Z += local_18;
        FMovementUtils::ApplyDeltaMovement(Transform, local_6, Config, local_42, local_111);
    }
    else
    {
        FFPTime local_146 = FFPTime(MovementInfo.GetMoveTime());
        if (local_146.opCmp(0.0) <= 0)
        {
            return;
        }
        FFPTime local_146_2 = FFPTime(MovementInfo.GetMoveTime());
        if (local_146_2.opCmp(FixedTime.DeltaTime) < 0)
        {
            float local_54_2 = MovementInfo.GetMoveTime().ToSeconds();
            FVector local_30 = (local_6.GetDeltaMovement() / local_54_2);
            float local_44_5 = FixedTime.DeltaTime.ToSeconds();
            FVector local_14 = (local_30 * local_44_5);
            local_42 = (FVector(Transform.GetPosition()) + local_14);
            float local_24_4 = local_14.Size();
            local_52 = FMath::Clamp(FMath::Tan(FMath::DegreesToRadians(Config.GetMaxInclinationUpAngle())) * local_24_4, 0.0, 10000.0);
            local_46_2 = FMath::Clamp(FMath::Tan(FMath::DegreesToRadians(Config.GetMaxInclinationDownAngle())) * local_24_4, 0.0, 10000.0);
            FVector local_152 = FVector(local_42.X, local_42.Y, (local_42.Z + local_52) - local_18);
            float local_44_7 = (local_42.Z - local_46_2) - local_18;
            bool local_7_2 = FPhysicsUtils::LineTraceMulti(Entity, false, EPhysicsTraceTag(9), local_70, local_152, FVector(local_42.X, local_42.Y, local_44_7), FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)), local_108, local_124);
            if (local_7_2)
            {
                for (auto& local_140 : local_70)
                {
                    if (!(local_140.GetbStartPenetrating()))
                    {
                        FMovementUtils::ApplyDeltaMovement(Transform, local_6, Config, local_66, FVector3f(local_140.ImpactNormal));
                        return;
                    }
                }
            }
        }
        if (Config.GetbTriggerEventWhenMoveBlocked())
        {
            Get local_168;
            const FC_ProjectileTimelineEventTriggerConfig& local_170 = local_168.opCall();
            if (local_170)
            {
                Get local_174;
                if (local_174.opCall())
                {
                    if (local_180 != nullptr)
                    {
                        FProjectileTimelineUtils::TriggerMoveBlockedDestroyEventReaction(local_170.TriggerReactions, Entity, local_180.TimelineConfigData, Transform.GetPosition(), FQuat4f(Transform.GetRotation()), Entity, FixedTime.Time);
                    }
                }
            }
        }
        if (Config.GetbDestroyWhenMoveBlocked())
        {
            LifeTime.SetCustomEndTime(FixedTime.Time);
        }
        else
        {
            if (int(Config.GetGroundMoveBlockMode()) == 1)
            {
                FVector local_14_2 = FVector(local_6.GetDeltaMovement());
                local_14_2.Z = (local_14_2.Z - local_46_2);
                local_6.SetDeltaMovement(local_14_2);
            }
            else
            {
                local_6.SetDeltaMovement(FVector::ZeroVector);
            }
        }
    }
    return;
}
void ApplyDeltaMovement(const FC_Transform &inout Transform, FC_DeltaMovement &inout DeltaMovement, const FGroundMovementConfigData &inout Config, const FVector &inout NextLocation, const FVector3f &inout GroundNormalDir)
{
    DeltaMovement.SetDeltaMovement((NextLocation - Transform.GetPosition()));
    if ((int(Config.GetGroundMovementOrientationMode())) == 1)
    {
        FQuat4f local_20 = FQuat4f(Transform.GetRotation());
        DeltaMovement.SetNextRotation((FQuat4f::FindBetweenNormals(local_20.GetUpVector(), GroundNormalDir) * local_20));
    }
    return;
}
}
