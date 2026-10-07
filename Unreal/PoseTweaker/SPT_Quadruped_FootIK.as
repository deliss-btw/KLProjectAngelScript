

struct FDetailedFootIKData
{
    UPROPERTY()
    bool bEnable = false;
    UPROPERTY()
    float32 MaxDistanceOffPlane = 15.0f;
    UPROPERTY()
    FPT_AdditivePositionDamper Damper;
    UPROPERTY()
    FName DetailFootIKCurveName;


    float32 GetDetailIKWeight(const USkeletalPoseTweaker PT) const
    {
        float32 local_1 = 0.0f;
        if (!(this.DetailFootIKCurveName.IsNone()) && PT.GetCurveValue(this.DetailFootIKCurveName, local_1))
        {
            return FMath::Clamp(local_1, 0.0f, 1.0f);
        }
        return this.bEnable ? 1.0f : 0.0f;
    }
    void SetEnable(const bool b)
    {
        this.bEnable = b;
        return;
    }
    bool IsEnabled(const USkeletalPoseTweaker PT) const
    {
        return !(FMath::IsNearlyZero(this.GetDetailIKWeight(PT), 1e-8f));
    }
}

struct FLegFollowBodyRotationOverrideBones
{
    UPROPERTY()
    FName BoneName_FL;
    UPROPERTY()
    FName BoneName_FR;
    UPROPERTY()
    FName BoneName_BL;
    UPROPERTY()
    FName BoneName_BR;
    UPROPERTY()
    FPT_BoneRef BoneFL;
    UPROPERTY()
    FPT_BoneRef BoneFR;
    UPROPERTY()
    FPT_BoneRef BoneBL;
    UPROPERTY()
    FPT_BoneRef BoneBR;

    FLegFollowBodyRotationOverrideBones()
    {
        return;
    }
    void Init(const USkeletalPoseTweaker PoseTweaker)
    {
        this.BoneFL.SetBoneName(this);
        PoseTweaker.InitializeBoneRef(this.BoneFL);
        this.BoneFR.SetBoneName(this.BoneName_FR);
        PoseTweaker.InitializeBoneRef(this.BoneFR);
        this.BoneBL.SetBoneName(this.BoneName_BL);
        PoseTweaker.InitializeBoneRef(this.BoneBL);
        this.BoneBR.SetBoneName(this.BoneName_BR);
        PoseTweaker.InitializeBoneRef(this.BoneBR);
        return;
    }
}

UCLASS(Abstract)
class USPT_Quadruped_FootIK_Base : USPT_GroundTraceBase
{
    UPROPERTY()
    bool bWantsDebugDraw;
    UPROPERTY()
    float32 FootIKWeight;
    UPROPERTY()
    FPT_TwoBoneIK Leg_FL_IK;
    UPROPERTY()
    FPT_TwoBoneIK Leg_FR_IK;
    UPROPERTY()
    FPT_TwoBoneIK Leg_BL_IK;
    UPROPERTY()
    FPT_TwoBoneIK Leg_BR_IK;
    FLegFollowBodyRotationOverrideBones LegFollowBodyRotationOverrideBones;
    UPROPERTY()
    FDetailedFootIKData Leg_FL_DetailedIK;
    UPROPERTY()
    FDetailedFootIKData Leg_FR_DetailedIK;
    UPROPERTY()
    FDetailedFootIKData Leg_BL_DetailedIK;
    UPROPERTY()
    FDetailedFootIKData Leg_BR_DetailedIK;
    UPROPERTY()
    bool bUse3BoneLegIK;
    UPROPERTY()
    FPT_3BoneLegIK Leg_FL_IK_3Bone;
    UPROPERTY()
    FPT_3BoneLegIK Leg_FR_IK_3Bone;
    UPROPERTY()
    FVector BodyForwardDirInRootBoneSpace;
    FTransform CurrentRootBoneTM;
    FVector CurrentBodyForwardDirCS;
    UPROPERTY()
    FPT_BoneRef BodyRootBone;
    FPT_TransformDamping BodyRootDamper;
    UPROPERTY()
    float32 BodyHeightTraceLength;
    UPROPERTY()
    float32 FootHeightTraceLength;
    FVector DefaultFloorNormal;
    UPROPERTY()
    FVector InputPlaneLocation;
    UPROPERTY()
    FQuat InputPlaneRotation;
    UPROPERTY()
    float32 LegFollowBodyRotationWeight;
    UPROPERTY()
    float32 FrontLegFollowBodyRotationWeight;
    UPROPERTY()
    float32 BackLegFollowBodyRotationWeight;
    UPROPERTY()
    float32 LegBodyTweakWeight;
    UPROPERTY()
    bool bUseLogicGroundTrace;

