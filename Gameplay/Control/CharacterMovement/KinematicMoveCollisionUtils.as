
const FConsoleVariable CVar_DebugIntoStaticPenetration = FConsoleVariable();
const FConsoleVariable CVar_DebugOverrideSlideNerf = FConsoleVariable();
const FConsoleVariable CVar_DebugOverrideSlideRatio = FConsoleVariable();
const FConsoleVariable CVar_DebugEliminateZeroPenetration = FConsoleVariable();
const FConsoleVariable CVar_DebugForceSoftPenetration = FConsoleVariable();
const FConsoleVariable CVar_DebugFindFloorWithSphere = FConsoleVariable();
const FConsoleVariable CVar_DebugForcePreventEdgeFalling = FConsoleVariable();
const FConsoleVariable CVar_DebugDitchProtectLevel = FConsoleVariable();
const FConsoleVariable CVar_DebugDrawMoveHitOnClient = FConsoleVariable();
const FConsoleVariable CVar_DebugDrawMoveHitOnServer = FConsoleVariable();
const FConsoleVariable CVar_DynamicPenetrateTurnToSoftDepth = FConsoleVariable();
const FConsoleVariable CVar_DirectionalPushOutPreventSlideAngle = FConsoleVariable();
const FConsoleVariable CVar_DirectionalPushOutFullSlideAngle = FConsoleVariable();
const FConsoleVariable CVar_AirborneSlideMaxHorizontalSpeed = FConsoleVariable();
const FConsoleVariable CVar_AirborneSlideMaxVerticalSpeed = FConsoleVariable();
const FConsoleVariable CVar_AdaptFloorNormalAngleThreshold = FConsoleVariable();
const FConsoleVariable CVar_DebugEditorCheckBoundingBox = FConsoleVariable();
const FConsoleVariable CVar_DebugExtraShapeEasilyQueryBigPawn = FConsoleVariable();
const FConsoleVariable CVar_NoStandOnlyForPlayer = FConsoleVariable();
const FConsoleVariable CVar_EnableSnapToFloorSlideMoveOnlyWhenUpward = FConsoleVariable();
const ECollisionChannel FindFloorChannel = ECollisionChannel(18);
const float32 DynamicDepenetrateDeltaMoveLengthLimit = 25f;
const float32 ApplySmoothDepenetrateDeltaMoveLengthLimit = 15f;
const float32 DepenetrationDistance = 2f;
const float32 DepenetrationHeight = 1f;
const float32 FindFloorLookDownExtraHeight = 2.5f;
const float32 FilterHitDistanceTolerance = 2f;
const float32 FindFloorStepCenterTolerance = 1f;
const float32 FindFloorStepCenterExtraHeight = 5f;
const float32 CheckFloorNormalChangeStableExtraHeight = 10f;
const float32 HardSnapToFloorExtraHoverHeight = 200f;
const float32 NavQueryHeight = 200f;
const float32 FindEdgeBisearchPrecision = 20f;
const float32 FindEdgeExtraSweepRadius = 1f;
const float32 SnapToFloorSmallOffset = 0.1f;
const FStatID StatId = FStatID();

struct FHandlePenetrateResult
{
    UPROPERTY()
    bool bHandleSlide = false;
    UPROPERTY()
    FVector OutTargetPos;
    UPROPERTY()
    FQuat OutTargetRot;
    UPROPERTY()
    FVector3f OutTargetVelocity;
    UPROPERTY()
    TArray<FECSEntityId> StillPenetrate;
    UPROPERTY()
    FVector3f SmoothDepenetrateMovement;


}

struct FAvgVector3f
{
    UPROPERTY()
    FVector3f TotalValue;
    UPROPERTY()
    int Count = 0;


    void Add(const FVector3f &inout Value)
    {
        this += Value;
        ++this.Count;
        return;
    }
    FVector3f Get()
    {
        if (this.Count == 0)
        {
            return FVector3f::ZeroVector;
        }
        return (FVector3f(this) / this.Count);
    }
}

struct FDitchProtectResult
{
    UPROPERTY()
    bool bHasFloorBeyond = false;
    UPROPERTY()
    FHitResult FloorHit;
    UPROPERTY()
    float FloorZ = 0.0;
    UPROPERTY()
    FVector3f CorrectedNormal = FVector3f::ZeroVector;


}

struct FDetectEdgeResult
{
    UPROPERTY()
    bool bEdgeDetected;
    UPROPERTY()
    float32 SafeMoveDist;
    UPROPERTY()
    float32 BisearchPrecision;
    UPROPERTY()
    FVector3f EdgeNormal;
    UPROPERTY()
    FHitResult RefHit;


    bool IsCloserThan(const FDetectEdgeResult &inout Other)
    {
        return this.bEdgeDetected && (!(Other.bEdgeDetected) || (this.SafeMoveDist < Other.SafeMoveDist));
    }
}

struct FHandleSlideInfo
{
    UPROPERTY()
    bool bNeedSlide = false;
    UPROPERTY()
    bool bFloorAsWall = false;
    UPROPERTY()
    FVector3f WallNormal = FVector3f::ZeroVector;
    UPROPERTY()
    FVector3f NonBlockingDeltaMove = FVector3f::ZeroVector;
    UPROPERTY()
    float32 NonBlockingMoveDistance = 0.0f;
    UPROPERTY()
    float32 SlideRatio = 0.5f;
    UPROPERTY()
    float32 SlideNerf = 0.0f;
    UPROPERTY()
    FKMCFloorInfo NonBlockingNextPosFloorInfo;


}

struct FSnapToFloorInfo
{
    UPROPERTY()
    FVector3f SnapDeltaMove;
    UPROPERTY()
    float32 SmoothVelocity;
    UPROPERTY()
    FVector3f SlideMove;


}

struct __Lambda_Gameplay_Control_CharacterMovement_KinematicMoveCollisionUtils_259
{
    __Lambda_Gameplay_Control_CharacterMovement_KinematicMoveCollisionUtils_259()
    {
        return;
    }
    bool opCall(const FHitResult &inout A, const FHitResult &inout B)
    {
        return (A.Distance < B.Distance);
    }
}

struct __Lambda_Gameplay_Control_CharacterMovement_KinematicMoveCollisionUtils_757
{
    UPROPERTY()
    bool __bFindStatic;
    UPROPERTY()
    bool __bFindDynamic;

    __Lambda_Gameplay_Control_CharacterMovement_KinematicMoveCollisionUtils_757(const bool _InbFindStatic, const bool _InbFindDynamic)
    {
        this.__bFindStatic = _InbFindStatic;
        this.__bFindDynamic = _InbFindDynamic;
        return;
    }
    bool GetbFindStatic() property
    {
        bool __r;
        return __r;
    }
    bool GetbFindDynamic() property
    {
        bool __r;
        return __r;
    }
    bool opCall(const FHitResult &inout HitResult)
    {
        if (HitResult.GetbStartPenetrating() && (HitResult.PenetrationDepth > 0.0f))
        {
            bool local_3 = ::IsDynamicHitResult(HitResult);
            bool local_5 = local_3 && this.GetbFindDynamic();
            if (local_5)
            {
                return true;
            }
            local_5 = !(local_3) && this.GetbFindStatic();
            if (local_5)
            {
                return true;
            }
        }
        return false;
    }
}

