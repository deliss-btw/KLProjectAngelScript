
namespace __INTENRAL_FC_GameplayInventoryDefaultItemsInitializedTag_NS
{
    const TECSComponentDerivedPtr<FC_GameplayInventoryDefaultItemsInitializedTag> DerivedPtr = TECSComponentDerivedPtr<FC_GameplayInventoryDefaultItemsInitializedTag>();
    const FC_GameplayInventoryDefaultItemsInitializedTag DefaultValue = FC_GameplayInventoryDefaultItemsInitializedTag();

}
struct FC_GameplayInventoryDefaultItemsInitializedTag : FECSComponent
{
    FC_GameplayInventoryDefaultItemsInitializedTag()
    {
        return;
    }
}

namespace ECSFunc_FC_GameplayInventoryDefaultItemsInitializedTag
{
UFUNCTION()
bool HasGameplayInventoryDefaultItemsInitializedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryDefaultItemsInitializedTag);
}
FC_GameplayInventoryDefaultItemsInitializedTag& AssignGameplayInventoryDefaultItemsInitializedTag(const FECSEntity &inout Entity, const FC_GameplayInventoryDefaultItemsInitializedTag &inout DefaultValue = FC_GameplayInventoryDefaultItemsInitializedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryDefaultItemsInitializedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGameplayInventoryDefaultItemsInitializedTag_BP(const FECSEntity &inout Entity, const FC_GameplayInventoryDefaultItemsInitializedTag &inout DefaultValue = FC_GameplayInventoryDefaultItemsInitializedTag())
{
    ECSFunc_FC_GameplayInventoryDefaultItemsInitializedTag::AssignGameplayInventoryDefaultItemsInitializedTag(Entity, DefaultValue);
    return;
}
FC_GameplayInventoryDefaultItemsInitializedTag& ModifyGameplayInventoryDefaultItemsInitializedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryDefaultItemsInitializedTag));
    return local_12.GetComp();
}
FC_GameplayInventoryDefaultItemsInitializedTag& ModifyOrAddGameplayInventoryDefaultItemsInitializedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryDefaultItemsInitializedTag));
    return local_12.GetComp();
}
const FC_GameplayInventoryDefaultItemsInitializedTag& GetGameplayInventoryDefaultItemsInitializedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryDefaultItemsInitializedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_GameplayInventoryDefaultItemsInitializedTag GetGameplayInventoryDefaultItemsInitializedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GameplayInventoryDefaultItemsInitializedTag& local_4 = ECSFunc_FC_GameplayInventoryDefaultItemsInitializedTag::GetGameplayInventoryDefaultItemsInitializedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GameplayInventoryDefaultItemsInitializedTag();
}
const FC_GameplayInventoryDefaultItemsInitializedTag GetDefaultedGameplayInventoryDefaultItemsInitializedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GameplayInventoryDefaultItemsInitializedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryDefaultItemsInitializedTag);
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
FC_GameplayInventoryDefaultItemsInitializedTag GetDefaultedGameplayInventoryDefaultItemsInitializedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GameplayInventoryDefaultItemsInitializedTag::GetDefaultedGameplayInventoryDefaultItemsInitializedTag(Entity);
}
UFUNCTION()
bool RemoveGameplayInventoryDefaultItemsInitializedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryDefaultItemsInitializedTag);
}
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryDefaultItemsInitializedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GameplayInventoryDefaultItemsInitializedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryDefaultItemsInitializedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GameplayInventoryDefaultItemsInitializedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryDefaultItemsInitializedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GameplayInventoryDefaultItemsInitializedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryDefaultItemsInitializedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GameplayInventoryDefaultItemsInitializedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryDefaultItemsInitializedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GameplayInventoryDefaultItemsInitializedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorGameplayInventoryDefaultItemsInitializedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GameplayInventoryDefaultItemsInitializedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameplayInventoryDefaultItemsInitializedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GameplayInventoryDefaultItemsInitializedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameplayInventoryDefaultItemsInitializedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GameplayInventoryDefaultItemsInitializedTag, bFixedFrame, Details);
    return;
}
