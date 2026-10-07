

class USPT_HumanSlopeAdaptation : USkeletalPoseTweaker
{
    UPROPERTY()
    float32 FootIKAlpha = 1.0f;
    UPROPERTY()
    float32 HandIKAlpha = 1.0f;
    UPROPERTY()
    float32 CalfLateralOffset = 15.0f;
    UPROPERTY()
    float32 TraceUpOffset = 80.0f;
    UPROPERTY()
    float32 TraceDownOffset = 150.0f;
    UPROPERTY()
    float32 MaxSpineAngle = 45.0f;
    UPROPERTY()
    float32 MaxThighAngle = 45.0f;
    UPROPERTY()
    float32 MaxCalfAngle = 20.0f;
    UPROPERTY()
    float32 LowerarmRatio = 0.2f;
    UPROPERTY()
    float32 SmoothSpeed = 10.0f;
    UPROPERTY()
    float32 MaxFootDrop = 60.0f;
    UPROPERTY()
    float32 CalfClearance = -5.0f;
    UPROPERTY()
    float32 MaxCalfCorrection = 30.0f;
    UPROPERTY()
    float32 FootHitOffset = 5.0f;
    UPROPERTY()
    float32 MaxHandDrop = 60.0f;
    UPROPERTY()
    float32 LowerarmClearance = -5.0f;
    UPROPERTY()
    float32 MaxLowerarmCorrection = 30.0f;
    UPROPERTY()
    bool bShowDebug = false;
    UPROPERTY()
    FPT_BoneRef Spine01Bone;
    UPROPERTY()
    FPT_BoneRef UpperarmLBone;
    UPROPERTY()
    FPT_BoneRef UpperarmRBone;
    UPROPERTY()
    FPT_BoneRef ThighLBone;
    UPROPERTY()
    FPT_BoneRef ThighRBone;
    UPROPERTY()
    FPT_BoneRef CalfLBone;
    UPROPERTY()
    FPT_BoneRef CalfRBone;
    UPROPERTY()
    FPT_BoneRef FootLBone;
    UPROPERTY()
    FPT_BoneRef FootRBone;
    UPROPERTY()
    FPT_BoneRef HandLBone;
    UPROPERTY()
    FPT_BoneRef HandRBone;
    UPROPERTY()
    FPT_BoneRef LowerarmLBone;
    UPROPERTY()
    FPT_BoneRef LowerarmRBone;
    FPT_BoneRef HeadBone;
    FPT_BoneRef RootBone;
    UPROPERTY()
    FPT_TwoBoneIK LegLSolver;
    UPROPERTY()
    FPT_TwoBoneIK LegRSolver;
    UPROPERTY()
    FPT_TwoBoneIK ArmLSolver;
    UPROPERTY()
    FPT_TwoBoneIK ArmRSolver;
    float32 SmSpine01Pitch = 0.0f;
    float32 SmThighLPitch = 0.0f;
    float32 SmThighRPitch = 0.0f;
    float32 SmCalfLPitch = 0.0f;
    float32 SmCalfRPitch = 0.0f;
    float32 SmLowerarmLPitch = 0.0f;
    float32 SmLowerarmRPitch = 0.0f;
    FVector CachedFootLHit = FVector::ZeroVector;
    FVector CachedFootRHit = FVector::ZeroVector;
    FVector CachedHandLHit = FVector::ZeroVector;
    FVector CachedHandRHit = FVector::ZeroVector;


