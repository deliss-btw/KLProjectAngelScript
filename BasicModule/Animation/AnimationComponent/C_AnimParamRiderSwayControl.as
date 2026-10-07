
namespace __INTENRAL_FC_AnimParamRiderSwayControl_NS
{
    const TECSComponentDerivedPtr<FC_AnimParamRiderSwayControl> DerivedPtr = TECSComponentDerivedPtr<FC_AnimParamRiderSwayControl>();
    const FC_AnimParamRiderSwayControl DefaultValue = FC_AnimParamRiderSwayControl();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimParamRiderSwayControlRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_AnimParamRiderSwayControl : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_Weight;
    UPROPERTY()
    float32 m_TargetWeight;
    UPROPERTY()
    float32 m_InterpSpeed;
    UPROPERTY()
    bool m_bIsEnabled;

    FC_AnimParamRiderSwayControl()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimParamRiderSwayControl(const FC_AnimParamRiderSwayControl &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimParamRiderSwayControl opAssign(const FC_AnimParamRiderSwayControl &inout Other)
    {
        FC_AnimParamRiderSwayControl __r;
        this.SetWeight(Other.GetWeight());
        this.SetTargetWeight(Other.GetTargetWeight());
        this.SetInterpSpeed(Other.GetInterpSpeed());
        this.SetbIsEnabled(Other.GetbIsEnabled());
        return __r;
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
    float32 GetInterpSpeed() const property
    {
        return this.m_InterpSpeed;
    }
    void SetInterpSpeed(const float32 __Value) property
    {
        if (this.m_InterpSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_InterpSpeed = __Value;
        return;
    }
    bool GetbIsEnabled() const property
    {
        return this.m_bIsEnabled;
    }
    void SetbIsEnabled(const bool __Value) property
    {
        if (!(this.m_bIsEnabled) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bIsEnabled = __Value;
        return;
    }
}

class UESMAction_AnimRiderSwayPhysicsControl : UESMBPBaseSpanAction
{
    UPROPERTY()
    float32 TargetWeight = 1.0f;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.SetTargetWeight(this.TargetWeight);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.SetTargetWeight(0.0f);
        return;
    }
}

namespace FC_AnimParamRiderSwayControl
{
FC_AnimParamRiderSwayControl Interpolate(const FC_AnimParamRiderSwayControl &inout A, const FC_AnimParamRiderSwayControl &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimParamRiderSwayControl local_6;
    local_6.SetWeight(FMath::Lerp(A.GetWeight(), B.GetWeight(), T));
    local_6.SetbIsEnabled(B.GetbIsEnabled());
    return local_6;
}
}
namespace ECSFunc_FC_AnimParamRiderSwayControl
{
UFUNCTION()
bool HasAnimParamRiderSwayControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRiderSwayControl);
}
FC_AnimParamRiderSwayControl& AssignAnimParamRiderSwayControl(const FECSEntity &inout Entity, const FC_AnimParamRiderSwayControl &inout DefaultValue = FC_AnimParamRiderSwayControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRiderSwayControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimParamRiderSwayControl_BP(const FECSEntity &inout Entity, const FC_AnimParamRiderSwayControl &inout DefaultValue = FC_AnimParamRiderSwayControl())
{
    ECSFunc_FC_AnimParamRiderSwayControl::AssignAnimParamRiderSwayControl(Entity, DefaultValue);
    return;
}
FC_AnimParamRiderSwayControl& ModifyAnimParamRiderSwayControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRiderSwayControl));
    return local_12.GetComp();
}
FC_AnimParamRiderSwayControl& ModifyOrAddAnimParamRiderSwayControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRiderSwayControl));
    return local_12.GetComp();
}
const FC_AnimParamRiderSwayControl& GetAnimParamRiderSwayControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRiderSwayControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimParamRiderSwayControl GetAnimParamRiderSwayControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimParamRiderSwayControl& local_4 = ECSFunc_FC_AnimParamRiderSwayControl::GetAnimParamRiderSwayControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimParamRiderSwayControl();
}
const FC_AnimParamRiderSwayControl GetDefaultedAnimParamRiderSwayControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimParamRiderSwayControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRiderSwayControl);
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
FC_AnimParamRiderSwayControl GetDefaultedAnimParamRiderSwayControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimParamRiderSwayControl::GetDefaultedAnimParamRiderSwayControl(Entity);
}
UFUNCTION()
bool RemoveAnimParamRiderSwayControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRiderSwayControl);
}
}
FECSMonitorRuntimeView __GetMonitorAnimParamRiderSwayControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimParamRiderSwayControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRiderSwayControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimParamRiderSwayControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRiderSwayControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimParamRiderSwayControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRiderSwayControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimParamRiderSwayControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRiderSwayControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimParamRiderSwayControl, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimParamRiderSwayControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimParamRiderSwayControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamRiderSwayControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimParamRiderSwayControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamRiderSwayControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimParamRiderSwayControl, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimParamRiderSwayControl &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimParamRiderSwayControl &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimParamRiderSwayControl &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimParamRiderSwayControl
{
int __IndexOf_Weight()
{
    return 0;
}
int __IndexOf_TargetWeight()
{
    return 1;
}
int __IndexOf_InterpSpeed()
{
    return 2;
}
int __IndexOf_bIsEnabled()
{
    return 3;
}
}