    USPT_Quadruped_FootIK_Base()
    {
        super();
        this.bWantsDebugDraw = false;
        this.FootIKWeight = 1.0f;
        this.bUse3BoneLegIK = false;
        this.BodyForwardDirInRootBoneSpace = FVector(1.0, 0.0, 0.0);
        this.CurrentRootBoneTM = FTransform::Identity;
        this.CurrentBodyForwardDirCS = this.BodyForwardDirInRootBoneSpace;
        this.BodyHeightTraceLength = 200.0f;
        this.FootHeightTraceLength = 100.0f;
        this.DefaultFloorNormal = FVector(0.0, 0.0, 1.0);
        this.InputPlaneLocation = FVector::ZeroVector;
        this.InputPlaneRotation = FQuat::Identity;
        this.LegFollowBodyRotationWeight = 0.3f;
        this.FrontLegFollowBodyRotationWeight = -0.01f;
        this.BackLegFollowBodyRotationWeight = -0.01f;
        this.LegBodyTweakWeight = 0.0f;
        this.bUseLogicGroundTrace = true;
        this.BodyRootDamper.AngleSpeedDampingStart = 10.0f;
        this.GroundTraceRadiusY = 50.0f;
        this.GroundTraceRadiusX = 25.0f;
        this.GroundTracePointNum = 11;
        this.GroundTraceParams.DownOffset = 60.0f;
        this.GroundTraceParams.UpOffset = 60.0f;
        this.GroundTraceParams.MaxHeightGap = 65.0f;
        this.Leg_FL_DetailedIK.DetailFootIKCurveName = n"DetailFootIK_FL";
        this.Leg_FR_DetailedIK.DetailFootIKCurveName = n"DetailFootIK_FR";
        this.Leg_BL_DetailedIK.DetailFootIKCurveName = n"DetailFootIK_BL";
        this.Leg_BR_DetailedIK.DetailFootIKCurveName = n"DetailFootIK_BR";
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        ::FootIKUtils::CreateGroundPlaneTraceParams(this.GroundTraceParams, this.GroundTracePointNum, int(this.GroundTraceRadiusX), this.GroundTraceRadiusY);
        this.HeightProbeRadiusCurve = FRuntimeCurveUtils::CreateAutoTangent(0.0f, 0.0f, 40.0f, 40.0f, 45.0f, 41.0f);
        if (this.Leg_FL_IK.IsValid())
        {
            this.Leg_FL_DetailedIK.Damper.Reset(this.Leg_FL_IK.GetEffectorTM().GetLocation(), this.Leg_FL_IK.GetEffectorTM().GetLocation());
        }
        if (this.Leg_FR_IK.IsValid())
        {
            this.Leg_FR_DetailedIK.Damper.Reset(this.Leg_FR_IK.GetEffectorTM().GetLocation(), this.Leg_FR_IK.GetEffectorTM().GetLocation());
        }
        if (this.Leg_BL_IK.IsValid())
        {
            this.Leg_BL_DetailedIK.Damper.Reset(this.Leg_BL_IK.GetEffectorTM().GetLocation(), this.Leg_BL_IK.GetEffectorTM().GetLocation());
        }
        if (this.Leg_BR_IK.IsValid())
        {
            this.Leg_BR_DetailedIK.Damper.Reset(this.Leg_BR_IK.GetEffectorTM().GetLocation(), this.Leg_BR_IK.GetEffectorTM().GetLocation());
        }
        this.LegFollowBodyRotationOverrideBones.Init(this);
        return;
    }
    void PostRotationIKRoot(FPT_TwoBoneIK &inout footIK, FPT_BoneRef &inout OverrideBone, const FQuat &inout rotDelta)
    {
        if (OverrideBone.HasValidSetup())
        {
            FTransform local_28 = FTransform(OverrideBone.GetTransform());
            local_28.SetRotation((rotDelta * local_28.GetRotation()));
            OverrideBone.SetTransform(local_28);
            return;
        }
        FTransform local_28_2 = FTransform(footIK.GetFirstBoneTM());
        local_28_2.SetRotation((rotDelta * local_28_2.GetRotation()));
        footIK.SetFirstBoneTM(local_28_2);
        return;
    }
    float32 GetForwardAxisRotationAngleRad(const FTransform &inout PlaneTransformInPT)
    {
        FPlane local_8 = FPlane(PlaneTransformInPT.GetLocation(), PlaneTransformInPT.GetRotation().GetAxisZ());
        int64 local_30 = 4662219572839972864;
        FVector local_22 = FVector(0.0, 0.0, 5000.0);
        FVector local_48(this.RootBoneRef.GetLocation());
        FMath::SegmentPlaneIntersection((local_48 + local_22), (local_48 - local_22), local_8, local_48);
        FVector local_56(this.RootBoneRef.GetRotation().GetAxisX());
        FVector local_28 = (local_48 + (local_56 * 100.0));
        FMath::SegmentPlaneIntersection((local_28 + local_22), (local_28 - local_22), local_8, local_28);
        return float32((FQuat::FindBetween((local_28 - local_48), local_56).GetAngle()));
    }
    float32 GetFootIKWeight()
    {
        return this.FootIKWeight;
    }
    float32 GetSafeLegFollowBodyRotationWeight(const float32 In, const float32 Fallback)
    {
        float32 local_4;
        if (In < 0.0f)
        {
            local_4 = Fallback;
        }
        else
        {
            local_4 = In;
        }
        return FMath::Clamp(local_4, 0.0f, 1.0f);
    }
    void SolveFootIK()
    {
        int local_290 = 0;
        if (!(this.Leg_FL_IK.IsValid()) || !(this.Leg_FR_IK.IsValid()))
        {
            return;
        }
        float local_36 = this.Leg_BL_IK.GetEffectorTM().GetLocation().Z;
        float local_40 = this.Leg_BR_IK.GetEffectorTM().GetLocation().Z;
        float local_42 = this.Leg_FL_IK.GetEffectorTM().GetLocation().Z;
        float local_44 = this.Leg_FR_IK.GetEffectorTM().GetLocation().Z;
        FVector local_82 = ((this.Leg_FL_IK.GetFirstBoneTM().GetLocation() + this.Leg_FR_IK.GetFirstBoneTM().GetLocation()) * 0.5);
        FVector local_88_2 = ((this.Leg_BL_IK.GetFirstBoneTM().GetLocation() + this.Leg_BR_IK.GetFirstBoneTM().GetLocation()) * 0.5);
        FVector local_94 = ((local_82 + local_88_2) * 0.5);
        local_82.Z = 0.0;
        local_88_2.Z = 0.0;
        FTransform local_124;
        FTransform local_148;
        FVector local_154;
        if (this.bUseLogicGroundTrace)
        {
            Super::GroundPlaneHeightAdjust(this.InputPlaneLocation, this.InputPlaneRotation, local_82, local_88_2, this.PelvisAdjustDamper, this.HeightProbeRadiusCurve, local_124, local_148, local_154);
        }
        else
        {
            if (this.InvAnimComponentTransform.TransformVector(this.InputPlaneRotation.GetAxisZ()).SizeSquared() < 9.99999993922529e-9)
            {
                FVector local_34_2 = this.DefaultFloorNormal;
            }
            Super::GroundPlaneTraceAndHeightAdjust(this.GroundPlaneTraceResult, FVector::ZeroVector, local_82, local_88_2, this.PelvisAdjustDamper, this.HeightProbeRadiusCurve, this.GroundTraceParams);
            local_124 = this.GroundPlaneTraceResult.PlaneTransform;
            local_148 = this.GroundPlaneTraceResult.PlaneTransformInPT;
            local_154 = this.GroundPlaneTraceResult.HeightAdjust;
        }
        this.AddForVisualization();
        FVector local_34_3 = local_82;
        FVector local_168 = local_88_2;
        FVector local_174(local_148.GetRotation().GetAxisZ());
        float32 local_186 = this.GetForwardAxisRotationAngleRad(local_148);
        float32 local_185 = float32((local_34_3.Size() * FMath::Tan(local_186)));
        float32 local_187 = float32((local_168.Size() * FMath::Tan(local_186)));
        FVector local_194;
        FVector local_200;
        float32 local_188 = this.GetFootIKWeight();
        float local_38_3 = ((this.BodyHeightTraceLength + local_185) * local_188);
        FVector local_160 = FVector(0.0, 0.0, local_38_3);
        FVector local_208 = FVector(0.0, 0.0, ((this.BodyHeightTraceLength + local_187) * local_188));
        Super::TraceVirtualGround((local_82 + local_160), (local_82 - local_160), local_82, local_194);
        Super::TraceVirtualGround((local_88_2 + local_208), (local_88_2 - local_208), local_88_2, local_200);
        bool local_1 = this.WantDebugDraw();
        if (local_1)
        {
            FTransform local_244 = local_124;
            local_244.SetLocation((local_244.GetLocation() + (local_244.GetRotation().GetAxisZ() * 0.02)));
            this.DrawAnimDebugPlaneRuntime(local_244.GetLocation(), local_244.GetRotation().GetAxisZ(), 600.0f, FColor::Cyan, EPTDebugDrawSpace(1), ESceneDepthPriorityGroup(0));
            this.DrawAnimDebugCircle(local_82, local_194, 15.0f, FColor::Red, 15, true);
            this.DrawAnimDebugCircle(local_88_2, local_200, 15.0f, FColor::Blue, 15, true);
        }
        FVector local_50_2 = this.AnimComponentTransform.TransformVector(this.RootBoneRef.GetRotation().GetAxisY());
        FVector local_216 = local_50_2.CrossProduct(FVector::UpVector);
        bool local_2 = !(local_216.IsNearlyZero(9.999999747378752e-5));
        FQuat local_184 = FQuat::FindBetween(local_216, this.AnimComponentTransform.TransformVector(this.RootBoneRef.GetRotation().GetAxisX()));
        int local_247 = local_50_2.DotProduct(local_184.GetRotationAxis()) < 0.0 ? -1 : 1;
        float local_162_3 = local_184.GetAngle();
        float local_38_4 = local_247 * local_162_3;
        FQuat local_288 = FQuat(this.RootBoneRef.GetRotation().GetAxisY(), local_38_4);
        FQuat local_268 = FQuat::Slerp(FQuat::Identity, local_290.Inverse(), (1.0f - (this.GetSafeLegFollowBodyRotationWeight(this.FrontLegFollowBodyRotationWeight, this.LegFollowBodyRotationWeight))));
        float local_162_4 = (1.0f - this.GetSafeLegFollowBodyRotationWeight(this.BackLegFollowBodyRotationWeight, this.LegFollowBodyRotationWeight));
        FQuat local_276 = FQuat::Slerp(FQuat::Identity, local_290.Inverse(), local_162_4);
        this.PostRotationIKRoot(this.Leg_BL_IK, this.LegFollowBodyRotationOverrideBones.BoneBL, local_276);
        this.PostRotationIKRoot(this.Leg_BR_IK, this.LegFollowBodyRotationOverrideBones.BoneBR, local_276);
        this.PostRotationIKRoot(this.Leg_FL_IK, this.LegFollowBodyRotationOverrideBones.BoneFL, local_268);
        this.PostRotationIKRoot(this.Leg_FR_IK, this.LegFollowBodyRotationOverrideBones.BoneFR, local_268);
        if (!(FMath::IsNearlyZero(this.LegBodyTweakWeight, 1e-8f)))
        {
            FVector local_318(this.Leg_BL_IK.GetEffectorTM().GetLocation());
            FVector local_324(this.Leg_BR_IK.GetEffectorTM().GetLocation());
            FVector local_330(this.Leg_FL_IK.GetEffectorTM().GetLocation());
            FVector local_336(this.Leg_FR_IK.GetEffectorTM().GetLocation());
            float local_38_5 = local_318.Z - local_36;
            float local_338 = local_324.Z - local_40;
            float local_340 = local_330.Z - local_42;
            float local_342 = local_336.Z - local_44;
            float local_162_5 = (local_38_5 + local_338) / 2.0;
            float local_344 = local_318.X + local_324.X;
            FVector local_254 = FVector(local_344 / 2.0, 0.0, local_162_5);
            local_344 = local_340 + local_342;
            local_344 = local_336.X;
            FVector local_350 = FVector(local_330.X + local_344, 0.0, (local_344 / 2.0));
            FVector local_260 = (local_350 - local_254);
            FQuat local_300 = FQuat::FindBetween(local_260, FVector(local_260.X, local_260.Y, 0.0));
            FVector local_372 = local_300.RotateVector(local_254);
            if (this.bWantsDebugDraw)
            {
                float local_162_7 = local_300.RotateVector(local_350).Z;
                if (!(FMath::IsNearlyEqual(local_372.Z, local_162_7, 0.001)))
                {
                    this.AddOnScreenDebugMessage(FString().Append("Front anchor and back anchor not aligned"), 999, false, 2.0f);
                }
            }
            FTransform local_28 = ::FootIKUtils::RotateAroundPoint(FTransform(this.BodyRootBone.GetTransform()), this.RootBoneRef.GetLocation(), local_300);
            this.BodyRootBone.SetTransform(local_28);
            float local_354 = this.Leg_FL_IK.GetEffectorTM().GetLocation().Z - local_42;
            local_344 = this.Leg_FR_IK.GetEffectorTM().GetLocation().Z - local_44;
            FVector local_100_2 = local_28.GetLocation();
            float local_162_8 = local_354 + local_344;
            local_28.SetLocation((local_100_2 - ((local_174 * local_162_8) * 0.5)));
            this.BodyRootBone.SetTransform(local_28);
        }
        float local_302_3 = this.GetFootIKWeight() * this.BodyHeightTraceLength;
        FVector local_100_3 = local_174.opNeg();
        if (this.bWantsDebugDraw)
        {
            FVector local_384_2 = (local_100_3 * 50.0);
            this.DrawAnimDebugArrow(FVector(0.0, 0.0, 100.0), (FVector(0.0, 0.0, 100.0) + local_384_2), 20.0f, FColor::Red, 0.0f, true);
        }
        if (this.bUse3BoneLegIK)
        {
            if (!(this.Leg_FL_IK_3Bone.IsReady()))
            {
                this.Leg_FL_IK_3Bone.Initialize();
            }
            if (!(this.Leg_FR_IK_3Bone.IsReady()))
            {
                this.Leg_FR_IK_3Bone.Initialize();
            }
            this.CurrentBodyForwardDirCS = (this.CurrentRootBoneTM = this.RootBoneRef.GetTransform()).TransformVector(this.CurrentRootBoneTM.TransformVector(this.BodyForwardDirInRootBoneSpace));
            Super::FootTraceAndAdjust(this.Leg_BL_IK, local_100_3, local_36, local_302_3, this.Leg_BL_DetailedIK);
            Super::FootTraceAndAdjust(this.Leg_BR_IK, local_100_3, local_40, local_302_3, this.Leg_BR_DetailedIK);
            if (this.Leg_FL_IK_3Bone.IsReady() && this.Leg_FR_IK_3Bone.IsReady())
            {
                Super::FootTraceAndAdjust(this.Leg_FL_IK_3Bone, local_100_3, local_42, local_302_3, this.CurrentBodyForwardDirCS, this.Leg_FL_DetailedIK);
                Super::FootTraceAndAdjust(this.Leg_FR_IK_3Bone, local_100_3, local_44, local_302_3, this.CurrentBodyForwardDirCS, this.Leg_FR_DetailedIK);
            }
            return;
        }
        Super::FootTraceAndAdjust(this.Leg_BL_IK, local_100_3, local_36, local_302_3, this.Leg_BL_DetailedIK);
        Super::FootTraceAndAdjust(this.Leg_BR_IK, local_100_3, local_40, local_302_3, this.Leg_BR_DetailedIK);
        Super::FootTraceAndAdjust(this.Leg_FL_IK, local_100_3, local_42, local_302_3, this.Leg_FL_DetailedIK);
        Super::FootTraceAndAdjust(this.Leg_FR_IK, local_100_3, local_44, local_302_3, this.Leg_FR_DetailedIK);
        return;
    }
}

