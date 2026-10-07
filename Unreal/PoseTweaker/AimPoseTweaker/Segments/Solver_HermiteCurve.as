
const FConsoleVariable CVar_DebugHermiteCurve = FConsoleVariable();

class USolver_HermiteCurve : UAimPoseSegmentSolver
{
    float32 RootTangentIntensity = 300.0f;
    float32 TailTangentIntensity = 300.0f;
    float32 CfgRootTangentIntensity = 300.0f;
    float32 CfgTailTangentIntensity = 300.0f;
    FHermiteCurveConfig HermiteCfg;
    float TotalNeckLength = 0.0;
    bool bNeckLengthCached = false;
    TArray<float> NeckLengthRatios;
    float32 HeadRefPoseRoll = 0.0f;


    void ResetToConfigDefaults()
    {
        Super::ResetToConfigDefaults();
        this.ResetHermiteDefaults();
        return;
    }
    void InitFromConfig(const FAimPoseSegmentConfig &inout Cfg, const bool ResetAttr)
    {
        Super::InitFromConfig(Cfg, ResetAttr);
        this.CfgRootTangentIntensity = this.HermiteCfg.RootTangentIntensity;
        this.CfgTailTangentIntensity = this.HermiteCfg.TailTangentIntensity;
        this.ResetHermiteDefaults();
        if (ResetAttr)
        {
            this.bNeckLengthCached = false;
            this.TotalNeckLength = 0.0;
            this.NeckLengthRatios.Empty(0);
        }
        return;
    }
    void Solve(const FVector &inout TargetCS, const float32 DeltaTime, FAimPoseSegmentContext &inout Ctx)
    {
        int local_3;
        FSCurveShapeConfig local_246;
        float32 local_306;
        float local_348;
        if (!(this.bEnabled) || !(Super::IsBoneChainValid()))
        {
            return;
        }
        int local_4 = this.BoneChain.GetBoneNum();
        local_3 = local_4;
        if (local_3 < 3)
        {
            return;
        }
        this.CacheNeckLengths();
        int local_4_2 = local_3 - 1;
        FQuat local_24 = Super::GetLastBoneRotation();
        FVector local_36 = Super::GetLastBoneLocation();
        if (FMath::IsNearlyZero(this.Weight, 1e-8f))
        {
            Super::OutputContext(local_24, local_36, Ctx);
            return;
        }
        FTransform local_88 = this.BoneChain.GetTransform(0);
        FTransform local_64 = this.BoneChain.GetTransform(local_4_2);
        FVector local_118(local_64.GetRotation().GetAxisX());
        FVector local_130 = (TargetCS - local_64.GetLocation());
        if (local_130.IsNearlyZero(9.999999747378752e-5))
        {
            Super::OutputContext(local_24, local_36, Ctx);
            return;
        }
        FQuat local_156 = (FQuat::FindBetween(local_118, local_130) * local_64.GetRotation());
        FRotator local_168 = local_156.Rotator();
        float32 local_169 = float32(local_168.Yaw);
        float32 local_172 = FMath::Clamp(float32(local_168.Pitch), this.SegmentPitchMin, this.SegmentPitchMax);
        float32 local_170 = FMath::Clamp(local_169, this.SegmentYawMin, this.SegmentYawMax);
        Super::ApplyDamp(DeltaTime, local_172, local_170);
        FQuat local_148 = FRotator(local_172, local_170, 0.0).Quaternion();
        FVector local_194(local_148.GetAxisX());
        float32 local_173 = this.HermiteCfg.HeadPitchOffsetCurve.GetFloatValue(local_170, 0.0f);
        float32 local_195 = this.HermiteCfg.HeadYawOffsetCurve.GetFloatValue(local_170, 0.0f);
        if (!(FMath::IsNearlyZero(local_173, 1e-8f)) || !(FMath::IsNearlyZero(local_195, 1e-8f)))
        {
            local_194 = local_194.RotateAngleAxis(local_173, local_148.GetAxisY());
            local_194 = local_194.RotateAngleAxis(local_195, local_148.GetAxisZ());
        }
        FVector local_202(local_88.GetRotation().GetAxisX());
        FVector local_208(local_88.GetRotation().GetAxisZ());
        float32 local_38 = this.HermiteCfg.RootTangentYawOffsetCurve.GetFloatValue(local_170, 0.0f);
        float32 local_209 = this.HermiteCfg.RootTangentPitchOffsetCurve.GetFloatValue(local_170, 0.0f);
        if (!(FMath::IsNearlyZero(local_38, 1e-8f)) || !(FMath::IsNearlyZero(local_209, 1e-8f)))
        {
            FQuat local_184 = FRotator(local_209, local_38, 0.0).Quaternion();
            local_202 = local_184.RotateVector(local_202);
            local_208 = local_184.RotateVector(local_208);
        }
        FVector local_124 = (local_202 * this.RootTangentIntensity);
        float local_186_2 = (this.HermiteCfg.TailIntensityScaleCurve.GetFloatValue(local_170, 0.0f));
        FVector local_30 = ((local_194 * this.TailTangentIntensity) * local_186_2);
        FHermiteCurveSpline local_244 = FHermiteCurveSpline(local_88.GetLocation(), local_64.GetLocation(), local_124, local_30, local_208, 0.02, this.TotalNeckLength);
        if (local_246.bEnabled)
        {
            FCurveParamValue local_286 = local_244.EvalByLengthRatio(local_246.MidRatio);
            FVector local_226_2 = local_286.Tangent.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            float32 local_210 = local_246.LateralOffset + local_246.LateralOffsetByYawCurve.GetFloatValue(local_170, 0.0f);
            float32 local_227 = local_246.TangentPitchRotation + local_246.TangentPitchByYawCurve.GetFloatValue(local_170, 0.0f);
            int local_307 = 0;
            int local_308 = 1;
            for (; local_308 < this.NeckLengthRatios.Num(); ++local_308)
            {
                if (this.NeckLengthRatios[local_308] >= local_246.MidRatio)
                {
                    local_307 = local_308;
                    break;
                }
            }
            float local_132 = local_210;
            FVector local_316 = (this.BoneChain.GetTransform(local_307).GetRotation().GetAxisY().opNeg() * local_132);
            FVector local_298 = (local_286.Location + local_316);
            FVector local_328 = local_226_2;
            if (!(FMath::IsNearlyZero(local_227, 1e-8f)) || !(FMath::IsNearlyZero(local_246.TangentYawRotation, 1e-8f)))
            {
                local_328 = local_328.RotateAngleAxis(local_227, FVector(0.0, 1.0, 0.0));
                FVector local_322 = FVector(0.0, 0.0, 1.0);
                local_328 = local_328.RotateAngleAxis(local_246.TangentYawRotation, local_322);
            }
            if (local_246.LengthSplitRatio < 0.0f)
            {
                local_306 = local_246.MidRatio;
            }
            else
            {
                local_306 = local_246.LengthSplitRatio;
            }
            local_132 = this.TotalNeckLength * local_306;
            local_186_2 = this.TotalNeckLength * (1.0f - local_306);
            float32 local_305_2 = local_246.MidTangentIntensity;
            FVector local_316_2 = (local_328 * local_305_2);
            local_244.BuildComposite(local_88.GetLocation(), local_298, local_64.GetLocation(), local_124, local_316_2, local_30, local_132, local_186_2, local_208, 0.02);
        }
        else
        {
        }
        float32 local_341 = FMath::Clamp(this.Weight, 0.0f, 1.0f);
        bool local_2 = (local_341 < 0.9999f);
        TArray<FTransform> local_346;
        if (local_2)
        {
            local_346.SetNum(local_3);
            int local_308_2 = 0;
            for (; local_308_2 < local_3; )
            {
                local_346[local_308_2] = this.BoneChain.GetTransform(local_308_2);
                ++local_308_2;
            }
        }
        int local_307_2 = 0;
        for (; local_307_2 < local_3; )
        {
            if (local_307_2 < this.NeckLengthRatios.Num())
            {
                local_348 = this.NeckLengthRatios[local_307_2];
            }
            else
            {
                local_348 = local_307_2 / (local_3 - 1);
            }
            FCurveParamValue local_266 = local_244.EvalByLengthRatio(local_348);
            FTransform local_112 = local_266.MakeTransform();
            if (local_307_2 == local_4_2)
            {
                FRotator local_162 = local_112.GetRotation().Rotator();
                local_162.Roll = this.HeadRefPoseRoll;
                local_112.SetRotation(local_162.Quaternion());
            }
            if (local_2)
            {
                local_112.SetLocation(FMath::Lerp(local_346[local_307_2].GetLocation(), local_112.GetLocation(), local_341));
                local_112.SetRotation(FQuat::Slerp(local_346[local_307_2].GetRotation(), local_112.GetRotation(), local_341));
            }
            this.BoneChain.SetTransform(local_307_2, local_112);
            ++local_307_2;
        }
        Super::OutputContext(local_24, local_36, Ctx);
        return;
    }
    void ResetHermiteDefaults()
    {
        this.RootTangentIntensity = this.CfgRootTangentIntensity;
        this.TailTangentIntensity = this.CfgTailTangentIntensity;
        return;
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
        float local_10_2 = this.BoneChain.GetRefPoseTransform((local_3 - 1)).GetRotation().Rotator().Roll;
        this.HeadRefPoseRoll = float32(local_10_2);
        this.bNeckLengthCached = true;
        return;
    }
}