float32 GetSoftPushOutLength(const FHitResult &inout HitResult, const float32 SelfRadius)
{
    return (FHitResultUtils::GetSoftPushOutSpeed(HitResult, SelfRadius) * FECSWorld::FixedFrameInterval);
}
bool GetEnableDebug() property
{
    return CharacterMovementDebug::Enabled();
}
bool DebugEnsure(const bool bCondition)
{
    if (GetEnableDebug())
    {
        return bCondition;
    }
    return bCondition;
}
void KMC_DEBUG(const FString &inout Log)
{
    return;
}
void KMC_ERROR(const FString &inout Log)
{
    return;
}
bool IsEntityHitResult(const FHitResult &inout HitResult)
{
    return (int(HitResult.ECSEntityId) != ENTITY_ID_NULL);
}
bool IsDynamicHitResult(const FHitResult &inout HitResult)
{
    bool local_15;
    bool local_21;
    if (!(FECSEntity(int(HitResult.ECSEntityId)).IsValid()))
    {
        local_21 = false;
    }
    else
    {
        Has local_14;
        if (local_14.opCall())
        {
            local_15 = true;
        }
        else
        {
            Has local_20;
            local_15 = local_20.opCall();
        }
        local_21 = local_15;
    }
    return local_21;
}
bool ShouldIgnoreHitResult(const FKMCContext &inout Context, const FHitResult &inout HitResult)
{
    if (!(Context.State.bControlledByPlayer) && !(FHitResultUtils::CanAffectNonPlayer(HitResult)))
    {
        return true;
    }
    if (IsEntityHitResult(HitResult))
    {
        if (Context.GetDynamicEntitiesToTolerant().Num() > 0 && Context.GetDynamicEntitiesToTolerant().Contains(FECSEntityId(int(HitResult.ECSEntityId))))
        {
            return true;
        }
    }
    return false;
}
bool CanCharacterStandOnForMovement(const FKMCContext &inout Context, const FHitResult &inout HitResult)
{
    if (CVar_NoStandOnlyForPlayer.GetInt() != 0 && !(Context.State.bControlledByPlayer))
    {
        return true;
    }
    return FHitResultUtils::CanCharacterStandOn(HitResult);
}
bool FilterPenetrationByApproachDirection(FHitResult &inout HitResult)
{
    if ((float32((HitResult.Normal.DotProduct((FVector(HitResult.TraceEnd) - HitResult.TraceStart))))) < -0.0001f)
    {
        HitResult.SetbStartPenetrating(false);
        return false;
    }
    return true;
}
bool HandleImmovableByPlayer(const FKMCContext &inout Context, FHitResult &inout HitResult)
{
    if (!(Context.Param.bImmovableByPlayer))
    {
        return false;
    }
    if (!(HitResult.GetbStartPenetrating()) || !(IsEntityHitResult(HitResult)))
    {
        return false;
    }
    FECSEntity local_6 = FECSEntity(int(HitResult.ECSEntityId));
    Has local_12;
    if (!(local_12.opCall()))
    {
        return false;
    }
    return FilterPenetrationByApproachDirection(HitResult);
}
bool HandlePostDetachCollision(const FKMCContext &inout Context, FHitResult &inout HitResult, const FKMCSweepTestSpecificParams &inout SpecificParams)
{
    if (!(HitResult.GetbStartPenetrating()) || !(IsEntityHitResult(HitResult)))
    {
        return false;
    }
    if (!(Context.Env.PostDetachEntities.Contains(FECSEntityId(int(HitResult.ECSEntityId)))))
    {
        return false;
    }
    SpecificParams.TryRecordPostDetachPenetrating(FECSEntityId(int(HitResult.ECSEntityId)));
    return FilterPenetrationByApproachDirection(HitResult);
}
bool HandleHitBySteadfastEntity(const FKMCContext &inout Context, FHitResult &inout HitResult)
{
    if (!(HitResult.GetbStartPenetrating()) || !(IsEntityHitResult(HitResult)))
    {
        return false;
    }
    if (!(IsDynamicHitResult(HitResult)))
    {
        return false;
    }
    GetDefaulted local_16;
    if (!(FKinematicMoveCollisionUtils::HasActiveSteadfastMovement(FECSEntity(int(HitResult.ECSEntityId)), local_16.opCall())))
    {
        return false;
    }
    return FilterPenetrationByApproachDirection(HitResult);
}
bool UseDynamicSlide(const FKMCContext &inout Context, const FHitResult &inout HitResult)
{
    bool local_1 = false;
    FECSEntityId local_3 = FECSEntityId(int(HitResult.ECSEntityId));
    if (Context.GetUseDynamicSlide(local_3, local_1))
    {
        return local_1;
    }
    FECSEntity local_14 = FECSEntity(int(HitResult.ECSEntityId));
    Get local_18;
    const FC_HitBoxConfig& local_20 = local_18.opCall();
    if (local_20)
    {
        bool local_21;
        local_21 = false;
        for (auto& local_36 : local_20.HitBoxDatas)
        {
            if ((int(local_36.RespondType) & 1) > 0)
            {
                local_21 = true;
                break;
            }
        }
        if (local_21)
        {
            local_1 = (int(FASCommonUtils::GetEntityFactionRelation(Context.Entity, local_14)) != 4);
        }
    }
    Context.CacheUseDynamicSlide(local_3, local_1);
    return local_1;
}
bool IsPenetrateHitResult(const FHitResult &inout HitResult)
{
    return HitResult.GetbStartPenetrating() && (HitResult.PenetrationDepth > 0.0f);
}
bool PreFilterHits(const FKMCContext &inout Context, TArray<FHitResult> &inout HitResults, const FKMCSweepTestSpecificParams &inout SpecificParams = FKMCSweepTestSpecificParams())
{
    int local_1 = 0;
    int local_3 = 0;
    for (; local_3 < HitResults.Num(); ++local_3)
    {
        if (ShouldIgnoreHitResult(Context, HitResults[local_3]))
        {
            continue;
        }
        if (HandleImmovableByPlayer(Context, HitResults[local_3]))
        {
            continue;
        }
        if (HandlePostDetachCollision(Context, HitResults[local_3], SpecificParams))
        {
            continue;
        }
        if (HandleHitBySteadfastEntity(Context, HitResults[local_3]))
        {
            continue;
        }
        FHitResult& local_8 = HitResults[local_1];
        if (local_3 != local_1)
        {
            local_8 = HitResults[local_3];
        }
        if (local_8.GetbStartPenetrating() && (local_8.PenetrationDepth <= 0.0f))
        {
            if (CVar_DebugEliminateZeroPenetration.GetBool())
            {
                local_8.SetbStartPenetrating(false);
            }
            else
            {
            }
        }
        ++local_1;
    }
    if (local_1 != HitResults.Num())
    {
        HitResults.SetNum(local_1);
    }
    return (local_1 > 0);
}
bool SortResultByDistanceAndFilter(const FKMCContext &inout Context, TArray<FHitResult> &inout HitResults, const bool bCouldHandlePenetration, const bool bIgnoreStartPenetrating = false, const bool bPassThrough = false)
{
    if (HitResults.Num() <= 0)
    {
        return false;
    }
    bool local_5 = false;
    float32 local_6 = -1.0f;
    int local_8 = 0;
    for (; local_8 < HitResults.Num(); ++local_8)
    {
        if (HitResults[local_8].GetbStartPenetrating())
        {
            if (bIgnoreStartPenetrating || !(bCouldHandlePenetration))
            {
                HitResults.RemoveAt(local_8);
                --local_8;
                continue;
            }
            local_5 = true;
        }
        if (!(bPassThrough))
        {
            if (local_6 == -1.0f)
            {
                local_6 = HitResults[local_8].Distance;
                continue;
            }
            if ((HitResults[local_8].Distance - local_6) > 2.0f)
            {
                HitResults.SetNum(local_8);
                break;
            }
        }
    }
    return local_5;
}
bool FilterFloorIgnoreResults(const FKMCContext &inout Context, TArray<FHitResult> &inout HitResults)
{
    if (HitResults.Num() == 0)
    {
        return false;
    }
    int local_5 = HitResults.Num() - 1;
    for (; local_5 >= 0; --local_5)
    {
        if (ShouldIgnoreHitResult(Context, HitResults[local_5]))
        {
            HitResults.RemoveAt(local_5);
            continue;
        }
        if (!(CanCharacterStandOnForMovement(Context, HitResults[local_5])))
        {
            HitResults.RemoveAt(local_5);
            continue;
        }
    }
    return (HitResults.Num() > 0);
}
FVector3f GetSlideForwardVector(const FKMCContext &inout Context, const FVector3f &inout DeltaMove)
{
    if (!(DeltaMove.IsZero()))
    {
        return DeltaMove;
    }
    if (!(Context.Param.SlideForwardNormal.IsZero()))
    {
        return Context.Param.SlideForwardNormal;
    }
    return FVector3f(Context.State.GetCollisionRotation().GetForwardVector());
}
bool OverlapTestStatic(TArray<FHitResult> &inout OutResults, const FKMCContext &inout Context, const FVector &inout Pos, const FQuat &inout Rot)
{
    FCollisionQueryParams local_42;
    local_42.bTraceComplex = false;
    local_42.bIgnoreTouches = true;
    local_42.AddIgnoredEntityId(Context.Entity.GetId());
    local_42.AddIgnoredEntityIds(Context.Env.CollisionToIgnore);
    FVector local_58 = (Pos + (FVector(FVector::UpVector) * 0.01));
    FCollisionResponseParams local_75;
    return FPhysicsUtils::SweepMulti(Context.Entity, false, EPhysicsTraceTag(5), OutResults, Pos, local_58, Rot, Context.GetCollisionChannel(), Context.GetActualShape(), local_42, local_75);
}
bool DepenetrateSweepBackTest(TArray<FHitResult> &inout OutResults, const FKMCContext &inout Context, const FVector &inout Start, const FVector &inout End, const FQuat &inout Rot)
{
    FKMCSweepTestSpecificParams local_12;
    return MoveSweepTest(OutResults, Context, Start, End, Rot, true, local_12);
}
bool AddVirtualNavHitIfNeeded(const FKMCContext &inout Context, const FVector &inout Start, const FVector &inout End, TArray<FHitResult> &inout OutResults)
{
    bool local_1 = !(ECS::GetRuntimeInfo().IsServer);
    if (local_1)
    {
        local_1 = true;
    }
    else
    {
        local_1 = Context.State.bControlledByPlayer;
    }
    local_1 = local_1 || !(Context.Param.bRestrictInNavmesh);
    if (local_1)
    {
        return false;
    }
    FVector local_10 = Context.GetActualShape().GetExtent();
    float32 local_3 = -(float32((local_10.Z + Context.State.GetStepUpHeight())));
    FVector local_10_2 = End.AddZ(local_3);
    if (!(FAIPathFollowUtils::IsPointOnNavigation(Context.Entity, local_10_2, FVector(1.0, 1.0, 200.0))))
    {
        FVector local_22 = FAIPathFollowUtils::ProjectPointToNavigation(Context.Entity, local_10_2, FVector::ZeroVector);
        FVector local_42 = (local_22 - End).NewZ(0.0);
        FVector local_30 = (End - Start);
        if (local_42.DotProduct(local_30) < -9.999999747378752e-5)
        {
            FHitResult local_108;
            local_108.TraceStart = Start;
            local_108.TraceEnd = End;
            local_108.Location = Start;
            local_108.ImpactPoint = local_22;
            local_108.Normal = local_42.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            local_108.ImpactNormal = local_108.Normal;
            OutResults.Add(local_108);
            return true;
        }
    }
    return false;
}
bool MoveSweepTest(TArray<FHitResult> &inout OutResults, const FKMCContext &inout Context, const FVector &inout Start, const FVector &inout End, const FQuat &inout Rot, const bool bAllowUpdateCache = false, const FKMCSweepTestSpecificParams &inout SpecificParams = FKMCSweepTestSpecificParams())
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
void FilterEnablePenetrateHits(const FKMCContext &inout Context, TArray<FHitResult> &inout OutResults, const bool bAirborne)
{
    int local_19;
    if (Context.GetEnablePenetrateEntities().Num() == 0)
    {
        return;
    }
    for (auto& local_18 : OutResults)
    {
        local_19 = int(local_18.ECSEntityId);
        int local_20 = ENTITY_ID_NULL;
        if (local_19 == local_20)
        {
            continue;
        }
        if (!(Context.GetEnablePenetrateEntities().Contains(FECSEntityId(local_19))))
        {
            continue;
        }
        if (bAirborne)
        {
            float local_24 = FMath::Abs((local_18.TraceEnd.Z - local_18.TraceStart.Z)) * 0.5;
            float32 local_29 = float32((local_18.Distance + local_24));
            local_18.SetbStartPenetrating(false);
            continue;
        }
        float local_24_2 = local_18.Normal.DotProduct((FVector(local_18.TraceEnd) - local_18.TraceStart));
        if (float32(local_24_2) < -0.0001f)
        {
            local_18.SetbStartPenetrating(false);
        }
    }
    return;
}
bool FindFloorShapeTest(TArray<FHitResult> &inout OutResults, const FKMCContext &inout Context, const FVector &inout Start, const FVector &inout End, const FQuat &inout Rot, const FVector3f &inout RefVelocity, const bool bAllowUpdateCache)
{
    FCollisionShape local_4;
    local_4 = Context.GetActualShape();
    if (local_4.IsCapsule() && CVar_DebugFindFloorWithSphere.GetBool())
    {
        FVector local_22 = Rot.GetUpVector();
        FVector local_16 = (Start - End);
        bool local_10 = local_22.CrossProduct(local_16).Equals(FVector::ZeroVector, 9.999999747378752e-5);
        if (local_10)
        {
            bool local_9;
            float32 local_33 = FMath::Max((local_4.GetCapsuleHalfHeight() - local_4.GetCapsuleRadius()), 0.0f);
            float local_30 = local_33;
            FVector local_16_2 = (local_22 * local_30);
            local_4 = FCollisionShape::MakeSphere(local_4.GetCapsuleRadius());
            local_9 = FindFloorSweepMulti(OutResults, Context, (Start + local_16_2), (End - local_16_2), Rot, local_4, RefVelocity, bAllowUpdateCache);
            if (local_9)
            {
                local_30 = (Start - End).Size();
                for (auto& local_58 : OutResults)
                {
                    if (local_58.Distance <= (local_33 * 2.0f))
                    {
                        local_58.SetbStartPenetrating(true);
                    }
                    local_58.TraceStart = Start;
                    local_58.TraceEnd = End;
                    local_58.Location += local_16_2;
                    float32 local_34 = local_33 * 2.0f;
                    float32 local_32_2 = local_58.Distance - local_34;
                    local_34 = local_58.Distance;
                    float32 local_32_3 = float32((local_34 / local_30));
                }
            }
            return local_9;
        }
    }
    return FindFloorSweepMulti(OutResults, Context, Start, End, Rot, local_4, RefVelocity, bAllowUpdateCache);
}
bool FindFloorSweepMulti(TArray<FHitResult> &inout OutResults, const FKMCContext &inout Context, const FVector &inout Start, const FVector &inout End, const FQuat &inout Rot, const FCollisionShape &inout Shape, const FVector3f &inout RefVelocity, const bool bAllowUpdateCache)
{
    FCollisionQueryParams local_38;
    local_38.bTraceComplex = false;
    local_38.AddIgnoredEntityId(Context.Entity.GetId());
    local_38.AddIgnoredEntityIds(Context.Env.CollisionToIgnore);
    local_38.bIgnoreTouches = true;
    local_38.bReturnFaceIndex = true;
    FSceneQueryCacheParam local_50;
    local_50.CustomExpandingExtent = (FVector3f(FVector3f::OneVector) * 50.0f);
    local_50.bEnableCenterOffsetZ = true;
    local_50.bPassthroughBlockingHit = true;
    if (Context.Env.FindFloorCachePtr)
    {
        return Context.Env.FindFloorCachePtr.opArrow().SweepMulti(Context.Entity, false, EPhysicsTraceTag(4), OutResults, Start, End, Rot, Shape, ECollisionChannel(18), local_38, RefVelocity, bAllowUpdateCache, local_50);
    }
    FCollisionResponseParams local_68;
    return FPhysicsUtils::SweepMulti(Context.Entity, false, EPhysicsTraceTag(4), OutResults, Start, End, Rot, ECollisionChannel(18), Shape, local_38, local_68);
}
bool FindFloorCenterTest(FHitResult &inout OutResult, const FKMCContext &inout Context, const FVector &inout Start, const FVector &inout End, const FVector3f &inout RefVelocity, const bool bAllowUpdateCache)
{
    FCollisionQueryParams local_38;
    local_38.bTraceComplex = false;
    local_38.AddIgnoredEntityId(Context.Entity.GetId());
    local_38.AddIgnoredEntityIds(Context.Env.CollisionToIgnore);
    local_38.bIgnoreTouches = true;
    local_38.bReturnFaceIndex = true;
    FSceneQueryCacheParam local_50;
    local_50.CustomExpandingExtent = (FSceneQueryCache::GetFullHorzontalAABBExtent(Context.GetActualShape()) + (FVector3f(FVector3f::OneVector) * 50.0f));
    local_50.bEnableCenterOffsetZ = true;
    local_50.bPassthroughBlockingHit = true;
    TArray<FHitResult> local_64;
    if (Context.Env.FindFloorCachePtr)
    {
        Context.Env.FindFloorCachePtr.opArrow().LineTraceMulti(Context.Entity, false, EPhysicsTraceTag(4), local_64, Start, End, ECollisionChannel(18), local_38, RefVelocity, bAllowUpdateCache, local_50);
    }
    else
    {
        FPhysicsUtils::LineTraceMulti(Context.Entity, false, EPhysicsTraceTag(4), local_64, Start, End, ECollisionChannel(18), local_38, FCollisionResponseParams());
    }
    for (auto& local_90 : local_64)
    {
        if (ShouldIgnoreHitResult(Context, local_90))
        {
            continue;
        }
        if (!(CanCharacterStandOnForMovement(Context, local_90)))
        {
            continue;
        }
        OutResult = local_90;
        return true;
    }
    OutResult = FHitResult(Start, End);
    return false;
}
float32 GetFloatingFloorDist(const FKMCContext &inout Context, const float32 LookDownLength)
{
    float32 local_44;
    TArray<FHitResult> local_4;
    FindFloorShapeTest(local_4, Context, Context.State.GetCollisionPosition(), (Context.State.GetCollisionPosition() - FVector(0.0, 0.0, LookDownLength)), Context.State.GetCollisionRotation(), FVector3f::ZeroVector, false);
    SortResultByDistanceAndFilter(Context, local_4, true, false, false);
    if (local_4.Num() > 0)
    {
        local_44 = local_4[0].Distance;
    }
    else
    {
        local_44 = LookDownLength;
    }
    local_44 = local_44 - Context.State.GetStepUpHeight();
    return local_44;
}
bool TestValidFloorSlopeAndEtc(const FVector3f &inout FloorNormal, const FKMCParam &inout Param)
{
    if (FKinematicMoveCollisionUtils::GetSlopeAngle(FloorNormal) > Param.SlopDegreeMax)
    {
        return false;
    }
    return true;
}
FVector3f GetHitResultNormal(const TArray<FHitResult> &inout FilteredHitResults)
{
    return FVector3f(FilteredHitResults[0].Normal);
}
FVector3f GetExtraSlideDirForNoStand(const FKMCContext &inout Context, const FHitResult &inout HitResult)
{
    if ((HitResult.Normal.Z > 0.99 || (HitResult.ImpactNormal.Z > 0.99)) && !(CanCharacterStandOnForMovement(Context, HitResult)))
    {
        return FHitResultUtils::GetCenterPushOutDir2D(HitResult);
    }
    return FVector3f::ZeroVector;
}
FVector GetAvgImpactPoint(const TArray<FHitResult> &inout HitResults)
{
    FVector local_6(FVector::ZeroVector);
    if (HitResults.Num() > 1)
    {
        int local_10 = 0;
        for (; local_10 < HitResults.Num(); )
        {
            local_6 += HitResults[local_10].ImpactPoint;
            ++local_10;
        }
        local_6 /= HitResults.Num();
    }
    else
    {
        local_6 = HitResults[0].ImpactPoint;
    }
    return local_6;
}
void FillFloorInfoBySweepHits(FKMCFloorInfo &inout FindFloorInfo, const TArray<FHitResult> &inout HitResults)
{
    if (HitResults.Num() > 1)
    {
        int local_4 = 0;
        for (; local_4 < HitResults.Num(); )
        {
            const FHitResult& local_6 = HitResults[local_4];
            FindFloorInfo.SetFloorDistance(FindFloorInfo.GetFloorDistance() + (local_6.Distance - 1.0f));
            FVector3f local_15 = (FindFloorInfo.GetFloorNormal() + FVector3f(local_6.Normal));
            FindFloorInfo.SetFloorNormal(local_15);
            local_15 = (FindFloorInfo.GetFloorImpactNormal() + FVector3f(local_6.ImpactNormal));
            FindFloorInfo.SetFloorImpactNormal(local_15);
            ++local_4;
        }
        FindFloorInfo.SetFloorDistance(FindFloorInfo.GetFloorDistance() / HitResults.Num());
        FindFloorInfo.SetbTouchingFloor((FindFloorInfo.GetFloorDistance() <= 1.0f));
        FindFloorInfo.SetFloorNormal(FindFloorInfo.GetFloorNormal().GetSafeNormal(1e-8f, FVector3f::ZeroVector));
        FindFloorInfo.SetFloorImpactNormal(FindFloorInfo.GetFloorImpactNormal().GetSafeNormal(1e-8f, FVector3f::ZeroVector));
        (!((FVector3f(FindFloorInfo.GetFloorNormal()) == FVector3f::ZeroVector))) = !((FVector3f(FindFloorInfo.GetFloorImpactNormal()) == FVector3f::ZeroVector));
        FindFloorInfo.SetFloorSlope(FKinematicMoveCollisionUtils::GetSlopeAngle(FindFloorInfo.GetFloorNormal()));
        return;
    }
    const FHitResult& local_6_2 = HitResults[0];
    FindFloorInfo.SetFloorDistance(local_6_2.Distance - 1.0f);
    FindFloorInfo.SetbTouchingFloor((FindFloorInfo.GetFloorDistance() <= 1.0f));
    FindFloorInfo.SetFloorNormal(FVector3f(local_6_2.Normal));
    FindFloorInfo.SetFloorImpactNormal(FVector3f(local_6_2.ImpactNormal));
    FindFloorInfo.SetFloorSlope(FKinematicMoveCollisionUtils::GetSlopeAngle(FindFloorInfo.GetFloorNormal()));
    return;
}
void FillFloorInfoByCenterHit(FKMCFloorInfo &inout FindFloorInfo, const FHitResult &inout CenterHitResult)
{
    FindFloorInfo.SetFloorDistance(((float32((FindFloorInfo.GetDetectPosition().Z - CenterHitResult.Location.Z))) - 1.0f));
    FindFloorInfo.SetbTouchingFloor((FindFloorInfo.GetFloorDistance() <= 1.0f));
    FindFloorInfo.SetFloorNormal(FVector3f(CenterHitResult.Normal));
    FindFloorInfo.SetFloorImpactNormal(FVector3f(CenterHitResult.ImpactNormal));
    FindFloorInfo.SetFloorSlope(FKinematicMoveCollisionUtils::GetSlopeAngle(FindFloorInfo.GetFloorNormal()));
    return;
}
float32 GetSlideRatio(const FKMCContext &inout Context, const TArray<FHitResult> &inout FilteredHitResults, const bool bForceStatic)
{
    if (bForceStatic)
    {
        return Context.Param.SlideRatioForStatic;
    }
    float32 local_2 = 0.0f;
    if (FilteredHitResults.Num() > 0)
    {
        int local_6 = 0;
        for (; local_6 < FilteredHitResults.Num(); )
        {
            local_2 = local_2 + Context.Param.GetSlideRatio(UseDynamicSlide(Context, FilteredHitResults[local_6]));
            ++local_6;
        }
        local_2 = local_2 / FilteredHitResults.Num();
    }
    return local_2;
}
float32 GetSlideNerf(const FKMCContext &inout Context, const TArray<FHitResult> &inout FilteredHitResults, const bool bForceStatic)
{
    if (bForceStatic)
    {
        return Context.Param.SlideNerfForStatic;
    }
    float32 local_2 = 0.0f;
    int local_3 = 0;
    for (; local_3 < FilteredHitResults.Num(); )
    {
        local_2 = FMath::Max(local_2, Context.Param.GetSlideNerf(UseDynamicSlide(Context, FilteredHitResults[local_3])));
        ++local_3;
    }
    return local_2;
}
bool HasAnyPenetration(const TArray<FHitResult> &inout HitResults, const bool bFindStatic, const bool bFindDynamic)
{
    __Lambda_Gameplay_Control_CharacterMovement_KinematicMoveCollisionUtils_757 local_2;
    return HitResults.ContainsByPredicate(local_2);
}
FVector DepenetrateSweepBackHard(const FKMCContext &inout Context, const FQuat &inout LastRot, const FVector3f &inout DepenetrateDeltaMovement, const bool bDepenetrateDynamic, const FVector &inout OriginPos)
{
    bool local_26;
    float32 local_52;
    bool local_133;
    float32 local_134;
    int local_1 = 4;
    int local_3 = 1112014848;
    TArray<FHitResult> local_8;
    FVector local_14 = OriginPos;
    FVector3f local_17 = DepenetrateDeltaMovement;
    FVector3f local_23 = DepenetrateDeltaMovement.GetSafeNormal(1e-8f, FVector3f::ZeroVector);
    if (local_17.SizeSquared() < FMath::Square(50.0f))
    {
        local_17 = (local_23 * 50.0f);
    }
    bool local_27 = false;
    int local_28 = 3;
    for (; local_28 >= 0; --local_28)
    {
        FVector3f local_20 = (local_17 * 2.0f);
        FVector local_48 = (local_14 + FVector(local_20));
        DepenetrateSweepBackTest(local_8, Context, local_14, local_48, LastRot);
        SortResultByDistanceAndFilter(Context, local_8, true, true, true);
        local_52 = -1.0f;
        FHitResult local_118;
        for (auto& local_132 : local_8)
        {
            local_26 = IsDynamicHitResult(local_132);
            local_133 = local_26 && !(bDepenetrateDynamic);
            if (local_133)
            {
                continue;
            }
            local_118 = local_132;
            local_134 = local_118.Distance;
            local_52 = local_134 - 2.0f;
            if (local_26)
            {
                float32 local_4 = local_134 * 0.3f;
                float32 local_24 = local_134 - 0.1f;
                local_52 = FMath::Max(local_52, FMath::Min(local_24, local_4));
            }
            local_52 = FMath::Max(local_52, 0.0f);
            local_48 = (OriginPos + (FVector((local_23 * local_52))));
            break;
        }
        local_26 = true;
        DepenetrateSweepBackTest(local_8, Context, local_48, OriginPos, LastRot);
        if (!(HasAnyPenetration(local_8, true, false)))
        {
            local_27 = true;
            local_17 = FVector3f((local_48 - OriginPos));
        }
        else
        {
            if (local_52 != -1.0f)
            {
                FVector3f local_140 = local_17.VectorPlaneProject(FVector3f(local_118.Normal));
                if (!(local_140.Normalize(1e-8f)))
                {
                    local_140 = FVector3f(LastRot.GetForwardVector().opNeg());
                    bool local_50 = local_17.GetSafeNormal(1e-8f, FVector3f::ZeroVector).Coincident(local_140, 0.999845f);
                    if (local_50)
                    {
                        local_140 = local_140.opNeg();
                    }
                }
                local_17 = (local_140 * 50.0f);
            }
            else
            {
                local_17 *= 2.0f;
                local_26 = false;
            }
        }
        if (local_26 || (local_28 == 0))
        {
            local_14 = local_48;
        }
        if (local_27)
        {
            break;
        }
    }
    if (local_27)
    {
        SortResultByDistanceAndFilter(Context, local_8, true, true, true);
        local_134 = -1.0f;
        for (auto& local_132 : local_8)
        {
            local_133 = !(bDepenetrateDynamic);
            if (local_133 && IsDynamicHitResult(local_132))
            {
                continue;
            }
            local_134 = local_132.Distance;
            break;
        }
        local_133 = !(DebugEnsure((local_134 >= 0.0f)));
        if (local_133)
        {
            return (OriginPos + FVector(DepenetrateDeltaMovement));
        }
        else
        {
            float32 local_4_2 = local_134 - 2.0f;
            local_134 = FMath::Max(0.0f, local_4_2);
            return (local_14 - (FVector((local_17.GetSafeNormal(1e-8f, FVector3f::ZeroVector) * local_134))));
        }
    }
    else
    {
        return local_14;
    }
}
FVector DepenetrateSweepBackSoft(const FKMCContext &inout Context, const FQuat &inout LastRot, const FVector3f &inout DepenetrateDeltaMovement, const FVector &inout OriginPos)
{
    TArray<FHitResult> local_4;
    float32 local_41 = 0.0f;
    float32 local_42 = 0.0f;
    FVector local_22 = (OriginPos + FVector(DepenetrateDeltaMovement));
    TOptional<float32> local_24;
    DepenetrateSweepBackTest(local_4, Context, OriginPos, local_22, LastRot);
    for (auto& local_40 : local_4)
    {
        if (local_40.GetbStartPenetrating())
        {
            continue;
        }
        if (IsDynamicHitResult(local_40))
        {
            if (!(local_24.IsSet()))
            {
                local_24 = local_40.Distance;
            }
            continue;
        }
        if (!(local_24.IsSet()))
        {
            local_41 = local_40.Distance;
            local_41 = local_41 - 2.0f;
            local_24 = local_41;
            continue;
        }
        local_42 = local_40.Distance;
        local_42 = local_42 - 2.0f;
        local_24 = FMath::Min(local_41, local_42);
    }
    if (local_24.IsSet())
    {
        return (OriginPos + FVector(DepenetrateDeltaMovement).GetClampedToMaxSize(local_42));
    }
    return local_22;
}
void GetDynamicDepenetrateDeltaMove(const FKMCContext &inout Context, const FHitResult &inout HitResult, const FVector &inout OriginPos, const FVector3f &inout OriginDeltaMove, bool &inout bOutMovementDepenetrate, bool &inout bOutSoftDepenetrate, bool &inout bOutPushByEntityCenter, FVector3f &inout OutDepenetrateDeltaMove)
{
    bool local_24;
    int local_25;
    float32 local_91;
    float32 local_101;
    FFPTime local_2 = FFPTime(Context.Env.RollbackTime);
    FFPTime local_4 = FFPTime(Context.Env.LastRollbackTime);
    FECSEntity local_8 = FECSEntity(int(HitResult.ECSEntityId));
    int local_10 = int(HitResult.ECSIndex);
    int local_15 = int(HitResult.ECSType);
    FVector3f local_18 = FVector3f(FVector3f::ZeroVector);
    FVector3f local_21 = FVector3f(HitResult.Normal);
    bool local_22 = false;
    local_24 = false;
    bool local_23 = false;
    local_25 = local_23;
    if (Context.GetDynamicEntitiesToTolerant().IndexOfByKey(local_8.GetId()) >= 0)
    {
        local_24 = true;
    }
    if (!(local_24))
    {
        Get local_32;
        const FC_DirectionalPushOutParam& local_34 = local_32.opCall();
        if (local_34)
        {
            float32 local_35;
            local_35 = local_34.GetVelocityThreshold();
            bool local_23_2 = (int(FHitResultUtils::GetLogicPushColliderData(HitResult).PushOutCenter) == 1);
            FVector local_78;
            if (local_23_2)
            {
                local_78 = FTransformUtils::SampleLocation(local_8, local_4);
            }
            else
            {
                local_78 = FCollisionUtils::GetCollisionPosition(local_8, EECSLogicCollisionType(local_15), local_10, local_4).Position;
            }
            FVector local_46;
            if (local_23_2)
            {
                local_46 = FTransformUtils::SampleLocation(local_8, local_2);
            }
            else
            {
                local_46 = FCollisionUtils::GetCollisionPosition(local_8, EECSLogicCollisionType(local_15), local_10, local_2).Position;
            }
            FVector3f local_87 = FVector3f((local_46 - local_78));
            float32 local_36 = local_87.SizeSquared();
            if (local_36 > FMath::Square((local_35 * FECSWorld::FixedFrameInterval.ToSeconds())))
            {
                if (local_34.GetPreventSlideAngle() >= 0.0f)
                {
                    local_101 = local_34.GetPreventSlideAngle();
                }
                else
                {
                    local_101 = CVar_DirectionalPushOutPreventSlideAngle.GetFloat();
                }
                if (local_34.GetFullSlideAngle() >= 0.0f)
                {
                    local_91 = local_34.GetFullSlideAngle();
                }
                else
                {
                    local_91 = CVar_DirectionalPushOutFullSlideAngle.GetFloat();
                }
                local_22 = true;
                local_25 = local_23_2;
                FVector3f local_90 = FVector3f((OriginPos - local_78));
                float32 local_99_2 = FMath::RadiansToDegrees(FMath::Acos(local_90.CosineAngle2D(local_87)));
                float32 local_100 = FMathUtils::InverseLerp(local_99_2, local_101, local_91);
                local_18 = FMath::Lerp(local_87, local_90, local_100);
                KMC_DEBUG(FString().Append("Apply depenetrateDeltaMove from collider movement ").Append(local_87).Append(", size = ").Append(local_87.Size()).Append(", Angle: ").Append(local_99_2).Append(", Alpha: ").Append(local_100));
                local_21 = local_18.GetSafeNormal(1e-8f, FVector3f::ZeroVector);
                if (local_36 > FMath::Square(80))
                {
                }
                FVector local_84 = (local_78 + FVector(local_90));
                FName local_116;
                if (GetEnableDebug())
                {
                    local_116 = NAME_None;
                }
                else
                {
                    local_116 = FName("HandlePenetrate");
                }
                FECSDebugDraw::DrawDebugDirectionalArrow(local_116);
                FVector3f local_105 = (local_87 * 10.0f);
                FVector local_52 = (local_78 + FVector(local_105));
                if (GetEnableDebug())
                {
                    local_116 = NAME_None;
                }
                else
                {
                    local_116 = FName("HandlePenetrate");
                }
                FECSDebugDraw::DrawDebugDirectionalArrow(local_116);
            }
        }
    }
    if (!(local_22))
    {
        FVector local_46;
        if (int(FHitResultUtils::GetPushOutNormal(HitResult, local_46)) == 1)
        {
            local_25 = true;
            local_21 = FVector3f(local_46);
        }
        if (HitResult.PenetrationDepth > CVar_DynamicPenetrateTurnToSoftDepth.GetFloat())
        {
            KMC_DEBUG(FString().Append("Apply soft depenetrate, cause its too deep:  ").Append(HitResult.PenetrationDepth));
        }
        else
        {
            float32 local_102 = HitResult.PenetrationDepth + 2.0f;
            local_18 = (local_21 * local_102);
            FString local_112_2 = FString();
            KMC_DEBUG(local_112_2.Append("Apply hard depenetrate: ").Append(local_18).Append(", size = ").Append(local_18.Size()));
        }
    }
    if (CVar_DebugForceSoftPenetration.GetBool())
    {
        local_24 = true;
    }
    if (local_24)
    {
        float32 local_100_2 = FMath::Min(((GetSoftPushOutLength(HitResult, FKinematicMoveCollisionUtils::GetShapeRadiusAsCapsule(Context.GetActualShape()))) + FMath::Max(0.0f, OriginDeltaMove.DotProduct(local_21))), HitResult.PenetrationDepth + 2.0f);
        local_18 = (local_21 * local_100_2);
        float32 local_99_3 = local_18.Size();
        FString local_112_3 = FString();
        KMC_DEBUG(local_112_3.Append("Apply soft penetrate:  ").Append(local_18).Append(", size = ").Append(local_99_3));
    }
    bOutMovementDepenetrate = local_22;
    bOutSoftDepenetrate = local_24;
    bOutPushByEntityCenter = (local_25 != 0);
    OutDepenetrateDeltaMove = local_18;
    return;
}
FVector3f PenetrateHandleSlideNerf(const float32 SlideNerf, const FVector3f &inout SlideForwardNormal, const FVector3f &inout DeltaMove)
{
    FVector3f local_3 = DeltaMove;
    if (SlideNerf <= 0.0f)
    {
        return local_3;
    }
    if (DeltaMove.Size() == 0.0f)
    {
        return local_3;
    }
    float32 local_6 = DeltaMove.DotProduct(SlideForwardNormal);
    FVector3f local_13 = SlideForwardNormal.opMul_r(local_6);
    FVector3f local_10 = (DeltaMove - local_13);
    local_10 *= FMathUtils::InverseLerp(local_6, SlideNerf, 1.0f);
    return (local_13 + local_10);
}
FHandlePenetrateResult GroundMove_HandlePenetrate(const FKMCContext &inout Context, TArray<FHitResult> &inout HitResults, const FVector3f &inout DeltaMove, const FVector3f &inout ExtraSoftPushOut, const FVector &inout OriginPos, const FQuat &inout OriginRot, const bool bEnableSlideInDynamic, const FVector3f &inout Velocity, const float32 DeltaTime)
{
    FHandlePenetrateResult __r;
    HandlePenetrate(Context, HitResults, DeltaMove, ExtraSoftPushOut, OriginPos, OriginRot, true, bEnableSlideInDynamic, Velocity, DeltaTime);
    return __r;
}
FHandlePenetrateResult AirborneMove_HandlePenetrate(const FKMCContext &inout Context, TArray<FHitResult> &inout HitResults, const FVector3f &inout DeltaMove, const FVector3f &inout ExtraSoftPushOut, const FVector &inout OriginPos, const FQuat &inout OriginRot, const FVector3f &inout Velocity, const float32 DeltaTime)
{
    FHandlePenetrateResult __r;
    HandlePenetrate(Context, HitResults, DeltaMove, ExtraSoftPushOut, OriginPos, OriginRot, true, true, Velocity, DeltaTime);
    return __r;
}
FHandlePenetrateResult HandlePenetrate(const FKMCContext &inout Context, TArray<FHitResult> &inout HitResults, const FVector3f &inout DeltaMove, const FVector3f &inout ExtraSoftPushOut, const FVector &inout OriginPos, const FQuat &inout OriginRot, const bool bProjectToFloor, const bool bEnableSlideInDynamic, const FVector3f &inout Velocity, const float32 DeltaTime)
{
    bool local_58;
    bool local_103;
    bool local_104;
    bool local_105;
    FHandlePenetrateResult local_28;
    FHandlePenetrateResult __r;
    int local_29 = 0;
    FBitSet64 local_32;
    FBitSet64 local_34;
    FVector local_36 = local_28.OutTargetPos;
    FVector3f local_40 = local_28.OutTargetVelocity;
    FVector local_46 = OriginPos;
    FQuat local_56 = OriginRot;
    FVector local_36_2 = local_46;
    FVector3f local_40_2 = Velocity;
    int local_30 = HitResults.Num();
    if (!((local_30 <= 64)))
    {
        local_30 = 64;
    }
    int local_59 = 0;
    for (; local_59 < local_30; ++local_59)
    {
        FHitResult& local_62 = HitResults[local_59];
        if (local_62.GetbStartPenetrating())
        {
            float32 local_63 = local_62.PenetrationDepth;
            int local_29_2 = local_59 + 1;
            if (IsDynamicHitResult(local_62))
            {
                local_34.SetBit(local_59, true);
                continue;
            }
            local_32.SetBit(local_59, true);
        }
    }
    if (!(local_32.IsEmpty()))
    {
        KMC_DEBUG(FString().Append("Static Penetrate: ").Append(local_32.NumOfSetBits()));
        FVector3f local_71 = FVector3f(FVector3f::ZeroVector);
        int local_57 = local_32.FirstSetBit();
        for (; local_57 < local_30; ++local_57)
        {
            if (!(local_32.GetBit(local_57)))
            {
                continue;
            }
            FHitResult& local_62_2 = HitResults[local_57];
            local_71 += FVector3f(local_62_2.Normal).opMul_r((local_62_2.PenetrationDepth + 2.0f));
        }
        local_36_2 = DepenetrateSweepBackHard(Context, local_56, local_71, false, local_46);
        FVector3f local_40_3 = FVector3f::ZeroVector;
        local_58 = false;
        local_28.bHandleSlide = local_58;
    }
    else
    {
        if (!(local_34.IsEmpty()) || !((ExtraSoftPushOut == FVector3f::ZeroVector)))
        {
            bool local_91;
            bool local_90;
            KMC_DEBUG(FString().Append("Dynamic Penetrate: ").Append(local_34.NumOfSetBits()));
            local_90 = false;
            local_91 = false;
            FVector3f local_81 = FVector3f(FVector3f::ZeroVector);
            FVector3f local_71_2 = ExtraSoftPushOut;
            FAvgVector3f local_96;
            FAvgVector3f local_100;
            FRandomGenerator local_101 = FRandomGenerator(Context.Entity.GetIdValue());
            int local_59_2 = local_34.FirstSetBit();
            for (; local_59_2 < local_30; ++local_59_2)
            {
                if (!(local_34.GetBit(local_59_2)))
                {
                    continue;
                }
                FHitResult& local_62_3 = HitResults[local_59_2];
                local_103 = false;
                local_104 = false;
                local_105 = false;
                FVector3f local_108;
                GetDynamicDepenetrateDeltaMove(Context, local_62_3, OriginPos, DeltaMove, local_104, local_103, local_105, local_108);
                FVector3f local_114;
                if (bProjectToFloor)
                {
                    local_114 = local_108.VectorPlaneProject(Context.Env.FloorInfo.GetFloorNormalDefaulted());
                }
                else
                {
                    local_114 = local_108;
                }
                local_114 *= local_101.NextRange(0.9999f, 1.0001f);
                if (local_105)
                {
                    if (local_103)
                    {
                        local_96.Add(local_114);
                    }
                    else
                    {
                        local_100.Add(local_114);
                    }
                }
                else
                {
                    if (local_103)
                    {
                        local_71_2 += local_114;
                    }
                    else
                    {
                        local_81 += local_114;
                    }
                }
                local_90 = local_90 || local_103;
                local_91 = local_91 || local_104;
            }
            local_71_2 += local_96.Get();
            local_81 += local_100.Get();
            if (local_90 && !(local_91))
            {
                local_71_2 += local_81;
                local_81 = FVector3f::ZeroVector;
            }
            if (local_81.SizeSquared() > 0.0f)
            {
                FVector local_122 = (OriginPos + FVector(local_81));
                FName local_124;
                if (GetEnableDebug())
                {
                    local_124 = NAME_None;
                }
                else
                {
                    local_124 = n"HandlePenetrate";
                }
                FECSDebugDraw::DrawDebugDirectionalArrow(local_124);
                local_36_2 = DepenetrateSweepBackHard(Context, local_56, local_81, true, local_46);
                FVector3f local_111 = FVector3f((local_36_2 - local_46));
                if (local_111.SizeSquared() > FMath::Square(25.0f))
                {
                    local_28.SmoothDepenetrateMovement += local_111;
                }
                local_46 = local_36_2;
            }
            if (local_71_2.SizeSquared() > 0.0f)
            {
                FVector local_122_2 = (OriginPos + FVector(local_71_2));
                FName local_124;
                if (GetEnableDebug())
                {
                    local_124 = NAME_None;
                }
                else
                {
                    local_124 = n"HandlePenetrate";
                }
                FECSDebugDraw::DrawDebugDirectionalArrow(local_124);
                local_36_2 = DepenetrateSweepBackSoft(Context, local_56, local_71_2, local_46);
            }
            FKMCSweepTestSpecificParams local_134;
            local_58 = MoveSweepTest(HitResults, Context, local_36_2, (local_36_2 + FVector(DeltaMove)), local_56, true, local_134);
            local_105 = false;
            local_104 = false;
            auto local_140 = HitResults.Iterator();
            for (; local_140.CanProceed;)
            {
                FHitResult& local_62_4 = local_140.Proceed();
                if (local_62_4.GetbStartPenetrating() && (local_62_4.PenetrationDepth > 0.0f))
                {
                    bool local_89 = IsDynamicHitResult(local_62_4);
                    if (!(local_89))
                    {
                        local_105 = true;
                        continue;
                    }
                    local_104 = true;
                    local_28.StillPenetrate.Add(FECSEntityId(int(local_62_4.ECSEntityId)));
                }
            }
            local_103 = !(local_105);
            if (!(local_103))
            {
                local_103 = false;
            }
            else
            {
                bool local_147 = !(local_104) || bEnableSlideInDynamic;
                local_103 = local_147;
            }
            local_28.bHandleSlide = local_103;
        }
    }
    DebugEnsure((((local_28.OutTargetPos - OriginPos).Size()) < 50.0));
    return __r;
}
bool FindNonStandingSurfaceAsWall(const FKMCFloorInfo &inout FloorInfo, const FVector3f &inout CurFloorNormal, const FVector &inout LastFloorPoint, const FVector3f &inout InitVelocity)
{
    if (FloorInfo.GetbHitNonStandingSurface() && !(FloorInfo.GetbEdge()))
    {
        FVector3f local_21 = FVector3f((FloorInfo.GetFloorPoint() - LastFloorPoint));
        if (local_21.DotProduct(CurFloorNormal) > 0.0f)
        {
            return true;
        }
        FVector3f local_26 = FloorInfo.GetFloorNormal();
        if (local_21.DotProduct(local_26) < 0.0f)
        {
            return true;
        }
        if (InitVelocity.DotProduct(local_26) < 0.0f)
        {
            return true;
        }
    }
    return false;
}
bool EdgeFloorTest(FHitResult &inout OutResult, const FKMCContext &inout Context, const FVector &inout Start, const float32 DownDist, const FVector3f &inout RefVelocity)
{
    return FindFloorCenterTest(OutResult, Context, Start, FVector(Start.X, Start.Y, (Start.Z - DownDist)), RefVelocity, true);
}
FDetectEdgeResult GroundMove_DetectEdge(const FKMCContext &inout Context, const FVector &inout InPosition, const FQuat &inout InRotation, const FVector3f &inout InDeltaMove)
{
    FVector3f local_106;
    FDetectEdgeResult local_72;
    GetDefaulted local_80;
    FVector3f local_83 = FVector3f(local_80.opCall().GetVelocity());
    FVector3f local_75 = FVector3f(Context.GetActualShape().GetExtent());
    FVector3f local_86 = FVector3f(InDeltaMove.X, InDeltaMove.Y, 0.0f);
    float32 local_96 = local_86.Size();
    FVector3f local_109;
    if (local_96 > 2.0f)
    {
        local_109 = (local_86 / local_96);
    }
    else
    {
        local_109 = FVector3f(InRotation.GetForwardVector());
    }
    FVector3f local_95 = FVector3f::UpVector.CrossProduct(local_109);
    float32 local_97_2 = local_75.Z;
    float32 local_99 = local_97_2 + Context.State.GetStepUpHeight();
    float32 local_114 = (local_99 + Context.Param.MaxHoverHeight) + 2.5f;
    if (Context.Param.EdgeProtectRadius >= 0.0f)
    {
        local_97_2 = Context.Param.EdgeProtectRadius;
    }
    else
    {
        float32 local_98_2 = local_75.Y;
        float32 local_115_2 = local_75.X;
        local_97_2 = FMath::Max(local_115_2, local_98_2);
    }
    float32 local_99_2 = local_97_2 / FMath::Sqrt(2.0f);
    FVector local_124 = InPosition;
    FHitResult local_190;
    if (EdgeFloorTest(local_190, Context, local_124, local_114, local_83) && TestValidFloorSlopeAndEtc(FVector3f(local_190.ImpactNormal), Context.Param))
    {
        local_124 = local_190.ImpactPoint.AddZ(((local_75.Z + Context.State.GetStepUpHeight()) + 1.0f));
    }
    FVector local_92 = FVector((local_109 * local_97_2));
    FVector local_206 = (local_124 + local_92);
    FVector3f local_102 = (local_109 - local_95);
    FVector local_92_2 = (FVector(local_102) * local_99_2);
    FVector local_200 = (local_124 + local_92_2);
    FVector3f local_102_2 = (local_109 + local_95);
    FVector local_92_3 = (FVector(local_102_2) * local_99_2);
    FVector local_212 = (local_124 + local_92_3);
    FDetectEdgeResult local_290 = EdgeTest(Context, local_124, local_206, local_114, local_83);
    FDetectEdgeResult local_362 = EdgeTest(Context, local_124, local_200, local_114, local_83);
    if (local_362.IsCloserThan(local_290))
    {
        local_290 = local_362;
    }
    FVector3f local_434;
    EdgeTest(local_114, local_212, local_124, Context, local_434);
    if (local_434.IsCloserThan(local_290))
    {
        local_290 = local_434;
    }
    if (local_290.bEdgeDetected)
    {
        bool local_103;
        local_103 = true;
        local_72.bEdgeDetected = local_103;
        local_72.SafeMoveDist = 0.0f;
        local_72.BisearchPrecision = local_290.BisearchPrecision;
    }
    else
    {
        bool local_103;
        FVector local_92_4 = FVector(local_86);
        FVector local_218 = (local_124 + local_92_4);
        local_290 = EdgeTest(Context, local_124, local_218, local_114, local_83);
        if (local_290.bEdgeDetected)
        {
            local_92_4 = FVector((local_109 * local_290.SafeMoveDist));
            local_290.SafeMoveDist = FMath::Max(local_290.SafeMoveDist - local_97_2, 0.0f);
        }
        else
        {
            FVector local_218_2 = (local_206 + local_92_4);
            local_290 = EdgeTest(Context, local_206, local_218_2, local_114, local_83);
        }
        if (!(local_290.bEdgeDetected) || ((local_290.SafeMoveDist > 0.0f)))
        {
            FVector local_218_3 = (local_200 + local_92_4);
            FDetectEdgeResult local_362_2 = EdgeTest(Context, local_200, local_218_3, local_114, local_83);
            if (local_362_2.IsCloserThan(local_290))
            {
                local_290 = local_362_2;
            }
        }
        if (!(local_290.bEdgeDetected) || ((local_290.SafeMoveDist > 0.0f)))
        {
            local_434 = EdgeTest(Context, local_212, (local_212 + local_92_4), local_114, local_83);
            if (local_434.IsCloserThan(local_290))
            {
                local_290 = local_434;
            }
        }
        if (local_290.bEdgeDetected)
        {
            local_72.bEdgeDetected = true;
            local_72.SafeMoveDist = local_290.SafeMoveDist;
            local_72.BisearchPrecision = local_290.BisearchPrecision;
        }
    }
    if (!(local_72.bEdgeDetected))
    {
        return local_72;
    }
    local_72.RefHit = local_290.RefHit;
    local_72.EdgeNormal = local_290.EdgeNormal;
    if (local_72.RefHit.Time < 1.0f && (local_109.DotProduct(local_72.EdgeNormal) <= 0.0f))
    {
        return local_72;
    }
    TArray<FHitResult> local_516;
    float32 local_116 = local_290.BisearchPrecision + 1.0f;
    FCollisionShape local_525 = FCollisionShape::MakeSphere(local_116);
    FCollisionQueryParams local_564;
    local_564.bTraceComplex = false;
    local_564.AddIgnoredEntityId(Context.Entity.GetId());
    local_564.AddIgnoredEntityIds(Context.Env.CollisionToIgnore);
    local_564.bIgnoreTouches = true;
    FVector local_92_5 = FVector(local_72.RefHit.TraceStart);
    FVector local_218_4(FVector::DownVector);
    float32 local_113_4 = local_114 - local_116;
    FVector local_218_5 = (local_92_5 + (local_218_4 * local_113_4));
    FindFloorSweepMulti(local_516, Context, local_92_5, local_218_5, FQuat::Identity, local_525, local_83, true);
    SortResultByDistanceAndFilter(Context, local_516, true, false, false);
    if (local_516.Num() == 0 || ((local_109.DotProduct(FVector3f(local_516[0].Normal)) <= 0.0f)))
    {
        if (local_72.RefHit.Time < 1.0f)
        {
            local_106 = local_72.EdgeNormal.opNeg();
        }
        else
        {
            local_106 = local_109.opNeg();
        }
        local_72.EdgeNormal = local_106;
        return local_72;
    }
    local_72.RefHit = local_516[0];
    local_72.EdgeNormal = FVector3f(local_516[0].Normal).opNeg();
    return local_72;
}
FDitchProtectResult TestDitchProtect(const FKMCContext &inout Context, const FHitResult &inout SweepHit, const FVector &inout Position, const FVector3f &inout RefVelocity)
{
    FDitchProtectResult local_74;
    FVector3f local_87 = FVector3f((Position - SweepHit.ImpactPoint));
    float32 local_88_2 = local_87.Size();
    if (local_88_2 <= 0.0001f)
    {
        return local_74;
    }
    FVector3f local_77 = (local_87 / local_88_2);
    float32 local_89 = float32(Context.GetActualShape().GetExtent().Z);
    float32 local_97 = Context.Param.DitchProtectRadius;
    if (local_97 < 0.0f)
    {
        local_97 = FKinematicMoveCollisionUtils::GetShapeRadiusAsCapsule(Context.GetActualShape());
    }
    float32 local_94 = -local_89;
    FVector local_84 = SweepHit.Location.AddZ(local_94);
    FVector3f local_93 = (local_77 * local_97);
    FVector local_122 = (local_84.AddZ(local_97) + FVector(local_93));
    float32 local_94_2 = float32(local_122.Dist2D(SweepHit.ImpactPoint));
    float32 local_125 = (local_94_2 * FMath::Tan(FMath::DegreesToRadians(Context.Param.SlopDegreeMax))) - 1.0f;
    local_122.Z = FMath::Min(local_122.Z, (SweepHit.ImpactPoint.Z + local_125));
    FVector local_110 = FVector(local_122.X, local_122.Y, SweepHit.ImpactPoint.Z - local_125);
    FHitResult local_202;
    bool local_204 = FindFloorCenterTest(local_202, Context, local_122, local_110, RefVelocity, true);
    if (local_204 && CanCharacterStandOnForMovement(Context, local_202))
    {
        local_74.bHasFloorBeyond = true;
        local_74.FloorHit = local_202;
        local_74.FloorZ = FMath::Min(local_84.Z, local_202.ImpactPoint.Z);
        FVector3f local_93_2 = FVector3f((FVector(local_202.ImpactPoint) - SweepHit.ImpactPoint));
        local_74.CorrectedNormal = local_93_2.CrossProduct(FVector3f::UpVector.CrossProduct(local_93_2)).GetSafeNormal(1e-8f, FVector3f::ZeroVector);
    }
    return local_74;
}
float32 BisearchEdge(const FKMCContext &inout Context, FHitResult &inout NonFloorHit, const FVector &inout InStartPos, const FVector &inout InDeltaMove, const float32 LookDownLength, float32 &inout Precision, const FVector3f &inout RefVelocity = FVector3f::ZeroVector)
{
    float32 local_1 = 0.0f;
    FVector local_8 = InStartPos;
    FVector local_14 = InDeltaMove;
    FHitResult local_80;
    float32 local_2 = float32(local_14.Size());
    int local_85 = 0;
    while (local_2 > Precision)
    {
        ++local_85;
        local_14 *= 0.5;
        local_2 = local_2 * 0.5f;
        FVector local_94 = (local_8 + local_14);
        bool local_87 = EdgeFloorTest(local_80, Context, local_94, LookDownLength, RefVelocity);
        if (local_87 && (TestValidFloorSlopeAndEtc(FVector3f(local_80.ImpactNormal), Context.Param) || TryEdgeDitchProtect(Context, local_94, local_80, RefVelocity)))
        {
            local_8 += local_14;
            local_1 = local_1 + local_2;
        }
        else
        {
            NonFloorHit = local_80;
        }
    }
    Precision = local_2;
    return local_1;
}
bool TryEdgeDitchProtect(const FKMCContext &inout Context, const FVector &inout Position, const FHitResult &inout CenterHit, const FVector3f &inout RefVelocity)
{
    float32 local_16;
    if (CVar_DebugDitchProtectLevel.GetInt() <= 0)
    {
        return false;
    }
    FVector3f local_15 = FVector3f(Context.GetActualShape().GetExtent());
    local_16 = Context.State.GetStepUpHeight();
    FVector local_12 = FVector(Position.X, Position.Y, (Position.Z - ((local_16 + Context.Param.MaxHoverHeight) + 2.5f)));
    TArray<FHitResult> local_42;
    if (!(FindFloorShapeTest(local_42, Context, Position, local_12, FQuat::Identity, RefVelocity, false)))
    {
        return false;
    }
    SortResultByDistanceAndFilter(Context, local_42, true, false, false);
    FilterFloorIgnoreResults(Context, local_42);
    if (local_42.Num() == 0)
    {
        return false;
    }
    FKMCFloorInfo local_72;
    FillFloorInfoBySweepHits(local_72, local_42);
    int local_2 = CVar_DebugDitchProtectLevel.GetInt() & 1;
    if (local_2 == 0 && !(local_72.GetbHasFloor()))
    {
        return false;
    }
    if ((CVar_DebugDitchProtectLevel.GetInt() & 2) == 0)
    {
        if (FMath::Abs(((float32(((float32(((Position.Z - local_15.Z) - local_16))) - CenterHit.Location.Z)) - 1.0f) - local_72.GetFloorDistance())) >= Context.Param.MaxHoverHeight)
        {
            return false;
        }
    }
    return TestDitchProtect(Context, local_42[0], Position, RefVelocity).bHasFloorBeyond;
}
FDetectEdgeResult EdgeTest(const FKMCContext &inout Context, const FVector &inout StartPos, const FVector &inout EndPos, const float32 LookDownLength, const FVector3f &inout RefVelocity = FVector3f::ZeroVector)
{
    FDetectEdgeResult local_72;
    FHitResult local_138;
    bool local_140 = EdgeFloorTest(local_138, Context, EndPos, LookDownLength, RefVelocity);
    if (local_140 && (TestValidFloorSlopeAndEtc(FVector3f(local_138.ImpactNormal), Context.Param) || TryEdgeDitchProtect(Context, EndPos, local_138, RefVelocity)))
    {
        local_72.bEdgeDetected = false;
        local_72.RefHit = local_138;
        return local_72;
    }
    float32 local_145 = 20.0f;
    float32 local_146 = BisearchEdge(Context, local_138, StartPos, (EndPos - StartPos), LookDownLength, local_145, RefVelocity);
    local_72.bEdgeDetected = true;
    local_72.SafeMoveDist = local_146;
    local_72.BisearchPrecision = 20.0f;
    local_72.RefHit = local_138;
    local_72.EdgeNormal = FVector3f(local_138.ImpactNormal);
    return local_72;
}
void GroundMove_HandleSlide(const FKMCContext &inout Context, TArray<FHitResult> &inout HitResults, FHandleSlideInfo &inout SlideInfo, const FVector3f &inout DeltaMove, const FVector &inout OriginPos, const FQuat &inout OriginRot, const FVector3f &inout Velocity, const float32 DeltaTime, FVector &inout OutTargetPos, FQuat &inout OutTargetRot, FVector3f &inout OutTargetVelocity, FKMCFloorInfo &inout FloorInfo)
{
    bool local_10 = false;
    float32 local_52;
    bool local_73;
    float32 local_2 = SlideInfo.SlideRatio;
    float32 local_4 = SlideInfo.SlideNerf;
    float32 local_6 = DeltaMove.Size();
    FVector3f local_16;
    if (local_6 > 0.0f)
    {
        local_16 = (DeltaMove / local_6);
    }
    else
    {
        local_16 = FVector3f::ZeroVector;
    }
    FQuat local_32 = OriginRot;
    FVector3f local_35;
    int local_36 = 4;
    FVector3f local_40 = Context.Env.FloorInfo.GetFloorNormal();
    FVector3f local_43 = FVector3f(FVector3f::ZeroVector);
    float32 local_44 = 0.0f;
    float32 local_45 = 45.0f;
    FRotator3f local_48;
    for (; local_36 >= 0; --local_36)
    {
        FVector3f local_51 = SlideInfo.WallNormal;
        local_52 = SlideInfo.NonBlockingMoveDistance;
        FVector3f local_55 = SlideInfo.NonBlockingDeltaMove;
        local_44 = local_44 + local_52;
        KMC_DEBUG(FString().Append("Slide Length, ").Append(local_52));
        FVector3f local_9 = FVector3f((DeltaMove - local_55));
        float32 local_5 = local_9.Size();
        FVector3f local_63 = local_9.VectorPlaneProject(local_51);
        if (local_44 == 0.0f && (local_43 == local_51))
        {
            if (local_48.IsZero())
            {
                FVector3f local_67 = FVector3f::UpVector.CrossProduct(local_16);
                if (local_67.DotProduct(local_63) < 0.0f)
                {
                    float32 local_72 = -local_45;
                    local_45 = local_72;
                }
            }
            local_63 = local_48.RotateVector(local_63);
            float32 local_72_2 = local_48.Yaw + local_45;
        }
        local_43 = local_51;
        local_73 = false;
        if (local_63.DotProduct(local_16) < 0.0f)
        {
            local_63 = FVector3f::ZeroVector;
            local_73 = true;
        }
        if (!(local_73))
        {
            float32 local_72_3 = local_2;
            ApplySlideTweaks(local_63, local_72_3, local_4, local_5);
        }
        else
        {
            local_63 = FVector3f::ZeroVector;
        }
        FVector local_86 = FVector(local_55);
        FVector local_92 = (OriginPos + local_86);
        local_86 = FVector(local_63);
        FVector local_80 = (local_92 + local_86);
        if (local_73 || local_63.IsNearlyZero(0.01f) || (local_36 == 0))
        {
            local_80 = local_92;
            local_73 = true;
            FloorInfo = SlideInfo.NonBlockingNextPosFloorInfo;
        }
        else
        {
            local_86 = FVector(local_63);
            local_86 = (local_92 + EnsureSize(local_86, 2.0f));
            FKMCSweepTestSpecificParams local_114;
            local_10 = MoveSweepTest(HitResults, Context, local_92, local_86, local_32, false, local_114);
            FilterEnablePenetrateHits(Context, HitResults, false);
            CheckNeedHandleSlide_GroundMove(Context, HitResults, local_92, local_32, local_63, Velocity);
            FloorInfo = SlideInfo.NonBlockingNextPosFloorInfo;
            if (!(SlideInfo.bNeedSlide))
            {
                local_73 = true;
            }
            if (!(local_73))
            {
                FVector local_22 = local_92;
                local_35 = local_63;
            }
            else
            {
                local_44 = local_44 + local_63.Size();
            }
        }
        if (local_73)
        {
            OutTargetPos = local_80;
            OutTargetRot = local_32;
            FVector local_104 = (local_80 - OriginPos);
            OutTargetVelocity = (FVector3f(local_104) / DeltaTime);
            OutTargetVelocity = OutTargetVelocity.GetClampedToMaxSize(Velocity.Size());
            break;
        }
    }
    return;
}
void ApplySlideTweaks(FVector3f &inout SlideDeltaMove, const float32 SlideRatio, const float32 SlideNerf, const float32 RawDeltaMoveLength)
{
    float32 local_2 = SlideDeltaMove.Size();
    if (local_2 < 0.0001f || (RawDeltaMoveLength < 0.0001f))
    {
        SlideDeltaMove = FVector3f::ZeroVector;
        return;
    }
    FVector3f local_10 = (SlideDeltaMove / local_2);
    float32 local_13 = FMath::Min(local_2 / RawDeltaMoveLength, 1.0f);
    float32 local_14 = 1.0f;
    float32 local_15 = 1.0f;
    if (SlideNerf > 0.0f)
    {
        local_14 = FMathUtils::InverseLerp(local_13, SlideNerf, 1.0f);
        KMC_DEBUG(FString().Append("Slide Nerf = ").Append(SlideNerf).Append(", speed remain ").Append(local_13).Append(" -> ").Append(local_14));
    }
    else
    {
        FString local_20_2 = FString();
        KMC_DEBUG(local_20_2.Append("Slide Nerf = ").Append(SlideNerf));
    }
    if (SlideRatio > 0.5f)
    {
        float32 local_21 = 1.0f;
        float32 local_1 = 1.0f;
        local_15 = local_21 / FMath::Lerp(local_1, local_13, FMathUtils::InverseLerp(SlideRatio, 0.5f, 1.0f));
    }
    else
    {
        if (SlideRatio < 0.5f)
        {
            local_15 = FMathUtils::InverseLerp(SlideRatio, 0.0f, 0.5f);
        }
    }
    KMC_DEBUG(FString().Append("Slide Ratio: ").Append(local_13));
    if (local_14 != 1.0f || (local_15 != 1.0f))
    {
        float32 local_11 = local_2 * local_14;
        float32 local_21_2 = local_11 * local_15;
        SlideDeltaMove = (local_10 * local_21_2);
    }
    return;
}
FHandleSlideInfo CheckNeedHandleSlide_GroundMove(const FKMCContext &inout Context, TArray<FHitResult> &inout RefHitResults, const FVector &inout LastPos, const FQuat &inout LastRot, const FVector3f &inout LastDeltaMove, const FVector3f &inout InitVelocity)
{
    FHandleSlideInfo local_36;
    bool local_311 = false;
    FHandleSlideInfo __r;
    FVector3f local_46 = FVector3f(LastDeltaMove.GetSafeNormal(1e-8f, FVector3f::ZeroVector));
    if (local_46.IsZero())
    {
        local_36.NonBlockingNextPosFloorInfo = FKinematicMoveCollisionUtils::FindFloor(Context, LastPos, LastRot, 0.0f);
    }
    else
    {
        float32 local_97;
        FVector3f local_77 = Context.State.GetFloorNormalSmoothed();
        FVector local_90 = FVector(LastDeltaMove);
        FVector local_96 = (LastPos + local_90);
        local_97 = -1.0f;
        SortResultByDistanceAndFilter(Context, RefHitResults, false, true, false);
        if (RefHitResults.Num() > 0)
        {
            FVector3f local_43 = GetHitResultNormal(RefHitResults);
            float32 local_40 = local_46.DotProduct(local_43);
            if (!((local_40 < 0.0f)))
            {
                local_43 = local_46.opNeg();
                local_40 = -1.0f;
            }
            float32 local_106 = FKinematicMoveCollisionUtils::GetSlopeAngle(local_43);
            if (local_106 > Context.Param.SlopDegreeMax)
            {
                FVector3f local_39 = local_43.VectorPlaneProject(local_77).GetSafeNormal(1e-8f, FVector3f::ZeroVector);
                if (DebugEnsure(!(local_39.IsNearlyZero(0.0001f))))
                {
                    local_43 = local_39;
                }
            }
            local_106 = 2.0f;
            local_106 = local_106 / -local_40;
            local_97 = FMath::Max(0.0f, (RefHitResults[0].Distance - local_106));
            FVector3f local_110 = local_46.opMul_r(local_97);
            local_96 = (LastPos + FVector(local_110));
            local_36.bNeedSlide = true;
            local_36.bFloorAsWall = false;
            local_36.NonBlockingDeltaMove = local_110;
            local_36.NonBlockingMoveDistance = local_97;
            local_36.WallNormal = local_43;
            DebugEnsure(FMath::IsNearlyEqual(local_36.WallNormal.SizeSquared(), 1.0, 0.01));
        }
        bool local_99 = Context.Param.bPreventEdgeFalling || CVar_DebugForcePreventEdgeFalling.GetBool();
        if (local_99)
        {
            FVector local_90_2 = (local_96 - LastPos);
            FDetectEdgeResult local_264 = GroundMove_DetectEdge(Context, LastPos, LastRot, FVector3f(local_90_2));
            if (local_264.bEdgeDetected)
            {
                FVector3f local_39_2 = local_264.EdgeNormal.VectorPlaneProject(local_77).GetSafeNormal(1e-8f, FVector3f::ZeroVector);
                if (local_39_2.IsNearlyZero(0.0001f))
                {
                    local_39_2 = local_46.opNeg();
                }
                local_36.bNeedSlide = true;
                local_36.bFloorAsWall = true;
                local_36.NonBlockingDeltaMove = (local_46 * local_264.SafeMoveDist);
                local_36.NonBlockingMoveDistance = local_264.SafeMoveDist;
                local_36.WallNormal = local_39_2;
                FVector local_90_3 = FVector(local_36.NonBlockingDeltaMove);
                local_96 = (LastPos + local_90_3);
            }
        }
        FKMCFloorInfo local_74_2 = FKinematicMoveCollisionUtils::FindFloor(Context, local_96, LastRot, 0.0f);
        float local_116 = LastPos.Z - Context.State.GetStepUpHeight();
        float local_118 = local_116 - Context.GetActualShape().GetExtent().Z;
        FVector local_84 = FVector(LastPos.X, LastPos.Y, local_118);
        if ((!(local_99)) && FindNonStandingSurfaceAsWall(local_74_2, local_77, local_84, InitVelocity))
        {
            bool local_312;
            FindNonStandingSurfaceAsWall(local_74_2, local_77, local_84, InitVelocity);
            FVector local_304 = LastPos;
            FVector local_310 = local_96;
            FVector3f local_39_3 = FVector3f(local_74_2.GetFloorNormal());
            local_311 = false;
            local_312 = false;
            local_74_2 = FKinematicMoveCollisionUtils::FindFloor(Context, local_304, LastRot, 0.0f);
            while (!(local_312))
            {
                FVector local_90_4 = ((local_304 + local_310) * 0.5);
                FKMCFloorInfo local_290 = FKinematicMoveCollisionUtils::FindFloor(Context, local_90_4, LastRot, 0.0f);
                if (FindNonStandingSurfaceAsWall(local_290, local_77, local_84, InitVelocity))
                {
                    local_310 = local_90_4;
                    local_39_3 = local_290.GetFloorNormal();
                }
                else
                {
                    local_304 = local_90_4;
                    local_74_2 = local_290;
                    local_311 = true;
                }
                if (FVector3f((local_304 - local_310)).SizeSquared() < FMath::Square(5.0f))
                {
                    local_312 = true;
                }
            }
            FVector3f local_43_2 = FVector3f((local_304 - LastPos));
            local_96 = (LastPos + FVector(local_43_2));
            float32 local_112 = local_43_2.Size();
            local_36.bNeedSlide = true;
            local_36.bFloorAsWall = true;
            local_36.NonBlockingDeltaMove = local_43_2;
            local_36.NonBlockingMoveDistance = local_112;
            local_36.WallNormal = local_39_3.VectorPlaneProject(local_77).GetSafeNormal(1e-8f, FVector3f::ZeroVector);
            DebugEnsure(FMath::IsNearlyEqual(local_36.WallNormal.SizeSquared(), 1.0, 0.01));
        }
        DebugEnsure(!(local_36.bNeedSlide) || !(local_36.WallNormal.IsNearlyZero(0.0001f)));
        local_36.NonBlockingNextPosFloorInfo = local_74_2;
        if (RefHitResults.Num() > 0 || local_36.bFloorAsWall)
        {
            local_36.SlideNerf = GetSlideNerf(Context, RefHitResults, local_36.bFloorAsWall);
            local_36.SlideRatio = GetSlideRatio(Context, RefHitResults, local_36.bFloorAsWall);
        }
    }
    return __r;
}
void HandleExtraColliderSweep(const FKMCContext &inout Context, const FVector3f &inout DeltaMove, FVector3f &inout OutHardDepenetrateMove, FVector3f &inout OutSoftDepenetrateMove, TArray<FNameHandle_EntityBBVarBool> &inout OutHitBBVars)
{
    OutHardDepenetrateMove = FVector3f::ZeroVector;
    OutSoftDepenetrateMove = FVector3f::ZeroVector;
    if (Context.Param.ExtraShapes.Num() == 0)
    {
        return;
    }
    FTransform local_28 = FTransform(Context.State.GetRawRotation(), Context.State.GetRawPosition(), FVector(Context.State.GetScale()));
    TArray<FHitResult> local_42;
    FAvgVector3f local_46;
    FAvgVector3f local_50;
    FKMCSweepTestSpecificParams local_58;
    int local_59 = 0;
    FCollisionShape local_200;
    FCollisionShape local_178;
    FVector3f local_219;
    for (; local_59 < Context.Param.ExtraShapes.Num(); ++local_59)
    {
        const FExtraCollisionShape& local_62 = Context.Param.ExtraShapes[local_59];
        FTransform local_88 = local_28;
        FVector3f local_91 = DeltaMove;
        if ((!((FECSEntity(local_62.GetResolveSourceEntity()) == ENTITY_NULL))))
        {
            Get local_100;
            const FC_Transform& local_102 = local_100.opCall();
            if (local_102)
            {
                local_88 = local_102.ToFTransform();
                local_91 = FVector3f::ZeroVector;
            }
            else
            {
                continue;
            }
        }
        FVector local_140 = local_88.TransformPosition(FVector(local_62.GetPosOffset()));
        FQuat local_168 = local_88.TransformRotation(FQuat(local_62.GetRotOffset().Quaternion()));
        FVector local_134 = (local_140 + FVector(local_91));
        if (local_62.GetbUseCustomShape())
        {
            local_178 = local_62.GetShape().GetAsShape();
            local_58.SetShape(local_178);
        }
        else
        {
            local_58.ResetShape();
        }
        if (!(CVar_DebugExtraShapeEasilyQueryBigPawn.GetBool()))
        {
            if (local_62.GetbQueryBigPawn())
            {
                local_58.SetChannel(ECollisionChannel(25));
            }
            else
            {
                local_58.ResetChannel();
            }
        }
        MoveSweepTest(local_42, Context, local_140, local_134, local_168, false, local_58);
        SortResultByDistanceAndFilter(Context, local_42, true, false, false);
        bool local_181 = local_62.GetbQueryBigPawn() && CVar_DebugExtraShapeEasilyQueryBigPawn.GetBool();
        if (local_181)
        {
            int local_185 = local_42.Num() - 1;
            for (; local_185 >= 0; --local_185)
            {
                if (!(IsEntityHitResult(local_42[local_185])))
                {
                    local_181 = false;
                }
                else
                {
                    FECSEntity local_96 = FECSEntity(int(local_42[local_185].ECSEntityId));
                    GetDefaulted local_190;
                    local_181 = !(local_190.opCall().bIsBigPawn);
                }
                if (local_181)
                {
                    local_42.RemoveAt(local_185);
                }
            }
        }
        if (local_42.Num() > 0)
        {
            FAvgVector3f local_194;
            float32 local_35 = GetSlideRatio(Context, local_42, false);
            float32 local_195 = GetSlideNerf(Context, local_42, false);
            if (local_62.GetbUseCustomShape())
            {
            }
            else
            {
            }
            local_200 = local_178;
            float32 local_196 = FKinematicMoveCollisionUtils::GetShapeRadiusAsCapsule(local_200);
            for (auto& local_216 : local_42)
            {
                if (local_216.GetbStartPenetrating() && !(local_62.GetbPushOutTowardsEntityCenter()))
                {
                    local_219 = FVector3f(local_216.ImpactNormal);
                }
                else
                {
                    local_219 = FVector3f((local_88.GetLocation() - local_216.ImpactPoint)).GetSafeNormal(1e-8f, FVector3f::ZeroVector);
                }
                float32 local_201 = FMath::Min((GetSoftPushOutLength(local_216, local_196)), (local_216.PenetrationDepth + 2.0f));
                local_194.Add((local_219 * local_201));
            }
            FVector3f local_225 = local_194.Get();
            FVector3f local_222 = Context.Env.FloorInfo.GetFloorNormalDefaulted();
            local_225 = FKinematicMoveCollisionUtils::AdaptFloorNormal(local_225, local_222);
            float32 local_227 = local_225.Size();
            FVector3f local_230 = GetSlideForwardVector(Context, DeltaMove);
            local_219 = FKinematicMoveCollisionUtils::AdaptFloorNormal(local_230, local_222);
            local_219 = local_225.ProjectOnToNormal(local_219.GetSafeNormal(1e-8f, FVector3f::ZeroVector));
            FVector3f local_236 = (local_225 - local_219);
            ApplySlideTweaks(local_236, local_35, local_195, local_227);
            local_225 = (local_219 + local_236);
            if (local_62.GetbSoftPushOut())
            {
                local_46.Add(local_225);
            }
            else
            {
                local_50.Add(local_225);
            }
            if ((!((FName(local_62.GetCollisionHitBBVar().Name) == NAME_None))))
            {
                OutHitBBVars.AddUnique(local_62.GetCollisionHitBBVar());
            }
        }
    }
    OutHardDepenetrateMove = local_50.Get();
    OutSoftDepenetrateMove = local_46.Get();
    return;
}
FSnapToFloorInfo GroundMove_SnapToFloor(const FKMCContext &inout Context, const FKMCFloorInfo &inout FloorInfo, const FVector &inout Pos, const FQuat &inout Rot, const float32 DeltaTime)
{
    float32 local_13;
    FSnapToFloorInfo local_8;
    TArray<FHitResult> local_12;
    local_13 = Context.State.GetSnapToFloorVelocity();
    FVector3f local_21 = FKinematicMoveCollisionUtils::GetSnapToFloorMove(Context, FloorInfo, Pos, local_13, DeltaTime, false);
    if (local_21.IsNearlyZero(0.0001f))
    {
        return local_8;
    }
    FVector3f local_24 = local_21;
    MoveSweepTest(local_12, Context, Pos, (Pos + EnsureSize(FVector(local_21), 2.0f)), Rot, true, FKMCSweepTestSpecificParams());
    SortResultByDistanceAndFilter(Context, local_12, false, true, false);
    if (local_12.Num() > 0)
    {
        FVector3f local_17 = GetHitResultNormal(local_12);
        float32 local_14 = FMath::Sign(local_21.Z) * local_17.Z;
        if ((!((local_14 < 0.0f))))
        {
            local_14 = -1.0f;
        }
        local_24 = FVector3f(0.0f, 0.0f, ((FMath::Max(local_12[0].Distance - (2.0f / -local_14), 0.0f)) * FMath::Sign(local_21.Z)));
        if (local_21.Z > 1e-8f || !(CVar_EnableSnapToFloorSlideMoveOnlyWhenUpward.GetBool()))
        {
            local_8.SlideMove = (local_21 - local_24).VectorPlaneProject(local_17);
        }
    }
    local_8.SnapDeltaMove = local_24;
    local_8.SmoothVelocity = local_13;
    return local_8;
}
FSnapToFloorInfo Airborne_SnapToFloor(const FKMCContext &inout Context, const FKMCFloorInfo &inout FloorInfo, const FVector &inout Pos, const FQuat &inout Rot, const float32 DeltaTime)
{
    float32 local_9;
    FSnapToFloorInfo local_8;
    local_9 = Context.State.GetSnapToFloorVelocity();
    local_8.SnapDeltaMove = FKinematicMoveCollisionUtils::GetSnapToFloorMove(Context, FloorInfo, Pos, local_9, DeltaTime, true);
    local_8.SmoothVelocity = local_9;
    return local_8;
}
FKMCResult ConstrainCharacterGroundMove(const FKMCContext &inout Context, const FVector &inout Velocity, const FVector &inout DeltaMove, const float32 DeltaTime)
{
    FKMCResult local_76;
    int local_78 = 0;
    FVector3f local_161;
    int local_220 = 0;
    FVector local_84(Context.State.GetCollisionPosition());
    FQuat local_100 = FQuat(Context.State.GetCollisionRotation());
    FSnapToFloorInfo local_124 = GroundMove_SnapToFloor(Context, local_78, local_84, local_100, DeltaTime);
    FVector local_136 = (local_84 + FVector(local_124.SnapDeltaMove));
    local_76.SetOutSnapToFloorVelocity(local_124.SmoothVelocity);
    FVector3f local_140 = Context.State.GetFloorNormalSmoothed();
    FVector3f local_149 = Context.GetCombinedDeltaMove(FVector3f(DeltaMove));
    local_149 += local_124.SlideMove;
    FVector3f local_143 = FKinematicMoveCollisionUtils::AdaptFloorNormal(local_149, local_140);
    FVector3f local_155;
    if (Context.Param.ExtraShapes.Num() > 0)
    {
        HandleExtraColliderSweep(Context, FVector3f(DeltaMove), local_161, local_155, local_76.OutExtraShapeHitBBVars);
        local_143 += local_161;
        local_76.SetOutSmoothDepenetrateDeltaMove(FVector3f());
    }
    FVector3f local_152 = FKinematicMoveCollisionUtils::AdaptFloorNormal(FVector3f(Velocity), local_140);
    FVector local_90 = (local_84 + DeltaMove);
    FVector local_168 = (local_136 + FVector(local_143));
    FQuat local_184 = local_100;
    local_161 = FVector3f(Velocity);
    FVector local_174 = (local_136 + EnsureSize(FVector(local_143), 2.0f));
    TArray<FHitResult> local_198;
    FKMCSweepTestSpecificParams local_206;
    local_206.SetOutPostDetachPenetratingEntityIds(local_76.OutPostDetachPenetratingEntityIds);
    bool local_208 = MoveSweepTest(local_198, Context, local_136, local_174, local_100, true, local_206);
    bool local_211 = SortResultByDistanceAndFilter(Context, local_198, true, false, false);
    bool local_212 = true;
    FVector local_218 = local_136;
    if (local_211)
    {
        bool local_229;
        if (ECS::GetRuntimeInfo().IsServer)
        {
            Print(FString().Append("Ground bHasPenetration ").Append(local_136), 5.0f, FLinearColor(FColor::Red));
        }
        local_229 = Context.Param.bEnableOnGroundPenetratingSlide;
        FHandlePenetrateResult local_260 = GroundMove_HandlePenetrate(Context, local_198, local_143, local_155, local_136, local_100, local_229, FVector3f(Velocity), DeltaTime);
        local_212 = local_260.bHandleSlide;
        local_168 = local_260.OutTargetPos;
        local_184 = local_260.OutTargetRot;
        local_161 = local_260.OutTargetVelocity;
        local_76.SetOutSmoothDepenetrateDeltaMove((FVector3f(local_76.GetOutSmoothDepenetrateDeltaMove()) + local_260.SmoothDepenetrateMovement));
        if (local_229)
        {
            for (auto& local_302 : local_260.StillPenetrate)
            {
                Context.AddEnablePenetrateEntity(local_302);
            }
            FilterEnablePenetrateHits(Context, local_198, false);
        }
        if (!(local_212) == !(false))
        {
            local_220 = FKinematicMoveCollisionUtils::FindFloor(Context, local_168, local_184, 0.0f);
        }
        else
        {
            local_218 = local_168;
        }
    }
    if (local_212)
    {
        FHandleSlideInfo local_400 = CheckNeedHandleSlide_GroundMove(Context, local_198, local_218, local_100, local_143, local_152);
        local_220 = local_400.NonBlockingNextPosFloorInfo;
        KMC_DEBUG(FString().Append("SlideInfo ").Append(local_400.bFloorAsWall).Append(", ").Append(local_400.WallNormal).Append(", ").Append(local_220));
        if (local_400.bNeedSlide)
        {
            local_76.bFloorAsWall = local_400.bFloorAsWall;
            GroundMove_HandleSlide(Context, local_198, local_400, local_143, local_218, local_100, local_152, DeltaTime, local_168, local_184, local_161, local_220);
        }
        else
        {
            local_168 = (local_218 + FVector(local_143));
        }
    }
    FKinematicMoveCollisionUtils::GetSmoothedGroundNormal(local_76, Context, local_220, DeltaMove, DeltaTime);
    FKinematicMoveCollisionUtils::AdjustMovementForBorder(Context, local_84, local_168);
    if (!(local_168.Equals(local_90, 9.999999747378752e-5)))
    {
        local_76.ConstrainPos(Context.State.ConvertPositionBackToTransform(local_168));
        local_76.ConstrainRot(Context.State.GetCollisionRotation());
    }
    if (!(local_161.Equals(FVector3f(Velocity), 0.0001f)))
    {
        local_76.ConstrainVel(FVector(local_161));
    }
    return local_76;
}
FKMCResult ConstrainCharacterAirborneMove(const FKMCContext &inout Context, const FVector &inout Velocity, const FVector &inout DeltaMove, const float32 DeltaTime)
{
    FKMCResult local_76;
    int local_138 = 0;
    float32 local_318;
    FVector local_82(Context.State.GetCollisionPosition());
    FQuat local_96 = FQuat(Context.State.GetCollisionRotation());
    FVector3f local_114 = FVector3f(0.0f, 0.0f, float32(DeltaMove.Z));
    FVector3f local_107 = FVector3f(DeltaMove);
    FVector3f local_129;
    FVector3f local_135;
    if (Context.Param.ExtraShapes.Num() > 0)
    {
        HandleExtraColliderSweep(Context, FVector3f(DeltaMove), local_135, local_129, local_76.OutExtraShapeHitBBVars);
        local_107 += local_135;
        local_76.SetOutSmoothDepenetrateDeltaMove(FVector3f());
    }
    if (local_138.GetbHasFloor() || local_138.GetbHitNonStandingSurface())
    {
        float local_144 = local_138.GetOnFloorPositionZ(Context.GetActualShape().GetExtent().Z, Context.State.GetStepUpHeight());
        if (local_82.Z < local_144 && (local_107.DotProduct(local_138.GetFloorNormal()) < 0.0f))
        {
            local_107 = local_107.VectorPlaneProject(local_138.GetFloorNormal());
        }
    }
    FSnapToFloorInfo local_160 = Airborne_SnapToFloor(Context, Context.Env.FloorInfo, local_82, local_96, DeltaTime);
    local_107 += local_160.SnapDeltaMove;
    local_76.SetOutSnapToFloorVelocity(local_160.SmoothVelocity);
    FVector local_88 = (local_82 + DeltaMove);
    FVector local_178 = (local_82 + FVector(local_107));
    FQuat local_188 = local_96;
    FVector3f local_119 = FVector3f(Velocity);
    local_135 = local_107.GetSafeNormal(1e-8f, FVector3f::ZeroVector);
    float32 local_111 = local_107.Size();
    float32 local_192 = FMath::Abs(local_107.Z);
    TArray<FHitResult> local_198;
    FVector local_166 = (local_82 + EnsureSize(FVector(local_107), 2.0f));
    FKMCSweepTestSpecificParams local_212;
    local_212.SetOutPostDetachPenetratingEntityIds(local_76.OutPostDetachPenetratingEntityIds);
    MoveSweepTest(local_198, Context, local_82, local_166, local_96, true, local_212);
    bool local_215 = SortResultByDistanceAndFilter(Context, local_198, true, false, false);
    bool local_216 = true;
    FVector local_222 = local_82;
    if (local_215)
    {
        if (ECS::GetRuntimeInfo().IsServer)
        {
            Print(FString().Append("Airborne bHasPenetration ").Append(local_82), 5.0f, FLinearColor(FColor::Red));
        }
        FHandlePenetrateResult local_260 = AirborneMove_HandlePenetrate(Context, local_198, local_107, local_129, local_82, local_96, FVector3f(Velocity), DeltaTime);
        local_216 = local_260.bHandleSlide;
        local_188 = local_260.OutTargetRot;
        local_119 = local_260.OutTargetVelocity;
        local_76.OutAddTolerant.Append(local_260.StillPenetrate);
        local_76.SetOutSmoothDepenetrateDeltaMove((FVector3f(local_76.GetOutSmoothDepenetrateDeltaMove()) + local_260.SmoothDepenetrateMovement));
        if (local_216)
        {
            local_222 = local_260.OutTargetPos;
        }
    }
    if (local_216)
    {
        float32 local_303;
        bool local_295;
        int local_292 = 4;
        int local_293 = 1;
        int local_294 = 1056964608;
        local_295 = false;
        FVector local_302 = local_222;
        local_303 = local_111;
        FVector3f local_306 = local_135;
        FVector3f local_309 = FVector3f(FVector3f::ZeroVector);
        FVector3f local_312 = FVector3f(FVector3f::ZeroVector);
        SortResultByDistanceAndFilter(Context, local_198, false, true, false);
        int local_313 = 0;
        float32 local_314 = 1.0f;
        int local_315 = 4;
        for (; local_315 > 0; )
        {
            if (local_198.Num() > 0)
            {
                local_318 = FMath::Max(0.0f, local_198[0].Distance - (local_314 * 2.0f));
            }
            else
            {
                local_318 = local_303;
            }
            local_314 = local_314 * 0.5f;
            local_222 += FVector((local_306 * local_318));
            local_303 = local_303 - local_318;
            if (!(local_303 > 0.1f && (local_315 > 1)))
            {
                break;
            }
            local_295 = true;
            float32 local_316 = GetSlideRatio(Context, local_198, false);
            float32 local_322 = GetSlideNerf(Context, local_198, false);
            float32 local_324 = local_303;
            FVector3f local_321 = (local_306 * local_303);
            FVector3f local_330;
            if (IsDynamicHitResult(local_198[0]))
            {
                Context.AddEnablePenetrateEntity(FECSEntityId(int(local_198[0].ECSEntityId)));
                if (local_313 < 1)
                {
                    ++local_313;
                    ++local_315;
                }
                local_309 = GetHitResultNormal(local_198);
                local_330 = local_321.VectorPlaneProject(local_309);
                ApplySlideTweaks(local_330, local_316, local_322, FMath::Max(local_330.Size(), local_321.Size2D()));
                float32 local_116 = local_321.Z;
            }
            else
            {
                FVector3f local_337 = local_309;
                local_309 = GetHitResultNormal(local_198);
                if (local_318 == 0.0f && ((FVector3f(local_309.X, local_309.Y, 0.0f).DotProduct(local_337) < 0.0f)))
                {
                    local_309 = local_309.VectorPlaneProject(local_337).GetSafeNormal(1e-8f, FVector3f::ZeroVector);
                }
                local_330 = local_321.VectorPlaneProject(local_309);
                ApplySlideTweaks(local_330, local_316, local_322, local_303);
            }
            local_303 = local_330.Size();
            FVector3f local_191 = GetExtraSlideDirForNoStand(Context, local_198[0]);
            if (!(local_191.IsZero()))
            {
                float32 local_338 = local_324 - local_303;
                FVector3f local_337_2 = (local_191 * local_338);
                local_312 += local_337_2;
                local_330 += local_337_2;
                local_303 = local_330.Size();
            }
            if (local_303 < 1e-8f)
            {
                break;
            }
            local_306 = (local_330 / local_303);
            MoveSweepTest(local_198, Context, local_222, (local_222 + EnsureSize(FVector(local_330), 2.0f)), local_96, false, FKMCSweepTestSpecificParams());
            FilterEnablePenetrateHits(Context, local_198, true);
            SortResultByDistanceAndFilter(Context, local_198, false, true, false);
            --local_315;
        }
        local_178 = local_222;
        if (local_295)
        {
            FVector3f local_341 = FVector3f((local_178 - local_302));
            if (!(local_312.IsZero()))
            {
                float32 local_338_2 = local_312.DotProduct(local_341);
                if (local_338_2 > 0.0f)
                {
                    local_318 = local_338_2 / local_341.SizeSquared();
                    FVector3f local_327 = (local_341 * local_318);
                    local_341 -= local_327;
                }
            }
            local_119 = (local_341 / DeltaTime);
        }
    }
    if (Context.Param.bHardSnapToFloor)
    {
        float32 local_116_2 = FMath::Min(local_119.Z, 0.0f);
    }
    FKMCFloorInfo local_402 = FKinematicMoveCollisionUtils::FindFloor(Context, local_178, local_96, 0.0f);
    local_76.FloorInfo = local_402;
    FVector3f local_405;
    if (local_402.GetbHasFloor() || local_402.GetbHitNonStandingSurface())
    {
        local_405 = FKinematicMoveCollisionUtils::ClampFloorNormalBySlope(FVector3f(local_402.GetFloorImpactNormal()), Context.Param.SlopDegreeMax);
    }
    else
    {
        local_405 = FVector3f::UpVector;
    }
    local_76.SetOutFloorNormalSmoothed(local_405);
    local_76.SetOutFloorNormalSmoothVelocity(FVector3f::ZeroVector);
    FKinematicMoveCollisionUtils::AdjustMovementForBorder(Context, local_82, local_178);
    if (!(local_178.Equals(local_88, 9.999999747378752e-5)))
    {
        local_76.ConstrainPos(Context.State.ConvertPositionBackToTransform(local_178));
        local_76.ConstrainRot(Context.State.GetCollisionRotation());
    }
    local_405 = FVector3f(Velocity);
    if (!(local_119.Equals(local_405, 0.0001f)))
    {
        local_76.ConstrainVel(FVector(local_119));
    }
    return local_76;
}
FKMCResult ConstrainCharacterAnimFakeAirFloatingMove(const FKMCContext &inout Context, const FVector &inout Velocity, const FVector &inout DeltaMove, const float32 DeltaTime)
{
    int local_2 = 0;
    float local_112;
    if (!(local_2))
    {
        return ConstrainCharacterAirborneMove(Context, Velocity, DeltaMove, DeltaTime);
    }
    float32 local_86 = local_2.GetLastRootMotionDeltaZ();
    float32 local_85 = local_2.GetTotalRootMotionDeltaZ();
    float32 local_87 = local_2.GetTotalAppliedRiseUp() + local_2.GetInitialHeightAboveGround();
    float32 local_90 = 1.0f;
    float32 local_88 = local_85 - local_86;
    if (local_88 > 0.0f)
    {
        local_90 = local_87 / local_88;
        if (local_86 > 0.0f && (local_90 > local_2.GetMaxUpwardWarpScale()))
        {
            local_90 = local_2.GetMaxUpwardWarpScale();
        }
    }
    FVector local_98(Context.State.GetCollisionPosition());
    float32 local_91 = local_86 * local_90;
    if (local_91 > 0.0f)
    {
        TArray<FHitResult> local_110;
        local_112 = local_91;
        FVector local_122 = (local_98 + FVector(0.0, 0.0, local_112));
        MoveSweepTest(local_110, Context, local_98, local_122, FQuat::Identity, true, FKMCSweepTestSpecificParams());
        for (auto& local_144 : local_110)
        {
            if (!(IsDynamicHitResult(local_144)))
            {
                local_91 = FMath::Max(0.0f, (local_144.Distance - 1.0f));
                break;
            }
        }
    }
    float32 local_89_2 = FKinematicMoveCollisionUtils::GetShapeRadiusAsCapsule(Context.GetActualShape());
    float local_116 = Context.GetActualShape().GetExtent().Z;
    float32 local_146 = float32(local_116);
    local_112 = (local_98.Z + local_91) + local_146;
    float local_150_2 = (local_98.Z - local_146) - local_87;
    float local_116_3 = local_150_2 + (local_146 * 2.0f);
    local_112 = FMath::Max(local_112, local_116_3);
    float local_154_2 = local_112 - local_98.Z;
    local_91 = float32((local_154_2 - local_146));
    float local_154_3 = local_98.Z + local_91;
    float local_114_4 = (local_112 + local_150_2) * 0.5;
    float local_152_5 = (local_112 - local_150_2) * 0.5;
    FQuat local_172 = Context.State.GetCollisionRotation();
    float32 local_145 = float32(local_152_5);
    FVector local_104 = FVector(local_98.X, local_98.Y, local_114_4);
    FName local_163;
    if (GetEnableDebug())
    {
        local_163 = NAME_None;
    }
    else
    {
        local_163 = n"FakeAirFloating";
    }
    FECSDebugDraw::DrawDebugCapsule(local_163);
    FVector local_122_2 = FVector(local_98.X, local_98.Y, local_150_2);
    if (GetEnableDebug())
    {
        local_163 = NAME_None;
    }
    else
    {
        local_163 = n"FakeAirFloating";
    }
    FECSDebugDraw::DrawDebugPoint(local_163);
    FKMCContext local_320 = Context;
    local_320.GetActualShape().SetCapsule(local_89_2, float32(local_152_5));
    float local_116_5 = Context.State.GetPosHeightOffset();
    float local_158_2 = local_114_4 - local_116_5;
    local_320.State.SetRawPosition(FVector(local_98.X, local_98.Y, local_158_2));
    local_320.State.SetFloorNormalSmoothed(local_320.Env.FloorInfo.GetFloorNormalDefaulted(FVector3f::UpVector));
    FVector local_122_3 = FVector(DeltaMove.X, DeltaMove.Y, 0.0);
    FKMCResult local_84 = ConstrainCharacterGroundMove(local_320, Velocity, local_122_3, DeltaTime);
    FVector local_420;
    if (local_84.bPosConstrained)
    {
        local_420 = local_84.GetFinalPosition();
    }
    else
    {
        local_420 = (FVector(local_320.State.GetRawPosition()) + local_122_3);
    }
    local_84.ConstrainPos(local_420.AddZ(local_154_3 - local_114_4));
    float local_116_6 = local_154_3 - local_146;
    float local_158_4 = local_116_6 - local_150_2;
    float local_116_7 = local_84.FloorInfo.GetFloorDistance() + local_158_4;
    local_84.FloorInfo.SetFloorDistance(float32(local_116_7));
    local_84.FloorInfo.SetDetectPosition((FVector(local_84.FloorInfo.GetDetectPosition()) + FVector(0.0, 0.0, local_158_4)));
    local_84.SetOutAppliedFakeAirRiseUp(local_91);
    return local_84;
}
FVector EnsureSize(const FVector &inout Vector, const float32 Value)
{
    float local_2 = Vector.SizeSquared();
    if ((local_2 < (Value * Value) && !(FMath::IsNearlyZero(local_2, 9.99999993922529e-9))))
    {
        FVector local_20 = (Vector * Value);
        return (local_20 / FMath::Sqrt(local_2));
    }
    return Vector;
}
FKMCResult ConstrainCharacterWallRunMove(const FKMCContext &inout Context, const FVector &inout Velocity, const FVector &inout DeltaMove, const float32 DeltaTime)
{
    return ConstrainCharacterAirborneMove(Context, Velocity, DeltaMove, DeltaTime);
}
FKMCResult ConstrainCharacterFlyMove(const FKMCContext &inout Context, const FVector &inout Velocity, const FVector &inout DeltaMove, const float32 DeltaTime)
{
    FVector local_186;
    if (Context.Param.FloatingHeight >= 0.0f)
    {
        float32 local_7;
        float32 local_1_2 = Context.Param.FloatingAdjustSpeed;
        float32 local_2 = local_1_2 * DeltaTime;
        float32 local_1_3 = Context.Param.FloatingHeight;
        float32 local_1_5 = GetFloatingFloorDist(Context, ((local_1_3 + local_2) + Context.State.GetStepUpHeight()));
        local_7 = 0.0f;
        if ((Context.Param.FloatingHeightMin > 0.0f && (Context.Param.FloatingHeightMin < Context.Param.FloatingHeight)))
        {
            if (local_1_5 > Context.Param.FloatingHeight)
            {
                local_7 = FMath::Clamp((Context.Param.FloatingHeight - local_1_5), -local_2, local_2);
            }
            else
            {
                if (local_1_5 < Context.Param.FloatingHeightMin)
                {
                    local_7 = FMath::Clamp(Context.Param.FloatingHeightMin - local_1_5, -local_2, local_2);
                }
            }
        }
        else
        {
            float32 local_5_3 = -local_2;
            local_7 = FMath::Clamp(Context.Param.FloatingHeight - local_1_5, local_5_3, local_2);
        }
        FVector local_22 = FVector(DeltaMove.X, DeltaMove.Y, local_7);
        FKMCResult local_180 = ConstrainCharacterAirborneMove(Context, Velocity, local_22, DeltaTime);
        if (!(local_180.bPosConstrained))
        {
            local_180.ConstrainPos((FVector(Context.State.GetRawPosition()) + local_22));
            local_180.ConstrainRot(Context.State.GetRawRotation());
        }
        if (local_180.bVelConstrained)
        {
            local_186 = local_180.GetFinalVelocity();
        }
        else
        {
            local_186 = Velocity;
        }
        if (local_186.Z != 0.0)
        {
            local_186.Z = 0.0;
            local_180.ConstrainVel(local_186);
        }
        return local_180;
    }
    else
    {
        return ConstrainCharacterAirborneMove(Context, Velocity, DeltaMove, DeltaTime);
    }
}
bool NeedDebugDrawMoveHit()
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        return CVar_DebugDrawMoveHitOnServer.GetBool();
    }
    else
    {
        return (CVar_DebugDrawMoveHitOnClient.GetBool() || FECSDebugDraw::IsDebugKeyEnabled(n"MoveHit")) && (int(ECS::GetECSWorld().GetFixedTime().bLatestFrame) != 0);
    }
}
namespace FKinematicMoveCollisionUtils
{
bool HasActiveSteadfastMovement(const FECSEntity &inout Entity, const FC_CharacterMovement &inout CharacterMovement)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        return true;
    }
    for (auto& local_20 : CharacterMovement.GetAttachIgnoreCollisionEntities())
    {
        if (!(local_20.IsValid()))
        {
            local_5 = false;
        }
        else
        {
            local_5 = local_4.opCall();
        }
        if (local_5)
        {
            return true;
        }
    }
    return false;
}
FVector3f AdaptFloorNormal(const FVector3f &inout Vector, const FVector3f &inout FloorNormal)
{
    FVector3f local_6 = FVector3f(Vector.X, Vector.Y, 0.0f);
    if (local_6.IsZero())
    {
        return FVector3f::ZeroVector;
    }
    else
    {
        if (FKinematicMoveCollisionUtils::GetSlopeAngle(FloorNormal) >= CVar_AdaptFloorNormalAngleThreshold.GetFloat())
        {
            FVector3f local_3 = FVector3f::UpVector.CrossProduct(local_6);
            return (local_3.CrossProduct(FloorNormal).GetSafeNormal(1e-8f, FVector3f::ZeroVector) * local_6.Size());
        }
        else
        {
            FQuat4f local_28 = FQuat4f::FindBetweenNormals(FVector3f::UpVector, FloorNormal);
            return local_28.RotateVector(local_6);
        }
    }
}
FKMCFloorInfo FindFloor(const FKMCContext &inout Context, const FVector &inout Position, const FQuat &inout Rotation, const float32 FloatingHeight = 0.f)
{
    float32 local_27;
    FKMCFloorInfo local_26;
    local_27 = Context.State.GetStepUpHeight();
    float32 local_28_2 = ((local_27 + Context.Param.MaxHoverHeight) + FloatingHeight) + 2.5f;
    if (Context.Param.bHardSnapToFloor)
    {
        local_28_2 = local_28_2 + 200.0f;
    }
    FVector3f local_43 = FVector3f(Context.GetActualShape().GetExtent());
    float local_46 = Position.Z;
    float32 local_30 = local_43.Z;
    local_46 = local_46 - local_30;
    float local_48_2 = local_46 - local_27;
    local_26.SetDetectPosition(FVector(Position.X, Position.Y, local_48_2));
    GetDefaulted local_60;
    FVector3f local_34 = FVector3f(local_60.opCall().GetVelocity());
    FVector local_66 = Position;
    FVector local_40 = FVector(Position.X, Position.Y, ((Position.Z - local_43.Z) - local_28_2));
    FVector local_72 = FVector(Position.X, Position.Y, Position.Z - local_28_2);
    TArray<FHitResult> local_90;
    if (!(FindFloorShapeTest(local_90, Context, Position, local_72, Rotation, local_34, true)))
    {
        local_26.SetSweepDistance(local_28_2);
        local_26.SetNoFloor();
        return local_26;
    }
    SortResultByDistanceAndFilter(Context, local_90, true, false, false);
    if (local_90.Num() > 0)
    {
        local_30 = local_90[0].Distance;
    }
    else
    {
        local_30 = local_28_2;
    }
    local_26.SetSweepDistance(local_30);
    FilterFloorIgnoreResults(Context, local_90);
    bool local_31 = (local_90.Num() > 0);
    FHitResult local_162;
    bool local_96 = FindFloorCenterTest(local_162, Context, local_66, local_40, local_34, true);
    if (local_31)
    {
        FillFloorInfoBySweepHits(local_26, local_90);
        if (TestValidFloorSlopeAndEtc(local_26.GetFloorNormal(), Context.Param))
        {
            local_26.SetValidFloor();
        }
        else
        {
            local_26.SetNonStandingSurface();
        }
        bool local_163 = !(local_96);
        if (local_163 && local_26.GetFloorNormal().Equals(FVector3f::UpVector, 0.0001f))
        {
            local_96 = true;
            local_162 = local_90[0];
            local_162.TraceStart = local_66;
            local_162.TraceEnd = local_40;
            local_162.ImpactPoint = Position.NewZ(local_162.ImpactPoint.Z);
            local_162.Location = local_162.ImpactPoint;
            local_162.ImpactNormal = FVector(local_26.GetFloorNormal());
            local_162.Normal = local_162.ImpactNormal;
            float32 local_30_2 = float32((FMath::Max(local_66.Z - local_162.ImpactPoint.Z, 0.0)));
            float32 local_29_2 = local_43.Z;
            float32 local_30_3 = local_29_2 + local_28_2;
            float32 local_29_3 = local_162.Distance / local_30_3;
        }
    }
    if (local_96)
    {
        if (local_31)
        {
            bool local_166;
            float32 local_165;
            local_165 = Context.Param.MaxHoverHeight;
            local_166 = false;
            float32 local_164_2 = float32((local_48_2 - local_162.Location.Z)) - 1.0f;
            float32 local_167 = local_164_2 - local_26.GetFloorDistance();
            bool local_163_2 = TestValidFloorSlopeAndEtc(FVector3f(local_162.Normal), Context.Param);
            if (local_163_2)
            {
                if (local_26.GetbHasFloor() && (local_167 > local_165))
                {
                    local_26.SetNonStandingSurface();
                    local_26.SetbEdge(true);
                }
                else
                {
                    FillFloorInfoByCenterHit(local_26, local_162);
                    local_26.SetValidFloor();
                    if (local_167 > (local_165 - local_27))
                    {
                        local_26.SetbEdge(true);
                    }
                }
                local_166 = true;
            }
            bool local_93 = !(local_166) || local_26.GetbEdge();
            bool local_91 = local_93 && (CVar_DebugDitchProtectLevel.GetInt() > 0);
            int local_95 = CVar_DebugDitchProtectLevel.GetInt() & 1;
            if (local_95 == 0)
            {
                local_91 = local_91 && local_26.GetbHasFloor();
            }
            if ((CVar_DebugDitchProtectLevel.GetInt() & 2) == 0)
            {
                bool local_169 = local_91 && !(local_166);
                local_91 = local_169 && (FMath::Abs(local_167) < local_165);
            }
            if (local_91)
            {
                FDitchProtectResult local_320 = TestDitchProtect(Context, local_90[0], Position, local_34);
                if (local_320.bHasFloorBeyond)
                {
                    if (local_320.FloorZ > local_162.ImpactPoint.Z)
                    {
                        local_162.ImpactPoint = local_162.ImpactPoint.NewZ(local_320.FloorZ);
                        local_162.Location = local_162.ImpactPoint;
                    }
                    local_162.ImpactNormal = FVector(local_320.CorrectedNormal);
                    local_162.Normal = local_162.ImpactNormal;
                    FillFloorInfoByCenterHit(local_26, local_162);
                    if (local_26.GetFloorSlope() <= Context.Param.SlopDegreeMax)
                    {
                        local_26.SetValidFloor();
                        local_166 = true;
                    }
                }
            }
            if (!(local_166))
            {
                FillFloorInfoByCenterHit(local_26, local_162);
                local_26.SetNonStandingSurface();
            }
        }
        else
        {
            FillFloorInfoByCenterHit(local_26, local_162);
            bool local_163_3 = TestValidFloorSlopeAndEtc(FVector3f(local_26.GetFloorNormal()), Context.Param);
            if (local_163_3)
            {
                local_26.SetValidFloor();
            }
            else
            {
                local_26.SetNonStandingSurface();
            }
        }
    }
    else
    {
        if (local_31 && ((CVar_DebugDitchProtectLevel.GetInt() & 2) != 0))
        {
            FDitchProtectResult local_246 = TestDitchProtect(Context, local_90[0], Position, local_34);
            if (local_246.bHasFloorBeyond)
            {
                local_162.ImpactPoint = Position.NewZ(local_246.FloorZ);
                local_162.Location = local_162.ImpactPoint;
                local_162.ImpactNormal = FVector(local_246.CorrectedNormal);
                local_162.Normal = local_162.ImpactNormal;
                FillFloorInfoByCenterHit(local_26, local_162);
                float32 local_29_4 = Context.Param.SlopDegreeMax;
                if (local_26.GetFloorSlope() <= local_29_4)
                {
                    local_26.SetValidFloor();
                    return local_26;
                }
            }
        }
        local_26.SetDebugDirectSlope(local_26.GetFloorSlope());
        local_26.SetbEdge(true);
        if (local_31)
        {
            local_26.SetNonStandingSurface();
        }
        else
        {
            local_26.SetNoFloor();
        }
    }
    return local_26;
}
FVector3f ClampFloorNormalBySlope(const FVector3f &inout FloorNormal, const float32 MaxSlopeDegree)
{
    float32 local_3 = FMath::Cos(FMath::DegreesToRadians(MaxSlopeDegree));
    if (FloorNormal.Z < local_3)
    {
        return FVector3f(FloorNormal.X, FloorNormal.Y, local_3).GetUnsafeNormal();
    }
    return FloorNormal;
}
void AdjustMovementForBorder(const FKMCContext &inout Context, const FVector &inout InOriginPos, FVector &inout OutTargetPos)
{
    float32 local_29;
    if (InOriginPos.Equals(OutTargetPos, 9.999999747378752e-5))
    {
        return;
    }
    FVector local_10 = OutTargetPos;
    FVector local_28 = (local_10 - InOriginPos).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    local_29 = Context.GetActualShape().GetCapsuleRadius();
    FVector local_16 = (local_10 + (local_28 * local_29));
    FKLBorderQueryInfo local_68;
    TArray<FECSEntity> local_72;
    FECSEntity local_76;
    if (FBorderUtils::CheckMoveAgainstAnyBorder(Context.Entity, InOriginPos, local_16, local_68, local_76, local_72))
    {
        OutTargetPos = (InOriginPos + (local_28 * (FMath::Max(0.0f, (local_68.OutDistanceToBorder - local_29)))));
        OutTargetPos.Z = local_10.Z;
    }
    if (local_72.Num() == 0)
    {
        return;
    }
    FVector local_86;
    FVector local_92;
    bool local_93 = false;
    bool local_94 = false;
    int local_95 = 0;
    for (; local_95 < local_72.Num(); ++local_95)
    {
        FECSEntity local_100 = local_72[local_95];
        FKLBorderQueryInfo local_126;
        FBorderUtils::QueryLocationForBorder(local_100, OutTargetPos, local_29, local_126);
        if (local_76.IsValid())
        {
            if (!(local_126.OutIsInside) && (local_126.OutDistanceToBorder <= local_29) && !((local_100 == local_76)))
            {
                local_94 = true;
                break;
            }
        }
        local_86 = local_126.OutClosestBorderPoint;
        if (!(local_93))
        {
            local_92 = local_86;
            local_93 = true;
            continue;
        }
        if (OutTargetPos.DistSquared2D(local_86) < OutTargetPos.DistSquared2D(local_92))
        {
            local_92 = local_86;
        }
    }
    if (local_94)
    {
        OutTargetPos = InOriginPos;
        OutTargetPos.Z = local_10.Z;
        return;
    }
    if (float32(OutTargetPos.Dist2D(local_92)) < local_29)
    {
        local_92.Z = OutTargetPos.Z;
        OutTargetPos = (local_92 + ((OutTargetPos - local_92).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * local_29));
        OutTargetPos.Z = local_10.Z;
    }
    return;
}
FVector3f GetSmoothedGroundNormal(FKMCResult &inout Result, const FKMCContext &inout Context, const FKMCFloorInfo &inout NewFloorInfo, const FVector &inout DeltaMove, const float32 DeltaTime)
{
    if (NewFloorInfo.GetbHasFloor() || NewFloorInfo.GetbHitNonStandingSurface())
    {
        float32 local_6;
        FVector3f local_5 = Context.State.GetFloorNormalSmoothVelocity();
        local_6 = Context.Param.FloorNormalSmoothTime;
        if (Context.Param.bHardSnapToFloor)
        {
            local_6 = Context.Param.FloorNormalSmoothTimeHard;
        }
        else
        {
            if (!(FKinematicMoveCollisionUtils::CheckFloorNormalChangeStable(Context, NewFloorInfo, DeltaMove, Context.Param.FloorNormalSmoothRefDist)))
            {
                local_6 = Context.Param.FloorNormalSmoothTimeSoft;
            }
        }
        Result.SetOutFloorNormalSmoothed(FKinematicMoveCollisionUtils::ClampFloorNormalBySlope(FMathUtils::SmoothDamp(Context.State.GetFloorNormalSmoothed(), NewFloorInfo.GetFloorImpactNormal(), local_5, local_6, DeltaTime, 1e20f).GetSafeNormal(1e-8f, FVector3f::ZeroVector), int(Context.Param.SlopDegreeMax)));
        Result.SetOutFloorNormalSmoothVelocity(local_5);
    }
    else
    {
        Result.SetOutFloorNormalSmoothed(Context.State.GetFloorNormalSmoothed());
        Result.SetOutFloorNormalSmoothVelocity(FVector3f::ZeroVector);
    }
    return Result.GetOutFloorNormalSmoothed();
}
bool CheckFloorNormalChangeStable(const FKMCContext &inout Context, const FKMCFloorInfo &inout NewFloorInfo, const FVector &inout DeltaMove, const float32 RefDist)
{
    if (!(NewFloorInfo.GetbHasFloor()))
    {
        return false;
    }
    else
    {
        FVector3f local_15 = FVector3f(DeltaMove.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector));
        FVector3f local_4 = FKinematicMoveCollisionUtils::AdaptFloorNormal(local_15, NewFloorInfo.GetFloorImpactNormal());
        FVector3f local_18 = FKinematicMoveCollisionUtils::AdaptFloorNormal(local_15, Context.State.GetFloorNormalSmoothed());
        if (FMath::Abs((local_4.Z - local_18.Z)) < 0.1f)
        {
            return true;
        }
        else
        {
            bool local_1 = (local_4.Z > local_18.Z);
            GetDefaulted local_32;
            FVector3f local_21 = FVector3f(local_32.opCall().GetVelocity());
            FHitResult local_98;
            FVector local_114 = NewFloorInfo.GetFloorPoint();
            FVector local_12 = FVector(0.0, 0.0, 10.0);
            FVector local_120 = (local_114 + local_12);
            FVector3f local_28 = (local_4 * RefDist);
            FVector local_12_2 = (local_120 + FVector(local_28));
            bool local_128 = FindFloorCenterTest(local_98, Context, local_120, local_12_2, local_21, true);
            if (local_1)
            {
                if (local_128)
                {
                    return true;
                }
                else
                {
                    local_120 = local_12_2;
                    FVector local_12_3 = (local_120 + FVector(0.0, 0.0, -15.0));
                    return FindFloorCenterTest(local_98, Context, local_120, local_12_3, local_21, true);
                }
            }
            else
            {
                return !(local_128);
            }
        }
    }
}
FVector3f GetSnapToFloorMove(const FKMCContext &inout Context, const FKMCFloorInfo &inout FloorInfo, const FVector &inout CollisionPosition, float32 &inout SmoothVelocity, const float32 DeltaTime, const bool bAirborne = false)
{
    float32 local_5;
    if (!(FloorInfo.GetbValid() && (FloorInfo.GetbHasFloor() || FloorInfo.GetbHitNonStandingSurface())))
    {
        SmoothVelocity = 0.0f;
        return FVector3f::ZeroVector;
    }
    local_5 = float32((FloorInfo.GetOnFloorPositionZ(Context.GetActualShape().GetExtent().Z, Context.State.GetStepUpHeight()) - CollisionPosition.Z));
    if (bAirborne)
    {
        local_5 = FMath::Max(local_5, 0.0f);
    }
    float32 local_20 = Context.Param.SnapToFloorSmoothTime;
    if (Context.Param.bHardSnapToFloor)
    {
        local_20 = Context.Param.SnapToFloorSmoothTimeHard;
    }
    else
    {
        if (FMath::Abs(local_5) < Context.Param.SnapToFloorOffsetRefHeight)
        {
            local_20 = Context.Param.SnapToFloorSmoothTimeSoft;
        }
    }
    float32 local_21 = 0.0f;
    if (!(FMath::IsNearlyZero(local_5, 0.1f)))
    {
        local_21 = FMathUtils::SmoothDamp(0.0f, local_5, SmoothVelocity, local_20, DeltaTime, 1e20f);
    }
    else
    {
        local_21 = local_5;
        SmoothVelocity = 0.0f;
    }
    if ((FloorInfo.GetbHasFloor() && FloorInfo.GetbEdge() && (local_5 < 0.0f)))
    {
        local_21 = local_5;
    }
    return FVector3f(0.0f, 0.0f, local_21);
}
FKMCResult ConstrainCharacterMove(FKMCContext &inout Context, const FVector &inout Velocity, const FVector &inout DeltaMove, const float32 DeltaTime)
{
    FKinematicMoveCollisionDebugUtils::SetContextEntity(Context.Entity.GetId());
    FKMCResult local_80;
    FVector3f local_84 = FVector3f(DeltaMove);
    Context.Env.FloorInfo.GetbValid();
    switch (int(Context.Param.MovementCollisionType))
    {
    case 1:
    {
        local_80 = ConstrainCharacterAirborneMove(Context, Velocity, DeltaMove, DeltaTime);
        break;
    }
    case 3:
    {
        local_80 = ConstrainCharacterFlyMove(Context, Velocity, DeltaMove, DeltaTime);
        break;
    }
    case 2:
    {
        local_80 = ConstrainCharacterWallRunMove(Context, Velocity, DeltaMove, DeltaTime);
        break;
    }
    case 0:
    {
        local_80 = ConstrainCharacterGroundMove(Context, Velocity, DeltaMove, DeltaTime);
        break;
    }
    case 4:
    {
        local_80 = ConstrainCharacterAnimFakeAirFloatingMove(Context, Velocity, DeltaMove, DeltaTime);
        break;
    }
    }
    FKinematicMoveCollisionDebugUtils::SetContextEntity(ENTITY_ID_NULL);
    return local_80;
}
}
