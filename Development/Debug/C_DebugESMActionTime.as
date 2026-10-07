
namespace __INTENRAL_FC_DebugESMActionTime_NS
{
    const TECSComponentDerivedPtr<FC_DebugESMActionTime> DerivedPtr = TECSComponentDerivedPtr<FC_DebugESMActionTime>();
    const FC_DebugESMActionTime DefaultValue = FC_DebugESMActionTime();

}
struct FC_DebugESMActionTime : FECSComponent
{
    UPROPERTY()
    TMap<FName, FFPTime> StartTimeMap;

    FC_DebugESMActionTime()
    {
        return;
    }
}

namespace ECSFunc_FC_DebugESMActionTime
{
UFUNCTION()
bool HasDebugESMActionTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DebugESMActionTime);
}
FC_DebugESMActionTime& AssignDebugESMActionTime(const FECSEntity &inout Entity, const FC_DebugESMActionTime &inout DefaultValue = FC_DebugESMActionTime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DebugESMActionTime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDebugESMActionTime_BP(const FECSEntity &inout Entity, const FC_DebugESMActionTime &inout DefaultValue = FC_DebugESMActionTime())
{
    ECSFunc_FC_DebugESMActionTime::AssignDebugESMActionTime(Entity, DefaultValue);
    return;
}
FC_DebugESMActionTime& ModifyDebugESMActionTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DebugESMActionTime));
    return local_12.GetComp();
}
FC_DebugESMActionTime& ModifyOrAddDebugESMActionTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DebugESMActionTime));
    return local_12.GetComp();
}
const FC_DebugESMActionTime& GetDebugESMActionTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DebugESMActionTime));
    return local_12.GetComp();
}
UFUNCTION()
FC_DebugESMActionTime GetDebugESMActionTime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DebugESMActionTime __r;
    bValid = false;
    bValid = ECSFunc_FC_DebugESMActionTime::GetDebugESMActionTime(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DebugESMActionTime GetDefaultedDebugESMActionTime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DebugESMActionTime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DebugESMActionTime);
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
FC_DebugESMActionTime GetDefaultedDebugESMActionTime_BP(const FECSEntity &inout Entity)
{
    FC_DebugESMActionTime __r;
    return __r;
}
UFUNCTION()
bool RemoveDebugESMActionTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DebugESMActionTime);
}
}
FECSMonitorRuntimeView __GetMonitorDebugESMActionTimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DebugESMActionTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugESMActionTimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DebugESMActionTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugESMActionTimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DebugESMActionTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugESMActionTimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DebugESMActionTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugESMActionTimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DebugESMActionTime, bFixedFrame, bMustHandleAll);
}
void __MonitorDebugESMActionTimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DebugESMActionTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugESMActionTimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DebugESMActionTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugESMActionTimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DebugESMActionTime, bFixedFrame, Details);
    return;
}
