

struct FStretchTransform
{
    UPROPERTY()
    FTransform rigidTM;
    UPROPERTY()
    FVector scaleVector;

    FStretchTransform()
    {
        return;
    }
}

struct FBoneModifyConfig
{
    UPROPERTY()
    float32 pr;
    UPROPERTY()
    float32 nr;
    UPROPERTY()
    float32 ps;
    UPROPERTY()
    float32 ns;

    FBoneModifyConfig(const float32 _pr, const float32 _nr, const float32 _ps, const float32 _ns)
    {
        this.pr = _pr;
        this.nr = _nr;
        this.ps = _ps;
        this.ns = _ns;
        return;
    }
}

struct FBodyWrapTransform
{
    UPROPERTY()
    FTransform ReferenceTM;
    UPROPERTY()
    float32 ReferenceLegDistance;
    UPROPERTY()
    TArray<FVector> SkirtTargetRefLclPts;
    UPROPERTY()
    TArray<FVector> HorizonProjAxes;
    UPROPERTY()
    float32 ScaleAxisX = 1.0f;


    FVector ProjectPoint(const int skirtChainIndex, const FTransform &inout bodyTM, const FVector &inout leftLegPos, const FVector &inout rightLegPos)
    {
        FVector local_22 = ((leftLegPos - rightLegPos) / this.ReferenceLegDistance);
        FVector local_28(FVector::ZeroVector);
        float32 local_29 = 0.0f;
        local_22.ToDirectionAndLength(local_28, local_29);
        FVector local_6 = bodyTM.GetRotation().RotateVector((this.SkirtTargetRefLclPts[skirtChainIndex] * bodyTM.GetScale3D()));
        local_6 = (local_6 + ((local_28 * local_6.DotProduct(local_28)) * (local_29 - 1.0f)));
        FVector local_12_2 = (local_28 * local_28.DotProduct(local_6));
        FVector local_50_2 = (local_12_2 * (this.ScaleAxisX - 1.0f));
        local_6 = (local_6 + local_50_2);
        return (bodyTM.GetLocation() + local_6);
    }
    void Init(const FTransform &inout spineTM, const FTransform &inout pelvisTM, const FVector &inout leftLegPos, const FVector &inout rightLegPos, TArray<FPT_BoneChainRef> &inout boneChains)
    {
        this.ReferenceLegDistance = float32(((leftLegPos - rightLegPos).Size()));
        ::KLBodyWrapper_ComputeBodyTransform(spineTM.GetRotation().GetAxisZ().opNeg(), pelvisTM.GetLocation(), leftLegPos, rightLegPos, this.ReferenceLegDistance);
        FPlane local_72 = FPlane(this.GetLocation(), this.GetRotation().GetAxisZ());
        int local_73 = boneChains.Num();
        this.SkirtTargetRefLclPts.SetNum(local_73);
        TArray<FVector> local_78;
        int local_73_2 = boneChains.Num();
        local_78.SetNum(local_73_2);
        int local_80 = 0;
        for (; local_80 < local_73_2; )
        {
            FVector local_142(boneChains[local_80].GetRefPoseTransform(0).GetLocation());
            FVector local_32 = FMath::RayPlaneIntersection(local_142, (FVector(boneChains[local_80].GetRefPoseTransform((boneChains[local_80].GetBoneNum() - 1)).GetLocation()) - local_142).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector), local_72);
            local_78[local_80] = local_32;
            this.SkirtTargetRefLclPts[local_80] = this.InverseTransformPosition(local_32);
            this.SkirtTargetRefLclPts[local_80].X = (this.SkirtTargetRefLclPts[local_80].X / this.ScaleAxisX);
            ++local_80;
        }
        this.HorizonProjAxes.SetNum(local_73_2);
        int local_80_2 = 0;
        for (; local_80_2 < local_73_2; )
        {
            FVector local_26_2 = (FVector(local_78[((local_80_2 + 1) % local_73_2)]) - local_78[((local_80_2 + local_73_2) - 1) % local_73_2]);
            FVector local_6 = local_26_2.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector).opNeg();
            local_26_2 = boneChains[local_80_2].GetRootTM().GetLocation();
            local_26_2 = (boneChains[local_80_2].GetTailTM().GetLocation() - local_26_2).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            FVector local_32_2 = local_26_2.CrossProduct(local_6).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            FVector local_190(boneChains[local_80_2].GetRootTM().GetRotation().GetAxisZ());
            this.HorizonProjAxes[local_80_2].Z = local_190.DotProduct(local_6);
            this.HorizonProjAxes[local_80_2].Y = local_190.DotProduct(local_32_2);
            this.HorizonProjAxes[local_80_2].X = 0.0;
            ++local_80_2;
        }
        return;
    }
}

