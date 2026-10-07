
namespace __INTENRAL_FC_EcologyWithDOTConditionTag_NS
{
    const TECSComponentDerivedPtr<FC_EcologyWithDOTConditionTag> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyWithDOTConditionTag>();
    const FC_EcologyWithDOTConditionTag DefaultValue = FC_EcologyWithDOTConditionTag();
}
namespace __INTENRAL_FC_InactiveByConditionTag_NS
{
    const TECSComponentDerivedPtr<FC_InactiveByConditionTag> DerivedPtr = TECSComponentDerivedPtr<FC_InactiveByConditionTag>();
    const FC_InactiveByConditionTag DefaultValue = FC_InactiveByConditionTag();
}
namespace __INTENRAL_FC_EcologyConditionComponent_NS
{
    const TECSComponentDerivedPtr<FC_EcologyConditionComponent> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyConditionComponent>();
    const FC_EcologyConditionComponent DefaultValue = FC_EcologyConditionComponent();

}
struct FC_EcologyWithDOTConditionTag : FECSComponent
{
    FC_EcologyWithDOTConditionTag()
    {
        return;
    }
}

struct FC_InactiveByConditionTag : FECSComponent
{
    FC_InactiveByConditionTag()
    {
        return;
    }
}

struct FC_EcologyConditionComponent : FECSComponent
{
    UPROPERTY()
    FEcologyDOTCondition DOTCondition;
    UPROPERTY()
    bool bLastDOTConditionResult = true;
    UPROPERTY()
    bool bLastFinalResult = true;


    bool CalFinalResult()
    {
        return this.bLastDOTConditionResult;
    }
}