class USPT_Qiongqi_FootIK_Base : USPT_Quadruped_FootIK_Base
{
    USPT_Qiongqi_FootIK_Base()
    {
        super();
        this.Leg_FL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_L_Shoulder|Bn_L_LowArm|Bn_L_FingerBase");
        this.Leg_FL_IK.EffectorBoneName = n"Bn_L_FingerMiddle01";
        this.Leg_FL_IK.OrientBoneName = n"Bn_L_Shoulder";
        this.Leg_FR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_R_Shoulder|Bn_R_LowArm|Bn_R_FingerBase");
        this.Leg_FR_IK.OrientBoneName = n"Bn_R_Shoulder";
        this.Leg_FR_IK.EffectorBoneName = n"Bn_R_FingerMiddle01";
        this.Leg_BL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_L_UpLeg|Bn_L_MidLeg|Bn_L_Foot");
        this.Leg_BL_IK.OrientBoneName = n"Bn_L_UpLeg";
        this.Leg_BL_IK.EffectorBoneName = n"Bn_L_ToeBase";
        this.Leg_BR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_R_UpLeg|Bn_R_MidLeg|Bn_R_Foot");
        this.Leg_BR_IK.OrientBoneName = n"Bn_R_UpLeg";
        this.Leg_BR_IK.EffectorBoneName = n"Bn_R_ToeBase";
        this.BodyRootBone.SetBoneName(n"Bn_M_Hips");
        this.Leg_FL_DetailedIK.SetEnable(true);
        this.Leg_FL_DetailedIK.Damper.MinInterpSpeed = 1112014848;
        this.Leg_FR_DetailedIK.SetEnable(true);
        this.Leg_FR_DetailedIK.Damper.MinInterpSpeed = 1112014848;
        this.Leg_BL_DetailedIK.SetEnable(true);
        this.Leg_BL_DetailedIK.Damper.MinInterpSpeed = 1112014848;
        this.Leg_BR_DetailedIK.SetEnable(true);
        this.Leg_BR_DetailedIK.Damper.MinInterpSpeed = 1112014848;
        return;
    }
}

