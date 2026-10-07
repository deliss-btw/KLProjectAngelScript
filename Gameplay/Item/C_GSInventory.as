
namespace __INTENRAL_FC_GSInventory_NS
{
    const TECSComponentDerivedPtr<FC_GSInventory> DerivedPtr = TECSComponentDerivedPtr<FC_GSInventory>();
    const FC_GSInventory DefaultValue = FC_GSInventory();

}
struct FC_GSInventory : FECSComponent
{
    UPROPERTY()
    uint GSAddItemMsgIndex;


}

namespace ECSFunc_FC_GSInventory
{
UFUNCTION()
bool HasGSInventory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GSInventory);
}
FC_GSInventory& AssignGSInventory(const FECSEntity &inout Entity, const FC_GSInventory &inout DefaultValue = FC_GSInventory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GSInventory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGSInventory_BP(const FECSEntity &inout Entity, const FC_GSInventory &inout DefaultValue = FC_GSInventory())
{
    ECSFunc_FC_GSInventory::AssignGSInventory(Entity, DefaultValue);
    return;
}
FC_GSInventory& ModifyGSInventory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GSInventory));
    return local_12.GetComp();
}
FC_GSInventory& ModifyOrAddGSInventory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GSInventory));
    return local_12.GetComp();
}
const FC_GSInventory& GetGSInventory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GSInventory));
    return local_12.GetComp();
}
UFUNCTION()
FC_GSInventory GetGSInventory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GSInventory& local_4 = ECSFunc_FC_GSInventory::GetGSInventory(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GSInventory();
}
const FC_GSInventory GetDefaultedGSInventory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GSInventory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GSInventory);
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
FC_GSInventory GetDefaultedGSInventory_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GSInventory::GetDefaultedGSInventory(Entity);
}
UFUNCTION()
bool RemoveGSInventory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GSInventory);
}
}
FECSMonitorRuntimeView __GetMonitorGSInventoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GSInventory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGSInventoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GSInventory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGSInventoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GSInventory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGSInventoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GSInventory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGSInventoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GSInventory, bFixedFrame, bMustHandleAll);
}
void __MonitorGSInventoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GSInventory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGSInventoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GSInventory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGSInventoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GSInventory, bFixedFrame, Details);
    return;
}
