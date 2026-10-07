
namespace __INTENRAL_FC_AnimAimTargetControl_NS
{
    const TECSComponentDerivedPtr<FC_AnimAimTargetControl> DerivedPtr = TECSComponentDerivedPtr<FC_AnimAimTargetControl>();
    const FC_AnimAimTargetControl DefaultValue = FC_AnimAimTargetControl();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimAimTargetControlRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_AnimAimTargetControl : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_UsedCounter;
    UPROPERTY()
    bool m_bDataValid;
    UPROPERTY()
    FVector m_AimTarget;

    FC_AnimAimTargetControl()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimAimTargetControl(const FC_AnimAimTargetControl &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimAimTargetControl opAssign(const FC_AnimAimTargetControl &inout Other)
    {
        FC_AnimAimTargetControl __r;
        this.SetUsedCounter(Other.GetUsedCounter());
        this.SetbDataValid(Other.GetbDataValid());
        this.SetAimTarget(Other.GetAimTarget());
        return __r;
    }
    int GetUsedCounter() const property
    {
        return this.m_UsedCounter;
    }
    void SetUsedCounter(const int __Value) property
    {
        if (this.m_UsedCounter == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_UsedCounter = __Value;
        return;
    }
    bool GetbDataValid() const property
    {
        return this.m_bDataValid;
    }
    void SetbDataValid(const bool __Value) property
    {
        if (!(this.m_bDataValid) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bDataValid = __Value;
        return;
    }
    const FVector GetAimTarget() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_AimTarget() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetAimTarget(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_AimTarget = __Value;
        return;
    }
}

namespace FC_AnimAimTargetControl
{
FC_AnimAimTargetControl Interpolate(const FC_AnimAimTargetControl &inout A, const FC_AnimAimTargetControl &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimAimTargetControl local_10;
    local_10.SetAimTarget(FMath::Lerp(A.GetAimTarget(), B.GetAimTarget(), T));
    return local_10;
}
void SetUseAnimAimTargetControl(const FECSEntity &inout Entity, const bool bUse)
{
    if (bUse)
    {
        ModifyOrAdd local_4;
        FC_AnimAimTargetControl& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetUsedCounter((local_6.GetUsedCounter() + 1));
        }
        return;
    }
    Modify local_14;
    FC_AnimAimTargetControl& local_6_2 = local_14.opCall();
    if (local_6_2)
    {
        local_6_2.SetUsedCounter((local_6_2.GetUsedCounter() - 1));
    }
    return;
}
}
namespace ECSFunc_FC_AnimAimTargetControl
{
UFUNCTION()
bool HasAnimAimTargetControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimAimTargetControl);
}
FC_AnimAimTargetControl& AssignAnimAimTargetControl(const FECSEntity &inout Entity, const FC_AnimAimTargetControl &inout DefaultValue = FC_AnimAimTargetControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimAimTargetControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimAimTargetControl_BP(const FECSEntity &inout Entity, const FC_AnimAimTargetControl &inout DefaultValue = FC_AnimAimTargetControl())
{
    ECSFunc_FC_AnimAimTargetControl::AssignAnimAimTargetControl(Entity, DefaultValue);
    return;
}
FC_AnimAimTargetControl& ModifyAnimAimTargetControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimAimTargetControl));
    return local_12.GetComp();
}
FC_AnimAimTargetControl& ModifyOrAddAnimAimTargetControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimAimTargetControl));
    return local_12.GetComp();
}
const FC_AnimAimTargetControl& GetAnimAimTargetControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimAimTargetControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimAimTargetControl GetAnimAimTargetControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimAimTargetControl& local_4 = ECSFunc_FC_AnimAimTargetControl::GetAnimAimTargetControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimAimTargetControl();
}
const FC_AnimAimTargetControl GetDefaultedAnimAimTargetControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimAimTargetControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimAimTargetControl);
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
FC_AnimAimTargetControl GetDefaultedAnimAimTargetControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimAimTargetControl::GetDefaultedAnimAimTargetControl(Entity);
}
UFUNCTION()
bool RemoveAnimAimTargetControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimAimTargetControl);
}
}
FECSMonitorRuntimeView __GetMonitorAnimAimTargetControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimAimTargetControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimTargetControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimAimTargetControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimTargetControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimAimTargetControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimTargetControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimAimTargetControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimTargetControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimAimTargetControl, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimAimTargetControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimAimTargetControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimAimTargetControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimAimTargetControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimAimTargetControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimAimTargetControl, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimAimTargetControl &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimAimTargetControl &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimAimTargetControl &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimAimTargetControl
{
int __IndexOf_UsedCounter()
{
    return 0;
}
int __IndexOf_bDataValid()
{
    return 1;
}
int __IndexOf_AimTarget()
{
    return 2;
}
}
