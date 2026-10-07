
namespace __INTENRAL_FC_EcologyPropPendingInitSpawnerInfoTag_NS
{
    const TECSComponentDerivedPtr<FC_EcologyPropPendingInitSpawnerInfoTag> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyPropPendingInitSpawnerInfoTag>();
    const FC_EcologyPropPendingInitSpawnerInfoTag DefaultValue = FC_EcologyPropPendingInitSpawnerInfoTag();
}
namespace __INTENRAL_FC_EcologyPropPendingInitActivationStateTag_NS
{
    const TECSComponentDerivedPtr<FC_EcologyPropPendingInitActivationStateTag> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyPropPendingInitActivationStateTag>();
    const FC_EcologyPropPendingInitActivationStateTag DefaultValue = FC_EcologyPropPendingInitActivationStateTag();

}
struct FC_EcologyPropPendingInitSpawnerInfoTag : FECSComponent
{
    FC_EcologyPropPendingInitSpawnerInfoTag()
    {
        return;
    }
}

struct FC_EcologyPropPendingInitActivationStateTag : FECSComponent
{
    FC_EcologyPropPendingInitActivationStateTag()
    {
        return;
    }
}

namespace ECSFunc_FC_EcologyPropPendingInitSpawnerInfoTag
{
UFUNCTION()
bool HasEcologyPropPendingInitSpawnerInfoTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropPendingInitSpawnerInfoTag);
}
FC_EcologyPropPendingInitSpawnerInfoTag& AssignEcologyPropPendingInitSpawnerInfoTag(const FECSEntity &inout Entity, const FC_EcologyPropPendingInitSpawnerInfoTag &inout DefaultValue = FC_EcologyPropPendingInitSpawnerInfoTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropPendingInitSpawnerInfoTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyPropPendingInitSpawnerInfoTag_BP(const FECSEntity &inout Entity, const FC_EcologyPropPendingInitSpawnerInfoTag &inout DefaultValue = FC_EcologyPropPendingInitSpawnerInfoTag())
{
    ECSFunc_FC_EcologyPropPendingInitSpawnerInfoTag::AssignEcologyPropPendingInitSpawnerInfoTag(Entity, DefaultValue);
    return;
}
FC_EcologyPropPendingInitSpawnerInfoTag& ModifyEcologyPropPendingInitSpawnerInfoTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropPendingInitSpawnerInfoTag));
    return local_12.GetComp();
}
FC_EcologyPropPendingInitSpawnerInfoTag& ModifyOrAddEcologyPropPendingInitSpawnerInfoTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropPendingInitSpawnerInfoTag));
    return local_12.GetComp();
}
const FC_EcologyPropPendingInitSpawnerInfoTag& GetEcologyPropPendingInitSpawnerInfoTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropPendingInitSpawnerInfoTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyPropPendingInitSpawnerInfoTag GetEcologyPropPendingInitSpawnerInfoTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcologyPropPendingInitSpawnerInfoTag& local_4 = ECSFunc_FC_EcologyPropPendingInitSpawnerInfoTag::GetEcologyPropPendingInitSpawnerInfoTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcologyPropPendingInitSpawnerInfoTag();
}
const FC_EcologyPropPendingInitSpawnerInfoTag GetDefaultedEcologyPropPendingInitSpawnerInfoTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyPropPendingInitSpawnerInfoTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropPendingInitSpawnerInfoTag);
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
FC_EcologyPropPendingInitSpawnerInfoTag GetDefaultedEcologyPropPendingInitSpawnerInfoTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcologyPropPendingInitSpawnerInfoTag::GetDefaultedEcologyPropPendingInitSpawnerInfoTag(Entity);
}
UFUNCTION()
bool RemoveEcologyPropPendingInitSpawnerInfoTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropPendingInitSpawnerInfoTag);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyPropPendingInitSpawnerInfoTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyPropPendingInitSpawnerInfoTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPropPendingInitSpawnerInfoTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyPropPendingInitSpawnerInfoTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPropPendingInitSpawnerInfoTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyPropPendingInitSpawnerInfoTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPropPendingInitSpawnerInfoTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyPropPendingInitSpawnerInfoTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPropPendingInitSpawnerInfoTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyPropPendingInitSpawnerInfoTag, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyPropPendingInitSpawnerInfoTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyPropPendingInitSpawnerInfoTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyPropPendingInitSpawnerInfoTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyPropPendingInitSpawnerInfoTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyPropPendingInitSpawnerInfoTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyPropPendingInitSpawnerInfoTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyPropPendingInitActivationStateTag
{
UFUNCTION()
bool HasEcologyPropPendingInitActivationStateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropPendingInitActivationStateTag);
}
FC_EcologyPropPendingInitActivationStateTag& AssignEcologyPropPendingInitActivationStateTag(const FECSEntity &inout Entity, const FC_EcologyPropPendingInitActivationStateTag &inout DefaultValue = FC_EcologyPropPendingInitActivationStateTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropPendingInitActivationStateTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyPropPendingInitActivationStateTag_BP(const FECSEntity &inout Entity, const FC_EcologyPropPendingInitActivationStateTag &inout DefaultValue = FC_EcologyPropPendingInitActivationStateTag())
{
    ECSFunc_FC_EcologyPropPendingInitActivationStateTag::AssignEcologyPropPendingInitActivationStateTag(Entity, DefaultValue);
    return;
}
FC_EcologyPropPendingInitActivationStateTag& ModifyEcologyPropPendingInitActivationStateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropPendingInitActivationStateTag));
    return local_12.GetComp();
}
FC_EcologyPropPendingInitActivationStateTag& ModifyOrAddEcologyPropPendingInitActivationStateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropPendingInitActivationStateTag));
    return local_12.GetComp();
}
const FC_EcologyPropPendingInitActivationStateTag& GetEcologyPropPendingInitActivationStateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropPendingInitActivationStateTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyPropPendingInitActivationStateTag GetEcologyPropPendingInitActivationStateTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcologyPropPendingInitActivationStateTag& local_4 = ECSFunc_FC_EcologyPropPendingInitActivationStateTag::GetEcologyPropPendingInitActivationStateTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcologyPropPendingInitActivationStateTag();
}
const FC_EcologyPropPendingInitActivationStateTag GetDefaultedEcologyPropPendingInitActivationStateTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyPropPendingInitActivationStateTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropPendingInitActivationStateTag);
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
FC_EcologyPropPendingInitActivationStateTag GetDefaultedEcologyPropPendingInitActivationStateTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcologyPropPendingInitActivationStateTag::GetDefaultedEcologyPropPendingInitActivationStateTag(Entity);
}
UFUNCTION()
bool RemoveEcologyPropPendingInitActivationStateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropPendingInitActivationStateTag);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyPropPendingInitActivationStateTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyPropPendingInitActivationStateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPropPendingInitActivationStateTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyPropPendingInitActivationStateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPropPendingInitActivationStateTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyPropPendingInitActivationStateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPropPendingInitActivationStateTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyPropPendingInitActivationStateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPropPendingInitActivationStateTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyPropPendingInitActivationStateTag, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyPropPendingInitActivationStateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyPropPendingInitActivationStateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyPropPendingInitActivationStateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyPropPendingInitActivationStateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyPropPendingInitActivationStateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyPropPendingInitActivationStateTag, bFixedFrame, Details);
    return;
}
