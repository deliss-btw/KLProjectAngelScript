

struct FCompensatorParams_Propagate
{
    UPROPERTY()
    float32 PropagationRatio = 0.2f;
    UPROPERTY()
    FRuntimeFloatCurve DecayCurve;


}

class UCompensator_RotationPropagate : UAimPoseCompensator
{
    FPT_BoneRef SourceBone;
    FPT_BoneChainRef PropagationChain;
    FCompensatorParams_Propagate PropagateParams;
    FQuat SourceRotSnap;

    UCompensator_RotationPropagate()
    {
        super();
        return;
    }
    void InitFromConfig(const FAimPoseCompensatorConfig &inout Cfg, const bool ResetAttr)
    {
        Super::InitFromConfig(Cfg, ResetAttr);
        if (ResetAttr)
        {
            this.SourceBone.SetBoneName(Cfg.SourceBoneName);
            this.PropagationChain.BoneNames = UPoseTweakerUtil::ParseIntoNames(Cfg.BoneChainNames);
        }
        return;
    }
    void OnInitializeBoneRefs(const USkeletalPoseTweaker Tweaker)
    {
        if (!(Tweaker.InitializeBoneRef(this.SourceBone)))
        {
            this.SourceBone.GetBoneName();
            FString local_6 = FString();
        }
        TSet<FString> local_30;
        FString local_34 = "";
        this.PropagationChain.Initialize(local_30, local_34);
        if (local_30.Num() > 0)
        {
            FString local_6_2 = ::AimPoseUtils::Join(local_30, ", ");
            Tweaker.AddOnScreenDebugMessage(FString().Append("AimPose ERROR: [").Append(this.ProcessorName).Append("] BoneChain bones not found: ").Append(local_6_2), -1, false, 2.0f);
        }
        return;
    }
    void Snapshot()
    {
        if (!(this.bEnabled))
        {
            return;
        }
        if (this.SourceBone.HasValidSetup())
        {
            this.SourceRotSnap = this.SourceBone.GetRotation();
        }
        return;
    }
    void Execute(const FAimPoseCompensatorExecContext &inout Ctx)
    {
        int local_37;
        float32 local_44;
        if (!(this.bEnabled))
        {
            return;
        }
        if (!(this.SourceBone.HasValidSetup()) || !(this.PropagationChain.IsValid()))
        {
            return;
        }
        FQuat local_36 = (this.SourceBone.GetRotation() * this.SourceRotSnap.Inverse());
        local_37 = this.PropagationChain.GetBoneNum();
        int local_39 = 0;
        for (; local_39 < local_37; )
        {
            if (local_37 > 1)
            {
                local_44 = local_39 / (local_37 - 1);
            }
            else
            {
                local_44 = 0.0f;
            }
            float32 local_40 = this.PropagateParams.DecayCurve.GetFloatValue(local_44, 0.0f);
            FTransform local_108 = this.PropagationChain.GetTransform(local_39);
            local_108.SetRotation((FQuat::Slerp(FQuat::Identity, local_36, (this.PropagateParams.PropagationRatio * local_40)) * local_108.GetRotation()));
            this.PropagationChain.SetTransform(local_39, local_108);
            ++local_39;
        }
        return;
    }
    void Setup(const FName &inout InName, const FName &inout SourceBoneName, const FString &inout ChainStr, const int InOrder = 0)
    {
        Super::SetIdentity(InName, InOrder);
        this.SourceBone.SetBoneName(SourceBoneName);
        this.PropagationChain.BoneNames = UPoseTweakerUtil::ParseIntoNames(ChainStr);
        return;
    }
}