UCLASS(Abstract)
class USPT_SkirtDynamicBonesBase : USkeletalPoseTweaker
{
    UPROPERTY()
    bool bSolveCollision;
    UPROPERTY()
    bool bWantKawaii;
    UPROPERTY()
    int CollisionBoneIndex;
    UPROPERTY()
    UPhysicsAsset BodyPhysicsAsset;
    UPROPERTY()
    FPT_BoneRef Bn_L_calf;
    UPROPERTY()
    FPT_BoneRef Bn_R_calf;
    UPROPERTY()
    FPT_BoneRef Bn_M_pelvis;
    UPROPERTY()
    FPT_BoneRef Bn_L_thigh;
    UPROPERTY()
    FPT_BoneRef Bn_R_thigh;
    UPROPERTY()
    FPT_BoneRef Bn_M_spine_03;
    UPROPERTY()
    TArray<FPT_BoneChainRef> SkirtChains;
    FKLBodyBonePose LowerBodyBonePose;
    TArray<FBoneModifyConfig> BoneChainModConfigs;
    UPROPERTY()
    FKLKawaiiPhysicsSettings SharedKawaiiPhysicsSettings;
    UPROPERTY()
    TArray<FPT_KawaiiChainSimulator> KawaiiChains;
    UPROPERTY()
    bool WantPelvisWrapper;
    FBodyWrapTransform PelvisWrapper;
    FBodyWrapTransform SkirtWrapper;

