
namespace __INTENRAL_FC_AnimParamDynamicAdditiveConfig_NS
{
    const TECSComponentDerivedPtr<FC_AnimParamDynamicAdditiveConfig> DerivedPtr = TECSComponentDerivedPtr<FC_AnimParamDynamicAdditiveConfig>();
    const FC_AnimParamDynamicAdditiveConfig DefaultValue = FC_AnimParamDynamicAdditiveConfig();
}
namespace __INTENRAL_FC_AnimParamDynamicAdditive_NS
{
    const TECSComponentDerivedPtr<FC_AnimParamDynamicAdditive> DerivedPtr = TECSComponentDerivedPtr<FC_AnimParamDynamicAdditive>();
    const FC_AnimParamDynamicAdditive DefaultValue = FC_AnimParamDynamicAdditive();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimParamDynamicAdditiveConfigRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimParamDynamicAdditiveRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_AnimParamDynamicAdditiveConfig : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FAnimDynamicAdditiveConfig> m_ConfigPtr;

    FC_AnimParamDynamicAdditiveConfig()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_AnimParamDynamicAdditiveConfig(const FC_AnimParamDynamicAdditiveConfig &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_ConfigPtr = Other.m_ConfigPtr;
        return;
    }
    FC_AnimParamDynamicAdditiveConfig opAssign(const FC_AnimParamDynamicAdditiveConfig &inout Other)
    {
        FC_AnimParamDynamicAdditiveConfig __r;
        this.SetConfigPtr(Other.GetConfigPtr());
        return __r;
    }
    const TDataObjectPtr<FAnimDynamicAdditiveConfig> GetConfigPtr() const property
    {
        const TDataObjectPtr<FAnimDynamicAdditiveConfig> __r;
        return __r;
    }
    TDataObjectPtr<FAnimDynamicAdditiveConfig> GetModify_ConfigPtr() property
    {
        TDataObjectPtr<FAnimDynamicAdditiveConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetConfigPtr(const TDataObjectPtr<FAnimDynamicAdditiveConfig> &inout __Value) property
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

struct FC_AnimParamDynamicAdditive : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    UAnimSequence m_TargetSequenceAsset;
    UPROPERTY()
    UAnimSequence m_SourceSequenceAsset;
    UPROPERTY()
    TMap<FName, float32> m_StateWeights;

    FC_AnimParamDynamicAdditive()
    {
        this.m_TargetSequenceAsset = nullptr;
        this.m_SourceSequenceAsset = nullptr;
        this.__InitDirtyFlags();
        return;
    }
    FC_AnimParamDynamicAdditive(const FC_AnimParamDynamicAdditive &inout Other)
    {
        this.m_TargetSequenceAsset = nullptr;
        this.m_SourceSequenceAsset = nullptr;
        this.__InitDirtyFlags();
        this.m_TargetSequenceAsset = Other.m_TargetSequenceAsset;
        this.m_SourceSequenceAsset = Other.m_SourceSequenceAsset;
        this.m_StateWeights = Other.m_StateWeights;
        return;
    }
    FC_AnimParamDynamicAdditive opAssign(const FC_AnimParamDynamicAdditive &inout Other)
    {
        FC_AnimParamDynamicAdditive __r;
        this.SetTargetSequenceAsset(Other.GetTargetSequenceAsset());
        this.SetSourceSequenceAsset(Other.GetSourceSequenceAsset());
        this.SetStateWeights(Other.GetStateWeights());
        return __r;
    }
    float32 GetWeightByState(const FName &inout InAnimKey) const
    {
        float32 local_23 = 0.0f;
        for (auto& local_20 : this.GetStateWeights())
        {
            if ((FName(local_20.GetKey()) == InAnimKey))
            {
                return local_23;
            }
        }
        return 0.0f;
    }
    void SetWeight(const FName &inout InAnimKey, const float32 InWeight)
    {
        TMap<FName, float32> local_20 = this.GetStateWeights();
        local_20.Add(InAnimKey, InWeight);
        this.SetStateWeights(local_20);
        return;
    }
    void KeepOnly(const FName &inout InAnimKey)
    {
        TMap<FName, float32> local_20;
        for (auto& local_40 : this.GetStateWeights())
        {
            if ((FName(local_40.GetKey()) == InAnimKey))
            {
                local_20.Add(InAnimKey);
                break;
            }
        }
        this.SetStateWeights(local_20);
        return;
    }
    UAnimSequence GetTargetSequenceAsset() const property
    {
        return this.m_TargetSequenceAsset;
    }
    void SetTargetSequenceAsset(const UAnimSequence __Value) property
    {
        return;
    }
    UAnimSequence GetSourceSequenceAsset() const property
    {
        return this.m_SourceSequenceAsset;
    }
    void SetSourceSequenceAsset(const UAnimSequence __Value) property
    {
        return;
    }
    const TMap<FName, float32> GetStateWeights() const property
    {
        const TMap<FName, float32> __r;
        return __r;
    }
    TMap<FName, float32> GetModify_StateWeights() property
    {
        TMap<FName, float32> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetStateWeights(const TMap<FName, float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_StateWeights = __Value;
        return;
    }
}

class UESMAction_AnimDynamicAdditive : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FRuntimeFloatCurve Weight = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    FName AnimLayer = n"MainLayer";
    UPROPERTY()
    float32 CleanupAfterStateTime = 0.2f;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        FName local_10 = this.ResolveAnimKey(Context);
        if ((!((local_10 == NAME_None))))
        {
            local_6.SetWeight(local_10, this.Weight.GetFloatValue(0.0f, 0.0f));
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_AnimParamDynamicAdditive& local_6 = local_4.opCall();
        if (local_6)
        {
            FName local_11 = this.ResolveAnimKey(Context);
            if ((local_11 == NAME_None))
            {
                return;
            }
            local_6.SetWeight(local_11, this.Weight.GetFloatValue(float32(Time.StateTime.ToSeconds()), 0.0f));
            if (float32(Time.StateTime.ToSeconds()) >= this.CleanupAfterStateTime)
            {
                local_6.KeepOnly(local_11);
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        return;
    }
    FName ResolveAnimKey(const FESMContext &inout Context) const
    {
        const FESMAnimState& local_12;
        Get local_4;
        const FC_AnimState& local_6 = local_4.opCall();
        if (local_6)
        {
            int local_8 = 0;
            for (; local_8 < local_6.GetLayerNum(); ++local_8)
            {
                if ((local_12.GetLayer() == this.AnimLayer))
                {
                    FName local_18 = (!((local_12.GetOverrideAnimKey() == NAME_None))) ? local_12.GetOverrideAnimKey() : local_12.GetTransitionToAnimKey();
                    return local_18;
                }
            }
        }
        return NAME_None;
    }
}

namespace FC_AnimParamDynamicAdditiveConfig
{
FC_AnimParamDynamicAdditiveConfig Interpolate(const FC_AnimParamDynamicAdditiveConfig &inout A, const FC_AnimParamDynamicAdditiveConfig &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimParamDynamicAdditiveConfig local_26;
    local_26.SetConfigPtr(B.GetConfigPtr());
    return local_26;
}
}
namespace FC_AnimParamDynamicAdditive
{
FC_AnimParamDynamicAdditive Interpolate(const FC_AnimParamDynamicAdditive &inout A, const FC_AnimParamDynamicAdditive &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimParamDynamicAdditive local_26;
    float32 local_69 = 0.0f;
    local_26.SetTargetSequenceAsset(B.GetTargetSequenceAsset());
    local_26.SetSourceSequenceAsset(B.GetSourceSequenceAsset());
    TMap<FName, float32> local_48;
    for (auto& local_68 : B.GetStateWeights())
    {
        float32 local_70 = A.GetWeightByState(local_68.GetKey());
        local_69 = local_69 - local_70;
        if (FMath::Abs(local_69) > 0.9f)
        {
            local_48.Add(local_68.GetKey());
            continue;
        }
        local_48.Add(local_68.GetKey(), FMath::Lerp(local_70, T));
    }
    local_26.SetStateWeights(local_48);
    return local_26;
}
}
namespace ECSFunc_FC_AnimParamDynamicAdditiveConfig
{
UFUNCTION()
bool HasAnimParamDynamicAdditiveConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveConfig);
}
FC_AnimParamDynamicAdditiveConfig& AssignAnimParamDynamicAdditiveConfig(const FECSEntity &inout Entity, const FC_AnimParamDynamicAdditiveConfig &inout DefaultValue = FC_AnimParamDynamicAdditiveConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimParamDynamicAdditiveConfig_BP(const FECSEntity &inout Entity, const FC_AnimParamDynamicAdditiveConfig &inout DefaultValue = FC_AnimParamDynamicAdditiveConfig())
{
    ECSFunc_FC_AnimParamDynamicAdditiveConfig::AssignAnimParamDynamicAdditiveConfig(Entity, DefaultValue);
    return;
}
FC_AnimParamDynamicAdditiveConfig& ModifyAnimParamDynamicAdditiveConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveConfig));
    return local_12.GetComp();
}
FC_AnimParamDynamicAdditiveConfig& ModifyOrAddAnimParamDynamicAdditiveConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveConfig));
    return local_12.GetComp();
}
const FC_AnimParamDynamicAdditiveConfig& GetAnimParamDynamicAdditiveConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimParamDynamicAdditiveConfig GetAnimParamDynamicAdditiveConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimParamDynamicAdditiveConfig& local_4 = ECSFunc_FC_AnimParamDynamicAdditiveConfig::GetAnimParamDynamicAdditiveConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimParamDynamicAdditiveConfig();
}
const FC_AnimParamDynamicAdditiveConfig GetDefaultedAnimParamDynamicAdditiveConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimParamDynamicAdditiveConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveConfig);
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
FC_AnimParamDynamicAdditiveConfig GetDefaultedAnimParamDynamicAdditiveConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimParamDynamicAdditiveConfig::GetDefaultedAnimParamDynamicAdditiveConfig(Entity);
}
UFUNCTION()
bool RemoveAnimParamDynamicAdditiveConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveConfig);
}
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimParamDynamicAdditiveConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimParamDynamicAdditiveConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimParamDynamicAdditiveConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimParamDynamicAdditiveConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimParamDynamicAdditiveConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimParamDynamicAdditiveConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimParamDynamicAdditiveConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamDynamicAdditiveConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimParamDynamicAdditiveConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamDynamicAdditiveConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimParamDynamicAdditiveConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AnimParamDynamicAdditive
{
UFUNCTION()
bool HasAnimParamDynamicAdditive(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditive);
}
FC_AnimParamDynamicAdditive& AssignAnimParamDynamicAdditive(const FECSEntity &inout Entity, const FC_AnimParamDynamicAdditive &inout DefaultValue = FC_AnimParamDynamicAdditive())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditive, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimParamDynamicAdditive_BP(const FECSEntity &inout Entity, const FC_AnimParamDynamicAdditive &inout DefaultValue = FC_AnimParamDynamicAdditive())
{
    ECSFunc_FC_AnimParamDynamicAdditive::AssignAnimParamDynamicAdditive(Entity, DefaultValue);
    return;
}
FC_AnimParamDynamicAdditive& ModifyAnimParamDynamicAdditive(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditive));
    return local_12.GetComp();
}
FC_AnimParamDynamicAdditive& ModifyOrAddAnimParamDynamicAdditive(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditive));
    return local_12.GetComp();
}
const FC_AnimParamDynamicAdditive& GetAnimParamDynamicAdditive(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditive));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimParamDynamicAdditive GetAnimParamDynamicAdditive_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimParamDynamicAdditive& local_4 = ECSFunc_FC_AnimParamDynamicAdditive::GetAnimParamDynamicAdditive(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimParamDynamicAdditive();
}
const FC_AnimParamDynamicAdditive GetDefaultedAnimParamDynamicAdditive(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimParamDynamicAdditive __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditive);
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
FC_AnimParamDynamicAdditive GetDefaultedAnimParamDynamicAdditive_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimParamDynamicAdditive::GetDefaultedAnimParamDynamicAdditive(Entity);
}
UFUNCTION()
bool RemoveAnimParamDynamicAdditive(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditive);
}
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimParamDynamicAdditive, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimParamDynamicAdditive, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimParamDynamicAdditive, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimParamDynamicAdditive, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimParamDynamicAdditive, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimParamDynamicAdditiveLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimParamDynamicAdditive, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamDynamicAdditiveActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimParamDynamicAdditive, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamDynamicAdditiveModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimParamDynamicAdditive, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimParamDynamicAdditiveConfig &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimParamDynamicAdditiveConfig &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimParamDynamicAdditiveConfig &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimParamDynamicAdditiveConfig
{
int __IndexOf_ConfigPtr()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimParamDynamicAdditive &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimParamDynamicAdditive &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimParamDynamicAdditive &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimParamDynamicAdditive
{
int __IndexOf_StateWeights()
{
    return 0;
}
}
