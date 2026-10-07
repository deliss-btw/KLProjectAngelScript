
namespace __INTENRAL_FC_HTNRuningTag_NS
{
    const TECSComponentDerivedPtr<FC_HTNRuningTag> DerivedPtr = TECSComponentDerivedPtr<FC_HTNRuningTag>();
    const FC_HTNRuningTag DefaultValue = FC_HTNRuningTag();
}
namespace __INTENRAL_FC_HTNNeedRestartTag_NS
{
    const TECSComponentDerivedPtr<FC_HTNNeedRestartTag> DerivedPtr = TECSComponentDerivedPtr<FC_HTNNeedRestartTag>();
    const FC_HTNNeedRestartTag DefaultValue = FC_HTNNeedRestartTag();
}
namespace __INTENRAL_FCE_HTNInterrupt_NS
{
    const TECSEventDerivedPtr<FCE_HTNInterrupt> DerivedPtr = TECSEventDerivedPtr<FCE_HTNInterrupt>();

}
struct FC_HTNRuningTag : FECSComponent
{
    FC_HTNRuningTag()
    {
        return;
    }
}

struct FC_HTNNeedRestartTag : FECSComponent
{
    FC_HTNNeedRestartTag()
    {
        return;
    }
}

struct FCE_HTNInterrupt : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FGameplayTag Tag;
    UPROPERTY()
    FECSEntityId TargetId;

    FCE_HTNInterrupt()
    {
        return;
    }
}

namespace ECSFunc_FC_HTNRuningTag
{
UFUNCTION()
bool HasHTNRuningTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HTNRuningTag);
}
FC_HTNRuningTag& AssignHTNRuningTag(const FECSEntity &inout Entity, const FC_HTNRuningTag &inout DefaultValue = FC_HTNRuningTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HTNRuningTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHTNRuningTag_BP(const FECSEntity &inout Entity, const FC_HTNRuningTag &inout DefaultValue = FC_HTNRuningTag())
{
    ECSFunc_FC_HTNRuningTag::AssignHTNRuningTag(Entity, DefaultValue);
    return;
}
FC_HTNRuningTag& ModifyHTNRuningTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HTNRuningTag));
    return local_12.GetComp();
}
FC_HTNRuningTag& ModifyOrAddHTNRuningTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HTNRuningTag));
    return local_12.GetComp();
}
const FC_HTNRuningTag& GetHTNRuningTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HTNRuningTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_HTNRuningTag GetHTNRuningTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_HTNRuningTag& local_4 = ECSFunc_FC_HTNRuningTag::GetHTNRuningTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_HTNRuningTag();
}
const FC_HTNRuningTag GetDefaultedHTNRuningTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HTNRuningTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HTNRuningTag);
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
FC_HTNRuningTag GetDefaultedHTNRuningTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_HTNRuningTag::GetDefaultedHTNRuningTag(Entity);
}
UFUNCTION()
bool RemoveHTNRuningTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HTNRuningTag);
}
}
FECSMonitorRuntimeView __GetMonitorHTNRuningTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HTNRuningTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHTNRuningTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HTNRuningTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHTNRuningTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HTNRuningTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHTNRuningTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HTNRuningTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHTNRuningTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HTNRuningTag, bFixedFrame, bMustHandleAll);
}
void __MonitorHTNRuningTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HTNRuningTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHTNRuningTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HTNRuningTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHTNRuningTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HTNRuningTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_HTNNeedRestartTag
{
UFUNCTION()
bool HasHTNNeedRestartTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HTNNeedRestartTag);
}
FC_HTNNeedRestartTag& AssignHTNNeedRestartTag(const FECSEntity &inout Entity, const FC_HTNNeedRestartTag &inout DefaultValue = FC_HTNNeedRestartTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HTNNeedRestartTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHTNNeedRestartTag_BP(const FECSEntity &inout Entity, const FC_HTNNeedRestartTag &inout DefaultValue = FC_HTNNeedRestartTag())
{
    ECSFunc_FC_HTNNeedRestartTag::AssignHTNNeedRestartTag(Entity, DefaultValue);
    return;
}
FC_HTNNeedRestartTag& ModifyHTNNeedRestartTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HTNNeedRestartTag));
    return local_12.GetComp();
}
FC_HTNNeedRestartTag& ModifyOrAddHTNNeedRestartTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HTNNeedRestartTag));
    return local_12.GetComp();
}
const FC_HTNNeedRestartTag& GetHTNNeedRestartTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HTNNeedRestartTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_HTNNeedRestartTag GetHTNNeedRestartTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_HTNNeedRestartTag& local_4 = ECSFunc_FC_HTNNeedRestartTag::GetHTNNeedRestartTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_HTNNeedRestartTag();
}
const FC_HTNNeedRestartTag GetDefaultedHTNNeedRestartTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HTNNeedRestartTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HTNNeedRestartTag);
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
FC_HTNNeedRestartTag GetDefaultedHTNNeedRestartTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_HTNNeedRestartTag::GetDefaultedHTNNeedRestartTag(Entity);
}
UFUNCTION()
bool RemoveHTNNeedRestartTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HTNNeedRestartTag);
}
}
FECSMonitorRuntimeView __GetMonitorHTNNeedRestartTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HTNNeedRestartTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHTNNeedRestartTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HTNNeedRestartTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHTNNeedRestartTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HTNNeedRestartTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHTNNeedRestartTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HTNNeedRestartTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHTNNeedRestartTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HTNNeedRestartTag, bFixedFrame, bMustHandleAll);
}
void __MonitorHTNNeedRestartTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HTNNeedRestartTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHTNNeedRestartTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HTNNeedRestartTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHTNNeedRestartTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HTNNeedRestartTag, bFixedFrame, Details);
    return;
}
