
namespace __INTENRAL_FC_AnimLeanParams_NS
{
    const TECSComponentDerivedPtr<FC_AnimLeanParams> DerivedPtr = TECSComponentDerivedPtr<FC_AnimLeanParams>();
    const FC_AnimLeanParams DefaultValue = FC_AnimLeanParams();
}
namespace __INTENRAL_FC_AnimLeanRelatedParamSmoothConfig_NS
{
    const TECSComponentDerivedPtr<FC_AnimLeanRelatedParamSmoothConfig> DerivedPtr = TECSComponentDerivedPtr<FC_AnimLeanRelatedParamSmoothConfig>();
    const FC_AnimLeanRelatedParamSmoothConfig DefaultValue = FC_AnimLeanRelatedParamSmoothConfig();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimLeanParamsRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_AnimLeanParams : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_LeanAngle;
    UPROPERTY()
    float32 m_LeanPitch;
    UPROPERTY()
    float32 m_SmoothedTurningSpeed;

    FC_AnimLeanParams()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimLeanParams(const FC_AnimLeanParams &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimLeanParams opAssign(const FC_AnimLeanParams &inout Other)
    {
        FC_AnimLeanParams __r;
        this.SetLeanAngle(Other.GetLeanAngle());
        this.SetLeanPitch(Other.GetLeanPitch());
        this.SetSmoothedTurningSpeed(Other.GetSmoothedTurningSpeed());
        return __r;
    }
    float32 GetLeanAngle() const property
    {
        return this.m_LeanAngle;
    }
    void SetLeanAngle(const float32 __Value) property
    {
        if (this.m_LeanAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LeanAngle = __Value;
        return;
    }
    float32 GetLeanPitch() const property
    {
        return this.m_LeanPitch;
    }
    void SetLeanPitch(const float32 __Value) property
    {
        if (this.m_LeanPitch == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_LeanPitch = __Value;
        return;
    }
    float32 GetSmoothedTurningSpeed() const property
    {
        return this.m_SmoothedTurningSpeed;
    }
    void SetSmoothedTurningSpeed(const float32 __Value) property
    {
        this.m_SmoothedTurningSpeed = __Value;
        return;
    }
}

struct FC_AnimLeanRelatedParamSmoothConfig : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_SmoothTime;
    UPROPERTY()
    float32 m_MaxDegree;
    UPROPERTY()
    float32 m_TargetAlpha;
    UPROPERTY()
    FFPTime m_FadeToTargetTime;
    UPROPERTY()
    float32 m_FadeToTarget;
    UPROPERTY()
    float32 m_FadeToSpeed;
    UPROPERTY()
    bool m_bEnableLeanBlend;

    FC_AnimLeanRelatedParamSmoothConfig()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimLeanRelatedParamSmoothConfig(const FC_AnimLeanRelatedParamSmoothConfig &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimLeanRelatedParamSmoothConfig opAssign(const FC_AnimLeanRelatedParamSmoothConfig &inout Other)
    {
        FC_AnimLeanRelatedParamSmoothConfig __r;
        this.SetSmoothTime(Other.GetSmoothTime());
        this.SetMaxDegree(Other.GetMaxDegree());
        this.SetTargetAlpha(Other.GetTargetAlpha());
        this.SetFadeToTargetTime(Other.GetFadeToTargetTime());
        this.SetFadeToTarget(Other.GetFadeToTarget());
        this.SetFadeToSpeed(Other.GetFadeToSpeed());
        this.SetbEnableLeanBlend(Other.GetbEnableLeanBlend());
        return __r;
    }
    float32 GetSmoothTime() const property
    {
        return this.m_SmoothTime;
    }
    void SetSmoothTime(const float32 __Value) property
    {
        if (this.m_SmoothTime == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SmoothTime = __Value;
        return;
    }
    float32 GetMaxDegree() const property
    {
        return this.m_MaxDegree;
    }
    void SetMaxDegree(const float32 __Value) property
    {
        if (this.m_MaxDegree == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MaxDegree = __Value;
        return;
    }
    float32 GetTargetAlpha() const property
    {
        return this.m_TargetAlpha;
    }
    void SetTargetAlpha(const float32 __Value) property
    {
        if (this.m_TargetAlpha == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_TargetAlpha = __Value;
        return;
    }
    const FFPTime GetFadeToTargetTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_FadeToTargetTime() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetFadeToTargetTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_FadeToTargetTime = __Value;
        return;
    }
    float32 GetFadeToTarget() const property
    {
        return this.m_FadeToTarget;
    }
    void SetFadeToTarget(const float32 __Value) property
    {
        if (this.m_FadeToTarget == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_FadeToTarget = __Value;
        return;
    }
    float32 GetFadeToSpeed() const property
    {
        return this.m_FadeToSpeed;
    }
    void SetFadeToSpeed(const float32 __Value) property
    {
        if (this.m_FadeToSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_FadeToSpeed = __Value;
        return;
    }
    bool GetbEnableLeanBlend() const property
    {
        return this.m_bEnableLeanBlend;
    }
    void SetbEnableLeanBlend(const bool __Value) property
    {
        if (!(this.m_bEnableLeanBlend) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_bEnableLeanBlend = __Value;
        return;
    }
}

namespace FC_AnimLeanParams
{
FC_AnimLeanParams Interpolate(const FC_AnimLeanParams &inout A, const FC_AnimLeanParams &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimLeanParams local_4;
    local_4.SetLeanAngle(FMath::Lerp(A.GetLeanAngle(), B.GetLeanAngle(), T));
    local_4.SetLeanPitch(FMath::Lerp(A.GetLeanPitch(), B.GetLeanPitch(), T));
    local_4.SetSmoothedTurningSpeed(FMath::Lerp(A.GetSmoothedTurningSpeed(), B.GetSmoothedTurningSpeed(), T));
    return local_4;
}
}
namespace ECSFunc_FC_AnimLeanParams
{
UFUNCTION()
bool HasAnimLeanParams(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanParams);
}
FC_AnimLeanParams& AssignAnimLeanParams(const FECSEntity &inout Entity, const FC_AnimLeanParams &inout DefaultValue = FC_AnimLeanParams())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanParams, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimLeanParams_BP(const FECSEntity &inout Entity, const FC_AnimLeanParams &inout DefaultValue = FC_AnimLeanParams())
{
    ECSFunc_FC_AnimLeanParams::AssignAnimLeanParams(Entity, DefaultValue);
    return;
}
FC_AnimLeanParams& ModifyAnimLeanParams(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanParams));
    return local_12.GetComp();
}
FC_AnimLeanParams& ModifyOrAddAnimLeanParams(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanParams));
    return local_12.GetComp();
}
const FC_AnimLeanParams& GetAnimLeanParams(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanParams));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimLeanParams GetAnimLeanParams_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimLeanParams& local_4 = ECSFunc_FC_AnimLeanParams::GetAnimLeanParams(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimLeanParams();
}
const FC_AnimLeanParams GetDefaultedAnimLeanParams(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimLeanParams __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanParams);
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
FC_AnimLeanParams GetDefaultedAnimLeanParams_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimLeanParams::GetDefaultedAnimLeanParams(Entity);
}
UFUNCTION()
bool RemoveAnimLeanParams(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanParams);
}
}
FECSMonitorRuntimeView __GetMonitorAnimLeanParamsOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimLeanParams, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimLeanParamsOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimLeanParams, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimLeanParamsOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimLeanParams, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimLeanParamsOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimLeanParams, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimLeanParamsOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimLeanParams, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimLeanParamsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimLeanParams, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimLeanParamsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimLeanParams, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimLeanParamsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimLeanParams, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AnimLeanRelatedParamSmoothConfig
{
UFUNCTION()
bool HasAnimLeanRelatedParamSmoothConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanRelatedParamSmoothConfig);
}
FC_AnimLeanRelatedParamSmoothConfig& AssignAnimLeanRelatedParamSmoothConfig(const FECSEntity &inout Entity, const FC_AnimLeanRelatedParamSmoothConfig &inout DefaultValue = FC_AnimLeanRelatedParamSmoothConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanRelatedParamSmoothConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimLeanRelatedParamSmoothConfig_BP(const FECSEntity &inout Entity, const FC_AnimLeanRelatedParamSmoothConfig &inout DefaultValue = FC_AnimLeanRelatedParamSmoothConfig())
{
    ECSFunc_FC_AnimLeanRelatedParamSmoothConfig::AssignAnimLeanRelatedParamSmoothConfig(Entity, DefaultValue);
    return;
}
FC_AnimLeanRelatedParamSmoothConfig& ModifyAnimLeanRelatedParamSmoothConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanRelatedParamSmoothConfig));
    return local_12.GetComp();
}
FC_AnimLeanRelatedParamSmoothConfig& ModifyOrAddAnimLeanRelatedParamSmoothConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanRelatedParamSmoothConfig));
    return local_12.GetComp();
}
const FC_AnimLeanRelatedParamSmoothConfig& GetAnimLeanRelatedParamSmoothConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanRelatedParamSmoothConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimLeanRelatedParamSmoothConfig GetAnimLeanRelatedParamSmoothConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimLeanRelatedParamSmoothConfig& local_4 = ECSFunc_FC_AnimLeanRelatedParamSmoothConfig::GetAnimLeanRelatedParamSmoothConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimLeanRelatedParamSmoothConfig();
}
const FC_AnimLeanRelatedParamSmoothConfig GetDefaultedAnimLeanRelatedParamSmoothConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimLeanRelatedParamSmoothConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanRelatedParamSmoothConfig);
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
FC_AnimLeanRelatedParamSmoothConfig GetDefaultedAnimLeanRelatedParamSmoothConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimLeanRelatedParamSmoothConfig::GetDefaultedAnimLeanRelatedParamSmoothConfig(Entity);
}
UFUNCTION()
bool RemoveAnimLeanRelatedParamSmoothConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanRelatedParamSmoothConfig);
}
}
FECSMonitorRuntimeView __GetMonitorAnimLeanRelatedParamSmoothConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimLeanRelatedParamSmoothConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimLeanRelatedParamSmoothConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimLeanRelatedParamSmoothConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimLeanRelatedParamSmoothConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimLeanRelatedParamSmoothConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimLeanRelatedParamSmoothConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimLeanRelatedParamSmoothConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimLeanRelatedParamSmoothConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimLeanRelatedParamSmoothConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimLeanRelatedParamSmoothConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimLeanRelatedParamSmoothConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimLeanRelatedParamSmoothConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimLeanRelatedParamSmoothConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimLeanRelatedParamSmoothConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimLeanRelatedParamSmoothConfig, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimLeanParams &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimLeanParams &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimLeanParams &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimLeanParams
{
int __IndexOf_LeanAngle()
{
    return 0;
}
int __IndexOf_LeanPitch()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimLeanRelatedParamSmoothConfig &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimLeanRelatedParamSmoothConfig &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimLeanRelatedParamSmoothConfig &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimLeanRelatedParamSmoothConfig
{
int __IndexOf_SmoothTime()
{
    return 0;
}
int __IndexOf_MaxDegree()
{
    return 1;
}
int __IndexOf_TargetAlpha()
{
    return 2;
}
int __IndexOf_FadeToTargetTime()
{
    return 3;
}
int __IndexOf_FadeToTarget()
{
    return 4;
}
int __IndexOf_FadeToSpeed()
{
    return 5;
}
int __IndexOf_bEnableLeanBlend()
{
    return 6;
}
}
