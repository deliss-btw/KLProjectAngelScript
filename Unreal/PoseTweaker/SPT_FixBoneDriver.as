

struct FFixBoneRuntimeTarget
{
    UPROPERTY()
    FPT_BoneRef Bone;
    UPROPERTY()
    int OwnerControllerIndex;
    UPROPERTY()
    int ParentType;
    UPROPERTY()
    FVector StaticOffsetPos_Maya;
    UPROPERTY()
    FVector StaticOffsetRot_Maya;
    UPROPERTY()
    FVector StaticOffsetSca_Maya;
    UPROPERTY()
    FVector AccOffsetPos_Maya;
    UPROPERTY()
    FVector AccOffsetRot_Maya;
    UPROPERTY()
    FVector AccOffsetScale_Maya;

    FFixBoneRuntimeTarget()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

struct FFixBoneRuntimeController
{
    UPROPERTY()
    FName Name;
    UPROPERTY()
    FPT_BoneRef Bone;
    UPROPERTY()
    FPT_BoneRef TrueTargetBoneRef;
    UPROPERTY()
    FTransform OrigLocalTM;
    UPROPERTY()
    FTransform CurrentLocalTM;
    UPROPERTY()
    FQuat OrigInvRotation;
    UPROPERTY()
    FQuat FrameAdditiveOffset;
    UPROPERTY()
    FTransform FrameTargLocalTM;
    UPROPERTY()
    FTransform FrameHalfLocalTM;

    FFixBoneRuntimeController()
    {
        return;
    }
}

class USPT_FixBoneDriver : USkeletalPoseTweaker
{
    UPROPERTY()
    UFixBoneConfig Config;
    UPROPERTY()
    bool bWantsDebug = false;
    UPROPERTY()
    bool bDebugSingleFixBone = true;
    UPROPERTY()
    FName DebugFixBoneName;
    FPT_BoneRef DebugFixBone;
    FPT_BoneRef DebugMainBone;
    TArray<FFixBoneRuntimeTarget> RuntimeTargets;
    TMap<FName, int> TargetIndexByName;
    TMap<FName, int> TargetOwnerControllerIndex;
    TArray<FFixBoneRuntimeController> RuntimeControllers;
    TMap<FName, int> ControllerIndexByName;
    FName Channel_TX = n"TranslateX";
    FName Channel_TY = n"TranslateY";
    FName Channel_TZ = n"TranslateZ";
    FName Channel_RX = n"RotateX";
    FName Channel_RY = n"RotateY";
    FName Channel_RZ = n"RotateZ";
    FName Channel_SX = n"ScaleX";
    FName Channel_SY = n"ScaleY";
    FName Channel_SZ = n"ScaleZ";
    FString Suffix_Orig = "Orig";
    FString Suffix_Half = "Half";
    FString Suffix_Targ = "Targ";


