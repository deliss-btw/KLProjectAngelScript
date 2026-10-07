

class UCompensator_TwoBoneIK : UAimPoseCompensator
{
    FPT_TwoBoneIK IKSolver;
    FPT_BoneRef TargetBone;
    FTransform TargetSnap;

    UCompensator_TwoBoneIK()
    {
        super();
        return;
    }
    void InitFromConfig(const FAimPoseCompensatorConfig &inout Cfg, const bool ResetAttr)
    {
        Super::InitFromConfig(Cfg, ResetAttr);
        if (ResetAttr)
        {
            this.TargetBone.SetBoneName(Cfg.EffectorBoneName);
            this.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames(Cfg.BoneChainNames);
            this.IKSolver.EffectorBoneName = Cfg.EffectorBoneName;
        }
        return;
    }
    void OnInitializeBoneRefs(const USkeletalPoseTweaker Tweaker)
    {
        if (!(Tweaker.InitializeBoneRef(this.TargetBone)))
        {
            this.TargetBone.GetBoneName();
            FString local_6 = FString();
        }
        if (!(this.IKSolver.Initialize()))
        {
            Tweaker.AddOnScreenDebugMessage(FString().Append("AimPose ERROR: [").Append(this.ProcessorName).Append("] IKSolver initialize failed"), -1, false, 2.0f);
        }
        return;
    }
    void Snapshot()
    {
        if (!(this.bEnabled))
        {
            return;
        }
        if (this.TargetBone.HasValidSetup())
        {
            this.TargetSnap = this.TargetBone.GetTransform();
        }
        return;
    }
    void Execute(const FAimPoseCompensatorExecContext &inout Ctx)
    {
        if (!(this.bEnabled))
        {
            return;
        }
        this.IKSolver.Solve(this.TargetSnap);
        return;
    }
    void Setup(const FName &inout InName, const FName &inout TargetBoneName, const FString &inout IKChainStr, const FName &inout EffectorName, const int InOrder = 0)
    {
        Super::SetIdentity(InName, InOrder);
        this.TargetBone.SetBoneName(TargetBoneName);
        this.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames(IKChainStr);
        this.IKSolver.EffectorBoneName = EffectorName;
        return;
    }
}

