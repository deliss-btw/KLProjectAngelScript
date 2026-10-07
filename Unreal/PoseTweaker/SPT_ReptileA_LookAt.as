

class USPT_ReptileA_LookAt : USPT_ReptileA_FootIK_Base
{
    UPROPERTY()
    float32 LookingAtControlWeight;
    UPROPERTY()
    float32 MaxHorizonRotationToRef;
    UPROPERTY()
    float32 MaxVerticalRotationToRef;
    UPROPERTY()
    bool EnableDamping;
    UPROPERTY()
    FTransform TargetTM;
    UPROPERTY()
    FRuntimeFloatCurve SpineRotationRatio;
    UPROPERTY()
    FPT_BoneChainRef SpineChain;
    UPROPERTY()
    FPT_TransformDamping HeadDamping;
    UPROPERTY()
    FPT_BoneRef clavicle_l;
    UPROPERTY()
    FPT_BoneRef clavicle_r;
    UPROPERTY()
    FPT_BoneRef head;
    UPROPERTY()
    FPT_BoneRef spine_02;
    FRotator PrevRotator;

    USPT_ReptileA_LookAt()
    {
        super();
        this.LookingAtControlWeight = 1.0f;
        this.MaxHorizonRotationToRef = 40.0f;
        this.MaxVerticalRotationToRef = 30.0f;
        this.EnableDamping = true;
        this.TargetTM = FTransform(FVector(100.0, 0.0, 0.0));
        this.SpineChain.BoneNames = UPoseTweakerUtil::ParseIntoNames("spine_03|neck_01|head");
        this.HeadDamping.LinearSpeedDampingStart = 0.0f;
        this.HeadDamping.LinearOverSpeedDamping = 0.0f;
        this.HeadDamping.AngleSpeedDampingStart = 10.0f;
        this.HeadDamping.AngleOverSpeedDamping = 0.1f;
        this.SpineRotationRatio.AddDefaultKey(0.0f, 0.0f);
        this.SpineRotationRatio.AddDefaultKey(0.5f, 0.3f);
        this.SpineRotationRatio.AddDefaultKey(1.0f, 1.0f);
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        Super::OnInitialization_Implementation();
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        int local_20;
        FVector local_18 = this.AnimComponentTransform.InverseTransformPosition(this.TargetTM.GetLocation());
        if (!(this.SpineChain.IsValid()))
        {
            return;
        }
        local_20 = this.SpineChain.GetBoneNum();
        FQuat local_32 = FQuat(FQuat::Identity);
        FVector local_38 = this.RootBoneRef.GetTransform().TransformVector((FVector(1.0, 0.0, 0.0)));
        FTransform local_68 = this.head.GetTransform();
        FTransform local_92 = this.spine_02.GetTransform();
        bool local_19 = FMath::IsNearlyEqual(local_68.GetScale3D().X, 1.0, 9.999999747378752e-5);
        if (local_19)
        {
            FVector local_128 = (local_68.GetLocation() - local_92.GetLocation());
            FVector local_122 = (local_18 - local_92.GetLocation());
            FRotator local_154 = FQuat::FindBetween(local_128, local_122).Rotator();
            local_154.Pitch = 0.0;
            local_154.Roll = 0.0;
            float32 local_155 = -this.MaxHorizonRotationToRef;
            local_154.Yaw = FMath::Clamp(local_154.Yaw, local_155, this.MaxHorizonRotationToRef);
            local_154.Yaw = FMath::Lerp(this.PrevRotator.Yaw, local_154.Yaw, float(this.HeadDamping.AngleOverSpeedDamping));
            this.PrevRotator = local_154;
            local_32 = local_154.Quaternion();
        }
        FTransform local_92_2 = FTransform(this.Leg_FR_IK.GetEffectorTM());
        FTransform local_68_2 = FTransform(this.Leg_FL_IK.GetEffectorTM());
        FQuat local_168 = FQuat(this.clavicle_l.GetRotation());
        FQuat local_176 = FQuat(this.clavicle_r.GetRotation());
        TArray<float32> local_180;
        local_180.SetNum(local_20);
        float32 local_181 = 0.0f;
        int local_182 = 0;
        for (; local_182 < local_20; )
        {
            local_180[local_182] = this.SpineRotationRatio.GetFloatValue(((local_182 + 1) / local_20), 0.0f);
            local_181 = local_181 + local_180[local_182];
            ++local_182;
        }
        int local_182_2 = 0;
        for (; local_182_2 < local_20; )
        {
            FTransform local_116 = this.SpineChain.GetTransform(local_182_2);
            local_116.SetRotation((FQuat::Slerp(FQuat::Identity, local_32, (local_180[local_182_2] / local_181)) * local_116.GetRotation()));
            this.SpineChain.SetTransform(local_182_2, local_116);
            ++local_182_2;
        }
        this.clavicle_l.SetRotation(local_168);
        this.clavicle_r.SetRotation(local_176);
        this.Leg_FL_IK.Solve(local_68_2);
        this.Leg_FR_IK.Solve(local_92_2);
        return;
    }
}