class USPT_QiongQiD3_FootIK_Base : USPT_Quadruped_FootIK_Base
{
    USPT_QiongQiD3_FootIK_Base()
    {
        super();
        this.Leg_FL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("clavicle_l|lowerarm_l|fingerbase_l");
        this.Leg_FL_IK.EffectorBoneName = n"middle_01_l";
        this.Leg_FL_IK.OrientBoneName = n"clavicle_l";
        this.Leg_FR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("clavicle_r|lowerarm_r|fingerbase_r");
        this.Leg_FR_IK.OrientBoneName = n"clavicle_r";
        this.Leg_FR_IK.EffectorBoneName = n"middle_01_r";
        this.Leg_BL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|foot_l");
        this.Leg_BL_IK.OrientBoneName = n"thigh_l";
        this.Leg_BL_IK.EffectorBoneName = n"ball_l";
        this.Leg_BR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|foot_r");
        this.Leg_BR_IK.OrientBoneName = n"thigh_r";
        this.Leg_BR_IK.EffectorBoneName = n"ball_r";
        this.BodyRootBone.SetBoneName(n"pelvis");
        this.Leg_FL_DetailedIK.SetEnable(true);
        this.Leg_FL_DetailedIK.Damper.MinInterpSpeed = 1112014848;
        this.Leg_FR_DetailedIK.SetEnable(true);
        this.Leg_FR_DetailedIK.Damper.MinInterpSpeed = 1112014848;
        this.Leg_BL_DetailedIK.SetEnable(true);
        this.Leg_BL_DetailedIK.Damper.MinInterpSpeed = 1112014848;
        this.Leg_BR_DetailedIK.SetEnable(true);
        this.Leg_BR_DetailedIK.Damper.MinInterpSpeed = 1112014848;
        return;
    }
}

class USPT_Qiongqi_FootIK : USPT_Qiongqi_FootIK_Base
{
    USPT_Qiongqi_FootIK()
    {
        super();
        this.GroundTraceRadiusY = 150.0f;
        this.GroundTraceRadiusX = 85.0f;
        this.GroundTracePointNum = 11;
        this.GroundTraceParams.DownOffset = 130.0f;
        this.GroundTraceParams.UpOffset = 130.0f;
        this.GroundTraceParams.MaxHeightGap = 150.0f;
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        Super::SolveFootIK();
        return;
    }
}

class USPT_Creature_Yak_FootIK : USPT_Quadruped_FootIK_Base
{
    USPT_Creature_Yak_FootIK()
    {
        super();
        this.Leg_FL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("L_Arm_00|L_Arm_01|L_Arm_04");
        this.Leg_FR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("R_Arm_00|R_Arm_01|R_Arm_04");
        this.Leg_BL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("L_Leg_00|L_Leg_01|L_Leg_04");
        this.Leg_BR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("R_Leg_00|R_Leg_01|R_Leg_04");
        this.BodyRootBone.SetBoneName(n"Cog");
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        Super::SolveFootIK();
        return;
    }
}

class USPT_Creature_Bip_FootIK : USPT_Quadruped_FootIK_Base
{
    USPT_Creature_Bip_FootIK()
    {
        super();
        this.Leg_FL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("L_UpperArm|L_Forearm|L_ArmToe");
        this.Leg_FR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("R_UpperArm|R_Forearm|R_ArmToe");
        this.Leg_BL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("L_Thigh|L_Calf|L_Toe0");
        this.Leg_BR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("R_Thigh|R_Calf|R_Toe0");
        this.BodyRootBone.SetBoneName(n"Bip");
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        Super::SolveFootIK();
        return;
    }
}

