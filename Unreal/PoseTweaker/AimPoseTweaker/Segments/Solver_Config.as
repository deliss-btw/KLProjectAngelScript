
enum EAimPoseYawOutOfRangeMode
{
    HysteresisClamp,
    ReturnToNeutral,
    FreeRotate,
}

enum EAimPoseSolverMode
{
    Direct_WeightCurve,
    LookAt_WeightCurve,
    IterativeCascade,
    HermiteCurve,
    AdditiveHermiteCurve,
}


struct FSCurveShapeConfig
{
    UPROPERTY()
    bool bEnabled = false;
    UPROPERTY()
    float32 MidRatio = 0.5f;
    UPROPERTY()
    float32 LateralOffset = 0.0f;
    UPROPERTY()
    float32 TangentPitchRotation = 0.0f;
    UPROPERTY()
    float32 TangentYawRotation = 0.0f;
    UPROPERTY()
    float32 MidTangentIntensity = 300.0f;
    UPROPERTY()
    float32 LengthSplitRatio = -1.0f;
    UPROPERTY()
    FRuntimeFloatCurve LateralOffsetByYawCurve = FRuntimeCurveUtils::CreateConst(0.0f);
    UPROPERTY()
    FRuntimeFloatCurve TangentPitchByYawCurve = FRuntimeCurveUtils::CreateConst(0.0f);


}

struct FHermiteCurveConfig
{
    UPROPERTY()
    float32 NeckOffsetDistance = 250.0f;
    UPROPERTY()
    float32 TargetLimitOuterRadius = 500.0f;
    UPROPERTY()
    float32 TargetLimitInnerRadius = 200.0f;
    UPROPERTY()
    float32 TargetLimitX = 300.0f;
    UPROPERTY()
    float32 NeckDefaultHeight = 400.0f;
    UPROPERTY()
    float32 YawClampMax = 90.0f;
    UPROPERTY()
    float32 YawFailureMax = 140.0f;
    UPROPERTY()
    float32 PitchClampUp = 45.0f;
    UPROPERTY()
    float32 PitchFailureUp = 60.0f;
    UPROPERTY()
    float32 PitchClampDown = -90.0f;
    UPROPERTY()
    float32 PitchFailureDown = -90.0f;
    UPROPERTY()
    float32 DefaultPitch = -25.0f;
    UPROPERTY()
    float32 WeightLerpSpeed = 0.05f;
    UPROPERTY()
    float32 RootTangentIntensity = 300.0f;
    UPROPERTY()
    float32 TailTangentIntensity = 300.0f;
    UPROPERTY()
    FRuntimeFloatCurve RootTangentYawOffsetCurve = FRuntimeCurveUtils::CreateConst(0.0f);
    UPROPERTY()
    FRuntimeFloatCurve RootTangentPitchOffsetCurve = FRuntimeCurveUtils::CreateConst(0.0f);
    UPROPERTY()
    FRuntimeFloatCurve TailIntensityScaleCurve = FRuntimeCurveUtils::CreateConst(1.0f);
    UPROPERTY()
    FRuntimeFloatCurve HeadPitchOffsetCurve = FRuntimeCurveUtils::CreateConst(0.0f);
    UPROPERTY()
    FRuntimeFloatCurve HeadYawOffsetCurve = FRuntimeCurveUtils::CreateConst(0.0f);
    UPROPERTY()
    FSCurveShapeConfig SCurveShape;


}

