
namespace __INTENRAL_FC_AnimUseIdleHeadControlConfig_NS
{
    const TECSComponentDerivedPtr<FC_AnimUseIdleHeadControlConfig> DerivedPtr = TECSComponentDerivedPtr<FC_AnimUseIdleHeadControlConfig>();
    const FC_AnimUseIdleHeadControlConfig DefaultValue = FC_AnimUseIdleHeadControlConfig();
}
namespace __INTENRAL_FC_AnimIdleHeadControl_NS
{
    const TECSComponentDerivedPtr<FC_AnimIdleHeadControl> DerivedPtr = TECSComponentDerivedPtr<FC_AnimIdleHeadControl>();
    const FC_AnimIdleHeadControl DefaultValue = FC_AnimIdleHeadControl();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimIdleHeadControlRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_AnimUseIdleHeadControlConfig : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    float32 m_EnableMaxHorizontalAngle;
    UPROPERTY()
    float32 m_EnableMaxVerticalAngle;
    UPROPERTY()
    float32 m_ClampMaxHorizontalAngle;
    UPROPERTY()
    float32 m_ClampMaxVerticalAngle;
    UPROPERTY()
    float32 m_HorizontalAngleSignedScale;
    UPROPERTY()
    float32 m_VerticalAngleSignedScale;
    UPROPERTY()
    float32 m_BlendInTime;
    UPROPERTY()
    float32 m_BlendOutTime;