    UFUNCTION()
    void OnInitialization_Implementation()
    {
        this.SmSpine01Pitch = 0.0f;
        this.SmThighLPitch = 0.0f;
        this.SmThighRPitch = 0.0f;
        this.SmCalfLPitch = 0.0f;
        this.SmCalfRPitch = 0.0f;
        this.SmLowerarmLPitch = 0.0f;
        this.SmLowerarmRPitch = 0.0f;
        if (!(this.HeadBone.HasValidSetup()))
        {
            this.InitializeBoneRef(this.HeadBone);
        }
        if (!(this.RootBone.HasValidSetup()))
        {
            this.InitializeBoneRef(this.RootBone);
        }
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        float32 local_57;
        float32 local_495;
        float32 local_497;
        float32 local_498;
        float32 local_501;
        float32 local_1 = this.CurrentDeltaSeconds;
        float32 local_3 = 0.0f;
        UESMAnimInstance_AvatarBase local_6 = (Cast<UESMAnimInstance_AvatarBase>(this.GetAnimInstance()));
        if (local_6 != nullptr)
        {
            local_3 = local_6.SlopeAdaptAlpha;
        }
        if ((local_1 <= 0.0f || (local_3 <= 0.0f)))
        {
            return;
        }
        float32 local_15 = FMath::Clamp(local_3, 0.0f, 1.0f);
        FRotator local_38 = this.AnimComponentTransform.GetRotation().Rotator();
        FVector local_56 = FRotator(0.0, float32(local_38.Yaw), 0.0).Quaternion().GetForwardVector();
        float32 local_2 = float32(local_38.Pitch);
        float local_46 = -local_56.Y;
        FVector local_44 = FVector(local_46, local_56.X, 0.0);
        FTransform local_88 = FTransform(this.FootLBone.GetTransform());
        FTransform local_136 = FTransform(this.FootRBone.GetTransform());
        FTransform local_160 = FTransform(this.HandLBone.GetTransform());
        FTransform local_184 = FTransform(this.HandRBone.GetTransform());
        FQuat local_192 = FQuat(this.CalfLBone.GetTransform().GetRotation());
        FQuat local_200 = FQuat(this.CalfRBone.GetTransform().GetRotation());
        FQuat local_208 = FQuat(this.LowerarmLBone.GetTransform().GetRotation());
        FQuat local_216 = FQuat(this.LowerarmRBone.GetTransform().GetRotation());
        FQuat local_240 = (local_192.Inverse() * local_88.GetRotation());
        FQuat local_232 = (local_200.Inverse() * local_136.GetRotation());
        FQuat local_224 = (local_208.Inverse() * local_160.GetRotation());
        FQuat local_248 = (local_216.Inverse() * local_184.GetRotation());
        FVector local_64 = this.BonePosWS(this.Spine01Bone);
        FVector local_270 = this.BonePosWS(this.UpperarmLBone);
        FVector local_276 = this.BonePosWS(this.UpperarmRBone);
        FVector local_282 = this.BonePosWS(this.ThighLBone);
        FVector local_288 = this.BonePosWS(this.ThighRBone);
        FVector local_294 = this.BonePosWS(this.CalfLBone);
        FVector local_300 = this.BonePosWS(this.CalfRBone);
        FVector local_306 = this.BonePosWS(this.FootLBone);
        FVector local_312 = this.BonePosWS(this.FootRBone);
        this.BonePosWS(this.LowerarmLBone);
        this.BonePosWS(this.LowerarmRBone);
        this.BonePosWS(this.HandLBone);
        this.BonePosWS(this.HandRBone);
        FVector local_348;
        FVector local_354;
        FVector local_360;
        bool local_11 = this.TraceDownWS(local_64, local_348);
        bool local_12 = this.TraceDownWS(local_270, local_354);
        bool local_361 = this.TraceDownWS(local_276, local_360);
        FVector local_370;
        FVector local_376;
        FVector local_382;
        bool local_362 = this.TraceDownWSNoDebug(local_282, local_370);
        bool local_363 = this.TraceDownWSNoDebug(local_294, local_376);
        bool local_383 = this.TraceDownWSNoDebug(local_306, local_382);
        FVector local_392;
        FVector local_398;
        bool local_399 = false;
        bool local_400 = false;
        FVector local_406(FVector::ZeroVector);
        FVector local_412(FVector::ZeroVector);
        FVector local_424 = (local_282 - local_294).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_436;
        if (FMath::Abs(float32(local_424.Z)) < 0.9f)
        {
            local_436 = FVector(0.0, 0.0, 1.0);
        }
        else
        {
            local_436 = FVector(1.0, 0.0, 0.0);
        }
        FVector local_342 = local_424.CrossProduct(FVector()).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        local_406 = (local_294 + (local_342 * this.CalfLateralOffset));
        local_412 = (local_294 - (local_342 * this.CalfLateralOffset));
        local_399 = this.TraceDownWSNoDebug(local_406, local_392);
        local_400 = this.TraceDownWSNoDebug(local_412, local_398);
        bool local_384 = this.TraceDownWSNoDebug(local_288, local_342);
        bool local_385 = this.TraceDownWSNoDebug(local_300, local_424);
        bool local_443 = this.TraceDownWSNoDebug(local_312, local_436);
        FVector local_452;
        FVector local_458;
        bool local_459 = false;
        bool local_460 = false;
        FVector local_466(FVector::ZeroVector);
        FVector local_472(FVector::ZeroVector);
        FVector local_430_2 = (local_288 - local_300).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_478;
        if (FMath::Abs(float32(local_430_2.Z)) < 0.9f)
        {
            local_478 = FVector(0.0, 0.0, 1.0);
        }
        else
        {
            local_478 = FVector(1.0, 0.0, 0.0);
        }
        FVector local_442_2 = local_430_2.CrossProduct(local_478).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        local_466 = (local_300 + (local_442_2 * this.CalfLateralOffset));
        local_472 = (local_300 - (local_442_2 * this.CalfLateralOffset));
        local_459 = this.TraceDownWSNoDebug(local_466, local_452);
        local_460 = this.TraceDownWSNoDebug(local_472, local_458);
        float32 local_491 = 0.0f;
        if ((local_11 && local_12) && local_361)
        {
            local_491 = this.ComputePlaneRawSlope(local_348, local_354, local_360, local_56, local_2) - local_2;
        }
        bool local_492 = false;
        FVector local_430_3(FVector::ZeroVector);
        if (this.HeadBone.HasValidSetup() && this.RootBone.HasValidSetup())
        {
            local_478 = FVector(this.HeadBone.GetTransform().GetLocation());
            local_492 = ((local_478 - FVector(this.RootBone.GetTransform().GetLocation())).X > 0.0);
        }
        else
        {
            local_492 = (this.AnimComponentTransform.GetRotation().GetForwardVector().Z < 0.0);
        }
        float32 local_493 = 0.0f;
        float32 local_494 = 0.0f;
        if (local_362)
        {
            local_495 = 0.0f;
            if (local_399 && local_400)
            {
                local_495 = this.ComputePlaneRawSlope(local_370, local_392, local_398, local_56, local_2);
            }
            else
            {
                local_495 = local_2;
            }
            local_493 = local_495 - local_2;
            if (local_363 && local_383)
            {
                local_57 = this.ComputeTwoPointSlope(local_376, local_382, local_56) - local_495;
                if (local_492)
                {
                    local_498 = FMath::Max(0.0f, local_57);
                }
                else
                {
                    local_498 = FMath::Min(0.0f, local_57);
                }
                local_494 = local_498;
            }
        }
        local_57 = 0.0f;
        float32 local_14 = 0.0f;
        if (local_384)
        {
            local_495 = 0.0f;
            if (local_459 && local_460)
            {
                local_495 = this.ComputePlaneRawSlope(local_342, local_452, local_458, local_56, local_2);
            }
            else
            {
                local_495 = local_2;
            }
            local_57 = local_495 - local_2;
            if (local_385 && local_443)
            {
                float32 local_13 = this.ComputeTwoPointSlope(local_424, local_436, local_56) - local_495;
                if (local_492)
                {
                    local_497 = FMath::Max(0.0f, local_13);
                }
                else
                {
                    local_497 = FMath::Min(0.0f, local_13);
                }
                local_14 = local_497;
            }
        }
        float32 local_496 = -this.MaxSpineAngle;
        local_491 = FMath::Clamp(local_491, local_496, this.MaxSpineAngle);
        local_497 = this.MaxThighAngle;
        local_497 = -local_497;
        local_493 = FMath::Clamp(local_493, local_497, this.MaxThighAngle);
        float32 local_500 = -this.MaxThighAngle;
        local_57 = FMath::Clamp(local_57, local_500, this.MaxThighAngle);
        float32 local_499 = -this.MaxCalfAngle;
        local_494 = FMath::Clamp(local_494, local_499, this.MaxCalfAngle);
        float32 local_496_2 = -this.MaxCalfAngle;
        local_14 = FMath::Clamp(local_14, local_496_2, this.MaxCalfAngle);
        float32 local_496_3 = local_491 * this.LowerarmRatio;
        float32 local_500_2 = local_491 * this.LowerarmRatio;
        if (this.SmoothSpeed > 0.0f)
        {
            float32 local_499_2 = local_1 * this.SmoothSpeed;
            local_501 = FMath::Clamp(local_499_2, 0.0f, 1.0f);
        }
        else
        {
            local_501 = 1.0f;
        }
        this.SmSpine01Pitch = FMath::Lerp(this.SmSpine01Pitch, local_491, local_501);
        this.SmThighLPitch = FMath::Lerp(this.SmThighLPitch, local_493, local_501);
        this.SmThighRPitch = FMath::Lerp(this.SmThighRPitch, local_57, local_501);
        this.SmCalfLPitch = FMath::Lerp(this.SmCalfLPitch, local_494, local_501);
        this.SmCalfRPitch = FMath::Lerp(this.SmCalfRPitch, local_14, local_501);
        this.SmLowerarmLPitch = FMath::Lerp(this.SmLowerarmLPitch, local_496_3, local_501);
        this.SmLowerarmRPitch = FMath::Lerp(this.SmLowerarmRPitch, local_500_2, local_501);
        FVector local_442_3 = this.InvAnimComponentTransform.GetRotation().RotateVector(local_44);
        local_498 = this.SmSpine01Pitch * local_15;
        this.ApplySlopeRotCS(this.Spine01Bone, local_498, local_442_3);
        local_498 = this.SmThighLPitch * local_15;
        this.ApplySlopeRotCS(this.ThighLBone, local_498, local_442_3);
        local_498 = this.SmThighRPitch * local_15;
        this.ApplySlopeRotCS(this.ThighRBone, local_498, local_442_3);
        local_498 = this.SmCalfLPitch * local_15;
        this.ApplySlopeRotCS(this.CalfLBone, local_498, local_442_3);
        local_498 = this.SmCalfRPitch * local_15;
        this.ApplySlopeRotCS(this.CalfRBone, local_498, local_442_3);
        local_498 = this.SmLowerarmLPitch * local_15;
        this.ApplySlopeRotCS(this.LowerarmLBone, local_498, local_442_3);
        local_498 = this.SmLowerarmRPitch * local_15;
        this.ApplySlopeRotCS(this.LowerarmRBone, local_498, local_442_3);
        local_478 = this.BonePosWS(this.FootLBone);
        FVector local_490_2 = this.BonePosWS(this.FootRBone);
        FVector local_484_2 = this.BonePosWS(this.CalfLBone);
        FVector local_508 = this.BonePosWS(this.CalfRBone);
        FVector local_514 = this.BonePosWS(this.HandLBone);
        FVector local_520 = this.BonePosWS(this.HandRBone);
        FVector local_526 = this.BonePosWS(this.LowerarmLBone);
        FVector local_532 = this.BonePosWS(this.LowerarmRBone);
        FVector local_550;
        FVector local_556;
        FVector local_562;
        FVector local_568;
        FVector local_574;
        FVector local_580;
        FVector local_586;
        FVector local_592;
        FVector local_598;
        FVector local_604;
        FVector local_610;
        FVector local_616;
        bool local_444_2 = this.TraceDownWSNormal(local_478, local_550, local_598);
        bool local_445 = this.TraceDownWSNormal(local_490_2, local_556, local_604);
        bool local_617 = this.TraceDownWSNoDebug(local_484_2, local_562);
        bool local_618 = this.TraceDownWSNoDebug(local_508, local_568);
        bool local_619 = this.TraceDownWSNormal(local_514, local_574, local_610);
        bool local_620 = this.TraceDownWSNormal(local_520, local_580, local_616);
        bool local_621 = this.TraceDownWSNoDebug(local_526, local_586);
        bool local_622 = this.TraceDownWSNoDebug(local_532, local_592);
        FVector local_544;
        if (local_444_2)
        {
            local_544 = local_550;
        }
        else
        {
            local_544 = FVector::ZeroVector;
        }
        this.CachedFootLHit = local_544;
        FVector local_538;
        if (local_445)
        {
            local_538 = local_556;
        }
        else
        {
            local_538 = FVector::ZeroVector;
        }
        this.CachedFootRHit = local_538;
        if (local_619)
        {
            local_544 = local_574;
        }
        else
        {
            local_544 = FVector::ZeroVector;
        }
        this.CachedHandLHit = local_544;
        if (local_620)
        {
            local_538 = local_580;
        }
        else
        {
            local_538 = FVector::ZeroVector;
        }
        this.CachedHandRHit = local_538;
        local_497 = this.FootIKAlpha * local_15;
        local_498 = FMath::Clamp(local_497, 0.0f, 1.0f);
        local_495 = this.HandIKAlpha;
        local_495 = FMath::Clamp(local_495 * local_15, 0.0f, 1.0f);
        local_538 = FVector(0.0, 0.0, 1.0);
        local_544 = this.InvAnimComponentTransform.GetRotation().RotateVector(local_538);
        if (local_498 > 0.0f)
        {
            bool local_623;
            if (local_444_2)
            {
                FVector local_638 = local_550;
                if ((local_617 && (((local_562.Z - local_550.Z) > this.MaxFootDrop))))
                {
                    local_638.Z = local_562.Z - this.MaxFootDrop;
                }
                FTransform local_664 = FTransform(this.FootLBone.GetTransform());
                this.SolveFootIKWithCalfCheck(local_638, local_88.GetRotation(), local_664, local_498, this.LegLSolver, this.CalfLBone, "L");
                FTransform local_688 = FTransform(this.FootLBone.GetTransform());
                local_688.SetRotation((this.CalfLBone.GetTransform().GetRotation() * local_240));
                this.FootLBone.SetTransform(local_688);
            }
            if (local_445)
            {
                FVector local_638_2 = local_556;
                local_623 = local_618 && (((local_568.Z - local_556.Z) > this.MaxFootDrop));
                if (local_623)
                {
                    float local_46_3 = local_568.Z - this.MaxFootDrop;
                    local_638_2.Z = local_46_3;
                }
                FTransform local_664_2 = FTransform(this.FootRBone.GetTransform());
                this.SolveFootIKWithCalfCheck(local_638_2, local_136.GetRotation(), local_664_2, local_498, this.LegRSolver, this.CalfRBone, "R");
                FTransform local_688_2 = FTransform(this.FootRBone.GetTransform());
                local_688_2.SetRotation((this.CalfRBone.GetTransform().GetRotation() * local_232));
                this.FootRBone.SetTransform(local_688_2);
            }
        }
        if (local_495 > 0.0f)
        {
            bool local_623;
            if (local_619)
            {
                FTransform local_688_3 = FTransform(this.HandLBone.GetTransform());
                FVector local_638_3 = local_574;
                if (local_621 && ((local_586.Z - local_574.Z) > this.MaxHandDrop))
                {
                    local_638_3.Z = (local_586.Z - this.MaxHandDrop);
                }
                this.SolveHandIKWithLowerarmCheck(local_638_3, local_160.GetRotation(), local_688_3, local_495, this.ArmLSolver, this.LowerarmLBone);
                FTransform local_664_3 = FTransform(this.HandLBone.GetTransform());
                local_664_3.SetRotation((this.LowerarmLBone.GetTransform().GetRotation() * local_224));
                this.HandLBone.SetTransform(local_664_3);
            }
            if (local_620)
            {
                FTransform local_664_4 = FTransform(this.HandRBone.GetTransform());
                FVector local_638_4 = local_580;
                if (local_622 && ((local_592.Z - local_580.Z) > this.MaxHandDrop))
                {
                    local_638_4.Z = (local_592.Z - this.MaxHandDrop);
                }
                this.SolveHandIKWithLowerarmCheck(local_638_4, local_184.GetRotation(), local_664_4, local_495, this.ArmRSolver, this.LowerarmRBone);
                FTransform local_688_4 = FTransform(this.HandRBone.GetTransform());
                local_688_4.SetRotation((this.LowerarmRBone.GetTransform().GetRotation() * local_248));
                this.HandRBone.SetTransform(local_688_4);
            }
        }
        return;
    }
    void SolveFootIKWithCalfCheck(const FVector &inout FootHitWS, const FQuat &inout OrigFootRotCS, const FTransform &inout CurrentFootCS, const float32 IKAlpha, FPT_TwoBoneIK &inout LegSolver, FPT_BoneRef &inout CalfBone, const FString &inout Side = "")
    {
        FVector local_18 = FVector(FootHitWS.X, FootHitWS.Y, (FootHitWS.Z + this.FootHitOffset));
        FTransform local_44;
        local_44.SetLocation(this.InvAnimComponentTransform.TransformPosition(local_18));
        local_44.SetRotation(OrigFootRotCS);
        FTransform local_68;
        local_68.Blend(CurrentFootCS, local_44, IKAlpha);
        LegSolver.Solve(local_68);
        FVector local_6 = this.BonePosWS(CalfBone);
        FVector local_80;
        if (this.TraceDownWS(local_6, local_80))
        {
            float32 local_9 = float32(((local_80.Z + this.CalfClearance) - local_6.Z));
            if (local_9 > 0.0f)
            {
                float32 local_86 = FMath::Min(local_9, this.MaxCalfCorrection);
                float local_8_2 = FootHitWS.Z + this.FootHitOffset;
                local_44.SetLocation(this.InvAnimComponentTransform.TransformPosition(FVector(FootHitWS.X, FootHitWS.Y, (local_8_2 + local_86))));
                local_68.Blend(CurrentFootCS, local_44, IKAlpha);
                LegSolver.Solve(local_68);
            }
        }
        return;
    }
    void SolveHandIKWithLowerarmCheck(const FVector &inout HandHitWS, const FQuat &inout OrigHandRotCS, const FTransform &inout CurrentHandCS, const float32 IKAlpha, FPT_TwoBoneIK &inout ArmSolver, FPT_BoneRef &inout LowerarmBone)
    {
        FTransform local_24;
        local_24.SetLocation(this.InvAnimComponentTransform.TransformPosition(HandHitWS));
        local_24.SetRotation(OrigHandRotCS);
        FTransform local_56;
        local_56.Blend(CurrentHandCS, local_24, IKAlpha);
        ArmSolver.Solve(local_56);
        FVector local_30 = this.BonePosWS(LowerarmBone);
        FVector local_68;
        if (this.TraceDownWSNoDebug(local_30, local_68))
        {
            float local_72 = local_68.Z + this.LowerarmClearance;
            float32 local_73 = float32((local_72 - local_30.Z));
            if (local_73 > 0.0f)
            {
                float32 local_80 = FMath::Min(local_73, this.MaxLowerarmCorrection);
                local_72 = HandHitWS.Z + local_80;
                local_24.SetLocation(this.InvAnimComponentTransform.TransformPosition(FVector(HandHitWS.X, HandHitWS.Y, local_72)));
                local_56.Blend(CurrentHandCS, local_24, IKAlpha);
                ArmSolver.Solve(local_56);
            }
        }
        return;
    }
    FVector BonePosWS(FPT_BoneRef &inout Bone)
    {
        return this.AnimComponentTransform.TransformPosition(Bone.GetTransform().GetLocation());
    }
    FVector TraceStartWS(const FVector &inout BoneWorldPos)
    {
        return (BoneWorldPos + FVector(0.0, 0.0, this.TraceUpOffset));
    }
    FVector TraceEndWS(const FVector &inout BoneWorldPos)
    {
        return (BoneWorldPos - FVector(0.0, 0.0, this.TraceDownOffset));
    }
    void DrawTraceDebugWS(const FVector &inout BoneWorldPos, const bool bHit, const FVector &inout HitPointWS, const FColor &inout Color)
    {
        FVector local_12 = this.TraceStartWS(BoneWorldPos);
        FVector local_18 = this.InvAnimComponentTransform.TransformPosition(local_12);
        FVector local_6;
        if (bHit)
        {
            local_6 = HitPointWS;
        }
        else
        {
            local_6 = this.TraceEndWS(BoneWorldPos);
        }
        FVector local_12_2 = this.InvAnimComponentTransform.TransformPosition(local_6);
        this.DrawAnimDebugLine(local_18, local_12_2, Color, EPTDebugDrawSpace(0), 0.0f, true);
        if (bHit)
        {
            this.DrawAnimDebugSphere(local_12_2, 5.0f, 8, Color, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(1));
        }
        return;
    }
    void DrawTriangleDebugWS(const FVector &inout P1, const FVector &inout P2, const FVector &inout P3, const FColor &inout Color)
    {
        FVector local_12 = this.InvAnimComponentTransform.TransformPosition(P1);
        FVector local_6 = this.InvAnimComponentTransform.TransformPosition(P2);
        FVector local_18 = this.InvAnimComponentTransform.TransformPosition(P3);
        this.DrawAnimDebugLine(local_12, local_6, Color, EPTDebugDrawSpace(0), 0.0f, true);
        this.DrawAnimDebugLine(local_6, local_18, Color, EPTDebugDrawSpace(0), 0.0f, true);
        this.DrawAnimDebugLine(local_18, local_12, Color, EPTDebugDrawSpace(0), 0.0f, true);
        return;
    }
    bool TraceDownWS(const FVector &inout BoneWorldPos, FVector &out HitPoint)
    {
        FVector local_6;
        HitPoint = local_6;
        FVector local_18 = this.TraceStartWS(BoneWorldPos);
        FVector local_12 = this.TraceEndWS(BoneWorldPos);
        UESMAnimInstance local_26 = (Cast<UESMAnimInstance>(this.GetAnimInstance()));
        FHitResult local_96 = local_26 != nullptr && local_26.GetbLogicUpdate() ? local_26.Entity.TraceLineByEntity(true, local_18, local_12, false, ECollisionChannel(3)) : this.GetComponentWorld().TraceLine(local_18, local_12, false, ECollisionChannel(3));
        if (local_96.GetbBlockingHit())
        {
            HitPoint = local_96.ImpactPoint;
            return true;
        }
        HitPoint = FVector::ZeroVector;
        return false;
    }
    bool TraceDownWSNoDebug(const FVector &inout BoneWorldPos, FVector &out HitPoint)
    {
        FVector local_6;
        HitPoint = local_6;
        FVector local_18 = this.TraceStartWS(BoneWorldPos);
        FVector local_12 = this.TraceEndWS(BoneWorldPos);
        UESMAnimInstance local_26 = (Cast<UESMAnimInstance>(this.GetAnimInstance()));
        FHitResult local_96 = local_26 != nullptr && local_26.GetbLogicUpdate() ? local_26.Entity.TraceLineByEntity(true, local_18, local_12, false, ECollisionChannel(3)) : this.GetComponentWorld().TraceLine(local_18, local_12, false, ECollisionChannel(3));
        if (local_96.GetbBlockingHit())
        {
            HitPoint = local_96.ImpactPoint;
            return true;
        }
        HitPoint = FVector::ZeroVector;
        return false;
    }
    bool TraceDownWSNormal(const FVector &inout BoneWorldPos, FVector &out HitPoint, FVector &out HitNormal)
    {
        FVector local_6;
        HitPoint = local_6;
        HitNormal = local_6;
        FVector local_24 = this.TraceStartWS(BoneWorldPos);
        FVector local_18 = this.TraceEndWS(BoneWorldPos);
        UESMAnimInstance local_32 = (Cast<UESMAnimInstance>(this.GetAnimInstance()));
        FHitResult local_102 = local_32 != nullptr && local_32.GetbLogicUpdate() ? local_32.Entity.TraceLineByEntity(true, local_24, local_18, false, ECollisionChannel(3)) : this.GetComponentWorld().TraceLine(local_24, local_18, false, ECollisionChannel(3));
        if (local_102.GetbBlockingHit())
        {
            HitPoint = local_102.ImpactPoint;
            HitNormal = local_102.ImpactNormal;
            return true;
        }
        HitPoint = FVector::ZeroVector;
        HitNormal = FVector(0.0, 0.0, 1.0);
        return false;
    }
    float32 SlopeFromNormal(const FVector &inout HitNormalWS, const FVector &inout EntityFwd)
    {
        float32 local_6 = -float32(HitNormalWS.DotProduct(EntityFwd));
        return FMath::RadiansToDegrees(FMath::Atan2(local_6, float32(HitNormalWS.Z)));
    }
    FQuat SurfaceAlignedRotCS(const FQuat &inout OrigBoneRotCS, const FVector &inout SurfaceNormalWS, const FVector &inout UpCS)
    {
        return (FQuat::FindBetweenNormals(UpCS, this.InvAnimComponentTransform.GetRotation().RotateVector(SurfaceNormalWS)) * OrigBoneRotCS);
    }
    float32 ComputePlaneRawSlope(const FVector &inout P1, const FVector &inout P2, const FVector &inout P3, const FVector &inout EntityFwd, const float32 Fallback)
    {
        FVector local_12 = (P2 - P1);
        FVector local_18 = local_12.CrossProduct((P3 - P1));
        float32 local_29 = float32(local_18.Size());
        if (local_29 < 0.001f)
        {
            return Fallback;
        }
        local_18 = (local_18 / local_29);
        if (local_18.Z < 0.0)
        {
            local_18 = local_18.opNeg();
        }
        float32 local_34 = -float32(local_18.DotProduct(EntityFwd));
        return FMath::RadiansToDegrees(FMath::Atan2(local_34, float32(local_18.Z)));
    }
    float32 ComputeTwoPointSlope(const FVector &inout HitA, const FVector &inout HitB, const FVector &inout EntityFwd)
    {
        FVector local_12 = (HitB - HitA);
        float32 local_17 = float32(local_12.DotProduct(EntityFwd));
        if (FMath::Abs(local_17) < 1.0f)
        {
            return 0.0f;
        }
        float32 local_13 = float32((FMath::RadiansToDegrees(FMath::Atan2(local_12.Z, local_17))));
        if (local_13 > 90.0f)
        {
            local_13 = local_13 - 180.0f;
        }
        else
        {
            if (local_13 < -90.0f)
            {
                local_13 = local_13 + 180.0f;
            }
        }
        return local_13;
    }
    void ApplySlopeRotCS(FPT_BoneRef &inout Bone, const float32 Degrees, const FVector &inout AxisCS)
    {
        if (!(Bone.HasValidSetup()) || FMath::IsNearlyZero(Degrees, 1e-8f))
        {
            return;
        }
        FTransform local_28 = FTransform(Bone.GetTransform());
        float32 local_2 = -Degrees;
        local_28.SetRotation((FQuat(AxisCS, FMath::DegreesToRadians(local_2)) * local_28.GetRotation()));
        Bone.SetTransform(local_28);
        return;
    }
}

