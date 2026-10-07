
namespace __INTENRAL_FC_PropEcologyInitStateTag_NS
{
    const TECSComponentDerivedPtr<FC_PropEcologyInitStateTag> DerivedPtr = TECSComponentDerivedPtr<FC_PropEcologyInitStateTag>();
    const FC_PropEcologyInitStateTag DefaultValue = FC_PropEcologyInitStateTag();

}
struct FC_PropEcologyInitStateTag : FECSComponent
{
    FC_PropEcologyInitStateTag()
    {
        return;
    }
}

namespace ECSFunc_FC_PropEcologyInitStateTag
{
UFUNCTION()
bool HasPropEcologyInitStateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyInitStateTag);
}
FC_PropEcologyInitStateTag& AssignPropEcologyInitStateTag(const FECSEntity &inout Entity, const FC_PropEcologyInitStateTag &inout DefaultValue = FC_PropEcologyInitStateTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyInitStateTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPropEcologyInitStateTag_BP(const FECSEntity &inout Entity, const FC_PropEcologyInitStateTag &inout DefaultValue = FC_PropEcologyInitStateTag())
{
    ECSFunc_FC_PropEcologyInitStateTag::AssignPropEcologyInitStateTag(Entity, DefaultValue);
    return;
}
FC_PropEcologyInitStateTag& ModifyPropEcologyInitStateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyInitStateTag));
    return local_12.GetComp();
}
FC_PropEcologyInitStateTag& ModifyOrAddPropEcologyInitStateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyInitStateTag));
    return local_12.GetComp();
}
const FC_PropEcologyInitStateTag& GetPropEcologyInitStateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyInitStateTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PropEcologyInitStateTag GetPropEcologyInitStateTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PropEcologyInitStateTag& local_4 = ECSFunc_FC_PropEcologyInitStateTag::GetPropEcologyInitStateTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PropEcologyInitStateTag();
}
const FC_PropEcologyInitStateTag GetDefaultedPropEcologyInitStateTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PropEcologyInitStateTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyInitStateTag);
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
FC_PropEcologyInitStateTag GetDefaultedPropEcologyInitStateTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PropEcologyInitStateTag::GetDefaultedPropEcologyInitStateTag(Entity);
}
UFUNCTION()
bool RemovePropEcologyInitStateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyInitStateTag);
}
}
FECSMonitorRuntimeView __GetMonitorPropEcologyInitStateTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PropEcologyInitStateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEcologyInitStateTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PropEcologyInitStateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEcologyInitStateTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PropEcologyInitStateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEcologyInitStateTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PropEcologyInitStateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEcologyInitStateTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PropEcologyInitStateTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPropEcologyInitStateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PropEcologyInitStateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropEcologyInitStateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PropEcologyInitStateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropEcologyInitStateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PropEcologyInitStateTag, bFixedFrame, Details);
    return;
}
