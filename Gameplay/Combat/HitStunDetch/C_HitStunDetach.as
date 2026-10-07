
namespace __INTENRAL_FC_HitStunDetach_NS
{
    const TECSComponentDerivedPtr<FC_HitStunDetach> DerivedPtr = TECSComponentDerivedPtr<FC_HitStunDetach>();
    const FC_HitStunDetach DefaultValue = FC_HitStunDetach();

}
struct FC_HitStunDetach : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_AccumulatedDetachValue;
    UPROPERTY()
    bool m_bInMaxMaintainState;

    FC_HitStunDetach()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_HitStunDetach(const FC_HitStunDetach &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_HitStunDetach opAssign(const FC_HitStunDetach &inout Other)
    {
        FC_HitStunDetach __r;
        this.SetAccumulatedDetachValue(Other.GetAccumulatedDetachValue());
        this.SetbInMaxMaintainState(Other.GetbInMaxMaintainState());
        return __r;
    }
    float32 GetAccumulatedDetachValue() const property
    {
        return this.m_AccumulatedDetachValue;
    }
    void SetAccumulatedDetachValue(const float32 __Value) property
    {
        if (this.m_AccumulatedDetachValue == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AccumulatedDetachValue = __Value;
        return;
    }
    bool GetbInMaxMaintainState() const property
    {
        return this.m_bInMaxMaintainState;
    }
    void SetbInMaxMaintainState(const bool __Value) property
    {
        if (!(this.m_bInMaxMaintainState) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bInMaxMaintainState = __Value;
        return;
    }
}

namespace ECSFunc_FC_HitStunDetach
{
UFUNCTION()
bool HasHitStunDetach(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HitStunDetach);
}
FC_HitStunDetach& AssignHitStunDetach(const FECSEntity &inout Entity, const FC_HitStunDetach &inout DefaultValue = FC_HitStunDetach())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HitStunDetach, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHitStunDetach_BP(const FECSEntity &inout Entity, const FC_HitStunDetach &inout DefaultValue = FC_HitStunDetach())
{
    ECSFunc_FC_HitStunDetach::AssignHitStunDetach(Entity, DefaultValue);
    return;
}
FC_HitStunDetach& ModifyHitStunDetach(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HitStunDetach));
    return local_12.GetComp();
}
FC_HitStunDetach& ModifyOrAddHitStunDetach(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HitStunDetach));
    return local_12.GetComp();
}
const FC_HitStunDetach& GetHitStunDetach(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HitStunDetach));
    return local_12.GetComp();
}
UFUNCTION()
FC_HitStunDetach GetHitStunDetach_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_HitStunDetach& local_4 = ECSFunc_FC_HitStunDetach::GetHitStunDetach(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_HitStunDetach();
}
const FC_HitStunDetach GetDefaultedHitStunDetach(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HitStunDetach __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HitStunDetach);
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
FC_HitStunDetach GetDefaultedHitStunDetach_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_HitStunDetach::GetDefaultedHitStunDetach(Entity);
}
UFUNCTION()
bool RemoveHitStunDetach(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HitStunDetach);
}
}
FECSMonitorRuntimeView __GetMonitorHitStunDetachOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HitStunDetach, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitStunDetachOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HitStunDetach, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitStunDetachOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HitStunDetach, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitStunDetachOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HitStunDetach, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitStunDetachOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HitStunDetach, bFixedFrame, bMustHandleAll);
}
void __MonitorHitStunDetachLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HitStunDetach, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitStunDetachActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HitStunDetach, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitStunDetachModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HitStunDetach, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_HitStunDetach_AccumulatedDetachValue(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetAccumulatedDetachValue();
    return;
}
void GetEntityBBVar_HitStunDetach_bInMaxMaintainState(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetbInMaxMaintainState();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_HitStunDetach &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_HitStunDetach &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_HitStunDetach &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_HitStunDetach
{
int __IndexOf_AccumulatedDetachValue()
{
    return 0;
}
int __IndexOf_bInMaxMaintainState()
{
    return 1;
}
}
