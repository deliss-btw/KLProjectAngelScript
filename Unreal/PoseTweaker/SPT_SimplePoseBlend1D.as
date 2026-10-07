

class USPT_SimplePoseBlend1D : USkeletalPoseTweaker
{
    UPROPERTY()
    FPT_PoseBlend1D PoseBlendSolver;
    UPROPERTY()
    FPT_BoneRef SourceBone;
    UPROPERTY()
    TArray<FPT_BoneRef> OnlyDriveBones;
    UPROPERTY()
    TObjectPtr<UPoseAsset> PoseAsset;
    UPROPERTY()
    EAxis RotationAxis = EAxis(3);
    UPROPERTY()
    bool bWantDebug = false;
    UPROPERTY()
    FVector SourceBoneEulerRelativeToRefLocal = FVector(0.0, 0.0, 0.0);


    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        if (!(this.SourceBone.HasValidSetup()))
        {
            return;
        }
        FPT_PoseBlend1DParam local_16;
        local_16.SourceBone = this.SourceBone;
        local_16.OnlyDriveBones = this.OnlyDriveBones;
        local_16.PoseAsset = this.PoseAsset;
        if (!(this.PoseBlendSolver.ReInitIfNeeded(local_16)))
        {
            return;
        }
        this.DebugPoseBlend(this.PoseBlendSolver);
        this.PoseBlendSolver.EvaluatePose();
        return;
    }
    void DebugPoseBlend(const FPT_PoseBlend1D &inout PoseBlendPtr)
    {
        if (!(this.bWantDebug))
        {
            return;
        }
        if (!(this.SourceBone.HasValidSetup()))
        {
            return;
        }
        FTransform local_28 = this.GetRefPoseTransformLocal(this.SourceBone.GetBoneIndex());
        local_28.SetRotation((FQuat::MakeFromEuler(this.SourceBoneEulerRelativeToRefLocal) * local_28.GetRotation()));
        this.SetBoneTransformLocal(this.SourceBone.GetBoneIndex(), local_28);
        TArray<EAxis> local_80;
        local_80.Add(this.RotationAxis);
        TArray<FPT_PoseBlend1DResult> local_88 = PoseBlendPtr.DebugGetWeights(local_80);
        int local_93 = 0;
        for (; local_93 < local_88.Num(); ++local_93)
        {
            FPT_PoseBlend1DResult& local_96 = local_88[local_93];
            if (local_96.bValid)
            {
                FString local_110 = FString::ApplyFormat(local_96.RightWeight, ".2f");
                this.AddOnScreenDebugMessage(FString().Append("Pose1=").Append(local_96.LeftPose).Append("(").Append(FString::ApplyFormat(local_96.LeftWeight, ".2f")).Append("), Pose2=").Append(local_96.RightPose).Append("(").Append(local_110).Append(")"), local_93 + 101, false, 2.0f);
                continue;
            }
            this.AddOnScreenDebugMessage(FString().Append("Invalid Weight"), local_93 + 101, false, 2.0f);
        }
        return;
    }
}

class USPT_PoseBlend_UpLeg_Test : USPT_SimplePoseBlend1D
{
    USPT_PoseBlend_UpLeg_Test()
    {
        super();
        this.SourceBone.SetBoneName(n"Bn_L_UpLeg");
        FPT_BoneRef local_6;
        local_6.SetBoneName(n"Bn_L_UpLeg_Driven01");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_L_UpLeg_Driven02");
        this.OnlyDriveBones.Add(local_6);
        return;
    }
}

class USPT_PoseBlend_ElbowL : USPT_SimplePoseBlend1D
{
    USPT_PoseBlend_ElbowL()
    {
        super();
        this.SourceBone.SetBoneName(n"Bn_L_LowArm");
        FPT_BoneRef local_6;
        local_6.SetBoneName(n"Bn_L_LowArm_FixSkin01");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_L_LowArm_FixSkin02");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_L_LowArm_FixSkin03");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_L_LowArm_FixSkin04");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_L_LowArm_FixSkin05");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_L_LowArm_FixSkin06");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_L_LowArm_FixSkin07");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_L_LowArm_FixSkin08");
        this.OnlyDriveBones.Add(local_6);
        return;
    }
}

class USPT_PoseBlend_ElbowR : USPT_SimplePoseBlend1D
{
    USPT_PoseBlend_ElbowR()
    {
        super();
        this.SourceBone.SetBoneName(n"Bn_R_LowArm");
        FPT_BoneRef local_6;
        local_6.SetBoneName(n"Bn_R_LowArm_FixSkin01");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_R_LowArm_FixSkin02");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_R_LowArm_FixSkin03");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_R_LowArm_FixSkin04");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_R_LowArm_FixSkin05");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_R_LowArm_FixSkin06");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_R_LowArm_FixSkin07");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_R_LowArm_FixSkin08");
        this.OnlyDriveBones.Add(local_6);
        return;
    }
}

class USPT_PoseBlend_KneeL : USPT_SimplePoseBlend1D
{
    USPT_PoseBlend_KneeL()
    {
        super();
        this.SourceBone.SetBoneName(n"Bn_L_LowLeg");
        FPT_BoneRef local_6;
        local_6.SetBoneName(n"Bn_L_Knee_Driven01");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_L_Knee_Driven02");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_L_Knee_Driven03");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_L_Knee_Driven04");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_L_Knee_Driven05");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_L_Knee_Driven06");
        this.OnlyDriveBones.Add(local_6);
        return;
    }
}

class USPT_PoseBlend_KneeR : USPT_SimplePoseBlend1D
{
    USPT_PoseBlend_KneeR()
    {
        super();
        this.SourceBone.SetBoneName(n"Bn_R_LowLeg");
        FPT_BoneRef local_6;
        local_6.SetBoneName(n"Bn_R_Knee_Driven01");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_R_Knee_Driven02");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_R_Knee_Driven03");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_R_Knee_Driven04");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_R_Knee_Driven05");
        this.OnlyDriveBones.Add(FPT_BoneRef());
        local_6.SetBoneName(n"Bn_R_Knee_Driven06");
        this.OnlyDriveBones.Add(local_6);
        return;
    }
}

