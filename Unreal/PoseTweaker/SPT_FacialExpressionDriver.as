

struct FFacialModifyBone
{
    UPROPERTY()
    FPT_BoneRef Bone;
    UPROPERTY()
    FVector T;
    UPROPERTY()
    FVector R;
    UPROPERTY()
    FVector S;
    UPROPERTY()
    bool bDirty = false;


    void Clear()
    {
        this.T = FVector::ZeroVector;
        this.R = FVector::ZeroVector;
        this.S = FVector::OneVector;
        return;
    }
    void ApplyToBone(const USkeletalPoseTweaker PoseTweaker)
    {
        if (!(this.HasValidSetup()))
        {
            return;
        }
        FTransform local_28;
        float local_30 = -this.T.Y;
        local_28.SetLocation(FVector(this.T.X, local_30, this.T.Z));
        FQuat local_76 = (FQuat(FVector(1.0, 0.0, 0.0), FMath::DegreesToRadians(this.R.X)) * FQuat(FVector(0.0, 1.0, 0.0), FMath::DegreesToRadians(this.R.Y)));
        FQuat local_60 = (local_76 * FQuat(FVector(0.0, 0.0, 1.0), FMath::DegreesToRadians(local_76)));
        float local_40_3 = -local_60.W;
        float local_50 = -local_60.Y;
        local_28.SetRotation(FQuat(local_60.X, local_50, local_60.Z, local_40_3));
        local_28.SetScale3D(this.S);
        FTransform local_128 = (local_28 * PoseTweaker.GetBoneTransformLocal(this.GetBoneIndex()));
        PoseTweaker.SetBoneTransformLocal(this.GetBoneIndex(), local_128);
        return;
    }
}

class USPT_FacialExpressionDriver : USkeletalPoseTweaker
{
    UPROPERTY()
    UFacialExpressionConfig Config;
    UPROPERTY()
    TArray<FFacialExpressionCtrlInput> CtrlInputs;
    TMap<FName, FFacialModifyBone> ModifyBones;
    UFacialExpressionCompiledConfig CompiledConfig;
    TArray<FFacialModifyBone> ModifyBonesCompiled;
    TArray<int> DirtyBoneIndices;
    FName CtrlAttr_TranslateX;
    FName CtrlAttr_TranslateY;
    FName CtrlAttr_TranslateZ;
    FName CtrlAttr_RotateX;
    FName CtrlAttr_RotateY;
    FName CtrlAttr_RotateZ;
    FName CtrlAttr_Scale;
    TMap<FName, int> CtrlAttrNameToIndexMap;
    FName BoneAttr_TranslateX;
    FName BoneAttr_TranslateY;
    FName BoneAttr_TranslateZ;
    FName BoneAttr_RotateX;
    FName BoneAttr_RotateY;
    FName BoneAttr_RotateZ;
    FName BoneAttr_ScaleX;
    FName BoneAttr_ScaleY;
    FName BoneAttr_ScaleZ;

