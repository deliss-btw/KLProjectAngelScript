
namespace __INTENRAL_FC_AimPoseConfig_NS
{
    const TECSComponentDerivedPtr<FC_AimPoseConfig> DerivedPtr = TECSComponentDerivedPtr<FC_AimPoseConfig>();
    const FC_AimPoseConfig DefaultValue = FC_AimPoseConfig();
}
namespace __INTENRAL_FC_AnimAimPoseOutput_NS
{
    const TECSComponentDerivedPtr<FC_AnimAimPoseOutput> DerivedPtr = TECSComponentDerivedPtr<FC_AnimAimPoseOutput>();
    const FC_AnimAimPoseOutput DefaultValue = FC_AnimAimPoseOutput();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AimPoseConfigRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimAimPoseOutputRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FAimPoseLandingDipConfig
{
    UPROPERTY()
    bool bEnabled = false;
    UPROPERTY()
    float32 DipPitchDegrees = 5.0f;
    UPROPERTY()
    float32 RiseTime = 0.05f;
    UPROPERTY()
    float32 RecoveryTime = 0.3f;


}

struct FC_AimPoseConfig : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FAnimAimPoseConfig> m_ConfigPtr;

    FC_AimPoseConfig()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_AimPoseConfig(const FC_AimPoseConfig &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_ConfigPtr = Other.m_ConfigPtr;
        return;
    }
    FC_AimPoseConfig opAssign(const FC_AimPoseConfig &inout Other)
    {
        FC_AimPoseConfig __r;
        this.SetConfigPtr(Other.GetConfigPtr());
        return __r;
    }
    FVector GetLookTargetCS() const
    {
        TArray<FAimPoseSegmentConfig> local_4;
        if (!(this.GetConfigPtr()))
        {
            return FVector::ZeroVector;
        }
        if (local_4.Num() == 0)
        {
            return FVector::ZeroVector;
        }
        for (auto& local_20 : local_4)
        {
            if (local_20.SegmentName.ToString().ToLower().Contains("head", ESearchCase(1), ESearchDir(0)))
            {
                return local_20.AnimLocalTarget;
            }
        }
        return FVector::ZeroVector;
    }
    bool IsValid() const
    {
        return this.GetConfigPtr().IsSet();
    }
    bool HasValidLookTargetCS() const
    {
        return this.IsValid() && !(this.GetLookTargetCS().IsNearlyZero(9.999999747378752e-5));
    }
    const TDataObjectPtr<FAnimAimPoseConfig> GetConfigPtr() const property
    {
        const TDataObjectPtr<FAnimAimPoseConfig> __r;
        return __r;
    }
    TDataObjectPtr<FAnimAimPoseConfig> GetModify_ConfigPtr() property
    {
        TDataObjectPtr<FAnimAimPoseConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetConfigPtr(const TDataObjectPtr<FAnimAimPoseConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ConfigPtr = __Value;
        return;
    }
}

struct FC_AnimAimPoseOutput : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_Weight;
    UPROPERTY()
    float32 m_TargetWeight;
    UPROPERTY()
    float32 m_WeightLerpSpeed;
    UPROPERTY()
    float32 m_TargetLerpSpeed;
    UPROPERTY()
    TSet<EAnimLookSource> m_AllowSourceOverride;
    UPROPERTY()
    TArray<FAimPoseSegmentOverride> m_SegmentOverrides;
    UPROPERTY()
    TArray<FAimPoseCompensatorOverride> m_CompensatorOverrides;

