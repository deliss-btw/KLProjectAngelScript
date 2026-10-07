

class UCompensator_RotationRestore : UAimPoseCompensator
{
    TArray<FPT_BoneRef> AuxBones;
    TArray<FQuat> RotSnaps;

    UCompensator_RotationRestore()
    {
        super();
        return;
    }
    void InitFromConfig(const FAimPoseCompensatorConfig &inout Cfg, const bool ResetAttr)
    {
        Super::InitFromConfig(Cfg, ResetAttr);
        if (ResetAttr && !(Cfg.BoneChainNames.IsEmpty()))
        {
            TArray<FName> local_10 = UPoseTweakerUtil::ParseIntoNames(Cfg.BoneChainNames);
            this.AuxBones.SetNum(local_10.Num());
            int local_12 = 0;
            for (; local_12 < local_10.Num(); )
            {
                this.AuxBones[local_12].SetBoneName(local_10[local_12]);
                ++local_12;
            }
        }
        this.RotSnaps.SetNum(this.AuxBones.Num());
        return;
    }
    void OnInitializeBoneRefs(const USkeletalPoseTweaker Tweaker)
    {
        int local_1 = 0;
        for (; local_1 < this.AuxBones.Num(); ++local_1)
        {
            if (!(Tweaker.InitializeBoneRef(this.AuxBones[local_1])))
            {
                Tweaker.AddOnScreenDebugMessage(FString().Append("AimPose ERROR: [").Append(this.ProcessorName).Append("] AuxBone[").Append(local_1).Append("] '").Append(this.AuxBones[local_1].GetBoneName()).Append("' not found"), -1, false, 2.0f);
            }
        }
        return;
    }
    void Snapshot()
    {
        if (!(this.bEnabled))
        {
            return;
        }
        int local_2 = 0;
        for (; local_2 < this.AuxBones.Num(); ++local_2)
        {
            if (this.AuxBones[local_2].HasValidSetup())
            {
                this.RotSnaps[local_2] = this.AuxBones[local_2].GetRotation();
            }
        }
        return;
    }
    void Execute(const FAimPoseCompensatorExecContext &inout Ctx)
    {
        if (!(this.bEnabled))
        {
            return;
        }
        int local_2 = 0;
        for (; local_2 < this.AuxBones.Num(); ++local_2)
        {
            if (this.AuxBones[local_2].HasValidSetup())
            {
                this.AuxBones[local_2].SetRotation(this.RotSnaps[local_2]);
            }
        }
        return;
    }
    void Setup(const FName &inout InName, const FString &inout BoneNamesStr, const int InOrder = 0)
    {
        Super::SetIdentity(InName, InOrder);
        TArray<FName> local_8 = UPoseTweakerUtil::ParseIntoNames(BoneNamesStr);
        this.AuxBones.SetNum(local_8.Num());
        int local_10 = 0;
        for (; local_10 < local_8.Num(); )
        {
            this.AuxBones[local_10].SetBoneName(local_8[local_10]);
            ++local_10;
        }
        return;
    }
}

