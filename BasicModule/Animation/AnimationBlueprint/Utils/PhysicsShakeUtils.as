
namespace FPhysicsShakeUtils
{
    const float32 NormalWorldSpaceLinearMultiplier = 1000f;
    const float32 NormalWorldSpaceAngularMultiplier = 1000f;
    const float32 ShakeWorldSpaceLinearMultiplier = 1f;
    const float32 ShakeWorldSpaceAngularMultiplier = 1f;

}
struct FShakeBoneChainConfig
{
    UPROPERTY()
    FName BoneChainName;
    UPROPERTY()
    TArray<FName> BoneNames;
    UPROPERTY()
    TArray<FName> BoneConstraintNames;
    UPROPERTY()
    int HitBoneChainIndex = -1;
    UPROPERTY()
    bool bIsActive = false;
    UPROPERTY()
    float32 ShakeAngle = 0.0f;
    UPROPERTY()
    float32 ShakeRollDirection = 1.0f;
    UPROPERTY()
    float32 ShakePitchDirection = 0.0f;
    UPROPERTY()
    float32 ShakeYawDirection = 0.0f;
    UPROPERTY()
    float32 ShakeStartTime = 0.0f;
    UPROPERTY()
    float32 ShakeDuration = 1.0f;
    UPROPERTY()
    float32 PauseStartTime = 0.0f;
    UPROPERTY()
    float32 PauseDuration = 0.0f;
    UPROPERTY()
    float32 TotalDuration = 1.0f;
    UPROPERTY()
    EShakeSolveSpace SolveSpace = EShakeSolveSpace(1);
    UPROPERTY()
    EShakeResponseMode ResponseMode = EShakeResponseMode(1);
    UPROPERTY()
    TArray<FName> CompanionChainNames;
    UPROPERTY()
    int TriggeringChainIdx = -1;


}

struct FShakeControlSetting
{
    UPROPERTY()
    FPhysicsControlControlAndModifierUpdates PhysicsControlControlAndModifierUpdates;
    UPROPERTY()
    FRigidBodyControlTargets RigidBodyControlTargets;

    FShakeControlSetting()
    {
        return;
    }
}

