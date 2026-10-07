
namespace __INTENRAL_FC_EcosimAIV2EntityMarkHighPriorityTag_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2EntityMarkHighPriorityTag> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2EntityMarkHighPriorityTag>();
    const FC_EcosimAIV2EntityMarkHighPriorityTag DefaultValue = FC_EcosimAIV2EntityMarkHighPriorityTag();

}
struct FC_EcosimAIV2EntityMarkHighPriorityTag : FECSComponent
{
    FC_EcosimAIV2EntityMarkHighPriorityTag()
    {
        return;
    }
}

namespace ECSFunc_FC_EcosimAIV2EntityMarkHighPriorityTag
{
UFUNCTION()
bool HasEcosimAIV2EntityMarkHighPriorityTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityMarkHighPriorityTag);
}
FC_EcosimAIV2EntityMarkHighPriorityTag& AssignEcosimAIV2EntityMarkHighPriorityTag(const FECSEntity &inout Entity, const FC_EcosimAIV2EntityMarkHighPriorityTag &inout DefaultValue = FC_EcosimAIV2EntityMarkHighPriorityTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityMarkHighPriorityTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2EntityMarkHighPriorityTag_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2EntityMarkHighPriorityTag &inout DefaultValue = FC_EcosimAIV2EntityMarkHighPriorityTag())
{
    ECSFunc_FC_EcosimAIV2EntityMarkHighPriorityTag::AssignEcosimAIV2EntityMarkHighPriorityTag(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2EntityMarkHighPriorityTag& ModifyEcosimAIV2EntityMarkHighPriorityTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityMarkHighPriorityTag));
    return local_12.GetComp();
}
FC_EcosimAIV2EntityMarkHighPriorityTag& ModifyOrAddEcosimAIV2EntityMarkHighPriorityTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityMarkHighPriorityTag));
    return local_12.GetComp();
}
const FC_EcosimAIV2EntityMarkHighPriorityTag& GetEcosimAIV2EntityMarkHighPriorityTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityMarkHighPriorityTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2EntityMarkHighPriorityTag GetEcosimAIV2EntityMarkHighPriorityTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcosimAIV2EntityMarkHighPriorityTag& local_4 = ECSFunc_FC_EcosimAIV2EntityMarkHighPriorityTag::GetEcosimAIV2EntityMarkHighPriorityTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcosimAIV2EntityMarkHighPriorityTag();
}
const FC_EcosimAIV2EntityMarkHighPriorityTag GetDefaultedEcosimAIV2EntityMarkHighPriorityTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2EntityMarkHighPriorityTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityMarkHighPriorityTag);
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
FC_EcosimAIV2EntityMarkHighPriorityTag GetDefaultedEcosimAIV2EntityMarkHighPriorityTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcosimAIV2EntityMarkHighPriorityTag::GetDefaultedEcosimAIV2EntityMarkHighPriorityTag(Entity);
}
UFUNCTION()
bool RemoveEcosimAIV2EntityMarkHighPriorityTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityMarkHighPriorityTag);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityMarkHighPriorityTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2EntityMarkHighPriorityTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityMarkHighPriorityTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2EntityMarkHighPriorityTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityMarkHighPriorityTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2EntityMarkHighPriorityTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityMarkHighPriorityTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2EntityMarkHighPriorityTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityMarkHighPriorityTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2EntityMarkHighPriorityTag, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2EntityMarkHighPriorityTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2EntityMarkHighPriorityTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2EntityMarkHighPriorityTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2EntityMarkHighPriorityTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2EntityMarkHighPriorityTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2EntityMarkHighPriorityTag, bFixedFrame, Details);
    return;
}
