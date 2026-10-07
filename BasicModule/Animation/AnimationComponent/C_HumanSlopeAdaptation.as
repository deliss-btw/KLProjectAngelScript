
namespace __INTENRAL_FC_SlopeAdaptControl_NS
{
    const TECSComponentDerivedPtr<FC_SlopeAdaptControl> DerivedPtr = TECSComponentDerivedPtr<FC_SlopeAdaptControl>();
    const FC_SlopeAdaptControl DefaultValue = FC_SlopeAdaptControl();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_SlopeAdaptControlRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_SlopeAdaptControl : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_RefCount;

    FC_SlopeAdaptControl()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_SlopeAdaptControl(const FC_SlopeAdaptControl &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_SlopeAdaptControl opAssign(const FC_SlopeAdaptControl &inout Other)
    {
        FC_SlopeAdaptControl __r;
        this.SetRefCount(Other.GetRefCount());
        return __r;
    }
    int GetRefCount() const property
    {
        return this.m_RefCount;
    }
    void SetRefCount(const int __Value) property
    {
        if (this.m_RefCount == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RefCount = __Value;
        return;
    }
}

struct FHumanSlopeAdaptOutput
{
    FHumanSlopeAdaptOutput()
    {
        return;
    }
}

namespace FC_SlopeAdaptControl
{
FC_SlopeAdaptControl Interpolate(const FC_SlopeAdaptControl &inout A, const FC_SlopeAdaptControl &inout B, const float32 T, const float32 DeltaTime)
{
    FC_SlopeAdaptControl local_2;
    local_2.SetRefCount(B.GetRefCount());
    return local_2;
}
}
namespace ECSFunc_FC_SlopeAdaptControl
{
UFUNCTION()
bool HasSlopeAdaptControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SlopeAdaptControl);
}
FC_SlopeAdaptControl& AssignSlopeAdaptControl(const FECSEntity &inout Entity, const FC_SlopeAdaptControl &inout DefaultValue = FC_SlopeAdaptControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SlopeAdaptControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSlopeAdaptControl_BP(const FECSEntity &inout Entity, const FC_SlopeAdaptControl &inout DefaultValue = FC_SlopeAdaptControl())
{
    ECSFunc_FC_SlopeAdaptControl::AssignSlopeAdaptControl(Entity, DefaultValue);
    return;
}
FC_SlopeAdaptControl& ModifySlopeAdaptControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SlopeAdaptControl));
    return local_12.GetComp();
}
FC_SlopeAdaptControl& ModifyOrAddSlopeAdaptControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SlopeAdaptControl));
    return local_12.GetComp();
}
const FC_SlopeAdaptControl& GetSlopeAdaptControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SlopeAdaptControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_SlopeAdaptControl GetSlopeAdaptControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SlopeAdaptControl& local_4 = ECSFunc_FC_SlopeAdaptControl::GetSlopeAdaptControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SlopeAdaptControl();
}
const FC_SlopeAdaptControl GetDefaultedSlopeAdaptControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SlopeAdaptControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SlopeAdaptControl);
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
FC_SlopeAdaptControl GetDefaultedSlopeAdaptControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SlopeAdaptControl::GetDefaultedSlopeAdaptControl(Entity);
}
UFUNCTION()
bool RemoveSlopeAdaptControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SlopeAdaptControl);
}
}
FECSMonitorRuntimeView __GetMonitorSlopeAdaptControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SlopeAdaptControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSlopeAdaptControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SlopeAdaptControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSlopeAdaptControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SlopeAdaptControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSlopeAdaptControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SlopeAdaptControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSlopeAdaptControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SlopeAdaptControl, bFixedFrame, bMustHandleAll);
}
void __MonitorSlopeAdaptControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SlopeAdaptControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSlopeAdaptControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SlopeAdaptControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSlopeAdaptControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SlopeAdaptControl, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SlopeAdaptControl &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SlopeAdaptControl &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SlopeAdaptControl &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SlopeAdaptControl
{
int __IndexOf_RefCount()
{
    return 0;
}
}
