
namespace __INTENRAL_FC_FlyLeanControl_NS
{
    const TECSComponentDerivedPtr<FC_FlyLeanControl> DerivedPtr = TECSComponentDerivedPtr<FC_FlyLeanControl>();
    const FC_FlyLeanControl DefaultValue = FC_FlyLeanControl();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_FlyLeanControlRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_FlyLeanControl : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bEnable;

    FC_FlyLeanControl()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_FlyLeanControl(const FC_FlyLeanControl &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_FlyLeanControl opAssign(const FC_FlyLeanControl &inout Other)
    {
        FC_FlyLeanControl __r;
        this.SetbEnable(Other.GetbEnable());
        return __r;
    }
    bool GetbEnable() const property
    {
        return this.m_bEnable;
    }
    void SetbEnable(const bool __Value) property
    {
        if (!(this.m_bEnable) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bEnable = __Value;
        return;
    }
}

class UESMAction_FlyLeanControl : UESMBPBaseSpanTickAction
{
    UESMAction_FlyLeanControl()
    {
        return;
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(6);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_FlyLeanControl& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetbEnable(true);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_FlyLeanControl& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetbEnable(false);
        }
        return;
    }
}

namespace FC_FlyLeanControl
{
FC_FlyLeanControl Interpolate(const FC_FlyLeanControl &inout A, const FC_FlyLeanControl &inout B, const float32 T, const float32 DeltaTime)
{
    FC_FlyLeanControl local_2;
    local_2.SetbEnable(A.GetbEnable());
    return local_2;
}
}
namespace ECSFunc_FC_FlyLeanControl
{
UFUNCTION()
bool HasFlyLeanControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FlyLeanControl);
}
FC_FlyLeanControl& AssignFlyLeanControl(const FECSEntity &inout Entity, const FC_FlyLeanControl &inout DefaultValue = FC_FlyLeanControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FlyLeanControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFlyLeanControl_BP(const FECSEntity &inout Entity, const FC_FlyLeanControl &inout DefaultValue = FC_FlyLeanControl())
{
    ECSFunc_FC_FlyLeanControl::AssignFlyLeanControl(Entity, DefaultValue);
    return;
}
FC_FlyLeanControl& ModifyFlyLeanControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FlyLeanControl));
    return local_12.GetComp();
}
FC_FlyLeanControl& ModifyOrAddFlyLeanControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FlyLeanControl));
    return local_12.GetComp();
}
const FC_FlyLeanControl& GetFlyLeanControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FlyLeanControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_FlyLeanControl GetFlyLeanControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_FlyLeanControl& local_4 = ECSFunc_FC_FlyLeanControl::GetFlyLeanControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_FlyLeanControl();
}
const FC_FlyLeanControl GetDefaultedFlyLeanControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FlyLeanControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FlyLeanControl);
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
FC_FlyLeanControl GetDefaultedFlyLeanControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_FlyLeanControl::GetDefaultedFlyLeanControl(Entity);
}
UFUNCTION()
bool RemoveFlyLeanControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FlyLeanControl);
}
}
FECSMonitorRuntimeView __GetMonitorFlyLeanControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FlyLeanControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlyLeanControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FlyLeanControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlyLeanControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FlyLeanControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlyLeanControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FlyLeanControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlyLeanControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FlyLeanControl, bFixedFrame, bMustHandleAll);
}
void __MonitorFlyLeanControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FlyLeanControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFlyLeanControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FlyLeanControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFlyLeanControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FlyLeanControl, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_FlyLeanControl &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_FlyLeanControl &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_FlyLeanControl &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_FlyLeanControl
{
int __IndexOf_bEnable()
{
    return 0;
}
}
