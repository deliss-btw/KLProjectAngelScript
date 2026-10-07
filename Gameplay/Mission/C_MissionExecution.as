
namespace __INTENRAL_FC_MissionExecution_NS
{
    const TECSComponentDerivedPtr<FC_MissionExecution> DerivedPtr = TECSComponentDerivedPtr<FC_MissionExecution>();
    const FC_MissionExecution DefaultValue = FC_MissionExecution();
}
namespace __INTENRAL_FC_MissionClientExecution_NS
{
    const TECSComponentDerivedPtr<FC_MissionClientExecution> DerivedPtr = TECSComponentDerivedPtr<FC_MissionClientExecution>();
    const FC_MissionClientExecution DefaultValue = FC_MissionClientExecution();
}
namespace __INTENRAL_FCS_MissionExecutionManager_NS
{
    const TECSComponentDerivedPtr<FCS_MissionExecutionManager> DerivedPtr = TECSComponentDerivedPtr<FCS_MissionExecutionManager>();
    const FCS_MissionExecutionManager DefaultValue = FCS_MissionExecutionManager();
}
namespace __INTENRAL_FCE_MissionExecutionCompleted_NS
{
    const TECSEventDerivedPtr<FCE_MissionExecutionCompleted> DerivedPtr = TECSEventDerivedPtr<FCE_MissionExecutionCompleted>();

}
struct FC_MissionExecution : FECSComponent
{
    UPROPERTY()
    TMap<int, FMissionExecutionEntry> ExecutionEntries;

    FC_MissionExecution()
    {
        return;
    }
}

struct FC_MissionClientExecution : FECSComponent
{
    UPROPERTY()
    TArray<FMissionExecutionEntry> ExecutionEntries;

    FC_MissionClientExecution()
    {
        return;
    }
}

struct FCS_MissionExecutionManager : FECSSingleton
{
    UPROPERTY()
    int NextEntryId = 1;


}

struct FCE_MissionExecutionCompleted : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int ExecutionEntryId;
    UPROPERTY()
    TArray<EMissionActionStatus> ActionStatuses;


}

