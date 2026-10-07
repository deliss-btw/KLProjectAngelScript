
namespace __INTENRAL_FC_GhostTrailStorage_NS
{
    const TECSComponentDerivedPtr<FC_GhostTrailStorage> DerivedPtr = TECSComponentDerivedPtr<FC_GhostTrailStorage>();
    const FC_GhostTrailStorage DefaultValue = FC_GhostTrailStorage();
}
namespace __INTENRAL_FCE_SpawnGhostTrailActor_NS
{
    const TECSEventDerivedPtr<FCE_SpawnGhostTrailActor> DerivedPtr = TECSEventDerivedPtr<FCE_SpawnGhostTrailActor>();
}
namespace __INTENRAL_FCE_ClearGhostTrailActor_NS
{
    const TECSEventDerivedPtr<FCE_ClearGhostTrailActor> DerivedPtr = TECSEventDerivedPtr<FCE_ClearGhostTrailActor>();

}
struct FC_GhostTrailStorage : FECSComponent
{
    UPROPERTY()
    TArray<AGhostTrailActor> Ghosts;

    FC_GhostTrailStorage()
    {
        return;
    }
}

struct FCE_SpawnGhostTrailActor : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Receiver;
    UPROPERTY()
    TSoftClassPtr<AGhostTrailActor> GhostClass;

    FCE_SpawnGhostTrailActor()
    {
        return;
    }
}

struct FCE_ClearGhostTrailActor : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Receiver;

    FCE_ClearGhostTrailActor()
    {
        return;
    }
}

namespace ECSFunc_FC_GhostTrailStorage
{
UFUNCTION()
bool HasGhostTrailStorage(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GhostTrailStorage);
}
FC_GhostTrailStorage& AssignGhostTrailStorage(const FECSEntity &inout Entity, const FC_GhostTrailStorage &inout DefaultValue = FC_GhostTrailStorage())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GhostTrailStorage, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGhostTrailStorage_BP(const FECSEntity &inout Entity, const FC_GhostTrailStorage &inout DefaultValue = FC_GhostTrailStorage())
{
    ECSFunc_FC_GhostTrailStorage::AssignGhostTrailStorage(Entity, DefaultValue);
    return;
}
FC_GhostTrailStorage& ModifyGhostTrailStorage(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GhostTrailStorage));
    return local_12.GetComp();
}
FC_GhostTrailStorage& ModifyOrAddGhostTrailStorage(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GhostTrailStorage));
    return local_12.GetComp();
}
const FC_GhostTrailStorage& GetGhostTrailStorage(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GhostTrailStorage));
    return local_12.GetComp();
}
UFUNCTION()
FC_GhostTrailStorage GetGhostTrailStorage_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GhostTrailStorage __r;
    bValid = false;
    bValid = ECSFunc_FC_GhostTrailStorage::GetGhostTrailStorage(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GhostTrailStorage GetDefaultedGhostTrailStorage(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GhostTrailStorage __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GhostTrailStorage);
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
FC_GhostTrailStorage GetDefaultedGhostTrailStorage_BP(const FECSEntity &inout Entity)
{
    FC_GhostTrailStorage __r;
    return __r;
}
UFUNCTION()
bool RemoveGhostTrailStorage(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GhostTrailStorage);
}
}
FECSMonitorRuntimeView __GetMonitorGhostTrailStorageOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GhostTrailStorage, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGhostTrailStorageOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GhostTrailStorage, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGhostTrailStorageOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GhostTrailStorage, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGhostTrailStorageOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GhostTrailStorage, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGhostTrailStorageOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GhostTrailStorage, bFixedFrame, bMustHandleAll);
}
void __MonitorGhostTrailStorageLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GhostTrailStorage, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGhostTrailStorageActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GhostTrailStorage, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGhostTrailStorageModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GhostTrailStorage, bFixedFrame, Details);
    return;
}
