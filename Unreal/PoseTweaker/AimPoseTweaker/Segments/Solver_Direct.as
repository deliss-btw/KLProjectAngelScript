

class USolver_DirectWeightCurve : UAimPoseSegmentSolver
{
    EAimPoseYawOutOfRangeMode YawOutOfRangeMode = EAimPoseYawOutOfRangeMode(0);
    float32 HysteresisThreshold = 150.0f;
    float32 NeutralYaw = 0.0f;
    float32 ReturnThreshold = 30.0f;
    float32 RecoverThreshold = 15.0f;
    int HysteresisSign = 0;
    bool bIsOutOfRange = false;
    float32 YawUnwrapPrev = 0.0f;
    float32 YawUnwrapAccum = 0.0f;
    bool bYawUnwrapInit = false;
    EAimPoseYawOutOfRangeMode CfgYawOutOfRangeMode = EAimPoseYawOutOfRangeMode(0);
    float32 CfgHysteresisThreshold = 150.0f;
    float32 CfgNeutralYaw = 0.0f;
    float32 CfgReturnThreshold = 30.0f;
    float32 CfgRecoverThreshold = 15.0f;


    void ResetToConfigDefaults()
    {
        Super::ResetToConfigDefaults();
        this.ResetDirectDefaults();
        return;
    }
    void DebugDraw(const USkeletalPoseTweaker Tweaker)
    {
        return;
    }
    void InitFromConfig(const FAimPoseSegmentConfig &inout Cfg, const bool ResetAttr)
    {
        Super::InitFromConfig(Cfg, ResetAttr);
        if (ResetAttr)
        {
            this.bYawUnwrapInit = false;
        }
        this.CfgYawOutOfRangeMode = Cfg.YawOutOfRangeMode;
        this.CfgHysteresisThreshold = Cfg.HysteresisThreshold;
        this.CfgNeutralYaw = Cfg.NeutralYaw;
        this.CfgReturnThreshold = Cfg.ReturnThreshold;
        this.CfgRecoverThreshold = Cfg.RecoverThreshold;
        this.ResetDirectDefaults();
        return;
    }
    void ApplyOverride(const FAimPoseSegmentOverride &inout Ovr)
    {
        Super::ApplyOverride(Ovr);
        if (Ovr.GetbOverrideYawClampMode())
        {
            this.YawOutOfRangeMode = Ovr.GetYawOutOfRangeMode();
            this.HysteresisThreshold = Ovr.GetHysteresisThreshold();
            this.NeutralYaw = Ovr.GetNeutralYaw();
            this.ReturnThreshold = Ovr.GetReturnThreshold();
            this.RecoverThreshold = Ovr.GetRecoverThreshold();
        }
        return;
    }
    void Solve(const FVector &inout TargetCS, const float32 DeltaTime, FAimPoseSegmentContext &inout Ctx)
    {
        if (!(this.bEnabled) || !(Super::IsValid()))
        {
            return;
        }
        float32 local_3 = 0.0f;
        float32 local_5 = 0.0f;
        if (!(this.ResolveTargetToAngles(TargetCS, DeltaTime, Ctx, local_3, local_5)))
        {
            return;
        }
        this.ApplyResolvedAngles(local_3, local_5, DeltaTime, Ctx);
        return;
    }
    bool ResolveTargetToAngles(const FVector &inout TargetCS, const float32 DeltaTime, FAimPoseSegmentContext &inout Ctx, float32 &inout OutPitch, float32 &inout OutYaw)
    {
        Super::CacheBoneLengths();
        FVector local_12 = Super::CorrectTargetForRootYaw(TargetCS);
        FVector local_6 = FVector(0.0, 0.0, this.AnimLocalTarget.Z);
        FVector local_36 = (this.AnimLocalTarget - local_6);
        FVector local_18 = (local_12 - local_6);
        if (local_36.IsNearlyZero(9.999999747378752e-5) || local_18.IsNearlyZero(9.999999747378752e-5))
        {
            return false;
        }
        float local_22 = FMath::Atan2(local_36.Y, local_36.X);
        float local_22_2 = FMath::Atan2(local_18.Y, local_18.X);
        float local_22_3 = FMath::RadiansToDegrees(float32(local_22_2) - float32(local_22));
        OutYaw = float32(FRotator::NormalizeAxis(local_22_3));
        float local_22_4 = local_18.X;
        float local_24_4 = FMath::Atan2(local_36.Z, (float32((FVector(local_36.X, local_36.Y, 0.0).Size()))));
        float local_24_5 = (float32((FVector(local_22_4, local_18.Y, 0.0).Size())));
        float local_22_5 = FMath::Atan2(local_18.Z, local_24_5);
        OutPitch = FMath::RadiansToDegrees(float32(local_22_5) - float32(local_24_4));
        return true;
    }
    void ApplyResolvedAngles(const float32 RawPitch, const float32 RawYaw, const float32 DeltaTime, FAimPoseSegmentContext &inout Ctx)
    {
        Super::CacheBoneLengths();
        FQuat local_16 = Super::GetLastBoneRotation();
        FVector local_28 = Super::GetLastBoneLocation();
        float32 local_32 = FMath::Clamp(RawPitch, this.SegmentPitchMin, this.SegmentPitchMax);
        float32 local_30 = this.ClampYawByMode(RawYaw, RawPitch);
        Super::ApplyDamp(DeltaTime, local_32, local_30);
        local_32 = local_32 * this.Weight;
        local_30 = local_30 * this.Weight;
        Super::DistributeWeightCurve(local_32, local_30, Ctx);
        Super::OutputContext(local_16, local_28, Ctx);
        return;
    }
    void ResetDirectDefaults()
    {
        this.YawOutOfRangeMode = this.CfgYawOutOfRangeMode;
        this.HysteresisThreshold = this.CfgHysteresisThreshold;
        this.NeutralYaw = this.CfgNeutralYaw;
        this.ReturnThreshold = this.CfgReturnThreshold;
        this.RecoverThreshold = this.CfgRecoverThreshold;
        return;
    }
    float32 ClampYawByMode(const float32 RawYaw, const float32 RawPitch)
    {
        float32 local_8 = 0.0f;
        switch (int(this.YawOutOfRangeMode))
        {
        case 0:
        {
            return ::AimPoseUtils::ProcessHysteresisClampStateless(RawYaw, this.SegmentYawMin, this.SegmentYawMax, this.HysteresisThreshold, this.HysteresisSign);
        }
        case 1:
        {
            return ::AimPoseUtils::ProcessReturnToNeutralStateless(RawYaw, this.SegmentYawMin, this.SegmentYawMax, this.NeutralYaw, this.ReturnThreshold, this.RecoverThreshold, this.bIsOutOfRange);
        }
        case 2:
        {
            return Super::ProcessFreeRotateYaw(RawYaw, this.YawUnwrapPrev, this.YawUnwrapAccum, this.bYawUnwrapInit);
        }
        default:
        {
            local_8 = FMath::Clamp(RawYaw, this.SegmentYawMin, this.SegmentYawMax);
        }
        }
        return local_8;
    }
}