class USPT_Mount_JueYang_FootIK : USPT_Quadruped_FootIK_Base
{
    USPT_Mount_JueYang_FootIK()
    {
        super();
        this.Leg_FL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_l|lowerarm_l|hand_l");
        this.Leg_FL_IK.EffectorBoneName = n"fingerbase_l";
        this.Leg_FL_IK.OrientBoneName = n"upperarm_l";
        this.Leg_FR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_r|lowerarm_r|hand_r");
        this.Leg_FR_IK.EffectorBoneName = n"fingerbase_r";
        this.Leg_FR_IK.OrientBoneName = n"upperarm_r";
        this.Leg_BL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|lowcalf_l");
        this.Leg_BL_IK.EffectorBoneName = n"foot_l";
        this.Leg_BL_IK.OrientBoneName = n"thigh_l";
        this.Leg_BR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|lowcalf_r");
        this.Leg_BR_IK.EffectorBoneName = n"foot_r";
        this.Leg_BR_IK.OrientBoneName = n"thigh_r";
        this.BodyRootBone.SetBoneName(n"pelvis");
        this.BodyHeightTraceLength = 50.0f;
        this.FootHeightTraceLength = 15.0f;
        this.GroundTraceRadiusY = 50.0f;
        this.GroundTraceRadiusX = 100.0f;
        this.GroundTracePointNum = 11;
        this.GroundTraceParams.DownOffset = 250.0f;
        this.GroundTraceParams.UpOffset = 250.0f;
        this.GroundTraceParams.MaxHeightGap = 500.0f;
        this.bUse3BoneLegIK = true;
        this.Leg_FL_IK_3Bone.BoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_l|lowerarm_l|hand_l|fingerbase_l");
        this.Leg_FL_IK_3Bone.EffectorBoneName = n"fingerbase_l";
        this.Leg_FL_IK_3Bone.bChain1PoleForward = false;
        this.Leg_FL_IK_3Bone.bChain2PoleForward = true;
        this.Leg_FR_IK_3Bone.BoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_r|lowerarm_r|hand_r|fingerbase_r");
        this.Leg_FR_IK_3Bone.EffectorBoneName = n"fingerbase_r";
        this.Leg_FR_IK_3Bone.bChain1PoleForward = false;
        this.Leg_FR_IK_3Bone.bChain2PoleForward = true;
        this.LegFollowBodyRotationOverrideBones.BoneName_BL = n"thigh_l";
        this.LegFollowBodyRotationOverrideBones.BoneName_BR = n"thigh_r";
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
        Super::SolveFootIK();
        return;
    }
}

struct FFootLockState
{
    UPROPERTY()
    bool bLocked = false;
    UPROPERTY()
    bool bHasPrevFrame = false;
    UPROPERTY()
    bool bWasContact = false;
    UPROPERTY()
    bool bInSwingAbsorb = false;
    UPROPERTY()
    FQuat LockedLegExtraRot = FQuat::Identity;
    UPROPERTY()
    FQuat SwingStartLegExtraRot = FQuat::Identity;
    UPROPERTY()
    FQuat CurrentLegExtraRot = FQuat::Identity;
    UPROPERTY()
    float32 SwingElapsed = 0.0f;


    void Reset()
    {
        this.bLocked = false;
        this.bHasPrevFrame = false;
        this.bWasContact = false;
        this.bInSwingAbsorb = false;
        this.LockedLegExtraRot = FQuat::Identity;
        this.SwingStartLegExtraRot = FQuat::Identity;
        this.CurrentLegExtraRot = FQuat::Identity;
        this.SwingElapsed = 0.0f;
        return;
    }
}

class USPT_Mount_JueYang_FootIK_v2 : USPT_Mount_JueYang_FootIK
{
    UPROPERTY()
    float32 FrontLegFollowBodyRotationWeight_DownSlope;
    UPROPERTY()
    float32 BackLegFollowBodyRotationWeight_DownSlope;
    UPROPERTY()
    float32 ExtraRot_Body_MaxAngle;
    UPROPERTY()
    float32 IKBlend_SpeedThreshold_FullOff;
    UPROPERTY()
    float32 IKBlend_SpeedInput;
    bool bFootLockHasPrevSlopeDirection;
    bool bFootLockPrevIsDownSlope;
    float32 FootLockDisableRemaining;
    float32 IKBlend_RefFL_LegHeight;
    float32 IKBlend_RefFR_LegHeight;
    float32 IKBlend_RefBL_LegHeight;
    float32 IKBlend_RefBR_LegHeight;
    FFootLockState FootLockState_FL;
    FFootLockState FootLockState_FR;
    FFootLockState FootLockState_BL;
    FFootLockState FootLockState_BR;

