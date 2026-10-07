

struct FAutoRiggingBone
{
    UPROPERTY()
    FPT_BoneRef MainBoneRef;
    UPROPERTY()
    FPT_BoneRef InfluenceBoneRef;
    UPROPERTY()
    FPT_BoneRef DrivenBoneRef;
    UPROPERTY()
    FTransform MainBoneRelativeTM;
    UPROPERTY()
    FTransform InfluenceBoneRelativeTM;
    UPROPERTY()
    float32 InfluenceWeight;
    UPROPERTY()
    FVector MainBoneOrientAxis;
    UPROPERTY()
    FVector InfluenceBoneOirentAxis;


    void Init()
    {
        FTransform local_24 = FTransform(this.GetRefPoseTransform());
        FVector local_60 = local_24.TransformVector(this.MainBoneOrientAxis);
        FTransform local_84 = FTransform(this.InfluenceBoneRef.GetRefPoseTransform());
        FVector local_54 = local_84.TransformVector(this.InfluenceBoneOirentAxis);
        FTransform local_116 = local_84;
        local_116.SetRotation((FQuat::FindBetween(local_60, local_54) * local_24.GetRotation()));
        FTransform local_164 = FTransform(this.DrivenBoneRef.GetRefPoseTransform());
        this.MainBoneRelativeTM = local_164.GetRelativeTransform(local_24);
        this.InfluenceBoneRelativeTM = local_164.GetRelativeTransform(local_116);
        return;
    }
    void UpdateDrivenBone(const USkeletalPoseTweaker poseTweaker)
    {
        FTransform local_24 = FTransform(this.GetTransform());
        FVector local_60 = local_24.TransformVector(this.MainBoneOrientAxis);
        FTransform local_84 = FTransform(this.InfluenceBoneRef.GetTransform());
        FVector local_54 = local_84.TransformVector(this.InfluenceBoneOirentAxis);
        FTransform local_116 = local_84;
        local_116.SetRotation((FQuat::FindBetween(local_60, local_54) * local_24.GetRotation()));
        FTransform local_188 = (this.MainBoneRelativeTM * local_24);
        FTransform local_164 = (this.InfluenceBoneRelativeTM * local_116);
        FTransform local_236;
        local_236.Blend(local_188, local_164, this.InfluenceWeight);
        this.DrivenBoneRef.SetTransform(local_236);
        return;
    }
}

class USPT_DefaultPlayerAutoBoneRigging : USkeletalPoseTweaker
{
    UPROPERTY()
    TArray<FAutoRiggingBone> Shoulder_ARs;
    UPROPERTY()
    UPhysicsAsset BodyPhysicsAsset;
    UPROPERTY()
    TArray<FPT_BoneChainRef> BoneChainsWithBodyPush;
    FKLBodyBonePose BodyBonePose;
    UPROPERTY()
    FTransform BodyPushTest;
    UPROPERTY()
    float32 BodyPushRadius;

