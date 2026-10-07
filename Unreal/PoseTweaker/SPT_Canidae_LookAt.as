

class USPT_Canidae_LookAt : USPT_Canidae_FootIK_Base
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
    FPT_BoneRef Bn_L_Shoulder;
    UPROPERTY()
    FPT_BoneRef Bn_R_Shoulder;
    UPROPERTY()
    FPT_BoneRef Bn_M_Head;
    FRotator PrevRotator;

    USPT_Canidae_LookAt()
    {
        super();
        this.LookingAtControlWeight = 1.0f;
        this.MaxHorizonRotationToRef = 150.0f;
        this.MaxVerticalRotationToRef = 30.0f;
        this.EnableDamping = true;
        this.TargetTM = FTransform(FVector(100.0, 0.0, 0.0));
        this.SpineChain.BoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_M_Spine02|Bn_M_Spine03|Bn_M_Spine04|Bn_M_Neck01|Bn_M_Neck02|Bn_M_Neck03|Bn_M_Head");
        this.HeadDamping.LinearSpeedDampingStart = 0.0f;
        this.HeadDamping.LinearOverSpeedDamping = 0.0f;
        this.HeadDamping.AngleSpeedDampingStart = 10.0f;
        this.HeadDamping.AngleOverSpeedDamping = 0.1f;
        this.SpineRotationRatio.AddDefaultKey(0.0f, 0.0f);
        this.SpineRotationRatio.AddDefaultKey(0.5f, 0.5f);
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
        FTransform local_68 = this.Bn_M_Head.GetTransform();
        bool local_19 = FMath::IsNearlyEqual(local_68.GetScale3D().X, 1.0, 9.999999747378752e-5);
        if (local_19)
        {
            FVector local_98(local_68.GetRotation().GetForwardVector());
            FVector local_12 = (local_18 - local_68.GetLocation());
            FRotator local_126 = FQuat::FindBetween(local_98, local_12).Rotator();
            local_126.Pitch = 0.0;
            local_126.Roll = 0.0;
            float32 local_127 = -this.MaxHorizonRotationToRef;
            local_126.Yaw = FMath::Clamp(local_126.Yaw, local_127, this.MaxHorizonRotationToRef);
            local_126.Yaw = FMath::Lerp(this.PrevRotator.Yaw, local_126.Yaw, float(this.HeadDamping.AngleOverSpeedDamping));
            this.PrevRotator = local_126;
            local_32 = local_126.Quaternion();
        }
        FTransform local_68_2 = FTransform(this.Leg_FR_IK.GetEffectorTM());
        FTransform local_156 = FTransform(this.Leg_FL_IK.GetEffectorTM());
        FQuat local_164 = FQuat(this.Bn_L_Shoulder.GetRotation());
        FQuat local_172 = FQuat(this.Bn_R_Shoulder.GetRotation());
        TArray<float32> local_176;
        local_176.SetNum(local_20);
        float32 local_177 = 0.0f;
        int local_178 = 0;
        for (; local_178 < local_20; )
        {
            local_176[local_178] = this.SpineRotationRatio.GetFloatValue(((local_178 + 1) / local_20), 0.0f);
            local_177 = local_177 + local_176[local_178];
            ++local_178;
        }
        int local_178_2 = 0;
        for (; local_178_2 < local_20; )
        {
            FTransform local_92 = this.SpineChain.GetTransform(local_178_2);
            local_92.SetRotation((FQuat::Slerp(FQuat::Identity, local_32, (local_176[local_178_2] / local_177)) * local_92.GetRotation()));
            this.SpineChain.SetTransform(local_178_2, local_92);
            ++local_178_2;
        }
        this.Bn_L_Shoulder.SetRotation(local_164);
        this.Bn_R_Shoulder.SetRotation(local_172);
        this.Leg_FL_IK.Solve(local_156);
        this.Leg_FR_IK.Solve(local_68_2);
        return;
    }
}

