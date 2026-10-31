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
        if (this.TraceBorderTest(StartPos, EndPos))
        {
            return false;
        }
        float local_10 = Shape.GetExtent().Z;
        float32 local_11 = float32(local_10);
        FVector local_8(FVector::UpVector);
        FVector local_8_2 = (StartPos + (local_8 * local_11));
        FVector local_24_2(FVector::UpVector);
        FVector local_24_3 = (EndPos + (local_24_2 * local_11));
        FVector local_30 = FVector(StartPos.X, StartPos.Y, ((EndPos.Z + ShapeLiftUp) - local_11));
        float local_10_5 = EndPos.X;
        FVector local_18_2 = FVector(local_10_5, EndPos.Y, local_30.Z);
        FHitResult local_112;
        int local_114 = int(this.GetCollisionChannel());
        FCollisionQueryParams local_190 = ::CreateQueryParams(Entity);
        bool local_200 = FPhysicsUtils::LineTraceSingle(Entity, true, EPhysicsTraceTag(20), local_112, local_8_2, local_30, ECollisionChannel(local_114), local_190, FCollisionResponseParams());
        if (local_200)
        {
            return false;
        }
        bool local_200_2 = FPhysicsUtils::LineTraceSingle(Entity, true, EPhysicsTraceTag(20), local_112, local_30, local_24_3, ECollisionChannel(local_114), local_190, FCollisionResponseParams());
        if (local_200_2)
        {
            return false;
        }
        bool local_200_3 = FPhysicsUtils::LineTraceSingle(Entity, true, EPhysicsTraceTag(20), local_112, local_18_2, local_24_3, ECollisionChannel(local_114), local_190, FCollisionResponseParams());
        if (local_200_3)
        {
            return false;
        }
        return true;
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
        float32 local_11 = float32(Shape.GetExtent().Z);
        FVector local_8 = (StartPos + (FVector(FVector::UpVector) * (ShapeLiftUp * 0.5f)));
        FVector local_24_2 = (FVector(FVector::UpVector) * (ShapeLiftUp * 0.5f));
        FVector local_18 = (EndPos + local_24_2);
        FCollisionShape local_39 = FCollisionShape::MakeCapsule(1.0f, (local_11 - (ShapeLiftUp * 0.5f)));
        FHitResult local_106;
        ECollisionChannel local_108 = this.GetCollisionChannel();
        FCollisionQueryParams local_184 = ::CreateQueryParams(Entity);
        FCollisionResponseParams local_192;
        bool local_195 = FPhysicsUtils::SweepSingle(Entity, true, EPhysicsTraceTag(20), local_106, local_8, local_18, FQuat::Identity, local_108, local_39, local_184, local_192);
        if (local_195)
        {
            return false;
        }
        return true;
    }
    ECollisionChannel GetCollisionChannel() const
    {
        return ECollisionChannel(18);
    }
    FVaultPath ProbeForLeapOff(const FVaultProbeContext &inout Context, const FC_CharacterMovementParam &inout MovementParam, const FC_CharacterVaulting &inout Vaulting, const FC_CharacterVaultingConfig &inout VaultingConfig, const FForwardProbeResult &inout ForwardProbeResult) const
    {
        float32 local_119;
        float32 local_243;
        FVaultPath __r;
        FCharacterVaultProbeConfig local_2 = Context.VaultProbeConfig;
        FVaultPath local_28;
        if (!(::Vaulting::GetEnableLeapOffByDefault()))
        {
        }
        else
        {
            if ((int(Context.VaultStartState) != 0 && (int(Context.VaultStartState) != 1)))
            {
            }
            else
            {
                float32 local_113;
                float32 local_111;
                float32 local_110;
                FHitResult local_100;
                FSceneQueryCacheParam local_109;
                local_110 = local_2.ForwardCheckDistance;
                local_111 = local_2.LeapOffForwardCheckDistance;
                if (local_111 > 0.0f)
                {
                    local_110 = local_2.LeapOffForwardCheckDistance;
                }
                local_113 = Context.Shape.GetCapsuleRadius();
                int local_114 = 0;
                for (; local_114 < ForwardProbeResult.ForwardHitResults.Num(); ++local_114)
                {
                    const FHitResult& local_116 = ForwardProbeResult.ForwardHitResults[local_114];
                    local_111 = local_116.Time;
                    if (local_111 > 1.0f)
                    {
                        continue;
                    }
                    local_111 = local_116.Distance - local_113;
                    if (local_111 < local_110)
                    {
                        local_110 = local_111;
                    }
                }
                if (local_110 < local_113)
                {
                }
                else
                {
                    float local_126;
                    local_111 = MovementParam.MaxHoverHeight;
                    float32 local_112_2 = local_2.LeapOffStartHeight;
                    if (local_112_2 > 0.0f)
                    {
                        local_112_2 = local_2.LeapOffStartHeight;
                        local_111 = FMath::Max(local_112_2, MovementParam.MaxHoverHeight);
                    }
                    local_112_2 = FMath::Tan(FMath::DegreesToRadians(MovementParam.WalkableSlopDegree)) * local_110;
                    const TArray<int>& local_122 = local_2.GetLevelSeparationHeights(EVaultActionType(5));
                    if (local_122.Num() > 0)
                    {
                        local_119 = (local_122[(local_122.Num() - 1)]);
                    }
                    else
                    {
                        local_119 = local_111;
                    }
                    local_126 = Context.FootPosition.Z;
                    float local_128 = local_110;
                    FVector local_140_2 = (Context.Position + (Context.ProbeDir * local_128));
                    float32 local_118 = local_119 + local_112_2;
                    local_128 = local_118;
                    local_128 = local_126 - local_128;
                    float local_162;
                    FVector local_134 = FVector(local_140_2.X, local_140_2.Y, local_128);
                    FCollisionQueryParams local_238 = ::CreateQueryParams(Context.Entity);
                    bool local_29 = this.ProbeLineTrace(local_100, Context.Entity, true, EPhysicsTraceTag(20), local_140_2, local_134, Context.Channel, local_238, local_109);
                    if (local_29)
                    {
                        local_243 = float32((local_126 - local_100.ImpactPoint.Z));
                    }
                    else
                    {
                        local_243 = (local_119 + local_112_2) * 2.0f;
                    }
                    if (local_243 < local_111)
                    {
                    }
                    else
                    {
                        if (local_29)
                        {
                            FVector local_146_2 = (Context.ProbeDir * local_110);
                            local_140_2 = (Context.Position + (local_146_2 * 0.5));
                            float32 local_117_2 = local_112_2 * 0.5f;
                            local_128 = local_117_2;
                            if (this.ProbeLineTrace(local_100, Context.Entity, true, EPhysicsTraceTag(20), local_140_2, FVector(local_140_2.X, local_140_2.Y, (local_126 - local_128)), Context.Channel, local_238, local_109))
                            {
                                local_162 = local_126 - local_100.ImpactPoint.Z;
                                local_117_2 = float32(local_162) / 0.5f;
                                local_243 = local_243 - FMath::Clamp(local_117_2, 0.0f, local_112_2);
                                if (local_243 < local_111)
                                {
                                }
                                else
                                {
                                }
                            }
                        }
                        local_28.VaultActionType = EVaultActionType(5);
                        local_28.VaultActionIndex = 0;
                        auto local_258 = local_122.Iterator();
                        for (; local_258.CanProceed;)
                        {
                            if (local_258.Proceed() > local_243)
                            {
                                break;
                            }
                            ++local_28.VaultActionIndex;
                        }
                        local_28.Start = Context.Position;
                        local_28.Rotation = Context.Rot;
                        FVaultPathPoint local_272;
                        FVector local_152_2 = (local_140_2 - Context.Position);
                        FVector local_146_3 = (FVector(FVector::DownVector) * local_243);
                        local_272.PositionOffset = FVector3f((local_152_2 + local_146_3));
                        local_272.Normal = FVector3f(local_100.ImpactNormal);
                        local_28.PathPoints.Add(local_272);
                    }
                }
            }
        }
        return __r;
    }
    FVaultPath ProbeForWallRun(const FVaultProbeContext &inout Context, const FC_CharacterMovementParam &inout MovementParam, const FC_CharacterVaulting &inout Vaulting, const FC_CharacterVaultingConfig &inout VaultingConfig, const FForwardProbeResult &inout ForwardProbeResult) const
    {
        bool local_29;
        FVaultPath __r;
        FCharacterVaultProbeConfig local_2 = Context.VaultProbeConfig;
        FVaultPath local_28;
        bool local_30 = Vaulting.GetEnableStableWallRun(VaultingConfig);
        if (!(local_30) && Vaulting.GetWallRunInfo().GetbInAttemptCoolDown() && (int(Context.VaultStartState) != 2))
        {
        }
        else
        {
            FHitResult local_100;
            float local_104 = Context.Position.Z + local_2.MinWallRunStartHeight;
            float32 local_105 = float32(local_104);
            float32 local_112 = local_2.ForwardCheckDistance + ((Context.ZExtent + local_2.MinWallRunStartHeight) / FMath::Tan(FMath::DegreesToRadians(MovementParam.WallRunMinSlopeDegree)));
            float32 local_111 = FMath::Cos(FMath::DegreesToRadians(local_2.MaxAngleToWallNormalForWallRun));
            float32 local_114 = FMath::Cos(FMath::DegreesToRadians(MovementParam.WallRunMinSlopeDegree));
            float32 local_115 = FMath::Cos(FMath::DegreesToRadians(MovementParam.WallRunMaxSlopeDegree));
            FVector3f local_122 = FVector3f(Context.ProbeDir);
            int local_123 = 0;
            for (; local_123 < ForwardProbeResult.ForwardHitResults.Num(); ++local_123)
            {
                local_100 = ForwardProbeResult.ForwardHitResults[local_123];
                if (local_100.TraceStart.Z < local_105)
                {
                    continue;
                }
                local_104 = ((local_105 - local_2.MinWallRunStartHeight) + local_2.MaxWallRunStartHeight);
                if (local_100.TraceStart.Z > local_104)
                {
                    break;
                }
                if ((local_100.Time > 1.0f || (local_100.Distance > local_112)))
                {
                    continue;
                }
                if ((local_100.Normal.Z < local_115 || ((local_100.Normal.Z > local_114))))
                {
                    continue;
                }
                if (FVector3f(local_100.Normal).GetSafeNormal2D(1e-8f, FVector3f::ZeroVector).DotProduct(local_122.opNeg()) < local_111)
                {
                    continue;
                }
                if (!(FHitResultUtils::CanCharacterWallRunOn(local_100)))
                {
                    continue;
                }
                local_28.VaultActionType = EVaultActionType(3);
                break;
            }
            if (int(local_28.VaultActionType) == 0)
            {
            }
            else
            {
                if (!(local_30))
                {
                    if (Vaulting.GetWallRunInfo().GetbInAttemptCoolDown() && ((Context.Position.Z > Vaulting.GetWallRunInfo().GetWallRunMaxZ())))
                    {
                        local_28.VaultActionType = EVaultActionType(4);
                    }
                    else
                    {
                        local_29 = !(Vaulting.GetWallRunInfo().GetbInAttemptCoolDown());
                        if (!(local_29))
                        {
                            local_29 = false;
                        }
                        else
                        {
                            local_104 = Context.Position.Z;
                            local_104 = local_104 + local_2.WallRunAttemptHeight;
                            local_29 = (local_100.ImpactPoint.Z > local_104);
                        }
                        if (local_29)
                        {
                            local_28.VaultActionType = EVaultActionType(4);
                        }
                    }
                }
                TArray<FHitResult> local_136;
                local_104 = Context.Shape.GetExtent().Size2D();
                float32 local_109 = float32(local_104);
                local_104 = local_100.Normal.Size2D();
                float local_146 = local_100.Normal.Y / local_104;
                FVector local_144 = FVector(local_100.Normal.X / local_104, local_146, 0.0);
                FVector local_172 = (FVector(local_100.ImpactPoint) + (local_144 * ((local_109 * 1.5f) + ((Context.ZExtent * FMath::Abs(local_100.Normal.Z)) / local_104))));
                FCollisionQueryParams local_248 = ::CreateQueryParams(Context.Entity);
                bool local_31 = FPhysicsUtils::SweepMulti(Context.Entity, true, EPhysicsTraceTag(20), local_136, local_100.ImpactPoint, local_172, Context.Rot, Context.Channel, Context.Shape, local_248, FCollisionResponseParams());
                if (local_31)
                {
                    for (auto& local_272 : local_136)
                    {
                        if (local_272.GetbStartPenetrating() || !(local_272.GetbBlockingHit()) || (local_272.Distance < this.SMALL_TRACE_OFFSET))
                        {
                            continue;
                        }
                        FVector local_166_2 = FVector(local_272.Location);
                        local_172 = (local_166_2 - (local_144 * this.SMALL_TRACE_OFFSET));
                        break;
                    }
                }
                FHitResult local_338;
                if (!(FPhysicsUtils::SweepSingle(Context.Entity, true, EPhysicsTraceTag(20), local_338, local_172, local_100.ImpactPoint, Context.Rot, ECollisionChannel(Context.Channel), Context.Shape, local_248, FCollisionResponseParams())) || local_338.GetbStartPenetrating() || (local_338.Distance < this.SMALL_TRACE_OFFSET))
                {
                    local_28.VaultActionType = EVaultActionType(0);
                }
                else
                {
                    FVector local_166_3 = FVector(local_338.Location);
                    FVector local_160_2 = (local_144 * this.SMALL_TRACE_OFFSET);
                    FVector local_152_2 = (local_166_3 + local_160_2);
                    local_28.Start = Context.Position;
                    local_28.Rotation = Context.Rot;
                    FVaultPathPoint local_354;
                    local_354.PositionOffset = FVector3f((local_152_2 - Context.Position));
                    local_354.Normal = FVector3f(local_338.Normal);
                    local_28.PathPoints.Add(local_354);
                }
            }
        }
        return __r;
    }
    bool ProbeLineTrace(FHitResult &inout OutHit, const FECSEntity &inout Entity, const bool bRollback, const EPhysicsTraceTag TraceTag, const FVector &inout TraceStart, const FVector &inout TraceEnd, const ECollisionChannel Channel, FCollisionQueryParams &inout QueryParams, const FSceneQueryCacheParam &inout CacheParam) const
    {
        bool local_1 = false;
        if (CVar_Debug_VaultingSystem_UseSceneQueryCache.GetBool())
        {
            bool local_2 = true;
            ModifyOrAdd local_6;
            local_1 = local_6.opCall().Cache.LineTraceSingle(Entity, bRollback, EPhysicsTraceTag(TraceTag), OutHit, TraceStart, TraceEnd, ECollisionChannel(Channel), QueryParams, FVector3f::ZeroVector, local_2, CacheParam);
        }
        else
        {
            FCollisionResponseParams local_15;
            local_1 = FPhysicsUtils::LineTraceSingle(Entity, bRollback, EPhysicsTraceTag(TraceTag), OutHit, TraceStart, TraceEnd, ECollisionChannel(Channel), QueryParams, local_15);
        }
        if (!(local_1))
        {
        }
        return local_1;
    }
    bool HitResultWalkable(const FHitResult &inout HitResult, const float32 NormalZThres) const
    {
        return ((FHitResultUtils::CanCharacterStandOn(HitResult) && FHitResultUtils::CanCharacterStepUpOn(HitResult)) && (HitResult.ImpactNormal.Z >= NormalZThres));
    }
    FForwardProbeResult ProbeForwardRaycasts(const FVaultProbeContext &inout Context) const
    {
        bool local_353;
        float32 local_360;
        FForwardProbeResult __r;
        FCharacterVaultProbeConfig local_2 = Context.VaultProbeConfig;
        FForwardProbeResult local_142;
        local_142.NearestResult.Time = 2.0f;
        local_142.FurthestResultUponNearest.Time = 0.0f;
        FCollisionQueryParams local_220 = ::CreateQueryParams(Context.Entity);
        FVector local_234 = (Context.FootPosition + (FVector(FVector::UpVector) * local_2.MinVaultHeight));
        FVector local_242_2 = (Context.ProbeDir * (local_2.ForwardCheckDistance + local_2.MaxVaultWidth));
        FVector local_228 = (local_234 + local_242_2);
        float32 local_221 = local_2.GetMaxReachUpHeight() - local_2.MinVaultHeight;
        float32 local_255 = local_221 / local_2.ForwardRaycastInterval;
        int local_257 = FMath::CeilToInt(local_255) + 1;
        float32 local_255_2 = local_221 / (local_257 - 1);
        float32 local_259 = (Context.ZExtent * 2.0f) / local_255_2;
        int local_258 = local_257 + FMath::CeilToInt(local_259);
        FVector local_242_3 = (FVector(FVector::UpVector) * local_255_2);
        FSceneQueryCacheParam local_275;
        local_275.bEnableCenterOffsetXY = true;
        local_275.bEnableCenterOffsetZ = true;
        local_275.CustomExpandingExtent = FVector3f(local_2.ForwardCheckDistance, local_2.ForwardCheckDistance, Context.ZExtent);
        FVector local_248 = (local_242_3 * local_258);
        local_275.ExtraSweepOffset = FVector3f(local_248);
        int local_281 = 0;
        for (; local_281 < local_258; ++local_281)
        {
            if (local_281 > 0)
            {
                local_234 += local_242_3;
                local_228 += local_242_3;
            }
            float local_236_5 = local_242_3.Z;
            float local_284 = local_281;
            local_236_5 = local_236_5 * local_284;
            local_284 = Context.ZExtent + local_236_5;
            local_275.CustomExpandingExtent.Z = float32(local_284);
            local_284 = local_242_3.Z * (local_258 - local_281);
            local_275.ExtraSweepOffset.Z = float32(local_284);
            FHitResult local_352;
            bool local_356 = this.ProbeLineTrace(local_352, Context.Entity, true, EPhysicsTraceTag(20), local_234, local_228, Context.Channel, local_220, local_275);
            local_142.ForwardHitResults.Add(local_352);
            if (local_356)
            {
                local_142.SumImpactNormal += FVector3f(local_352.ImpactNormal);
            }
            if (!(Context.bEnableReachUp))
            {
                if (local_356 && ((local_352.Distance <= local_2.ForwardCheckDistance)) && (local_352.Time < local_142.NearestResult.Time))
                {
                    local_142.NearestResult = local_352;
                }
                continue;
            }
            if (local_352.Time >= local_142.FurthestResultUponNearest.Time)
            {
                local_142.FurthestResultUponNearest = local_352;
            }
            local_353 = !(local_356);
            if (local_353)
            {
                local_353 = true;
            }
            else
            {
                if (local_142.NearestResult.Time <= 1.0f)
                {
                    float32 local_222_7 = local_142.NearestResult.Distance;
                    local_360 = local_222_7 + local_2.MinStandableWidth;
                }
                else
                {
                    local_360 = local_2.ForwardCheckDistance;
                }
                local_353 = (local_352.Distance > local_360);
            }
            if (local_353)
            {
                if (local_142.SumPassableHeight >= 0.0f)
                {
                    float32 local_222_8 = float32(local_242_3.Z);
                    local_360 = local_142.SumPassableHeight;
                    local_142.SumPassableHeight = (local_360 + local_222_8);
                    if (local_142.SumPassableHeight >= (Context.ZExtent * 2.0f))
                    {
                        break;
                    }
                }
                else
                {
                    local_142.SumPassableHeight = float32(local_242_3.Z);
                    if (local_281 > 0 && (local_142.ForwardHitResults[(local_281 - 1)].Time <= 1.0f))
                    {
                        FVector local_266(local_142.ForwardHitResults[(local_281 - 1)].ImpactPoint);
                        float32 local_361_2 = this.SMALL_TRACE_OFFSET;
                        FVector local_248_2 = (local_266 + (Context.ProbeDir * local_361_2));
                        local_266 = (local_248_2 + local_242_3);
                        FHitResult local_440;
                        if (this.ProbeLineTrace(local_440, Context.Entity, true, EPhysicsTraceTag(20), local_266, local_248_2, Context.Channel, local_220, local_275))
                        {
                            local_361_2 = local_440.Distance;
                            local_142.SumPassableHeight = local_361_2;
                        }
                    }
                }
            }
            else
            {
                if (local_142.SumPassableHeight >= 0.0f)
                {
                    FVector local_374(local_352.ImpactPoint);
                    FVector local_254_2 = (Context.ProbeDir * this.SMALL_TRACE_OFFSET);
                    FVector local_368 = (local_374 + local_254_2);
                    FVector local_248_3 = (local_368 - local_242_3);
                    FHitResult local_440;
                    if (this.ProbeLineTrace(local_440, Context.Entity, true, EPhysicsTraceTag(20), local_248_3, local_368, Context.Channel, local_220, local_275))
                    {
                        float32 local_361_3 = local_440.Distance;
                        local_142.SumPassableHeight = (local_142.SumPassableHeight + local_361_3);
                    }
                    float32 local_361_4 = Context.ZExtent;
                    if (local_142.SumPassableHeight >= (local_361_4 * 2.0f))
                    {
                        break;
                    }
                }
                local_142.SumPassableHeight = -1.0f;
                if (local_352.Time < local_142.NearestResult.Time)
                {
                    local_142.NearestResult = local_352;
                    local_142.FurthestResultUponNearest = local_352;
                }
            }
        }
        return __r;
    }
    void VerifyAngleForVault(const FVaultProbeContext &inout Context, const FForwardProbeResult &inout ForwardProbeResult, const FC_CharacterVaultInfoCache &inout VaultInfoCache, const FCS_FixedTime &inout FixedTime, bool &inout bAngleFitReachUp, bool &inout bAngleFitWallRun) const
    {
        FCharacterVaultProbeConfig local_2 = Context.VaultProbeConfig;
        FCollisionQueryParams local_78 = ::CreateQueryParams(Context.Entity);
        float32 local_80 = -ForwardProbeResult.SumImpactNormal.X;
        float32 local_81 = -ForwardProbeResult.SumImpactNormal.Y;
        float32 local_82 = FMath::Atan2(local_81, local_80);
        float32 local_80_2 = FMath::DegreesToRadians(local_2.MaxAngleToWallNormalForVault);
        FFPTime local_86 = local_2.KeepSteerTimeForVault;
        int local_89 = FMath::RoundToInt((local_86 / FixedTime.DeltaTime));
        bAngleFitReachUp = VaultInfoCache.CheckSteerYawDiff(local_82, local_80_2, local_89);
        float32 local_79 = FMath::DegreesToRadians(local_2.MaxAngleToWallNormalForWallRun);
        FFPTime local_86_2 = local_2.KeepSteerTimeForWallRun;
        int local_84 = FMath::RoundToInt((local_86_2 / FixedTime.DeltaTime));
        if (int(Context.VaultStartState) == 2)
        {
            local_84 = 1;
        }
        bAngleFitWallRun = VaultInfoCache.CheckSteerYawDiff(local_82, local_79, local_84);
        if ((Context.bEnableReachUp && !(bAngleFitReachUp) && VaultInfoCache.IsSteerYawBufferEnough(local_89)) || (Context.bEnableWallRun && !(bAngleFitWallRun) && VaultInfoCache.IsSteerYawBufferEnough(local_84)))
        {
            bool local_225;
            bool local_97;
            FSceneQueryCacheParam local_106;
            local_106.bEnableCenterOffsetXY = true;
            local_106.bEnableCenterOffsetZ = true;
            local_106.CustomExpandingExtent = FVector3f(local_2.ForwardCheckDistance, local_2.ForwardCheckDistance, Context.ZExtent);
            FVector local_128 = (FVector::UpVector.CrossProduct(Context.ProbeDir) * Context.Shape.GetExtent().Size2D());
            FVector local_122 = (FVector(ForwardProbeResult.NearestResult.ImpactPoint) - (Context.ProbeDir * 30.0));
            FVector local_140 = Context.ProbeDir;
            FVector local_116_2 = (local_140 * local_2.ForwardCheckDistance);
            FVector local_152(ForwardProbeResult.NearestResult.ImpactPoint);
            FVector local_158(ForwardProbeResult.NearestResult.ImpactPoint);
            FHitResult local_224;
            local_225 = false;
            local_97 = this.ProbeLineTrace(local_224, Context.Entity, true, EPhysicsTraceTag(20), (local_122 - local_128), ((local_122 - local_128) + local_116_2), ECollisionChannel(Context.Channel), local_78, local_106);
            if (local_97)
            {
                local_225 = true;
                local_152 = local_224.ImpactPoint;
            }
            int local_226 = int(Context.Channel);
            FVector local_146_2 = (local_122 + local_128);
            local_97 = this.ProbeLineTrace(local_224, Context.Entity, true, EPhysicsTraceTag(20), (local_122 + local_128), (local_146_2 + local_116_2), ECollisionChannel(local_226), local_78, local_106);
            if (local_97)
            {
                local_225 = true;
                local_158 = local_224.ImpactPoint;
            }
            if (local_225)
            {
                local_140 = FVector::UpVector.CrossProduct((local_158 - local_152));
            }
            else
            {
                local_140 = ForwardProbeResult.NearestResult.ImpactNormal;
            }
            FVector3f local_109 = FVector3f(local_140);
            float32 local_81_2 = -local_109.X;
            local_82 = FMath::Atan2(-local_109.Y, local_81_2);
            bAngleFitReachUp = bAngleFitReachUp || VaultInfoCache.CheckSteerYawDiff(local_82, local_80_2, local_89);
            bAngleFitWallRun = bAngleFitWallRun || VaultInfoCache.CheckSteerYawDiff(local_82, local_79, local_84);
        }
        return;
    }
    FDownwardProbeResult ProbeDownwardRaycasts(const FVaultProbeContext &inout Context, const FForwardProbeResult &inout ForwardProbeResult, const float32 ForwardTraceDist, const FC_CharacterMovementParam &inout MovementParam, const FC_CharacterVaulting &inout Vaulting) const
    {
        FDownwardProbeResult __r;
        FCharacterVaultProbeConfig local_2 = Context.VaultProbeConfig;
        FDownwardProbeResult local_24;
        local_24.HighestPoint = Context.FootPosition;
        FCollisionQueryParams local_100 = ::CreateQueryParams(Context.Entity);
        float32 local_101 = ForwardProbeResult.FurthestResultUponNearest.Time;
        float32 local_102 = ForwardProbeResult.NearestResult.Time;
        float local_106 = ForwardProbeResult.FurthestResultUponNearest.TraceStart.Z;
        float32 local_102_3 = (ForwardProbeResult.FurthestResultUponNearest.Time - ForwardProbeResult.NearestResult.Time) * ForwardTraceDist;
        float32 local_101_3 = local_102_3 - this.SMALL_TRACE_OFFSET;
        float32 local_102_4 = local_2.MaxVaultWidth / local_2.DownwardRaycastInterval;
        int local_112 = FMath::CeilToInt(local_102_4) + 2;
        float32 local_102_5 = local_2.MaxVaultWidth / (local_112 - 2);
        if (local_101_3 < local_2.MaxVaultWidth)
        {
            local_112 = FMath::CeilToInt((local_101_3 / local_102_5)) + 2;
            local_102_5 = local_101_3 / (local_112 - 2);
        }
        FVector local_132 = (Context.ProbeDir * local_102_5);
        bool local_103 = (local_2.MaxDropAfterVault > 0.0f);
        float32 local_134 = local_2.MaxDropAfterVault;
        if (!(local_103))
        {
            local_134 = local_2.GetMaxReachUpHeight();
            if (int(Context.VaultStartState) == 2)
            {
                float32 local_114 = float32((FMath::Max((Context.FootPosition.Z - Vaulting.GetWallRunInfo().GetStartPos().Z), 0.0)));
                local_134 = local_134 + local_114;
            }
        }
        FVector local_120 = ((FVector(ForwardProbeResult.NearestResult.ImpactPoint) - local_132) + (Context.ProbeDir * this.SMALL_TRACE_OFFSET));
        FVector local_158 = local_120;
        local_120.Z = local_106;
        local_158.Z = (Context.FootPosition.Z - local_134);
        FSceneQueryCacheParam local_167;
        local_167.bEnableCenterOffsetXY = true;
        local_167.bEnableCenterOffsetZ = true;
        float32 local_114_2 = local_2.ForwardCheckDistance;
        local_167.CustomExpandingExtent = FVector3f(local_2.ForwardCheckDistance, local_114_2, Context.ZExtent);
        local_167.ExtraSweepOffset = FVector3f((local_132 * local_112));
        local_114_2 = local_102_5 * FMath::Tan(FMath::DegreesToRadians(local_167.ExtraSweepOffset));
        float32 local_171 = FMath::Cos(FMath::DegreesToRadians(MovementParam.WalkableSlopDegree));
        int local_173 = 0;
        for (; local_173 < local_112; ++local_173)
        {
            if (local_173 > 0)
            {
                local_120 += local_132;
                local_158 += local_132;
                if (local_103)
                {
                    float32 local_109_4 = local_2.MaxDropAfterVault;
                    local_158.Z = local_24.HighestPoint.Z - local_109_4;
                }
            }
            FHitResult local_240;
            bool local_244 = this.ProbeLineTrace(local_240, Context.Entity, true, EPhysicsTraceTag(20), local_120, local_158, Context.Channel, local_100, local_167);
            if (!(local_244) && !(local_103))
            {
                local_24.bHasVaultDropFallbackPoint = true;
                local_24.VaultDropFallbackPoint = local_158;
            }
            local_24.DownwardHitResults.Add(local_240);
            FVector local_250(local_240.ImpactPoint);
            if (local_250.Z > local_24.HighestPoint.Z)
            {
                if (local_250.Z > (Context.FootPosition.Z + local_2.GetMaxReachUpHeight()))
                {
                    break;
                }
                local_24.HighestPoint = local_250;
                local_24.bCanVaultOverHighestPoint = FHitResultUtils::CanCharacterVaultOver(local_240);
            }
            bool local_241 = !(local_244);
            if (local_241 || !(this.HitResultWalkable(local_240, local_171)))
            {
                local_24.bMoveReachable = false;
                local_24.LandingIndex = -1;
                continue;
            }
            if (int(local_24.LandingIndex) >= 0)
            {
                FVector local_260(local_24.DownwardHitResults[(local_173 - 1)].ImpactPoint);
                float local_252;
                float local_108_6 = local_250.Z - local_260.Z;
                float32 local_172 = float32(local_108_6);
                if (FMath::Abs(local_172) < local_114_2)
                {
                    float32 local_109_5 = local_24.SumStandableWidth + local_102_5;
                    local_24.SumStandableWidth = local_109_5;
                    local_109_5 = local_2.MinStandableWidth;
                    if (local_24.SumStandableWidth >= local_109_5)
                    {
                        break;
                    }
                }
                else
                {
                    FHitResult local_328;
                    FVector local_334;
                    FVector local_340;
                    float32 local_341 = 0.0f;
                    if (local_172 > 0.0f)
                    {
                        local_252 = local_260.Z + this.SMALL_TRACE_OFFSET;
                        local_334 = FVector(local_260.X, local_260.Y, local_252);
                        local_252 = local_114_2;
                        local_108_6 = local_250.X;
                        local_340 = FVector(local_108_6, local_250.Y, local_260.Z + local_252);
                        if (this.ProbeLineTrace(local_328, Context.Entity, true, EPhysicsTraceTag(20), local_334, local_340, Context.Channel, local_100, local_167))
                        {
                            local_341 = local_328.Time * local_102_5;
                        }
                    }
                    else
                    {
                        local_252 = local_260.Z - local_114_2;
                        local_334 = FVector(local_250.X, local_250.Y, local_252);
                        local_340 = local_260;
                        if (this.ProbeLineTrace(local_328, Context.Entity, true, EPhysicsTraceTag(20), local_334, local_340, Context.Channel, local_100, local_167))
                        {
                            local_341 = (1.0f - local_328.Time) * local_102_5;
                        }
                    }
                    local_24.SumStandableWidth = (local_24.SumStandableWidth + local_341);
                    if (local_24.SumStandableWidth >= local_2.MinStandableWidth)
                    {
                        break;
                    }
                    local_341 = 0.0f;
                    if (local_172 > 0.0f)
                    {
                        local_252 = local_114_2;
                        local_334 = FVector(local_260.X, local_260.Y, (local_250.Z - local_252));
                        local_340 = local_250;
                        if (this.ProbeLineTrace(local_328, Context.Entity, true, EPhysicsTraceTag(20), local_334, local_340, Context.Channel, local_100, local_167))
                        {
                            local_341 = (1.0f - local_328.Time) * local_102_5;
                        }
                    }
                    else
                    {
                        local_334 = FVector(local_250.X, local_250.Y, (local_250.Z + this.SMALL_TRACE_OFFSET));
                        local_252 = local_250.Z + local_114_2;
                        local_340 = FVector(local_260.X, local_260.Y, local_252);
                        if (this.ProbeLineTrace(local_328, Context.Entity, true, EPhysicsTraceTag(20), local_334, local_340, Context.Channel, local_100, local_167))
                        {
                            local_341 = local_328.Time * local_102_5;
                        }
                    }
                    local_24.SumStandableWidth = local_341;
                    if (local_24.bMoveReachable && ((local_172 > MovementParam.StepHeight)))
                    {
                        local_24.bMoveReachable = false;
                    }
                }
            }
            local_24.LandingIndex = local_173;
        }
        return __r;
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
        float32 local_1;
        local_1 = Context.Shape.GetCapsuleHalfHeight();
        FVector local_14(FVector::UpVector);
        FVector local_14_2 = (LandingPoint + (local_14 * (local_1 + MovementParam.StepHeight)));
        FVector local_38;
        if (LandingPoint.Z >= Context.FootPosition.Z)
        {
            local_38 = LandingPoint.NewZ((Context.Position.Z + this.SMALL_TRACE_OFFSET));
        }
        else
        {
            local_38 = LandingPoint.AddZ((local_1 + this.SMALL_TRACE_OFFSET));
        }
        FCollisionQueryParams local_114 = ::CreateQueryParams(Context.Entity);
        FHitResult local_180;
        bool local_192 = FPhysicsUtils::SweepSingle(Context.Entity, false, EPhysicsTraceTag(20), local_180, local_14_2, local_38, Context.Rot, Context.Channel, Context.Shape, local_114, FCollisionResponseParams());
        if (!(local_192))
        {
            return true;
        }
        bool local_31 = !(local_180.GetbStartPenetrating());
        if (local_31)
        {
            float32 local_2_3 = -local_1 + this.SMALL_TRACE_OFFSET;
            float local_30 = local_2_3;
            FVector local_8 = local_180.Location.AddZ(local_30);
            if (local_8.Z < LandingPoint.Z)
            {
                local_31 = true;
            }
            else
            {
                local_30 = LandingPoint.Z;
                local_30 = local_30 + MovementParam.StepHeight;
                local_31 = (local_8.Z > local_30);
            }
            if (local_31)
            {
                LandingPoint = local_8;
            }
            return true;
        }
        FVector local_198 = local_180.Normal.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
        if (int(VaultActionType) == 1)
        {
            FVector local_210(Context.Rot.GetRightVector());
            float local_16_4 = FMath::Sign(float32(local_198.DotProduct(local_210)));
            FVector local_28 = (local_210 * local_16_4);
            local_198 += local_28;
        }
        else
        {
            local_198 += Context.Rot.GetForwardVector();
        }
        local_198 *= Context.Shape.GetCapsuleRadius();
        if (local_198.IsNearlyZero(9.999999747378752e-5))
        {
            return false;
        }
        FVector local_8_2 = (local_14_2 + local_198);
        local_192 = FPhysicsUtils::SweepSingle(Context.Entity, false, EPhysicsTraceTag(20), local_180, local_8_2, local_14_2, Context.Rot, Context.Channel, Context.Shape, local_114, FCollisionResponseParams());
        if (!(local_192) || local_180.GetbStartPenetrating())
        {
            return false;
        }
        FVector local_218 = FVector(local_180.Location);
        FVector local_210_2 = (local_8_2 - local_180.Location);
        FVector local_14_3 = (local_218 + ((local_210_2 * 0.5).GetClampedToMaxSize(this.SMALL_TRACE_OFFSET)));
        FKMCFloorInfo local_244 = FKinematicMoveCollisionUtils::FindFloorFromEntity(Context.Entity, local_14_3, float32((local_14_3.Z - local_38.Z)));
        if (local_244.GetbHasFloor())
        {
            LandingPoint = local_244.GetFloorPoint();
            return true;
        }
        if (int(VaultActionType) == 2)
        {
            if (local_244.GetbHitNonStandingSurface())
            {
                local_218 = local_244.GetFloorPoint();
            }
            else
            {
                local_218 = local_14_3.AddZ(-local_1);
            }
            LandingPoint = local_218;
            return true;
        }
        return false;
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
        bool local_29;
        FVaultPath __r;
        FCharacterVaultProbeConfig local_2 = Context.VaultProbeConfig;
        FVaultPath local_28;
        bool local_32 = (int(DownwardProbeResult.LandingIndex) >= 0) && ((DownwardProbeResult.SumStandableWidth >= local_2.MinStandableWidth));
        local_29 = !(local_32) && ((local_2.MaxDropAfterVault <= 0.0f)) && DownwardProbeResult.bHasVaultDropFallbackPoint;
        FVector local_56;
        if (local_32)
        {
            local_56 = DownwardProbeResult.DownwardHitResults[int(DownwardProbeResult.LandingIndex)].ImpactPoint;
        }
        else
        {
            FVector local_50;
            if (local_29)
            {
                local_50 = DownwardProbeResult.VaultDropFallbackPoint;
            }
            else
            {
                local_50 = DownwardProbeResult.HighestPoint;
            }
            local_56 = local_50;
        }
        FVector local_62 = DownwardProbeResult.HighestPoint;
        bool local_63 = DownwardProbeResult.bCanVaultOverHighestPoint;
        bool local_64 = false;
        FHitResult local_130;
        float local_134 = (local_56 - Context.FootPosition).Size2D();
        float32 local_34 = float32(local_134);
        float32 local_33 = local_34 / ForwardTraceDist;
        int local_136 = ForwardProbeResult.ForwardHitResults.Num() - 1;
        for (; local_136 >= 0; --local_136)
        {
            const FHitResult& local_138 = ForwardProbeResult.ForwardHitResults[local_136];
            if (local_138.TraceStart.Z <= local_62.Z)
            {
                break;
            }
            if (local_138.Time < local_33)
            {
                local_62 = local_138.ImpactPoint;
                local_63 = FHitResultUtils::CanCharacterVaultOver(local_138);
                local_64 = true;
                local_130 = local_138;
                break;
            }
        }
        float32 local_131 = this.CalculateVaultScore(local_2, local_56, local_62);
        int local_143 = 0;
        int local_142 = local_143;
        FVaultPathPoint local_152;
        if (local_29)
        {
            bool local_37;
            bool local_153;
            local_153 = false;
            if (local_64)
            {
                local_153 = FHitResultUtils::CanCharacterVaultOver(local_130);
            }
            else
            {
                local_153 = FHitResultUtils::CanCharacterVaultOver(ForwardProbeResult.NearestResult);
            }
            local_37 = !(Context.bEnableVaultOver);
            if (local_37 || !(local_153))
            {
            }
            else
            {
                float32 local_34_2 = local_2.MaxVaultHeight;
                if ((local_62.Z - Context.FootPosition.Z) > local_34_2)
                {
                }
                else
                {
                    int local_143_2 = 2;
                    local_142 = local_143_2;
                }
            }
        }
        else
        {
            bool local_37;
            bool local_36;
            if (local_131 < 1.0f)
            {
                local_36 = !(Context.bEnableMoveUpstairs);
                if (local_36 || !(local_32))
                {
                }
                else
                {
                    float32 local_34_3 = local_2.MaxUpstairsHeight;
                    if ((local_62.Z - Context.FootPosition.Z) > local_34_3)
                    {
                    }
                    else
                    {
                        int local_143_3 = 1;
                        local_142 = local_143_3;
                    }
                }
            }
            else
            {
                local_37 = !(Context.bEnableVaultOver);
                if (local_37 || !(local_63))
                {
                }
                else
                {
                    float32 local_34_4 = local_2.MaxVaultHeight;
                    if ((local_62.Z - Context.FootPosition.Z) > local_34_4)
                    {
                    }
                    else
                    {
                        int local_143_4 = 2;
                        local_142 = local_143_4;
                    }
                }
            }
        }
        local_28.Start = Context.Position;
        local_28.Rotation = Context.Rot;
        FVector local_160 = local_56;
        bool local_35 = this.DepenetrateVaultPoints(Context, MovementParam, local_2, EVaultActionType(local_142), local_62, local_56, local_131);
        if (!(local_35))
        {
        }
        else
        {
            FVector local_50;
            bool local_37;
            bool local_36;
            local_28.VaultActionType = EVaultActionType(local_142);
            if (local_142 == 2)
            {
                local_152.PositionOffset = FVector3f((local_62 - Context.FootPosition));
                local_28.PathPoints.Add(local_152);
                FECSDebugDraw::DrawDebugCapsule(n"Vaulting", (local_28.Start + FVector(local_152.PositionOffset)), Context.Shape.GetCapsuleHalfHeight(), Context.Shape.GetCapsuleRadius(), Context.Rot, FColor::Red, FColor::Red, 5.0f, uint8(0), 0.0f);
            }
            local_152.PositionOffset = FVector3f((local_56 - Context.FootPosition));
            local_28.PathPoints.Add(local_152);
            if (local_32)
            {
            }
            else
            {
            }
            float32 local_141 = Context.Shape.GetCapsuleRadius();
            float32 local_34_5 = Context.Shape.GetCapsuleHalfHeight();
            FColor local_174;
            FECSDebugDraw::DrawDebugCapsule(n"Vaulting", (local_28.Start + FVector(local_152.PositionOffset)), local_34_5, local_141, Context.Rot, local_174, local_174, 5.0f, uint8(0), 0.0f);
            const TArray<int>& local_176 = local_2.GetLevelSeparationHeights(local_28.VaultActionType);
            if (local_176.Num() > 0)
            {
                float32 local_34_6 = float32((local_62.Z - Context.FootPosition.Z));
                local_28.VaultActionIndex = 0;
                auto local_184 = local_176.Iterator();
                for (; local_184.CanProceed;)
                {
                    if (local_184.Proceed() > local_34_6)
                    {
                        break;
                    }
                    ++local_28.VaultActionIndex;
                }
            }
            if (int(local_28.VaultActionType) == 1 && (local_2.UpstairsPerHeightLevelConfigs.Num() > int(local_28.VaultActionIndex)))
            {
                const FCharacterVaultProbePerHeightLevelConfig& local_194 = local_2.UpstairsPerHeightLevelConfigs[int(local_28.VaultActionIndex)];
                if (local_194.bDisabled)
                {
                    local_28.VaultActionType = EVaultActionType(0);
                    local_28.bNoProbeCD = true;
                }
                else
                {
                    float32 local_177 = local_194.AuxHeightOffset;
                    if (local_177 > 0.0f)
                    {
                        float32 local_191;
                        local_177 = float32((local_56.Z - local_194.AuxHeightOffset));
                        FVaultPathPoint local_202;
                        local_191 = local_2.ForwardRaycastInterval;
                        TArray<FHitResult> local_204 = ForwardProbeResult.ForwardHitResults;
                        if (local_204.Num() >= 2)
                        {
                            float local_134_7 = FMath::Abs((local_204[1].TraceStart.Z - local_204[0].TraceStart.Z));
                            local_191 = float32(local_134_7);
                        }
                        float32 local_34_7 = FMath::Min(Context.Shape.GetCapsuleRadius(), local_191);
                        FVector local_44 = (local_56 - Context.FootPosition);
                        FVector local_170 = local_44.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
                        FVector local_218 = Context.FootPosition.NewZ(local_177);
                        float local_134_9 = (local_194.AuxHeightOffset / FMath::Tan(FMath::DegreesToRadians(MovementParam.WalkableSlopDegree)));
                        local_50 = (local_170 * local_134_9);
                        FVector local_226 = (Context.FootPosition.NewZ(local_56.Z) - local_50);
                        FVector local_212_2 = (local_218 + local_226);
                        local_50 = (local_212_2 * 0.5);
                        FVector local_232 = (local_226 - local_218);
                        FVector local_238 = (local_232 * 0.5);
                        float32 local_219 = float32(local_238.Size()) + local_34_7;
                        FQuat local_264 = FQuat::FindBetweenVectors(FVector::UpVector, local_238);
                        FCollisionShape local_272 = FCollisionShape::MakeCapsule(local_34_7, local_219);
                        FVector local_244 = (local_50 + local_44.NewZ(0.0));
                        FHitResult local_344;
                        FCollisionQueryParams local_420 = ::CreateQueryParams(Context.Entity);
                        FCollisionResponseParams local_429;
                        local_37 = FPhysicsUtils::SweepSingle(Context.Entity, true, EPhysicsTraceTag(20), local_344, local_50, local_244, local_264, Context.Channel, local_272, local_420, local_429);
                        float local_140_4 = local_177;
                        FVector local_278 = local_56.NewZ(local_140_4);
                        local_202.Normal = FVector3f(local_170.opNeg());
                        if (local_37)
                        {
                            FVector local_232_2 = (FVector(local_344.ImpactPoint) - Context.FootPosition).ProjectOnToNormal(local_170);
                            local_140_4 = local_177;
                            local_278 = (Context.FootPosition + local_232_2).NewZ(local_140_4);
                        }
                        FVector3f local_447 = (local_202.Normal * Context.Shape.GetCapsuleRadius());
                        FVector local_438 = FVector((local_447 - ((FVector3f(FVector3f::UpVector) * Context.Shape.GetCapsuleHalfHeight()).ProjectOnToNormal(local_202.Normal))));
                        float local_456 = (local_194.AuxHeightOffset * 0.5f);
                        local_140_4 = local_62.Z;
                        local_140_4 = local_140_4 - Context.FootPosition.Z;
                        float local_134_10 = -(local_140_4 - local_194.AuxHeightOffset);
                        local_438.Z = FMath::Clamp(local_438.Z, (local_134_10 * 0.5), local_456);
                        FVector local_232_3 = (local_278 + local_438);
                        local_202.PositionOffset = FVector3f((local_232_3 - Context.FootPosition));
                        local_28.PathPoints.Insert(local_202, 0);
                    }
                }
            }
        }
        return __r;
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
        int local_123;
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
            VaultInfoCache.PushSteerYaw(float32((FMath::Atan2(local_8.Y, local_8.X))), int(FixedTime.Frame));
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
            local_122 = EVaultStartState(2);
        }
        else
        {
            if (local_23)
            {
                local_122 = EVaultStartState(Vaulting.VaultDualStartState());
                local_123 = int(local_122);
                if (local_123 != 0 && ((int(local_122) != 1)))
                {
                    Get local_128;
                    local_1 = local_128.opCall().GetbSprintOn();
                    if (local_1)
                    {
                        local_123 = 1;
                    }
                    else
                    {
                        local_123 = 0;
                    }
                    local_122 = EVaultStartState(local_123);
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