    USPT_DefaultPlayerAutoBoneRigging()
    {
        this.BodyPushRadius = 4.0f;
        this.Shoulder_ARs.SetNum(12);
        this.Shoulder_ARs[0].MainBoneRef.SetBoneName(n"Bn_M_Spine03");
        this.Shoulder_ARs[0].MainBoneOrientAxis = FVector(-1.0, 0.0, 0.0);
        this.Shoulder_ARs[0].InfluenceBoneRef.SetBoneName(n"Bn_L_UpArm");
        this.Shoulder_ARs[0].InfluenceBoneOirentAxis = FVector(1.0, 0.0, 0.0);
        this.Shoulder_ARs[0].DrivenBoneRef.SetBoneName(n"Bn_L_UpCloth_C01");
        this.Shoulder_ARs[0].InfluenceWeight = 0.8f;
        this.Shoulder_ARs[1].MainBoneRef.SetBoneName(n"Bn_M_Spine03");
        this.Shoulder_ARs[1].MainBoneOrientAxis = FVector(-1.0, 0.0, 0.0);
        this.Shoulder_ARs[1].InfluenceBoneRef.SetBoneName(n"Bn_L_UpArm");
        this.Shoulder_ARs[1].InfluenceBoneOirentAxis = FVector(1.0, 0.0, 0.0);
        this.Shoulder_ARs[1].DrivenBoneRef.SetBoneName(n"Bn_L_UpCloth_E01");
        this.Shoulder_ARs[1].InfluenceWeight = 0.8f;
        this.Shoulder_ARs[2].MainBoneRef.SetBoneName(n"Bn_M_Spine03");
        this.Shoulder_ARs[2].MainBoneOrientAxis = FVector(-1.0, 0.0, 0.0);
        this.Shoulder_ARs[2].InfluenceBoneRef.SetBoneName(n"Bn_L_UpArm");
        this.Shoulder_ARs[2].InfluenceBoneOirentAxis = FVector(1.0, 0.0, 0.0);
        this.Shoulder_ARs[2].DrivenBoneRef.SetBoneName(n"Bn_L_UpCloth_D01");
        this.Shoulder_ARs[2].InfluenceWeight = 1.0f;
        this.Shoulder_ARs[3].MainBoneRef.SetBoneName(n"Bn_M_Spine03");
        this.Shoulder_ARs[3].MainBoneOrientAxis = FVector(-1.0, 0.0, 0.0);
        this.Shoulder_ARs[3].InfluenceBoneRef.SetBoneName(n"Bn_L_UpArm");
        this.Shoulder_ARs[3].InfluenceBoneOirentAxis = FVector(1.0, 0.0, 0.0);
        this.Shoulder_ARs[3].DrivenBoneRef.SetBoneName(n"Bn_L_UpCloth_B01");
        this.Shoulder_ARs[3].InfluenceWeight = 0.6f;
        this.Shoulder_ARs[4].MainBoneRef.SetBoneName(n"Bn_M_Spine03");
        this.Shoulder_ARs[4].MainBoneOrientAxis = FVector(-1.0, 0.0, 0.0);
        this.Shoulder_ARs[4].InfluenceBoneRef.SetBoneName(n"Bn_L_UpArm");
        this.Shoulder_ARs[4].InfluenceBoneOirentAxis = FVector(1.0, 0.0, 0.0);
        this.Shoulder_ARs[4].DrivenBoneRef.SetBoneName(n"Bn_L_UpCloth_F01");
        this.Shoulder_ARs[4].InfluenceWeight = 0.6f;
        this.Shoulder_ARs[5].MainBoneRef.SetBoneName(n"Bn_M_Spine03");
        this.Shoulder_ARs[5].MainBoneOrientAxis = FVector(-1.0, 0.0, 0.0);
        this.Shoulder_ARs[5].InfluenceBoneRef.SetBoneName(n"Bn_L_UpArm");
        this.Shoulder_ARs[5].InfluenceBoneOirentAxis = FVector(1.0, 0.0, 0.0);
        this.Shoulder_ARs[5].DrivenBoneRef.SetBoneName(n"Bn_L_UpCloth_A01");
        this.Shoulder_ARs[5].InfluenceWeight = 0.3f;
        this.Shoulder_ARs[6].MainBoneRef.SetBoneName(n"Bn_M_Spine03");
        this.Shoulder_ARs[6].MainBoneOrientAxis = FVector(-1.0, 0.0, 0.0);
        this.Shoulder_ARs[6].InfluenceBoneRef.SetBoneName(n"Bn_R_UpArm");
        this.Shoulder_ARs[6].InfluenceBoneOirentAxis = FVector(1.0, 0.0, 0.0);
        this.Shoulder_ARs[6].DrivenBoneRef.SetBoneName(n"Bn_R_UpCloth_C01");
        this.Shoulder_ARs[6].InfluenceWeight = 0.8f;
        this.Shoulder_ARs[7].MainBoneRef.SetBoneName(n"Bn_M_Spine03");
        this.Shoulder_ARs[7].MainBoneOrientAxis = FVector(-1.0, 0.0, 0.0);
        this.Shoulder_ARs[7].InfluenceBoneRef.SetBoneName(n"Bn_R_UpArm");
        this.Shoulder_ARs[7].InfluenceBoneOirentAxis = FVector(1.0, 0.0, 0.0);
        this.Shoulder_ARs[7].DrivenBoneRef.SetBoneName(n"Bn_R_UpCloth_E01");
        this.Shoulder_ARs[7].InfluenceWeight = 0.8f;
        this.Shoulder_ARs[8].MainBoneRef.SetBoneName(n"Bn_M_Spine03");
        this.Shoulder_ARs[8].MainBoneOrientAxis = FVector(-1.0, 0.0, 0.0);
        this.Shoulder_ARs[8].InfluenceBoneRef.SetBoneName(n"Bn_R_UpArm");
        this.Shoulder_ARs[8].InfluenceBoneOirentAxis = FVector(1.0, 0.0, 0.0);
        this.Shoulder_ARs[8].DrivenBoneRef.SetBoneName(n"Bn_R_UpCloth_D01");
        this.Shoulder_ARs[8].InfluenceWeight = 1.0f;
        this.Shoulder_ARs[9].MainBoneRef.SetBoneName(n"Bn_M_Spine03");
        this.Shoulder_ARs[9].MainBoneOrientAxis = FVector(-1.0, 0.0, 0.0);
        this.Shoulder_ARs[9].InfluenceBoneRef.SetBoneName(n"Bn_R_UpArm");
        this.Shoulder_ARs[9].InfluenceBoneOirentAxis = FVector(1.0, 0.0, 0.0);
        this.Shoulder_ARs[9].DrivenBoneRef.SetBoneName(n"Bn_R_UpCloth_B01");
        this.Shoulder_ARs[9].InfluenceWeight = 0.6f;
        this.Shoulder_ARs[10].MainBoneRef.SetBoneName(n"Bn_M_Spine03");
        this.Shoulder_ARs[10].MainBoneOrientAxis = FVector(-1.0, 0.0, 0.0);
        this.Shoulder_ARs[10].InfluenceBoneRef.SetBoneName(n"Bn_R_UpArm");
        this.Shoulder_ARs[10].InfluenceBoneOirentAxis = FVector(1.0, 0.0, 0.0);
        this.Shoulder_ARs[10].DrivenBoneRef.SetBoneName(n"Bn_R_UpCloth_F01");
        this.Shoulder_ARs[10].InfluenceWeight = 0.6f;
        this.Shoulder_ARs[11].MainBoneRef.SetBoneName(n"Bn_M_Spine03");
        this.Shoulder_ARs[11].MainBoneOrientAxis = FVector(-1.0, 0.0, 0.0);
        this.Shoulder_ARs[11].InfluenceBoneRef.SetBoneName(n"Bn_R_UpArm");
        this.Shoulder_ARs[11].InfluenceBoneOirentAxis = FVector(1.0, 0.0, 0.0);
        this.Shoulder_ARs[11].DrivenBoneRef.SetBoneName(n"Bn_R_UpCloth_A01");
        this.Shoulder_ARs[11].InfluenceWeight = 0.3f;
        this.BoneChainsWithBodyPush.SetNum(this.Shoulder_ARs.Num());
        int local_16 = 0;
        for (; local_16 < this.Shoulder_ARs.Num(); )
        {
            this.BoneChainsWithBodyPush[local_16].ChainRootBone = this.Shoulder_ARs[local_16].DrivenBoneRef.GetBoneName();
            ++local_16;
        }
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        for (auto& local_16 : this.Shoulder_ARs)
        {
            local_16.Init();
        }
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        for (auto& local_16 : this.Shoulder_ARs)
        {
            local_16.UpdateDrivenBone(this);
        }
        if (this.BodyPhysicsAsset != nullptr)
        {
            this.BodyBonePose.SamplePose(this.BodyPhysicsAsset, n"UpperBody");
            this.BodyBonePose.DebugDrawBodyShapes();
            for (auto& local_34 : this.BoneChainsWithBodyPush)
            {
                this.BodyBonePose.PushBoneChain(local_34, this.BodyPushRadius, 5);
            }
        }
        return;
    }
}

