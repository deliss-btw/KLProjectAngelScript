const FConsoleVariable CVar_UseAngelScript = FConsoleVariable();
const FConsoleVariable CVar_DebugDisableCollision = FConsoleVariable();
const FConsoleVariable CVar_SmoothDepenetrateDecay = FConsoleVariable();
const FConsoleVariable CVar_LandPredictDistRatio = FConsoleVariable();
const FConsoleVariable CVar_LandHardSnapDistRatio = FConsoleVariable();
const FConsoleVariable CVar_ExtendCapsuleHeightInAir = FConsoleVariable();
const FConsoleVariable CVar_ConstrainCharacterMoveCacheEnable = FConsoleVariable();
const FConsoleVariable CVar_ConstrainCharacterMoveCacheVerify = FConsoleVariable();

class US_CharacterMovementNewCollisionSystem : UECSScriptSystem
{
    float32 DefaultSlideModifyRatio = 0.0f;
    float32 DefaultNerfSlideAngle = 0.0f;

    UFUNCTION()
    void Init_Implementation()
    {
        US_CharacterMovementCollisionSystem local_6 = Cast<US_CharacterMovementCollisionSystem>(AECSGameManagerActor::GetSystem(ECS::GetUEWorld(), US_CharacterMovementCollisionSystem));
        if (local_6 != nullptr)
        {
            this.DefaultSlideModifyRatio = local_6.DefaultSlideModifyRatio;
            this.DefaultNerfSlideAngle = local_6.DefaultNerfSlideAngle;
        }
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return !(CVar_UseAngelScript.GetBool());
    }
    void CollisionInternal_New(const FECSEntity &inout Entity, FC_Rigidbody &inout Rigidbody, FC_CharacterMovement &inout CharacterMovement, FC_CharacterMovementNew &inout CharacterMovementNew, const FC_CharacterMovementConfig &inout CharacterMovementConfig, const FC_CharacterMovementParam &inout CharacterMovementParam, const FC_CharacterMovementControl &inout CharacterMovementControl, const FC_Collision &inout Collision, const FCS_FixedTime &inout FixedTime) const
    {
        FVector3f local_5963;
        int local_5990 = 0;
        int local_5991;
        if (int(Collision.GetShapeType()) == 0)
        {
            XError(ELog(11), FString().Append(Entity).Append(" has invalid Collision config with ShapeType=None"));
            return;
        }
        FFPTime local_12 = FixedTime.Time;
        FCollisionShape local_20 = Collision.GetScaledShape();
        FVector local_26 = CharacterMovement.GetPosition();
        FQuat local_36 = CharacterMovement.GetRotation();
        FVector3f local_42 = FVector3f(Rigidbody.GetVelocity());
        FKMCFloorInfo& local_44 = CharacterMovementNew.GetFloorInfo_New();
        FKMCContext local_192;
        local_192.Entity = Entity;
        local_192.UEWorld = ECS::GetUEWorld();
        local_192.Env.FloorInfo = local_44;
        local_192.Env.FloorInfo.SetbValid(CharacterMovement.GetFloorInfo().bValid);
        if (!(local_192.Env.FloorInfo.GetbValid()) || (CharacterMovementNew.GetStepUpHeight() < 0.0f))
        {
            CharacterMovementNew.SetStepUpHeight(CharacterMovementParam.StepHeight);
        }
        int local_199 = 0;
        int local_198 = local_199;
        if (CharacterMovement.GetbAnimFakeAirFloating())
        {
            int local_199_2 = 4;
            local_198 = local_199_2;
        }
        else
        {
            if (CharacterMovement.GetbWallRunning())
            {
                int local_199_3 = 2;
                local_198 = local_199_3;
            }
            else
            {
                if (CharacterMovementControl.GetbFlyingMovement())
                {
                    int local_199_4 = 3;
                    local_198 = local_199_4;
                }
                else
                {
                    if (CharacterMovement.GetbAirborne())
                    {
                        int local_199_5 = 1;
                        local_198 = local_199_5;
                    }
                }
            }
        }
        CharacterMovementNew.SetMoveCollisionType(ECharacterMovementCollisionType(local_198));
        float32 local_196 = CharacterMovementNew.GetStepUpHeight() * CharacterMovementControl.GetStepHeightScale();
        local_192.SetTransformAndShape(ECharacterMovementCollisionType(local_198), CharacterMovement.GetPosition(), CharacterMovement.GetRotation(), local_20, local_196);
        if (local_192.Env.FloorInfo.GetbValid())
        {
            this.ValidateFloorInfo(local_192.Env.FloorInfo, local_192.State.GetCollisionPosition(), local_192.GetActualShape(), local_196);
            if (!(local_192.Env.FloorInfo.GetbValid()))
            {
                float32 local_200 = CharacterMovementNew.GetStepUpHeight();
                if (local_200 != CharacterMovementParam.StepHeight)
                {
                    CharacterMovementNew.SetStepUpHeight(CharacterMovementParam.StepHeight);
                    local_200 = CharacterMovementNew.GetStepUpHeight();
                    local_192.SetTransformAndShape(ECharacterMovementCollisionType(local_198), CharacterMovement.GetPosition(), CharacterMovement.GetRotation(), local_20, local_200 * CharacterMovementControl.GetStepHeightScale());
                }
            }
        }
        local_192.Env.MoveSweepCachePtr = FSceneQueryCache(CharacterMovementNew.GetMoveSweepCache());
        local_192.Env.FindFloorCachePtr = FSceneQueryCache(CharacterMovementNew.GetFindFloorCache());
        local_192.State.SetSnapToFloorVelocity(CharacterMovementNew.GetSnapToFloorVelocity());
        local_192.State.SetFloorNormalSmoothed(CharacterMovementNew.GetFloorNormalSmoothed());
        local_192.State.SetFloorNormalSmoothVelocity(CharacterMovementNew.GetFloorNormalSmoothVelocity());
        Has local_5956;
        local_192.State.bControlledByPlayer = local_5956.opCall();
        local_192.Param.bIsBigPawn = CharacterMovementConfig.bIsBigPawn;
        bool local_197 = !(CharacterMovement.GetbAirborne());
        bool local_4_2 = !(false);
        local_197 = (local_197 == local_4_2);
        local_192.Param.bSnapOnFloor = local_197;
        local_192.Param.bPreventEdgeFalling = CharacterMovement.GetMutePreventEdgeFalling() <= 0 && (CharacterMovement.GetPreventEdgeFalling() > 0);
        float32 local_195_3 = CharacterMovementParam.WalkableSlopDegree;
        float32 local_200_2 = CharacterMovementControl.GetWalkableSlopDegreeScale();
        local_195_3 = local_195_3 * local_200_2;
        local_192.Param.SlopDegreeMax = local_195_3;
        local_200_2 = CharacterMovementParam.MaxHoverHeight;
        local_192.Param.MaxHoverHeight = local_200_2;
        local_192.Param.DitchProtectRadius = CharacterMovementParam.DitchProtectRadius;
        local_200_2 = CharacterMovementParam.EdgeProtectRadius;
        local_192.Param.EdgeProtectRadius = local_200_2;
        local_192.Param.bImmovableByPlayer = CharacterMovementParam.bImmovableByPlayer;
        local_192.Param.bHardSnapToFloor = (CharacterMovementNew.GetHardSnapToFloorCount() > 0);
        local_192.Param.bEnableOnGroundPenetratingSlide = (CharacterMovementNew.GetEnableOnGroundPenetratingSlideCount() > 0);
        local_192.Param.bRestrictInNavmesh = (CharacterMovementNew.GetRestrictInNavmeshCount() > 0);
        local_192.Param.bAllowAirborne = (CharacterMovementControl.GetAllowAirborne() > 0);
        if (CharacterMovementControl.GetbFlyingMovement() && CharacterMovementControl.GetbFlyFloating())
        {
            local_200_2 = CharacterMovementControl.GetFloatingHeight();
            local_192.Param.FloatingHeight = local_200_2;
            local_192.Param.FloatingHeightMin = CharacterMovementControl.GetFloatingHeightMin();
            local_200_2 = CharacterMovementControl.GetFloatingAdjustSpeed();
            local_192.Param.FloatingAdjustSpeed = local_200_2;
        }
        if (!(Collision.GetMoveCollisionOptions().IsActive()) || (CharacterMovement.GetPassThroughCharacter() > 0) || ::FKinematicMoveCollisionUtils::HasActiveSteadfastMovement(Entity, CharacterMovement))
        {
            local_192.Param.bIgnorePawn = true;
        }
        local_192.Param.SlideRatioForDynamic = FKinematicMoveCollisionUtils::GetSlideRatioFromConfigRatio(this.DefaultSlideModifyRatio);
        local_192.Param.SlideRatioForStatic = local_192.Param.SlideRatioForDynamic;
        local_200_2 = FKinematicMoveCollisionUtils::GetSlideNerfFromConfigAngle(this.DefaultNerfSlideAngle);
        local_192.Param.SlideNerfForDynamic = local_200_2;
        local_192.Param.SlideNerfForStatic = local_192.Param.SlideNerfForDynamic;
        local_200_2 = CharacterMovementNew.GetSlideParamForStatic().GetSlideRatio();
        if (local_200_2 >= 0.0f)
        {
            local_192.Param.SlideRatioForStatic = CharacterMovementNew.GetSlideParamForStatic().GetSlideRatio();
        }
        local_200_2 = CharacterMovementNew.GetSlideParamForStatic().GetSlideNerf();
        if (local_200_2 >= 0.0f)
        {
            local_192.Param.SlideNerfForStatic = CharacterMovementNew.GetSlideParamForStatic().GetSlideNerf();
        }
        local_200_2 = CharacterMovementNew.GetSlideParamForDynamic().GetSlideRatio();
        if (local_200_2 >= 0.0f)
        {
            local_192.Param.SlideRatioForDynamic = CharacterMovementNew.GetSlideParamForDynamic().GetSlideRatio();
        }
        local_200_2 = CharacterMovementNew.GetSlideParamForDynamic().GetSlideNerf();
        if (local_200_2 >= 0.0f)
        {
            local_192.Param.SlideNerfForDynamic = CharacterMovementNew.GetSlideParamForDynamic().GetSlideNerf();
        }
        local_200_2 = CharacterMovementNew.GetSlideForwardYaw();
        if (local_200_2 != 0.0f)
        {
            local_200_2 = CharacterMovementNew.GetSlideForwardYaw();
            FRotator3f local_5959 = FRotator3f(0.0f, local_200_2, 0.0f);
            local_192.Param.SlideForwardNormal = (local_5959.Quaternion() * FQuat4f(CharacterMovement.GetRotation())).GetForwardVector().GetSafeNormal2D(1e-8f, FVector3f::ZeroVector);
        }
        GetDefaulted local_5984;
        local_200_2 = local_5984.opCall().GetUniformScale();
        local_192.State.SetScale(local_200_2);
        if (local_5990.GetExtraShapeCount() > 0)
        {
            local_5991 = 0;
            for (; local_5991 < local_5990.GetExtraShapeCount(); )
            {
                local_192.Param.ExtraShapes.Add(local_5990.GetExtraShapeByIndex(local_5991));
                ++local_5991;
            }
        }
        local_192.InitDynamicEntitiesToTolerant(CharacterMovementNew.GetTolerantCollision());
        local_192.State.SetSmoothDepenetrateDeltaMove(CharacterMovementNew.GetSmoothDepenetrateDeltaMove());
        for (auto& local_6008 : CharacterMovement.GetAttachIgnoreCollisionEntities())
        {
            local_192.Env.CollisionToIgnore.Add(local_6008.GetId());
        }
        local_192.Env.PostDetachEntities = CharacterMovement.GetPostDetachEntities();
        Get local_6014;
        const FC_ControlledByPlayer& local_6016 = local_6014.opCall();
        if (local_6016)
        {
            FECSEntity local_6020 = local_6016.GetPlayerEntity();
            Get local_6024;
            const FC_PlayerController& local_6026 = local_6024.opCall();
            if (local_6026)
            {
                for (auto& local_6008 : local_6026.GetAllPlayerPawnEntities())
                {
                    if ((local_6008.GetId() == Entity.GetId()))
                    {
                        continue;
                    }
                    local_192.Env.CollisionToIgnore.Add(local_6008.GetId());
                }
            }
        }
        FCollisionRollbackScope local_6030 = FCollisionRollbackScope(Entity);
        local_192.Env.RollbackTime = local_6030.GetRollbackTime();
        local_192.Env.LastRollbackTime = CharacterMovementNew.GetLastRollbackTime();
        bool local_197_8 = !(false);
        if (!(local_192.Env.FloorInfo.GetbValid()) == local_197_8)
        {
            float32 local_6033;
            local_6033 = 0.0f;
            Get local_6038;
            FC_CharacterAnimFakeAirFloating local_6040 = local_6038.opCall();
            if (local_6040)
            {
                local_6033 = local_6040.GetTotalAppliedRiseUp();
            }
            local_192.Env.FloorInfo = ::FKinematicMoveCollisionUtils::FindFloor(local_192, local_192.State.GetCollisionPosition(), local_192.State.GetCollisionRotation(), local_6033);
            if (local_192.Env.FloorInfo.GetbHasFloor() || local_192.Env.FloorInfo.GetbHitNonStandingSurface())
            {
                local_5963 = FVector3f(local_192.Env.FloorInfo.GetFloorImpactNormal());
            }
            else
            {
                local_5963 = FVector3f::UpVector;
            }
            local_192.State.SetFloorNormalSmoothed(local_5963);
            local_192.State.SetFloorNormalSmoothVelocity(FVector3f::ZeroVector);
        }
        FKMCResult local_6152;
        bool local_4_3 = ECS::GetRuntimeInfo().IsClient && CVar_ConstrainCharacterMoveCacheEnable.GetBool();
        if (local_4_3)
        {
            int64 local_6160;
            local_6160 = FKinematicMoveCollisionUtils::MakeConstrainCharacterMoveCacheKey(local_192, Rigidbody.GetVelocity(), CharacterMovement.GetDeltaMovement(), FixedTime);
        }
        else
        {
            int64 local_6160;
            local_6160 = 0;
        }
        local_5991 = INDEX_NONE;
        if (local_4_3 && !(FixedTime.bFirstTimeTick))
        {
            int64 local_6160;
            local_5991 = FKinematicMoveCollisionUtils::TryGetConstrainCharacterMoveCache(local_6160, local_6152);
        }
        int local_2 = INDEX_NONE;
        if (local_5991 == local_2)
        {
            int64 local_6160;
            local_6152 = ::FKinematicMoveCollisionUtils::ConstrainCharacterMove(local_192, Rigidbody.GetVelocity(), CharacterMovement.GetDeltaMovement(), FixedTime.DeltaTime);
            if (local_4_3)
            {
                FKinematicMoveCollisionUtils::StoreConstrainCharacterMoveCache(local_6160, local_6152);
            }
        }
        if (local_6152.bPosConstrained)
        {
            FVector local_6242 = (FVector(local_6152.GetFinalPosition()) - CharacterMovement.GetPosition());
            CharacterMovement.SetDeltaMovement(local_6242);
        }
        if (local_6152.bVelConstrained)
        {
            Rigidbody.SetVelocity(local_6152.GetFinalVelocity());
        }
        Modify local_6246;
        FC_CharacterMovementExternalForce& local_6248 = local_6246.opCall();
        if (local_6248)
        {
            if (local_6152.bVelConstrained)
            {
                float local_6250 = local_6152.GetFinalVelocity().SizeSquared();
                local_195_3 = float32(local_6250);
                if (local_195_3 > 0.0f)
                {
                    local_6250 = local_6248.GetVelocity().DotProduct(local_6152.GetFinalVelocity());
                    local_200_2 = float32(local_6250);
                    FVector local_6242_2 = FVector(local_6152.GetFinalVelocity());
                    float32 local_6252 = FMath::Clamp(local_200_2 / local_195_3, 0.0f, 1.0f);
                    local_6250 = local_6252;
                    local_6248.SetVelocity((local_6242_2 * local_6250));
                }
                else
                {
                    local_6248.SetVelocity(FVector::ZeroVector);
                }
            }
            FVector local_6242_3 = (Rigidbody.GetVelocity() - local_6248.GetVelocity());
            Rigidbody.SetVelocity(local_6242_3);
        }
        FKMCFloorInfo& local_44_2 = local_6152.FloorInfo;
        local_44_2.SetLastValidateFrame(int(FixedTime.Frame));
        CharacterMovementNew.SetbFloorAsWall(local_6152.bFloorAsWall);
        CharacterMovement.SetFloorInfo(local_44_2.ToFloorInfo(local_20));
        FVector3f local_39 = (FVector3f(CharacterMovementNew.GetSmoothDepenetrateDeltaMove()) + local_6152.GetOutSmoothDepenetrateDeltaMove());
        float32 local_6252_2 = CVar_SmoothDepenetrateDecay.GetFloat();
        local_39 *= local_6252_2;
        CharacterMovementNew.SetSmoothDepenetrateDeltaMove(local_39);
        CharacterMovementNew.SetSnapToFloorVelocity(local_6152.GetOutSnapToFloorVelocity());
        CharacterMovementNew.SetFloorNormalSmoothed(local_6152.GetOutFloorNormalSmoothed());
        CharacterMovementNew.SetFloorNormalSmoothVelocity(local_6152.GetOutFloorNormalSmoothVelocity());
        if (local_6152.GetOutAppliedFakeAirRiseUp() != 0.0f)
        {
            Modify local_6288;
            FC_CharacterAnimFakeAirFloating local_6040_2 = local_6288.opCall();
            if (local_6040_2)
            {
                local_6252_2 = local_6152.GetOutAppliedFakeAirRiseUp();
                local_6040_2.SetTotalAppliedRiseUp(local_6040_2.GetTotalAppliedRiseUp() + local_6252_2);
            }
        }
        if (CharacterMovement.GetPostDetachEntities().Num() > 0)
        {
            CharacterMovement.SetPostDetachEntities(local_6152.OutPostDetachPenetratingEntityIds);
        }
        for (auto& local_6302 : local_6152.OutExtraShapeHitBBVars)
        {
            Entity.SetBB_Bool(local_6302, true);
        }
        CharacterMovementNew.SetLastRollbackTime(local_6030.GetRollbackTime());
        local_195_3 = 1.0f;
        switch (local_198)
        {
            bool local_6153;
            float32 local_6033;
        case 2:
        {
            CharacterMovement.SetbAirborne(false);
            break;
        }
        case 3:
        {
            CharacterMovement.SetbAirborne(true);
            break;
        }
        case 1:
        {
            if (local_44_2.GetbHasFloor() && ((local_42.Z <= 0.0f)) && !(CharacterMovement.GetbDontLand()))
            {
                local_6153 = (CharacterMovementNew.GetEasyToLandCount() > 0);
                local_200_2 = 0.0f;
                if (!(local_6153))
                {
                    float32 local_6251 = CharacterMovementControl.GetStepHeightScale();
                    local_6033 = CharacterMovementParam.StepHeight * local_6251;
                    float32 local_6251_2 = -local_42.Z;
                    local_6252_2 = local_6251_2 * FixedTime.DeltaTime;
                    float32 local_5960_3 = FMath::Max(local_6252_2, local_6033);
                    float32 local_6251_3 = FKinematicMoveCollisionUtils::GetShapeRadiusAsCapsule(local_20);
                    float32 local_6304 = FMath::DegreesToRadians(local_44_2.GetFloorSlope());
                    local_6252_2 = FMath::Cos(local_6304);
                    float32 local_6303 = local_6251_3 / local_6252_2;
                    local_6252_2 = local_6303 - local_6251_3;
                    local_6303 = CharacterMovementNew.GetStepUpHeight();
                    local_6304 = CharacterMovementControl.GetStepHeightScale();
                    local_6304 = local_6252_2 - (local_6303 * local_6304);
                    local_6252_2 = FMath::Max(0.0f, local_6304);
                    float local_6250_2 = Rigidbody.GetVelocity().Z;
                    if (local_6250_2 < (0.0))
                    {
                        local_6033 = CVar_LandPredictDistRatio.GetFloat();
                    }
                    else
                    {
                        local_6033 = CVar_LandHardSnapDistRatio.GetFloat();
                    }
                    local_6304 = local_44_2.GetFloorDistance();
                    local_6303 = local_5960_3 * local_6033;
                    local_6153 = (local_6304 < (local_6303 + local_6252_2));
                    float32 local_6305 = local_5960_3 * CVar_LandHardSnapDistRatio.GetFloat();
                    local_200_2 = local_6305 + local_6252_2;
                }
                if (local_6153)
                {
                    CharacterMovement.SetbAirborne(false);
                    CharacterMovement.SetLandWorldTime(local_12);
                    float32 local_6303_2 = CharacterMovementParam.StepHeight;
                    float32 local_6304_2 = local_6303_2 - CharacterMovementNew.GetStepUpHeight();
                    local_6303_2 = local_44_2.GetSweepDistance() + local_6304_2;
                    float32 local_5960_4 = FMath::Min(local_44_2.GetFloorDistance(), local_6303_2) - 1.0f;
                    if (local_5960_4 > 0.0f && (local_5960_4 < local_200_2))
                    {
                        FVector local_206 = (CharacterMovement.GetDeltaMovement() - FVector(0.0, 0.0, local_5960_4));
                        CharacterMovement.SetDeltaMovement(local_206);
                    }
                }
            }
            break;
        }
        case 0:
        {
            if (!(local_44_2.GetbHasFloor()))
            {
                CharacterMovement.SetbAirborne(true);
            }
            break;
        }
        case 4:
        {
            CharacterMovement.SetbAirborne(true);
            break;
        }
        }
        if (CVar_ExtendCapsuleHeightInAir.GetBool())
        {
            bool local_6153;
            bool local_4_4 = true;
            local_6153 = local_4_4;
            local_4_4 = local_44_2.GetbValid() && (CharacterMovement.GetbWallRunning() || (CharacterMovement.GetbAirborne() && !(CharacterMovementParam.bKeepStepHeightInAir) && !(CharacterMovement.GetbAnimFakeAirFloating())));
            if (local_4_4)
            {
                local_200_2 = 100.0f;
                float32 local_6305_2 = local_44_2.GetSweepDistance() - 1.0f;
                if (local_6305_2 > 0.0f)
                {
                    float32 local_6304_3 = CharacterMovementNew.GetStepUpHeight();
                    float32 local_6303_3 = local_6304_3 - FMath::Min(local_6305_2, (FixedTime.DeltaTime * 100.0f));
                    CharacterMovementNew.SetStepUpHeight(FMath::Max(local_6303_3, 0.0f));
                }
                local_6153 = false;
            }
            if (local_6153)
            {
                CharacterMovementNew.SetStepUpHeight(CharacterMovementParam.StepHeight);
            }
        }
        this.TryExtraFloorDetection(local_192, CharacterMovementNew, CharacterMovement);
        return;
    }
    void ValidateFloorInfo(FKMCFloorInfo &inout FloorInfo, const FVector &inout Position, const FCollisionShape &inout Shape, const float32 StepHeight) const
    {
        if ((FVector(Position.X, Position.Y, ((Position.Z - Shape.GetExtent().Z) - StepHeight)) - FloorInfo.GetDetectPosition()).SizeSquared() > 0.01)
        {
            FloorInfo.SetNoFloor();
            FloorInfo.SetbValid(false);
        }
        return;
    }
    void TryExtraFloorDetection(FKMCContext &inout KMCContext, FC_CharacterMovementNew &inout CharacterMovementNew, FC_CharacterMovement &inout CharacterMovement) const
    {
        bool local_4;
        if (CharacterMovementNew.GetExtraFloorDetectRange() <= 0.0f)
        {
            return;
        }
        local_4 = CharacterMovementNew.GetFloorInfo_New().GetbValid();
        bool local_6 = local_4 && CharacterMovementNew.GetFloorInfo_New().GetbHasFloor();
        bool local_5 = local_4 && CharacterMovementNew.GetFloorInfo_New().GetbHitNonStandingSurface();
        bool local_7 = local_4 && CharacterMovementNew.GetFloorInfo_New().GetbEdge();
        if (local_6 || local_5)
        {
            return;
        }
        FCollisionRollbackScope local_10 = FCollisionRollbackScope(KMCContext.Entity);
        FKMCFloorInfo local_76 = ::FKinematicMoveCollisionUtils::FindFloor(KMCContext, KMCContext.State.GetCollisionPosition(), KMCContext.State.GetCollisionRotation(), CharacterMovementNew.GetExtraFloorDetectRange());
        if (!(local_76.GetbHasFloor()) && !(local_76.GetbHitNonStandingSurface()))
        {
            return;
        }
        CharacterMovementNew.SetFloorInfo_New(local_76);
        CharacterMovementNew.GetFloorInfo_New().SetbHasFloor(local_6);
        CharacterMovementNew.GetFloorInfo_New().SetbHitNonStandingSurface(local_5);
        CharacterMovementNew.GetFloorInfo_New().SetbEdge(local_7);
        CharacterMovement.SetFloorInfo(CharacterMovementNew.GetFloorInfo_New().ToFloorInfo(KMCContext.GetActualShape()));
        return;
    }
    UFUNCTION()
    void Job_CollisionInternal_CommonPass_NewCollision(const FECSEntity &inout Entity, FC_Rigidbody &inout Rigidbody, FC_CharacterMovement &inout Movement, FC_CharacterMovementNew &inout MovementNew, const FC_CharacterMovementConfig &inout Config, const FC_CharacterMovementParam &inout Param, const FC_CharacterMovementControl &inout Control, const FC_Collision &inout Collision, const FCS_FixedTime &inout FixedTime) const
    {
        this.CollisionInternal_New(Entity, Rigidbody, Movement, MovementNew, Config, Param, Control, Collision, FixedTime);
        return;
    }
    UFUNCTION()
    void Job_ValidateFloorInfo(const FECSEntity &inout Entity, FC_CharacterMovementNew &inout MovementNew, FC_CharacterMovement &inout Movement, const FC_Collision &inout Collision, const FCS_FixedTime &inout FixedTime) const
    {
        if (!(MovementNew.GetFloorInfo_New().GetbValid()) || (MovementNew.GetFloorInfo_New().GetLastValidateFrame() >= int(FixedTime.Frame)))
        {
            return;
        }
        FCollisionShape local_12 = Collision.GetScaledShape();
        this.ValidateFloorInfo(MovementNew.GetFloorInfo_New(), Movement.GetPosition(), local_12, 0.0f);
        if (!(MovementNew.GetFloorInfo_New().GetbValid()))
        {
            Movement.SetFloorInfo(MovementNew.GetFloorInfo_New().ToFloorInfo(local_12));
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CollisionInternal_CommonPass_NewCollision() const
    {
        int local_6 = 0;
        int local_172 = 0;
        int local_174 = 0;
        int local_180 = 0;
        int local_186 = 0;
        int local_192 = 0;
        int local_198 = 0;
        int local_204 = 0;
        int local_210 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        FECSRuntimeView::Include<FC_CharacterMovement>(local_48).opCall();
        Include local_60;
        local_60.opCall();
        Include local_64;
        local_64.opCall();
        Include local_68;
        local_68.opCall();
        Include local_72;
        local_72.opCall();
        Include local_76;
        local_76.opCall();
        Include local_80;
        local_80.opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_130 = local_48.Iterator();
        for (; local_130.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_169 = FECSEntityScopeCycleCounter(local_130.Proceed());
            this.Job_CollisionInternal_CommonPass_NewCollision(local_172, local_174, local_180, local_186, local_192, local_198, local_204, local_210, local_6);
            MarkModifiedIfDirty local_218;
            local_218.opCall(local_174);
            MarkModifiedIfDirty local_222;
            local_222.opCall(local_180);
            MarkModifiedIfDirty local_226;
            local_226.opCall(local_186);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ValidateFloorInfo() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        MarkModifiedIfDirty local_66;
        int local_202 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_ValidateFloorInfo(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_42);
                local_66.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_104 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Include local_120;
        local_120.opCall();
        Exclude(local_104).opCall();
        Exclude(local_104).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_130 = 0;
        FECSRuntimeViewIterator local_164 = local_104.Iterator();
        for (; local_164.CanProceed;)
        {
            local_40 = local_164.Proceed();
            ++local_130;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_ValidateFloorInfo(local_202, local_42, local_48, local_54, local_6);
            local_62.opCall(local_42);
            local_66.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_130);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