    USPT_SkirtDynamicBonesBase()
    {
        this.bSolveCollision = true;
        this.bWantKawaii = true;
        this.CollisionBoneIndex = 2;
        this.WantPelvisWrapper = true;
        this.LowerBodyBonePose.Thickness = 0;
        this.SkirtChains.SetNum(8);
        this.SkirtChains[0].ChainRootBone = n"Bn_M_Skirt_A01";
        this.SkirtChains[1].ChainRootBone = n"Bn_L_Skirt_A01";
        this.SkirtChains[2].ChainRootBone = n"Bn_L_Skirt_B01";
        this.SkirtChains[3].ChainRootBone = n"Bn_L_Skirt_C01";
        this.SkirtChains[4].ChainRootBone = n"Bn_M_Skirt_B01";
        this.SkirtChains[5].ChainRootBone = n"Bn_R_Skirt_C01";
        this.SkirtChains[6].ChainRootBone = n"Bn_R_Skirt_B01";
        this.SkirtChains[7].ChainRootBone = n"Bn_R_Skirt_A01";
        this.KawaiiChains.SetNum(8);
        this.KawaiiChains[0].RootBone.SetBoneName(n"Bn_M_Skirt_A01");
        this.KawaiiChains[1].RootBone.SetBoneName(n"Bn_L_Skirt_A01");
        this.KawaiiChains[2].RootBone.SetBoneName(n"Bn_L_Skirt_B01");
        this.KawaiiChains[3].RootBone.SetBoneName(n"Bn_L_Skirt_C01");
        this.KawaiiChains[4].RootBone.SetBoneName(n"Bn_M_Skirt_B01");
        this.KawaiiChains[5].RootBone.SetBoneName(n"Bn_R_Skirt_C01");
        this.KawaiiChains[6].RootBone.SetBoneName(n"Bn_R_Skirt_B01");
        this.KawaiiChains[7].RootBone.SetBoneName(n"Bn_R_Skirt_A01");
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.4f, -0.05f, 1.0f, 1.0f));
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.2f, -0.05f, 1.0f, 1.0f));
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.3f, 0.0f, 1.0f, 1.0f));
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.1f, 0.6f, 1.0f, 1.0f));
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.0f, 0.4f, 1.0f, 1.0f));
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.0f, 0.1f, 1.0f, 1.0f));
        this.SharedKawaiiPhysicsSettings.Damping = 1045220557;
        this.SharedKawaiiPhysicsSettings.Stiffness = 1022739087;
        this.SharedKawaiiPhysicsSettings.LimitAngle = 1112014848;
        this.SharedKawaiiPhysicsSettings.WorldDampingLocation = 1064514355;
        this.SharedKawaiiPhysicsSettings.WorldDampingRotation = 1061997773;
        this.PelvisWrapper.ScaleAxisX = 1.6f;
        this.SkirtWrapper.ScaleAxisX = 1.5f;
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        if (!(this.IsSkirtChainValid()))
        {
            return;
        }
        int local_3 = this.SkirtChains.Num();
        if (this.WantPelvisWrapper)
        {
            this.PelvisWrapper.Init(this.Bn_M_spine_03.GetRefPoseTransform(), this.Bn_M_spine_03.GetRefPoseTransform(), this.Bn_L_thigh.GetRefPoseTransform().GetLocation(), this.Bn_R_thigh.GetRefPoseTransform().GetLocation(), this.SkirtChains);
        }
        this.SkirtWrapper.Init(this.Bn_M_spine_03.GetRefPoseTransform(), this.Bn_M_pelvis.GetRefPoseTransform(), this.Bn_L_calf.GetRefPoseTransform().GetLocation(), this.Bn_R_calf.GetRefPoseTransform().GetLocation(), this.SkirtChains);
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        int local_114;
        if (!(this.IsSkirtChainValid()))
        {
            return;
        }
        else
        {
            int local_3 = this.SkirtChains.Num();
            if (this.WantPelvisWrapper)
            {
                FStretchTransform local_108 = ::KLBodyWrapper_ComputeBodyTransform(this.Bn_M_spine_03.GetRotation().GetAxisZ().opNeg(), this.Bn_M_spine_03.GetLocation(), this.Bn_L_thigh.GetLocation(), this.Bn_R_thigh.GetLocation(), 3.4028235e38f);
                TArray<FVector> local_112;
                local_112.SetNum(local_3);
                int local_113 = 0;
                for (; local_113 < local_3; )
                {
                    local_114 = this.SkirtChains[local_113].GetBoneNum();
                    FTransform local_164 = this.SkirtChains[local_113].GetTransform(0);
                    FVector local_56 = local_164.GetLocation();
                    FVector local_170 = local_56;
                    int local_115 = local_114 - 1;
                    this.SkirtChains[local_113].GetTransform(local_56).GetLocation();
                    local_164.SetRotation(((FQuat::FindBetween((FVector(local_56) - local_170), (this.PelvisWrapper.ProjectPoint(local_113, local_108.rigidTM, this.Bn_L_thigh.GetLocation(), this.Bn_R_thigh.GetLocation()) - local_170))) * local_164.GetRotation()));
                    this.SkirtChains[local_113].SetTransform(0, local_164);
                    ++local_113;
                }
            }
            this.DoRigSkirt(::KLBodyWrapper_ComputeBodyTransform(this.Bn_M_spine_03.GetRotation().GetAxisZ().opNeg(), this.Bn_M_pelvis.GetLocation(), this.Bn_L_calf.GetLocation(), this.Bn_R_calf.GetLocation(), 3.4028235e38f).rigidTM);
            return;
        }
    }
    bool IsSkirtChainValid()
    {
        int local_2 = this.SkirtChains.Num();
        int local_3 = 0;
        for (; local_3 < local_2; ++local_3)
        {
            if (!(this.SkirtChains[local_3].IsValid()))
            {
                return false;
            }
        }
        return true;
    }
    void DoRigSkirt(const FTransform &inout bodyTM)
    {
        int local_9;
        int local_2 = this.SkirtChains.Num();
        TArray<FVector> local_6;
        local_6.SetNum(local_2);
        int local_7 = 0;
        for (; local_7 < local_2; ++local_7)
        {
            local_9 = this.SkirtChains[local_7].GetBoneNum();
            FTransform local_60 = this.SkirtChains[local_7].GetTransform(0);
            FVector local_66 = FVector(local_60.GetLocation());
            FTransform local_36 = this.SkirtChains[local_7].GetTransform((local_9 - 1));
            FVector local_78(local_36.GetLocation());
            FVector local_96 = this.SkirtWrapper.ProjectPoint(local_7, bodyTM, this.Bn_L_calf.GetLocation(), this.Bn_R_calf.GetLocation());
            local_6[local_7] = local_96;
            FQuat local_112 = FQuat::FindBetween((local_78 - local_66), (local_96 - local_66));
            float local_116 = 1.0 - FMath::Clamp((((local_96 - local_60.GetLocation()).DotProduct(local_60.GetRotation().GetAxisY())) + 8.0) / 16.0, 0.0, 1.0);
            int local_127 = 0;
            for (; local_127 < this.BoneChainModConfigs.Num(); )
            {
                if (local_127 >= local_9)
                {
                    break;
                }
                float local_114 = float(int(this.BoneChainModConfigs[local_127].pr));
                local_36 = this.SkirtChains[local_7].GetTransform(local_127);
                local_36.SetRotation(((FQuat::Slerp(FQuat::Identity, local_112, FMath::Lerp(float(int(this.BoneChainModConfigs[local_127].nr)), local_114, local_116))) * local_36.GetRotation()));
                this.SkirtChains[local_7].SetTransform(local_127, local_36);
                ++local_127;
            }
        }
        int local_127_2 = 0;
        for (; local_127_2 < local_2; )
        {
            int local_10_2 = local_127_2 + 1;
            int local_1 = local_10_2 % local_2;
            local_10_2 = local_127_2 + local_2;
            local_10_2 = local_10_2 - 1;
            FVector local_84 = (FVector(local_6[local_1]) - local_6[local_10_2 % local_2]).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector).opNeg();
            FVector local_96_2 = ((this.SkirtChains[local_127_2].GetTailTM().GetLocation() - this.SkirtChains[local_127_2].GetRootTM().GetLocation()).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)).CrossProduct(local_84).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            FVector local_202(this.SkirtChains[local_127_2].GetRootTM().GetRotation().GetAxisZ());
            FVector local_208(FVector::ZeroVector);
            local_208.Z = local_202.DotProduct(local_84);
            local_208.Y = local_202.DotProduct(local_96_2);
            FQuat local_136 = FQuat::FindBetween(this.SkirtWrapper.HorizonProjAxes[local_127_2], local_208);
            FTransform local_36_2 = FTransform(this.SkirtChains[local_127_2].GetTailTM());
            local_36_2.SetRotation((local_36_2.GetRotation() * local_136));
            ++local_127_2;
        }
        int local_7_2 = 0;
        for (; local_7_2 < 8; ++local_7_2)
        {
            FKLBodyBonePose local_264;
            int local_10_3 = (local_7_2 + 1) % local_2;
            FVector local_66_2 = local_6[local_10_3];
            local_10_3 = ((local_7_2 + local_2) - 1) % local_2;
            FVector local_78_2 = (local_66_2 - local_6[local_10_3]).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector).opNeg();
            FTransform local_196 = this.SkirtChains[local_7_2].GetTransform(this.CollisionBoneIndex);
            FVector local_84_2 = ((this.SkirtChains[local_7_2].GetTailTM().GetLocation() - local_196.GetLocation()).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)).CrossProduct(local_78_2).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            if (this.bSolveCollision)
            {
                FVector local_208_2 = local_196.GetLocation();
                local_264.AddCollisionPlane(FPlane());
            }
            if (this.bWantKawaii)
            {
                this.KawaiiChains[local_7_2].Update(int(this.CurrentDeltaSeconds), this.SharedKawaiiPhysicsSettings, local_264);
            }
        }
        return;
    }
}