struct FBoneDrivenInfo
{
    UPROPERTY()
    FPT_BoneRef DrivenBone;
    UPROPERTY()
    EAxis RotationAxis;
    UPROPERTY()
    TArray<FTransform> KeyPoses;
    UPROPERTY()
    TArray<float32> KeyDriverValues;
    UPROPERTY()
    float32 DriverValue;
    UPROPERTY()
    FTransform EvaluatedPose;


    bool AddDrivenKey(const float32 driverValue, const FTransform &inout keyPose)
    {
        int local_1 = 1008981770;
        bool local_3 = false;
        if (this.KeyDriverValues.IsEmpty() || (driverValue < (this.KeyDriverValues[0] - 0.01f)))
        {
            this.KeyDriverValues.Insert(driverValue, 0);
            this.KeyPoses.Insert(keyPose, 0);
            return true;
        }
        int local_8 = 0;
        for (; local_8 < this.KeyDriverValues.Num(); ++local_8)
        {
            if (FMath::IsNearlyEqual(this.KeyDriverValues[local_8], driverValue, 0.01f))
            {
                this.KeyPoses[local_8] = keyPose;
                local_3 = true;
                return false;
            }
            if (this.KeyDriverValues[local_8] > driverValue)
            {
                this.KeyDriverValues.Insert(driverValue, local_8);
                this.KeyPoses.Insert(keyPose, local_8);
                local_3 = true;
                break;
            }
        }
        if (!(local_3))
        {
            this.KeyDriverValues.Add(driverValue);
            this.KeyPoses.Add(keyPose);
        }
        return true;
    }
    void Eval(const float32 driverVal)
    {
        if (this.KeyDriverValues.Num() == 0)
        {
            this.EvaluatedPose = this.GetTransform();
        }
        else
        {
            FTransform local_28 = this.GetTransform();
            if (driverVal < this.KeyDriverValues[0])
            {
                this.EvaluatedPose = (FTransform(this.KeyPoses[0]) * local_28);
            }
            else
            {
                if (driverVal > this.KeyDriverValues.Last(0))
                {
                    this.EvaluatedPose = (FTransform(this.KeyPoses.Last(0)) * local_28);
                }
                else
                {
                    int local_81 = 0;
                    for (; local_81 < (this.KeyDriverValues.Num() - 1); ++local_81)
                    {
                        if ((driverVal >= this.KeyDriverValues[local_81] && (driverVal <= this.KeyDriverValues[local_81 + 1])))
                        {
                            float local_86 = (driverVal - this.KeyDriverValues[local_81]) / (float32(this.KeyDriverValues[local_81 + 1]) - this.KeyDriverValues[local_81]);
                            FTransform local_112;
                            local_112.Blend(this.KeyPoses[local_81], this.KeyPoses[local_81 + 1], local_86);
                            this.EvaluatedPose = (local_112 * local_28);
                        }
                    }
                }
            }
        }
        this.SetTransform(this.EvaluatedPose);
        return;
    }
}

