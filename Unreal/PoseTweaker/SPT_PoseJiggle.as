
enum EDynamicsSourceType
{
    Curve,
    SpringDynamics,
}

enum EBodyChainType
{
    LeftArm,
    RightArm,
    LeftLeg,
    RightLeg,
}


struct FRuntimeJiggleInfo
{
    UPROPERTY()
    bool bIsActive;
    UPROPERTY()
    FVector InputImpulseDisplacement;
    UPROPERTY()
    FName JiggleCurveName;
    UPROPERTY()
    FName JiggleConfigName;
    UPROPERTY()
    float32 Time;
    UPROPERTY()
    FPT_SpringSimulator Spring;
    UPROPERTY()
    FVector SimulatedDisplacement;

    FRuntimeJiggleInfo()
    {
        this.bIsActive = true;
        return;
    }
}

struct FBodyJiggleEffectInfo
{
    UPROPERTY()
    float32 Chest_Weight;
    UPROPERTY()
    float32 Hand_L_Weight;
    UPROPERTY()
    float32 Hand_R_Weight;
    UPROPERTY()
    float32 Foot_L_Weight;
    UPROPERTY()
    float32 Foot_R_Weight;
    UPROPERTY()
    float32 Head_Weight;
    UPROPERTY()
    float32 Pelvis_Weight;


}

struct FBodyJiggleSpringSetting
{
    UPROPERTY()
    float32 SpringStiffness = 100.0f;
    UPROPERTY()
    float32 SpringDamping = 0.03f;
    UPROPERTY()
    FVector SpringMaxDisplacement = FVector(3.0, 3.0, 3.0);


}

class USPT_PoseJiggleBase : USkeletalPoseTweaker
{
    UPROPERTY()
    EDynamicsSourceType DynamicsSourceType = EDynamicsSourceType(0);
    UPROPERTY()
    TMap<FName, FRuntimeFloatCurve> JiggleCurves;
    UPROPERTY()
    FBodyJiggleSpringSetting SpringSettings;
    UPROPERTY()
    TMap<EBodyChainType, FPT_BoneChainRef> BodyBoneChains;
    UPROPERTY()
    FPT_BoneRef PelvisBone;
    UPROPERTY()
    FPT_BoneChainRef SpineChain;
    UPROPERTY()
    FPT_BoneChainRef TailChain;
    UPROPERTY()
    int ChestChainIndex = -1;
    UPROPERTY()
    TMap<FName, FBodyJiggleEffectInfo> JiggleConfigs;
    UPROPERTY()
    TArray<FName> BodyMainBones;
    UPROPERTY()
    FTransform PelvisCTRL;
    UPROPERTY()
    FTransform HeadCTRL;
    UPROPERTY()
    FTransform ChestCTRL;
    UPROPERTY()
    FTransform LeftArmCTRL;
    UPROPERTY()
    FTransform RightArmCTRL;
    UPROPERTY()
    FTransform LeftLegCTRL;
    UPROPERTY()
    FTransform RightLegCTRL;
    TArray<FRuntimeJiggleInfo> RuntimeJiggleInfos;