    USPT_FacialExpressionDriver()
    {
        this.CtrlAttr_TranslateX = n"TranslateX";
        this.CtrlAttr_TranslateY = n"TranslateY";
        this.CtrlAttr_TranslateZ = n"TranslateZ";
        this.CtrlAttr_RotateX = n"RotateX";
        this.CtrlAttr_RotateY = n"RotateY";
        this.CtrlAttr_RotateZ = n"RotateZ";
        this.CtrlAttr_Scale = n"Scale";
        this.BoneAttr_TranslateX = n"TranslateX";
        this.BoneAttr_TranslateY = n"TranslateY";
        this.BoneAttr_TranslateZ = n"TranslateZ";
        this.BoneAttr_RotateX = n"RotateX";
        this.BoneAttr_RotateY = n"RotateY";
        this.BoneAttr_RotateZ = n"RotateZ";
        this.BoneAttr_ScaleX = n"ScaleX";
        this.BoneAttr_ScaleY = n"ScaleY";
        this.BoneAttr_ScaleZ = n"ScaleZ";
        this.CtrlAttrNameToIndexMap.Add(this.CtrlAttr_TranslateX, 0);
        this.CtrlAttrNameToIndexMap.Add(this.CtrlAttr_TranslateY, 1);
        this.CtrlAttrNameToIndexMap.Add(this.CtrlAttr_TranslateZ, 2);
        this.CtrlAttrNameToIndexMap.Add(this.CtrlAttr_RotateX, 3);
        this.CtrlAttrNameToIndexMap.Add(this.CtrlAttr_RotateY, 4);
        this.CtrlAttrNameToIndexMap.Add(this.CtrlAttr_RotateZ, 5);
        this.CtrlAttrNameToIndexMap.Add(this.CtrlAttr_Scale, 6);
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        this.CompiledConfig = this.Config.CompiledConfig;
        this.ModifyBones.Empty(0);
        for (auto& local_18 : this.Config.TargetBones)
        {
            FFacialModifyBone local_44;
            local_44.Bone.SetBoneName(local_18);
            this.InitializeBoneRef(local_44.Bone);
            this.ModifyBones.Add(local_18, local_44);
        }
        this.ModifyBonesCompiled.Empty(0);
        this.DirtyBoneIndices.Empty(0);
        if (this.CompiledConfig != nullptr && (this.CompiledConfig.TargetBones.Num() > 0))
        {
            this.ModifyBonesCompiled.SetNum(this.CompiledConfig.TargetBones.Num());
            int local_50 = 0;
            for (; local_50 < this.CompiledConfig.TargetBones.Num(); )
            {
                FName local_52(this.CompiledConfig.TargetBones[local_50]);
                FFacialModifyBone local_44;
                local_44.Bone.SetBoneName(local_52);
                this.InitializeBoneRef(local_44.Bone);
                ++local_50;
            }
        }
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        if (this.CompiledConfig != nullptr && (int(this.CompiledConfig.PoseCount) > 0) && (this.CompiledConfig.CompiledControllers.Num() > 0) && (this.CompiledConfig.ControllerNameToIndex.Num() > 0))
        {
            this.EvaluatePose_Compiled();
            return;
        }
        this.EvaluatePose_Raw();
        return;
    }
    void EvaluatePose_Raw()
    {
        bool local_13 = false;
        int local_46 = 0;
        for (auto& local_16 : this.CtrlInputs)
        {
            if (!(this.Config.ControllerPoses.Contains(local_16.Name)))
            {
                continue;
            }
            FFacialExprCtrlPoseMap& local_18 = this.Config.ControllerPoses[local_16.Name];
            FName local_22 = local_16.GetCtrlAttrDirKey();
            local_13 = !(local_18.CtrlPoseMap.Contains(local_22));
            if (local_13)
            {
                continue;
            }
            const FFacialExprCtrlPoseEntry& local_24 = local_18.CtrlPoseMap[local_22];
            for (auto& local_42 : local_24.BoneData)
            {
                this.ApplyCtrlValue(local_42.GetKey(), local_46, local_16);
            }
        }
        for (auto& local_64 : this.ModifyBones)
        {
            local_64;
            local_13 = !local_13;
            if (local_13)
            {
                continue;
            }
            this.ApplyToBone();
            local_13 = false;
        }
        return;
    }
    int GetAttrIndex(const FName &inout Attr)
    {
        if (this.CtrlAttrNameToIndexMap.Contains(Attr))
        {
            return this.CtrlAttrNameToIndexMap[Attr];
        }
        return -1;
    }
    void EvaluatePose_Compiled()
    {
        int local_19;
        int local_26;
        float32 local_37;
        float32 local_38;
        int local_55;
        float local_64;
        float local_66;
        float local_68;
        this.DirtyBoneIndices.Empty(0);
        for (auto& local_18 : this.CtrlInputs)
        {
            if (!(this.CompiledConfig.ControllerNameToIndex.Contains(local_18.Name)))
            {
                continue;
            }
            local_19 = this.CompiledConfig.ControllerNameToIndex[local_18.Name];
            if (local_19 < 0 || (local_19 >= this.CompiledConfig.CompiledControllers.Num()))
            {
                continue;
            }
            int local_1 = this.GetAttrIndex(local_18.Attribute);
            if (local_1 < 0)
            {
                continue;
            }
            float32 local_23 = local_18.Value;
            bool local_20 = (local_23 >= 0.0f);
            int local_21 = local_1 * 2;
            if (local_20)
            {
                local_26 = 0;
            }
            else
            {
                local_26 = 1;
            }
            int local_27 = local_21 + local_26;
            if (local_27 < 0 || (local_27 >= int(this.CompiledConfig.PoseCount)))
            {
                continue;
            }
            FFacialExprCompiledController& local_30 = this.CompiledConfig.CompiledControllers[local_19];
            if (local_27 >= local_30.Poses.Num())
            {
                continue;
            }
            const FFacialExprCompiledPose& local_32 = local_30.Poses[local_27];
            if (local_32.Influences.Num() == 0)
            {
                continue;
            }
            bool local_15 = (FName(local_18.Attribute) == this.CtrlAttr_Scale);
            if (local_18.Value >= 0.0f)
            {
                local_37 = local_18.Value;
            }
            else
            {
                local_23 = local_18.Value;
                local_23 = -local_23;
                local_37 = local_23;
            }
            local_23 = local_18.Value - 1.0f;
            float32 local_36 = local_23 / 0.4f;
            for (auto& local_54 : local_32.Influences)
            {
                local_55 = int(local_54.BoneIndex);
                if (local_55 < 0 || (local_55 >= this.ModifyBonesCompiled.Num()))
                {
                    continue;
                }
                FFacialModifyBone& local_58 = this.ModifyBonesCompiled[local_55];
                if (!(local_58.Bone.HasValidSetup()))
                {
                    continue;
                }
                if (!(local_58.bDirty))
                {
                    local_58.bDirty = true;
                    this.DirtyBoneIndices.Add(local_55);
                }
                if (local_15)
                {
                    local_38 = local_36;
                }
                else
                {
                    local_38 = local_37;
                }
                local_26 = 1;
                if ((int(local_54.Flags) & local_26) != 0)
                {
                    local_64 = local_38;
                    local_64 = local_64 * local_54.TranslateDelta.X;
                    local_66 = local_58.T.X;
                    local_58.T.X = (local_66 + local_64);
                }
                local_26 = 2;
                if ((int(local_54.Flags) & local_26) != 0)
                {
                    local_66 = local_38;
                    local_64 = local_66 * local_54.TranslateDelta.Y;
                    local_68 = local_58.T.Y;
                    float local_62_2 = local_68 + local_64;
                    local_58.T.Y = local_62_2;
                }
                local_26 = int(local_54.Flags) & 4;
                if (local_26 != 0)
                {
                    local_68 = local_38;
                    local_64 = local_68 * local_54.TranslateDelta.Z;
                    local_66 = local_58.T.Z;
                    local_58.T.Z = (local_66 + local_64);
                }
                local_26 = 8;
                if ((int(local_54.Flags) & local_26) != 0)
                {
                    local_66 = local_38;
                    local_64 = local_66 * local_54.RotateDelta.X;
                    local_68 = local_58.R.X;
                    float local_62_4 = local_68 + local_64;
                    local_58.R.X = local_62_4;
                }
                local_26 = int(local_54.Flags) & 16;
                if (local_26 != 0)
                {
                    local_68 = local_38;
                    local_64 = local_68 * local_54.RotateDelta.Y;
                    local_66 = local_58.R.Y;
                    local_58.R.Y = (local_66 + local_64);
                }
                local_26 = 32;
                if ((int(local_54.Flags) & local_26) != 0)
                {
                    local_66 = local_38;
                    local_64 = local_66 * local_54.RotateDelta.Z;
                    local_68 = local_58.R.Z;
                    float local_62_6 = local_68 + local_64;
                    local_58.R.Z = local_62_6;
                }
                local_26 = int(local_54.Flags) & 64;
                if (local_26 != 0)
                {
                    if (local_15)
                    {
                        local_68 = local_18.Value;
                        local_66 = local_68;
                    }
                    else
                    {
                        local_68 = local_37;
                        local_66 = local_68 * local_54.ScaleDelta.X;
                    }
                    local_58.S.X = local_66;
                }
                local_26 = 128;
                if ((int(local_54.Flags) & local_26) != 0)
                {
                    if (local_15)
                    {
                        local_64 = local_18.Value;
                        local_68 = local_64;
                    }
                    else
                    {
                        local_64 = local_37;
                        local_68 = local_64 * local_54.ScaleDelta.Y;
                    }
                    local_58.S.Y = local_68;
                }
                local_26 = int(local_54.Flags) & 256;
                if (local_26 != 0)
                {
                    if (local_15)
                    {
                        local_64 = local_18.Value;
                    }
                    else
                    {
                        local_64 = local_37 * local_54.ScaleDelta.Z;
                    }
                    local_58.S.Z = local_64;
                }
            }
        }
        local_55 = 0;
        for (; local_55 < this.DirtyBoneIndices.Num(); ++local_55)
        {
            local_19 = this.DirtyBoneIndices[local_55];
            if (local_19 < 0 || (local_19 >= this.ModifyBonesCompiled.Num()))
            {
                continue;
            }
            FFacialModifyBone& local_58_2 = this.ModifyBonesCompiled[local_19];
            if (!(local_58_2.bDirty))
            {
                continue;
            }
            local_58_2.ApplyToBone(this);
            local_58_2.bDirty = false;
        }
        return;
    }
    bool GetModifyBone(const FString &inout BoneName, FFacialModifyBone &inout OutBone)
    {
        FName local_4 = FName(BoneName);
        if (this.ModifyBones.Contains(local_4) && this.ModifyBones[local_4].Bone.HasValidSetup())
        {
            return true;
        }
        return false;
    }
    void ApplyCtrlValue(const FName &inout BoneName, const TMap<FName, FFacialExprBoneAttribute> &inout NameToAttrMap, const FFacialExpressionCtrlInput &inout CtrlInput)
    {
        if (!(this.ModifyBones.Contains(BoneName)) || !(this.ModifyBones[BoneName].Bone.HasValidSetup()))
        {
            return;
        }
        FFacialModifyBone& local_4 = this.ModifyBones[BoneName];
        if (!(local_4.bDirty))
        {
            local_4.bDirty = true;
        }
        float32 local_5 = this.ParseCtrlInputAttrValue(CtrlInput, NameToAttrMap, this.BoneAttr_TranslateX);
        local_4.T.X += local_5;
        float32 local_5_2 = this.ParseCtrlInputAttrValue(CtrlInput, NameToAttrMap, this.BoneAttr_TranslateY);
        local_4.T.Y += local_5_2;
        float32 local_5_3 = this.ParseCtrlInputAttrValue(CtrlInput, NameToAttrMap, this.BoneAttr_TranslateZ);
        local_4.T.Z += local_5_3;
        float32 local_5_4 = this.ParseCtrlInputAttrValue(CtrlInput, NameToAttrMap, this.BoneAttr_RotateX);
        local_4.R.X += local_5_4;
        float32 local_5_5 = this.ParseCtrlInputAttrValue(CtrlInput, NameToAttrMap, this.BoneAttr_RotateY);
        local_4.R.Y += local_5_5;
        float32 local_5_6 = this.ParseCtrlInputAttrValue(CtrlInput, NameToAttrMap, this.BoneAttr_RotateZ);
        local_4.R.Z += local_5_6;
        if (NameToAttrMap.Contains(this.BoneAttr_ScaleX))
        {
            float32 local_5_7 = this.ParseCtrlInputAttrValue(CtrlInput, NameToAttrMap, this.BoneAttr_ScaleX);
            local_4.S.X = local_5_7;
        }
        if (NameToAttrMap.Contains(this.BoneAttr_ScaleY))
        {
            float32 local_5_8 = this.ParseCtrlInputAttrValue(CtrlInput, NameToAttrMap, this.BoneAttr_ScaleY);
            local_4.S.Y = local_5_8;
        }
        if (NameToAttrMap.Contains(this.BoneAttr_ScaleZ))
        {
            float32 local_5_9 = this.ParseCtrlInputAttrValue(CtrlInput, NameToAttrMap, this.BoneAttr_ScaleZ);
            local_4.S.Z = local_5_9;
        }
        return;
    }
    float32 ParseCtrlInputAttrValue(const FFacialExpressionCtrlInput &inout CtrlInput, const TMap<FName, FFacialExprBoneAttribute> &inout NameToAttrMap, const FName &inout BoneAttrName)
    {
        float32 local_3;
        if (!(NameToAttrMap.Contains(BoneAttrName)))
        {
            return 0.0f;
        }
        else
        {
            float32 local_2;
            local_2 = NameToAttrMap[BoneAttrName].Delta;
            local_3 = local_2;
            bool local_1 = (FName(CtrlInput.Attribute) == this.CtrlAttr_Scale);
            bool local_4 = (BoneAttrName == this.BoneAttr_ScaleX) || (BoneAttrName == this.BoneAttr_ScaleY) || (BoneAttrName == this.BoneAttr_ScaleZ);
            if (local_1)
            {
                if (local_4)
                {
                    return CtrlInput.Value;
                }
                else
                {
                    local_2 = CtrlInput.Value;
                    local_2 = local_2 - 1.0f;
                    return (local_2 / 0.4f) * local_3;
                }
            }
            else
            {
                if (CtrlInput.Value >= 0.0f)
                {
                    local_2 = CtrlInput.Value;
                }
                else
                {
                    float32 local_10_2 = -CtrlInput.Value;
                    local_2 = local_10_2;
                }
                return local_2 * local_3;
            }
        }
    }
}

