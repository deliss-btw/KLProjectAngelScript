
enum EShakeSimulationState
{
    None,
    Running,
    Idle,
}


struct FShakeBoneCurveSetting
{
    UPROPERTY()
    FName CurveName;
    UPROPERTY()
    float32 TimeScale = 1.0f;
    UPROPERTY()
    float32 StrengthScale = 1.0f;


}

struct FShakeBoneSetting
{
    UPROPERTY()
    FPT_BoneRef BoneRef;
    UPROPERTY()
    EAxis TwistAxis = EAxis(1);
    UPROPERTY()
    FPT_FloatSpring FloatSpring;
    UPROPERTY()
    float ImpulseVelocity = 1000.0;
    UPROPERTY()
    FShakeBoneCurveSetting CurveSetting;


}

struct FShakeBoneChainSetting
{
    UPROPERTY()
    FName BoneChainName;
    UPROPERTY()
    float32 BlendSeconds = 0.2f;
    UPROPERTY()
    TArray<FShakeBoneSetting> ShakeBones;


}

struct FShakeBoneRuntimeState
{
    UPROPERTY()
    bool bEverStarted;
    UPROPERTY()
    float32 ElapsedSecondsSinceCurveRun;
    UPROPERTY()
    float32 LastAppliedCurveValue;
    UPROPERTY()
    float32 RemainingCurveValue;
    UPROPERTY()
    float32 TwistSign;
    UPROPERTY()
    int IndexIntoSettingArray;
    UPROPERTY()
    float32 FinalCurveTimeScale;
    UPROPERTY()
    float32 FinalCurveStrengthScale;

    FShakeBoneRuntimeState()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

struct FShakeBoneChainRuntimeState
{
    UPROPERTY()
    bool bLastInputRunTrigger;
    UPROPERTY()
    int BoneChainSettingIndex;
    UPROPERTY()
    TMap<FName, FShakeBoneRuntimeState> BoneStates;

    FShakeBoneChainRuntimeState()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

struct FShakeInputStates
{
    UPROPERTY()
    bool bTrigger = false;
    UPROPERTY()
    float32 AdditionalCurveTimeScale = 1.0f;
    UPROPERTY()
    float32 AdditionalCurveStrengthScale = 1.0f;
    UPROPERTY()
    FVector ExternalDriveOrigin = FVector::ZeroVector;
    UPROPERTY()
    FVector ExternalDriveDirection = FVector::ZeroVector;


}

class USPT_ShakeControllerBase : USkeletalPoseTweaker
{
    UPROPERTY()
    TArray<FShakeBoneChainSetting> ShakeBoneChains;
    TMap<FName, FShakeBoneChainRuntimeState> ShakeBoneChainStates;
    UPROPERTY()
    TMap<FName, FRuntimeFloatCurve> ShakeAngleCurves;
    UPROPERTY()
    TMap<FName, FShakeInputStates> InputStates;
    UPROPERTY()
    bool bUseDebugInputsInABPPreview = false;
    UPROPERTY()
    TMap<FName, FShakeInputStates> DebugInputState;
    int DebugTriggerUpdateCounter = 2147483647;


