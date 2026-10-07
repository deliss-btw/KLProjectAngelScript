
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
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void CheckWallRunOnly(const FECSEntity &inout Entity, FC_CharacterMovementEnvInfo &inout CharacterMovementEnvInfo, const FC_Collision &inout Collision, const FC_CharacterEnvCheckingConfig &inout CharacterEnvCheckingConfig, const FC_CharacterMovementParam &inout CharacterMovementParam, const FC_Transform &inout Transform) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
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

