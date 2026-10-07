
const FConsoleVariable CVar_Debug_UseVaultingSystem = FConsoleVariable();
const FConsoleVariable CVar_Debug_VaultingSystem_UseSceneQueryCache = FConsoleVariable();
const FConsoleVariable CVar_Debug_ClearVaultTriggerDelay = FConsoleVariable();
const FConsoleVariable CVar_Debug_EnableWallRunByDefault = FConsoleVariable();
const FConsoleVariable CVar_Debug_EnableMoveUpstairsByDefault = FConsoleVariable();
const FConsoleVariable CVar_Debug_EnableVaultOverByDefault = FConsoleVariable();
const FConsoleVariable CVar_Debug_EnableLeapOffByDefault = FConsoleVariable();
const FConsoleVariable CVar_Debug_EnableAttemptWallRunByDefault = FConsoleVariable();
const FConsoleVariable CVar_Debug_CheckEnableVaultAction = FConsoleVariable();

struct FForwardProbeResult
{
    UPROPERTY()
    TArray<FHitResult> ForwardHitResults;
    UPROPERTY()
    float32 SumPassableHeight = -1.0f;
    UPROPERTY()
    FVector3f SumImpactNormal = FVector3f::ZeroVector;
    UPROPERTY()
    FHitResult NearestResult;
    UPROPERTY()
    FHitResult FurthestResultUponNearest;


}

struct FDownwardProbeResult
{
    UPROPERTY()
    TArray<FHitResult> DownwardHitResults;
    UPROPERTY()
    float32 SumStandableWidth = 0.0f;
    UPROPERTY()
    FVector HighestPoint;
    UPROPERTY()
    bool bCanVaultOverHighestPoint = false;
    UPROPERTY()
    bool bMoveReachable = true;
    UPROPERTY()
    int LandingIndex = -1;
    UPROPERTY()
    bool bHasVaultDropFallbackPoint = false;
    UPROPERTY()
    FVector VaultDropFallbackPoint = FVector::ZeroVector;


}

struct FVaultProbeContext
{
    UPROPERTY()
    FECSEntity Entity;
    UPROPERTY()
    FVector Position;
    UPROPERTY()
    FQuat Rot;
    FCollisionShape Shape;
    UPROPERTY()
    EVaultStartState VaultStartState;
    UPROPERTY()
    float32 ZExtent;
    UPROPERTY()
    FVector FootPosition;
    UPROPERTY()
    FVector ProbeDir;
    UPROPERTY()
    ECollisionChannel Channel;
    UPROPERTY()
    bool bEnableMoveUpstairs;
    UPROPERTY()
    bool bEnableVaultOver;
    UPROPERTY()
    bool bEnableWallRun;
    UPROPERTY()
    bool bEnableReachUp;
    UPROPERTY()
    bool bFacingDirValid;
    UPROPERTY()
    FCharacterVaultProbeConfig VaultProbeConfig;


    void Initialize(const FC_CharacterVaulting &inout Vaulting, const FC_CharacterVaultingConfig &inout VaultingConfig)
    {
        this.ZExtent = float32(this.Shape.GetExtent().Z);
        this.FootPosition = (this.Position + (FVector(FVector::DownVector) * this.ZExtent));
        this.bFacingDirValid = (this.ProbeDir.DotProduct(this.Rot.GetForwardVector()) >= FMath::Cos(FMath::DegreesToRadians(this.VaultProbeConfig.MaxAngleBetweenInputAndFacingDir)));
        if (!(this.bFacingDirValid))
        {
            return;
        }
        this.bEnableMoveUpstairs = Vaulting.GetEnableMoveUpstairs(VaultingConfig);
        this.bEnableVaultOver = Vaulting.GetEnableVaultOver(VaultingConfig);
        this.bEnableWallRun = Vaulting.GetEnableAttemptWallRun(VaultingConfig) || Vaulting.GetEnableStableWallRun(VaultingConfig);
        this.bEnableReachUp = this.bEnableMoveUpstairs || this.bEnableVaultOver;
        return;
    }
    int EnableMask() const
    {
        int local_1 = 0;
        if (this.bEnableMoveUpstairs)
        {
            local_1 = local_1 + 1;
        }
        if (this.bEnableVaultOver)
        {
            local_1 = local_1 + 2;
        }
        if (this.bEnableWallRun)
        {
            local_1 = local_1 + 4;
        }
        return local_1;
    }
}

class US_CharacterVaultingSystem : UECSScriptSystem
{
    UPROPERTY()
    float32 RequestIntervalLimit = 0.1f;
    float32 SMALL_TRACE_OFFSET = 1.0f;