    USPT_Mount_JueYang_FootIK_v2()
    {
        super();
        this.FrontLegFollowBodyRotationWeight_DownSlope = 1.0f;
        this.BackLegFollowBodyRotationWeight_DownSlope = 1.0f;
        this.ExtraRot_Body_MaxAngle = 5.0f;
        this.IKBlend_SpeedThreshold_FullOff = 450.0f;
        this.IKBlend_SpeedInput = 0.0f;
        this.bFootLockHasPrevSlopeDirection = false;
        this.bFootLockPrevIsDownSlope = false;
        this.FootLockDisableRemaining = 0.0f;
        this.IKBlend_RefFL_LegHeight = 0.0f;
        this.IKBlend_RefFR_LegHeight = 0.0f;
        this.IKBlend_RefBL_LegHeight = 0.0f;
        this.IKBlend_RefBR_LegHeight = 0.0f;
        this.Leg_FL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_l|lowerarm_l|hand_l");
        this.Leg_FL_IK.EffectorBoneName = n"fingerbase_l";
        this.Leg_FL_IK.OrientBoneName = n"upperarm_l";
        this.Leg_FR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_r|lowerarm_r|hand_r");
        this.Leg_FR_IK.EffectorBoneName = n"fingerbase_r";
        this.Leg_FR_IK.OrientBoneName = n"upperarm_r";
        this.Leg_BL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|lowcalf_l");
        this.Leg_BL_IK.EffectorBoneName = n"foot_l";
        this.Leg_BL_IK.OrientBoneName = n"thigh_l";
        this.Leg_BR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|lowcalf_r");
        this.Leg_BR_IK.EffectorBoneName = n"foot_r";
        this.Leg_BR_IK.OrientBoneName = n"thigh_r";
        this.BodyRootBone.SetBoneName(n"pelvis");
        this.BodyHeightTraceLength = 50.0f;
        this.FootHeightTraceLength = 15.0f;
        this.GroundTraceRadiusY = 50.0f;
        this.GroundTraceRadiusX = 100.0f;
        this.GroundTracePointNum = 11;
        this.GroundTraceParams.DownOffset = 250.0f;
        this.GroundTraceParams.UpOffset = 250.0f;
        this.GroundTraceParams.MaxHeightGap = 500.0f;
        this.bUse3BoneLegIK = true;
        this.Leg_FL_IK_3Bone.BoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_l|lowerarm_l|hand_l|fingerbase_l");
        this.Leg_FL_IK_3Bone.EffectorBoneName = n"fingerbase_l";
        this.Leg_FL_IK_3Bone.bChain1PoleForward = false;
        this.Leg_FL_IK_3Bone.bChain2PoleForward = true;
        this.Leg_FR_IK_3Bone.BoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_r|lowerarm_r|hand_r|fingerbase_r");
        this.Leg_FR_IK_3Bone.EffectorBoneName = n"fingerbase_r";
        this.Leg_FR_IK_3Bone.bChain1PoleForward = false;
        this.Leg_FR_IK_3Bone.bChain2PoleForward = true;
        this.LegFollowBodyRotationOverrideBones.BoneName_BL = n"thigh_l";
        this.LegFollowBodyRotationOverrideBones.BoneName_BR = n"thigh_r";
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        float32 local_37;
        Super::OnInitialization_Implementation();
        this.bFootLockHasPrevSlopeDirection = false;
        this.bFootLockPrevIsDownSlope = false;
        this.FootLockDisableRemaining = 0.0f;
        if (this.Leg_FL_IK.IsValid())
        {
            local_37 = float32(this.Leg_FL_IK.GetEffectorTM().GetLocation().Z);
        }
        else
        {
            local_37 = 0.0f;
        }
        this.IKBlend_RefFL_LegHeight = local_37;
        if (this.Leg_FR_IK.IsValid())
        {
            local_37 = float32(this.Leg_FR_IK.GetEffectorTM().GetLocation().Z);
        }
        else
        {
            local_37 = 0.0f;
        }
        this.IKBlend_RefFR_LegHeight = local_37;
        if (this.Leg_BL_IK.IsValid())
        {
            local_37 = float32(this.Leg_BL_IK.GetEffectorTM().GetLocation().Z);
        }
        else
        {
            local_37 = 0.0f;
        }
        this.IKBlend_RefBL_LegHeight = local_37;
        if (this.Leg_BR_IK.IsValid())
        {
            local_37 = float32(this.Leg_BR_IK.GetEffectorTM().GetLocation().Z);
        }
        else
        {
            local_37 = 0.0f;
        }
        this.IKBlend_RefBR_LegHeight = local_37;
        this.FootLockState_FL.Reset();
        this.FootLockState_FR.Reset();
        this.FootLockState_BL.Reset();
        this.FootLockState_BR.Reset();
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        this.SolveFootIK_v2();
        return;
    }
    UFUNCTION()
    void OnReturnFromFrameGap_Implementation()
    {
        this.bFootLockHasPrevSlopeDirection = false;
        this.bFootLockPrevIsDownSlope = false;
        this.FootLockDisableRemaining = 0.0f;
        this.FootLockState_FL.Reset();
        this.FootLockState_FR.Reset();
        this.FootLockState_BL.Reset();
        this.FootLockState_BR.Reset();
        return;
    }
    float32 ComputeSlopeBlendAlpha(const float32 SlopeDeg)
    {
        int local_1 = 1108082688;
        float32 local_6 = FMath::Clamp(SlopeDeg / 35.0f, 0.0f, 1.0f);
        return local_6 * local_6;
    }
    float32 ComputeSpeedBlendAlpha(const float32 Speed)
    {
        if (this.IKBlend_SpeedThreshold_FullOff < 0.0001f)
        {
            return 0.0f;
        }
        float32 local_2 = FMath::Clamp(Speed / this.IKBlend_SpeedThreshold_FullOff, 0.0f, 1.0f);
        int local_7 = 1045220557;
        if (local_2 <= 0.2f)
        {
            return 1.0f;
        }
        return 1.0f - ((local_2 - 0.2f) / 0.8f);
    }
    bool ComputeFootContactByAnimEffector(const FVector &inout AnimEffectorCS, const FVector &inout traceDir, const float ContactRefHeight, const float32 traceOffset, const bool bWasContact)
    {
        bool local_46;
        if (traceOffset < 0.0001f)
        {
            return bWasContact;
        }
        FVector local_8 = AnimEffectorCS;
        FVector local_14(FVector::UpVector);
        FVector local_28 = (AnimEffectorCS + (traceDir * traceOffset));
        FVector local_22_2 = (traceDir * traceOffset);
        if (!(Super::TraceVirtualGround((AnimEffectorCS - local_22_2), local_28, local_8, local_14)))
        {
            return bWasContact;
        }
        float32 local_41 = (float32(((AnimEffectorCS - local_8).DotProduct(traceDir.opNeg())))) - float32(ContactRefHeight);
        int local_43 = 1056964608;
        int local_44 = 1084227584;
        if (bWasContact)
        {
            local_46 = (local_41 <= 5.0f);
        }
        else
        {
            local_46 = (local_41 <= 0.5f);
        }
        return local_46;
    }
    void ResetFootLockStates()
    {
        this.FootLockState_FL.Reset();
        this.FootLockState_FR.Reset();
        this.FootLockState_BL.Reset();
        this.FootLockState_BR.Reset();
        return;
    }
    FQuat UpdateFootLockLegExtraRot(FFootLockState &inout LockState, const bool bIsContact, const FQuat &inout DesiredLegExtraRot, const bool bDisableFootLock)
    {
        int local_1 = 1045220557;
        if (bDisableFootLock)
        {
            LockState.Reset();
            return DesiredLegExtraRot;
        }
        if (!(LockState.bHasPrevFrame))
        {
            LockState.bHasPrevFrame = true;
            LockState.bWasContact = bIsContact;
            LockState.bLocked = bIsContact;
            LockState.CurrentLegExtraRot = DesiredLegExtraRot;
            LockState.LockedLegExtraRot = DesiredLegExtraRot;
            return DesiredLegExtraRot;
        }
        if (bIsContact)
        {
            if (!(LockState.bWasContact))
            {
                LockState.LockedLegExtraRot = DesiredLegExtraRot;
                LockState.SwingElapsed = 0.0f;
            }
            LockState.bLocked = true;
            LockState.bWasContact = true;
            LockState.bInSwingAbsorb = false;
            LockState.CurrentLegExtraRot = LockState.LockedLegExtraRot;
            return LockState.CurrentLegExtraRot;
        }
        if (LockState.bWasContact)
        {
            LockState.SwingStartLegExtraRot = LockState.CurrentLegExtraRot;
            LockState.SwingElapsed = 0.0f;
            LockState.bInSwingAbsorb = true;
        }
        LockState.bLocked = false;
        LockState.bWasContact = false;
        if (!(LockState.bInSwingAbsorb))
        {
            LockState.CurrentLegExtraRot = DesiredLegExtraRot;
            return LockState.CurrentLegExtraRot;
        }
        float32 local_2_3 = LockState.SwingElapsed + this.CurrentDeltaSeconds;
        LockState.SwingElapsed = local_2_3;
        local_2_3 = FMath::Clamp((LockState.SwingElapsed / 0.2f), 0.0f, 1.0f);
        float32 local_6 = local_2_3 * local_2_3;
        float32 local_4_3 = local_2_3 * 2.0f;
        float32 local_4_4 = local_6 * (3.0f - local_4_3);
        LockState.CurrentLegExtraRot = FQuat::Slerp(LockState.SwingStartLegExtraRot, DesiredLegExtraRot, local_4_4);
        if (local_2_3 >= 1.0f)
        {
            LockState.CurrentLegExtraRot = DesiredLegExtraRot;
            LockState.bInSwingAbsorb = false;
        }
        return LockState.CurrentLegExtraRot;
    }
    void FootTraceAndAdjustWithIKBlendAlpha(FPT_TwoBoneIK &inout footIK, const FVector &inout traceDir, const float footHeight, const float32 traceOffset, FDetailedFootIKData &inout DetailedIK, const float32 IKBlendAlpha = 1.0f)
    {
        FTransform local_24 = FTransform(footIK.GetEffectorTM());
        FVector local_54(local_24.GetLocation());
        FVector local_66;
        if (Super::FootTraceAndAdjust_GetNewFootPositionCommon(local_54, traceDir, footHeight, traceOffset, DetailedIK, local_66))
        {
            FTransform local_92 = local_24;
            local_92.SetLocation(FMath::Lerp(local_54, local_66, IKBlendAlpha));
            if (this.bWantsDebugDraw)
            {
                this.DrawAnimDebugSphere(local_54, 8.0f, 12, FColor::Red, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(1));
                this.DrawAnimDebugSphere(local_66, 8.0f, 12, FColor::Green, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(1));
            }
            footIK.Solve(local_92);
        }
        return;
    }
    void FootTraceAndAdjustWithIKBlendAlpha(FPT_3BoneLegIK &inout footIK, const FVector &inout traceDir, const float footHeight, const float32 traceOffset, const FVector &inout BodyForwardDir, FDetailedFootIKData &inout DetailedIK, const float32 IKBlendAlpha = 1.0f)
    {
        FTransform local_24 = FTransform(footIK.GetEffectorXformCS());
        FVector local_54(local_24.GetLocation());
        FVector local_66;
        if (Super::FootTraceAndAdjust_GetNewFootPositionCommon(local_54, traceDir, footHeight, traceOffset, DetailedIK, local_66))
        {
            FTransform local_92 = local_24;
            local_92.SetLocation(FMath::Lerp(local_54, local_66, IKBlendAlpha));
            if (this.bWantsDebugDraw)
            {
                this.DrawAnimDebugSphere(local_54, 8.0f, 12, FColor::Red, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(1));
                this.DrawAnimDebugSphere(local_66, 8.0f, 12, FColor::Green, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(1));
            }
            footIK.Solve(local_92, this.RootBoneRef.GetTransform(), BodyForwardDir);
        }
        return;
    }
    void SolveFootIK_v2()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}