    FC_AnimAimPoseOutput()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimAimPoseOutput(const FC_AnimAimPoseOutput &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimAimPoseOutput opAssign(const FC_AnimAimPoseOutput &inout Other)
    {
        FC_AnimAimPoseOutput __r;
        this.SetWeight(Other.GetWeight());
        this.SetTargetWeight(Other.GetTargetWeight());
        this.SetWeightLerpSpeed(Other.GetWeightLerpSpeed());
        this.SetTargetLerpSpeed(Other.GetTargetLerpSpeed());
        this.SetAllowSourceOverride(Other.GetAllowSourceOverride());
        this.SetSegmentOverrides(Other.GetSegmentOverrides());
        this.SetCompensatorOverrides(Other.GetCompensatorOverrides());
        return __r;
    }
    void Reset(const bool bResetLerpSpeed = false)
    {
        this.SetTargetWeight(0.0f);
        if (bResetLerpSpeed)
        {
            this.SetWeightLerpSpeed(5.0f);
            this.SetTargetLerpSpeed(5.0f);
        }
        this.SetSegmentOverrides(TArray<FAimPoseSegmentOverride>());
        this.SetCompensatorOverrides(TArray<FAimPoseCompensatorOverride>());
        this.SetAllowSourceOverride(TSet<EAnimLookSource>());
        return;
    }
    bool HasWeight() const
    {
        return !(FMath::IsNearlyZero(this.GetWeight(), 1e-8f)) || !(FMath::IsNearlyZero(this.GetTargetWeight(), 1e-8f));
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
        this.__MarkDirty(0);
        this.m_Weight = __Value;
        return;
    }
    float32 GetTargetWeight() const property
    {
        return this.m_TargetWeight;
    }
    void SetTargetWeight(const float32 __Value) property
    {
        if (this.m_TargetWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TargetWeight = __Value;
        return;
    }
    float32 GetWeightLerpSpeed() const property
    {
        return this.m_WeightLerpSpeed;
    }
    void SetWeightLerpSpeed(const float32 __Value) property
    {
        if (this.m_WeightLerpSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_WeightLerpSpeed = __Value;
        return;
    }
    float32 GetTargetLerpSpeed() const property
    {
        return this.m_TargetLerpSpeed;
    }
    void SetTargetLerpSpeed(const float32 __Value) property
    {
        if (this.m_TargetLerpSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_TargetLerpSpeed = __Value;
        return;
    }
    const TSet<EAnimLookSource> GetAllowSourceOverride() const property
    {
        const TSet<EAnimLookSource> __r;
        return __r;
    }
    TSet<EAnimLookSource> GetModify_AllowSourceOverride() property
    {
        TSet<EAnimLookSource> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetAllowSourceOverride(const TSet<EAnimLookSource> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_AllowSourceOverride = __Value;
        return;
    }
    const TArray<FAimPoseSegmentOverride> GetSegmentOverrides() const property
    {
        const TArray<FAimPoseSegmentOverride> __r;
        return __r;
    }
    TArray<FAimPoseSegmentOverride> GetModify_SegmentOverrides() property
    {
        TArray<FAimPoseSegmentOverride> __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetSegmentOverrides(const TArray<FAimPoseSegmentOverride> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_SegmentOverrides = __Value;
        return;
    }
    const TArray<FAimPoseCompensatorOverride> GetCompensatorOverrides() const property
    {
        const TArray<FAimPoseCompensatorOverride> __r;
        return __r;
    }
    TArray<FAimPoseCompensatorOverride> GetModify_CompensatorOverrides() property
    {
        TArray<FAimPoseCompensatorOverride> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetCompensatorOverrides(const TArray<FAimPoseCompensatorOverride> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_CompensatorOverrides = __Value;
        return;
    }
}

struct FAimPoseProcessorWeightCurve
{
    UPROPERTY()
    FName ProcessorName;
    UPROPERTY()
    FRuntimeFloatCurve WeightCurve = FRuntimeCurveUtils::CreateConst(0.0f);

    FAimPoseProcessorWeightCurve()
    {
        return;
    }
}

class UESMAction_AimPose : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool bSetEnterWeightLerpSpeed = true;
    UPROPERTY()
    float32 WeightLerpSpeed = 5.0f;
    UPROPERTY()
    float32 TargetLerpSpeed = 5.0f;
    UPROPERTY()
    bool bResetLerpSpeed = false;
    UPROPERTY()
    float32 ExitWeightLerpSpeed = 5.0f;
    UPROPERTY()
    bool bOverrideWeight = true;
    UPROPERTY()
    FRuntimeFloatCurve BaseWeightCurve = FRuntimeCurveUtils::CreateConst(1.0f);
    UPROPERTY()
    TSet<EAnimLookSource> AllowSourceOverride;
    UPROPERTY()
    bool bOverrideSegmentWeight = false;
    UPROPERTY()
    TArray<FAimPoseProcessorWeightCurve> SegmentWeightCurves;
    UPROPERTY()
    bool bOverrideCompensatorWeight = false;
    UPROPERTY()
    TArray<FAimPoseProcessorWeightCurve> CompensatorWeightCurves;
    UPROPERTY()
    TArray<FAimPoseSegmentOverride> SegmentOverrides;
    UPROPERTY()
    TArray<FAimPoseCompensatorOverride> CompensatorOverrides;


    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(6);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_10 = 0;
        float32 local_31;
        float32 local_32;
        ModifyOrAdd local_4;
        local_4.opCall();
        TArray<FAimPoseSegmentOverride> local_14 = this.SegmentOverrides;
        if (this.bOverrideSegmentWeight)
        {
            for (auto& local_30 : this.SegmentWeightCurves)
            {
                ::FC_AnimAimPoseOutput::EnsureSegmentWeightOverride(local_14, local_30.ProcessorName, local_30.WeightCurve.GetFloatValue(0.0f, 0.0f));
            }
        }
        local_10.SetSegmentOverrides(local_14);
        TArray<FAimPoseCompensatorOverride> local_38 = this.CompensatorOverrides;
        if (this.bOverrideCompensatorWeight)
        {
            for (auto& local_30 : this.CompensatorWeightCurves)
            {
                ::FC_AnimAimPoseOutput::EnsureCompensatorWeightOverride(local_38, local_30.ProcessorName, local_30.WeightCurve.GetFloatValue(0.0f, 0.0f));
            }
        }
        local_10.SetCompensatorOverrides(local_38);
        if (this.bSetEnterWeightLerpSpeed)
        {
            if (this.WeightLerpSpeed > 0.0f)
            {
                local_32 = this.WeightLerpSpeed;
            }
            else
            {
                local_32 = 0.0f;
            }
            local_10.SetWeightLerpSpeed(local_32);
            if (this.TargetLerpSpeed > 0.0f)
            {
                local_31 = this.TargetLerpSpeed;
            }
            else
            {
                local_31 = 0.0f;
            }
            local_10.SetTargetLerpSpeed(local_31);
        }
        if (this.bOverrideWeight)
        {
            local_10.SetTargetWeight(this.BaseWeightCurve.GetFloatValue(0.0f, 0.0f));
        }
        local_10.SetAllowSourceOverride(this.AllowSourceOverride);
        this.ApplyWeightCurveOverrides(0.0f, local_10);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_14 = 0;
        if ((!(this.bOverrideWeight) && !(this.bOverrideSegmentWeight) && !(this.bOverrideCompensatorWeight)))
        {
            return;
        }
        float local_6 = Time.ActionDuration.ToSeconds();
        if (local_6 <= 0.0)
        {
            return;
        }
        float32 local_8 = float32((Time.ActionLastTime.ToSeconds() / local_6));
        if (this.bOverrideWeight)
        {
            local_14.SetTargetWeight(this.BaseWeightCurve.GetFloatValue(local_8, 0.0f));
        }
        this.ApplyWeightCurveOverrides(local_8, local_14);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_AnimAimPoseOutput& local_6 = local_4.opCall();
        if (local_6)
        {
            if ((!(this.bResetLerpSpeed) && (this.ExitWeightLerpSpeed > 0.0f)))
            {
                local_6.SetWeightLerpSpeed(this.ExitWeightLerpSpeed);
            }
            local_6.Reset(this.bResetLerpSpeed);
        }
        return;
    }
    void ApplyWeightCurveOverrides(const float32 T, FC_AnimAimPoseOutput &inout Output) const
    {
        if (this.bOverrideSegmentWeight)
        {
            TArray<FAimPoseSegmentOverride> local_6 = Output.GetSegmentOverrides();
            for (auto& local_20 : this.SegmentWeightCurves)
            {
                float32 local_23 = local_20.WeightCurve.GetFloatValue(T, 0.0f);
                int local_24 = 0;
                for (; local_24 < local_6.Num(); ++local_24)
                {
                    if ((local_6[local_24].GetSegmentName() == local_20.ProcessorName))
                    {
                        local_6[local_24].SetbOverrideWeight(true);
                        local_6[local_24].SetWeight(local_23);
                        break;
                    }
                }
            }
            Output.SetSegmentOverrides(local_6);
        }
        if (this.bOverrideCompensatorWeight)
        {
            TArray<FAimPoseCompensatorOverride> local_32 = Output.GetCompensatorOverrides();
            for (auto& local_20 : this.CompensatorWeightCurves)
            {
                float32 local_21 = local_20.WeightCurve.GetFloatValue(T, 0.0f);
                int local_24_2 = 0;
                for (; local_24_2 < local_32.Num(); ++local_24_2)
                {
                    if ((local_32[local_24_2].GetName() == local_20.ProcessorName))
                    {
                        local_32[local_24_2].SetbOverrideWeight(true);
                        local_32[local_24_2].SetWeight(local_21);
                        break;
                    }
                }
            }
            Output.SetCompensatorOverrides(local_32);
        }
        return;
    }
}

namespace FC_AimPoseConfig
{
FC_AimPoseConfig Interpolate(const FC_AimPoseConfig &inout A, const FC_AimPoseConfig &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AimPoseConfig local_26;
    local_26.SetConfigPtr(B.GetConfigPtr());
    return local_26;
}
}
namespace FC_AnimAimPoseOutput
{
FC_AnimAimPoseOutput Interpolate(const FC_AnimAimPoseOutput &inout A, const FC_AnimAimPoseOutput &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimAimPoseOutput local_34;
    local_34.SetWeight(FMath::Lerp(A.GetWeight(), B.GetWeight(), T));
    local_34.SetTargetWeight(FMath::Lerp(A.GetTargetWeight(), B.GetTargetWeight(), T));
    local_34.SetSegmentOverrides(B.GetSegmentOverrides());
    local_34.SetCompensatorOverrides(B.GetCompensatorOverrides());
    local_34.SetAllowSourceOverride(B.GetAllowSourceOverride());
    return local_34;
}
void EnsureSegmentWeightOverride(TArray<FAimPoseSegmentOverride> &inout Arr, const FName &inout InName, const float32 InitWeight)
{
    int local_1 = 0;
    for (; local_1 < Arr.Num(); ++local_1)
    {
        if ((Arr[local_1].GetSegmentName() == InName))
        {
            Arr[local_1].SetbOverrideWeight(true);
            Arr[local_1].SetWeight(InitWeight);
            return;
        }
    }
    FAimPoseSegmentOverride local_32;
    local_32.SetSegmentName(InName);
    local_32.SetbOverrideWeight(true);
    local_32.SetWeight(InitWeight);
    Arr.Add(local_32);
    return;
}
void EnsureCompensatorWeightOverride(TArray<FAimPoseCompensatorOverride> &inout Arr, const FName &inout InName, const float32 InitWeight)
{
    int local_1 = 0;
    for (; local_1 < Arr.Num(); ++local_1)
    {
        if ((Arr[local_1].GetName() == InName))
        {
            Arr[local_1].SetbOverrideWeight(true);
            Arr[local_1].SetWeight(InitWeight);
            return;
        }
    }
    FAimPoseCompensatorOverride local_12;
    local_12.SetName(InName);
    local_12.SetbOverrideWeight(true);
    local_12.SetWeight(InitWeight);
    Arr.Add(local_12);
    return;
}
}
namespace ECSFunc_FC_AimPoseConfig
{
UFUNCTION()
bool HasAimPoseConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AimPoseConfig);
}
FC_AimPoseConfig& AssignAimPoseConfig(const FECSEntity &inout Entity, const FC_AimPoseConfig &inout DefaultValue = FC_AimPoseConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AimPoseConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAimPoseConfig_BP(const FECSEntity &inout Entity, const FC_AimPoseConfig &inout DefaultValue = FC_AimPoseConfig())
{
    ECSFunc_FC_AimPoseConfig::AssignAimPoseConfig(Entity, DefaultValue);
    return;
}
FC_AimPoseConfig& ModifyAimPoseConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AimPoseConfig));
    return local_12.GetComp();
}
FC_AimPoseConfig& ModifyOrAddAimPoseConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AimPoseConfig));
    return local_12.GetComp();
}
const FC_AimPoseConfig& GetAimPoseConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AimPoseConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_AimPoseConfig GetAimPoseConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AimPoseConfig& local_4 = ECSFunc_FC_AimPoseConfig::GetAimPoseConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AimPoseConfig();
}
const FC_AimPoseConfig GetDefaultedAimPoseConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AimPoseConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AimPoseConfig);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AimPoseConfig GetDefaultedAimPoseConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AimPoseConfig::GetDefaultedAimPoseConfig(Entity);
}
UFUNCTION()
bool RemoveAimPoseConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AimPoseConfig);
}
}
FECSMonitorRuntimeView __GetMonitorAimPoseConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AimPoseConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimPoseConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AimPoseConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimPoseConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AimPoseConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimPoseConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AimPoseConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimPoseConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AimPoseConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorAimPoseConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AimPoseConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAimPoseConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AimPoseConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAimPoseConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AimPoseConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AnimAimPoseOutput
{
UFUNCTION()
bool HasAnimAimPoseOutput(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimAimPoseOutput);
}
FC_AnimAimPoseOutput& AssignAnimAimPoseOutput(const FECSEntity &inout Entity, const FC_AnimAimPoseOutput &inout DefaultValue = FC_AnimAimPoseOutput())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimAimPoseOutput, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimAimPoseOutput_BP(const FECSEntity &inout Entity, const FC_AnimAimPoseOutput &inout DefaultValue = FC_AnimAimPoseOutput())
{
    ECSFunc_FC_AnimAimPoseOutput::AssignAnimAimPoseOutput(Entity, DefaultValue);
    return;
}
FC_AnimAimPoseOutput& ModifyAnimAimPoseOutput(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimAimPoseOutput));
    return local_12.GetComp();
}
FC_AnimAimPoseOutput& ModifyOrAddAnimAimPoseOutput(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimAimPoseOutput));
    return local_12.GetComp();
}
const FC_AnimAimPoseOutput& GetAnimAimPoseOutput(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimAimPoseOutput));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimAimPoseOutput GetAnimAimPoseOutput_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimAimPoseOutput& local_4 = ECSFunc_FC_AnimAimPoseOutput::GetAnimAimPoseOutput(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimAimPoseOutput();
}
const FC_AnimAimPoseOutput GetDefaultedAnimAimPoseOutput(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimAimPoseOutput __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimAimPoseOutput);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AnimAimPoseOutput GetDefaultedAnimAimPoseOutput_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimAimPoseOutput::GetDefaultedAnimAimPoseOutput(Entity);
}
UFUNCTION()
bool RemoveAnimAimPoseOutput(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimAimPoseOutput);
}
}
FECSMonitorRuntimeView __GetMonitorAnimAimPoseOutputOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimAimPoseOutput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimPoseOutputOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimAimPoseOutput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimPoseOutputOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimAimPoseOutput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimPoseOutputOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimAimPoseOutput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimPoseOutputOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimAimPoseOutput, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimAimPoseOutputLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimAimPoseOutput, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimAimPoseOutputActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimAimPoseOutput, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimAimPoseOutputModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimAimPoseOutput, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AimPoseConfig &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AimPoseConfig &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AimPoseConfig &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AimPoseConfig
{
int __IndexOf_ConfigPtr()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimAimPoseOutput &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimAimPoseOutput &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimAimPoseOutput &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimAimPoseOutput
{
int __IndexOf_Weight()
{
    return 0;
}
int __IndexOf_TargetWeight()
{
    return 1;
}
int __IndexOf_WeightLerpSpeed()
{
    return 2;
}
int __IndexOf_TargetLerpSpeed()
{
    return 3;
}
int __IndexOf_AllowSourceOverride()
{
    return 4;
}
int __IndexOf_SegmentOverrides()
{
    return 5;
}
int __IndexOf_CompensatorOverrides()
{
    return 6;
}
}