struct FAdditiveHermiteCurveConfig
{
    UPROPERTY()
    bool bApplyYaw = true;
    UPROPERTY()
    bool bApplyPitch = true;
    UPROPERTY()
    FVector NeckLocalLocation = FVector(130.0, 0.0, 400.0);
    UPROPERTY()
    FVector ClampNeckLocation = FVector(250.0, 0.0, 400.0);
    UPROPERTY()
    float32 TargetLimitX = 200.0f;
    UPROPERTY()
    float32 TargetLimitOuterRadius = 500.0f;
    UPROPERTY()
    float32 RootTangentIntensity = 300.0f;
    UPROPERTY()
    float32 TailTangentIntensity = 300.0f;
    UPROPERTY()
    FRuntimeFloatCurve RootTangentYawOffsetCurve = FRuntimeCurveUtils::CreateConst(0.0f);
    UPROPERTY()
    FRuntimeFloatCurve RootTangentPitchOffsetCurve = FRuntimeCurveUtils::CreateConst(0.0f);
    UPROPERTY()
    FRuntimeFloatCurve TailIntensityScaleCurve = FRuntimeCurveUtils::CreateConst(1.0f);
    UPROPERTY()
    FRuntimeFloatCurve HeadPitchOffsetCurve = FRuntimeCurveUtils::CreateConst(0.0f);
    UPROPERTY()
    FRuntimeFloatCurve HeadYawOffsetCurve = FRuntimeCurveUtils::CreateConst(0.0f);
    UPROPERTY()
    FRuntimeFloatCurve YawToP1LateralCurve = FRuntimeCurveUtils::CreateConst(0.0f);
    UPROPERTY()
    FRuntimeFloatCurve PitchToP1VerticalCurve = FRuntimeCurveUtils::CreateConst(0.0f);


}

struct FAimPoseBoneWeight
{
    UPROPERTY()
    FName BoneName;
    UPROPERTY()
    float32 RatioWeight = 1.0f;


}

struct FAimPoseSegmentConfig
{
    UPROPERTY()
    FName SegmentName;
    UPROPERTY()
    int SolveOrder = 0;
    UPROPERTY()
    FName ParentSegmentName;
    UPROPERTY()
    EAimPoseSolverMode SolverMode = EAimPoseSolverMode(0);
    UPROPERTY()
    TArray<FAimPoseBoneWeight> BoneChains;
    UPROPERTY()
    FString BoneChainNames;
    UPROPERTY()
    FRuntimeFloatCurve RotationRatioCurve = FRuntimeCurveUtils::CreateConst(1.0f);
    UPROPERTY()
    float32 RotationFractionPerBone = 0.5f;
    UPROPERTY()
    int ForwardAxisIndex = 0;
    UPROPERTY()
    FHermiteCurveConfig HermiteCurveConfig;
    UPROPERTY()
    FAdditiveHermiteCurveConfig AdditiveHermiteCurveConfig;
    UPROPERTY()
    TDataObjectPtr<FAnimAimPoseAllowSource> AllowSourcePreset;
    UPROPERTY()
    float32 ChannelTransitionSpeed = 5.0f;
    UPROPERTY()
    FVector AnimLocalTarget = FVector(70.0, 0.0, 100.0);
    UPROPERTY()
    bool bEnabled = true;
    UPROPERTY()
    float32 SegmentPitchMin = -15.0f;
    UPROPERTY()
    float32 SegmentPitchMax = 15.0f;
    UPROPERTY()
    float32 SegmentYawMin = -15.0f;
    UPROPERTY()
    float32 SegmentYawMax = 15.0f;
    UPROPERTY()
    EAimPoseYawOutOfRangeMode YawOutOfRangeMode = EAimPoseYawOutOfRangeMode(0);
    UPROPERTY()
    float32 HysteresisThreshold = 150.0f;
    UPROPERTY()
    float32 NeutralYaw = 0.0f;
    UPROPERTY()
    float32 ReturnThreshold = 30.0f;
    UPROPERTY()
    float32 RecoverThreshold = 15.0f;
    UPROPERTY()
    bool bEnableDamp = true;
    UPROPERTY()
    float32 SpringStrength = 100.0f;
    UPROPERTY()
    float32 SpringDamping = 0.2f;
    UPROPERTY()
    bool bEnableDebugDraw = false;


}

