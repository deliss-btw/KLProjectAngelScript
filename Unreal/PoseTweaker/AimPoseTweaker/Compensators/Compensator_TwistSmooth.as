

struct FCompensatorParams_TwistSmooth
{
    UPROPERTY()
    int NumBonesToAdjust = 3;
    UPROPERTY()
    float32 DecayPercent = 0.9f;


}

class UCompensator_TwistSmooth : UAimPoseCompensator
{
    FPT_BoneChainRef TwistChain;
    FCompensatorParams_TwistSmooth TwistParams;

    UCompensator_TwistSmooth()
    {
        super();
        return;
    }
    void InitFromConfig(const FAimPoseCompensatorConfig &inout Cfg, const bool ResetAttr)
    {
        Super::InitFromConfig(Cfg, ResetAttr);
        this.TwistParams = Cfg.TwistSmoothParams;
        if (ResetAttr)
        {
            this.TwistChain.BoneNames = UPoseTweakerUtil::ParseIntoNames(Cfg.BoneChainNames);
        }
        return;
    }
    void OnInitializeBoneRefs(const USkeletalPoseTweaker Tweaker)
    {
        TSet<FString> local_20;
        FString local_24 = "";
        this.TwistChain.Initialize(local_20, local_24);
        if (local_20.Num() > 0)
        {
            FString local_36 = ::AimPoseUtils::Join(local_20, ", ");
            Tweaker.AddOnScreenDebugMessage(FString().Append("AimPose ERROR: [").Append(this.ProcessorName).Append("] BoneChain bones not found: ").Append(local_36), -1, false, 2.0f);
        }
        return;
    }
    void Execute(const FAimPoseCompensatorExecContext &inout Ctx)
    {
        int local_2;
        if (!(this.bEnabled))
        {
            return;
        }
        if (!(this.TwistChain.IsValid()))
        {
            return;
        }
        local_2 = this.TwistChain.GetBoneNum();
        if (local_2 < 3)
        {
            return;
        }
        int local_3 = local_2 - 1;
        int local_4 = local_2 - 2;
        FTransform local_56 = this.TwistChain.GetTransform(local_4);
        FTransform local_32 = this.TwistChain.GetTransform(local_3);
        FVector local_116 = FQuat::FindBetweenNormals(local_56.GetRotation().GetAxisX(), local_32.GetRotation().GetAxisX()).RotateVector(local_56.GetRotation().GetAxisZ());
        FQuat local_104 = FQuat::FindBetweenNormals(local_116, local_32.GetRotation().GetAxisZ());
        float32 local_139 = float32(FMath::RadiansToDegrees(local_104.GetAngle()));
        float32 local_133 = this.Weight;
        float32 local_140 = this.TwistParams.DecayPercent;
        local_133 = local_133 * local_140;
        local_139 = local_139 * local_133;
        if (FMath::IsNearlyZero(local_139, 0.1f))
        {
            return;
        }
        if (local_32.InverseTransformVector(local_104.GetRotationAxis()).X > 0.0)
        {
            local_140 = 1.0f;
        }
        else
        {
            local_140 = -1.0f;
        }
        FTransform local_172 = local_32;
        int local_175 = FMath::Min(this.TwistParams.NumBonesToAdjust, local_4 + 1);
        TArray<FTransform> local_180;
        local_180.SetNum(local_175);
        int local_181 = local_175;
        for (; local_181 > 0; )
        {
            local_180[(local_175 - local_181)] = this.TwistChain.GetTransform((local_4 + 1) - local_181);
            --local_181;
        }
        int local_5 = local_175;
        for (; local_5 > 0; )
        {
            int local_173_2 = local_4 + 1;
            int local_174 = local_173_2 - local_5;
            FTransform local_208 = FTransform(local_180[local_175 - local_5]);
            float32 local_133_2 = local_139 / local_175;
            local_173_2 = (local_175 + 1) - local_5;
            FQuat local_88 = FQuat(FVector(local_140, 0.0, 0.0), FMath::DegreesToRadians(local_133_2 * local_173_2));
            FTransform local_248;
            local_248.SetLocation(local_208.GetLocation());
            local_248.SetRotation((local_208.GetRotation() * local_88));
            local_248.SetScale3D(local_208.GetScale3D());
            this.TwistChain.SetTransform(local_174, local_248);
            --local_5;
        }
        this.TwistChain.SetTransform(local_3, local_172);
        return;
    }
    void Setup(const FName &inout InName, const FString &inout ChainStr, const int InOrder = 0)
    {
        Super::SetIdentity(InName, InOrder);
        this.TwistChain.BoneNames = UPoseTweakerUtil::ParseIntoNames(ChainStr);
        return;
    }
}