namespace ECSFunc_FC_EcologyWithDOTConditionTag
{
UFUNCTION()
bool HasEcologyWithDOTConditionTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyWithDOTConditionTag);
}
FC_EcologyWithDOTConditionTag& AssignEcologyWithDOTConditionTag(const FECSEntity &inout Entity, const FC_EcologyWithDOTConditionTag &inout DefaultValue = FC_EcologyWithDOTConditionTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyWithDOTConditionTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyWithDOTConditionTag_BP(const FECSEntity &inout Entity, const FC_EcologyWithDOTConditionTag &inout DefaultValue = FC_EcologyWithDOTConditionTag())
{
    ECSFunc_FC_EcologyWithDOTConditionTag::AssignEcologyWithDOTConditionTag(Entity, DefaultValue);
    return;
}
FC_EcologyWithDOTConditionTag& ModifyEcologyWithDOTConditionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyWithDOTConditionTag));
    return local_12.GetComp();
}
FC_EcologyWithDOTConditionTag& ModifyOrAddEcologyWithDOTConditionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyWithDOTConditionTag));
    return local_12.GetComp();
}
const FC_EcologyWithDOTConditionTag& GetEcologyWithDOTConditionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyWithDOTConditionTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyWithDOTConditionTag GetEcologyWithDOTConditionTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcologyWithDOTConditionTag& local_4 = ECSFunc_FC_EcologyWithDOTConditionTag::GetEcologyWithDOTConditionTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcologyWithDOTConditionTag();
}
const FC_EcologyWithDOTConditionTag GetDefaultedEcologyWithDOTConditionTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyWithDOTConditionTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyWithDOTConditionTag);
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
FC_EcologyWithDOTConditionTag GetDefaultedEcologyWithDOTConditionTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcologyWithDOTConditionTag::GetDefaultedEcologyWithDOTConditionTag(Entity);
}
UFUNCTION()
bool RemoveEcologyWithDOTConditionTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyWithDOTConditionTag);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyWithDOTConditionTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyWithDOTConditionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyWithDOTConditionTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyWithDOTConditionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyWithDOTConditionTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyWithDOTConditionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyWithDOTConditionTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyWithDOTConditionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyWithDOTConditionTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyWithDOTConditionTag, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyWithDOTConditionTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyWithDOTConditionTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyWithDOTConditionTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyWithDOTConditionTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyWithDOTConditionTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyWithDOTConditionTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_InactiveByConditionTag
{
UFUNCTION()
bool HasInactiveByConditionTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InactiveByConditionTag);
}
FC_InactiveByConditionTag& AssignInactiveByConditionTag(const FECSEntity &inout Entity, const FC_InactiveByConditionTag &inout DefaultValue = FC_InactiveByConditionTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InactiveByConditionTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInactiveByConditionTag_BP(const FECSEntity &inout Entity, const FC_InactiveByConditionTag &inout DefaultValue = FC_InactiveByConditionTag())
{
    ECSFunc_FC_InactiveByConditionTag::AssignInactiveByConditionTag(Entity, DefaultValue);
    return;
}
FC_InactiveByConditionTag& ModifyInactiveByConditionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InactiveByConditionTag));
    return local_12.GetComp();
}
FC_InactiveByConditionTag& ModifyOrAddInactiveByConditionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InactiveByConditionTag));
    return local_12.GetComp();
}
const FC_InactiveByConditionTag& GetInactiveByConditionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InactiveByConditionTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_InactiveByConditionTag GetInactiveByConditionTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_InactiveByConditionTag& local_4 = ECSFunc_FC_InactiveByConditionTag::GetInactiveByConditionTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_InactiveByConditionTag();
}
const FC_InactiveByConditionTag GetDefaultedInactiveByConditionTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InactiveByConditionTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InactiveByConditionTag);
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
FC_InactiveByConditionTag GetDefaultedInactiveByConditionTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_InactiveByConditionTag::GetDefaultedInactiveByConditionTag(Entity);
}
UFUNCTION()
bool RemoveInactiveByConditionTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InactiveByConditionTag);
}
}
FECSMonitorRuntimeView __GetMonitorInactiveByConditionTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InactiveByConditionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInactiveByConditionTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InactiveByConditionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInactiveByConditionTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InactiveByConditionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInactiveByConditionTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InactiveByConditionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInactiveByConditionTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InactiveByConditionTag, bFixedFrame, bMustHandleAll);
}
void __MonitorInactiveByConditionTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InactiveByConditionTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInactiveByConditionTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InactiveByConditionTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInactiveByConditionTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InactiveByConditionTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyConditionComponent
{
UFUNCTION()
bool HasEcologyConditionComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyConditionComponent);
}
FC_EcologyConditionComponent& AssignEcologyConditionComponent(const FECSEntity &inout Entity, const FC_EcologyConditionComponent &inout DefaultValue = FC_EcologyConditionComponent())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyConditionComponent, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyConditionComponent_BP(const FECSEntity &inout Entity, const FC_EcologyConditionComponent &inout DefaultValue = FC_EcologyConditionComponent())
{
    ECSFunc_FC_EcologyConditionComponent::AssignEcologyConditionComponent(Entity, DefaultValue);
    return;
}
FC_EcologyConditionComponent& ModifyEcologyConditionComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyConditionComponent));
    return local_12.GetComp();
}
FC_EcologyConditionComponent& ModifyOrAddEcologyConditionComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyConditionComponent));
    return local_12.GetComp();
}
const FC_EcologyConditionComponent& GetEcologyConditionComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyConditionComponent));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyConditionComponent GetEcologyConditionComponent_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyConditionComponent __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyConditionComponent::GetEcologyConditionComponent(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyConditionComponent GetDefaultedEcologyConditionComponent(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyConditionComponent __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyConditionComponent);
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
FC_EcologyConditionComponent GetDefaultedEcologyConditionComponent_BP(const FECSEntity &inout Entity)
{
    FC_EcologyConditionComponent __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyConditionComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyConditionComponent);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyConditionComponentOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyConditionComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyConditionComponentOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyConditionComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyConditionComponentOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyConditionComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyConditionComponentOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyConditionComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyConditionComponentOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyConditionComponent, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyConditionComponentLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyConditionComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyConditionComponentActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyConditionComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyConditionComponentModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyConditionComponent, bFixedFrame, Details);
    return;
}