struct FAimPoseSegmentOverride
{
    FSubDirtyFlags32 __DirtyFlags;
    UPROPERTY()
    FName m_SegmentName;
    UPROPERTY()
    bool m_bOverrideEnabled;
    UPROPERTY()
    bool m_bEnabled;
    UPROPERTY()
    bool m_bOverrideClamp;
    UPROPERTY()
    float32 m_SegmentPitchMin;
    UPROPERTY()
    float32 m_SegmentPitchMax;
    UPROPERTY()
    float32 m_SegmentYawMin;
    UPROPERTY()
    float32 m_SegmentYawMax;
    UPROPERTY()
    bool m_bOverrideYawClampMode;
    UPROPERTY()
    EAimPoseYawOutOfRangeMode m_YawOutOfRangeMode;
    UPROPERTY()
    float32 m_HysteresisThreshold;
    UPROPERTY()
    float32 m_NeutralYaw;
    UPROPERTY()
    float32 m_ReturnThreshold;
    UPROPERTY()
    float32 m_RecoverThreshold;
    UPROPERTY()
    bool m_bOverrideDamp;
    UPROPERTY()
    bool m_bEnableDamp;
    UPROPERTY()
    float32 m_SpringStrength;
    UPROPERTY()
    float32 m_SpringDamping;
    UPROPERTY()
    bool m_bOverrideAnimLocalTarget;
    UPROPERTY()
    FVector m_AnimLocalTarget;
    UPROPERTY()
    bool m_bOverrideWeight;
    UPROPERTY()
    float32 m_Weight;