class USPT_Monster_Quad_Base : USPT_Mount_JueYang_FootIK_v2
{
    USPT_Monster_Quad_Base()
    {
        super();
        this.Leg_FL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_l|lowerarm_l|hand_l");
        this.Leg_FL_IK.EffectorBoneName = n"middle_01_l";
        this.Leg_FL_IK.OrientBoneName = n"upperarm_l";
        this.Leg_FR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_r|lowerarm_r|hand_r");
        this.Leg_FR_IK.EffectorBoneName = n"middle_01_r";
        this.Leg_FR_IK.OrientBoneName = n"upperarm_r";
        this.Leg_BL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|lowcalf_l");
        this.Leg_BL_IK.EffectorBoneName = n"foot_l";
        this.Leg_BL_IK.OrientBoneName = n"thigh_l";
        this.Leg_BR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|lowcalf_r");
        this.Leg_BR_IK.EffectorBoneName = n"foot_r";
        this.Leg_BR_IK.OrientBoneName = n"thigh_r";
        this.BodyRootBone.SetBoneName(n"pelvis");
        this.BodyHeightTraceLength = 50.0f;
        this.FootHeightTraceLength = 15.0f;
        this.GroundTraceRadiusY = 50.0f;
        this.GroundTraceRadiusX = 100.0f;
        this.GroundTracePointNum = 11;
        this.GroundTraceParams.DownOffset = 250.0f;
        this.GroundTraceParams.UpOffset = 250.0f;
        this.GroundTraceParams.MaxHeightGap = 500.0f;
        this.bUse3BoneLegIK = true;
        this.Leg_FL_IK_3Bone.BoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_l|lowerarm_l|hand_l");
        this.Leg_FL_IK_3Bone.EffectorBoneName = n"middle_01_l";
        this.Leg_FL_IK_3Bone.bChain1PoleForward = false;
        this.Leg_FL_IK_3Bone.bChain2PoleForward = true;
        this.Leg_FR_IK_3Bone.BoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_r|lowerarm_r|hand_r");
        this.Leg_FR_IK_3Bone.EffectorBoneName = n"middle_01_r";
        this.Leg_FR_IK_3Bone.bChain1PoleForward = false;
        this.Leg_FR_IK_3Bone.bChain2PoleForward = true;
        this.LegFollowBodyRotationOverrideBones.BoneName_BL = n"thigh_l";
        this.LegFollowBodyRotationOverrideBones.BoneName_BR = n"thigh_r";
        return;
    }
}

