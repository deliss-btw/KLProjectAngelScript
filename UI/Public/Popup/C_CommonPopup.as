
namespace __INTENRAL_FC_HoverNeedUpdateTag_NS
{
    const TECSComponentDerivedPtr<FC_HoverNeedUpdateTag> DerivedPtr = TECSComponentDerivedPtr<FC_HoverNeedUpdateTag>();
    const FC_HoverNeedUpdateTag DefaultValue = FC_HoverNeedUpdateTag();
}
namespace __INTENRAL_FCE_NotifyCommonPopupManagerChanged_NS
{
    const TECSEventDerivedPtr<FCE_NotifyCommonPopupManagerChanged> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyCommonPopupManagerChanged>();

}
struct FCE_NotifyCommonPopupManagerChanged : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<int> NewDisplayingPopupIds;
    UPROPERTY()
    TArray<int> RemovedPopupIds;
    UPROPERTY()
    TSet<FGameplayTag> AffectedPopupTypes;

    FCE_NotifyCommonPopupManagerChanged()
    {
        return;
    }
}

struct FC_HoverNeedUpdateTag : FECSComponent
{
    FC_HoverNeedUpdateTag()
    {
        return;
    }
}

namespace ECSFunc_FC_HoverNeedUpdateTag
{
UFUNCTION()
bool HasHoverNeedUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HoverNeedUpdateTag);
}
FC_HoverNeedUpdateTag& AssignHoverNeedUpdateTag(const FECSEntity &inout Entity, const FC_HoverNeedUpdateTag &inout DefaultValue = FC_HoverNeedUpdateTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HoverNeedUpdateTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHoverNeedUpdateTag_BP(const FECSEntity &inout Entity, const FC_HoverNeedUpdateTag &inout DefaultValue = FC_HoverNeedUpdateTag())
{
    ECSFunc_FC_HoverNeedUpdateTag::AssignHoverNeedUpdateTag(Entity, DefaultValue);
    return;
}
FC_HoverNeedUpdateTag& ModifyHoverNeedUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HoverNeedUpdateTag));
    return local_12.GetComp();
}
FC_HoverNeedUpdateTag& ModifyOrAddHoverNeedUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HoverNeedUpdateTag));
    return local_12.GetComp();
}
const FC_HoverNeedUpdateTag& GetHoverNeedUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HoverNeedUpdateTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_HoverNeedUpdateTag GetHoverNeedUpdateTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_HoverNeedUpdateTag& local_4 = ECSFunc_FC_HoverNeedUpdateTag::GetHoverNeedUpdateTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_HoverNeedUpdateTag();
}
const FC_HoverNeedUpdateTag GetDefaultedHoverNeedUpdateTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HoverNeedUpdateTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HoverNeedUpdateTag);
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
FC_HoverNeedUpdateTag GetDefaultedHoverNeedUpdateTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_HoverNeedUpdateTag::GetDefaultedHoverNeedUpdateTag(Entity);
}
UFUNCTION()
bool RemoveHoverNeedUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HoverNeedUpdateTag);
}
}
FECSMonitorRuntimeView __GetMonitorHoverNeedUpdateTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HoverNeedUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHoverNeedUpdateTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HoverNeedUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHoverNeedUpdateTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HoverNeedUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHoverNeedUpdateTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HoverNeedUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHoverNeedUpdateTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HoverNeedUpdateTag, bFixedFrame, bMustHandleAll);
}
void __MonitorHoverNeedUpdateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HoverNeedUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHoverNeedUpdateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HoverNeedUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHoverNeedUpdateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HoverNeedUpdateTag, bFixedFrame, Details);
    return;
}
