
namespace __INTENRAL_FC_EntitySpawnInitEntry_NS
{
    const TECSComponentDerivedPtr<FC_EntitySpawnInitEntry> DerivedPtr = TECSComponentDerivedPtr<FC_EntitySpawnInitEntry>();
    const FC_EntitySpawnInitEntry DefaultValue = FC_EntitySpawnInitEntry();

}
struct FC_EntitySpawnInitEntry : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_InitEntryName;

    FC_EntitySpawnInitEntry()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_EntitySpawnInitEntry(const FC_EntitySpawnInitEntry &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_InitEntryName = Other.m_InitEntryName;
        return;
    }
    FC_EntitySpawnInitEntry opAssign(const FC_EntitySpawnInitEntry &inout Other)
    {
        FC_EntitySpawnInitEntry __r;
        this.SetInitEntryName(Other.GetInitEntryName());
        return __r;
    }
    FName GetInitEntryName() const property
    {
        return this.m_InitEntryName;
    }
    void SetInitEntryName(const FName &inout __Value) property
    {
        if ((this.m_InitEntryName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_InitEntryName = __Value;
        return;
    }
}

namespace ECSFunc_FC_EntitySpawnInitEntry
{
UFUNCTION()
bool HasEntitySpawnInitEntry(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EntitySpawnInitEntry);
}
FC_EntitySpawnInitEntry& AssignEntitySpawnInitEntry(const FECSEntity &inout Entity, const FC_EntitySpawnInitEntry &inout DefaultValue = FC_EntitySpawnInitEntry())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EntitySpawnInitEntry, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEntitySpawnInitEntry_BP(const FECSEntity &inout Entity, const FC_EntitySpawnInitEntry &inout DefaultValue = FC_EntitySpawnInitEntry())
{
    ECSFunc_FC_EntitySpawnInitEntry::AssignEntitySpawnInitEntry(Entity, DefaultValue);
    return;
}
FC_EntitySpawnInitEntry& ModifyEntitySpawnInitEntry(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EntitySpawnInitEntry));
    return local_12.GetComp();
}
FC_EntitySpawnInitEntry& ModifyOrAddEntitySpawnInitEntry(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EntitySpawnInitEntry));
    return local_12.GetComp();
}
const FC_EntitySpawnInitEntry& GetEntitySpawnInitEntry(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EntitySpawnInitEntry));
    return local_12.GetComp();
}
UFUNCTION()
FC_EntitySpawnInitEntry GetEntitySpawnInitEntry_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EntitySpawnInitEntry& local_4 = ECSFunc_FC_EntitySpawnInitEntry::GetEntitySpawnInitEntry(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EntitySpawnInitEntry();
}
const FC_EntitySpawnInitEntry GetDefaultedEntitySpawnInitEntry(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EntitySpawnInitEntry __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EntitySpawnInitEntry);
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
FC_EntitySpawnInitEntry GetDefaultedEntitySpawnInitEntry_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EntitySpawnInitEntry::GetDefaultedEntitySpawnInitEntry(Entity);
}
UFUNCTION()
bool RemoveEntitySpawnInitEntry(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EntitySpawnInitEntry);
}
}
FECSMonitorRuntimeView __GetMonitorEntitySpawnInitEntryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EntitySpawnInitEntry, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntitySpawnInitEntryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EntitySpawnInitEntry, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntitySpawnInitEntryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EntitySpawnInitEntry, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntitySpawnInitEntryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EntitySpawnInitEntry, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntitySpawnInitEntryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EntitySpawnInitEntry, bFixedFrame, bMustHandleAll);
}
void __MonitorEntitySpawnInitEntryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EntitySpawnInitEntry, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntitySpawnInitEntryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EntitySpawnInitEntry, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntitySpawnInitEntryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EntitySpawnInitEntry, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_EntitySpawnInitEntry &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_EntitySpawnInitEntry &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_EntitySpawnInitEntry &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_EntitySpawnInitEntry
{
int __IndexOf_InitEntryName()
{
    return 0;
}
}