class USPT_DefaultPlayerSkirtDynamics : USPT_SkirtDynamicBonesBase
{
    USPT_DefaultPlayerSkirtDynamics()
    {
        super();
        this.SkirtChains.SetNum(8);
        this.SkirtChains[0].ChainRootBone = n"Bn_M_LowCloth_A01";
        this.SkirtChains[1].ChainRootBone = n"Bn_L_LowCloth_A01";
        this.SkirtChains[2].ChainRootBone = n"Bn_L_LowCloth_B01";
        this.SkirtChains[3].ChainRootBone = n"Bn_L_LowCloth_C01";
        this.SkirtChains[4].ChainRootBone = n"Bn_M_LowCloth_B01";
        this.SkirtChains[5].ChainRootBone = n"Bn_R_LowCloth_C01";
        this.SkirtChains[6].ChainRootBone = n"Bn_R_LowCloth_B01";
        this.SkirtChains[7].ChainRootBone = n"Bn_R_LowCloth_A01";
        this.Bn_L_calf.SetBoneName(n"Bn_L_LowLeg");
        this.Bn_R_calf.SetBoneName(n"Bn_R_LowLeg");
        this.Bn_M_pelvis.SetBoneName(n"Bn_M_Root");
        this.Bn_L_thigh.SetBoneName(n"Bn_L_UpLeg");
        this.Bn_R_thigh.SetBoneName(n"Bn_R_UpLeg");
        this.Bn_M_spine_03.SetBoneName(n"Bn_M_Root");
        this.BoneChainModConfigs.Reset(0);
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.9f, -0.05f, 1.0f, 1.0f));
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.3f, -0.05f, 1.0f, 1.0f));
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.0f, 0.6f, 1.0f, 1.0f));
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.0f, 0.4f, 1.0f, 1.0f));
        this.PelvisWrapper.ScaleAxisX = 1.5f;
        this.SkirtWrapper.ScaleAxisX = 1.5f;
        this.WantPelvisWrapper = false;
        this.KawaiiChains.SetNum(8);
        this.KawaiiChains[0].RootBone.SetBoneName(n"Bn_M_LowCloth_A01");
        this.KawaiiChains[1].RootBone.SetBoneName(n"Bn_L_LowCloth_A01");
        this.KawaiiChains[2].RootBone.SetBoneName(n"Bn_L_LowCloth_B01");
        this.KawaiiChains[3].RootBone.SetBoneName(n"Bn_L_LowCloth_C01");
        this.KawaiiChains[4].RootBone.SetBoneName(n"Bn_M_LowCloth_B01");
        this.KawaiiChains[5].RootBone.SetBoneName(n"Bn_R_LowCloth_C01");
        this.KawaiiChains[6].RootBone.SetBoneName(n"Bn_R_LowCloth_B01");
        this.KawaiiChains[7].RootBone.SetBoneName(n"Bn_R_LowCloth_A01");
        this.CollisionBoneIndex = 1;
        return;
    }
}

