

struct FAnimGroundRefInfo
{
    UPROPERTY()
    FVector Location;
    UPROPERTY()
    FVector Up;
    UPROPERTY()
    bool bInitialized = false;
    UPROPERTY()
    float32 UpInterpSpeed = 90.0f;


    void UpdateGroundRef(const FPT_BoneRef &inout AttachBone, const FName &inout AttribName, const float32 DeltaTime, const bool bForceIgnoreAnim = false)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FVector GetHeightVectorAlongUpDir(const FVector &inout InLocation) const
    {
        return (InLocation - this).ProjectOnTo(this.Up);
    }
    float32 GetHeightAlongUpDir(const FVector &inout InLocation) const
    {
        return float32(((InLocation - this).DotProduct(this.Up)));
    }
}

class USPT_HumanFootIK_Base : USPT_GroundTraceBase
{
    UPROPERTY()
    FKLFootIKInstance LegL_IK;
    UPROPERTY()
    FKLFootIKInstance LegR_IK;
    UPROPERTY()
    float32 LegL_IK_Weight;
    UPROPERTY()
    float32 LegR_IK_Weight;
    UPROPERTY()
    float32 MaxPelvisOffsetDistance2D;
    UPROPERTY()
    float32 MaxUpLegToFootLengthRatio;
    UPROPERTY()
    float32 PelvisOffsetStartVelocity;
    UPROPERTY()
    float32 EstimatedSpeed;
    UPROPERTY()
    float32 MaxLocomotionAcc;
    float32 SmoothedEstimatedSpeed;
    UPROPERTY()
    FFootEffectorDebugDrawFlags EffectorDebugDraw;
    UPROPERTY()
    bool bDebugInfo;
    UPROPERTY()
    FPT_BoneRef Bn_M_Root;
    UPROPERTY()
    float32 FootHeightOffset;
    UPROPERTY()
    FName GroundRefAttributeName;
    UPROPERTY()
    FPT_BoneRef LegRoot_L;
    UPROPERTY()
    FPT_BoneRef LegRoot_R;
    UPROPERTY()
    FPT_BoneRef LegEnd_L;
    UPROPERTY()
    FPT_BoneRef LegEnd_R;
    float LegRestLength_L;
    float LegRestLength_R;
    FPT_DistanceDamping FootL_HeightDamper;
    FPT_DistanceDamping FootR_HeightDamper;
    FAnimGroundRefInfo AnimGroundRef;
    uint LastUpdateFrame;

