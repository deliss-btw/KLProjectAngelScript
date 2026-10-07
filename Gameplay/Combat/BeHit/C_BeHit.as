
namespace __INTENRAL_FC_BeHitNeedHandleTag_NS
{
    const TECSComponentDerivedPtr<FC_BeHitNeedHandleTag> DerivedPtr = TECSComponentDerivedPtr<FC_BeHitNeedHandleTag>();
    const FC_BeHitNeedHandleTag DefaultValue = FC_BeHitNeedHandleTag();

}
struct FC_BeHitNeedHandleTag : FECSComponent
{
    FC_BeHitNeedHandleTag()
    {
        return;
    }
}

namespace ECSFunc_FC_BeHitNeedHandleTag
{
UFUNCTION()
bool HasBeHitNeedHandleTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BeHitNeedHandleTag);
}
FC_BeHitNeedHandleTag& AssignBeHitNeedHandleTag(const FECSEntity &inout Entity, const FC_BeHitNeedHandleTag &inout DefaultValue = FC_BeHitNeedHandleTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BeHitNeedHandleTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBeHitNeedHandleTag_BP(const FECSEntity &inout Entity, const FC_BeHitNeedHandleTag &inout DefaultValue = FC_BeHitNeedHandleTag())
{
    ECSFunc_FC_BeHitNeedHandleTag::AssignBeHitNeedHandleTag(Entity, DefaultValue);
    return;
}
FC_BeHitNeedHandleTag& ModifyBeHitNeedHandleTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BeHitNeedHandleTag));
    return local_12.GetComp();
}
FC_BeHitNeedHandleTag& ModifyOrAddBeHitNeedHandleTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BeHitNeedHandleTag));
    return local_12.GetComp();
}
const FC_BeHitNeedHandleTag& GetBeHitNeedHandleTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BeHitNeedHandleTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_BeHitNeedHandleTag GetBeHitNeedHandleTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BeHitNeedHandleTag& local_4 = ECSFunc_FC_BeHitNeedHandleTag::GetBeHitNeedHandleTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BeHitNeedHandleTag();
}
const FC_BeHitNeedHandleTag GetDefaultedBeHitNeedHandleTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BeHitNeedHandleTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BeHitNeedHandleTag);
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
FC_BeHitNeedHandleTag GetDefaultedBeHitNeedHandleTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BeHitNeedHandleTag::GetDefaultedBeHitNeedHandleTag(Entity);
}
UFUNCTION()
bool RemoveBeHitNeedHandleTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BeHitNeedHandleTag);
}
}
FECSMonitorRuntimeView __GetMonitorBeHitNeedHandleTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BeHitNeedHandleTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeHitNeedHandleTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BeHitNeedHandleTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeHitNeedHandleTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BeHitNeedHandleTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeHitNeedHandleTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BeHitNeedHandleTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeHitNeedHandleTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BeHitNeedHandleTag, bFixedFrame, bMustHandleAll);
}
void __MonitorBeHitNeedHandleTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BeHitNeedHandleTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeHitNeedHandleTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BeHitNeedHandleTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeHitNeedHandleTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BeHitNeedHandleTag, bFixedFrame, Details);
    return;
}
