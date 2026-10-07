

class USolver_IterativeCascade : UAimPoseSegmentSolver
{
    float32 RotationFractionPerBone = 0.5f;
    int ForwardAxisIndex = 0;
    EAimPoseYawOutOfRangeMode YawOutOfRangeMode = EAimPoseYawOutOfRangeMode(0);
    float32 HysteresisThreshold = 150.0f;
    float32 NeutralYaw = 0.0f;
    float32 ReturnThreshold = 30.0f;
    float32 RecoverThreshold = 15.0f;
    int HysteresisSign = 0;
    bool bIsOutOfRange = false;
    EAimPoseYawOutOfRangeMode CfgYawOutOfRangeMode = EAimPoseYawOutOfRangeMode(0);
    float32 CfgHysteresisThreshold = 150.0f;
    float32 CfgNeutralYaw = 0.0f;
    float32 CfgReturnThreshold = 30.0f;
    float32 CfgRecoverThreshold = 15.0f;


    void ResetToConfigDefaults()
    {
        Super::ResetToConfigDefaults();
        this.ResetCascadeDefaults();
        return;
    }
    void InitFromConfig(const FAimPoseSegmentConfig &inout Cfg, const bool ResetAttr)
    {
        Super::InitFromConfig(Cfg, ResetAttr);
        this.RotationFractionPerBone = Cfg.RotationFractionPerBone;
        this.ForwardAxisIndex = int(Cfg.ForwardAxisIndex);
        this.CfgYawOutOfRangeMode = Cfg.YawOutOfRangeMode;
        this.CfgHysteresisThreshold = Cfg.HysteresisThreshold;
        this.CfgNeutralYaw = Cfg.NeutralYaw;
        this.CfgReturnThreshold = Cfg.ReturnThreshold;
        this.CfgRecoverThreshold = Cfg.RecoverThreshold;
        this.ResetCascadeDefaults();
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
        int local_33;
        if (!(this.bEnabled) || !(Super::IsValid()))
        {
            return;
        }
        if (Super::IsSingleBoneValid() || !(Super::IsBoneChainValid()))
        {
            return;
        }
        FQuat local_20 = Super::GetLastBoneRotation();
        FVector local_32 = Super::GetLastBoneLocation();
        local_33 = this.BoneChain.GetBoneNum();
        int local_35 = 0;
        for (; local_35 < local_33; ++local_35)
        {
            FTransform local_84 = this.BoneChain.GetTransform(local_35);
            FVector local_90(local_84.GetLocation());
            if (Ctx.bValid && (local_35 == 0))
            {
                local_90 = (Ctx.PivotLocation + (Ctx.AccumulatedDeltaQ.RotateVector((local_90 - Ctx.PivotLocation))));
            }
            FVector local_26 = this.GetForwardAxis(local_84.GetRotation());
            FVector local_98 = (TargetCS - local_90);
            if (local_98.IsNearlyZero(9.999999747378752e-5))
            {
                continue;
            }
            FRotator local_140 = FQuat::FindBetween(local_26, local_98).Rotator();
            local_140.Pitch = FMath::Clamp(float32(local_140.Pitch), this.SegmentPitchMin, this.SegmentPitchMax);
            local_140.Yaw = this.ClampYawByMode(float32(local_140.Yaw), float32(local_140.Pitch));
            local_140.Roll = 0.0;
            FQuat local_160 = FQuat::Slerp(FQuat::Identity, local_140.Quaternion(), this.RotationFractionPerBone);
            if (this.bEnableDamp && (local_35 == 0))
            {
                FRotator local_134 = local_160.Rotator();
                this.PitchSpring.Update(DeltaTime, float32(local_134.Pitch));
                this.YawSpring.Update(DeltaTime, float32(local_134.Yaw));
            }
            local_84.SetRotation((local_160 * local_84.GetRotation()));
            this.BoneChain.SetTransform(local_35, local_84);
        }
        Super::OutputContext(local_20, local_32, Ctx);
        return;
    }
    void ResetCascadeDefaults()
    {
        this.YawOutOfRangeMode = this.CfgYawOutOfRangeMode;
        this.HysteresisThreshold = this.CfgHysteresisThreshold;
        this.NeutralYaw = this.CfgNeutralYaw;
        this.ReturnThreshold = this.CfgReturnThreshold;
        this.RecoverThreshold = this.CfgRecoverThreshold;
        return;
    }
    FVector GetForwardAxis(const FQuat &inout Rotation) const
    {
        FVector __return;
        int local_1 = this.ForwardAxisIndex;
        if (local_1 <= 2)
        {
            if (local_1 != 1)
            {
                if (local_1 != 2)
                {
                }
            }
            else
            {
                __return = Rotation.GetUpVector();
                __return = Rotation.GetRightVector();
            }
        }
        return Rotation.GetForwardVector();
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
            return RawYaw;
        }
        default:
        {
            local_8 = FMath::Clamp(RawYaw, this.SegmentYawMin, this.SegmentYawMax);
        }
        }
        return local_8;
    }
}