    UFUNCTION()
    void OnInitialization_Implementation()
    {
        this.ShakeBoneChainStates.Empty(0);
        int local_2 = 0;
        for (; local_2 < this.ShakeBoneChains.Num(); ++local_2)
        {
            FShakeBoneChainSetting& local_6 = this.ShakeBoneChains[local_2];
            FShakeBoneChainRuntimeState& local_8 = this.ShakeBoneChainStates.FindOrAdd(local_6.BoneChainName);
            local_8.BoneChainSettingIndex = local_2;
            int local_9 = 0;
            for (; local_9 < local_6.ShakeBones.Num(); ++local_9)
            {
                FShakeBoneSetting& local_12 = local_6.ShakeBones[local_9];
                if (!(local_12.BoneRef.HasValidSetup()))
                {
                    continue;
                }
                float local_18 = this.GetBoneAngle(local_12.BoneRef, local_12.TwistAxis);
                local_12.FloatSpring.Init(local_18, 0.0);
                FName local_20 = local_12.BoneRef.GetBoneName();
                FShakeBoneRuntimeState local_22;
                local_22.IndexIntoSettingArray = local_9;
            }
        }
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        const FShakeInputStates& local_24;
        FShakeBoneRuntimeState& local_76;
        float32 local_77;
        const TMap<FName, FShakeInputStates>& local_2 = this.GetInputStates();
        for (auto& local_22 : local_2)
        {
            if (this.ShakeBoneChainStates.Contains(local_22.GetKey()))
            {
                bool local_28;
                FShakeBoneChainRuntimeState& local_26 = this.ShakeBoneChainStates[local_22.GetKey()];
                bool local_19 = !(local_26.bLastInputRunTrigger);
                local_28 = !(false);
                if (local_19 != local_28)
                {
                    local_28 = false;
                }
                else
                {
                    local_28 = local_24.bTrigger;
                }
                local_26.bLastInputRunTrigger = local_24.bTrigger;
                if (local_28)
                {
                    FVector local_36 = this.InvAnimComponentTransform.TransformPosition(local_24.ExternalDriveOrigin);
                    FVector local_50 = (local_36 + (this.InvAnimComponentTransform.TransformVector(local_24.ExternalDriveDirection).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * 20.0));
                    for (auto& local_74 : local_26.BoneStates)
                    {
                        local_74;
                        local_76.bEverStarted = true;
                        local_76.ElapsedSecondsSinceCurveRun = 0.0f;
                        local_76.RemainingCurveValue = 0.0f;
                        local_77 = local_76.LastAppliedCurveValue;
                        local_76.RemainingCurveValue = local_77;
                        local_77 = local_24.AdditionalCurveTimeScale;
                        local_76.FinalCurveTimeScale = local_77;
                        local_77 = local_24.AdditionalCurveStrengthScale;
                        local_76.FinalCurveStrengthScale = local_77;
                        if (this.ShakeBoneChains.IsValidIndex(int(local_26.BoneChainSettingIndex)))
                        {
                            FShakeBoneChainSetting& local_80 = this.ShakeBoneChains[int(local_26.BoneChainSettingIndex)];
                            if (!(local_80.ShakeBones.IsValidIndex(int(local_76.IndexIntoSettingArray))))
                            {
                                continue;
                            }
                            FShakeBoneSetting& local_82 = local_80.ShakeBones[int(local_76.IndexIntoSettingArray)];
                            FTransform local_108 = FTransform(local_82.BoneRef.GetTransform());
                            FVector local_138 = (local_50 - local_108.GetLocation());
                            if (this.GetAxis(local_108.GetRotation(), local_82.TwistAxis).DotProduct(FQuat::FindBetween((local_36 - local_108.GetLocation()), local_138).GetRotationAxis()) >= 0.0)
                            {
                                local_77 = 1.0f;
                            }
                            else
                            {
                                local_77 = -1.0f;
                            }
                            local_76.TwistSign = local_77;
                            local_77 = local_82.CurveSetting.TimeScale;
                            float32 local_163 = local_76.FinalCurveTimeScale * local_77;
                            local_76.FinalCurveTimeScale = local_163;
                            local_163 = local_82.CurveSetting.StrengthScale;
                            local_76.FinalCurveStrengthScale *= local_163;
                            FName local_165(local_82.CurveSetting.CurveName);
                            if (local_165.IsNone() || !(this.ShakeAngleCurves.Contains(local_165)))
                            {
                                local_82.FloatSpring.AddVelocityImpulse(local_82.ImpulseVelocity);
                            }
                        }
                    }
                }
            }
        }
        auto local_172 = this.ShakeBoneChains.Iterator();
        for (; local_172.CanProceed;)
        {
            FShakeBoneChainSetting& local_80_2 = local_172.Proceed();
            auto local_184 = local_80_2.ShakeBones.Iterator();
            for (; local_184.CanProceed;)
            {
                FShakeBoneSetting& local_82_2 = local_184.Proceed();
                if (!(local_82_2.BoneRef.HasValidSetup()))
                {
                    continue;
                }
                FName local_192 = local_82_2.BoneRef.GetBoneName();
                if (!(local_76.bEverStarted))
                {
                    continue;
                }
                if (this.ShakeAngleCurves.Contains(local_82_2.CurveSetting.CurveName))
                {
                    float32 local_163_2 = this.CurrentDeltaSeconds;
                    local_76.ElapsedSecondsSinceCurveRun += local_163_2;
                    local_163_2 = local_76.ElapsedSecondsSinceCurveRun;
                    local_77 = local_76.FinalCurveTimeScale;
                    local_163_2 = local_163_2 * local_77;
                    if (local_163_2 > 1.0f)
                    {
                        continue;
                    }
                    FRuntimeFloatCurve& local_196 = this.ShakeAngleCurves[local_82_2.CurveSetting.CurveName];
                    float32 local_193 = local_196.GetFloatValue(local_163_2, 0.0f);
                    local_77 = local_193 * local_76.FinalCurveStrengthScale;
                    float32 local_198 = local_76.TwistSign;
                    local_77 = local_77 * local_198;
                    local_193 = FMath::Max(local_80_2.BlendSeconds, 0.01f);
                    if (local_76.ElapsedSecondsSinceCurveRun <= local_193)
                    {
                        local_198 = local_76.ElapsedSecondsSinceCurveRun;
                        local_77 = FMath::Lerp(local_76.RemainingCurveValue, local_77, local_76.ElapsedSecondsSinceCurveRun / local_193);
                    }
                    this.AdditiveBlendAngle(local_82_2.BoneRef, local_82_2.TwistAxis, local_77);
                    local_76.LastAppliedCurveValue = local_77;
                    continue;
                }
                local_82_2.FloatSpring.Update(this.CurrentDeltaSeconds, 0.0);
                this.AdditiveBlendAngle(local_82_2.BoneRef, local_82_2.TwistAxis, (local_82_2.FloatSpring.GetPosition() * local_76.TwistSign));
            }
        }
        return;
    }
    const TMap<FName, FShakeInputStates> GetInputStates()
    {
        const TMap<FName, FShakeInputStates> __r;
        return __r;
    }
    FVector GetAxis(const FQuat &inout Quat, const EAxis InAxis)
    {
        switch (int(InAxis))
        {
        case 1:
        {
            return Quat.GetAxisX();
        }
        case 2:
        {
            return Quat.GetAxisY();
        }
        case 3:
        {
            return Quat.GetAxisZ();
        }
        }
        return Quat.GetAxisX();
    }
    float GetBoneAngle(const FPT_BoneRef &inout InBoneRef, const EAxis InAxis)
    {
        float local_42 = 0.0;
        FRotator local_38 = this.GetBoneTransformLocal(InBoneRef.GetBoneIndex()).Rotator();
        switch (int(InAxis))
        {
        case 1:
        {
            return local_38.Roll;
        }
        case 2:
        {
            return local_38.Pitch;
        }
        case 3:
        {
            return local_38.Yaw;
        }
        default:
        {
            local_42 = local_38.Roll;
        }
        }
        return local_42;
    }
    void AdditiveBlendAngle(const FPT_BoneRef &inout InBoneRef, const EAxis InAxis, const float Angle)
    {
        FTransform local_52 = this.GetBoneTransformLocal(InBoneRef.GetBoneIndex());
        FRotator local_64 = local_52.Rotator();
        switch (int(InAxis))
        {
        case 1:
        {
            local_64.Roll -= Angle;
            break;
        }
        case 2:
        {
            local_64.Pitch -= Angle;
            break;
        }
        case 3:
        {
            local_64.Yaw += Angle;
            break;
        }
        }
        local_52.SetRotation(FQuat(local_64));
        InBoneRef.HasValidSetup();
        if (!(InBoneRef.HasValidSetup()))
        {
            return;
        }
        this.SetBoneTransformLocal(InBoneRef.GetBoneIndex(), local_52);
        return;
    }
}