class USPT_Canidae_FootIK_Base : USPT_Quadruped_FootIK_Base
{
    USPT_Canidae_FootIK_Base()
    {
        super();
        this.Leg_FL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_L_UpArm|Bn_L_LowArm|Bn_L_Hand|Bn_L_FingerBase");
        this.Leg_FL_IK.EffectorBoneName = n"Bn_L_FingerBase";
        this.Leg_FL_IK.OrientBoneName = n"Bn_L_UpArm";
        this.Leg_FR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_R_UpArm|Bn_R_LowArm|Bn_R_Hand|Bn_R_FingerBase");
        this.Leg_FR_IK.EffectorBoneName = n"Bn_R_FingerBase";
        this.Leg_FR_IK.OrientBoneName = n"Bn_R_UpArm";
        this.Leg_BL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_L_UpLeg|Bn_L_MidLeg|Bn_L_LowLeg");
        this.Leg_BL_IK.EffectorBoneName = n"Bn_L_Foot";
        this.Leg_BL_IK.OrientBoneName = n"Bn_L_UpLeg";
        this.Leg_BR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_R_UpLeg|Bn_R_MidLeg|Bn_R_LowLeg");
        this.Leg_BR_IK.EffectorBoneName = n"Bn_R_Foot";
        this.Leg_BR_IK.OrientBoneName = n"Bn_R_UpLeg";
        this.BodyRootBone.SetBoneName(n"Bn_M_Pelvis");
        this.GroundTraceRadiusY = 100.0f;
        this.GroundTraceRadiusX = 300.0f;
        this.GroundTracePointNum = 11;
        this.GroundTraceParams.DownOffset = 250.0f;
        this.GroundTraceParams.UpOffset = 250.0f;
        this.GroundTraceParams.MaxHeightGap = 500.0f;
        this.Leg_FL_DetailedIK.SetEnable(true);
        this.Leg_FL_DetailedIK.Damper.MinInterpSpeed = 50.0f;
        this.Leg_FR_DetailedIK.SetEnable(true);
        this.Leg_FR_DetailedIK.Damper.MinInterpSpeed = 50.0f;
        this.Leg_BL_DetailedIK.SetEnable(true);
        this.Leg_BL_DetailedIK.Damper.MinInterpSpeed = 50.0f;
        this.Leg_BR_DetailedIK.SetEnable(true);
        this.Leg_BR_DetailedIK.Damper.MinInterpSpeed = 50.0f;
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        Super::SolveFootIK();
        return;
    }
}

class USPT_Wyvern001_HarbingerOfDoom_FootIK_Base : USPT_Quadruped_FootIK_Base
{
    USPT_Wyvern001_HarbingerOfDoom_FootIK_Base()
    {
        super();
        this.Leg_FL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_l|lowerarm_l|hand_l");
        this.Leg_FL_IK.EffectorBoneName = n"fingerbase_l";
        this.Leg_FL_IK.OrientBoneName = n"upperarm_l";
        this.Leg_FR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_r|lowerarm_r|hand_r");
        this.Leg_FR_IK.EffectorBoneName = n"fingerbase_r";
        this.Leg_FR_IK.OrientBoneName = n"upperarm_r";
        this.Leg_BL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|lowcalf_l");
        this.Leg_BL_IK.EffectorBoneName = n"foot_l";
        this.Leg_BL_IK.OrientBoneName = n"thigh_l";
        this.Leg_BR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|lowcalf_r");
        this.Leg_BR_IK.EffectorBoneName = n"foot_r";
        this.Leg_BR_IK.OrientBoneName = n"thigh_r";
        this.BodyRootBone.SetBoneName(n"pelvis");
        this.GroundTraceRadiusY = 600.0f;
        this.GroundTraceRadiusX = 150.0f;
        this.GroundTracePointNum = 11;
        this.GroundTraceParams.DownOffset = 400.0f;
        this.GroundTraceParams.UpOffset = 400.0f;
        this.GroundTraceParams.MaxHeightGap = 600.0f;
        this.Leg_FL_DetailedIK.SetEnable(true);
        this.Leg_FL_DetailedIK.Damper.MinInterpSpeed = 50.0f;
        this.Leg_FL_DetailedIK.MaxDistanceOffPlane = 200.0f;
        this.Leg_FR_DetailedIK.SetEnable(true);
        this.Leg_FR_DetailedIK.Damper.MinInterpSpeed = 50.0f;
        this.Leg_FR_DetailedIK.MaxDistanceOffPlane = 200.0f;
        this.Leg_BL_DetailedIK.SetEnable(true);
        this.Leg_BL_DetailedIK.Damper.MinInterpSpeed = 50.0f;
        this.Leg_BL_DetailedIK.MaxDistanceOffPlane = 100.0f;
        this.Leg_BR_DetailedIK.SetEnable(true);
        this.Leg_BR_DetailedIK.Damper.MinInterpSpeed = 50.0f;
        this.Leg_BR_DetailedIK.MaxDistanceOffPlane = 100.0f;
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        Super::SolveFootIK();
        return;
    }
}

class USPT_ReptileA_FootIK_Base : USPT_Quadruped_FootIK_Base
{
    USPT_ReptileA_FootIK_Base()
    {
        super();
        this.Leg_FL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_l|lowerarm_l|hand_l");
        this.Leg_FL_IK.EffectorBoneName = n"hand_l";
        this.Leg_FL_IK.OrientBoneName = n"upperarm_l";
        this.Leg_FR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_r|lowerarm_r|hand_r");
        this.Leg_FR_IK.EffectorBoneName = n"hand_r";
        this.Leg_FR_IK.OrientBoneName = n"upperarm_r";
        this.Leg_BL_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|lowcalf_l");
        this.Leg_BL_IK.EffectorBoneName = n"foot_l";
        this.Leg_BL_IK.OrientBoneName = n"thigh_l";
        this.Leg_BR_IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|lowcalf_r");
        this.Leg_BR_IK.EffectorBoneName = n"foot_r";
        this.Leg_BR_IK.OrientBoneName = n"thigh_r";
        this.BodyRootBone.SetBoneName(n"pelvis");
        this.GroundTraceRadiusY = 100.0f;
        this.GroundTraceRadiusX = 300.0f;
        this.GroundTracePointNum = 11;
        this.GroundTraceParams.DownOffset = 250.0f;
        this.GroundTraceParams.UpOffset = 250.0f;
        this.GroundTraceParams.MaxHeightGap = 500.0f;
        this.Leg_FL_DetailedIK.SetEnable(true);
        this.Leg_FL_DetailedIK.Damper.MinInterpSpeed = 50.0f;
        this.Leg_FR_DetailedIK.SetEnable(true);
        this.Leg_FR_DetailedIK.Damper.MinInterpSpeed = 50.0f;
        this.Leg_BL_DetailedIK.SetEnable(true);
        this.Leg_BL_DetailedIK.Damper.MinInterpSpeed = 50.0f;
        this.Leg_BR_DetailedIK.SetEnable(true);
        this.Leg_BR_DetailedIK.Damper.MinInterpSpeed = 50.0f;
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        Super::SolveFootIK();
        return;
    }
}