    UFUNCTION()
    void Init_Implementation()
    {
        FECSDebugDraw::SetDebugKeyUnfiltered(n"Vaulting", true);
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return !(::Vaulting::UseVaultingSystem());
    }
    bool VerifyMovementPath(const FECSEntity &inout Entity, const FC_Transform &inout Transform, const FCollisionShape &inout Shape, const FC_CharacterVaulting &inout Vaulting, const FC_CharacterVaultingConfig &inout VaultingConfig, const FVaultPath &inout Path, const float32 ShapeLiftUp) const
    {
        FCharacterVaultProbeConfig local_54;
        if (!(VaultingConfig.GetVaultProbeConfig(Path.VaultStartState, local_54)))
        {
            return false;
        }
        switch (int(Path.VaultActionType))
        {
        case 1:
        {
            if (!(this.VerifyPathMoveUp(Entity, Shape, Path.Start, Path.GetPosition(-1), ShapeLiftUp)))
            {
                return false;
            }
            return true;
        }
        case 2:
        {
            if (!(this.VerifyPathMoveUp(Entity, Shape, Path.Start, Path.GetPosition(0), ShapeLiftUp)))
            {
                return false;
            }
            if (!(this.VerifyPathMoveDown(Entity, Shape, Path.GetPosition(0), Path.GetPosition(1), ShapeLiftUp)))
            {
                return false;
            }
            return true;
        }
        case 3:
        {
            bool local_56 = Vaulting.GetEnableStableWallRun(VaultingConfig);
            if (!(local_56))
            {
                if (Vaulting.GetWallRunInfo().GetbInAttemptCoolDown() && (int(Path.VaultStartState) != 2 || (Path.Start.Z > Vaulting.GetWallRunInfo().GetWallRunMaxZ())))
                {
                    return false;
                }
                if (!(Vaulting.GetWallRunInfo().GetbInAttemptCoolDown()) && (Path.GetPositionOffset(0).Z > local_54.WallRunAttemptHeight))
                {
                    return false;
                }
            }
            if (!(this.VerifyPathWallRunStart(Entity, Shape, Path.Start, Path.GetPosition(0), ShapeLiftUp)))
            {
                return false;
            }
            return true;
        }
        case 5:
        {
            if (!(this.VerifyPathMoveDown(Entity, Shape, Path.Start, Path.GetPosition(0), ShapeLiftUp)))
            {
                return false;
            }
            return true;
        }
        case 4:
        {
            return true;
        }
        }
        return false;
    }
    bool VerifyPathMoveUp(const FECSEntity &inout Entity, const FCollisionShape &inout Shape, const FVector &inout StartPos, const FVector &inout EndPos, const float32 ShapeLiftUp) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    bool VerifyPathMoveDown(const FECSEntity &inout Entity, const FCollisionShape &inout Shape, const FVector &inout StartPos, const FVector &inout EndPos, const float32 ShapeLiftUp) const
    {
        if (this.TraceBorderTest(StartPos, EndPos))
        {
            return false;
        }
        return true;
    }
    bool TraceBorderTest(const FVector &inout StartPos, const FVector &inout EndPos) const
    {
        if (FBorderUtils::LineTraceTestAnyBorder(StartPos, EndPos))
        {
            FECSDebugDraw::DrawDebugLine(n"Vaulting", StartPos, EndPos, FColor::Red, FColor::Red, 3.0f, uint8(1), 1.0f);
            FECSDebugDraw::DrawDebugString(n"Vaulting", StartPos, FString().Append("HitBorder"), FColor::Yellow, 1.0f, FColor::Yellow, 3.0f);
            return true;
        }
        FECSDebugDraw::DrawDebugLine(n"Vaulting", StartPos, EndPos, FColor::Green, FColor::Green, 0.1f, uint8(1), 1.0f);
        return false;
    }
    bool VerifyPathWallRunStart(const FECSEntity &inout Entity, const FCollisionShape &inout Shape, const FVector &inout StartPos, const FVector &inout EndPos, const float32 ShapeLiftUp) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    ECollisionChannel GetCollisionChannel() const
    {
        return ECollisionChannel(18);
    }
    FVaultPath ProbeForLeapOff(const FVaultProbeContext &inout Context, const FC_CharacterMovementParam &inout MovementParam, const FC_CharacterVaulting &inout Vaulting, const FC_CharacterVaultingConfig &inout VaultingConfig, const FForwardProbeResult &inout ForwardProbeResult) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        FVaultPath __r; return __r;
    }
    FVaultPath ProbeForWallRun(const FVaultProbeContext &inout Context, const FC_CharacterMovementParam &inout MovementParam, const FC_CharacterVaulting &inout Vaulting, const FC_CharacterVaultingConfig &inout VaultingConfig, const FForwardProbeResult &inout ForwardProbeResult) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        FVaultPath __r; return __r;
    }
    bool ProbeLineTrace(FHitResult &inout OutHit, const FECSEntity &inout Entity, const bool bRollback, const EPhysicsTraceTag TraceTag, const FVector &inout TraceStart, const FVector &inout TraceEnd, const ECollisionChannel Channel, FCollisionQueryParams &inout QueryParams, const FSceneQueryCacheParam &inout CacheParam) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    bool HitResultWalkable(const FHitResult &inout HitResult, const float32 NormalZThres) const
    {
        return ((FHitResultUtils::CanCharacterStandOn(HitResult) && FHitResultUtils::CanCharacterStepUpOn(HitResult)) && (HitResult.ImpactNormal.Z >= NormalZThres));
    }
    FForwardProbeResult ProbeForwardRaycasts(const FVaultProbeContext &inout Context) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        FForwardProbeResult __r; return __r;
    }
    void VerifyAngleForVault(const FVaultProbeContext &inout Context, const FForwardProbeResult &inout ForwardProbeResult, const FC_CharacterVaultInfoCache &inout VaultInfoCache, const FCS_FixedTime &inout FixedTime, bool &inout bAngleFitReachUp, bool &inout bAngleFitWallRun) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    FDownwardProbeResult ProbeDownwardRaycasts(const FVaultProbeContext &inout Context, const FForwardProbeResult &inout ForwardProbeResult, const float32 ForwardTraceDist, const FC_CharacterMovementParam &inout MovementParam, const FC_CharacterVaulting &inout Vaulting) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        FDownwardProbeResult __r; return __r;
    }
    FVector InterpolateForwardHitByHeight(const FVaultProbeContext &inout Context, const FForwardProbeResult &inout ForwardProbeResult, const float32 TargetHeight, FVector3f &inout OutNormal) const
    {
        TArray<FHitResult> local_2 = ForwardProbeResult.ForwardHitResults;
        if ((!((local_2.Num() > 0))))
        {
            return Context.FootPosition.NewZ(TargetHeight);
        }
        int local_15 = 0;
        int local_4 = local_2.Num() - 1;
        while (local_15 <= local_4)
        {
            int local_18 = FMath::IntegerDivisionTrunc(local_15 + local_4, 2);
            if (float32(local_2[local_18].TraceStart.Z) <= TargetHeight)
            {
                local_15 = local_18 + 1;
            }
            else
            {
                local_4 = local_18 - 1;
            }
        }
        int local_17 = FMath::Max(FMath::Min(local_4, (local_2.Num() - 2)), 0);
        int local_21 = FMath::Min(FMath::Max(local_15, 1), local_2.Num() - 1);
        const FHitResult& local_24 = local_2[local_17];
        const FHitResult& local_26 = local_2[local_21];
        FVector local_14;
        if (local_24.Time <= 1.0f)
        {
            local_14 = local_24.ImpactPoint;
        }
        else
        {
            local_14 = local_24.TraceEnd;
        }
        FVector local_32;
        if (local_26.Time <= 1.0f)
        {
            local_32 = local_26.ImpactPoint;
        }
        else
        {
            local_32 = local_26.TraceEnd;
        }
        FVector local_40 = FMath::Lerp(local_14, local_32, FMathUtils::InverseLerp(TargetHeight, float32(local_24.TraceStart.Z), float32(local_26.TraceStart.Z)));
        FVector local_48 = FVector::UpVector.CrossProduct(Context.ProbeDir);
        OutNormal = FVector3f((local_32 - local_14).CrossProduct(local_48).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
        return local_40.NewZ(TargetHeight);
    }
    bool DepenetrateLandingPoint(const FVaultProbeContext &inout Context, const FC_CharacterMovementParam &inout MovementParam, const EVaultActionType VaultActionType, FVector &inout LandingPoint) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    float32 CalculateVaultScore(const FCharacterVaultProbeConfig &inout VaultProbeConfig, const FVector &inout LandingPoint, const FVector &inout HighestPoint) const
    {
        FVector local_12 = (HighestPoint - LandingPoint);
        return float32(((local_12.SizeSquared() / FMath::Square(VaultProbeConfig.GapWidthForVault)) + FMath::Square((local_12.Z / VaultProbeConfig.GapHeightForVault))));
    }
    bool DepenetrateVaultPoints(const FVaultProbeContext &inout Context, const FC_CharacterMovementParam &inout MovementParam, const FCharacterVaultProbeConfig &inout VaultProbeConfig, const EVaultActionType VaultActionType, FVector &inout HighestPoint, FVector &inout LandingPoint, float32 &inout VaultScore) const
    {
        FVector local_6 = LandingPoint;
        if (int(VaultActionType) == 1)
        {
            if (!(this.DepenetrateLandingPoint(Context, MovementParam, EVaultActionType(VaultActionType), LandingPoint)))
            {
                return false;
            }
            if (!((local_6 == LandingPoint)) && (this.CalculateVaultScore(VaultProbeConfig, LandingPoint, HighestPoint) >= 1.0f))
            {
                return false;
            }
        }
        else
        {
            if (!(this.DepenetrateLandingPoint(Context, MovementParam, EVaultActionType(1), HighestPoint)))
            {
                return false;
            }
            if (!((HighestPoint == HighestPoint)) && (this.CalculateVaultScore(VaultProbeConfig, LandingPoint, HighestPoint) < 1.0f))
            {
                return false;
            }
            if (!(this.DepenetrateLandingPoint(Context, MovementParam, EVaultActionType(VaultActionType), LandingPoint)))
            {
                return false;
            }
            if (!((local_6 == LandingPoint)) && (this.CalculateVaultScore(VaultProbeConfig, LandingPoint, HighestPoint) < 1.0f))
            {
                return false;
            }
        }
        return true;
    }
    FVaultPath CalculateFinalVaultPath(const FVaultProbeContext &inout Context, const float32 ForwardTraceDist, const FC_CharacterMovementParam &inout MovementParam, const FForwardProbeResult &inout ForwardProbeResult, const FDownwardProbeResult &inout DownwardProbeResult) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        FVaultPath __r; return __r;
    }
    FVaultPath ProbeEnvObstacle(const FVaultProbeContext &inout Context, const FC_CharacterMovementParam &inout MovementParam, const FC_CharacterVaulting &inout Vaulting, const FC_CharacterVaultInfoCache &inout VaultInfoCache, const FC_CharacterVaultingConfig &inout VaultingConfig, const FCS_FixedTime &inout FixedTime) const
    {
        FVaultPath __r;
        FCharacterVaultProbeConfig local_2 = Context.VaultProbeConfig;
        FVaultPath local_28;
        if (!(Context.bFacingDirValid))
        {
            local_28.bNoProbeCD = true;
        }
        else
        {
            FForwardProbeResult local_310 = this.ProbeForwardRaycasts(Context);
            if (local_310.NearestResult.Time > 1.0f)
            {
                FVaultPath local_336 = this.ProbeForLeapOff(Context, MovementParam, Vaulting, VaultingConfig, local_310);
            }
            else
            {
                bool local_338;
                bool local_337;
                local_337 = false;
                local_338 = false;
                this.VerifyAngleForVault(Context, local_310, VaultInfoCache, FixedTime, local_337, local_338);
                if ((!(local_337 && Context.bEnableReachUp)) || (local_310.SumPassableHeight < (Context.ZExtent * 2.0f)))
                {
                    if (local_338 && Context.bEnableWallRun)
                    {
                        FVaultPath local_336_2 = this.ProbeForWallRun(Context, MovementParam, Vaulting, VaultingConfig, local_310);
                    }
                    else
                    {
                    }
                }
                else
                {
                    float32 local_340 = local_2.ForwardCheckDistance + local_2.MaxVaultWidth;
                    FDownwardProbeResult local_386 = this.ProbeDownwardRaycasts(Context, local_310, local_340, MovementParam, Vaulting);
                    GetDefaulted local_390;
                    if (local_386.bMoveReachable && !(local_390.opCall().GetbFloorAsWall()))
                    {
                    }
                    else
                    {
                        FVaultPath local_336_3 = this.CalculateFinalVaultPath(Context, local_340, MovementParam, local_310, local_386);
                        if (int(local_28.VaultActionType) == 0)
                        {
                            if (local_338 && Context.bEnableWallRun)
                            {
                                FVaultPath local_336_4 = this.ProbeForWallRun(Context, MovementParam, Vaulting, VaultingConfig, local_310);
                            }
                            else
                            {
                            }
                        }
                    }
                }
            }
        }
        return __r;
    }
    UFUNCTION()
    void Job_ProbeEnvObstacle(const FECSEntity &inout Entity, const FC_Transform &inout Transform, const FC_Collision &inout Collision, const FC_CharacterMovement &inout Movement, const FC_CharacterMovementControl &inout MovementControl, const FC_CharacterMovementParam &inout MovementParam, const FC_CharacterVaulting &inout Vaulting, FC_CharacterVaultInfoCache &inout VaultInfoCache, const FC_CharacterVaultingConfig &inout VaultingConfig, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_1;
        EVaultStartState local_123;
        FVector local_136;
        if (!(FixedTime.bLatestFrame))
        {
            return;
        }
        FVector local_8 = MovementControl.GetMovementInput();
        if (FMath::IsNearlyZero(local_8.X, 9.99999993922529e-9) && FMath::IsNearlyZero(local_8.Y, 9.99999993922529e-9))
        {
            if (FixedTime.bLatestFrame)
            {
                VaultInfoCache.ClearSteerYaw();
            }
            return;
        }
        if (FixedTime.bLatestFrame)
        {
            int local_18 = int(FixedTime.Frame);
            float local_16 = FMath::Atan2(local_8.Y, local_8.X);
            VaultInfoCache.PushSteerYaw(float32(local_16), local_18);
        }
        FFPTime local_20 = FFPTime(Vaulting.GetLastRequestTime());
        if (local_20.opCmp(0.0) > 0 && ((((FFPTime(FixedTime.Time) - Vaulting.GetLastRequestTime())).opCmp(this.RequestIntervalLimit) < 0)))
        {
            return;
        }
        if (Vaulting.GetbIsVaultingOver())
        {
            return;
        }
        bool local_23 = false;
        if (Vaulting.GetbIsMovingUpstairs())
        {
            if (Vaulting.GetbEnableDualUpstairs())
            {
                local_23 = true;
            }
            else
            {
                return;
            }
        }
        FVaultProbeContext local_120;
        EVaultStartState local_122 = local_120.VaultStartState;
        if (Vaulting.GetbIsStartingWallRun() || Movement.GetbWallRunning())
        {
            local_123 = EVaultStartState(2);
            local_122 = local_123;
        }
        else
        {
            if (local_23)
            {
                local_123 = Vaulting.VaultDualStartState();
                local_122 = local_123;
                if (int(local_122) != 0 && (int(local_122) != 1))
                {
                    Get local_128;
                    local_1 = local_128.opCall().GetbSprintOn();
                    if (local_1)
                    {
                        local_123 = EVaultStartState(1);
                    }
                    else
                    {
                        local_123 = EVaultStartState(0);
                    }
                    local_122 = local_123;
                }
            }
            else
            {
                if (Movement.GetbAirborne())
                {
                    local_122 = EVaultStartState(3);
                }
                else
                {
                    if (Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_Sprint) || Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_Dodge))
                    {
                        local_122 = EVaultStartState(1);
                    }
                    else
                    {
                        local_122 = EVaultStartState(0);
                    }
                }
            }
        }
        if (!(VaultingConfig.GetVaultProbeConfig(EVaultStartState(local_122), local_120.VaultProbeConfig)))
        {
            return;
        }
        local_120.Position = Movement.GetPosition();
        if (local_23)
        {
            local_120.Position = Vaulting.GetProbPath().GetPosition(-1);
        }
        else
        {
            if (Movement.GetFloorInfo().bHasFloor && (!(Movement.GetbAirborne() || Movement.GetbWallRunning())))
            {
                local_120.Position = Movement.GetFloorInfo().OnFloorPosition;
            }
        }
        local_120.Rot = Movement.GetRotation();
        FVector local_144;
        if (int(local_122) == 2)
        {
            local_136 = Movement.GetRotation().GetForwardVector();
            local_144 = local_136;
        }
        else
        {
            local_144 = local_8;
        }
        local_144.GetSafeNormal2D();
        local_120.ProbeDir = local_136;
        local_120.Shape = Collision.GetScaledShape();
        local_120.Channel = this.GetCollisionChannel();
        local_120.Entity = Entity;
        local_120.Initialize(Vaulting, VaultingConfig);
        int local_18_2 = local_120.EnableMask();
        if ((local_18_2 == int(VaultInfoCache.LastEnableMask) && ((VaultInfoCache.LastProbeTime.opCmp(0.0) > 0))) && ((((FFPTime(FixedTime.Time) - VaultInfoCache.LastProbeTime)).opCmp(local_120.VaultProbeConfig.ProbeInterval) < 0)))
        {
            return;
        }
        VaultInfoCache.LastEnableMask = local_18_2;
        FVaultPath local_200 = this.ProbeEnvObstacle(local_120, MovementParam, Vaulting, VaultInfoCache, VaultingConfig, FixedTime);
        local_200.VaultStartState = local_120.VaultStartState;
        bool local_201 = false;
        bool local_202 = false;
        if (local_23)
        {
            if (int(local_200.VaultActionType) == 1)
            {
                local_201 = this.VerifyMovementPath(Entity, Transform, Collision.GetScaledShape(), Vaulting, VaultingConfig, local_200, MovementParam.StepHeight);
            }
        }
        else
        {
            if (int(local_200.VaultActionType) != 0)
            {
                local_201 = this.VerifyMovementPath(Entity, Transform, Collision.GetScaledShape(), Vaulting, VaultingConfig, local_200, MovementParam.StepHeight);
            }
            else
            {
                if (int(Vaulting.VaultActionType()) == 3)
                {
                    local_202 = true;
                }
            }
        }
        if (local_201 || local_202)
        {
            FCE_VaultRequest local_210;
            FFPTime local_22 = FFPTime(-1);
            local_210.EnsureVaultActionType = EVaultActionType(Vaulting.VaultActionType());
            local_210.bIsDualAction = local_23;
        }
        if (!(local_200.bNoProbeCD))
        {
            VaultInfoCache.LastProbeTime = FixedTime.Time;
        }
        return;
    }
    UFUNCTION()
    void Job_CheckAndApplyVaultAction(const FCE_VaultRequest &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        int local_10 = 0;
        int local_32 = 0;
        int local_38 = 0;
        int local_44 = 0;
        FC_CharacterMovementParam local_50;
        int local_122 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_10))
        {
            return;
        }
        if (FFPTime(local_10.GetLastRequestTime()).opCmp(0.0) >= 0 && ((((FFPTime(FixedTime.Time) - local_10.GetLastRequestTime())).opCmp(this.RequestIntervalLimit) < 0)))
        {
            return;
        }
        if (int(local_10.VaultActionType()) != int(Event.EnsureVaultActionType))
        {
            return;
        }
        if (local_10.GetbIsVaultingOver())
        {
            return;
        }
        if (local_10.GetbIsMovingUpstairs())
        {
            if (!(Event.bIsDualAction))
            {
                return;
            }
            if (!(local_10.GetbEnableDualUpstairs()))
            {
                return;
            }
            if (int(Event.ProbPath.VaultActionType) != 1)
            {
                return;
            }
        }
        bool local_26 = false;
        bool local_11 = ECS::GetRuntimeInfo().IsClient || Event.IsCancelRequest();
        if (local_11)
        {
            bool local_22;
            local_22 = true;
            local_26 = local_22;
        }
        else
        {
            bool local_22;
            if (!(local_32))
            {
                local_11 = false;
            }
            else
            {
                local_11 = local_38;
            }
            if (!(local_11))
            {
                local_22 = false;
            }
            else
            {
                local_22 = local_44;
            }
            if (!(local_22))
            {
                local_11 = false;
            }
            else
            {
                local_11 = local_50;
            }
            if (local_11)
            {
                local_26 = this.VerifyMovementPath(local_4, local_32, local_38.GetScaledShape(), local_10, local_44, Event.ProbPath, local_50.StepHeight);
            }
        }
        if (!(local_26))
        {
            return;
        }
        Modify local_60;
        FC_CharacterVaulting& local_62 = local_60.opCall();
        Has local_116;
        if (local_62)
        {
            EVaultActionType local_63;
            local_63 = Event.ProbPath.VaultActionType;
            local_62.SetLastRequestTime(FixedTime.Time);
            if (Event.bIsDualAction)
            {
                local_62.SetDualProbPath(Event.ProbPath);
            }
            else
            {
                local_62.SetProbPath(Event.ProbPath);
                FVaultPath local_88;
                local_62.SetDualProbPath(local_88);
                FFPTime local_92;
                if (int(local_63) != 0)
                {
                    local_92 = (FFPTime(FixedTime.Time) + FFPTime(::Vaulting::GetClearVaultTriggerDelay()));
                }
                else
                {
                    local_92 = FFPTime(-1.0);
                }
                local_62.SetClearInfoTime(local_92);
            }
            Get local_96;
            const FC_RuntimeMountSeatInfo& local_98 = local_96.opCall();
            if (local_98)
            {
                for (auto& local_112 : local_98.GetRiddenByEntities())
                {
                    local_112;
                    if (!(local_116.opCall()))
                    {
                        continue;
                    }
                    local_122.SetOffsetVer0(Event.ProbPath.GetPositionOffset(0).Z);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ClearOldVaultAction(FC_CharacterVaulting &inout Vaulting, const FCS_FixedTime &inout FixedTime) const
    {
        if (Vaulting.GetbIsVaultingOver() || Vaulting.GetbIsMovingUpstairs())
        {
            return;
        }
        FFPTime local_4 = FFPTime(Vaulting.GetClearInfoTime());
        if (local_4.opCmp(0.0) >= 0 && ((FFPTime(FixedTime.Time).opCmp(Vaulting.GetClearInfoTime()) > 0)))
        {
            Vaulting.ClearVaultAction();
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateWallRunCoolDown(FC_CharacterVaulting &inout Vaulting, const FC_CharacterVaultingConfig &inout VaultingConfig, const FC_CharacterMovement &inout Movement) const
    {
        if (Vaulting.GetbIsStartingWallRun() || Movement.GetbWallRunning())
        {
            Vaulting.OnWallRunning(VaultingConfig);
            return;
        }
        if (!(Movement.GetbAirborne()) && (int(Vaulting.VaultActionType()) == 0))
        {
            Vaulting.OnWallRunLanded();
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnInactiveCharacterClearVaultAction(const FECSEntity &inout Entity, const FC_CharacterVaulting &inout Vaulting) const
    {
        if (!(Vaulting) || (int(Vaulting.VaultActionType()) == 0))
        {
            return;
        }
        Modify local_10;
        FC_CharacterVaulting& local_12 = local_10.opCall();
        if (local_12)
        {
            local_12.ClearVaultAction();
        }
        return;
    }
    UFUNCTION()
    void Job_GenerateVelocityAndTurn_WallRunning(FC_Rigidbody &inout Rigidbody, FC_CharacterMovementControl &inout CharacterMovementControl, const FC_CharacterMovement &inout CharacterMovement, const FC_CharacterMovementParam &inout CharacterMovementParam, const FC_CharacterVaulting &inout CharacterVaulting, const FCS_FixedTime &inout FixedTime) const
    {
        if (!(CharacterMovement.GetbWallRunning()) || (int(CharacterVaulting.VaultActionType()) != 3))
        {
            return;
        }
        float32 local_7 = FixedTime.DeltaTime;
        FVector3f local_13 = CharacterVaulting.Normal0();
        FRotator local_20 = CharacterMovementControl.GetDesiredRotation();
        if (!(local_13.IsZero()))
        {
            float32 local_6 = local_13.opNeg().Rotation().Yaw;
            local_20.Yaw = local_6;
        }
        else
        {
            XWarning(ELog(0), FString().Append("WallRunMoveMode WallNormal is zero : Frame: ").Append(FixedTime.Frame));
        }
        if (CharacterMovementControl.GetSilenceDefaultTurnCounter() == 0)
        {
            float32 local_34;
            float32 local_33 = CharacterMovementParam.TurnSpeed;
            float32 local_6_2 = CharacterMovementControl.GetMovementTurnSpeedScale();
            local_33 = local_33 * local_6_2;
            float32 local_32 = CharacterMovementParam.TurnAccel;
            local_6_2 = CharacterMovementControl.GetMovementTurnAccelScale();
            local_32 = local_32 * local_6_2;
            float local_26 = CharacterMovement.GetRotation().Rotator().Yaw;
            FRotator local_52 = FRotator(0.0, float32(local_26), 0.0);
            local_6_2 = FMathUtils::ConvertLerpRatio(CharacterMovementParam.TurnLerpRatio, ECS::GetECSFixedFrameRate(), 64);
            FRotator local_40 = local_33 > 0.0f ? FMath::RInterpConstantTo(local_52, (FMath::RInterpTo(local_52, local_20, local_6_2, 1.0f)), local_7, local_33) : local_52;
            float local_56;
            float local_54 = local_40.Yaw - local_52.Yaw;
            float32 local_57 = FRotator3f::NormalizeAxis(float32(local_54));
            local_54 = Rigidbody.GetAngularVelocity().Yaw;
            float32 local_65 = float32(local_54);
            local_34 = local_57 / local_7;
            if (((local_34 - local_65) * local_57) > 0.0f)
            {
                local_34 = FMath::FInterpConstantTo(local_65, local_34, local_7, local_32);
                local_26 = (local_34 * local_7);
                local_40.Yaw = (local_52.Yaw + local_26);
            }
            FRotator local_74 = Rigidbody.GetAngularVelocity();
            local_74.Yaw = local_34;
            local_56 = 0.0;
            local_74.Pitch = 0.0;
            local_26 = 0.0;
            local_74.Roll = 0.0;
            Rigidbody.SetAngularVelocity(local_74);
        }
        CharacterMovementControl.SetDesiredRotation(local_20);
        FVector3f local_80 = FVector3f::UpVector.VectorPlaneProject(local_13).GetSafeNormal(1e-8f, FVector3f::ZeroVector);
        FVector local_92 = (CharacterVaulting.Location0() - CharacterMovement.GetPosition());
        float32 local_68 = FVector3f(local_92).DotProduct(local_13) / local_7;
        float32 local_32_2 = CharacterMovementParam.WallRunSnapSpeed;
        local_68 = FMath::Clamp(local_68, -CharacterMovementParam.WallRunSnapSpeed, local_32_2);
        local_32_2 = CharacterMovementParam.WallRunSpeed;
        FVector3f local_96 = ((local_80 * local_32_2) + (local_13 * local_68));
        FVector local_92_2 = FVector(local_96).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        Rigidbody.SetVelocity((local_92_2 * CharacterMovementParam.WallRunSpeed));
        return;
    }
    UFUNCTION()
    void Run_Job_ProbeEnvObstacle() const
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
        int local_216 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        FECSRuntimeView::Include<FC_Collision>(local_48).opCall();
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
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_130 = local_48.Iterator();
        for (; local_130.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_169 = FECSEntityScopeCycleCounter(local_130.Proceed());
            this.Job_ProbeEnvObstacle(local_172, local_174, local_180, local_186, local_192, local_198, local_204, local_210, local_216, local_6);
            MarkModifiedIfDirty local_224;
            local_224.opCall(local_210);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CheckAndApplyVaultAction() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_VaultRequest> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_VaultRequest& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_CheckAndApplyVaultAction(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearOldVaultAction() const
    {
        int local_6 = 0;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
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
                this.Job_ClearOldVaultAction(local_40, local_6);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_86).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_86.Iterator();
        for (; local_138.CanProceed;)
        {
            const FECSEntity& local_174 = local_138.Proceed();
            ++local_104;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_174.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_174);
            this.Job_ClearOldVaultAction(local_40, local_6);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateWallRunCoolDown() const
    {
        int local_36 = 0;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_56;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_UpdateWallRunCoolDown(local_36, local_42, local_48);
                local_56.opCall(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_94).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_120 = 0;
        FECSRuntimeViewIterator local_154 = local_94.Iterator();
        for (; local_154.CanProceed;)
        {
            const FECSEntity& local_190 = local_154.Proceed();
            ++local_120;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_190.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_190);
            this.Job_UpdateWallRunCoolDown(local_36, local_42, local_48);
            local_56.opCall(local_36);
        }
        local_2.UpdateCachedEntityCount(local_120);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnInactiveCharacterClearVaultAction() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCharacterVaultingOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnInactiveCharacterClearVaultAction(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_GenerateVelocityAndTurn_WallRunning() const
    {
        int local_6 = 0;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        int local_58 = 0;
        int local_64 = 0;
        MarkModifiedIfDirty local_72;
        MarkModifiedIfDirty local_76;
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
                this.Job_GenerateVelocityAndTurn_WallRunning(local_40, local_46, local_52, local_58, local_64, local_6);
                local_72.opCall(local_40);
                local_76.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_114 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Include local_134;
        local_134.opCall();
        Include local_138;
        local_138.opCall();
        Exclude(local_114).opCall();
        Exclude(local_114).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_148 = 0;
        FECSRuntimeViewIterator local_182 = local_114.Iterator();
        for (; local_182.CanProceed;)
        {
            const FECSEntity& local_218 = local_182.Proceed();
            ++local_148;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_218.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_218);
            FECSEntity::Get<FC_CharacterMovement> local_56 = FECSEntity::Get<FC_CharacterMovement>(local_218);
            this.Job_GenerateVelocityAndTurn_WallRunning(local_40, local_46, local_52, local_58, local_64, local_6);
            local_72.opCall(local_40);
            local_76.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_148);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

namespace Vaulting
{
bool UseVaultingSystem()
{
    return CVar_Debug_UseVaultingSystem.GetBool();
}
bool GetEnableWallRunByDefault() property
{
    return CVar_Debug_EnableWallRunByDefault.GetBool();
}
bool GetEnableMoveUpstairsByDefault() property
{
    return CVar_Debug_EnableMoveUpstairsByDefault.GetBool();
}
bool GetEnableVaultOverByDefault() property
{
    return CVar_Debug_EnableVaultOverByDefault.GetBool();
}
bool GetEnableLeapOffByDefault() property
{
    return CVar_Debug_EnableLeapOffByDefault.GetBool();
}
bool GetEnableAttemptWallRunByDefault() property
{
    return CVar_Debug_EnableAttemptWallRunByDefault.GetBool();
}
float32 GetClearVaultTriggerDelay() property
{
    return CVar_Debug_ClearVaultTriggerDelay.GetFloat();
}
bool GetNeedCheckEnableReachUp() property
{
    return CVar_Debug_CheckEnableVaultAction.GetBool();
}
}
FCollisionQueryParams CreateQueryParams(const FECSEntity &inout Entity)
{
    FCollisionQueryParams local_38;
    local_38.AddIgnoredEntityId(Entity.GetIdValue());
    local_38.bReturnFaceIndex = true;
    return local_38;
}
