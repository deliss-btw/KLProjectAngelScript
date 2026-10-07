
namespace __INTENRAL_FC_OutlineState_NS
{
    const TECSComponentDerivedPtr<FC_OutlineState> DerivedPtr = TECSComponentDerivedPtr<FC_OutlineState>();
    const FC_OutlineState DefaultValue = FC_OutlineState();
}
namespace __INTENRAL_FC_CameraOutlinerDisableCounter_NS
{
    const TECSComponentDerivedPtr<FC_CameraOutlinerDisableCounter> DerivedPtr = TECSComponentDerivedPtr<FC_CameraOutlinerDisableCounter>();
    const FC_CameraOutlinerDisableCounter DefaultValue = FC_CameraOutlinerDisableCounter();

}
struct FC_OutlineState : FECSComponent
{
    UPROPERTY()
    bool bEnableOutline = false;


}

struct FC_CameraOutlinerDisableCounter : FECSComponent
{
    UPROPERTY()
    int Counter = 0;


}

namespace ECSFunc_FC_OutlineState
{
UFUNCTION()
bool HasOutlineState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_OutlineState);
}
FC_OutlineState& AssignOutlineState(const FECSEntity &inout Entity, const FC_OutlineState &inout DefaultValue = FC_OutlineState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_OutlineState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignOutlineState_BP(const FECSEntity &inout Entity, const FC_OutlineState &inout DefaultValue = FC_OutlineState())
{
    ECSFunc_FC_OutlineState::AssignOutlineState(Entity, DefaultValue);
    return;
}
FC_OutlineState& ModifyOutlineState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_OutlineState));
    return local_12.GetComp();
}
FC_OutlineState& ModifyOrAddOutlineState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_OutlineState));
    return local_12.GetComp();
}
const FC_OutlineState& GetOutlineState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_OutlineState));
    return local_12.GetComp();
}
UFUNCTION()
FC_OutlineState GetOutlineState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_OutlineState& local_4 = ECSFunc_FC_OutlineState::GetOutlineState(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_OutlineState();
}
const FC_OutlineState GetDefaultedOutlineState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_OutlineState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_OutlineState);
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
FC_OutlineState GetDefaultedOutlineState_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_OutlineState::GetDefaultedOutlineState(Entity);
}
UFUNCTION()
bool RemoveOutlineState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_OutlineState);
}
}
FECSMonitorRuntimeView __GetMonitorOutlineStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_OutlineState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOutlineStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_OutlineState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOutlineStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_OutlineState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOutlineStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_OutlineState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOutlineStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_OutlineState, bFixedFrame, bMustHandleAll);
}
void __MonitorOutlineStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_OutlineState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOutlineStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_OutlineState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOutlineStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_OutlineState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CameraOutlinerDisableCounter
{
UFUNCTION()
bool HasCameraOutlinerDisableCounter(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CameraOutlinerDisableCounter);
}
FC_CameraOutlinerDisableCounter& AssignCameraOutlinerDisableCounter(const FECSEntity &inout Entity, const FC_CameraOutlinerDisableCounter &inout DefaultValue = FC_CameraOutlinerDisableCounter())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CameraOutlinerDisableCounter, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCameraOutlinerDisableCounter_BP(const FECSEntity &inout Entity, const FC_CameraOutlinerDisableCounter &inout DefaultValue = FC_CameraOutlinerDisableCounter())
{
    ECSFunc_FC_CameraOutlinerDisableCounter::AssignCameraOutlinerDisableCounter(Entity, DefaultValue);
    return;
}
FC_CameraOutlinerDisableCounter& ModifyCameraOutlinerDisableCounter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CameraOutlinerDisableCounter));
    return local_12.GetComp();
}
FC_CameraOutlinerDisableCounter& ModifyOrAddCameraOutlinerDisableCounter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CameraOutlinerDisableCounter));
    return local_12.GetComp();
}
const FC_CameraOutlinerDisableCounter& GetCameraOutlinerDisableCounter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CameraOutlinerDisableCounter));
    return local_12.GetComp();
}
UFUNCTION()
FC_CameraOutlinerDisableCounter GetCameraOutlinerDisableCounter_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CameraOutlinerDisableCounter& local_4 = ECSFunc_FC_CameraOutlinerDisableCounter::GetCameraOutlinerDisableCounter(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CameraOutlinerDisableCounter();
}
const FC_CameraOutlinerDisableCounter GetDefaultedCameraOutlinerDisableCounter(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CameraOutlinerDisableCounter __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CameraOutlinerDisableCounter);
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
FC_CameraOutlinerDisableCounter GetDefaultedCameraOutlinerDisableCounter_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CameraOutlinerDisableCounter::GetDefaultedCameraOutlinerDisableCounter(Entity);
}
UFUNCTION()
bool RemoveCameraOutlinerDisableCounter(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CameraOutlinerDisableCounter);
}
}
FECSMonitorRuntimeView __GetMonitorCameraOutlinerDisableCounterOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CameraOutlinerDisableCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraOutlinerDisableCounterOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CameraOutlinerDisableCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraOutlinerDisableCounterOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CameraOutlinerDisableCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraOutlinerDisableCounterOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CameraOutlinerDisableCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraOutlinerDisableCounterOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CameraOutlinerDisableCounter, bFixedFrame, bMustHandleAll);
}
void __MonitorCameraOutlinerDisableCounterLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CameraOutlinerDisableCounter, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraOutlinerDisableCounterActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CameraOutlinerDisableCounter, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraOutlinerDisableCounterModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CameraOutlinerDisableCounter, bFixedFrame, Details);
    return;
}
