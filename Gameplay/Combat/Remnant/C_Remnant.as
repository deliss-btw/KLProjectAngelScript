
namespace __INTENRAL_FC_RemnantInfo_NS
{
    const TECSComponentDerivedPtr<FC_RemnantInfo> DerivedPtr = TECSComponentDerivedPtr<FC_RemnantInfo>();
    const FC_RemnantInfo DefaultValue = FC_RemnantInfo();
}
namespace __INTENRAL_FC_RemnantDropItemInfo_NS
{
    const TECSComponentDerivedPtr<FC_RemnantDropItemInfo> DerivedPtr = TECSComponentDerivedPtr<FC_RemnantDropItemInfo>();
    const FC_RemnantDropItemInfo DefaultValue = FC_RemnantDropItemInfo();
}
namespace __INTENRAL_FC_RemnantPendingRemoveTag_NS
{
    const TECSComponentDerivedPtr<FC_RemnantPendingRemoveTag> DerivedPtr = TECSComponentDerivedPtr<FC_RemnantPendingRemoveTag>();
    const FC_RemnantPendingRemoveTag DefaultValue = FC_RemnantPendingRemoveTag();
}
namespace __INTENRAL_FCE_RemnantSlotChangedEvent_NS
{
    const TECSEventDerivedPtr<FCE_RemnantSlotChangedEvent> DerivedPtr = TECSEventDerivedPtr<FCE_RemnantSlotChangedEvent>();

}
struct FC_RemnantInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FRemnantItemConfig> m_RemnantItemConfig;
    UPROPERTY()
    int m_RemainUsableCount;

    FC_RemnantInfo()
    {
        this.m_RemainUsableCount = 0;
        this.__InitDirtyFlags();
        return;
    }
    FC_RemnantInfo(const FC_RemnantInfo &inout Other)
    {
        this.m_RemainUsableCount = 0;
        this.__InitDirtyFlags();
        this.m_RemnantItemConfig = Other.m_RemnantItemConfig;
        this.m_RemainUsableCount = int(Other.m_RemainUsableCount);
        return;
    }
    FC_RemnantInfo opAssign(const FC_RemnantInfo &inout Other)
    {
        FC_RemnantInfo __r;
        this.SetRemnantItemConfig(Other.GetRemnantItemConfig());
        this.SetRemainUsableCount(Other.GetRemainUsableCount());
        return __r;
    }
    const TDataObjectPtr<FRemnantItemConfig> GetRemnantItemConfig() const property
    {
        const TDataObjectPtr<FRemnantItemConfig> __r;
        return __r;
    }
    TDataObjectPtr<FRemnantItemConfig> GetModify_RemnantItemConfig() property
    {
        TDataObjectPtr<FRemnantItemConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRemnantItemConfig(const TDataObjectPtr<FRemnantItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RemnantItemConfig = __Value;
        return;
    }
    int GetRemainUsableCount() const property
    {
        return this.m_RemainUsableCount;
    }
    void SetRemainUsableCount(const int __Value) property
    {
        if (this.m_RemainUsableCount == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RemainUsableCount = __Value;
        return;
    }
}

struct FC_RemnantDropItemInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_RemainUsableCount;

    FC_RemnantDropItemInfo()
    {
        this.m_RemainUsableCount = 0;
        this.__InitDirtyFlags();
        return;
    }
    FC_RemnantDropItemInfo(const FC_RemnantDropItemInfo &inout Other)
    {
        this.m_RemainUsableCount = 0;
        this.__InitDirtyFlags();
        this.m_RemainUsableCount = int(Other.m_RemainUsableCount);
        return;
    }
    FC_RemnantDropItemInfo opAssign(const FC_RemnantDropItemInfo &inout Other)
    {
        FC_RemnantDropItemInfo __r;
        this.SetRemainUsableCount(Other.GetRemainUsableCount());
        return __r;
    }
    int GetRemainUsableCount() const property
    {
        return this.m_RemainUsableCount;
    }
    void SetRemainUsableCount(const int __Value) property
    {
        if (this.m_RemainUsableCount == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RemainUsableCount = __Value;
        return;
    }
}

struct FCE_RemnantSlotChangedEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_RemnantSlotChangedEvent()
    {
        return;
    }
}

struct FC_RemnantPendingRemoveTag : FECSComponent
{
    FC_RemnantPendingRemoveTag()
    {
        return;
    }
}

