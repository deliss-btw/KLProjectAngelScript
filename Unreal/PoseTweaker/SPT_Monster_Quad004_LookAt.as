

class USPT_Monster_Quad004_LookAt : USPT_QiongQiD3_FootIK_Base
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

    USPT_Monster_Quad004_LookAt()
    {
        super();
        this.LookingAtControlWeight = 1.0f;
        this.MaxHorizonRotationToRef = 90.0f;
        this.MaxVerticalRotationToRef = 30.0f;
        this.EnableDamping = true;
        this.TargetTM = FTransform(FVector(100.0, 0.0, 0.0));
        this.SpineChain.BoneNames = UPoseTweakerUtil::ParseIntoNames("spine_03|spine_04|neck_01|neck_02|head");
        this.Bn_M_Head.SetBoneName(n"Head");
        this.Bn_L_Shoulder.SetBoneName(n"clavicle_l");
        this.Bn_R_Shoulder.SetBoneName(n"clavicle_r");
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
        bool local_19 = FMath::IsNearlyEqual(local_68.GetScale3D().X, 1.0, 0.01);
        if (local_19)
        {
            FVector local_98(local_68.GetRotation().GetForwardVector());
            FVector local_12 = (local_18 - local_68.GetLocation());
            FRotator local_126 = FQuat::FindBetween(local_98, local_12).Rotator();
            local_126.Pitch = 0.0;
            local_126.Roll = 0.0;
            float32 local_127 = -this.MaxHorizonRotationToRef;
            local_126.Yaw = FMath::Clamp(local_126.Yaw, local_127, this.MaxHorizonRotationToRef);
            local_32 = local_126.Quaternion();
        }
        if (this.EnableDamping)
        {
            local_32 = this.HeadDamping.Update(FTransform(local_32)).GetRotation();
        }
        FTransform local_68_2 = FTransform(this.Leg_FR_IK.GetEffectorTM());
        FTransform local_180 = FTransform(this.Leg_FL_IK.GetEffectorTM());
        FQuat local_188 = FQuat(this.Bn_L_Shoulder.GetRotation());
        FQuat local_196 = FQuat(this.Bn_R_Shoulder.GetRotation());
        TArray<float32> local_200;
        local_200.SetNum(local_20);
        float32 local_201 = 0.0f;
        int local_202 = 0;
        for (; local_202 < local_20; )
        {
            local_200[local_202] = this.SpineRotationRatio.GetFloatValue((float32((local_202 + 1)) / local_20), 0.0f);
            local_201 = local_201 + local_200[local_202];
            ++local_202;
        }
        int local_202_2 = 0;
        for (; local_202_2 < local_20; )
        {
            FTransform local_156 = this.SpineChain.GetTransform(local_202_2);
            local_156.SetRotation((FQuat::Slerp(FQuat::Identity, local_32, (local_200[local_202_2] / local_201)) * local_156.GetRotation()));
            this.SpineChain.SetTransform(local_202_2, local_156);
            ++local_202_2;
        }
        this.Bn_L_Shoulder.SetRotation(local_188);
        this.Bn_R_Shoulder.SetRotation(local_196);
        this.Leg_FL_IK.Solve(local_180);
        this.Leg_FR_IK.Solve(local_68_2);
        return;
    }
}

struct FAngleDampingSettings
{
    UPROPERTY()
    float32 Damping = 0.1f;
    UPROPERTY()
    float32 MaxSpeed = 300.0f;


}

class USPT_Monster_Quad004_LookAt_V2 : USPT_HeadControlTemplate
{
    UPROPERTY()
    float32 LookingAtControlWeight;
    UPROPERTY()
    float32 MaxHorizonRotationToRef;
    UPROPERTY()
    float32 MaxVerticalRotationToRef;
    UPROPERTY()
    FAngleDampingSettings PitchDamping;
    UPROPERTY()
    FAngleDampingSettings YawDamping;
    UPROPERTY()
    FTransform TargetTM;
    UPROPERTY()
    FRuntimeFloatCurve SpineRotationRatio;
    UPROPERTY()
    FPT_BoneChainRef SpineChain;
    UPROPERTY()
    FPT_BoneRef Bn_L_Shoulder;
    UPROPERTY()
    FPT_BoneRef Bn_R_Shoulder;
    UPROPERTY()
    FPT_TwoBoneIK Leg_FL_IK;
    UPROPERTY()
    FPT_TwoBoneIK Leg_FR_IK;
    UPROPERTY()
    FPT_BoneRef Bn_M_Head;
    bool bHasValidSmoothHistory;
    float PrevYaw;
    float PrePitch;