namespace ECSFunc_FC_MissionExecution
{
UFUNCTION()
bool HasMissionExecution(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MissionExecution);
}
FC_MissionExecution& AssignMissionExecution(const FECSEntity &inout Entity, const FC_MissionExecution &inout DefaultValue = FC_MissionExecution())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MissionExecution, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMissionExecution_BP(const FECSEntity &inout Entity, const FC_MissionExecution &inout DefaultValue = FC_MissionExecution())
{
    ECSFunc_FC_MissionExecution::AssignMissionExecution(Entity, DefaultValue);
    return;
}
FC_MissionExecution& ModifyMissionExecution(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MissionExecution));
    return local_12.GetComp();
}
FC_MissionExecution& ModifyOrAddMissionExecution(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MissionExecution));
    return local_12.GetComp();
}
const FC_MissionExecution& GetMissionExecution(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MissionExecution));
    return local_12.GetComp();
}
UFUNCTION()
FC_MissionExecution GetMissionExecution_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_MissionExecution __r;
    bValid = false;
    bValid = ECSFunc_FC_MissionExecution::GetMissionExecution(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_MissionExecution GetDefaultedMissionExecution(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MissionExecution __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MissionExecution);
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
FC_MissionExecution GetDefaultedMissionExecution_BP(const FECSEntity &inout Entity)
{
    FC_MissionExecution __r;
    return __r;
}
UFUNCTION()
bool RemoveMissionExecution(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MissionExecution);
}
}
FECSMonitorRuntimeView __GetMonitorMissionExecutionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MissionExecution, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMissionExecutionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MissionExecution, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMissionExecutionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MissionExecution, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMissionExecutionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MissionExecution, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMissionExecutionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MissionExecution, bFixedFrame, bMustHandleAll);
}
void __MonitorMissionExecutionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MissionExecution, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMissionExecutionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MissionExecution, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMissionExecutionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MissionExecution, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MissionClientExecution
{
UFUNCTION()
bool HasMissionClientExecution(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MissionClientExecution);
}
FC_MissionClientExecution& AssignMissionClientExecution(const FECSEntity &inout Entity, const FC_MissionClientExecution &inout DefaultValue = FC_MissionClientExecution())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MissionClientExecution, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMissionClientExecution_BP(const FECSEntity &inout Entity, const FC_MissionClientExecution &inout DefaultValue = FC_MissionClientExecution())
{
    ECSFunc_FC_MissionClientExecution::AssignMissionClientExecution(Entity, DefaultValue);
    return;
}
FC_MissionClientExecution& ModifyMissionClientExecution(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MissionClientExecution));
    return local_12.GetComp();
}
FC_MissionClientExecution& ModifyOrAddMissionClientExecution(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MissionClientExecution));
    return local_12.GetComp();
}
const FC_MissionClientExecution& GetMissionClientExecution(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MissionClientExecution));
    return local_12.GetComp();
}
UFUNCTION()
FC_MissionClientExecution GetMissionClientExecution_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_MissionClientExecution __r;
    bValid = false;
    bValid = ECSFunc_FC_MissionClientExecution::GetMissionClientExecution(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_MissionClientExecution GetDefaultedMissionClientExecution(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MissionClientExecution __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MissionClientExecution);
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
FC_MissionClientExecution GetDefaultedMissionClientExecution_BP(const FECSEntity &inout Entity)
{
    FC_MissionClientExecution __r;
    return __r;
}
UFUNCTION()
bool RemoveMissionClientExecution(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MissionClientExecution);
}
}
FECSMonitorRuntimeView __GetMonitorMissionClientExecutionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MissionClientExecution, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMissionClientExecutionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MissionClientExecution, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMissionClientExecutionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MissionClientExecution, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMissionClientExecutionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MissionClientExecution, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMissionClientExecutionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MissionClientExecution, bFixedFrame, bMustHandleAll);
}
void __MonitorMissionClientExecutionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MissionClientExecution, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMissionClientExecutionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MissionClientExecution, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMissionClientExecutionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MissionClientExecution, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_MissionExecutionManager
{
UFUNCTION()
bool HasMissionExecutionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_MissionExecutionManager);
}
FCS_MissionExecutionManager& AssignMissionExecutionManager(const FECSWorldPtr &inout World, const FCS_MissionExecutionManager &inout DefaultValue = FCS_MissionExecutionManager())
{
    UScriptStruct local_6 = FCS_MissionExecutionManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignMissionExecutionManager_BP(const FECSWorldPtr &inout World, const FCS_MissionExecutionManager &inout DefaultValue = FCS_MissionExecutionManager())
{
    ECSFunc_FCS_MissionExecutionManager::AssignMissionExecutionManager(World, DefaultValue);
    return;
}
FCS_MissionExecutionManager& ModifyMissionExecutionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_MissionExecutionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_MissionExecutionManager& ModifyOrAddMissionExecutionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_MissionExecutionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_MissionExecutionManager& GetMissionExecutionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_MissionExecutionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_MissionExecutionManager GetMissionExecutionManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_MissionExecutionManager& local_4 = ECSFunc_FCS_MissionExecutionManager::GetMissionExecutionManager(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_MissionExecutionManager();
}
const FCS_MissionExecutionManager GetDefaultedMissionExecutionManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_MissionExecutionManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_MissionExecutionManager);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_MissionExecutionManager GetDefaultedMissionExecutionManager_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_MissionExecutionManager::GetDefaultedMissionExecutionManager(World);
}
UFUNCTION()
bool RemoveMissionExecutionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_MissionExecutionManager);
}
}
void __MonitorMissionExecutionManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_MissionExecutionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMissionExecutionManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_MissionExecutionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMissionExecutionManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_MissionExecutionManager, bFixedFrame, Details);
    return;
}
