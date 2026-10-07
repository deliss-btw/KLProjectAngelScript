
namespace __INTENRAL_FC_EntityGroup_NS
{
    const TECSComponentDerivedPtr<FC_EntityGroup> DerivedPtr = TECSComponentDerivedPtr<FC_EntityGroup>();
    const FC_EntityGroup DefaultValue = FC_EntityGroup();
}
namespace __INTENRAL_FC_EntityGroupPendingInitTag_NS
{
    const TECSComponentDerivedPtr<FC_EntityGroupPendingInitTag> DerivedPtr = TECSComponentDerivedPtr<FC_EntityGroupPendingInitTag>();
    const FC_EntityGroupPendingInitTag DefaultValue = FC_EntityGroupPendingInitTag();

}
struct FEntityInGroup
{
    UPROPERTY()
    TWeakObjectPtr<AECSPrefab> EntityPrefab;
    UPROPERTY()
    FECSEntity Entity;

    FEntityInGroup()
    {
        return;
    }
}

struct FC_EntityGroup : FECSComponent
{
    UPROPERTY()
    TArray<FEntityInGroup> EntityInfoList;
    UPROPERTY()
    int AliveCount = 0;


}

struct FC_EntityGroupPendingInitTag : FECSComponent
{
    FC_EntityGroupPendingInitTag()
    {
        return;
    }
}

namespace ECSFunc_FC_EntityGroup
{
UFUNCTION()
bool HasEntityGroup(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EntityGroup);
}
FC_EntityGroup& AssignEntityGroup(const FECSEntity &inout Entity, const FC_EntityGroup &inout DefaultValue = FC_EntityGroup())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EntityGroup, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEntityGroup_BP(const FECSEntity &inout Entity, const FC_EntityGroup &inout DefaultValue = FC_EntityGroup())
{
    ECSFunc_FC_EntityGroup::AssignEntityGroup(Entity, DefaultValue);
    return;
}
FC_EntityGroup& ModifyEntityGroup(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EntityGroup));
    return local_12.GetComp();
}
FC_EntityGroup& ModifyOrAddEntityGroup(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EntityGroup));
    return local_12.GetComp();
}
const FC_EntityGroup& GetEntityGroup(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EntityGroup));
    return local_12.GetComp();
}
UFUNCTION()
FC_EntityGroup GetEntityGroup_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EntityGroup __r;
    bValid = false;
    bValid = ECSFunc_FC_EntityGroup::GetEntityGroup(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EntityGroup GetDefaultedEntityGroup(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EntityGroup __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EntityGroup);
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
FC_EntityGroup GetDefaultedEntityGroup_BP(const FECSEntity &inout Entity)
{
    FC_EntityGroup __r;
    return __r;
}
UFUNCTION()
bool RemoveEntityGroup(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EntityGroup);
}
}
FECSMonitorRuntimeView __GetMonitorEntityGroupOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EntityGroup, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityGroupOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EntityGroup, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityGroupOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EntityGroup, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityGroupOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EntityGroup, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityGroupOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EntityGroup, bFixedFrame, bMustHandleAll);
}
void __MonitorEntityGroupLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EntityGroup, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityGroupActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EntityGroup, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityGroupModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EntityGroup, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EntityGroupPendingInitTag
{
UFUNCTION()
bool HasEntityGroupPendingInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EntityGroupPendingInitTag);
}
FC_EntityGroupPendingInitTag& AssignEntityGroupPendingInitTag(const FECSEntity &inout Entity, const FC_EntityGroupPendingInitTag &inout DefaultValue = FC_EntityGroupPendingInitTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EntityGroupPendingInitTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEntityGroupPendingInitTag_BP(const FECSEntity &inout Entity, const FC_EntityGroupPendingInitTag &inout DefaultValue = FC_EntityGroupPendingInitTag())
{
    ECSFunc_FC_EntityGroupPendingInitTag::AssignEntityGroupPendingInitTag(Entity, DefaultValue);
    return;
}
FC_EntityGroupPendingInitTag& ModifyEntityGroupPendingInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EntityGroupPendingInitTag));
    return local_12.GetComp();
}
FC_EntityGroupPendingInitTag& ModifyOrAddEntityGroupPendingInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EntityGroupPendingInitTag));
    return local_12.GetComp();
}
const FC_EntityGroupPendingInitTag& GetEntityGroupPendingInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EntityGroupPendingInitTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_EntityGroupPendingInitTag GetEntityGroupPendingInitTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EntityGroupPendingInitTag& local_4 = ECSFunc_FC_EntityGroupPendingInitTag::GetEntityGroupPendingInitTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EntityGroupPendingInitTag();
}
const FC_EntityGroupPendingInitTag GetDefaultedEntityGroupPendingInitTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EntityGroupPendingInitTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EntityGroupPendingInitTag);
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
FC_EntityGroupPendingInitTag GetDefaultedEntityGroupPendingInitTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EntityGroupPendingInitTag::GetDefaultedEntityGroupPendingInitTag(Entity);
}
UFUNCTION()
bool RemoveEntityGroupPendingInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EntityGroupPendingInitTag);
}
}
FECSMonitorRuntimeView __GetMonitorEntityGroupPendingInitTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EntityGroupPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityGroupPendingInitTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EntityGroupPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityGroupPendingInitTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EntityGroupPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityGroupPendingInitTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EntityGroupPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityGroupPendingInitTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EntityGroupPendingInitTag, bFixedFrame, bMustHandleAll);
}
void __MonitorEntityGroupPendingInitTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EntityGroupPendingInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityGroupPendingInitTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EntityGroupPendingInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityGroupPendingInitTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EntityGroupPendingInitTag, bFixedFrame, Details);
    return;
}