    FC_AnimUseIdleHeadControlConfig()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimUseIdleHeadControlConfig(const FC_AnimUseIdleHeadControlConfig &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimUseIdleHeadControlConfig opAssign(const FC_AnimUseIdleHeadControlConfig &inout Other)
    {
        FC_AnimUseIdleHeadControlConfig __r;
        this.SetEnableMaxHorizontalAngle(Other.GetEnableMaxHorizontalAngle());
        this.SetEnableMaxVerticalAngle(Other.GetEnableMaxVerticalAngle());
        this.SetClampMaxHorizontalAngle(Other.GetClampMaxHorizontalAngle());
        this.SetClampMaxVerticalAngle(Other.GetClampMaxVerticalAngle());
        this.SetHorizontalAngleSignedScale(Other.GetHorizontalAngleSignedScale());
        this.SetVerticalAngleSignedScale(Other.GetVerticalAngleSignedScale());
        this.SetBlendInTime(Other.GetBlendInTime());
        this.SetBlendOutTime(Other.GetBlendOutTime());
        return __r;
    }
    float32 GetEnableMaxHorizontalAngle() const property
    {
        return this.m_EnableMaxHorizontalAngle;
    }
    void SetEnableMaxHorizontalAngle(const float32 __Value) property
    {
        if (this.m_EnableMaxHorizontalAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_EnableMaxHorizontalAngle = __Value;
        return;
    }
    float32 GetEnableMaxVerticalAngle() const property
    {
        return this.m_EnableMaxVerticalAngle;
    }
    void SetEnableMaxVerticalAngle(const float32 __Value) property
    {
        if (this.m_EnableMaxVerticalAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_EnableMaxVerticalAngle = __Value;
        return;
    }
    float32 GetClampMaxHorizontalAngle() const property
    {
        return this.m_ClampMaxHorizontalAngle;
    }
    void SetClampMaxHorizontalAngle(const float32 __Value) property
    {
        if (this.m_ClampMaxHorizontalAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ClampMaxHorizontalAngle = __Value;
        return;
    }
    float32 GetClampMaxVerticalAngle() const property
    {
        return this.m_ClampMaxVerticalAngle;
    }
    void SetClampMaxVerticalAngle(const float32 __Value) property
    {
        if (this.m_ClampMaxVerticalAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ClampMaxVerticalAngle = __Value;
        return;
    }
    float32 GetHorizontalAngleSignedScale() const property
    {
        return this.m_HorizontalAngleSignedScale;
    }
    void SetHorizontalAngleSignedScale(const float32 __Value) property
    {
        if (this.m_HorizontalAngleSignedScale == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_HorizontalAngleSignedScale = __Value;
        return;
    }
    float32 GetVerticalAngleSignedScale() const property
    {
        return this.m_VerticalAngleSignedScale;
    }
    void SetVerticalAngleSignedScale(const float32 __Value) property
    {
        if (this.m_VerticalAngleSignedScale == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_VerticalAngleSignedScale = __Value;
        return;
    }
    float32 GetBlendInTime() const property
    {
        return this.m_BlendInTime;
    }
    void SetBlendInTime(const float32 __Value) property
    {
        if (this.m_BlendInTime == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_BlendInTime = __Value;
        return;
    }
    float32 GetBlendOutTime() const property
    {
        return this.m_BlendOutTime;
    }
    void SetBlendOutTime(const float32 __Value) property
    {
        if (this.m_BlendOutTime == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_BlendOutTime = __Value;
        return;
    }
}

struct FC_AnimIdleHeadControl : FECSComponent
{
    UPROPERTY()
    float32 Weight = 0.0f;
    UPROPERTY()
    float32 HorizontalAngleSigned = 0.0f;
    UPROPERTY()
    float32 VerticalAngleSigned = 0.0f;
    UPROPERTY()
    float32 ClampHorizontalAngleSigned = 0.0f;
    UPROPERTY()
    float32 ClampVerticalAngleSigned = 0.0f;
    UPROPERTY()
    float32 BlendInTime = 1.0f;
    UPROPERTY()
    float32 BlendOutTime = 1.2f;


    void Clear()
    {
        this.Weight = 0.0f;
        this.HorizontalAngleSigned = 0.0f;
        this.VerticalAngleSigned = 0.0f;
        this.ClampHorizontalAngleSigned = 0.0f;
        this.ClampVerticalAngleSigned = 0.0f;
        return;
    }
}

class UESMAction_IdleHeadControl : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    float32 EnableMaxHorizontalAngle = 120.0f;
    UPROPERTY()
    float32 EnableMaxVerticalAngle = 90.0f;
    UPROPERTY()
    float32 ClampMaxHorizontalAngle = 60.0f;
    UPROPERTY()
    float32 ClampMaxVerticalAngle = 60.0f;
    UPROPERTY()
    float32 HorizontalAngleSignedScale = 1.0f;
    UPROPERTY()
    float32 VerticalAngleSignedScale = 1.0f;
    UPROPERTY()
    float32 BlendInTime = 1.0f;
    UPROPERTY()
    float32 BlendOutTime = 1.2f;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::FC_AnimAimTargetControl::SetUseAnimAimTargetControl(Context.GetEntity(), true);
        ModifyOrAdd local_6;
        FC_AnimUseIdleHeadControlConfig& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.SetEnableMaxHorizontalAngle(this.EnableMaxHorizontalAngle);
            local_8.SetEnableMaxVerticalAngle(this.EnableMaxVerticalAngle);
            local_8.SetClampMaxHorizontalAngle(this.ClampMaxHorizontalAngle);
            local_8.SetClampMaxVerticalAngle(this.ClampMaxVerticalAngle);
            local_8.SetHorizontalAngleSignedScale(this.HorizontalAngleSignedScale);
            local_8.SetVerticalAngleSignedScale(this.VerticalAngleSignedScale);
            local_8.SetBlendInTime(this.BlendInTime);
            local_8.SetBlendOutTime(this.BlendOutTime);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        ::FC_AnimAimTargetControl::SetUseAnimAimTargetControl(Context.GetEntity(), false);
        return;
    }
}

namespace FC_AnimIdleHeadControl
{
FC_AnimIdleHeadControl Interpolate(const FC_AnimIdleHeadControl &inout A, const FC_AnimIdleHeadControl &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimIdleHeadControl local_8;
    local_8.Weight = FMath::Lerp(A.Weight, B.Weight, T);
    local_8.HorizontalAngleSigned = FMath::Lerp(A.HorizontalAngleSigned, B.HorizontalAngleSigned, T);
    local_8.VerticalAngleSigned = FMath::Lerp(A.VerticalAngleSigned, B.VerticalAngleSigned, T);
    local_8.ClampHorizontalAngleSigned = FMath::Lerp(A.ClampHorizontalAngleSigned, B.ClampHorizontalAngleSigned, T);
    local_8.ClampVerticalAngleSigned = FMath::Lerp(A.ClampVerticalAngleSigned, B.ClampVerticalAngleSigned, T);
    local_8.BlendInTime = FMath::Lerp(A.BlendInTime, B.BlendInTime, T);
    local_8.BlendOutTime = FMath::Lerp(A.BlendOutTime, B.BlendOutTime, T);
    return local_8;
}
}
namespace ECSFunc_FC_AnimUseIdleHeadControlConfig
{
UFUNCTION()
bool HasAnimUseIdleHeadControlConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimUseIdleHeadControlConfig);
}
FC_AnimUseIdleHeadControlConfig& AssignAnimUseIdleHeadControlConfig(const FECSEntity &inout Entity, const FC_AnimUseIdleHeadControlConfig &inout DefaultValue = FC_AnimUseIdleHeadControlConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimUseIdleHeadControlConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimUseIdleHeadControlConfig_BP(const FECSEntity &inout Entity, const FC_AnimUseIdleHeadControlConfig &inout DefaultValue = FC_AnimUseIdleHeadControlConfig())
{
    ECSFunc_FC_AnimUseIdleHeadControlConfig::AssignAnimUseIdleHeadControlConfig(Entity, DefaultValue);
    return;
}
FC_AnimUseIdleHeadControlConfig& ModifyAnimUseIdleHeadControlConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimUseIdleHeadControlConfig));
    return local_12.GetComp();
}
FC_AnimUseIdleHeadControlConfig& ModifyOrAddAnimUseIdleHeadControlConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimUseIdleHeadControlConfig));
    return local_12.GetComp();
}
const FC_AnimUseIdleHeadControlConfig& GetAnimUseIdleHeadControlConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimUseIdleHeadControlConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimUseIdleHeadControlConfig GetAnimUseIdleHeadControlConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimUseIdleHeadControlConfig& local_4 = ECSFunc_FC_AnimUseIdleHeadControlConfig::GetAnimUseIdleHeadControlConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimUseIdleHeadControlConfig();
}
const FC_AnimUseIdleHeadControlConfig GetDefaultedAnimUseIdleHeadControlConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimUseIdleHeadControlConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimUseIdleHeadControlConfig);
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
FC_AnimUseIdleHeadControlConfig GetDefaultedAnimUseIdleHeadControlConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimUseIdleHeadControlConfig::GetDefaultedAnimUseIdleHeadControlConfig(Entity);
}
UFUNCTION()
bool RemoveAnimUseIdleHeadControlConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimUseIdleHeadControlConfig);
}
}
FECSMonitorRuntimeView __GetMonitorAnimUseIdleHeadControlConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimUseIdleHeadControlConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimUseIdleHeadControlConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimUseIdleHeadControlConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimUseIdleHeadControlConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimUseIdleHeadControlConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimUseIdleHeadControlConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimUseIdleHeadControlConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimUseIdleHeadControlConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimUseIdleHeadControlConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimUseIdleHeadControlConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimUseIdleHeadControlConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimUseIdleHeadControlConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimUseIdleHeadControlConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimUseIdleHeadControlConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimUseIdleHeadControlConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AnimIdleHeadControl
{
UFUNCTION()
bool HasAnimIdleHeadControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimIdleHeadControl);
}
FC_AnimIdleHeadControl& AssignAnimIdleHeadControl(const FECSEntity &inout Entity, const FC_AnimIdleHeadControl &inout DefaultValue = FC_AnimIdleHeadControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimIdleHeadControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimIdleHeadControl_BP(const FECSEntity &inout Entity, const FC_AnimIdleHeadControl &inout DefaultValue = FC_AnimIdleHeadControl())
{
    ECSFunc_FC_AnimIdleHeadControl::AssignAnimIdleHeadControl(Entity, DefaultValue);
    return;
}
FC_AnimIdleHeadControl& ModifyAnimIdleHeadControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimIdleHeadControl));
    return local_12.GetComp();
}
FC_AnimIdleHeadControl& ModifyOrAddAnimIdleHeadControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimIdleHeadControl));
    return local_12.GetComp();
}
const FC_AnimIdleHeadControl& GetAnimIdleHeadControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimIdleHeadControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimIdleHeadControl GetAnimIdleHeadControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimIdleHeadControl& local_4 = ECSFunc_FC_AnimIdleHeadControl::GetAnimIdleHeadControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimIdleHeadControl();
}
const FC_AnimIdleHeadControl GetDefaultedAnimIdleHeadControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimIdleHeadControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimIdleHeadControl);
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
FC_AnimIdleHeadControl GetDefaultedAnimIdleHeadControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimIdleHeadControl::GetDefaultedAnimIdleHeadControl(Entity);
}
UFUNCTION()
bool RemoveAnimIdleHeadControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimIdleHeadControl);
}
}
FECSMonitorRuntimeView __GetMonitorAnimIdleHeadControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimIdleHeadControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimIdleHeadControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimIdleHeadControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimIdleHeadControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimIdleHeadControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimIdleHeadControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimIdleHeadControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimIdleHeadControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimIdleHeadControl, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimIdleHeadControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimIdleHeadControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimIdleHeadControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimIdleHeadControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimIdleHeadControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimIdleHeadControl, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_AnimUseIdleHeadControlConfig &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimUseIdleHeadControlConfig &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimUseIdleHeadControlConfig &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimUseIdleHeadControlConfig
{
int __IndexOf_EnableMaxHorizontalAngle()
{
    return 0;
}
int __IndexOf_EnableMaxVerticalAngle()
{
    return 1;
}
int __IndexOf_ClampMaxHorizontalAngle()
{
    return 2;
}
int __IndexOf_ClampMaxVerticalAngle()
{
    return 3;
}
int __IndexOf_HorizontalAngleSignedScale()
{
    return 4;
}
int __IndexOf_VerticalAngleSignedScale()
{
    return 5;
}
int __IndexOf_BlendInTime()
{
    return 6;
}
int __IndexOf_BlendOutTime()
{
    return 7;
}
}
