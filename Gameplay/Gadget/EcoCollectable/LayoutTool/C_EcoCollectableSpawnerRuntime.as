
namespace __INTENRAL_FC_EcoCollectableSpawnerRuntime_NS
{
    const TECSComponentDerivedPtr<FC_EcoCollectableSpawnerRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_EcoCollectableSpawnerRuntime>();
    const FC_EcoCollectableSpawnerRuntime DefaultValue = FC_EcoCollectableSpawnerRuntime();

}
struct FC_EcoCollectableSpawnerRuntime : FECSComponent
{
    UPROPERTY()
    TArray<FName> RelatedResourceNames;
    UPROPERTY()
    TMap<TDataObjectPtr<FEcoCollectableCreatureDefinitionRow>, int> CreatureDefToCountMap;
    UPROPERTY()
    TMap<TDataObjectPtr<FEcologyPropLayoutDef>, int> EcologyPropDefToCountMap;
    UPROPERTY()
    EcoCollectable::FEcoCollectableBakedData BakedData;
    UPROPERTY()
    EcologyProp::FEcologyPropBakedData BakedDataEcologyProp;

    FC_EcoCollectableSpawnerRuntime()
    {
        return;
    }
}

namespace ECSFunc_FC_EcoCollectableSpawnerRuntime
{
UFUNCTION()
bool HasEcoCollectableSpawnerRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcoCollectableSpawnerRuntime);
}
FC_EcoCollectableSpawnerRuntime& AssignEcoCollectableSpawnerRuntime(const FECSEntity &inout Entity, const FC_EcoCollectableSpawnerRuntime &inout DefaultValue = FC_EcoCollectableSpawnerRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcoCollectableSpawnerRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcoCollectableSpawnerRuntime_BP(const FECSEntity &inout Entity, const FC_EcoCollectableSpawnerRuntime &inout DefaultValue = FC_EcoCollectableSpawnerRuntime())
{
    ECSFunc_FC_EcoCollectableSpawnerRuntime::AssignEcoCollectableSpawnerRuntime(Entity, DefaultValue);
    return;
}
FC_EcoCollectableSpawnerRuntime& ModifyEcoCollectableSpawnerRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcoCollectableSpawnerRuntime));
    return local_12.GetComp();
}
FC_EcoCollectableSpawnerRuntime& ModifyOrAddEcoCollectableSpawnerRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcoCollectableSpawnerRuntime));
    return local_12.GetComp();
}
const FC_EcoCollectableSpawnerRuntime& GetEcoCollectableSpawnerRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcoCollectableSpawnerRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcoCollectableSpawnerRuntime GetEcoCollectableSpawnerRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcoCollectableSpawnerRuntime __r;
    bValid = false;
    bValid = ECSFunc_FC_EcoCollectableSpawnerRuntime::GetEcoCollectableSpawnerRuntime(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcoCollectableSpawnerRuntime GetDefaultedEcoCollectableSpawnerRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcoCollectableSpawnerRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcoCollectableSpawnerRuntime);
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
FC_EcoCollectableSpawnerRuntime GetDefaultedEcoCollectableSpawnerRuntime_BP(const FECSEntity &inout Entity)
{
    FC_EcoCollectableSpawnerRuntime __r;
    return __r;
}
UFUNCTION()
bool RemoveEcoCollectableSpawnerRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcoCollectableSpawnerRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorEcoCollectableSpawnerRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcoCollectableSpawnerRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcoCollectableSpawnerRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcoCollectableSpawnerRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcoCollectableSpawnerRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcoCollectableSpawnerRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcoCollectableSpawnerRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcoCollectableSpawnerRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcoCollectableSpawnerRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcoCollectableSpawnerRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorEcoCollectableSpawnerRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcoCollectableSpawnerRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcoCollectableSpawnerRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcoCollectableSpawnerRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcoCollectableSpawnerRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcoCollectableSpawnerRuntime, bFixedFrame, Details);
    return;
}
