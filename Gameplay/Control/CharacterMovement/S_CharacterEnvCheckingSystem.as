const FConsoleVariable CVar_DebugCharacterEnvChecking = FConsoleVariable();
const FConsoleVariable CVar_DisableCharacterEnvChecking = FConsoleVariable();

class US_CharacterEnvCheckingSystem : UECSScriptSystem
{
    US_CharacterEnvCheckingSystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void Job_CheckCharacterEnv(const FECSEntity &inout Entity, const FC_Collision &inout Collision, const FCS_FixedTime &inout FixedTime, const FC_CharacterEnvCheckingConfig &inout CharacterEnvCheckingConfig, const FC_CharacterMovementParam &inout CharacterMovementParam, const FC_CharacterMovement &inout CharacterMovement, const FC_CharacterMovementControl &inout CharacterMovementControl, const FC_Transform &inout Transform, const FC_Rigidbody &inout Rigidbody) const
    {
        int local_14 = 0;
        if (CVar_DisableCharacterEnvChecking.GetBool())
        {
            Remove local_6;
            local_6.opCall();
            return;
        }
        if (!(CharacterEnvCheckingConfig.bEnableWallRun) && !(CharacterEnvCheckingConfig.bEnableMoveUpstairs))
        {
            Remove local_6;
            local_6.opCall();
            return;
        }
        FVector local_26 = FCharacterInputUtils::GetWorldMoveInput(Entity, FixedTime.Time, FixedTime.DeltaTime, false);
        if (local_26.IsNearlyZero(9.999999747378752e-5) || CharacterMovementControl.GetbFlyingMovement())
        {
            this.ResetEnvCheckingResult(local_14);
            return;
        }
        if (CharacterMovement.GetbWallRunning() || (CharacterMovement.GetbAirborne() && !(CharacterMovement.GetbAnimFakeAirFloating())))
        {
            return;
        }
        this.ResetEnvCheckingResult(local_14);
        if (!(CharacterEnvCheckingConfig.bEnableMoveUpstairs))
        {
            this.CheckWallRunOnly(Entity, local_14, Collision, CharacterEnvCheckingConfig, CharacterMovementParam, Transform);
            return;
        }
        this.CheckMoveUpstarisAndWallRun(Entity, local_14, Collision, CharacterEnvCheckingConfig, CharacterMovementParam, Transform);
        return;
    }
    void CheckMoveUpstarisAndWallRun(const FECSEntity &inout Entity, FC_CharacterMovementEnvInfo &inout CharacterMovementEnvInfo, const FC_Collision &inout Collision, const FC_CharacterEnvCheckingConfig &inout CharacterEnvCheckingConfig, const FC_CharacterMovementParam &inout CharacterMovementParam, const FC_Transform &inout Transform) const
    {
        bool local_241;
        FVector local_6 = Transform.GetPosition();
        FQuat local_16 = Transform.GetRotation();
        FVector local_28 = local_16.Vector();
        FVector local_34(::FCharacterDirectionUtils::GetTargetRotation(Entity, ECharacterDirectionType(1), false, FFPTime(-1)).GetForwardVector());
        FVector local_22 = (local_34 * CharacterEnvCheckingConfig.ForwardCheckDistance);
        float32 local_57 = CharacterEnvCheckingConfig.MinUpstairsHeight;
        float32 local_58 = CharacterEnvCheckingConfig.MinWallRunHeight;
        FHitResult local_124;
        int local_126 = 18;
        int local_125 = local_126;
        FCollisionShape local_134 = Collision.GetScaledShape();
        float32 local_53_2 = Collision.GetScaledRadius();
        float32 local_135 = Collision.GetScaledHalfHeight();
        FCollisionQueryParams local_174;
        local_174.AddIgnoredEntityId(Entity.GetIdValue());
        local_174.bReturnPhysicalMaterial = true;
        FVector local_192 = (local_6 + FVector(0.0, 0.0, local_57));
        FVector local_204 = ((local_6 + local_22) + FVector(0.0, 0.0, local_57));
        FVector local_210(FVector::ZeroVector);
        FVector local_216(FVector::ZeroVector);
        FVector local_222(FVector::ZeroVector);
        FVector local_228(FVector::ZeroVector);
        FVector local_234(FVector::ZeroVector);
        Has local_240;
        bool local_38 = local_240.opCall();
        local_241 = false;
        FCollisionResponseParams local_250;
        bool local_252 = FPhysicsUtils::SweepSingle(Entity, false, EPhysicsTraceTag(20), local_124, local_192, local_204, local_16, ECollisionChannel(local_125), local_134, local_174, local_250);
        if (local_252 && !(this.CheckHitResultIsWalkable(local_124, CharacterMovementParam.WalkableSlopDegree)) && (local_34.DotProduct(local_124.ImpactNormal) < 0.0) && (local_28.DotProduct(local_124.ImpactNormal) < 0.0))
        {
            bool local_253;
            bool local_254;
            local_210 = local_124.Location;
            local_216 = local_124.ImpactNormal;
            FVector local_192_2 = (local_6 + FVector(0.0, 0.0, local_58));
            bool local_242 = FPhysicsUtils::SweepSingle(Entity, false, EPhysicsTraceTag(20), local_124, local_192_2, ((local_6 + local_22) + FVector(0.0, 0.0, local_58)), local_16, ECollisionChannel(local_125), local_134, local_174, local_250);
            local_254 = local_124.GetbStartPenetrating();
            bool local_235 = local_242 && !(local_254) && this.CheckHitResultIsWalkable(local_124, CharacterMovementParam.WalkableSlopDegree);
            FVector local_262(local_124.Location);
            local_253 = !(local_242);
            if ((local_253 || local_235))
            {
                FVector local_182_2 = (local_34 * local_53_2);
                FVector local_52_2 = (local_210 + local_182_2);
                bool local_255 = FPhysicsUtils::SweepSingle(Entity, false, EPhysicsTraceTag(20), local_124, (local_52_2 + FVector(0.0, 0.0, local_58)), local_52_2, local_16, ECollisionChannel(local_125), local_134, local_174, local_250);
                local_253 = local_255 && (this.CheckHitResultIsWalkable(local_124, CharacterMovementParam.WalkableSlopDegree) || (local_124.ImpactNormal.DotProduct(local_34) > 0.0));
                if (local_253)
                {
                    local_234 = FVector(local_124.Location.X, local_124.Location.Y, local_124.Location.Z);
                    if (CVar_DebugCharacterEnvChecking.GetBool())
                    {
                        DebugDraw::DrawDebugCapsule(ECS::GetUEWorld(), local_234, local_135, local_53_2, Transform.GetRotation(), FColor::Green, false, 0.1f, uint8(0), 0.0f);
                    }
                }
                else
                {
                    if (local_235)
                    {
                        local_234 = FVector(local_210.X, local_210.Y, local_262.Z);
                        if (CVar_DebugCharacterEnvChecking.GetBool())
                        {
                            DebugDraw::DrawDebugCapsule(ECS::GetUEWorld(), local_234, local_135, local_53_2, Transform.GetRotation(), FColor::Blue, false, 0.1f, uint8(0), 0.0f);
                        }
                    }
                    else
                    {
                        if (local_255)
                        {
                            local_241 = this.CheckShouldWallRun(local_34, local_28, CharacterEnvCheckingConfig, CharacterMovementParam, local_124, local_38);
                            local_222 = local_124.Location;
                            local_228 = local_124.ImpactNormal;
                        }
                        else
                        {
                            XWarning(ELog(0), "Can't find upstairs location? we should not go here");
                        }
                    }
                }
            }
            else
            {
                if (!(local_254))
                {
                    local_241 = this.CheckShouldWallRun(local_34, local_28, CharacterEnvCheckingConfig, CharacterMovementParam, local_124, local_38);
                    local_222 = local_124.Location;
                    local_228 = local_124.ImpactNormal;
                }
            }
        }
        CharacterMovementEnvInfo.SetUpstairsTargetLocation(local_234);
        CharacterMovementEnvInfo.SetbEnvCanMoveUpstairs(!(local_234.IsNearlyZero(9.999999747378752e-5)));
        if (!(CharacterMovementEnvInfo.GetbEnvCanMoveUpstairs()) && local_241)
        {
            bool local_253;
            FVector local_192_3 = (local_6 + FVector(0.0, 0.0, (CharacterEnvCheckingConfig.MinWallRunHeight - local_135)));
            FVector local_204_2 = (local_192_3 + ((local_34 * CharacterEnvCheckingConfig.ForwardCheckDistance) * 3.0));
            FCollisionQueryParams local_314;
            local_314.bTraceComplex = false;
            local_314.AddIgnoredEntityId(Entity.GetIdValue());
            local_253 = FPhysicsUtils::LineTraceSingle(Entity, false, EPhysicsTraceTag(20), local_124, local_192_3, local_204_2, FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)), local_314, local_250);
            if (local_253)
            {
                CharacterMovementEnvInfo.SetbEnvCanWallRun(true);
                CharacterMovementEnvInfo.SetWallRunTargetLocation(local_222);
                CharacterMovementEnvInfo.SetWallNormal(local_228);
                if (CVar_DebugCharacterEnvChecking.GetBool())
                {
                    DebugDraw::DrawDebugCapsule(ECS::GetUEWorld(), CharacterMovementEnvInfo.GetWallRunTargetLocation(), local_135, local_53_2, Transform.GetRotation(), FColor::Blue, false, 0.1f, uint8(0), 0.0f);
                }
            }
        }
        return;
    }
    void CheckWallRunOnly(const FECSEntity &inout Entity, FC_CharacterMovementEnvInfo &inout CharacterMovementEnvInfo, const FC_Collision &inout Collision, const FC_CharacterEnvCheckingConfig &inout CharacterEnvCheckingConfig, const FC_CharacterMovementParam &inout CharacterMovementParam, const FC_Transform &inout Transform) const
    {
        bool local_207;
        FVector local_6 = Transform.GetPosition();
        FQuat local_16 = Transform.GetRotation();
        FVector local_28 = local_16.Vector();
        FVector local_34(::FCharacterDirectionUtils::GetTargetRotation(Entity, ECharacterDirectionType(1), false, FFPTime(-1)).GetForwardVector());
        FVector local_22 = (local_34 * CharacterEnvCheckingConfig.ForwardCheckDistance);
        float32 local_57 = CharacterEnvCheckingConfig.MinWallRunHeight;
        FHitResult local_124;
        FCollisionQueryParams local_162;
        local_162.AddIgnoredEntityId(Entity.GetIdValue());
        local_162.bReturnPhysicalMaterial = true;
        int local_165 = 18;
        int local_164 = local_165;
        FCollisionShape local_173 = Collision.GetScaledShape();
        int local_175 = 5;
        int local_174 = local_175;
        FVector local_192 = (local_6 + FVector(0.0, 0.0, local_57));
        FVector local_204 = ((local_6 + local_22) + FVector(0.0, 0.0, local_57));
        float32 local_53_2 = Collision.GetScaledRadius();
        float32 local_205 = Collision.GetScaledHalfHeight();
        Has local_212;
        bool local_38 = local_212.opCall();
        bool local_213 = false;
        FCollisionResponseParams local_222;
        bool local_224 = FPhysicsUtils::SweepSingle(Entity, false, EPhysicsTraceTag(20), local_124, local_192, local_204, local_16, ECollisionChannel(local_164), local_173, local_162, local_222);
        if (local_224 && !(this.CheckHitResultIsWalkable(local_124, CharacterMovementParam.WalkableSlopDegree)) && this.CheckIsFacingToWall(local_34, local_124.ImpactNormal, CharacterEnvCheckingConfig.MaxAngleToWallNormal) && this.CheckIsFacingToWall(local_28, local_124.ImpactNormal, CharacterEnvCheckingConfig.MaxAngleToWallNormal))
        {
            local_213 = this.CheckShouldWallRun(local_34, local_28, CharacterEnvCheckingConfig, CharacterMovementParam, local_124, local_38);
        }
        CharacterMovementEnvInfo.SetbEnvCanWallRun(false);
        CharacterMovementEnvInfo.SetWallNormal(FVector::ZeroVector);
        if (local_213)
        {
            local_192 = (local_6 + FVector(0.0, 0.0, (CharacterEnvCheckingConfig.MinWallRunHeight - local_205)));
            FVector local_52_2 = (local_34 * CharacterEnvCheckingConfig.ForwardCheckDistance);
            local_204 = (local_192 + (local_52_2 * 3.0));
            FCollisionQueryParams local_262;
            local_262.bTraceComplex = false;
            local_262.AddIgnoredEntityId(Entity.GetIdValue());
            local_207 = FPhysicsUtils::LineTraceSingle(Entity, false, EPhysicsTraceTag(20), local_124, local_192, local_204, FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(local_174)), local_262, local_222);
            if (local_207)
            {
                CharacterMovementEnvInfo.SetbEnvCanWallRun(true);
                CharacterMovementEnvInfo.SetWallRunTargetLocation(local_124.Location);
                CharacterMovementEnvInfo.SetWallNormal(local_124.ImpactNormal);
            }
        }
        return;
    }
    bool CheckShouldWallRun(const FVector &inout MoveDir, const FVector &inout FacingDir, const FC_CharacterEnvCheckingConfig &inout CharacterEnvCheckingConfig, const FC_CharacterMovementParam &inout MovementParam, const FHitResult &inout HitResult, const bool bIsMount) const
    {
        return CharacterEnvCheckingConfig.bEnableWallRun && this.CheckIsFacingToWall(MoveDir, HitResult.ImpactNormal, CharacterEnvCheckingConfig.MaxAngleToWallNormal) && this.CheckIsFacingToWall(FacingDir, HitResult.ImpactNormal, CharacterEnvCheckingConfig.MaxAngleToWallNormal) && FKinematicMoveUtils::CheckHitResultCanWallRun(HitResult, MovementParam.WallRunMinSlopeDegree, MovementParam.WallRunMaxSlopeDegree, bIsMount);
    }
    bool CheckIsFacingToWall(const FVector &inout CheckDir, const FVector &inout WallNormal, const float32 MaxAngleDegree) const
    {
        FVector local_14 = CheckDir.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
        return (FMath::RadiansToDegrees(FMath::Acos((float32((local_14.DotProduct(WallNormal.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector).opNeg())))))) < MaxAngleDegree);
    }
    bool CheckHitResultIsWalkable(const FHitResult &inout HitResult, const float32 WalkableSlopDegree) const
    {
        UPrimitiveComponent local_2;
        UPrimitiveComponent local_8;
        if ((local_2 != nullptr && (int(local_8.CanCharacterStepUpOn) == 1)))
        {
            return (float32(HitResult.ImpactNormal.DotProduct(FVector::UpVector)) >= FMath::Cos(FMath::DegreesToRadians(WalkableSlopDegree)));
        }
        return false;
    }
    void ResetEnvCheckingResult(FC_CharacterMovementEnvInfo &inout EnvCheckingResult) const
    {
        EnvCheckingResult.SetbEnvCanMoveUpstairs(false);
        EnvCheckingResult.SetUpstairsTargetLocation(FVector::ZeroVector);
        EnvCheckingResult.SetbEnvCanWallRun(false);
        EnvCheckingResult.SetWallNormal(FVector::ZeroVector);
        return;
    }
    UFUNCTION()
    void Run_Job_CheckCharacterEnv() const
    {
        int local_6 = 0;
        int local_164 = 0;
        int local_166 = 0;
        int local_172 = 0;
        int local_178 = 0;
        int local_184 = 0;
        int local_190 = 0;
        int local_196 = 0;
        int local_202 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        FECSRuntimeView::Include<FC_CharacterEnvCheckingConfig>(local_48).opCall();
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
        FECSRuntimeViewIterator local_122 = local_48.Iterator();
        for (; local_122.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_161 = FECSEntityScopeCycleCounter(local_122.Proceed());
            this.Job_CheckCharacterEnv(local_164, local_166, local_6, local_172, local_178, local_184, local_190, local_196, local_202);
        }
        return;
    }
}

