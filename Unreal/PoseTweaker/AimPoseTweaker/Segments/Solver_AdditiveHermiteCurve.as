

class USolver_AdditiveHermiteCurve : UAimPoseSegmentSolver
{
    float32 RootTangentIntensity = 300.0f;
    float32 TailTangentIntensity = 300.0f;
    float32 CfgRootTangentIntensity = 300.0f;
    float32 CfgTailTangentIntensity = 300.0f;
    float32 CfgTargetLimitOuterRadius = 500.0f;
    FAdditiveHermiteCurveConfig AdditiveCfg;
    FAimPoseVectorSpring TargetSpring;
    bool bTargetSpringInitialized = false;
    float TotalNeckLength = 0.0;
    bool bNeckLengthCached = false;
    TArray<float> NeckLengthRatios;
    FVector4f _Padding;


    void ResetToConfigDefaults()
    {
        Super::ResetToConfigDefaults();
        this.ResetAdditiveDefaults();
        return;
    }
    void InitFromConfig(const FAimPoseSegmentConfig &inout Cfg, const bool ResetAttr)
    {
        Super::InitFromConfig(Cfg, ResetAttr);
        this.CfgTargetLimitOuterRadius = this.AdditiveCfg.TargetLimitOuterRadius;
        this.CfgRootTangentIntensity = this.AdditiveCfg.RootTangentIntensity;
        this.CfgTailTangentIntensity = this.AdditiveCfg.TailTangentIntensity;
        this.TargetSpring.SetParams(Cfg.SpringStrength, Cfg.SpringDamping);
        this.ResetAdditiveDefaults();
        if (ResetAttr)
        {
            this.bNeckLengthCached = false;
            this.bTargetSpringInitialized = false;
            this.TotalNeckLength = 0.0;
            this.NeckLengthRatios.Empty(0);
        }
        return;
    }
    void Solve(const FVector &inout TargetCS, const float32 DeltaTime, FAimPoseSegmentContext &inout Ctx)
    {
        int local_3;
        float32 local_253;
        FVector2D local_264;
        float32 local_277;
        if (!(this.bEnabled) || !(Super::IsBoneChainValid()))
        {
            return;
        }
        local_3 = this.BoneChain.GetBoneNum();
        if (local_3 < 3)
        {
            return;
        }
        this.CacheNeckLengths();
        int local_4 = local_3 - 1;
        FQuat local_24 = Super::GetLastBoneRotation();
        FVector local_36 = Super::GetLastBoneLocation();
        if (FMath::IsNearlyZero(this.Weight, 1e-8f))
        {
            Super::OutputContext(local_24, local_36, Ctx);
            return;
        }
        TArray<FQuat> local_42;
        local_42.SetNum(local_3);
        int local_43 = 0;
        for (; local_43 < local_3; )
        {
            local_42[local_43] = this.BoneChain.GetTransform(local_43).GetRotation();
            ++local_43;
        }
        FTransform local_68 = this.BoneChain.GetTransform(0);
        FTransform local_92 = this.BoneChain.GetTransform(local_4);
        FVector local_122 = this.AdditiveCfg.NeckLocalLocation;
        FVector local_30 = this.UpdateTargetDamp(TargetCS, DeltaTime);
        FVector local_128 = FVector(this.AdditiveCfg.ClampNeckLocation.X, 0.0, 0.0);
        FVector local_134 = (::LookRequestLongNeck::ApplyLimitRadiusRestriction(this.AdditiveCfg.TargetLimitOuterRadius, this.AdditiveCfg.TargetLimitX, (local_30 - local_128)) + local_128);
        local_30.X = FMath::Max(local_134.X, local_30.X);
        FVector local_158(local_92.GetRotation().GetAxisX());
        FVector local_146 = (local_30 - local_92.GetLocation());
        if (local_146.IsNearlyZero(9.999999747378752e-5))
        {
            Super::OutputContext(local_24, local_36, Ctx);
            return;
        }
        FQuat local_188 = (FQuat::FindBetween(local_158, local_146) * local_92.GetRotation());
        FRotator local_200 = local_188.Rotator();
        float32 local_204 = FMath::Clamp(float32(local_200.Pitch), this.SegmentPitchMin, this.SegmentPitchMax);
        float32 local_202 = FMath::Clamp(float32(local_200.Yaw), this.SegmentYawMin, this.SegmentYawMax);
        FVector local_164 = (local_30 - local_122);
        FVector2D local_216 = FVector2D(local_164.X, local_164.Y);
        float local_140_4 = 2.0;
        local_140_4 = this.CfgTargetLimitOuterRadius + (local_140_4 * local_122.X);
        float local_220 = FMath::Max(local_164.X, local_140_4);
        float local_138_2 = float32(local_220);
        FVector2D local_224 = FVector2D(local_138_2, local_30.Z);
        FVector2D local_228 = FVector2D(0.0, 0.0);
        float32 local_203 = this.AdditiveCfg.RootTangentYawOffsetCurve.GetFloatValue(local_202, 0.0f);
        FVector2D local_234;
        if (FMath::IsNearlyZero(local_203, 1e-8f))
        {
            local_234 = (FVector2D(1.0, 0.0) * this.RootTangentIntensity);
        }
        else
        {
            float32 local_38 = FMath::Sin(FMath::DegreesToRadians(local_203));
            float local_220_2 = FMath::Cos(FMath::DegreesToRadians(local_203));
            local_234 = ((FVector2D(local_220_2, local_38)) * this.RootTangentIntensity);
        }
        float32 local_38_2 = this.AdditiveCfg.TailIntensityScaleCurve.GetFloatValue(local_202, 0.0f);
        float32 local_243 = this.TailTangentIntensity * local_38_2;
        FHermiteCurve2D local_252;
        float32 local_244 = this.AdditiveCfg.YawToP1LateralCurve.GetFloatValue(local_202, 0.0f);
        float local_140_5 = this.TotalNeckLength;
        float local_138_3 = local_252.SolveP1X(local_228, local_234, local_216, local_244, local_243, local_140_5, 16);
        FVector2D local_260 = FVector2D(local_138_3, local_244);
        FVector2D local_238 = (local_216 - local_260);
        FVector2D local_276;
        if (local_238.Size() > 9.999999747378752e-5)
        {
            local_264 = local_238.GetSafeNormal(9.99999993922529e-9);
            local_276 = (local_264 * local_243);
        }
        else
        {
            local_264 = FVector2D(1.0, 0.0);
            local_276 = (local_264 * local_243);
        }
        local_252.Build(local_228, local_260, local_234, local_276, 0.02);
        float32 local_229 = this.AdditiveCfg.RootTangentPitchOffsetCurve.GetFloatValue(local_202, 0.0f);
        FVector2D local_282;
        if (FMath::IsNearlyZero(local_229, 1e-8f))
        {
            FVector2D local_268 = FVector2D(1.0, 0.0);
            local_282 = (local_268 * this.RootTangentIntensity);
        }
        else
        {
            local_253 = FMath::DegreesToRadians(local_229);
            local_253 = FMath::Cos(FMath::DegreesToRadians(local_229));
            FVector2D local_242_2 = FVector2D(local_253, FMath::Sin(local_253));
            local_282 = (local_242_2 * this.RootTangentIntensity);
        }
        FHermiteCurve2D local_290;
        float32 local_217 = this.AdditiveCfg.PitchToP1VerticalCurve.GetFloatValue(local_204, 0.0f);
        float local_140_11 = local_217;
        float local_220_5 = local_290.SolveP1X(local_228, local_282, local_224, local_140_11, local_243, this.TotalNeckLength, 16);
        FVector2D local_298 = FVector2D(local_220_5, local_217);
        FVector2D local_242_3 = (local_224 - local_298);
        if (local_242_3.Size() > 9.999999747378752e-5)
        {
            local_264 = (local_242_3.GetSafeNormal(9.99999993922529e-9) * local_243);
        }
        else
        {
            FVector2D local_268_2 = FVector2D(1.0, 0.0);
            local_140_11 = local_243;
            local_264 = (local_268_2 * local_140_11);
        }
        local_290.Build(local_228, local_298, local_282, local_264, 0.02);
        TArray<float32> local_310;
        TArray<float32> local_314;
        local_310.SetNum(local_3);
        local_314.SetNum(local_3);
        int local_43_2 = 0;
        for (; local_43_2 < local_3; )
        {
            if (local_43_2 < this.NeckLengthRatios.Num())
            {
                local_140_11 = this.NeckLengthRatios[local_43_2];
            }
            else
            {
                float local_294_2 = (local_3 - 1);
                local_140_11 = float(local_43_2) / local_294_2;
            }
            if (this.AdditiveCfg.bApplyYaw)
            {
                local_253 = local_252.GetAngleAtRatio(local_140_11);
            }
            else
            {
                local_253 = 0.0f;
            }
            local_310[local_43_2] = local_253;
            if (this.AdditiveCfg.bApplyPitch)
            {
                local_277 = local_290.GetAngleAtRatio(local_140_11);
            }
            else
            {
                local_277 = 0.0f;
            }
            local_314[local_43_2] = local_277;
            ++local_43_2;
        }
        local_253 = this.AdditiveCfg.HeadYawOffsetCurve.GetFloatValue(local_202, 0.0f);
        float32 local_318 = this.AdditiveCfg.HeadPitchOffsetCurve.GetFloatValue(local_202, 0.0f);
        if (this.AdditiveCfg.bApplyYaw && !(FMath::IsNearlyZero(local_253, 1e-8f)))
        {
            float32 local_291 = local_310[local_4] + local_253;
        }
        if (this.AdditiveCfg.bApplyPitch && !(FMath::IsNearlyZero(local_318, 1e-8f)))
        {
            float32 local_291_2 = local_314[local_4] + local_318;
        }
        float32 local_321 = FMath::Clamp(this.Weight, 0.0f, 1.0f);
        int local_43_3 = 0;
        FQuat local_172;
        FQuat local_180;
        for (; local_43_3 < local_3; )
        {
            if (this.AdditiveCfg.bApplyYaw)
            {
                local_172 = FRotator(0.0, local_310[local_43_3], 0.0).Quaternion();
            }
            else
            {
                local_172 = FQuat::Identity;
            }
            if (this.AdditiveCfg.bApplyPitch)
            {
                local_180 = FRotator(local_314[local_43_3], 0.0, 0.0).Quaternion();
            }
            else
            {
                local_180 = FQuat::Identity;
            }
            FQuat local_332 = (local_172 * local_180);
            FQuat local_340 = (FQuat::Slerp(FQuat::Identity, local_332, local_321) * local_42[local_43_3]);
            FVector local_370(this.BoneChain.GetTransform(local_43_3).GetLocation());
            this.BoneChain.SetTransform(local_43_3, FTransform(local_340, local_370, FVector::OneVector));
            ++local_43_3;
        }
        Super::OutputContext(local_24, local_36, Ctx);
        return;
    }
    void ResetAdditiveDefaults()
    {
        this.RootTangentIntensity = this.CfgRootTangentIntensity;
        this.TailTangentIntensity = this.CfgTailTangentIntensity;
        return;
    }
    FVector UpdateTargetDamp(const FVector &inout TargetCS, const float32 DeltaTime)
    {
        if (!(this.bEnableDamp))
        {
            this.bTargetSpringInitialized = false;
            return TargetCS;
        }
        this.TargetSpring.SetParams(this.CurSpringStrength, this.CurSpringDamping);
        if (!(this.bTargetSpringInitialized))
        {
            this.TargetSpring.Init(TargetCS, FVector::ZeroVector);
            this.bTargetSpringInitialized = true;
        }
        else
        {
            this.TargetSpring.Update(DeltaTime, TargetCS);
        }
        return this.TargetSpring.GetPosition();
    }
    void CacheNeckLengths()
    {
        int local_3;
        if (this.bNeckLengthCached || !(Super::IsBoneChainValid()))
        {
            return;
        }
        local_3 = this.BoneChain.GetBoneNum();
        if (local_3 < 3)
        {
            this.bNeckLengthCached = true;
            return;
        }
        this.TotalNeckLength = 0.0;
        this.NeckLengthRatios.Reset(local_3);
        this.NeckLengthRatios.SetNum(local_3);
        this.NeckLengthRatios[0] = 0.0;
        int local_7 = 1;
        for (; local_7 < local_3; )
        {
            float local_6_3 = (this.BoneChain.GetTransform(local_7).GetLocation() - this.BoneChain.GetTransform((local_7 - 1)).GetLocation()).Size();
            this.TotalNeckLength += local_6_3;
            this.NeckLengthRatios[local_7] = this.TotalNeckLength;
            ++local_7;
        }
        if (this.TotalNeckLength > 9.999999747378752e-5)
        {
            int local_7_2 = 0;
            for (; local_7_2 < local_3; )
            {
                float local_84 = this.NeckLengthRatios[local_7_2];
                local_84 = local_84 / this.TotalNeckLength;
                ++local_7_2;
            }
        }
        this.NeckLengthRatios[(local_3 - 1)] = 1.0;
        this.bNeckLengthCached = true;
        return;
    }
}