class USPT_HumanSlopeAdaptation_StdF : USPT_HumanSlopeAdaptation
{
    USPT_HumanSlopeAdaptation_StdF()
    {
        super();
        this.Spine01Bone.SetBoneName(n"spine_01");
        this.UpperarmLBone.SetBoneName(n"upperarm_l");
        this.UpperarmRBone.SetBoneName(n"upperarm_r");
        this.ThighLBone.SetBoneName(n"thigh_l");
        this.ThighRBone.SetBoneName(n"thigh_r");
        this.CalfLBone.SetBoneName(n"calf_l");
        this.CalfRBone.SetBoneName(n"calf_r");
        this.FootLBone.SetBoneName(n"foot_l");
        this.FootRBone.SetBoneName(n"foot_r");
        this.HandLBone.SetBoneName(n"hand_l");
        this.HandRBone.SetBoneName(n"hand_r");
        this.LowerarmLBone.SetBoneName(n"lowerarm_l");
        this.LowerarmRBone.SetBoneName(n"lowerarm_r");
        this.HeadBone.SetBoneName(n"Head");
        this.RootBone.SetBoneName(n"Root");
        this.LegLSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|foot_l");
        this.LegLSolver.EffectorBoneName = n"foot_l";
        this.LegRSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|foot_r");
        this.LegRSolver.EffectorBoneName = n"foot_r";
        this.ArmLSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_l|lowerarm_l|hand_l");
        this.ArmLSolver.EffectorBoneName = n"hand_l";
        this.ArmRSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_r|lowerarm_r|hand_r");
        this.ArmRSolver.EffectorBoneName = n"hand_r";
        return;
    }
}