    FAimPoseSegmentOverride()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAimPoseSegmentOverride(const FAimPoseSegmentOverride &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAimPoseSegmentOverride opAssign(const FAimPoseSegmentOverride &inout Other)
    {
        FAimPoseSegmentOverride __r;
        this.SetSegmentName(Other.GetSegmentName());
        this.SetbOverrideEnabled(Other.GetbOverrideEnabled());
        this.SetbEnabled(Other.GetbEnabled());
        this.SetbOverrideClamp(Other.GetbOverrideClamp());
        this.SetSegmentPitchMin(Other.GetSegmentPitchMin());
        this.SetSegmentPitchMax(Other.GetSegmentPitchMax());
        this.SetSegmentYawMin(Other.GetSegmentYawMin());
        this.SetSegmentYawMax(Other.GetSegmentYawMax());
        this.SetbOverrideYawClampMode(Other.GetbOverrideYawClampMode());
        this.SetYawOutOfRangeMode(Other.GetYawOutOfRangeMode());
        this.SetHysteresisThreshold(Other.GetHysteresisThreshold());
        this.SetNeutralYaw(Other.GetNeutralYaw());
        this.SetReturnThreshold(Other.GetReturnThreshold());
        this.SetRecoverThreshold(Other.GetRecoverThreshold());
        this.SetbOverrideDamp(Other.GetbOverrideDamp());
        this.SetbEnableDamp(Other.GetbEnableDamp());
        this.SetSpringStrength(Other.GetSpringStrength());
        this.SetSpringDamping(Other.GetSpringDamping());
        this.SetbOverrideAnimLocalTarget(Other.GetbOverrideAnimLocalTarget());
        this.SetAnimLocalTarget(Other.GetAnimLocalTarget());
        this.SetbOverrideWeight(Other.GetbOverrideWeight());
        this.SetWeight(Other.GetWeight());
        return __r;
    }
    FName GetSegmentName() const property
    {
        return this.m_SegmentName;
    }
    void SetSegmentName(const FName &inout __Value) property
    {
        if ((this.m_SegmentName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SegmentName = __Value;
        return;
    }
    bool GetbOverrideEnabled() const property
    {
        return this.m_bOverrideEnabled;
    }
    void SetbOverrideEnabled(const bool __Value) property
    {
        if (!(this.m_bOverrideEnabled) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bOverrideEnabled = __Value;
        return;
    }
    bool GetbEnabled() const property
    {
        return this.m_bEnabled;
    }
    void SetbEnabled(const bool __Value) property
    {
        if (!(this.m_bEnabled) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bEnabled = __Value;
        return;
    }
    bool GetbOverrideClamp() const property
    {
        return this.m_bOverrideClamp;
    }
    void SetbOverrideClamp(const bool __Value) property
    {
        if (!(this.m_bOverrideClamp) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bOverrideClamp = __Value;
        return;
    }
    float32 GetSegmentPitchMin() const property
    {
        return this.m_SegmentPitchMin;
    }
    void SetSegmentPitchMin(const float32 __Value) property
    {
        if (this.m_SegmentPitchMin == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_SegmentPitchMin = __Value;
        return;
    }
    float32 GetSegmentPitchMax() const property
    {
        return this.m_SegmentPitchMax;
    }
    void SetSegmentPitchMax(const float32 __Value) property
    {
        if (this.m_SegmentPitchMax == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_SegmentPitchMax = __Value;
        return;
    }
    float32 GetSegmentYawMin() const property
    {
        return this.m_SegmentYawMin;
    }
    void SetSegmentYawMin(const float32 __Value) property
    {
        if (this.m_SegmentYawMin == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_SegmentYawMin = __Value;
        return;
    }
    float32 GetSegmentYawMax() const property
    {
        return this.m_SegmentYawMax;
    }
    void SetSegmentYawMax(const float32 __Value) property
    {
        if (this.m_SegmentYawMax == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_SegmentYawMax = __Value;
        return;
    }
    bool GetbOverrideYawClampMode() const property
    {
        return this.m_bOverrideYawClampMode;
    }
    void SetbOverrideYawClampMode(const bool __Value) property
    {
        if (!(this.m_bOverrideYawClampMode) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_bOverrideYawClampMode = __Value;
        return;
    }
    EAimPoseYawOutOfRangeMode GetYawOutOfRangeMode() const property
    {
        return this.m_YawOutOfRangeMode;
    }
    void SetYawOutOfRangeMode(const EAimPoseYawOutOfRangeMode __Value) property
    {
        if (int(this.m_YawOutOfRangeMode) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_YawOutOfRangeMode = __Value;
        return;
    }
    float32 GetHysteresisThreshold() const property
    {
        return this.m_HysteresisThreshold;
    }
    void SetHysteresisThreshold(const float32 __Value) property
    {
        if (this.m_HysteresisThreshold == __Value)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_HysteresisThreshold = __Value;
        return;
    }
    float32 GetNeutralYaw() const property
    {
        return this.m_NeutralYaw;
    }
    void SetNeutralYaw(const float32 __Value) property
    {
        if (this.m_NeutralYaw == __Value)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_NeutralYaw = __Value;
        return;
    }
    float32 GetReturnThreshold() const property
    {
        return this.m_ReturnThreshold;
    }
    void SetReturnThreshold(const float32 __Value) property
    {
        if (this.m_ReturnThreshold == __Value)
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_ReturnThreshold = __Value;
        return;
    }
    float32 GetRecoverThreshold() const property
    {
        return this.m_RecoverThreshold;
    }
    void SetRecoverThreshold(const float32 __Value) property
    {
        if (this.m_RecoverThreshold == __Value)
        {
            return;
        }
        this.__MarkDirty(13);
        this.m_RecoverThreshold = __Value;
        return;
    }
    bool GetbOverrideDamp() const property
    {
        return this.m_bOverrideDamp;
    }
    void SetbOverrideDamp(const bool __Value) property
    {
        if (!(this.m_bOverrideDamp) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_bOverrideDamp = __Value;
        return;
    }
    bool GetbEnableDamp() const property
    {
        return this.m_bEnableDamp;
    }
    void SetbEnableDamp(const bool __Value) property
    {
        if (!(this.m_bEnableDamp) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(15);
        this.m_bEnableDamp = __Value;
        return;
    }
    float32 GetSpringStrength() const property
    {
        return this.m_SpringStrength;
    }
    void SetSpringStrength(const float32 __Value) property
    {
        if (this.m_SpringStrength == __Value)
        {
            return;
        }
        this.__MarkDirty(16);
        this.m_SpringStrength = __Value;
        return;
    }
    float32 GetSpringDamping() const property
    {
        return this.m_SpringDamping;
    }
    void SetSpringDamping(const float32 __Value) property
    {
        if (this.m_SpringDamping == __Value)
        {
            return;
        }
        this.__MarkDirty(17);
        this.m_SpringDamping = __Value;
        return;
    }
    bool GetbOverrideAnimLocalTarget() const property
    {
        return this.m_bOverrideAnimLocalTarget;
    }
    void SetbOverrideAnimLocalTarget(const bool __Value) property
    {
        if (!(this.m_bOverrideAnimLocalTarget) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(18);
        this.m_bOverrideAnimLocalTarget = __Value;
        return;
    }
    const FVector GetAnimLocalTarget() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_AnimLocalTarget() property
    {
        FVector __r;
        this.__MarkDirty(19);
        return __r;
    }
    void SetAnimLocalTarget(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(19);
        this.m_AnimLocalTarget = __Value;
        return;
    }
    bool GetbOverrideWeight() const property
    {
        return this.m_bOverrideWeight;
    }
    void SetbOverrideWeight(const bool __Value) property
    {
        if (!(this.m_bOverrideWeight) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(20);
        this.m_bOverrideWeight = __Value;
        return;
    }
    float32 GetWeight() const property
    {
        return this.m_Weight;
    }
    void SetWeight(const float32 __Value) property
    {
        if (this.m_Weight == __Value)
        {
            return;
        }
        this.__MarkDirty(21);
        this.m_Weight = __Value;
        return;
    }
}

namespace AutoDelta
{
FSubDirtyFlags32 GetDirtyFlags(FAimPoseSegmentOverride &inout Data)
{
    FSubDirtyFlags32 __r;
    return __r;
}
void ClearDirtyFlags(FAimPoseSegmentOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAimPoseSegmentOverride
{
int __IndexOf_SegmentName()
{
    return 0;
}
int __IndexOf_bOverrideEnabled()
{
    return 1;
}
int __IndexOf_bEnabled()
{
    return 2;
}
int __IndexOf_bOverrideClamp()
{
    return 3;
}
int __IndexOf_SegmentPitchMin()
{
    return 4;
}
int __IndexOf_SegmentPitchMax()
{
    return 5;
}
int __IndexOf_SegmentYawMin()
{
    return 6;
}
int __IndexOf_SegmentYawMax()
{
    return 7;
}
int __IndexOf_bOverrideYawClampMode()
{
    return 8;
}
int __IndexOf_YawOutOfRangeMode()
{
    return 9;
}
int __IndexOf_HysteresisThreshold()
{
    return 10;
}
int __IndexOf_NeutralYaw()
{
    return 11;
}
int __IndexOf_ReturnThreshold()
{
    return 12;
}
int __IndexOf_RecoverThreshold()
{
    return 13;
}
int __IndexOf_bOverrideDamp()
{
    return 14;
}
int __IndexOf_bEnableDamp()
{
    return 15;
}
int __IndexOf_SpringStrength()
{
    return 16;
}
int __IndexOf_SpringDamping()
{
    return 17;
}
int __IndexOf_bOverrideAnimLocalTarget()
{
    return 18;
}
int __IndexOf_AnimLocalTarget()
{
    return 19;
}
int __IndexOf_bOverrideWeight()
{
    return 20;
}
int __IndexOf_Weight()
{
    return 21;
}
}