namespace ECSFunc_FC_RemnantInfo
{
UFUNCTION()
bool HasRemnantInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RemnantInfo);
}
FC_RemnantInfo& AssignRemnantInfo(const FECSEntity &inout Entity, const FC_RemnantInfo &inout DefaultValue = FC_RemnantInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RemnantInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRemnantInfo_BP(const FECSEntity &inout Entity, const FC_RemnantInfo &inout DefaultValue = FC_RemnantInfo())
{
    ECSFunc_FC_RemnantInfo::AssignRemnantInfo(Entity, DefaultValue);
    return;
}
FC_RemnantInfo& ModifyRemnantInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RemnantInfo));
    return local_12.GetComp();
}
FC_RemnantInfo& ModifyOrAddRemnantInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RemnantInfo));
    return local_12.GetComp();
}
const FC_RemnantInfo& GetRemnantInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RemnantInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_RemnantInfo GetRemnantInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RemnantInfo& local_4 = ECSFunc_FC_RemnantInfo::GetRemnantInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RemnantInfo();
}
const FC_RemnantInfo GetDefaultedRemnantInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RemnantInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RemnantInfo);
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
FC_RemnantInfo GetDefaultedRemnantInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RemnantInfo::GetDefaultedRemnantInfo(Entity);
}
UFUNCTION()
bool RemoveRemnantInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RemnantInfo);
}
}
FECSMonitorRuntimeView __GetMonitorRemnantInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RemnantInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRemnantInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RemnantInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRemnantInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RemnantInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRemnantInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RemnantInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRemnantInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RemnantInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorRemnantInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RemnantInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRemnantInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RemnantInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRemnantInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RemnantInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_RemnantDropItemInfo
{
UFUNCTION()
bool HasRemnantDropItemInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RemnantDropItemInfo);
}
FC_RemnantDropItemInfo& AssignRemnantDropItemInfo(const FECSEntity &inout Entity, const FC_RemnantDropItemInfo &inout DefaultValue = FC_RemnantDropItemInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RemnantDropItemInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRemnantDropItemInfo_BP(const FECSEntity &inout Entity, const FC_RemnantDropItemInfo &inout DefaultValue = FC_RemnantDropItemInfo())
{
    ECSFunc_FC_RemnantDropItemInfo::AssignRemnantDropItemInfo(Entity, DefaultValue);
    return;
}
FC_RemnantDropItemInfo& ModifyRemnantDropItemInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RemnantDropItemInfo));
    return local_12.GetComp();
}
FC_RemnantDropItemInfo& ModifyOrAddRemnantDropItemInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RemnantDropItemInfo));
    return local_12.GetComp();
}
const FC_RemnantDropItemInfo& GetRemnantDropItemInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RemnantDropItemInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_RemnantDropItemInfo GetRemnantDropItemInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RemnantDropItemInfo& local_4 = ECSFunc_FC_RemnantDropItemInfo::GetRemnantDropItemInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RemnantDropItemInfo();
}
const FC_RemnantDropItemInfo GetDefaultedRemnantDropItemInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RemnantDropItemInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RemnantDropItemInfo);
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
FC_RemnantDropItemInfo GetDefaultedRemnantDropItemInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RemnantDropItemInfo::GetDefaultedRemnantDropItemInfo(Entity);
}
UFUNCTION()
bool RemoveRemnantDropItemInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RemnantDropItemInfo);
}
}
FECSMonitorRuntimeView __GetMonitorRemnantDropItemInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RemnantDropItemInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRemnantDropItemInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RemnantDropItemInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRemnantDropItemInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RemnantDropItemInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRemnantDropItemInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RemnantDropItemInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRemnantDropItemInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RemnantDropItemInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorRemnantDropItemInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RemnantDropItemInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRemnantDropItemInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RemnantDropItemInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRemnantDropItemInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RemnantDropItemInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_RemnantPendingRemoveTag
{
UFUNCTION()
bool HasRemnantPendingRemoveTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RemnantPendingRemoveTag);
}
FC_RemnantPendingRemoveTag& AssignRemnantPendingRemoveTag(const FECSEntity &inout Entity, const FC_RemnantPendingRemoveTag &inout DefaultValue = FC_RemnantPendingRemoveTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RemnantPendingRemoveTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRemnantPendingRemoveTag_BP(const FECSEntity &inout Entity, const FC_RemnantPendingRemoveTag &inout DefaultValue = FC_RemnantPendingRemoveTag())
{
    ECSFunc_FC_RemnantPendingRemoveTag::AssignRemnantPendingRemoveTag(Entity, DefaultValue);
    return;
}
FC_RemnantPendingRemoveTag& ModifyRemnantPendingRemoveTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RemnantPendingRemoveTag));
    return local_12.GetComp();
}
FC_RemnantPendingRemoveTag& ModifyOrAddRemnantPendingRemoveTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RemnantPendingRemoveTag));
    return local_12.GetComp();
}
const FC_RemnantPendingRemoveTag& GetRemnantPendingRemoveTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RemnantPendingRemoveTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_RemnantPendingRemoveTag GetRemnantPendingRemoveTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RemnantPendingRemoveTag& local_4 = ECSFunc_FC_RemnantPendingRemoveTag::GetRemnantPendingRemoveTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RemnantPendingRemoveTag();
}
const FC_RemnantPendingRemoveTag GetDefaultedRemnantPendingRemoveTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RemnantPendingRemoveTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RemnantPendingRemoveTag);
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
FC_RemnantPendingRemoveTag GetDefaultedRemnantPendingRemoveTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RemnantPendingRemoveTag::GetDefaultedRemnantPendingRemoveTag(Entity);
}
UFUNCTION()
bool RemoveRemnantPendingRemoveTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RemnantPendingRemoveTag);
}
}
FECSMonitorRuntimeView __GetMonitorRemnantPendingRemoveTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RemnantPendingRemoveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRemnantPendingRemoveTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RemnantPendingRemoveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRemnantPendingRemoveTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RemnantPendingRemoveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRemnantPendingRemoveTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RemnantPendingRemoveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRemnantPendingRemoveTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RemnantPendingRemoveTag, bFixedFrame, bMustHandleAll);
}
void __MonitorRemnantPendingRemoveTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RemnantPendingRemoveTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRemnantPendingRemoveTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RemnantPendingRemoveTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRemnantPendingRemoveTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RemnantPendingRemoveTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_RemnantInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_RemnantInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RemnantInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RemnantInfo
{
int __IndexOf_RemnantItemConfig()
{
    return 0;
}
int __IndexOf_RemainUsableCount()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_RemnantDropItemInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_RemnantDropItemInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RemnantDropItemInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RemnantDropItemInfo
{
int __IndexOf_RemainUsableCount()
{
    return 0;
}
}
