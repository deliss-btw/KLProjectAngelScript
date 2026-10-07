

struct FCompensatorParams_Roll
{
    UPROPERTY()
    FRuntimeFloatCurve YawVelocityToRollCurve;
    UPROPERTY()
    FRuntimeFloatCurve RollDistributionCurve;
    UPROPERTY()
    float32 RollSpringStrength = 30.0f;
    UPROPERTY()
    float32 RollSpringDamping = 0.1f;


}

struct FAimPoseCompensatorState_Roll
{
    UPROPERTY()
    float32 PrevBoneYaw = 0.0f;
    UPROPERTY()
    bool bHasPrevFrame = false;
    UPROPERTY()
    TArray<float> BoneLengthRatios;
    UPROPERTY()
    bool bLengthsCached = false;


    void Reset()
    {
        this.PrevBoneYaw = 0.0f;
        this.bHasPrevFrame = false;
        this.bLengthsCached = false;
        return;
    }
}

class UCompensator_RollFromAngularVelocity : UAimPoseCompensator
{
    FPT_BoneChainRef RollChain;
    FPT_FloatSpring RollSpring;
    FCompensatorParams_Roll RollParams;
    FAimPoseCompensatorState_Roll RollState;

    UCompensator_RollFromAngularVelocity()
    {
        super();
        return;
    }
    void InitFromConfig(const FAimPoseCompensatorConfig &inout Cfg, const bool ResetAttr)
    {
        Super::InitFromConfig(Cfg, ResetAttr);
        this.RollSpring.Stiffness = this.RollParams.RollSpringStrength;
        this.RollSpring.Damping = this.RollParams.RollSpringDamping;
        if (ResetAttr)
        {
            this.RollChain.BoneNames = UPoseTweakerUtil::ParseIntoNames(Cfg.BoneChainNames);
            this.RollSpring.Init(0.0, 0.0);
            this.RollState.Reset();
        }
        return;
    }
    void OnInitializeBoneRefs(const USkeletalPoseTweaker Tweaker)
    {
        TSet<FString> local_20;
        FString local_24 = "";
        this.RollChain.Initialize(local_20, local_24);
        if (local_20.Num() > 0)
        {
            FString local_36 = ::AimPoseUtils::Join(local_20, ", ");
            Tweaker.AddOnScreenDebugMessage(FString().Append("AimPose ERROR: [").Append(this.ProcessorName).Append("] BoneChain bones not found: ").Append(local_36), -1, false, 2.0f);
        }
        return;
    }
    void Execute(const FAimPoseCompensatorExecContext &inout Ctx)
    {
        int local_54;
        float32 local_63;
        if (!(this.bEnabled))
        {
            return;
        }
        if (!(this.RollChain.IsValid()) || (Ctx.DeltaTime <= 0.0f))
        {
            return;
        }
        float32 local_2 = float32((this.RollChain.GetTransform((this.RollChain.GetBoneNum() - 1)).GetRotation().Rotator().Yaw));
        float32 local_49 = 0.0f;
        if (this.RollState.bHasPrevFrame)
        {
            local_49 = (float32(FRotator::NormalizeAxis((local_2 - this.RollState.PrevBoneYaw)))) / Ctx.DeltaTime;
        }
        this.RollState.PrevBoneYaw = local_2;
        this.RollState.bHasPrevFrame = true;
        this.RollSpring.Update(Ctx.DeltaTime, (this.RollParams.YawVelocityToRollCurve.GetFloatValue(local_49, 0.0f)));
        float32 local_3 = float32(this.RollSpring.GetPosition()) * this.Weight;
        if (FMath::IsNearlyZero(local_3, 0.01f))
        {
            return;
        }
        this.CacheBoneLengths();
        local_54 = this.RollChain.GetBoneNum();
        TArray<float32> local_58;
        local_58.SetNum(local_54);
        float32 local_59 = 0.0f;
        int local_60 = 0;
        for (; local_60 < local_54; )
        {
            if (local_60 < this.RollState.BoneLengthRatios.Num())
            {
                local_63 = float32(this.RollState.BoneLengthRatios[local_60]);
            }
            else
            {
                int local_7 = local_60 + 1;
                local_63 = local_7 / local_54;
            }
            local_58[local_60] = this.RollParams.RollDistributionCurve.GetFloatValue(local_63, 0.0f);
            if (local_58[local_60] < 0.0f)
            {
                local_58[local_60] = 0.0f;
            }
            local_59 = local_59 + local_58[local_60];
            ++local_60;
        }
        if (FMath::IsNearlyZero(local_59, 1e-8f))
        {
            int local_60_2 = 0;
            for (; local_60_2 < local_54; )
            {
                local_58[local_60_2] = 1.0f;
                ++local_60_2;
            }
            local_59 = local_54;
        }
        int local_60_3 = 0;
        for (; local_60_3 < local_54; )
        {
            FTransform local_32 = this.RollChain.GetTransform(local_60_3);
            local_32.SetRotation((local_32.GetRotation() * FRotator(0.0, 0.0, (local_3 * (local_58[local_60_3] / local_59))).Quaternion()));
            this.RollChain.SetTransform(local_60_3, local_32);
            ++local_60_3;
        }
        return;
    }
    void Setup(const FName &inout InName, const FString &inout ChainStr, const int InOrder = 0)
    {
        Super::SetIdentity(InName, InOrder);
        this.RollChain.BoneNames = UPoseTweakerUtil::ParseIntoNames(ChainStr);
        return;
    }
    void CacheBoneLengths()
    {
        int local_3;
        if (this.RollState.bLengthsCached || !(this.RollChain.IsValid()))
        {
            return;
        }
        local_3 = this.RollChain.GetBoneNum();
        this.RollState.BoneLengthRatios.Reset(local_3);
        this.RollState.BoneLengthRatios.SetNum(local_3);
        float local_6 = 0.0;
        int local_9 = 0;
        for (; local_9 < local_3; ++local_9)
        {
            if (local_9 == 0)
            {
                this.RollState.BoneLengthRatios[local_9] = 0.0;
                continue;
            }
            local_6 = local_6 + (this.RollChain.GetTransform(local_9).GetLocation() - (this.RollChain.GetTransform(local_9 - 1)).GetLocation()).Size();
            this.RollState.BoneLengthRatios[local_9] = local_6;
        }
        if (local_6 > 9.999999747378752e-5)
        {
            int local_9_2 = 0;
            for (; local_9_2 < local_3; )
            {
                float local_12 = this.RollState.BoneLengthRatios[local_9_2];
                local_12 = local_12 / local_6;
                ++local_9_2;
            }
        }
        if (local_3 > 0)
        {
            this.RollState.BoneLengthRatios[(local_3 - 1)] = 1.0;
        }
        this.RollState.bLengthsCached = true;
        return;
    }
}