    USPT_Monster_Quad004_LookAt_V2()
    {
        super();
        this.LookingAtControlWeight = 1.0f;
        this.MaxHorizonRotationToRef = 90.0f;
        this.MaxVerticalRotationToRef = 30.0f;
        this.bHasValidSmoothHistory = false;
        this.PrevYaw = 0.0;
        this.PrePitch = 0.0;
        this.TargetTM = FTransform(FVector(100.0, 0.0, 0.0));
        this.SpineChain.BoneNames = UPoseTweakerUtil::ParseIntoNames("spine_03|spine_04|neck_01|neck_02|head");
        this.Bn_M_Head.SetBoneName(n"Head");
        this.Bn_L_Shoulder.SetBoneName(n"clavicle_l");
        this.Bn_R_Shoulder.SetBoneName(n"clavicle_r");
        this.Leg_FL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("clavicle_l|lowerarm_l|fingerbase_l");
        this.Leg_FL_IK.EffectorBoneName = n"middle_01_l";
        this.Leg_FL_IK.OrientBoneName = n"clavicle_l";
        this.Leg_FR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("clavicle_r|lowerarm_r|fingerbase_r");
        this.Leg_FR_IK.OrientBoneName = n"clavicle_r";
        this.Leg_FR_IK.EffectorBoneName = n"middle_01_r";
        this.SpineRotationRatio.AddDefaultKey(0.0f, 0.0f);
        this.SpineRotationRatio.AddDefaultKey(0.5f, 0.5f);
        this.SpineRotationRatio.AddDefaultKey(1.0f, 1.0f);
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        Super::OnInitialization_Implementation();
        this.bHasValidSmoothHistory = false;
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
        FVector local_12 = Super::GetLookAtBoneForwardAxis(this.Bn_M_Head.GetRotation().GetAxisX());
        FVector local_6 = (local_18 - FVector(this.Bn_M_Head.GetLocation()));
        FRotator local_70 = FQuat::FindBetween(local_12, local_6).Rotator();
        local_70.Pitch = 0.0;
        local_70.Roll = 0.0;
        float32 local_73 = -this.MaxHorizonRotationToRef;
        local_70.Yaw = FMath::Clamp(local_70.Yaw, local_73, this.MaxHorizonRotationToRef);
        if (!(this.bHasValidSmoothHistory))
        {
            this.PrevYaw = local_70.Yaw;
            this.PrePitch = local_70.Pitch;
            this.bHasValidSmoothHistory = true;
        }
        local_70.Yaw = this.InterpToWithLimit(this.PrevYaw, local_70.Yaw, this.YawDamping.Damping, (this.CurrentDeltaSeconds * this.YawDamping.MaxSpeed));
        this.PrevYaw = local_70.Yaw;
        local_70.Pitch = this.InterpToWithLimit(this.PrePitch, local_70.Pitch, this.PitchDamping.Damping, (this.CurrentDeltaSeconds * this.PitchDamping.MaxSpeed));
        this.PrePitch = local_70.Pitch;
        local_32 = local_70.Quaternion();
        FTransform local_104 = FTransform(this.Leg_FR_IK.GetEffectorTM());
        FTransform local_152 = FTransform(this.Leg_FL_IK.GetEffectorTM());
        FQuat local_160 = FQuat(this.Bn_L_Shoulder.GetRotation());
        FQuat local_168 = FQuat(this.Bn_R_Shoulder.GetRotation());
        TArray<float32> local_172;
        local_172.SetNum(local_20);
        float32 local_173 = 0.0f;
        int local_174 = 0;
        for (; local_174 < local_20; )
        {
            local_172[local_174] = this.SpineRotationRatio.GetFloatValue(((local_174 + 1) / local_20), 0.0f);
            local_173 = local_173 + local_172[local_174];
            ++local_174;
        }
        int local_174_2 = 0;
        for (; local_174_2 < local_20; )
        {
            FTransform local_128 = this.SpineChain.GetTransform(local_174_2);
            local_128.SetRotation((FQuat::Slerp(FQuat::Identity, local_32, (local_172[local_174_2] / local_173)) * local_128.GetRotation()));
            this.SpineChain.SetTransform(local_174_2, local_128);
            ++local_174_2;
        }
        this.Bn_L_Shoulder.SetRotation(local_160);
        this.Bn_R_Shoulder.SetRotation(local_168);
        this.Leg_FL_IK.Solve(local_152);
        this.Leg_FR_IK.Solve(local_104);
        return;
    }
    float InterpToWithLimit(const float Current, const float Target, const float32 Alpha, const float DiffLimit)
    {
        float local_6 = FMath::Lerp(Current, Target, Alpha);
        if ((local_6 - Current) > DiffLimit)
        {
            return Current + DiffLimit;
        }
        float local_2 = -DiffLimit;
        if ((local_6 - Current) < local_2)
        {
            return Current - DiffLimit;
        }
        return local_6;
    }
}

