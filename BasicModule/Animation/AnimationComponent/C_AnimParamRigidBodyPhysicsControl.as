
namespace __INTENRAL_FC_AnimParamRigidBodyPhysicsControl_NS
{
    const TECSComponentDerivedPtr<FC_AnimParamRigidBodyPhysicsControl> DerivedPtr = TECSComponentDerivedPtr<FC_AnimParamRigidBodyPhysicsControl>();
    const FC_AnimParamRigidBodyPhysicsControl DefaultValue = FC_AnimParamRigidBodyPhysicsControl();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimParamRigidBodyPhysicsControlRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_AnimParamRigidBodyPhysicsControl : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bIsEnabled;

    FC_AnimParamRigidBodyPhysicsControl()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimParamRigidBodyPhysicsControl(const FC_AnimParamRigidBodyPhysicsControl &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimParamRigidBodyPhysicsControl opAssign(const FC_AnimParamRigidBodyPhysicsControl &inout Other)
    {
        FC_AnimParamRigidBodyPhysicsControl __r;
        this.SetbIsEnabled(Other.GetbIsEnabled());
        return __r;
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
        this.__MarkDirty(0);
        this.m_bIsEnabled = __Value;
        return;
    }
}

class UESMAction_AnimRigidBodyPhysicsControl : UESMBPBaseSpanAction
{
    UESMAction_AnimRigidBodyPhysicsControl()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.SetbIsEnabled(true);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.SetbIsEnabled(false);
        return;
    }
}

namespace FC_AnimParamRigidBodyPhysicsControl
{
FC_AnimParamRigidBodyPhysicsControl Interpolate(const FC_AnimParamRigidBodyPhysicsControl &inout A, const FC_AnimParamRigidBodyPhysicsControl &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimParamRigidBodyPhysicsControl local_2;
    local_2.SetbIsEnabled(B.GetbIsEnabled());
    return local_2;
}
}
namespace ECSFunc_FC_AnimParamRigidBodyPhysicsControl
{
UFUNCTION()
bool HasAnimParamRigidBodyPhysicsControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRigidBodyPhysicsControl);
}
FC_AnimParamRigidBodyPhysicsControl& AssignAnimParamRigidBodyPhysicsControl(const FECSEntity &inout Entity, const FC_AnimParamRigidBodyPhysicsControl &inout DefaultValue = FC_AnimParamRigidBodyPhysicsControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRigidBodyPhysicsControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimParamRigidBodyPhysicsControl_BP(const FECSEntity &inout Entity, const FC_AnimParamRigidBodyPhysicsControl &inout DefaultValue = FC_AnimParamRigidBodyPhysicsControl())
{
    ECSFunc_FC_AnimParamRigidBodyPhysicsControl::AssignAnimParamRigidBodyPhysicsControl(Entity, DefaultValue);
    return;
}
FC_AnimParamRigidBodyPhysicsControl& ModifyAnimParamRigidBodyPhysicsControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRigidBodyPhysicsControl));
    return local_12.GetComp();
}
FC_AnimParamRigidBodyPhysicsControl& ModifyOrAddAnimParamRigidBodyPhysicsControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRigidBodyPhysicsControl));
    return local_12.GetComp();
}
const FC_AnimParamRigidBodyPhysicsControl& GetAnimParamRigidBodyPhysicsControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRigidBodyPhysicsControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimParamRigidBodyPhysicsControl GetAnimParamRigidBodyPhysicsControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimParamRigidBodyPhysicsControl& local_4 = ECSFunc_FC_AnimParamRigidBodyPhysicsControl::GetAnimParamRigidBodyPhysicsControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimParamRigidBodyPhysicsControl();
}
const FC_AnimParamRigidBodyPhysicsControl GetDefaultedAnimParamRigidBodyPhysicsControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimParamRigidBodyPhysicsControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRigidBodyPhysicsControl);
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
FC_AnimParamRigidBodyPhysicsControl GetDefaultedAnimParamRigidBodyPhysicsControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimParamRigidBodyPhysicsControl::GetDefaultedAnimParamRigidBodyPhysicsControl(Entity);
}
UFUNCTION()
bool RemoveAnimParamRigidBodyPhysicsControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRigidBodyPhysicsControl);
}
}
FECSMonitorRuntimeView __GetMonitorAnimParamRigidBodyPhysicsControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimParamRigidBodyPhysicsControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRigidBodyPhysicsControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimParamRigidBodyPhysicsControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRigidBodyPhysicsControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimParamRigidBodyPhysicsControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRigidBodyPhysicsControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimParamRigidBodyPhysicsControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRigidBodyPhysicsControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimParamRigidBodyPhysicsControl, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimParamRigidBodyPhysicsControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimParamRigidBodyPhysicsControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamRigidBodyPhysicsControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimParamRigidBodyPhysicsControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamRigidBodyPhysicsControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimParamRigidBodyPhysicsControl, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimParamRigidBodyPhysicsControl &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimParamRigidBodyPhysicsControl &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimParamRigidBodyPhysicsControl &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimParamRigidBodyPhysicsControl
{
int __IndexOf_bIsEnabled()
{
    return 0;
}
}