struct FBoneDriverInfo
{
    UPROPERTY()
    FPT_BoneRef PrimaryBone;
    UPROPERTY()
    FPT_BoneRef SecondaryBone;
    UPROPERTY()
    TArray<FBoneDrivenInfo> DrivenBones;
    UPROPERTY()
    FQuat BindingPoseRelativeRot;

    FBoneDriverInfo()
    {
        return;
    }
    void Update(const USkeletalPoseTweaker poseTweaker)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

struct FSkinInfluencer
{
    UPROPERTY()
    FPT_BoneRef BoneA;
    UPROPERTY()
    bool RemoveTwistA;
    UPROPERTY()
    FPT_BoneRef BoneB;
    UPROPERTY()
    bool RemoveTwistB;
    UPROPERTY()
    FPT_BoneRef DrivenBone;
    UPROPERTY()
    FTransform RelTransformA;
    UPROPERTY()
    FTransform RelTransformB;
    UPROPERTY()
    float32 PositionWeightLerp;
    UPROPERTY()
    float32 RotationWeightLerp;
    UPROPERTY()
    float32 PositionGain = 1.0f;
    UPROPERTY()
    float32 RotationGain = 1.0f;


    void ComputeRelTransforms()
    {
        FTransform local_48 = this.DrivenBone.GetRefPoseTransform();
        FTransform local_24 = this.GetRefPoseTransform();
        FTransform local_72 = this.BoneB.GetRefPoseTransform();
        this.RelTransformA = local_48.GetRelativeTransform(local_24);
        this.RelTransformB = local_48.GetRelativeTransform(local_72);
        return;
    }
    void ComputeWeightByDistance()
    {
        float local_10 = this.RelTransformA.GetLocation().Size();
        float local_2 = this.RelTransformB.GetLocation().Size();
        local_10 = FMath::Clamp(local_10, 0.01, local_10);
        float local_14 = local_10 / (local_10 + FMath::Clamp(local_2, 0.01, local_2));
        this.PositionWeightLerp = float32(local_14);
        this.RotationWeightLerp = this.PositionWeightLerp;
        return;
    }
    void Update(const USkeletalPoseTweaker poseTweaker)
    {
        FTransform local_48 = this.GetTransform();
        if (this.RemoveTwistA)
        {
            FTransform local_76 = FTransform(this.GetLocalRelativeTransform());
            FRotator local_82 = local_76.Rotator();
            local_82.Roll = 0.0;
            local_76.SetRotation(local_82.Quaternion());
            local_48 = ((local_76 * this.GetRefPoseTransformLocal()) * this.GetParentTransformCS());
        }
        FTransform local_124_2 = this.BoneB.GetTransform();
        if (this.RemoveTwistB)
        {
            FTransform local_172 = FTransform(this.BoneB.GetLocalRelativeTransform());
            FRotator local_88 = local_172.Rotator();
            local_88.Roll = 0.0;
            local_172.SetRotation(local_88.Quaternion());
            local_124_2 = ((local_172 * this.BoneB.GetRefPoseTransformLocal()) * this.BoneB.GetParentTransformCS());
        }
        FTransform local_24 = (this.RelTransformA * local_48);
        FTransform local_172_2 = (this.RelTransformB * local_124_2);
        FTransform local_220 = FTransform(this.DrivenBone.GetTransform());
        local_220.SetLocation(FMath::Lerp(local_24.GetLocation(), local_172_2.GetLocation(), float(this.PositionWeightLerp)));
        local_220.SetRotation(FQuat::Slerp(local_24.GetRotation(), local_172_2.GetRotation(), this.RotationWeightLerp));
        local_220.SetLocation(FMath::Lerp(this.DrivenBone.GetLocation(), local_220.GetLocation(), float(this.PositionGain)));
        local_220.SetRotation(FQuat::Slerp(this.DrivenBone.GetRotation(), local_220.GetRotation(), this.RotationGain));
        this.DrivenBone.SetTransform(local_220);
        return;
    }
}

struct FKLBodyConfig
{
    UPROPERTY()
    FName ConfigName;
    UPROPERTY()
    UPhysicsAsset PhysicsAsset = nullptr;
    UPROPERTY()
    TArray<FKLKawaiiSpherePusher> SpherePushers;
    UPROPERTY()
    FName BodyProfile;