    USPT_HumanFootIK_Base()
    {
        super();
        this.LegL_IK_Weight = 1.0f;
        this.LegR_IK_Weight = 1.0f;
        this.MaxPelvisOffsetDistance2D = 0.0f;
        this.MaxUpLegToFootLengthRatio = 0.99f;
        this.PelvisOffsetStartVelocity = 50.0f;
        this.EstimatedSpeed = 0.0f;
        this.MaxLocomotionAcc = 250.0f;
        this.SmoothedEstimatedSpeed = 0.0f;
        this.bDebugInfo = false;
        this.FootHeightOffset = 0.0f;
        this.GroundRefAttributeName = n"GroundReference";
        this.LegRestLength_L = 0.0;
        this.LegRestLength_R = 0.0;
        this.LastUpdateFrame = 65535;
        this.LegL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|foot_l");
        this.LegL_IK.EffectorBoneName = n"ball_l";
        this.LegR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|foot_r");
        this.LegR_IK.EffectorBoneName = n"ball_r";
        this.GroundTracePointNum = 9;
        this.GroundTraceRadiusY = 16.0f;
        this.GroundTraceRadiusX = 16.0f;
        this.GroundTraceParams.DownOffset = 40.0f;
        this.GroundTraceParams.UpOffset = 40.0f;
        this.GroundTraceParams.MaxHeightGap = 35.0f;
        this.GroundTraceParams.MaxSlopeAngle = 40.0f;
        this.FootR_HeightDamper.LinearOverSpeedDamping = 40.0f;
        this.FootR_HeightDamper.LinearOverSpeedDamping = 40.0f;
        this.LegRoot_L.SetBoneName(n"thigh_l");
        this.LegRoot_R.SetBoneName(n"thigh_r");
        this.LegEnd_L.SetBoneName(n"foot_l");
        this.LegEnd_R.SetBoneName(n"foot_r");
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        if (!(this.RootBoneRef.HasValidSetup()))
        {
            return;
        }
        ::FootIKUtils::CreateGroundPlaneTraceParams(this.GroundTraceParams, this.GroundTracePointNum, int(this.GroundTraceRadiusX), this.GroundTraceRadiusY);
        this.HeightProbeRadiusCurve = FRuntimeCurveUtils::CreateAutoTangent(0.0f, 0.0f, 15.0f, 15.0f, 18.0f, 16.0f);
        this.LegRestLength_L = this.GetBoneChainLength(this.LegRoot_L.GetBoneName(), this.LegEnd_L.GetBoneName());
        this.LegRestLength_R = this.GetBoneChainLength(this.LegRoot_R.GetBoneName(), this.LegEnd_R.GetBoneName());
        this.LastUpdateFrame = 65535;
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    float GetBoneChainLength(const FName &inout StartBoneName, const FName &inout EndBoneName)
    {
        float local_2 = 0.0;
        TArray<int> local_12 = this.GetBoneIndicesOnChain(StartBoneName, EndBoneName);
        int local_13 = 1;
        for (; local_13 < local_12.Num(); )
        {
            local_2 = local_2 + (this.GetBoneTransformCS((local_12[local_13 - 1])).GetLocation() - this.GetBoneTransformCS(local_12[local_13]).GetLocation()).Size();
            ++local_13;
        }
        return local_2;
    }
    FVector CalculatePelvisOffsetOnSlope()
    {
        float local_60 = 0.0;
        bool local_19 = (this.LegEnd_L.GetLocation().Z < this.LegEnd_R.GetLocation().Z);
        FVector local_32;
        if (local_19)
        {
            local_32 = this.LegEnd_R.GetLocation();
        }
        else
        {
            local_32 = this.LegEnd_L.GetLocation();
        }
        FVector local_14;
        if (local_19)
        {
            local_14 = this.LegEnd_L.GetLocation();
        }
        else
        {
            local_14 = this.LegEnd_R.GetLocation();
        }
        FVector local_8 = (local_14 - local_32).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        float local_48 = FMath::Clamp(FMath::Abs(local_8.DotProduct(FVector::UpVector)) * 2.0, 0.0, 1.0);
        if (FMath::IsNearlyZero(local_48, 0.01))
        {
            return FVector::ZeroVector;
        }
        FVector local_58 = FVector(local_8.X, local_8.Y, 0.0);
        if (local_58.IsNearlyZero(9.999999747378752e-5))
        {
            local_58 = FVector::ZeroVector;
        }
        else
        {
            local_58 = local_58.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        }
        FVector local_44 = (local_58 * (this.MaxPelvisOffsetDistance2D * local_48));
        if (local_19)
        {
        }
        else
        {
        }
        GetLocation();
        FVector local_38;
        FVector local_74 = local_38;
        if (local_19)
        {
        }
        else
        {
        }
        FVector local_68 = (FVector(FVector::UpVector) * (-(this.GetMinDownwardPelvisOffsetZ(local_74, local_14, local_60))));
        return (local_44 + (local_68 * local_48));
    }
    float GetMinDownwardPelvisOffsetZ(const FVector &inout UpLeg, const FVector &inout Foot, const float LegRestLength)
    {
        FVector local_12 = (UpLeg - Foot);
        float local_16 = local_12.Size();
        float local_14 = LegRestLength * this.MaxUpLegToFootLengthRatio;
        if (local_16 > local_14)
        {
            FVector local_6 = (local_12 / local_16);
            float local_18 = local_6.DotProduct(FVector::UpVector);
            float local_30 = 1.0;
            float local_28 = (-2.0 * local_16) * local_18;
            float local_32 = local_16 * local_16;
            float local_36 = local_14 * local_14;
            local_32 = local_32 - local_36;
            local_36 = local_28 * local_28;
            float local_34 = (4.0 * local_30) * local_32;
            local_36 = local_36 - local_34;
            if (local_36 >= 0.0)
            {
                local_34 = FMath::Sqrt(local_36);
                float local_38 = -local_28;
                if ((local_38 - local_34) >= 0.0)
                {
                    local_38 = -local_28 - local_34;
                    return local_38 / (2.0 * local_30);
                }
                float local_42_2 = -local_28 + local_34;
                local_38 = 2.0 * local_30;
                return FMath::Max((local_42_2 / local_38), 0.0);
            }
        }
        return 0.0;
    }
}

class USPT_StdF_Base_FootIK : USPT_HumanFootIK_Base
{
    USPT_StdF_Base_FootIK()
    {
        super();
        this.FootHeightOffset = 0.9f;
        this.LegL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|foot_l");
        this.LegL_IK.EffectorBoneName = n"ball_l";
        this.LegL_IK.PoleOffset = FVector(0.0, 30.0, 0.0);
        this.LegL_IK.ReachRatio = 0.999f;
        this.LegL_IK.OrientBoneWeightR = 0.8f;
        this.LegL_IK.OrientBoneWeightT = 0.2f;
        this.LegL_IK.OrientBoneMaxDistance = 10.0f;
        this.LegR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|foot_r");
        this.LegR_IK.EffectorBoneName = n"ball_r";
        this.LegR_IK.PoleOffset = FVector(0.0, -30.0, 0.0);
        this.LegR_IK.ReachRatio = 0.999f;
        this.LegR_IK.OrientBoneWeightR = 0.8f;
        this.LegR_IK.OrientBoneWeightT = 0.2f;
        this.LegR_IK.OrientBoneMaxDistance = 10.0f;
        this.Bn_M_Root.SetBoneName(n"pelvis");
        return;
    }
}

class USPT_StdM_Base_FootIK : USPT_HumanFootIK_Base
{
    USPT_StdM_Base_FootIK()
    {
        super();
        this.FootHeightOffset = 0.0f;
        this.LegL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|foot_l");
        this.LegL_IK.EffectorBoneName = n"ball_l";
        this.LegL_IK.PoleOffset = FVector(0.0, 30.0, 0.0);
        this.LegL_IK.ReachRatio = 0.999f;
        this.LegL_IK.OrientBoneWeightR = 0.8f;
        this.LegL_IK.OrientBoneWeightT = 0.2f;
        this.LegL_IK.OrientBoneMaxDistance = 10.0f;
        this.LegR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|foot_r");
        this.LegR_IK.EffectorBoneName = n"ball_r";
        this.LegR_IK.PoleOffset = FVector(0.0, -30.0, 0.0);
        this.LegR_IK.ReachRatio = 0.999f;
        this.LegR_IK.OrientBoneWeightR = 0.8f;
        this.LegR_IK.OrientBoneWeightT = 0.2f;
        this.LegR_IK.OrientBoneMaxDistance = 10.0f;
        this.Bn_M_Root.SetBoneName(n"pelvis");
        return;
    }
}

class USPT_Monster_Base_FootIK : USPT_HumanFootIK_Base
{
    USPT_Monster_Base_FootIK()
    {
        super();
        this.FootHeightOffset = 0.0f;
        this.LegL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|foot_l");
        this.LegL_IK.EffectorBoneName = n"ball_l";
        this.LegL_IK.PoleOffset = FVector(0.0, 30.0, 0.0);
        this.LegL_IK.ReachRatio = 0.999f;
        this.LegL_IK.OrientBoneWeightR = 0.8f;
        this.LegL_IK.OrientBoneWeightT = 0.2f;
        this.LegL_IK.OrientBoneMaxDistance = 10.0f;
        this.LegR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|foot_r");
        this.LegR_IK.EffectorBoneName = n"ball_r";
        this.LegR_IK.PoleOffset = FVector(0.0, -30.0, 0.0);
        this.LegR_IK.ReachRatio = 0.999f;
        this.LegR_IK.OrientBoneWeightR = 0.8f;
        this.LegR_IK.OrientBoneWeightT = 0.2f;
        this.LegR_IK.OrientBoneMaxDistance = 10.0f;
        this.Bn_M_Root.SetBoneName(n"pelvis");
        return;
    }
}

