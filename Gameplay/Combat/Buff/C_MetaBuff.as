
namespace __INTENRAL_FC_PlayerMetaBuffList_NS
{
    const TECSComponentDerivedPtr<FC_PlayerMetaBuffList> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerMetaBuffList>();
    const FC_PlayerMetaBuffList DefaultValue = FC_PlayerMetaBuffList();

}
struct FPlayerMetaBuff
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FMetaBuffConfig> m_MetaBuffConfig;
    UPROPERTY()
    TArray<int> m_RuntimeGamePlayModifierIDs;
    UPROPERTY()
    TArray<uint> m_ModifiersDataIDs;
    UPROPERTY()
    TArray<FCapabilityInstanceId> m_RuntimeCapabilitiesIDs;
    UPROPERTY()
    TArray<uint> m_CapabilitiesConfigs;
    UPROPERTY()
    uint m_StartTime;

    FPlayerMetaBuff()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPlayerMetaBuff(const FPlayerMetaBuff &inout Other)
    {
        this.m_StartTime = 0;
        this.m_MetaBuffConfig = Other.m_MetaBuffConfig;
        this.m_RuntimeGamePlayModifierIDs = Other.m_RuntimeGamePlayModifierIDs;
        this.m_ModifiersDataIDs = Other.m_ModifiersDataIDs;
        this.m_RuntimeCapabilitiesIDs = Other.m_RuntimeCapabilitiesIDs;
        this.m_CapabilitiesConfigs = Other.m_CapabilitiesConfigs;
        this.m_StartTime = int(Other.m_StartTime);
        return;
    }
    FPlayerMetaBuff opAssign(const FPlayerMetaBuff &inout Other)
    {
        FPlayerMetaBuff __r;
        this.SetMetaBuffConfig(Other.GetMetaBuffConfig());
        this.SetRuntimeGamePlayModifierIDs(Other.GetRuntimeGamePlayModifierIDs());
        this.SetModifiersDataIDs(Other.GetModifiersDataIDs());
        this.SetRuntimeCapabilitiesIDs(Other.GetRuntimeCapabilitiesIDs());
        this.SetCapabilitiesConfigs(Other.GetCapabilitiesConfigs());
        this.SetStartTime(Other.GetStartTime());
        return __r;
    }
    const TDataObjectPtr<FMetaBuffConfig> GetMetaBuffConfig() const property
    {
        const TDataObjectPtr<FMetaBuffConfig> __r;
        return __r;
    }
    TDataObjectPtr<FMetaBuffConfig> GetModify_MetaBuffConfig() property
    {
        TDataObjectPtr<FMetaBuffConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetMetaBuffConfig(const TDataObjectPtr<FMetaBuffConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MetaBuffConfig = __Value;
        return;
    }
    const TArray<int> GetRuntimeGamePlayModifierIDs() const property
    {
        const TArray<int> __r;
        return __r;
    }
    TArray<int> GetModify_RuntimeGamePlayModifierIDs() property
    {
        TArray<int> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetRuntimeGamePlayModifierIDs(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RuntimeGamePlayModifierIDs = __Value;
        return;
    }
    const TArray<uint> GetModifiersDataIDs() const property
    {
        const TArray<uint> __r;
        return __r;
    }
    TArray<uint> GetModify_ModifiersDataIDs() property
    {
        TArray<uint> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetModifiersDataIDs(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ModifiersDataIDs = __Value;
        return;
    }
    const TArray<FCapabilityInstanceId> GetRuntimeCapabilitiesIDs() const property
    {
        const TArray<FCapabilityInstanceId> __r;
        return __r;
    }
    TArray<FCapabilityInstanceId> GetModify_RuntimeCapabilitiesIDs() property
    {
        TArray<FCapabilityInstanceId> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetRuntimeCapabilitiesIDs(const TArray<FCapabilityInstanceId> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_RuntimeCapabilitiesIDs = __Value;
        return;
    }
    const TArray<uint> GetCapabilitiesConfigs() const property
    {
        const TArray<uint> __r;
        return __r;
    }
    TArray<uint> GetModify_CapabilitiesConfigs() property
    {
        TArray<uint> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetCapabilitiesConfigs(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_CapabilitiesConfigs = __Value;
        return;
    }
    uint GetStartTime() const property
    {
        return this.m_StartTime;
    }
    void SetStartTime(const uint __Value) property
    {
        if (this.m_StartTime == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_StartTime = __Value;
        return;
    }
}

struct FC_PlayerMetaBuffList : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FPlayerMetaBuff> m_MetaBuffs;

    FC_PlayerMetaBuffList()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PlayerMetaBuffList(const FC_PlayerMetaBuffList &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_MetaBuffs = Other.m_MetaBuffs;
        return;
    }
    FC_PlayerMetaBuffList opAssign(const FC_PlayerMetaBuffList &inout Other)
    {
        FC_PlayerMetaBuffList __r;
        this.SetMetaBuffs(Other.GetMetaBuffs());
        return __r;
    }
    const TArray<FPlayerMetaBuff> GetMetaBuffs() const property
    {
        const TArray<FPlayerMetaBuff> __r;
        return __r;
    }
    TArray<FPlayerMetaBuff> GetModify_MetaBuffs() property
    {
        TArray<FPlayerMetaBuff> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetMetaBuffs(const TArray<FPlayerMetaBuff> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MetaBuffs = __Value;
        return;
    }
}

namespace ECSFunc_FC_PlayerMetaBuffList
{
UFUNCTION()
bool HasPlayerMetaBuffList(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerMetaBuffList);
}
FC_PlayerMetaBuffList& AssignPlayerMetaBuffList(const FECSEntity &inout Entity, const FC_PlayerMetaBuffList &inout DefaultValue = FC_PlayerMetaBuffList())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerMetaBuffList, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerMetaBuffList_BP(const FECSEntity &inout Entity, const FC_PlayerMetaBuffList &inout DefaultValue = FC_PlayerMetaBuffList())
{
    ECSFunc_FC_PlayerMetaBuffList::AssignPlayerMetaBuffList(Entity, DefaultValue);
    return;
}
FC_PlayerMetaBuffList& ModifyPlayerMetaBuffList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerMetaBuffList));
    return local_12.GetComp();
}
FC_PlayerMetaBuffList& ModifyOrAddPlayerMetaBuffList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerMetaBuffList));
    return local_12.GetComp();
}
const FC_PlayerMetaBuffList& GetPlayerMetaBuffList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerMetaBuffList));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerMetaBuffList GetPlayerMetaBuffList_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerMetaBuffList& local_4 = ECSFunc_FC_PlayerMetaBuffList::GetPlayerMetaBuffList(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerMetaBuffList();
}
const FC_PlayerMetaBuffList GetDefaultedPlayerMetaBuffList(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerMetaBuffList __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerMetaBuffList);
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
FC_PlayerMetaBuffList GetDefaultedPlayerMetaBuffList_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerMetaBuffList::GetDefaultedPlayerMetaBuffList(Entity);
}
UFUNCTION()
bool RemovePlayerMetaBuffList(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerMetaBuffList);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerMetaBuffListOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerMetaBuffList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerMetaBuffListOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerMetaBuffList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerMetaBuffListOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerMetaBuffList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerMetaBuffListOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerMetaBuffList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerMetaBuffListOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerMetaBuffList, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerMetaBuffListLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerMetaBuffList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerMetaBuffListActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerMetaBuffList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerMetaBuffListModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerMetaBuffList, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FPlayerMetaBuff &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FPlayerMetaBuff &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPlayerMetaBuff
{
int __IndexOf_MetaBuffConfig()
{
    return 0;
}
int __IndexOf_RuntimeGamePlayModifierIDs()
{
    return 1;
}
int __IndexOf_ModifiersDataIDs()
{
    return 2;
}
int __IndexOf_RuntimeCapabilitiesIDs()
{
    return 3;
}
int __IndexOf_CapabilitiesConfigs()
{
    return 4;
}
int __IndexOf_StartTime()
{
    return 5;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerMetaBuffList &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerMetaBuffList &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerMetaBuffList &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerMetaBuffList
{
int __IndexOf_MetaBuffs()
{
    return 0;
}
}
