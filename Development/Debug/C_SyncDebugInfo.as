
namespace __INTENRAL_FC_SyncDebugInfo_NS
{
    const TECSComponentDerivedPtr<FC_SyncDebugInfo> DerivedPtr = TECSComponentDerivedPtr<FC_SyncDebugInfo>();
    const FC_SyncDebugInfo DefaultValue = FC_SyncDebugInfo();

}
struct FBodyPartDebugEntry
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_PartName;
    UPROPERTY()
    float32 m_RemainingHP;
    UPROPERTY()
    float32 m_MaxHP;
    UPROPERTY()
    bool m_bDestroyed;
    UPROPERTY()
    bool m_bHitBoxDisabled;

    FBodyPartDebugEntry()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FBodyPartDebugEntry(const FBodyPartDebugEntry &inout Other)
    {
        this.m_RemainingHP = 0.0f;
        this.m_MaxHP = 0.0f;
        this.m_bDestroyed = false;
        this.m_bHitBoxDisabled = false;
        this.m_PartName = Other.m_PartName;
        this.m_RemainingHP = Other.m_RemainingHP;
        this.m_MaxHP = Other.m_MaxHP;
        this.m_bDestroyed = Other.m_bDestroyed;
        this.m_bHitBoxDisabled = Other.m_bHitBoxDisabled;
        return;
    }
    FBodyPartDebugEntry opAssign(const FBodyPartDebugEntry &inout Other)
    {
        FBodyPartDebugEntry __r;
        this.SetPartName(Other.GetPartName());
        this.SetRemainingHP(Other.GetRemainingHP());
        this.SetMaxHP(Other.GetMaxHP());
        this.SetbDestroyed(Other.GetbDestroyed());
        this.SetbHitBoxDisabled(Other.GetbHitBoxDisabled());
        return __r;
    }
    FName GetPartName() const property
    {
        return this.m_PartName;
    }
    void SetPartName(const FName &inout __Value) property
    {
        if ((this.m_PartName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PartName = __Value;
        return;
    }
    float32 GetRemainingHP() const property
    {
        return this.m_RemainingHP;
    }
    void SetRemainingHP(const float32 __Value) property
    {
        if (this.m_RemainingHP == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RemainingHP = __Value;
        return;
    }
    float32 GetMaxHP() const property
    {
        return this.m_MaxHP;
    }
    void SetMaxHP(const float32 __Value) property
    {
        if (this.m_MaxHP == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_MaxHP = __Value;
        return;
    }
    bool GetbDestroyed() const property
    {
        return this.m_bDestroyed;
    }
    void SetbDestroyed(const bool __Value) property
    {
        if (!(this.m_bDestroyed) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bDestroyed = __Value;
        return;
    }
    bool GetbHitBoxDisabled() const property
    {
        return this.m_bHitBoxDisabled;
    }
    void SetbHitBoxDisabled(const bool __Value) property
    {
        if (!(this.m_bHitBoxDisabled) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bHitBoxDisabled = __Value;
        return;
    }
}

struct FC_SyncDebugInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector m_Velocity;
    UPROPERTY()
    TArray<FBodyPartDebugEntry> m_BodyPartEntries;

    FC_SyncDebugInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_SyncDebugInfo(const FC_SyncDebugInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Velocity = Other.m_Velocity;
        this.m_BodyPartEntries = Other.m_BodyPartEntries;
        return;
    }
    FC_SyncDebugInfo opAssign(const FC_SyncDebugInfo &inout Other)
    {
        FC_SyncDebugInfo __r;
        this.SetVelocity(Other.GetVelocity());
        this.SetBodyPartEntries(Other.GetBodyPartEntries());
        return __r;
    }
    FVector GetVelocity() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_Velocity() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetVelocity(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Velocity = __Value;
        return;
    }
    const TArray<FBodyPartDebugEntry> GetBodyPartEntries() const property
    {
        const TArray<FBodyPartDebugEntry> __r;
        return __r;
    }
    TArray<FBodyPartDebugEntry> GetModify_BodyPartEntries() property
    {
        TArray<FBodyPartDebugEntry> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetBodyPartEntries(const TArray<FBodyPartDebugEntry> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_BodyPartEntries = __Value;
        return;
    }
}

namespace ECSFunc_FC_SyncDebugInfo
{
UFUNCTION()
bool HasSyncDebugInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SyncDebugInfo);
}
FC_SyncDebugInfo& AssignSyncDebugInfo(const FECSEntity &inout Entity, const FC_SyncDebugInfo &inout DefaultValue = FC_SyncDebugInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SyncDebugInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSyncDebugInfo_BP(const FECSEntity &inout Entity, const FC_SyncDebugInfo &inout DefaultValue = FC_SyncDebugInfo())
{
    ECSFunc_FC_SyncDebugInfo::AssignSyncDebugInfo(Entity, DefaultValue);
    return;
}
FC_SyncDebugInfo& ModifySyncDebugInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SyncDebugInfo));
    return local_12.GetComp();
}
FC_SyncDebugInfo& ModifyOrAddSyncDebugInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SyncDebugInfo));
    return local_12.GetComp();
}
const FC_SyncDebugInfo& GetSyncDebugInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SyncDebugInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_SyncDebugInfo GetSyncDebugInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SyncDebugInfo& local_4 = ECSFunc_FC_SyncDebugInfo::GetSyncDebugInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SyncDebugInfo();
}
const FC_SyncDebugInfo GetDefaultedSyncDebugInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SyncDebugInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SyncDebugInfo);
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
FC_SyncDebugInfo GetDefaultedSyncDebugInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SyncDebugInfo::GetDefaultedSyncDebugInfo(Entity);
}
UFUNCTION()
bool RemoveSyncDebugInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SyncDebugInfo);
}
}
FECSMonitorRuntimeView __GetMonitorSyncDebugInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SyncDebugInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncDebugInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SyncDebugInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncDebugInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SyncDebugInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncDebugInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SyncDebugInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncDebugInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SyncDebugInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorSyncDebugInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SyncDebugInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncDebugInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SyncDebugInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncDebugInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SyncDebugInfo, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FBodyPartDebugEntry &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FBodyPartDebugEntry &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FBodyPartDebugEntry
{
int __IndexOf_PartName()
{
    return 0;
}
int __IndexOf_RemainingHP()
{
    return 1;
}
int __IndexOf_MaxHP()
{
    return 2;
}
int __IndexOf_bDestroyed()
{
    return 3;
}
int __IndexOf_bHitBoxDisabled()
{
    return 4;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SyncDebugInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SyncDebugInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SyncDebugInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SyncDebugInfo
{
int __IndexOf_Velocity()
{
    return 0;
}
int __IndexOf_BodyPartEntries()
{
    return 1;
}
}
