
namespace __INTENRAL_FC_LookRequestLocal_NS
{
    const TECSComponentDerivedPtr<FC_LookRequestLocal> DerivedPtr = TECSComponentDerivedPtr<FC_LookRequestLocal>();
    const FC_LookRequestLocal DefaultValue = FC_LookRequestLocal();
}
namespace __INTENRAL_FC_LookRequestViewLocal_NS
{
    const TECSComponentDerivedPtr<FC_LookRequestViewLocal> DerivedPtr = TECSComponentDerivedPtr<FC_LookRequestViewLocal>();
    const FC_LookRequestViewLocal DefaultValue = FC_LookRequestViewLocal();

}
struct FC_LookRequestLocal : FECSComponent
{
    UPROPERTY()
    TArray<FLookRequestEntry> RequestArray;

    FC_LookRequestLocal()
    {
        return;
    }
}

struct FC_LookRequestViewLocal : FECSComponent
{
    UPROPERTY()
    TArray<FLookRequestEntry> RequestArray;

    FC_LookRequestViewLocal()
    {
        return;
    }
}

namespace ECSFunc_FC_LookRequestLocal
{
UFUNCTION()
bool HasLookRequestLocal(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LookRequestLocal);
}
FC_LookRequestLocal& AssignLookRequestLocal(const FECSEntity &inout Entity, const FC_LookRequestLocal &inout DefaultValue = FC_LookRequestLocal())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LookRequestLocal, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLookRequestLocal_BP(const FECSEntity &inout Entity, const FC_LookRequestLocal &inout DefaultValue = FC_LookRequestLocal())
{
    ECSFunc_FC_LookRequestLocal::AssignLookRequestLocal(Entity, DefaultValue);
    return;
}
FC_LookRequestLocal& ModifyLookRequestLocal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LookRequestLocal));
    return local_12.GetComp();
}
FC_LookRequestLocal& ModifyOrAddLookRequestLocal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LookRequestLocal));
    return local_12.GetComp();
}
const FC_LookRequestLocal& GetLookRequestLocal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LookRequestLocal));
    return local_12.GetComp();
}
UFUNCTION()
FC_LookRequestLocal GetLookRequestLocal_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LookRequestLocal __r;
    bValid = false;
    bValid = ECSFunc_FC_LookRequestLocal::GetLookRequestLocal(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LookRequestLocal GetDefaultedLookRequestLocal(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LookRequestLocal __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LookRequestLocal);
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
FC_LookRequestLocal GetDefaultedLookRequestLocal_BP(const FECSEntity &inout Entity)
{
    FC_LookRequestLocal __r;
    return __r;
}
UFUNCTION()
bool RemoveLookRequestLocal(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LookRequestLocal);
}
}
FECSMonitorRuntimeView __GetMonitorLookRequestLocalOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LookRequestLocal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestLocalOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LookRequestLocal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestLocalOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LookRequestLocal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestLocalOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LookRequestLocal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestLocalOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LookRequestLocal, bFixedFrame, bMustHandleAll);
}
void __MonitorLookRequestLocalLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LookRequestLocal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLookRequestLocalActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LookRequestLocal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLookRequestLocalModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LookRequestLocal, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LookRequestViewLocal
{
UFUNCTION()
bool HasLookRequestViewLocal(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LookRequestViewLocal);
}
FC_LookRequestViewLocal& AssignLookRequestViewLocal(const FECSEntity &inout Entity, const FC_LookRequestViewLocal &inout DefaultValue = FC_LookRequestViewLocal())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LookRequestViewLocal, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLookRequestViewLocal_BP(const FECSEntity &inout Entity, const FC_LookRequestViewLocal &inout DefaultValue = FC_LookRequestViewLocal())
{
    ECSFunc_FC_LookRequestViewLocal::AssignLookRequestViewLocal(Entity, DefaultValue);
    return;
}
FC_LookRequestViewLocal& ModifyLookRequestViewLocal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LookRequestViewLocal));
    return local_12.GetComp();
}
FC_LookRequestViewLocal& ModifyOrAddLookRequestViewLocal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LookRequestViewLocal));
    return local_12.GetComp();
}
const FC_LookRequestViewLocal& GetLookRequestViewLocal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LookRequestViewLocal));
    return local_12.GetComp();
}
UFUNCTION()
FC_LookRequestViewLocal GetLookRequestViewLocal_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LookRequestViewLocal __r;
    bValid = false;
    bValid = ECSFunc_FC_LookRequestViewLocal::GetLookRequestViewLocal(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LookRequestViewLocal GetDefaultedLookRequestViewLocal(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LookRequestViewLocal __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LookRequestViewLocal);
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
FC_LookRequestViewLocal GetDefaultedLookRequestViewLocal_BP(const FECSEntity &inout Entity)
{
    FC_LookRequestViewLocal __r;
    return __r;
}
UFUNCTION()
bool RemoveLookRequestViewLocal(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LookRequestViewLocal);
}
}
FECSMonitorRuntimeView __GetMonitorLookRequestViewLocalOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LookRequestViewLocal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestViewLocalOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LookRequestViewLocal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestViewLocalOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LookRequestViewLocal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestViewLocalOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LookRequestViewLocal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestViewLocalOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LookRequestViewLocal, bFixedFrame, bMustHandleAll);
}
void __MonitorLookRequestViewLocalLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LookRequestViewLocal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLookRequestViewLocalActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LookRequestViewLocal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLookRequestViewLocalModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LookRequestViewLocal, bFixedFrame, Details);
    return;
}
