
enum ERootMotionWarpingMoveType
{
    LockTarget,
    ESMBB,
    Relative,
    LockTargetRelative,
    ESMBBEntity,
    ESMBBEntityRelative,
}

enum ERootMotionWarpingFaceType
{
    LockTarget,
    ESMBB,
    Camera,
    Input,
    ESMBBEntity,
    ESMBBEntityRelative,
}

enum EESMBBSourceType
{
    Self,
    Specific,
}


class UESMAction_RootMotionWarping : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool bWarpingTranslation = true;
    UPROPERTY()
    bool bIgnoreHorizontalAxis = false;
    UPROPERTY()
    FESMBlackboardConditionAndArray EnableHorizontalAxisCondition;
    UPROPERTY()
    bool bTranslationIgnoreHorizontalWeight = false;
    UPROPERTY()
    bool bIgnoreZAxis = true;
    UPROPERTY()
    FESMBlackboardConditionAndArray EnableZAxisCondition;
    UPROPERTY()
    bool bTranslationIgnoreVerticalWeight = false;
    UPROPERTY()
    ERootMotionWarpingMoveType TranslationType = ERootMotionWarpingMoveType(0);
    UPROPERTY()
    ERootMotionWarpingHorizontalDirMode HorizontalDirMode = ERootMotionWarpingHorizontalDirMode(0);
    UPROPERTY()
    bool bSourceRotYawOnly = true;
    UPROPERTY()
    bool bTargetRotYawOnly = false;
    UPROPERTY()
    bool bDisableAdjustDistanceWhenClose = false;
    UPROPERTY()
    bool bIgnoreTranslationWhenNoLockTarget = true;
    UPROPERTY()
    float32 FanShapeLockDetectDistance = 5000.0f;
    UPROPERTY()
    FVector RelativeLocation;
    UPROPERTY()
    FVector TargetOffset = FVector(100.0, 0.0, 0.0);
    UPROPERTY()
    bool bCalculateTargetRadius = false;
    UPROPERTY()
    FVector LocationOffset = FVector(0.0, 0.0, 0.0);
    UPROPERTY()
    bool bCheckForwardAndBackward = false;
    UPROPERTY()
    bool bForceForward = true;
    UPROPERTY()
    float32 MinDistance = 0.0f;
    UPROPERTY()
    float32 MaxDistance = 500.0f;
    UPROPERTY()
    bool bAdjustGround = false;
    UPROPERTY()
    bool bAdjustGroundAddHalfHeight = false;
    UPROPERTY()
    FVector AdjustGroundPostOffset = FVector::ZeroVector;
    UPROPERTY()
    EESMBBSourceType WorldSpaceLocationSourceType;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity WorldSpaceLocationSource;
    UPROPERTY()
    FNameHandle_EntityBBVarVector WorldSpaceLocation;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;
    UPROPERTY()
    bool bWarpingRotation = true;
    UPROPERTY()
    bool bRotationIgnoreWeight = true;
    UPROPERTY()
    ERootMotionWarpingFaceType RotationType = ERootMotionWarpingFaceType(0);
    UPROPERTY()
    FRotator RotationOffset;
    UPROPERTY()
    EESMBBSourceType WorldSpaceRotationSourceType;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity WorldSpaceRotationSource;
    UPROPERTY()
    FNameHandle_EntityBBVarVector WorldSpaceRotation;
    UPROPERTY()
    float32 WarpMaxRotationRate = 360.0f;
    UPROPERTY()
    bool bDisableAdjustAngleWhenClose = false;
    UPROPERTY()
    bool bDifferentMaxAngleForLeftAndRight = false;
    UPROPERTY()
    bool bUseBackwardOrientation = false;
    UPROPERTY()
    float32 MaxDeltaAngle = -1.0f;
    UPROPERTY()
    float32 MaxLeftAngle = 0.0f;
    UPROPERTY()
    float32 MaxRightAngle = 0.0f;
    UPROPERTY()
    float32 YawOffset = 0.0f;
    UPROPERTY()
    bool bEnableTickTrack = false;
    UPROPERTY()
    float32 TickInterval = 0.0f;
    UPROPERTY()
    float32 TickTrackRate = 1.0f;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    void OnInitData_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        this.EnableHorizontalAxisCondition.InitConditionRuntime(false);
        this.EnableZAxisCondition.InitConditionRuntime(false);
        return;
    }
    UFUNCTION()
    bool IsNotifyTypeAllowed_Implementation(const EESMNotifyType InType) const
    {
        return (int(InType) == 1);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_12 = 0;
        FFPTime local_2 = FFPTime(Time.ActionTime);
        if ((local_2 == 0.0))
        {
            return;
        }
        FName local_7 = Context.GetNotifyDataPath();
        if (!(!(local_7.IsNone())))
        {
            return;
        }
        FRootMotionWarpingParams& local_18 = local_12.ModifyOrAddWarping(local_7);
        if (!(local_18.GetbIsInited()))
        {
            this.InitWarping(local_18, Context, Time);
            return;
        }
        local_18.SetActionRemainTime((FFPTime(Time.ActionDuration) - Time.ActionTime));
        local_18.SetActionPlaySpeed(Time.PlaySpeed);
        if (!(this.bEnableTickTrack))
        {
            return;
        }
        if (this.TickInterval > 0.0f)
        {
            int local_25 = int((Time.ActionLastTime.ToSeconds() / this.TickInterval));
            if (local_25 == int((Time.ActionTime.ToSeconds() / this.TickInterval)))
            {
                return;
            }
        }
        if ((FFPTime(Time.ActionTime) / Time.ActionDuration) > this.TickTrackRate)
        {
            return;
        }
        this.UpdateTarget(Context, local_18, Time);
        return;
    }
    FVector GetESMBBWorldSpaceLocation(const FESMContext &inout Context) const
    {
        FECSEntity local_4 = Context.GetEntity();
        if (int(this.WorldSpaceLocationSourceType) == 1 && !(this.WorldSpaceLocationSource.Name.IsNone()))
        {
            FNameHandle_EntityBBVarEntity local_18;
            local_18;
            FECSEntity local_22 = Context.GetEntity().GetBB_Entity(local_18);
            if (local_22.IsValid())
            {
                local_4 = local_22;
            }
        }
        FNameHandle_EntityBBVarVector local_26;
        local_26;
        return local_4.GetBB_Vector(local_26);
    }
    FRotator GetESMBBWorldSpaceRotation(const FESMContext &inout Context) const
    {
        FECSEntity local_4 = Context.GetEntity();
        if (int(this.WorldSpaceRotationSourceType) == 1 && !(this.WorldSpaceRotationSource.Name.IsNone()))
        {
            FNameHandle_EntityBBVarEntity local_18;
            local_18;
            FECSEntity local_22 = Context.GetEntity().GetBB_Entity(local_18);
            if (local_22.IsValid())
            {
                local_4 = local_22;
            }
        }
        if (!(this.WorldSpaceRotation.Name.IsNone()))
        {
            FNameHandle_EntityBBVarVector local_32;
            local_32;
            return FRotator::MakeFromEuler(local_4.GetBB_Vector(local_32));
        }
        return (this.GetESMBBWorldSpaceLocation(Context) - 0.GetPosition()).Rotation();
    }
    FQuat GetRotator(const FQuat &inout Rotation, const bool bYawOnly) const
    {
        if (!(bYawOnly))
        {
            return Rotation;
        }
        return FRotator(0.0, Rotation.Rotator().Yaw, 0.0).Quaternion();
    }
    void InitWarping(FRootMotionWarpingParams &inout RootMotionWarping, const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_20 = 0;
        RootMotionWarping.SetActionRemainTime((FFPTime(Time.ActionDuration) - Time.ActionTime));
        RootMotionWarping.SetActionPlaySpeed(Time.PlaySpeed);
        RootMotionWarping.SetTotalRootMotionDist2D(-1.0f);
        if (int(this.TranslationType) == 2)
        {
            RootMotionWarping.SetMinDist2D(-1.0f);
            RootMotionWarping.SetMaxDist2D(float32(this.RelativeLocation.Size2D()));
        }
        else
        {
            RootMotionWarping.SetMinDist2D(this.MinDistance);
            RootMotionWarping.SetMaxDist2D(this.MaxDistance);
        }
        RootMotionWarping.SetbWarpingTranslation(this.bWarpingTranslation);
        RootMotionWarping.SetbIgnoreHorizontalAxis(this.bIgnoreHorizontalAxis || !(this.EnableHorizontalAxisCondition.Evaluate(Context.GetBlackboard())));
        RootMotionWarping.SetbIgnoreZAxis(this.bIgnoreZAxis || !(this.EnableZAxisCondition.Evaluate(Context.GetBlackboard())));
        RootMotionWarping.SetbTranslationIgnoreHorizontalWeight(this.bTranslationIgnoreHorizontalWeight);
        RootMotionWarping.SetbTranslationIgnoreVerticalWeight(this.bTranslationIgnoreVerticalWeight);
        RootMotionWarping.SetHorizontalDirMode(this.HorizontalDirMode);
        RootMotionWarping.SetbWarpingRotation(this.bWarpingRotation);
        RootMotionWarping.SetbRotationIgnoreWeight(this.bRotationIgnoreWeight);
        RootMotionWarping.SetWarpMaxRotationRate(this.WarpMaxRotationRate);
        RootMotionWarping.SetStartLocation(local_20.GetPosition());
        RootMotionWarping.SetStartRotation(local_20.GetRotation().Rotator());
        this.UpdateTarget(Context, RootMotionWarping, Time);
        RootMotionWarping.SetbIsInited(true);
        return;
    }
    void UpdateTarget(const FESMContext &inout Context, FRootMotionWarpingParams &inout RootMotionWarping, const FESMActionTime &inout Time) const
    {
        bool local_115;
        GetDefaulted local_140;
        const FECSEntity& local_2 = Context.GetEntity();
        bool local_3 = this.bWarpingTranslation;
        if (local_3)
        {
            FNameHandle_EntityBBVarEntity local_132;
            const FC_Transform& local_124;
            Get local_42;
            Get local_38;
            const FC_Transform& local_34;
            FQuat local_12 = FQuat(FQuat::Identity);
            switch (int(this.TranslationType))
            {
            case 0:
            {
                FLockPointInfo local_32;
                const FC_LockTarget& local_44 = local_42.opCall();
                if (local_44)
                {
                    Get local_48;
                    const FC_FanShapeSoftLockRangeSearch& local_50 = local_48.opCall();
                    if (local_50)
                    {
                        FVector local_56 = FVector(FVector::ZeroVector);
                        ::FLockTargetUtils::OnDisposeFanShapeSoftLockRangeSearch(Context.GetEntity(), local_50.GetFanShapeSoftLockRangeSearchAngle(), local_50.GetFindPointSmallestAngleRange(), Time.WorldTime, local_56);
                        if (local_50.GetbInFanShapeSoftLockRangeSearch())
                        {
                            FVector local_72 = FCharacterInputUtils::GetWorldMoveInput(Context.GetEntity(), Time.WorldLastTime, FFPTime(0), false);
                            if ((local_72 == FVector::ZeroVector))
                            {
                                local_72 = local_38.opCall().GetRotation().Vector().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                            }
                            FVector local_80 = FLockTargetUtils::GetWarpingFanShapeRangeSearchTarget(local_2, local_44.GetTargetEntity(), local_72, this.FanShapeLockDetectDistance);
                            if ((local_80 == FVector::ZeroVector))
                            {
                                RootMotionWarping.SetbWarpingTranslation(false);
                            }
                            else
                            {
                                FVector local_92 = (local_80 + (FVector(local_34.GetPosition()) - local_80).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector).Rotation().Quaternion().RotateVector(this.TargetOffset));
                                RootMotionWarping.SetTargetLocation(this.AdjustTargetLocationByForward(local_80, local_92, local_34.GetPosition()));
                            }
                            break;
                        }
                        else
                        {
                        }
                    }
                    if (!(this.bDisableAdjustDistanceWhenClose))
                    {
                        local_115 = false;
                    }
                    else
                    {
                        local_3 = !(local_44.IsEnableLockAdjust(local_2));
                        local_3 = (local_3 == !(false));
                        local_115 = local_3;
                    }
                    if (local_115)
                    {
                        RootMotionWarping.SetbWarpingTranslation(false);
                    }
                    else
                    {
                        if (::FLockTargetUtils::GetLogicLockTargetInfo(local_2, local_32))
                        {
                            FVector local_92_2 = local_32.Position;
                            if (this.bCalculateTargetRadius)
                            {
                                local_92_2 = FLockTargetUtils::GetWarpingTargetLocation(local_2, local_44.GetTargetEntity());
                            }
                            FVector local_86 = (local_92_2 + (FVector(local_34.GetPosition()) - local_92_2).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector).Rotation().Quaternion().RotateVector(this.TargetOffset));
                            RootMotionWarping.SetTargetLocation(this.AdjustTargetLocationByForward(local_86, local_92_2, local_34.GetPosition()));
                        }
                        else
                        {
                            RootMotionWarping.SetTargetLocation((FVector(local_34.GetPosition()) + this.GetRotator(local_34.GetRotation(), this.bSourceRotYawOnly).RotateVector(this.RelativeLocation)));
                        }
                    }
                }
                else
                {
                    if (this.bIgnoreTranslationWhenNoLockTarget)
                    {
                        RootMotionWarping.SetbIgnoreHorizontalAxis(true);
                        RootMotionWarping.SetbIgnoreZAxis(true);
                    }
                    else
                    {
                        RootMotionWarping.SetTargetLocation((FVector(local_34.GetPosition()) + this.GetRotator(local_34.GetRotation(), this.bSourceRotYawOnly).RotateVector(this.RelativeLocation)));
                    }
                }
                break;
            }
            case 1:
            {
                FVector local_80_2 = this.GetESMBBWorldSpaceLocation(Context);
                bool local_116 = !((local_80_2 == FVector::ZeroVector));
                RootMotionWarping.SetTargetLocation((local_80_2 + (FVector(local_34.GetPosition()) - local_80_2).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector).Rotation().Quaternion().RotateVector(this.LocationOffset)));
                break;
            }
            case 2:
            {
                local_12 = this.GetRotator(local_34.GetRotation(), this.bSourceRotYawOnly);
                RootMotionWarping.SetTargetLocation((FVector(local_34.GetPosition()) + local_12.RotateVector(this.RelativeLocation)));
                break;
            }
            case 3:
            {
                const FC_LockTarget& local_44_2 = local_42.opCall();
                if (local_44_2)
                {
                    FLockPointInfo local_32;
                    if (::FLockTargetUtils::GetLogicLockTargetInfo(local_2, local_32))
                    {
                        FVector local_122_2 = local_32.Position;
                        if (this.bCalculateTargetRadius)
                        {
                            local_122_2 = FLockTargetUtils::GetWarpingTargetLocation(local_2, local_44_2.GetTargetEntity());
                        }
                        FVector local_72_2 = (local_122_2 + this.GetRotator(local_124.GetRotation(), this.bTargetRotYawOnly).RotateVector(this.TargetOffset));
                        RootMotionWarping.SetTargetLocation(this.AdjustTargetLocationByForward(local_72_2, local_122_2, local_34.GetPosition()));
                    }
                    else
                    {
                        RootMotionWarping.SetTargetLocation((FVector(local_34.GetPosition()) + this.GetRotator(local_34.GetRotation(), this.bSourceRotYawOnly).RotateVector(this.RelativeLocation)));
                    }
                }
                else
                {
                    if (this.bIgnoreTranslationWhenNoLockTarget)
                    {
                        RootMotionWarping.SetbIgnoreHorizontalAxis(true);
                        RootMotionWarping.SetbIgnoreZAxis(true);
                    }
                    else
                    {
                        RootMotionWarping.SetTargetLocation((FVector(local_34.GetPosition()) + this.GetRotator(local_34.GetRotation(), this.bSourceRotYawOnly).RotateVector(this.RelativeLocation)));
                    }
                }
                break;
            }
            case 4:
            {
                local_132;
                FECSEntity local_136 = Context.GetEntity().GetBB_Entity(local_132);
                local_34 = local_38.opCall();
                if (local_34)
                {
                    FVector local_122_3 = FVector(local_34.GetPosition());
                    FVector local_92_3 = (FVector(local_124.GetPosition()) - local_122_3).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
                    local_12 = local_92_3.Rotation().Quaternion();
                    if (this.bCalculateTargetRadius)
                    {
                        FVector local_114_2 = (local_92_3 * local_140.opCall().GetScaledRadius());
                        local_122_3 += local_114_2;
                    }
                    FVector local_64_2 = (local_122_3 + local_12.RotateVector(this.TargetOffset));
                    RootMotionWarping.SetTargetLocation(this.AdjustTargetLocationByForward(local_64_2, local_122_3, local_124.GetPosition()));
                }
                else
                {
                    if (this.bIgnoreTranslationWhenNoLockTarget)
                    {
                        RootMotionWarping.SetbIgnoreHorizontalAxis(true);
                        RootMotionWarping.SetbIgnoreZAxis(true);
                    }
                    else
                    {
                        RootMotionWarping.SetTargetLocation((FVector(local_124.GetPosition()) + this.GetRotator(local_124.GetRotation(), this.bSourceRotYawOnly).RotateVector(this.RelativeLocation)));
                    }
                }
                break;
            }
            case 5:
            {
                local_132;
                FECSEntity local_128 = Context.GetEntity().GetBB_Entity(local_132);
                local_124 = local_38.opCall();
                if (local_124)
                {
                    FVector local_122_4 = FVector(local_124.GetPosition());
                    local_12 = this.GetRotator(local_124.GetRotation(), this.bTargetRotYawOnly);
                    FVector local_80_3 = local_12.Vector().GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
                    if (this.bCalculateTargetRadius)
                    {
                        FVector local_56_2 = (local_80_3 * local_140.opCall().GetScaledRadius());
                        local_122_4 += local_56_2;
                    }
                    FVector local_64_3 = (local_122_4 + local_12.RotateVector(this.TargetOffset));
                    RootMotionWarping.SetTargetLocation(this.AdjustTargetLocationByForward(local_64_3, local_122_4, local_34.GetPosition()));
                }
                else
                {
                    if (this.bIgnoreTranslationWhenNoLockTarget)
                    {
                        RootMotionWarping.SetbIgnoreHorizontalAxis(true);
                        RootMotionWarping.SetbIgnoreZAxis(true);
                    }
                    else
                    {
                        local_12 = this.GetRotator(local_34.GetRotation(), this.bSourceRotYawOnly);
                        RootMotionWarping.SetTargetLocation((FVector(local_34.GetPosition()) + local_12.RotateVector(this.RelativeLocation)));
                    }
                }
                break;
            }
            }
            if (this.bAdjustGround)
            {
                FVector local_80_4 = FVector(RootMotionWarping.GetTargetLocation());
                local_80_4.Z = (local_80_4.Z + 100.0);
                FVector local_122_5 = FVector(RootMotionWarping.GetTargetLocation());
                float local_74_3 = local_122_5.Z;
                local_74_3 = local_74_3 - 100000.0;
                local_122_5.Z = local_74_3;
                FHitResult local_208;
                FCollisionQueryParams local_246;
                FCollisionResponseParams local_255;
                local_115 = FPhysicsUtils::LineTraceSingle(local_2, true, EPhysicsTraceTag(12), local_208, local_80_4, local_122_5, ECollisionChannel(18), local_246, local_255);
                if (local_115)
                {
                    FECSDebugDraw::DrawDebugSphere(n"RootMotionWarping", RootMotionWarping.GetTargetLocation(), 20.0f, 18, FColor::Yellow, FColor::Yellow, 5.0f, uint8(0), 3.0f);
                    FECSDebugDraw::DrawDebugLine(n"RootMotionWarping", RootMotionWarping.GetTargetLocation(), local_208.ImpactPoint, FColor::Yellow, FColor::Yellow, 5.0f, uint8(0), 3.0f);
                    FVector local_86_2 = FVector(local_208.ImpactPoint);
                    if (this.bAdjustGroundAddHalfHeight)
                    {
                        FVector local_92_4 = (FVector(FVector::UpVector) * local_140.opCall().GetScaledHalfHeight());
                        local_86_2 += local_92_4;
                    }
                    if (!(this.AdjustGroundPostOffset.IsNearlyZero(9.999999747378752e-5)))
                    {
                        local_86_2 += local_12.RotateVector(this.AdjustGroundPostOffset);
                    }
                    RootMotionWarping.SetTargetLocation(local_86_2);
                }
            }
            FECSDebugDraw::DrawDebugSphere(n"RootMotionWarping", RootMotionWarping.GetTargetLocation(), 50.0f, 18, FColor::Cyan, FColor::Green, 5.0f, uint8(0), 3.0f);
        }
        if (this.bWarpingRotation)
        {
            FNameHandle_EntityBBVarEntity local_132;
            const FC_Transform& local_124;
            Get local_42;
            Get local_38;
            const FC_Transform& local_34;
            float32 local_321;
            FRotator local_266;
            switch (int(this.RotationType))
            {
            case 0:
            {
                const FC_LockTarget& local_44_3 = local_42.opCall();
                if (local_44_3)
                {
                    if (!(this.bDisableAdjustAngleWhenClose))
                    {
                        local_3 = false;
                    }
                    else
                    {
                        local_3 = !(false);
                        local_3 = (!(local_44_3.IsEnableLockAdjust(local_2)) == local_3);
                    }
                    if (local_3)
                    {
                        RootMotionWarping.SetbWarpingRotation(false);
                    }
                }
                local_266 = ::FCharacterDirectionUtils::GetTargetRotation(local_2, ECharacterDirectionType(6), false, FFPTime(-1));
                break;
            }
            case 1:
            {
                local_266 = this.GetESMBBWorldSpaceRotation(Context);
                break;
            }
            case 2:
            {
                local_266 = FCharacterInputUtils::GetViewInputDir(Context.GetEntity(), Time.WorldTime);
                break;
            }
            case 3:
            {
                Get local_304;
                local_266 = local_124.ToFTransform().InverseTransformRotation(local_304.opCall().GetDesiredRotation());
                break;
            }
            case 4:
            {
                local_132;
                FECSEntity local_136_2 = Context.GetEntity().GetBB_Entity(local_132);
                local_124 = local_38.opCall();
                if (local_124)
                {
                    FVector local_92_5 = (FVector(local_124.GetPosition()) - local_34.GetPosition());
                    local_266 = local_92_5.Rotation();
                }
                else
                {
                    local_266 = local_34.GetRotation().Rotator();
                }
                break;
            }
            case 5:
            {
                local_132;
                FECSEntity local_128_2 = Context.GetEntity().GetBB_Entity(local_132);
                local_34 = local_38.opCall();
                if (local_34)
                {
                    local_266 = (FQuat(local_34.GetRotation()) * this.RotationOffset.Quaternion()).Rotator();
                }
                else
                {
                    local_266 = local_124.GetRotation().Rotator();
                }
                break;
            }
            }
            if (this.bUseBackwardOrientation)
            {
                local_266 *= -1.0;
            }
            local_321 = this.MaxDeltaAngle;
            if (this.bDifferentMaxAngleForLeftAndRight)
            {
                if (float32(RootMotionWarping.GetStartRotation().GetRightVector().DotProduct(local_266.Quaternion().GetForwardVector())) >= 0.0f)
                {
                    local_321 = this.MaxRightAngle;
                }
                else
                {
                    local_321 = this.MaxLeftAngle;
                }
            }
            if (local_321 == 0.0f)
            {
                local_266 = RootMotionWarping.GetStartRotation();
            }
            else
            {
                if (local_321 > 0.0f)
                {
                    local_266 = FMathUtils::MoveTowards(RootMotionWarping.GetStartRotation().Quaternion(), local_266.Quaternion(), 1.0f, this.MaxDeltaAngle).Rotator();
                }
            }
            RootMotionWarping.SetTargetRotation((local_266 + FRotator(0.0, this.YawOffset, 0.0)));
        }
        return;
    }
    FVector AdjustTargetLocationByForward(const FVector &inout TargetLocationWithOffset, const FVector &inout TargetLocation, const FVector &inout CurrLocation) const
    {
        if (this.bCheckForwardAndBackward)
        {
            FVector local_8 = (TargetLocation - CurrLocation).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
            float32 local_30 = float32((local_8.DotProduct((TargetLocationWithOffset - CurrLocation).NewZ(0.0))));
            if (!(!(!(FMath::IsNearlyZero(local_30, 1e-8f)))) && (!(this.bForceForward) != (!((local_30 > 0.0f)))))
            {
                return CurrLocation.NewZ(TargetLocationWithOffset.Z);
            }
        }
        return TargetLocationWithOffset;
    }
}