class USPT_DefaultShuijingSkirtDynamics : USPT_SkirtDynamicBonesBase
{
    USPT_DefaultShuijingSkirtDynamics()
    {
        super();
        this.SkirtChains.SetNum(8);
        this.SkirtChains[0].ChainRootBone = n"Bn_M_LowCloth_A01";
        this.SkirtChains[1].ChainRootBone = n"Bn_L_LowCloth_A01";
        this.SkirtChains[2].ChainRootBone = n"Bn_L_LowCloth_B01";
        this.SkirtChains[3].ChainRootBone = n"Bn_L_LowCloth_C01";
        this.SkirtChains[4].ChainRootBone = n"Bn_M_LowCloth_B01";
        this.SkirtChains[5].ChainRootBone = n"Bn_R_LowCloth_C01";
        this.SkirtChains[6].ChainRootBone = n"Bn_R_LowCloth_B01";
        this.SkirtChains[7].ChainRootBone = n"Bn_R_LowCloth_A01";
        this.Bn_L_calf.SetBoneName(n"Bn_L_LowLeg");
        this.Bn_R_calf.SetBoneName(n"Bn_R_LowLeg");
        this.Bn_M_pelvis.SetBoneName(n"Bn_M_Root");
        this.Bn_L_thigh.SetBoneName(n"Bn_L_UpLeg");
        this.Bn_R_thigh.SetBoneName(n"Bn_R_UpLeg");
        this.Bn_M_spine_03.SetBoneName(n"Bn_M_Spine03");
        this.BoneChainModConfigs.Reset(0);
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.9f, -0.05f, 1.0f, 1.0f));
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.3f, -0.05f, 1.0f, 1.0f));
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.0f, 0.3f, 1.0f, 1.0f));
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.0f, 0.2f, 1.0f, 1.0f));
        this.PelvisWrapper.ScaleAxisX = 1.2f;
        this.SkirtWrapper.ScaleAxisX = 1.0f;
        this.WantPelvisWrapper = false;
        this.bSolveCollision = false;
        this.bWantKawaii = false;
        this.KawaiiChains.SetNum(0);
        this.CollisionBoneIndex = 3;
        return;
    }
}