    UFUNCTION()
    void OnInitialization_Implementation()
    {
        int local_1;
        FFixBoneControllerData& local_154;
        const FFixBonePoseData& local_246;
        FFixBoneTargetBoneInfo& local_288;
        this.RuntimeTargets.Empty(0);
        this.TargetIndexByName.Empty(0);
        this.TargetOwnerControllerIndex.Empty(0);
        this.RuntimeControllers.Empty(0);
        this.ControllerIndexByName.Empty(0);
        this.InitDebugBones();
        if (!((this.Config != nullptr)))
        {
            return;
        }
        for (auto& local_20 : this.Config.Controllers)
        {
            if (!(this.Config.ControllerPoses.Contains(local_20)))
            {
                continue;
            }
            if (this.IsDebugSingleFixBone() && !(local_20.IsEqual(this.DebugMainBone.GetBoneName(), true, true)))
            {
                continue;
            }
            FFixBoneRuntimeController local_152;
            local_152.Name = local_20;
            local_152.Bone.SetBoneName(local_20);
            this.InitializeBoneRef(local_152.Bone);
            if (!(local_152.Bone.IsValidToEvaluate()))
            {
                continue;
            }
            local_154 = this.Config.ControllerPoses[local_20];
            if (!(local_154.TrueTargetBone.IsNone()))
            {
                local_152.TrueTargetBoneRef.SetBoneName(local_154.TrueTargetBone);
                if (!(this.InitializeBoneRef(local_152.TrueTargetBoneRef)) || !(local_152.TrueTargetBoneRef.IsValidToEvaluate()))
                {
                    this.LogMessageToDisplay(FString().Append("[FixBone] WARNING: _true_target_bone '").Append(local_154.TrueTargetBone).Append("' not found for controller '").Append(local_20).Append("', ignoring."));
                    local_152.TrueTargetBoneRef = FPT_BoneRef();
                }
                else
                {
                    this.ValidateTrueTargetBoneInvariants(local_152);
                }
            }
            local_152.OrigLocalTM = this.GetRefPoseTransformLocal(local_152.Bone.GetBoneIndex());
            local_152.CurrentLocalTM = local_152.OrigLocalTM;
            local_152.OrigInvRotation = local_152.OrigLocalTM.GetRotation().Inverse();
            local_152.FrameAdditiveOffset = FQuat::Identity;
            local_152.FrameTargLocalTM = local_152.OrigLocalTM;
            local_152.FrameHalfLocalTM = local_152.OrigLocalTM;
            local_1 = this.RuntimeControllers.Num();
            this.RuntimeControllers.Add(local_152);
            this.ControllerIndexByName.Add(local_20, local_1);
        }
        for (auto& local_224 : this.Config.ControllerPoses)
        {
            FName local_226 = local_224.GetKey();
            if (!(this.ControllerIndexByName.Contains(local_226)))
            {
                continue;
            }
            local_1 = this.ControllerIndexByName[local_226];
            for (auto& local_244 : local_154.Poses)
            {
                local_244;
                for (auto& local_264 : local_246.BoneData)
                {
                    FName local_266 = local_264.GetKey();
                    if (this.IsDebugSingleFixBone() && !(local_266.IsEqual(this.DebugFixBone.GetBoneName(), true, true)))
                    {
                        continue;
                    }
                    if (!(this.TargetOwnerControllerIndex.Contains(local_266)))
                    {
                        this.TargetOwnerControllerIndex.Add(local_266, local_1);
                        continue;
                    }
                    bool local_25 = (this.TargetOwnerControllerIndex[local_266] == local_1);
                }
            }
        }
        for (auto& local_286 : this.Config.TargetBones)
        {
            FName local_266_2 = local_286.GetKey();
            if (!(this.TargetOwnerControllerIndex.Contains(local_266_2)))
            {
                continue;
            }
            FFixBoneRuntimeTarget local_332;
            local_332.Bone.SetBoneName(local_266_2);
            this.InitializeBoneRef(local_332.Bone);
            if (!(local_332.Bone.IsValidToEvaluate()))
            {
                continue;
            }
            local_332.OwnerControllerIndex = this.TargetOwnerControllerIndex[local_266_2];
            local_332.ParentType = this.ParseParentType(local_288.ParentSuffix);
            local_332.StaticOffsetPos_Maya = local_288.OffsetPos;
            local_332.StaticOffsetRot_Maya = local_288.OffsetRot;
            local_332.AccOffsetPos_Maya = FVector::ZeroVector;
            local_332.AccOffsetRot_Maya = FVector::ZeroVector;
            local_332.AccOffsetScale_Maya = FVector::OneVector;
            int local_205 = this.RuntimeTargets.Num();
            this.RuntimeTargets.Add(local_332);
            this.TargetIndexByName.Add(local_266_2, local_205);
        }
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        const FFixBonePoseData& local_186;
        if ((!((this.Config != nullptr))))
        {
            return;
        }
        int local_4 = 0;
        for (; local_4 < this.RuntimeControllers.Num(); ++local_4)
        {
            FFixBoneRuntimeController& local_8 = this.RuntimeControllers[local_4];
            if (!(local_8.Bone.IsValidToEvaluate()))
            {
                continue;
            }
            local_8.CurrentLocalTM = this.GetBoneTransformLocal(local_8.Bone.GetBoneIndex());
            FQuat local_40 = local_8.OrigInvRotation;
            local_8.FrameAdditiveOffset = (local_40 * local_8.CurrentLocalTM.GetRotation());
            if (local_8.TrueTargetBoneRef.IsValidToEvaluate())
            {
                FTransform local_32 = this.GetBoneTransformCS(local_8.Bone.GetBoneIndex());
                FTransform local_80 = this.GetBoneTransformCS(local_8.TrueTargetBoneRef.GetBoneIndex());
                FTransform local_128;
                local_128.SetLocation(local_32.GetLocation());
                local_128.SetRotation(local_80.GetRotation());
                local_128.SetScale3D(local_32.GetScale3D());
                local_8.FrameTargLocalTM = local_128.GetRelativeTransform(this.GetBoneTransformCS(this.GetParentBoneIndex(local_8.Bone.GetBoneIndex())));
            }
            else
            {
                local_8.FrameTargLocalTM = local_8.CurrentLocalTM;
            }
            local_8.FrameHalfLocalTM = local_8.FrameTargLocalTM;
            local_8.FrameHalfLocalTM.SetRotation(FQuat::Slerp(local_8.OrigLocalTM.GetRotation(), local_8.FrameTargLocalTM.GetRotation(), 0.5));
        }
        int local_4_2 = 0;
        for (; local_4_2 < this.RuntimeTargets.Num(); )
        {
            this.RuntimeTargets[local_4_2].AccOffsetPos_Maya = this.RuntimeTargets[local_4_2].StaticOffsetPos_Maya;
            this.RuntimeTargets[local_4_2].AccOffsetRot_Maya = this.RuntimeTargets[local_4_2].StaticOffsetRot_Maya;
            this.RuntimeTargets[local_4_2].AccOffsetScale_Maya = FVector::OneVector;
            ++local_4_2;
        }
        int local_4_3 = 0;
        for (; local_4_3 < this.RuntimeControllers.Num(); ++local_4_3)
        {
            FFixBoneRuntimeController& local_8_2 = this.RuntimeControllers[local_4_3];
            if (!(this.Config.ControllerPoses.Contains(local_8_2.Name)))
            {
                continue;
            }
            this.DebugDrawControllerInitialAndCurrentAxisX(local_8_2);
            FFixBoneControllerData& local_166 = this.Config.ControllerPoses[local_8_2.Name];
            for (auto& local_184 : local_166.Poses)
            {
                local_184;
                float32 local_188 = this.ComputePoseWeight(local_186, local_8_2.FrameAdditiveOffset);
                if (local_188 <= 0.0001f)
                {
                    continue;
                }
                this.AccumulatePoseOffsets(local_186, local_188);
            }
        }
        int local_4_4 = 0;
        for (; local_4_4 < this.RuntimeTargets.Num(); ++local_4_4)
        {
            FFixBoneRuntimeTarget& local_190 = this.RuntimeTargets[local_4_4];
            if (!(local_190.Bone.IsValidToEvaluate()))
            {
                continue;
            }
            if (int(local_190.OwnerControllerIndex) < 0 || (int(local_190.OwnerControllerIndex) >= this.RuntimeControllers.Num()))
            {
                continue;
            }
            FFixBoneRuntimeController& local_8_3 = this.RuntimeControllers[int(local_190.OwnerControllerIndex)];
            FTransform local_80_2 = (this.BuildOffsetTransformMayaToUE(local_190.AccOffsetPos_Maya, local_190.AccOffsetRot_Maya, local_190.AccOffsetScale_Maya) * this.BuildVirtualLocalTM(local_8_3, int(local_190.ParentType)));
            this.SetBoneTransformLocal(local_190.Bone.GetBoneIndex(), this.ConvertVirtualSpaceToLocalSpace(local_80_2, local_8_3));
        }
        if (this.IsInDebug())
        {
            FTransform local_104 = this.GetBoneTransformLocal(this.DebugFixBone.GetBoneIndex());
            bool local_191 = false;
            FString local_196 = FString();
            this.AddOnScreenDebugMessage(local_196.Append("T = ").Append(local_104.GetLocation()).Append("\nR = ").Append(local_104.GetRotation().Rotator()).Append("\nS = ").Append(local_104.GetScale3D()), 101, local_191, 2.0f);
            this.DrawAnimDebugTransform(this.DebugFixBone.GetTransform(), 10.0f, true);
            FVector local_208 = local_104.TransformPosition(FVector(1.0, 0.0, 0.0));
            FVector local_214 = local_104.TransformPosition(FVector(0.0, -1.0, 0.0));
            FVector local_224 = local_104.TransformPosition(FVector(0.0, 0.0, 1.0));
            local_191 = false;
            FString local_196_2 = FString();
            this.AddOnScreenDebugMessage(local_196_2.Append("PtOnX = ").Append(local_208).Append("\nPtOnY = ").Append(local_214).Append("\nPtOnZ = ").Append(local_224), 200, local_191, 2.0f);
        }
        return;
    }
    bool IsInDebug() const
    {
        return false;
    }
    bool IsDebugSingleFixBone() const
    {
        return this.IsInDebug() && this.bDebugSingleFixBone;
    }
    void InitDebugBones()
    {
        this.DebugFixBone.SetBoneName(this.DebugFixBoneName);
        bool local_2 = this.InitializeBoneRef(this.DebugFixBone);
        if ((local_2 && this.DebugFixBone.IsValidToEvaluate()))
        {
            this.DebugMainBone.SetBoneName(this.GetBoneName(this.GetParentBoneIndex(this.DebugFixBone.GetBoneIndex())));
            this.InitializeBoneRef(this.DebugMainBone);
        }
        return;
    }
    void ValidateTrueTargetBoneInvariants(const FFixBoneRuntimeController &inout Ctrl)
    {
        return;
    }
    int ParseParentType(const FString &inout InSuffix)
    {
        if ((InSuffix == this.Suffix_Orig))
        {
            return 0;
        }
        if ((InSuffix == this.Suffix_Targ))
        {
            return 2;
        }
        return 1;
    }
    FTransform BuildVirtualLocalTM(const FFixBoneRuntimeController &inout OwnerCtrl, const int ParentType)
    {
        if (ParentType == 0)
        {
            return OwnerCtrl.OrigLocalTM;
        }
        if (ParentType == 2)
        {
            return OwnerCtrl.FrameTargLocalTM;
        }
        return OwnerCtrl.FrameHalfLocalTM;
    }
    FTransform ConvertVirtualSpaceToLocalSpace(const FTransform &inout VirtualTM, const FFixBoneRuntimeController &inout OwnerCtrl)
    {
        return VirtualTM.GetRelativeTransform(OwnerCtrl.CurrentLocalTM);
    }
    void AccumulatePoseOffsets(const FFixBonePoseData &inout Pose, const float32 Weight)
    {
        int local_28 = 0;
        for (auto& local_20 : Pose.BoneData)
        {
            FName local_22 = local_20.GetKey();
            if (!(this.TargetIndexByName.Contains(local_22)))
            {
                continue;
            }
            FFixBoneRuntimeTarget& local_26 = this.RuntimeTargets[this.TargetIndexByName[local_22]];
            if (local_28.Contains(this.Channel_TX))
            {
                local_26.AccOffsetPos_Maya.X += (local_28[this.Channel_TX] * Weight);
            }
            if (local_28.Contains(this.Channel_TY))
            {
                local_26.AccOffsetPos_Maya.Y += (local_28[this.Channel_TY] * Weight);
            }
            if (local_28.Contains(this.Channel_TZ))
            {
                local_26.AccOffsetPos_Maya.Z += (local_28[this.Channel_TZ] * Weight);
            }
            if (local_28.Contains(this.Channel_RX))
            {
                local_26.AccOffsetRot_Maya.X += (local_28[this.Channel_RX] * Weight);
            }
            if (local_28.Contains(this.Channel_RY))
            {
                local_26.AccOffsetRot_Maya.Y += (local_28[this.Channel_RY] * Weight);
            }
            if (local_28.Contains(this.Channel_RZ))
            {
                local_26.AccOffsetRot_Maya.Z += (local_28[this.Channel_RZ] * Weight);
            }
            if (local_28.Contains(this.Channel_SX))
            {
                local_26.AccOffsetScale_Maya.X += (local_28[this.Channel_SX] * Weight);
            }
            if (local_28.Contains(this.Channel_SY))
            {
                local_26.AccOffsetScale_Maya.Y += (local_28[this.Channel_SY] * Weight);
            }
            if (local_28.Contains(this.Channel_SZ))
            {
                local_26.AccOffsetScale_Maya.Z += (local_28[this.Channel_SZ] * Weight);
            }
        }
        return;
    }
    float32 ComputePoseWeight(const FFixBonePoseData &inout Pose, const FQuat &inout AnimQuatUE)
    {
        FQuat local_8 = this.ConvertMayaEulerToUEQuat(Pose.CurrentRotate, int(Pose.RotateOrder));
        FVector local_40 = FVector(1.0, 0.0, 0.0);
        FVector local_58 = (this.ConvertMayaEulerToUEQuat(Pose.InitialRotate, int(Pose.RotateOrder))).RotateVector(local_40).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_52 = local_8.RotateVector(local_40).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_64 = AnimQuatUE.RotateVector(local_40).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        float32 local_72 = this.AngleBetweenDirs(local_58, local_52);
        float32 local_71 = this.AngleBetweenDirs(local_64, local_52);
        if (local_72 <= 0.0001f)
        {
            return local_71 <= 0.0001f ? 1.0f : 0.0f;
        }
        return 1.0f - FMath::Clamp(local_71 / local_72, 0.0f, 1.0f);
    }
    float32 AngleBetweenDirs(const FVector &inout A, const FVector &inout B)
    {
        return FMath::RadiansToDegrees(FMath::Acos(float32((FMath::Clamp(A.DotProduct(B), -1.0, 1.0)))));
    }
    FTransform BuildOffsetTransformMayaToUE(const FVector &inout PosMaya, const FVector &inout RotMaya, const FVector &inout ScaleMaya)
    {
        FTransform local_24;
        local_24.SetLocation(this.MayaPosToUE(PosMaya));
        local_24.SetRotation(this.ConvertMayaEulerToUEQuat(RotMaya, 0));
        local_24.SetScale3D(this.MayaScaleToUE(ScaleMaya));
        return local_24;
    }
    FVector MayaPosToUE(const FVector &inout InPosMaya)
    {
        float local_2 = -InPosMaya.Y;
        return FVector(InPosMaya.X, local_2, InPosMaya.Z);
    }
    FQuat ConvertMayaEulerToUEQuat(const FVector &inout EulerDegMaya, const int RotateOrder)
    {
        FQuat local_8 = FQuat(FQuat::Identity);
        FQuat local_44 = FQuat(FVector(1.0, 0.0, 0.0), float32(FMath::DegreesToRadians(EulerDegMaya.X)));
        FQuat local_24 = FQuat(FVector(0.0, 1.0, 0.0), float32(FMath::DegreesToRadians(EulerDegMaya.Y)));
        FQuat local_56 = FQuat(FVector(0.0, 0.0, 1.0), float32(FMath::DegreesToRadians(EulerDegMaya.Z)));
        switch (RotateOrder)
        {
        case 0:
        {
            local_8 = ((local_44 * local_24) * local_56);
            break;
        }
        case 1:
        {
            FQuat local_64_2 = (local_24 * local_56);
            local_8 = (local_64_2 * local_44);
            break;
        }
        case 2:
        {
            FQuat local_64_3 = (local_56 * local_44);
            local_8 = (local_64_3 * local_24);
            break;
        }
        case 3:
        {
            FQuat local_64_4 = (local_44 * local_56);
            local_8 = (local_64_4 * local_24);
            break;
        }
        case 4:
        {
            FQuat local_64_5 = (local_24 * local_44);
            local_8 = (local_64_5 * local_56);
            break;
        }
        case 5:
        {
            FQuat local_64_6 = (local_56 * local_24);
            local_8 = (local_64_6 * local_44);
            break;
        }
        }
        float local_34_2 = -local_8.W;
        float local_32 = -local_8.Y;
        return FQuat(local_8.X, local_32, local_8.Z, local_34_2);
    }
    FVector MayaScaleToUE(const FVector &inout InScaleMaya)
    {
        return InScaleMaya;
    }
    void DebugDrawControllerInitialAndCurrentAxisX(const FFixBoneRuntimeController &inout Ctrl)
    {
        if (this.IsInDebug() && Ctrl.Bone.IsValidToEvaluate())
        {
            FTransform local_28 = this.GetBoneTransformCS(this.GetParentBoneIndex(Ctrl.Bone.GetBoneIndex()));
            FTransform local_76 = (Ctrl.OrigLocalTM * local_28);
            FVector local_106(local_76.GetLocation());
            FVector local_112 = (local_106 + (local_76.GetRotation().GetAxisX() * 12.0));
            this.DrawAnimDebugArrow(local_106, local_112, 3.0f, FColor::Red, 0.0f, true);
            FTransform local_100 = (Ctrl.CurrentLocalTM * local_28);
            FVector local_106_2(local_100.GetLocation());
            FVector local_128_2 = (local_100.GetRotation().GetAxisX() * 10.0);
            FVector local_134 = (local_106_2 + local_128_2);
            this.DrawAnimDebugArrow(local_106_2, local_134, 3.0f, FColor::Orange, 0.0f, true);
        }
        return;
    }
}