    UFUNCTION()
    void OnInitialization_Implementation()
    {
        this.SetMainBodyBones(this.BodyMainBones);
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        FTransform local_176;
        bool local_5 = (int(this.DynamicsSourceType) == 0);
        bool local_1 = (int(this.DynamicsSourceType) == 1);
        auto local_12 = this.RuntimeJiggleInfos.Iterator();
        for (; local_12.CanProceed;)
        {
            FRuntimeJiggleInfo& local_20 = local_12.Proceed();
            if (!(local_20.bIsActive))
            {
                continue;
            }
            FVector local_26(FVector::ZeroVector);
            if (local_5)
            {
                float32 local_27 = local_20.Time;
                if (local_27 < 0.0f)
                {
                    continue;
                }
                FRuntimeFloatCurve& local_30 = this.JiggleCurves.FindOrAdd(local_20.JiggleCurveName);
                local_27 = local_20.Time;
                float32 local_32 = local_30.GetFloatValue(local_27, 0.0f);
                FVector local_38 = local_20.InputImpulseDisplacement;
                local_26 = (local_38 * local_32);
            }
            else
            {
                if (local_1)
                {
                    if (!(local_20.InputImpulseDisplacement.IsNearlyZero(9.999999747378752e-5)))
                    {
                        FSpringDynamicsBoneState local_74;
                        float32 local_27_2 = this.SpringSettings.SpringStiffness;
                        this.SpringSettings.SpringStiffness = this.SpringSettings.SpringDamping;
                        local_74.MaxLocalDeformScale = this.SpringSettings.SpringMaxDisplacement;
                        TArray<FSpringDynamicsBoneState> local_78;
                        local_78.Add(local_74);
                        local_20.Spring.ResetWithVirtualBones(local_78);
                        local_20.Spring.AddImpulseLocation(0, local_20.InputImpulseDisplacement);
                        local_20.InputImpulseDisplacement = FVector::ZeroVector;
                    }
                    TArray<FSpringDynamicsSimResults> local_82 = local_20.Spring.SimulateStep();
                    local_20.SimulatedDisplacement = local_82[0].Location;
                    local_26 = local_20.SimulatedDisplacement;
                }
                else
                {
                    return;
                }
            }
            FBodyJiggleEffectInfo& local_88 = this.JiggleConfigs.FindOrAdd(local_20.JiggleConfigName);
            TMap<EBodyChainType, FTransform> local_108;
            for (auto& local_126 : this.BodyBoneChains)
            {
                local_176.GetTailTM();
                local_108.FindOrAdd(local_126.GetKey()) = FTransform(local_176);
            }
            if (local_88.Pelvis_Weight > 0.0f)
            {
                FTransform local_152 = FTransform(this.PelvisBone.GetTransform());
                FVector local_46 = local_152.GetLocation();
                FVector local_38_2 = (local_26 * local_88.Pelvis_Weight);
                local_152.SetLocation((local_46 + local_38_2));
                this.PelvisBone.SetTransform(local_152);
            }
            FVector local_38_3 = this.SpineChain.GetTailTM().GetLocation();
            FVector local_182 = (local_26 * local_88.Head_Weight);
            this.SpineChain.SoftMove_Solve(-1, (local_38_3 + local_182), false, 4);
            if (this.ChestChainIndex != -1)
            {
                local_182 = this.SpineChain.GetTransform(this.ChestChainIndex).GetLocation();
                local_38_3 = (local_26 * local_88.Chest_Weight);
                this.SpineChain.SoftMove_Solve(this.ChestChainIndex, (local_182 + local_38_3), false, 3);
            }
            this.SpineChain.AdjustChainBoneOrient();
            if (this.BodyBoneChains.Contains(EBodyChainType(0)))
            {
                FPT_BoneChainRef& local_186 = this.BodyBoneChains.FindOrAdd(EBodyChainType(0));
                local_38_3 = local_108[EBodyChainType(0)].GetLocation();
                local_182 = (local_26 * local_88.Hand_L_Weight);
                local_186.SoftMove_Solve(-1, (local_38_3 + local_182), true, -1);
            }
            if (this.BodyBoneChains.Contains(EBodyChainType(1)))
            {
                FPT_BoneChainRef& local_186_2 = this.BodyBoneChains.FindOrAdd(EBodyChainType(1));
                FVector local_46_2 = local_108[EBodyChainType(1)].GetLocation();
                local_182 = (local_26 * local_88.Hand_R_Weight);
                local_186_2.SoftMove_Solve(-1, (local_46_2 + local_182), true, -1);
            }
            if (this.BodyBoneChains.Contains(EBodyChainType(2)))
            {
                FPT_BoneChainRef& local_186_3 = this.BodyBoneChains.FindOrAdd(EBodyChainType(2));
                local_38_3 = local_108[EBodyChainType(2)].GetLocation();
                local_182 = (local_26 * local_88.Foot_L_Weight);
                local_186_3.SoftMove_Solve(-1, (local_38_3 + local_182), true, -1);
            }
            if (this.BodyBoneChains.Contains(EBodyChainType(3)))
            {
                FPT_BoneChainRef& local_186_4 = this.BodyBoneChains.FindOrAdd(EBodyChainType(3));
                FVector local_46_3 = local_108[EBodyChainType(3)].GetLocation();
                local_38_3 = (local_26 * local_88.Foot_R_Weight);
                local_186_4.SoftMove_Solve(-1, (local_46_3 + local_38_3), true, -1);
            }
        }
        int local_187 = 0;
        for (; local_187 < this.RuntimeJiggleInfos.Num(); ++local_187)
        {
            FRuntimeJiggleInfo& local_20_2 = this.RuntimeJiggleInfos[local_187];
            if (local_5)
            {
                local_20_2.bIsActive = (local_20_2.Time >= 0.0f);
                if (local_20_2.Time < 0.0f)
                {
                    continue;
                }
                FRuntimeFloatCurve& local_30_2 = this.JiggleCurves.FindOrAdd(local_20_2.JiggleCurveName);
                float local_190 = 0.0;
                float local_192 = 0.0;
                local_30_2.GetTimeRange(local_190, local_192);
                float32 local_27_3 = this.CurrentDeltaSeconds;
                local_20_2.Time = (local_20_2.Time + local_27_3);
                local_27_3 = local_20_2.Time;
                if (local_27_3 > local_192)
                {
                    local_27_3 = -1.0f;
                    local_20_2.Time = -1.0f;
                }
                continue;
            }
            if (local_1)
            {
                local_20_2.bIsActive = !(local_20_2.SimulatedDisplacement.IsNearlyZero(9.999999747378752e-5));
                continue;
            }
            local_20_2.bIsActive = false;
        }
        return;
    }
    void AddRuntimeJiggleInfo(const FRuntimeJiggleInfo &inout Info)
    {
        bool local_1 = false;
        for (auto& local_16 : this.RuntimeJiggleInfos)
        {
            if (!(local_16.bIsActive))
            {
                local_1 = true;
                break;
            }
        }
        if (!(local_1))
        {
            this.RuntimeJiggleInfos.Add(Info);
        }
        return;
    }
}

