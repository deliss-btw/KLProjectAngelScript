
namespace __INTENRAL_FC_GOAP_NS
{
    const TECSComponentDerivedPtr<FC_GOAP> DerivedPtr = TECSComponentDerivedPtr<FC_GOAP>();
    const FC_GOAP DefaultValue = FC_GOAP();

}
struct FC_GOAP : FECSComponent
{
    UPROPERTY()
    UECSGOAPInstanceBase Instance;

    FC_GOAP()
    {
        return;
    }
}

namespace ECSFunc_FC_GOAP
{
UFUNCTION()
bool HasGOAP(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GOAP);
}
FC_GOAP& AssignGOAP(const FECSEntity &inout Entity, const FC_GOAP &inout DefaultValue = FC_GOAP())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GOAP, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGOAP_BP(const FECSEntity &inout Entity, const FC_GOAP &inout DefaultValue = FC_GOAP())
{
    ECSFunc_FC_GOAP::AssignGOAP(Entity, DefaultValue);
    return;
}
FC_GOAP& ModifyGOAP(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GOAP));
    return local_12.GetComp();
}
FC_GOAP& ModifyOrAddGOAP(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GOAP));
    return local_12.GetComp();
}
const FC_GOAP& GetGOAP(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GOAP));
    return local_12.GetComp();
}
UFUNCTION()
FC_GOAP GetGOAP_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GOAP& local_4 = ECSFunc_FC_GOAP::GetGOAP(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GOAP();
}
const FC_GOAP GetDefaultedGOAP(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GOAP __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GOAP);
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
FC_GOAP GetDefaultedGOAP_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GOAP::GetDefaultedGOAP(Entity);
}
UFUNCTION()
bool RemoveGOAP(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GOAP);
}
}
FECSMonitorRuntimeView __GetMonitorGOAPOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GOAP, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGOAPOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GOAP, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGOAPOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GOAP, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGOAPOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GOAP, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGOAPOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GOAP, bFixedFrame, bMustHandleAll);
}
void __MonitorGOAPLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GOAP, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGOAPActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GOAP, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGOAPModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GOAP, bFixedFrame, Details);
    return;
}