namespace FPhysicsShakeUtils
{
FPhysicsControlSparseMultiplier CreateWorldSpaceNormalMultiplier()
{
    FPhysicsControlSparseMultiplier local_30;
    local_30.LinearStrengthMultiplier = FVector(1000.0);
    return local_30;
}
FPhysicsControlSparseMultiplier CreateWorldSpaceShakeMultiplier()
{
    FPhysicsControlSparseMultiplier local_30;
    local_30.LinearStrengthMultiplier = FVector(1.0);
    return local_30;
}
void SetNormalMode(FShakeControlSetting &inout ShakeControlSetting)
{
    FPhysicsControlNamedControlMultiplierParameters local_32;
    local_32.Name = FName("WorldSpace");
    local_32.Data = FPhysicsShakeUtils::CreateWorldSpaceNormalMultiplier();
    ShakeControlSetting.ControlMultiplierUpdates.Empty(0);
    ShakeControlSetting.ControlMultiplierUpdates.Add(local_32);
    return;
}
void GenerateBoneConstraintNames(const TArray<FName> &inout BoneNames, TArray<FName> &inout OutBoneConstraintNames)
{
    if (BoneNames.Num() < 2)
    {
        OutBoneConstraintNames.Empty(0);
        return;
    }
    OutBoneConstraintNames.SetNum((BoneNames.Num() - 1));
    int local_4 = 0;
    for (; local_4 < (BoneNames.Num() - 1); )
    {
        FString local_18 = (BoneNames[local_4].ToString() + "_");
        OutBoneConstraintNames[local_4] = FName((local_18 + (BoneNames[(local_4 + 1)].ToString())));
        ++local_4;
    }
    return;
}
void InitializeShakeBoneChainConfigs(const FECSEntity &inout Entity, TArray<FShakeBoneChainConfig> &inout OutShakeBoneChainConfigs, FShakeControlSetting &inout OutShakeControlSetting)
{
    int local_14 = 0;
    Has local_6;
    if (!(Entity.IsValid()) || !(local_6.opCall()))
    {
        OutShakeBoneChainConfigs.Empty(0);
        FPhysicsShakeUtils::SetNormalMode(OutShakeControlSetting);
        return;
    }
    TDataObjectPtr<FAnimPhysicsShakingConfig> local_38;
    local_38 = local_14.ConfigPtr;
    if ((local_38 == nullptr))
    {
        OutShakeBoneChainConfigs.Empty(0);
        FPhysicsShakeUtils::SetNormalMode(OutShakeControlSetting);
        return;
    }
    FAnimPhysicsShakingConfig local_64;
    TArray<FBoneChainBaseConfig> local_66 = local_64.BoneChainBaseConfigs;
    OutShakeBoneChainConfigs.SetNum(local_66.Num());
    int local_67 = 0;
    for (; local_67 < local_66.Num(); ++local_67)
    {
        const FBoneChainBaseConfig& local_70 = local_66[local_67];
        OutShakeBoneChainConfigs[local_67].BoneChainName = local_70.BoneChainName;
        OutShakeBoneChainConfigs[local_67].SolveSpace = EShakeSolveSpace(local_70.SolveSpace);
        OutShakeBoneChainConfigs[local_67].ResponseMode = EShakeResponseMode(local_70.ResponseMode);
        OutShakeBoneChainConfigs[local_67].BoneNames = local_70.BoneNames;
        if (int(local_70.SolveSpace) == 0)
        {
            OutShakeBoneChainConfigs[local_67].BoneConstraintNames = local_70.BoneNames;
        }
        else
        {
            FPhysicsShakeUtils::GenerateBoneConstraintNames(local_70.BoneNames, OutShakeBoneChainConfigs[local_67].BoneConstraintNames);
        }
        OutShakeBoneChainConfigs[local_67].CompanionChainNames = local_70.CompanionChainNames;
        OutShakeBoneChainConfigs[local_67].HitBoneChainIndex = -1;
        OutShakeBoneChainConfigs[local_67].bIsActive = false;
        OutShakeBoneChainConfigs[local_67].ShakeAngle = 0.0f;
        OutShakeBoneChainConfigs[local_67].ShakeRollDirection = 1.0f;
        OutShakeBoneChainConfigs[local_67].ShakePitchDirection = 0.0f;
        OutShakeBoneChainConfigs[local_67].ShakeYawDirection = 0.0f;
        OutShakeBoneChainConfigs[local_67].ShakeStartTime = 0.0f;
        OutShakeBoneChainConfigs[local_67].ShakeDuration = 1.0f;
        OutShakeBoneChainConfigs[local_67].PauseStartTime = 0.0f;
        OutShakeBoneChainConfigs[local_67].PauseDuration = 0.0f;
        OutShakeBoneChainConfigs[local_67].TotalDuration = 1.0f;
        int local_75 = 0;
        for (; local_75 < OutShakeBoneChainConfigs[local_67].BoneConstraintNames.Num(); )
        {
            OutShakeControlSetting.RigidBodyControlTargets.Targets.FindOrAdd(OutShakeBoneChainConfigs[local_67].BoneConstraintNames[local_75]);
            ++local_75;
        }
    }
    FPhysicsShakeUtils::SetNormalMode(OutShakeControlSetting);
    return;
}
FBoneChainShakeCurveConfig GetShakeCurveConfig(const FECSEntity &inout Entity, const FName &inout BoneChainName)
{
    FBoneChainShakeCurveConfig local_52;
    int local_66 = 0;
    FBoneChainShakeCurveConfig __r;
    local_52.ShakeStrengthScale = 1.0f;
    local_52.ShakeTimeScale = 1.0f;
    Has local_58;
    if (!(Entity.IsValid()) || !(local_58.opCall()))
    {
    }
    else
    {
        TDataObjectPtr<FAnimPhysicsShakingConfig> local_90;
        local_90 = local_66.ConfigPtr;
        if ((local_90 == nullptr))
        {
        }
        else
        {
            FAnimPhysicsShakingConfig local_116;
            TArray<FBoneChainShakeCurveConfig> local_118 = local_116.OverrideShakeCurveConfigs;
            int local_119 = 0;
            for (; local_119 < local_118.Num(); ++local_119)
            {
                if ((FName(local_118[local_119].BoneChainName) == BoneChainName))
                {
                    return __r;
                }
            }
        }
    }
    return __r;
}
int FindHitBoneIndexInChain(const TArray<FName> &inout BoneNames, const FName &inout HitBoneName)
{
    if (HitBoneName.IsNone())
    {
        return -1;
    }
    int local_3 = 0;
    for (; local_3 < BoneNames.Num(); ++local_3)
    {
        if ((FName(BoneNames[local_3]) == HitBoneName))
        {
            return local_3;
        }
    }
    return -1;
}
void TriggerShake(const FECSEntity &inout Entity, const FFPTime &inout CurrentTime, const int BoneChainIndex, TArray<FShakeBoneChainConfig> &inout ShakeBoneChainConfigs, FShakeControlSetting &inout ShakeControlSetting, const FShakeDynamicParam &inout ShakeDynamicParam, const FName &inout HitBoneName)
{
    if (BoneChainIndex < 0 || (BoneChainIndex >= ShakeBoneChainConfigs.Num()))
    {
        return;
    }
    ShakeBoneChainConfigs[BoneChainIndex].bIsActive = true;
    ShakeBoneChainConfigs[BoneChainIndex].TriggeringChainIdx = -1;
    ShakeBoneChainConfigs[BoneChainIndex].ShakeStartTime = float32(CurrentTime.ToSeconds());
    ShakeBoneChainConfigs[BoneChainIndex].HitBoneChainIndex = FPhysicsShakeUtils::FindHitBoneIndexInChain(ShakeBoneChainConfigs[BoneChainIndex].BoneNames, HitBoneName);
    float32 local_7 = (FPhysicsShakeUtils::GetShakeCurveConfig(Entity, ShakeBoneChainConfigs[BoneChainIndex].BoneChainName).ShakeTimeScale) * ShakeDynamicParam.DynamicShakeTimeScale;
    ShakeBoneChainConfigs[BoneChainIndex].ShakeDuration = local_7;
    float32 local_63 = FMath::Max(0.0f, ShakeDynamicParam.PauseDuration);
    ShakeBoneChainConfigs[BoneChainIndex].PauseStartTime = (local_7 * (FMath::Clamp(ShakeDynamicParam.PauseStartPercent, 0.0f, 1.0f)));
    ShakeBoneChainConfigs[BoneChainIndex].PauseDuration = local_63;
    ShakeBoneChainConfigs[BoneChainIndex].TotalDuration = (local_7 + local_63);
    ShakeBoneChainConfigs[BoneChainIndex].ShakeAngle = 0.0f;
    return;
}
float32 GetCompanionChainStrengthScale(const TArray<FCompanionChainStrengthScale> &inout CompanionScales, const FName &inout ChainName)
{
    int local_1 = 0;
    for (; local_1 < CompanionScales.Num(); ++local_1)
    {
        if ((FName(CompanionScales[local_1].CompanionChainName) == ChainName))
        {
            return CompanionScales[local_1].StrengthScale;
        }
    }
    return 1.0f;
}
float32 GetBoneStrengthScale(const TArray<FBoneShakeScale> &inout PerBoneScales, const FName &inout BoneName)
{
    int local_1 = 0;
    for (; local_1 < PerBoneScales.Num(); ++local_1)
    {
        if ((FName(PerBoneScales[local_1].BoneName) == BoneName))
        {
            return PerBoneScales[local_1].StrengthScale;
        }
    }
    return 1.0f;
}
FRigidBodyControlTarget MakeTarget(const float32 RollDir, const float32 PitchDir, const float32 YawDir, const float32 Angle)
{
    FRigidBodyControlTarget local_12;
    local_12.TargetOrientation.Roll = (RollDir * Angle);
    local_12.TargetOrientation.Pitch = (PitchDir * Angle);
    local_12.TargetOrientation.Yaw = (YawDir * Angle);
    return local_12;
}
void SyncBoneChainToTargets(const FECSEntity &inout Entity, const int BoneChainIndex, TArray<FShakeBoneChainConfig> &inout ShakeBoneChainConfigs, FShakeControlSetting &inout ShakeControlSetting)
{
    int local_135;
    if (BoneChainIndex < 0 || (BoneChainIndex >= ShakeBoneChainConfigs.Num()))
    {
        return;
    }
    FShakeBoneChainConfig& local_6 = ShakeBoneChainConfigs[BoneChainIndex];
    int local_7 = int(local_6.HitBoneChainIndex);
    if (local_7 < 0)
    {
        return;
    }
    float32 local_8 = local_6.ShakeAngle;
    FBoneChainShakeCurveConfig local_62 = FPhysicsShakeUtils::GetShakeCurveConfig(Entity, local_6.BoneChainName);
    if (int(local_6.ResponseMode) == 0)
    {
        int local_117 = 0;
        for (; local_117 < local_6.BoneConstraintNames.Num(); )
        {
            float32 local_9 = FPhysicsShakeUtils::GetBoneStrengthScale(local_62.PerBoneScales, local_6.BoneNames[local_117]);
            ShakeControlSetting.RigidBodyControlTargets.Targets[local_6.BoneConstraintNames[local_117]] = FPhysicsShakeUtils::MakeTarget(local_6.ShakeRollDirection, local_6.ShakePitchDirection, local_6.ShakeYawDirection, local_8 * local_9);
            ++local_117;
        }
    }
    else
    {
        if (local_6.BoneConstraintNames.IsEmpty())
        {
            return;
        }
        if (local_7 < local_6.BoneConstraintNames.Num())
        {
            local_135 = local_7;
        }
        else
        {
            local_135 = local_6.BoneConstraintNames.Num() - 1;
        }
        float32 local_118 = FPhysicsShakeUtils::GetBoneStrengthScale(local_62.PerBoneScales, local_6.BoneNames[local_7]);
        ShakeControlSetting.RigidBodyControlTargets.Targets[local_6.BoneConstraintNames[local_135]] = FPhysicsShakeUtils::MakeTarget(local_6.ShakeRollDirection, local_6.ShakePitchDirection, local_6.ShakeYawDirection, local_8 * local_118);
    }
    return;
}
void ApplyAxisResponseScale(const FVector &inout AxisScale, float32 &inout InOutRoll, float32 &inout InOutPitch, float32 &inout InOutYaw)
{
    float32 local_9;
    InOutRoll = (InOutRoll * float32(AxisScale.X));
    float32 local_4_2 = float32(AxisScale.Y);
    InOutPitch = (InOutPitch * local_4_2);
    float32 local_3_3 = float32(AxisScale.Z);
    InOutYaw = (InOutYaw * local_3_3);
    float32 local_6 = (InOutRoll * InOutRoll) + (InOutPitch * InOutPitch);
    float32 local_4_5 = FMath::Sqrt(local_6 + (InOutYaw * InOutYaw));
    if (local_4_5 > 0.001f)
    {
        float32 local_5 = InOutRoll;
        InOutRoll = (local_5 / local_4_5);
        local_5 = InOutPitch;
        InOutPitch = (local_5 / local_4_5);
        local_5 = InOutYaw;
        InOutYaw = (local_5 / local_4_5);
        return;
    }
    float32 local_5_2 = FMath::Abs(float32(AxisScale.X));
    float32 local_6_2 = FMath::Abs(float32(AxisScale.Y));
    float32 local_3_5 = FMath::Abs(float32(AxisScale.Z));
    InOutRoll = 0.0f;
    InOutPitch = 0.0f;
    float32 local_8_2 = 0.0f;
    InOutYaw = 0.0f;
    if ((local_3_5 > local_5_2 && (local_3_5 > local_6_2)))
    {
        if (float32(AxisScale.Z) < 0.0f)
        {
            local_9 = -1.0f;
        }
        else
        {
            local_9 = 1.0f;
        }
        InOutYaw = local_9;
        return;
    }
    if (local_6_2 > local_5_2)
    {
        if (float32(AxisScale.Y) < 0.0f)
        {
            local_8_2 = -1.0f;
        }
        else
        {
            local_8_2 = 1.0f;
        }
        InOutPitch = local_8_2;
        return;
    }
    if (float32(AxisScale.X) < 0.0f)
    {
        local_9 = -1.0f;
    }
    else
    {
        local_9 = 1.0f;
    }
    InOutRoll = local_9;
    return;
}
void ComputeShakeDirectionFromAttack(const FVector &inout AttackDirWS, const FVector &inout AttackerPosWS, const FTransform &inout BoneWSTransform, float32 &inout OutRollDirection, float32 &inout OutPitchDirection, float32 &inout OutYawDirection)
{
    FVector local_14 = AttackDirWS.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    FVector local_6 = BoneWSTransform.GetLocation();
    FVector local_32 = (AttackerPosWS - local_6).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    bool local_34 = !(local_32.IsNearlyZero(9.999999747378752e-5));
    FVector local_40;
    if (local_34 && !(local_14.IsNearlyZero(9.999999747378752e-5)))
    {
        local_40 = local_32.CrossProduct(local_14);
    }
    else
    {
        if (!(local_14.IsNearlyZero(9.999999747378752e-5)))
        {
            local_40 = BoneWSTransform.TransformVectorNoScale(FVector(1.0, 0.0, 0.0)).CrossProduct(local_14);
        }
        else
        {
            OutRollDirection = 1.0f;
            OutPitchDirection = 0.0f;
            local_53 = 0.0f;
            OutYawDirection = 0.0f;
            return;
        }
    }
    FVector local_48 = BoneWSTransform.InverseTransformVectorNoScale(local_40);
    float local_52 = local_48.Size();
    float32 local_53_2 = float32(local_52);
    if (local_53_2 > 0.001f)
    {
        float local_52_2 = local_48.X / local_53_2;
        float32 local_54 = -float32(local_52_2);
        OutRollDirection = local_54;
        OutPitchDirection = float32((local_48.Y / local_53_2));
        float local_52_3 = local_48.Z / local_53_2;
        local_54 = float32(local_52_3);
        local_54 = -local_54;
        OutYawDirection = local_54;
        return;
    }
    OutRollDirection = 1.0f;
    float32 local_54_2 = 0.0f;
    OutPitchDirection = 0.0f;
    local_54_2 = 0.0f;
    OutYawDirection = 0.0f;
    return;
}
void UpdateShakeState(const FECSEntity &inout Entity, const FFPTime &inout CurrentTime, TArray<FShakeBoneChainConfig> &inout ShakeBoneChainConfigs, FShakeControlSetting &inout ShakeControlSetting, const FShakeDynamicParam &inout ShakeDynamicParam)
{
    float32 local_27;
    float32 local_28;
    float32 local_29;
    float32 local_140;
    float32 local_5 = float32(CurrentTime.ToSeconds());
    FRigidBodyControlTarget local_18;
    int local_19 = 0;
    for (; local_19 < ShakeBoneChainConfigs.Num(); ++local_19)
    {
        int local_23 = 0;
        for (; local_23 < ShakeBoneChainConfigs[local_19].BoneConstraintNames.Num(); )
        {
            ShakeControlSetting.RigidBodyControlTargets.Targets[ShakeBoneChainConfigs[local_19].BoneConstraintNames[local_23]] = local_18;
            ++local_23;
        }
    }
    bool local_25 = false;
    int local_23_2 = 0;
    for (; local_23_2 < ShakeBoneChainConfigs.Num(); ++local_23_2)
    {
        if (!(ShakeBoneChainConfigs[local_23_2].bIsActive))
        {
            ShakeBoneChainConfigs[local_23_2].ShakeAngle = 0.0f;
            continue;
        }
        float32 local_1_2 = ShakeBoneChainConfigs[local_23_2].ShakeStartTime;
        local_1_2 = local_5 - local_1_2;
        float32 local_26 = ShakeBoneChainConfigs[local_23_2].TotalDuration;
        if (local_1_2 >= local_26)
        {
            ShakeBoneChainConfigs[local_23_2].bIsActive = false;
            local_26 = 0.0f;
            ShakeBoneChainConfigs[local_23_2].ShakeAngle = 0.0f;
            continue;
        }
        local_25 = true;
        local_27 = ShakeBoneChainConfigs[local_23_2].PauseStartTime;
        local_28 = ShakeBoneChainConfigs[local_23_2].PauseDuration;
        if (local_1_2 < local_27)
        {
            local_29 = local_1_2;
        }
        else
        {
            local_26 = local_27 + local_28;
            if (local_1_2 < local_26)
            {
                local_29 = local_27;
            }
            else
            {
                local_29 = local_1_2 - local_28;
            }
        }
        local_26 = ShakeBoneChainConfigs[local_23_2].ShakeDuration;
        local_26 = local_29 / local_26;
        FBoneChainShakeCurveConfig local_86 = FPhysicsShakeUtils::GetShakeCurveConfig(Entity, ShakeBoneChainConfigs[local_23_2].BoneChainName);
        float32 local_32 = local_86.ShakeCurve.GetFloatValue(FMath::Clamp(local_26, 0.0f, 1.0f), 0.0f);
        int local_19_2 = ShakeBoneChainConfigs[local_23_2].TriggeringChainIdx;
        local_140 = 1.0f;
        if (local_19_2 >= 0 && (local_19_2 < ShakeBoneChainConfigs.Num()))
        {
            FBoneChainShakeCurveConfig local_138 = FPhysicsShakeUtils::GetShakeCurveConfig(Entity, ShakeBoneChainConfigs[local_19_2].BoneChainName);
            local_140 = FPhysicsShakeUtils::GetCompanionChainStrengthScale(local_138.CompanionChainScales, ShakeBoneChainConfigs[local_23_2].BoneChainName);
        }
        ShakeBoneChainConfigs[local_23_2].ShakeAngle = (((local_32 * local_86.ShakeStrengthScale) * ShakeDynamicParam.DynamicShakeStrengthScale) * local_140);
        FPhysicsShakeUtils::SyncBoneChainToTargets(Entity, local_23_2, ShakeBoneChainConfigs, ShakeControlSetting);
    }
    if (!(local_25))
    {
        FPhysicsShakeUtils::SetNormalMode(ShakeControlSetting);
    }
    else
    {
        ShakeControlSetting.PhysicsControlControlAndModifierUpdates.ControlMultiplierUpdates.Empty(0);
        int local_19_3 = 0;
        for (; local_19_3 < ShakeBoneChainConfigs.Num(); ++local_19_3)
        {
            FPhysicsControlSparseMultiplier local_316 = (int(ShakeBoneChainConfigs[local_19_3].SolveSpace) == 1) ? FPhysicsShakeUtils::CreateWorldSpaceShakeMultiplier() : FPhysicsShakeUtils::CreateWorldSpaceNormalMultiplier();
            local_23_2 = 0;
            for (; local_23_2 < ShakeBoneChainConfigs[local_19_3].BoneNames.Num(); )
            {
                FPhysicsControlNamedControlMultiplierParameters local_348;
                local_348.Name = ShakeBoneChainConfigs[local_19_3].BoneNames[local_23_2];
                local_348.Data = local_316;
                ShakeControlSetting.PhysicsControlControlAndModifierUpdates.ControlMultiplierUpdates.Add(local_348);
                ++local_23_2;
            }
        }
    }
    return;
}
int FindChainIndexByBoneName(const TArray<FShakeBoneChainConfig> &inout ShakeBoneChainConfigs, const FName &inout BoneName)
{
    if (BoneName.IsNone())
    {
        return -1;
    }
    int local_3 = -1;
    int local_4 = 0;
    for (; local_4 < ShakeBoneChainConfigs.Num(); ++local_4)
    {
        int local_6 = 0;
        for (; local_6 < ShakeBoneChainConfigs[local_4].BoneNames.Num(); ++local_6)
        {
            if ((FName(ShakeBoneChainConfigs[local_4].BoneNames[local_6]) == BoneName))
            {
                if (local_3 >= 0)
                {
                    return -2;
                }
                local_3 = local_4;
                break;
            }
        }
    }
    return local_3;
}
FName GetBoneChainNameByBodyType(const EHitShakeBodyType BodyType)
{
    switch (int(BodyType))
    {
    case 1:
    {
        return FName("Head");
    }
    case 2:
    {
        return FName("Spine");
    }
    case 3:
    {
        return FName("LeftArm");
    }
    case 4:
    {
        return FName("RightArm");
    }
    case 5:
    {
        return FName("LeftLeg");
    }
    case 6:
    {
        return FName("RightLeg");
    }
    case 7:
    {
        return FName("Tail");
    }
    }
    return NAME_None;
}
int FindChainIndexByChainName(const TArray<FShakeBoneChainConfig> &inout ShakeBoneChainConfigs, const FName &inout ChainName)
{
    if (ChainName.IsNone())
    {
        return -1;
    }
    int local_3 = 0;
    for (; local_3 < ShakeBoneChainConfigs.Num(); ++local_3)
    {
        if ((FName(ShakeBoneChainConfigs[local_3].BoneChainName) == ChainName))
        {
            return local_3;
        }
    }
    return -1;
}
int ResolveChainIndex(const TArray<FShakeBoneChainConfig> &inout ShakeBoneChainConfigs, const FName &inout HitBoneName, const EHitShakeBodyType BodyType)
{
    int local_2 = FPhysicsShakeUtils::FindChainIndexByBoneName(ShakeBoneChainConfigs, HitBoneName);
    if (local_2 >= 0)
    {
        return local_2;
    }
    return FPhysicsShakeUtils::FindChainIndexByChainName(ShakeBoneChainConfigs, FPhysicsShakeUtils::GetBoneChainNameByBodyType(EHitShakeBodyType(BodyType)));
}
void ComputeDirectionAndTrigger(const FECSEntity &inout Entity, const USkeletalMeshComponent MeshComp, const FFPTime &inout CurrentTime, const int ChainIndex, TArray<FShakeBoneChainConfig> &inout ShakeBoneChainConfigs, FShakeControlSetting &inout ShakeControlSetting, const FShakeDynamicParam &inout ShakeDynamicParam, const FVector &inout AttackDirWS, const FVector &inout AttackerPosWS, const FName &inout HitBoneName)
{
    if (ChainIndex < 0 || (ChainIndex >= ShakeBoneChainConfigs.Num()) || (MeshComp == nullptr))
    {
        return;
    }
    FName local_5 = HitBoneName;
    if (FPhysicsShakeUtils::FindHitBoneIndexInChain(ShakeBoneChainConfigs[ChainIndex].BoneNames, local_5) < 0)
    {
        if (ShakeBoneChainConfigs[ChainIndex].BoneNames.Num() > 0)
        {
            local_5 = ShakeBoneChainConfigs[ChainIndex].BoneNames[0];
        }
    }
    if (!(local_5.IsNone()))
    {
        FTransform local_60 = MeshComp.GetSocketTransform(local_5, ERelativeTransformSpace(0));
        FPhysicsShakeUtils::ComputeShakeDirectionFromAttack(AttackDirWS, AttackerPosWS, local_60, ShakeBoneChainConfigs[ChainIndex].ShakeRollDirection, ShakeBoneChainConfigs[ChainIndex].ShakePitchDirection, ShakeBoneChainConfigs[ChainIndex].ShakeYawDirection);
        FPhysicsShakeUtils::ApplyAxisResponseScale(FPhysicsShakeUtils::GetShakeCurveConfig(Entity, ShakeBoneChainConfigs[ChainIndex].BoneChainName).ShakeAxisResponseScale, ShakeBoneChainConfigs[ChainIndex].ShakeRollDirection, ShakeBoneChainConfigs[ChainIndex].ShakePitchDirection, ShakeBoneChainConfigs[ChainIndex].ShakeYawDirection);
    }
    FPhysicsShakeUtils::TriggerShake(Entity, CurrentTime, ChainIndex, ShakeBoneChainConfigs, ShakeControlSetting, ShakeDynamicParam, local_5);
    return;
}
void TriggerShakeByBodyType(const FECSEntity &inout Entity, const FFPTime &inout CurrentTime, const EHitShakeBodyType HitShakeBodyType, TArray<FShakeBoneChainConfig> &inout ShakeBoneChainConfigs, FShakeControlSetting &inout ShakeControlSetting, const FShakeDynamicParam &inout ShakeDynamicParam, const FName &inout HitBoneName)
{
    int local_2 = FPhysicsShakeUtils::ResolveChainIndex(ShakeBoneChainConfigs, HitBoneName, EHitShakeBodyType(HitShakeBodyType));
    if (local_2 >= 0)
    {
        FPhysicsShakeUtils::TriggerShake(Entity, CurrentTime, local_2, ShakeBoneChainConfigs, ShakeControlSetting, ShakeDynamicParam, HitBoneName);
    }
    return;
}
}
