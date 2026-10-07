

class USPT_QiongqiLookAt_v2 : USPT_Qiongqi_FootIK_Base
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
    FPT_BoneRef Bn_M_LookAtTarget;

    USPT_QiongqiLookAt_v2()
    {
        super();
        this.LookingAtControlWeight = 1.0f;
        this.MaxHorizonRotationToRef = 60.0f;
        this.MaxVerticalRotationToRef = 30.0f;
        this.EnableDamping = true;
        this.TargetTM = FTransform(FVector(-500.0, 500.0, 0.0));
        this.SpineChain.BoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_M_Spine02|Bn_M_Spine03|Bn_M_Spine04|Bn_M_Neck01|Bn_M_Neck02|Bn_M_Head");
        this.HeadDamping.LinearSpeedDampingStart = 0.0f;
        this.HeadDamping.LinearOverSpeedDamping = 0.0f;
        this.HeadDamping.AngleSpeedDampingStart = 30.0f;
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
        int local_24;
        FVector local_18 = this.AnimComponentTransform.InverseTransformPosition(this.TargetTM.GetLocation());
        if (local_18.Y < 3.0)
        {
            local_18.Y = 3.0;
        }
        if (!(this.SpineChain.IsValid()))
        {
            return;
        }
        local_24 = this.SpineChain.GetBoneNum();
        FQuat local_36 = FQuat(FQuat::Identity);
        FVector local_42 = FVector(1.0, 0.0, 0.0);
        FVector local_50 = FVector(0.0, 0.0, 100.0);
        local_42 = this.RootBoneRef.GetTransform().TransformVector(local_42);
        local_50 = this.RootBoneRef.GetTransform().TransformPosition(local_50);
        FTransform local_76 = this.Bn_M_LookAtTarget.GetTransform();
        bool local_23 = FMath::IsNearlyEqual(local_76.GetScale3D().X, 1.0, 9.999999747378752e-5);
        if (local_23)
        {
            FVector local_12 = (FVector(local_76.GetLocation()) - local_50);
            FVector local_6 = (local_18 - local_50);
            FRotator local_138 = FQuat::FindBetween(local_42, local_6).Rotator();
            FRotator local_124 = FQuat::FindBetween(local_42, local_12).Rotator();
            float local_44_2 = FMath::Max(this.MaxHorizonRotationToRef, local_124.Yaw);
            float local_148 = FMath::Max(this.MaxVerticalRotationToRef, local_124.Roll);
            local_138.Pitch = 0.0;
            local_138.Yaw = FMath::Min(local_44_2, local_138.Yaw);
            local_138.Roll = 0.0;
            local_36 = FQuat::FindBetween(local_12, local_138.RotateVector(local_42));
        }
        if (this.EnableDamping)
        {
            local_36 = this.HeadDamping.Update(FTransform(local_36)).GetRotation();
        }
        FTransform local_76_2 = FTransform(this.Leg_FR_IK.GetLastBoneTM());
        FTransform local_204 = FTransform(this.Leg_FL_IK.GetLastBoneTM());
        FQuat local_212 = FQuat(this.Bn_L_Shoulder.GetRotation());
        FQuat local_220 = FQuat(this.Bn_R_Shoulder.GetRotation());
        TArray<float32> local_224;
        local_224.SetNum(local_24);
        float32 local_225 = 0.0f;
        int local_226 = 0;
        for (; local_226 < local_24; )
        {
            local_224[local_226] = this.SpineRotationRatio.GetFloatValue((float32((local_226 + 1)) / local_24), 0.0f);
            local_225 = local_225 + local_224[local_226];
            ++local_226;
        }
        int local_226_2 = 0;
        for (; local_226_2 < local_24; )
        {
            FTransform local_100 = this.SpineChain.GetTransform(local_226_2);
            local_100.SetRotation((FQuat::Slerp(FQuat::Identity, local_36, (local_224[local_226_2] / local_225)) * local_100.GetRotation()));
            this.SpineChain.SetTransform(local_226_2, local_100);
            ++local_226_2;
        }
        this.Bn_L_Shoulder.SetRotation(local_212);
        this.Bn_R_Shoulder.SetRotation(local_220);
        this.Leg_FL_IK.Solve(local_204);
        this.Leg_FR_IK.Solve(local_76_2);
        return;
    }
}