class USPT_StdF_Base_SkirtDynamics : USPT_SkirtDynamicBonesBase
{
    USPT_StdF_Base_SkirtDynamics()
    {
        super();
        this.SkirtChains.SetNum(8);
        this.SkirtChains[0].ChainRootBone = n"Bn_M_LowCloth_A01";
        this.SkirtChains[1].ChainRootBone = n"Bn_L_LowCloth_A01";
        this.SkirtChains[2].ChainRootBone = n"Bn_L_LowCloth_B01";
        this.SkirtChains[3].ChainRootBone = n"Bn_L_LowCloth_C01";
        this.SkirtChains[4].ChainRootBone = n"Bn_M_LowCloth_B01";
        this.SkirtChains[5].ChainRootBone = n"Bn_R_LowCloth_C01";
        this.SkirtChains[6].ChainRootBone = n"Bn_R_LowCloth_B01";
        this.SkirtChains[7].ChainRootBone = n"Bn_R_LowCloth_A01";
        this.Bn_L_calf.SetBoneName(n"Bn_L_LowLeg");
        this.Bn_R_calf.SetBoneName(n"Bn_R_LowLeg");
        this.Bn_M_pelvis.SetBoneName(n"Bn_M_Pelvis");
        this.Bn_L_thigh.SetBoneName(n"Bn_L_UpLeg");
        this.Bn_R_thigh.SetBoneName(n"Bn_R_UpLeg");
        this.Bn_M_spine_03.SetBoneName(n"Bn_M_Pelvis");
        this.BoneChainModConfigs.Reset(0);
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.9f, -0.05f, 1.0f, 1.0f));
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.3f, -0.05f, 1.0f, 1.0f));
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.0f, 0.6f, 1.0f, 1.0f));
        this.BoneChainModConfigs.Add(FBoneModifyConfig(0.0f, 0.4f, 1.0f, 1.0f));
        this.PelvisWrapper.ScaleAxisX = 1.5f;
        this.SkirtWrapper.ScaleAxisX = 1.5f;
        this.WantPelvisWrapper = false;
        this.KawaiiChains.SetNum(8);
        this.KawaiiChains[0].RootBone.SetBoneName(n"Bn_M_LowCloth_A01");
        this.KawaiiChains[1].RootBone.SetBoneName(n"Bn_L_LowCloth_A01");
        this.KawaiiChains[2].RootBone.SetBoneName(n"Bn_L_LowCloth_B01");
        this.KawaiiChains[3].RootBone.SetBoneName(n"Bn_L_LowCloth_C01");
        this.KawaiiChains[4].RootBone.SetBoneName(n"Bn_M_LowCloth_B01");
        this.KawaiiChains[5].RootBone.SetBoneName(n"Bn_R_LowCloth_C01");
        this.KawaiiChains[6].RootBone.SetBoneName(n"Bn_R_LowCloth_B01");
        this.KawaiiChains[7].RootBone.SetBoneName(n"Bn_R_LowCloth_A01");
        this.CollisionBoneIndex = 1;
        this.SharedKawaiiPhysicsSettings.CollisionIterationCnt = 1;
        this.SharedKawaiiPhysicsSettings.Damping = 1045220557;
        this.SharedKawaiiPhysicsSettings.Stiffness = 1061997773;
        this.SharedKawaiiPhysicsSettings.WorldDampingLocation = 1064514355;
        this.SharedKawaiiPhysicsSettings.WorldDampingRotation = 1061997773;
        this.SharedKawaiiPhysicsSettings.Radius = 1077936128;
        this.SharedKawaiiPhysicsSettings.LimitAngle = 1106247680;
        return;
    }
}

FStretchTransform KLBodyWrapper_ComputeBodyTransform(const FVector &inout bodyHorizonDir, const FVector &inout pelvisPos, const FVector &inout leftLegPos, const FVector &inout rightLegPos, const float32 referenceLength)
{
    FVector local_12 = (leftLegPos + rightLegPos);
    FVector local_20 = (local_12 * 0.5);
    local_12 = (leftLegPos - rightLegPos);
    FVector local_6 = local_12.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    FVector local_26 = (pelvisPos - local_20);
    FVector local_38 = local_26.CrossProduct(local_6).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    local_6 = ((local_6 * bodyHorizonDir.DotProduct(local_6)) + (local_38 * bodyHorizonDir.DotProduct(local_38))).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    local_38 = local_26.CrossProduct(local_6).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    FTransform local_80 = FTransform(local_6, local_38, local_6.CrossProduct(local_38), local_20);
    local_12 = local_80.InverseTransformVectorNoScale(local_12);
    float local_48 = local_12.Size();
    FStretchTransform local_116;
    local_116.scaleVector = FVector::ZeroVector;
    if (local_48 > referenceLength)
    {
        float local_82_2 = local_48 / referenceLength;
        local_12.Z = 0.0;
        local_116.scaleVector = local_12.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        local_116.scaleVector *= (local_82_2 - 1.0);
    }
    local_116.rigidTM = local_80;
    return local_116;
}