    FKLBodyConfig()
    {
        return;
    }
}

struct FKLKawaiiChainWithNamedPhySettings : FPT_KawaiiChain
{
    FPT_KawaiiChain _base_FPT_KawaiiChain;
    UPROPERTY()
    FName PhysicsParamName;
    UPROPERTY()
    FName BodyConfigName;

    FKLKawaiiChainWithNamedPhySettings()
    {
        return;
    }
}

class USPT_BoneDriverBase : USkeletalPoseTweaker
{
    UPROPERTY()
    TArray<FSkinInfluencer> SkinInfluencers;
    UPROPERTY()
    TArray<FBoneDriverInfo> DriverInfos;
    UPROPERTY()
    TArray<FKLBodyConfig> BodyConfigs;
    UPROPERTY()
    TArray<FKLNamedKawaiiPhysicsSettings> KawaiiPhysicsSettingConfigs;
    UPROPERTY()
    TArray<FKLKawaiiChainWithNamedPhySettings> KawaiiChains;
    float32 LastTeleportDistanceThreshold;
    float32 LastTeleportRotationThreshold;
    TMap<FName, FKLBodyBonePose> TempBodyPoseMap;

    USPT_BoneDriverBase()
    {
        this.LastTeleportDistanceThreshold = 0.0f;
        this.LastTeleportRotationThreshold = 0.0f;
        this.KawaiiPhysicsSettingConfigs.SetNum(1);
        this.KawaiiPhysicsSettingConfigs[0].ConfigName = n"Default";
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        for (auto& local_16 : this.DriverInfos)
        {
            local_16.BindingPoseRelativeRot = local_16.SecondaryBone.GetRefPoseTransform().GetRelativeTransform(local_16.PrimaryBone.GetRefPoseTransform()).GetRotation();
        }
        for (auto& local_110 : this.SkinInfluencers)
        {
            local_110.ComputeRelTransforms();
        }
        this.LastTeleportDistanceThreshold = -1.0f;
        this.LastTeleportRotationThreshold = -1.0f;
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        UPhysicsAsset local_38;
        this.UpdateTeleportThreshold();
        for (auto& local_16 : this.SkinInfluencers)
        {
            local_16.Update(this);
        }
        for (auto& local_30 : this.DriverInfos)
        {
            local_30.Update(this);
        }
        if (this.BodyConfigs.Num() > 0)
        {
            this.TempBodyPoseMap.Reset();
            int local_33 = 0;
            for (; local_33 < this.BodyConfigs.Num(); ++local_33)
            {
                FKLBodyConfig& local_36 = this.BodyConfigs[local_33];
                local_38 = local_36.PhysicsAsset;
                if (local_38 != nullptr)
                {
                    this.TempBodyPoseMap.FindOrAdd(local_36.ConfigName).SamplePose(local_36.PhysicsAsset, local_36.BodyProfile);
                }
                for (auto& local_54 : local_36.SpherePushers)
                {
                    FKLBodyBonePose& local_40_2 = this.TempBodyPoseMap.FindOrAdd(local_36.ConfigName);
                    local_54.UpdateShperePusher();
                    local_54.AddToBodyBonePose(local_40_2);
                }
            }
        }
        for (auto& local_68 : this.KawaiiChains)
        {
            for (auto& local_82 : this.KawaiiPhysicsSettingConfigs)
            {
                if (local_68.PhysicsParamName.IsNone() || (FName(local_82.ConfigName) == local_68.PhysicsParamName))
                {
                    if (this.TempBodyPoseMap.Contains(local_68.BodyConfigName))
                    {
                        local_68.Update(this.CurrentDeltaSeconds, local_82, this.TempBodyPoseMap.FindOrAdd(local_68.BodyConfigName));
                    }
                    break;
                }
            }
        }
        return;
    }
    void UpdateTeleportThreshold()
    {
        if (this.OwnerComponent.GetTeleportDistanceThreshold() != this.LastTeleportDistanceThreshold)
        {
            float32 local_4;
            local_4 = this.OwnerComponent.GetTeleportDistanceThreshold();
            for (auto& local_18 : this.KawaiiChains)
            {
                local_18.SetTeleportDistanceThreshold(local_4);
            }
            this.LastTeleportDistanceThreshold = local_4;
        }
        if (this.OwnerComponent.GetTeleportRotationThreshold() != this.LastTeleportRotationThreshold)
        {
            float32 local_4;
            local_4 = this.OwnerComponent.GetTeleportRotationThreshold();
            for (auto& local_18 : this.KawaiiChains)
            {
                local_18.SetTeleportRotationThreshold(local_4);
            }
            this.LastTeleportRotationThreshold = local_4;
        }
        return;
    }
}

