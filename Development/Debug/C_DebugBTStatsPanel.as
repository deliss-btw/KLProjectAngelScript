
namespace __INTENRAL_FC_DebugBTStatsPanelSync_NS
{
    const TECSComponentDerivedPtr<FC_DebugBTStatsPanelSync> DerivedPtr = TECSComponentDerivedPtr<FC_DebugBTStatsPanelSync>();
    const FC_DebugBTStatsPanelSync DefaultValue = FC_DebugBTStatsPanelSync();

}
struct FC_DebugBTStatsPanelSync : FECSComponent
{
    UPROPERTY()
    TArray<FString> StatLines;

    FC_DebugBTStatsPanelSync()
    {
        return;
    }
}

namespace ECSFunc_FC_DebugBTStatsPanelSync
{
UFUNCTION()
bool HasDebugBTStatsPanelSync(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DebugBTStatsPanelSync);
}
FC_DebugBTStatsPanelSync& AssignDebugBTStatsPanelSync(const FECSEntity &inout Entity, const FC_DebugBTStatsPanelSync &inout DefaultValue = FC_DebugBTStatsPanelSync())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DebugBTStatsPanelSync, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDebugBTStatsPanelSync_BP(const FECSEntity &inout Entity, const FC_DebugBTStatsPanelSync &inout DefaultValue = FC_DebugBTStatsPanelSync())
{
    ECSFunc_FC_DebugBTStatsPanelSync::AssignDebugBTStatsPanelSync(Entity, DefaultValue);
    return;
}
FC_DebugBTStatsPanelSync& ModifyDebugBTStatsPanelSync(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DebugBTStatsPanelSync));
    return local_12.GetComp();
}
FC_DebugBTStatsPanelSync& ModifyOrAddDebugBTStatsPanelSync(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DebugBTStatsPanelSync));
    return local_12.GetComp();
}
const FC_DebugBTStatsPanelSync& GetDebugBTStatsPanelSync(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DebugBTStatsPanelSync));
    return local_12.GetComp();
}
UFUNCTION()
FC_DebugBTStatsPanelSync GetDebugBTStatsPanelSync_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DebugBTStatsPanelSync __r;
    bValid = false;
    bValid = ECSFunc_FC_DebugBTStatsPanelSync::GetDebugBTStatsPanelSync(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DebugBTStatsPanelSync GetDefaultedDebugBTStatsPanelSync(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DebugBTStatsPanelSync __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DebugBTStatsPanelSync);
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
FC_DebugBTStatsPanelSync GetDefaultedDebugBTStatsPanelSync_BP(const FECSEntity &inout Entity)
{
    FC_DebugBTStatsPanelSync __r;
    return __r;
}
UFUNCTION()
bool RemoveDebugBTStatsPanelSync(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DebugBTStatsPanelSync);
}
}
FECSMonitorRuntimeView __GetMonitorDebugBTStatsPanelSyncOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DebugBTStatsPanelSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugBTStatsPanelSyncOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DebugBTStatsPanelSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugBTStatsPanelSyncOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DebugBTStatsPanelSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugBTStatsPanelSyncOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DebugBTStatsPanelSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugBTStatsPanelSyncOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DebugBTStatsPanelSync, bFixedFrame, bMustHandleAll);
}
void __MonitorDebugBTStatsPanelSyncLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DebugBTStatsPanelSync, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugBTStatsPanelSyncActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DebugBTStatsPanelSync, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugBTStatsPanelSyncModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DebugBTStatsPanelSync, bFixedFrame, Details);
    return;
}
