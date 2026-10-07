
namespace __INTENRAL_FC_GameplayInventory_NS
{
    const TECSComponentDerivedPtr<FC_GameplayInventory> DerivedPtr = TECSComponentDerivedPtr<FC_GameplayInventory>();
    const FC_GameplayInventory DefaultValue = FC_GameplayInventory();
}
namespace __INTENRAL_FC_GameplayInventoryCache_NS
{
    const TECSComponentDerivedPtr<FC_GameplayInventoryCache> DerivedPtr = TECSComponentDerivedPtr<FC_GameplayInventoryCache>();
    const FC_GameplayInventoryCache DefaultValue = FC_GameplayInventoryCache();
}
namespace __INTENRAL_FC_GameplayInventoryUidGenerator_NS
{
    const TECSComponentDerivedPtr<FC_GameplayInventoryUidGenerator> DerivedPtr = TECSComponentDerivedPtr<FC_GameplayInventoryUidGenerator>();
    const FC_GameplayInventoryUidGenerator DefaultValue = FC_GameplayInventoryUidGenerator();
}
namespace __INTENRAL_FCS_InventoryAddItemReason_NS
{
    const TECSComponentDerivedPtr<FCS_InventoryAddItemReason> DerivedPtr = TECSComponentDerivedPtr<FCS_InventoryAddItemReason>();
    const FCS_InventoryAddItemReason DefaultValue = FCS_InventoryAddItemReason();
}
namespace __INTENRAL_FCS_InventoryAddItemCollect_NS
{
    const TECSComponentDerivedPtr<FCS_InventoryAddItemCollect> DerivedPtr = TECSComponentDerivedPtr<FCS_InventoryAddItemCollect>();
    const FCS_InventoryAddItemCollect DefaultValue = FCS_InventoryAddItemCollect();
}
namespace __INTENRAL_FC_GameplayItemBank_NS
{
    const TECSComponentDerivedPtr<FC_GameplayItemBank> DerivedPtr = TECSComponentDerivedPtr<FC_GameplayItemBank>();
    const FC_GameplayItemBank DefaultValue = FC_GameplayItemBank();
}
namespace __INTENRAL_FCE_GameplayInventoryItemAddedNotify_NS
{
    const TECSEventDerivedPtr<FCE_GameplayInventoryItemAddedNotify> DerivedPtr = TECSEventDerivedPtr<FCE_GameplayInventoryItemAddedNotify>();

}
struct FGameplayInventoryItemData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_Config;
    UPROPERTY()
    int m_Num;
    UPROPERTY()
    int64 m_LastModifiedTimestamp;

    FGameplayInventoryItemData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FGameplayInventoryItemData(const FGameplayInventoryItemData &inout Other)
    {
        this.m_Num = 0;
        this.m_LastModifiedTimestamp = 0;
        this.m_Config = Other.m_Config;
        this.m_Num = int(Other.m_Num);
        this.m_LastModifiedTimestamp = Other.m_LastModifiedTimestamp;
        return;
    }
    FGameplayInventoryItemData opAssign(const FGameplayInventoryItemData &inout Other)
    {
        FGameplayInventoryItemData __r;
        this.SetConfig(Other.GetConfig());
        this.SetNum(Other.GetNum());
        this.SetLastModifiedTimestamp(Other.GetLastModifiedTimestamp());
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetConfig() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_Config() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Config = __Value;
        return;
    }
    int GetNum() const property
    {
        return this.m_Num;
    }
    void SetNum(const int __Value) property
    {
        if (this.m_Num == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Num = __Value;
        return;
    }
    int64 GetLastModifiedTimestamp() const property
    {
        return this.m_LastModifiedTimestamp;
    }
    void SetLastModifiedTimestamp(const int64 __Value) property
    {
        if (this.m_LastModifiedTimestamp == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LastModifiedTimestamp = __Value;
        return;
    }
}

struct FC_GameplayInventory : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<uint64, FGameplayInventoryItemData> m_Items;

    FC_GameplayInventory()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_GameplayInventory(const FC_GameplayInventory &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Items = Other.m_Items;
        return;
    }
    FC_GameplayInventory opAssign(const FC_GameplayInventory &inout Other)
    {
        FC_GameplayInventory __r;
        this.SetItems(Other.GetItems());
        return __r;
    }
    const TMap<uint64, FGameplayInventoryItemData> GetItems() const property
    {
        const TMap<uint64, FGameplayInventoryItemData> __r;
        return __r;
    }
    TMap<uint64, FGameplayInventoryItemData> GetModify_Items() property
    {
        TMap<uint64, FGameplayInventoryItemData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetItems(const TMap<uint64, FGameplayInventoryItemData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Items = __Value;
        return;
    }
}

struct FItemUidList
{
    UPROPERTY()
    TArray<uint64> m_Uids;

    FItemUidList()
    {
        return;
    }
    const TArray<uint64> GetUids() const property
    {
        const TArray<uint64> __r;
        return __r;
    }
    TArray<uint64> GetUids() property
    {
        TArray<uint64> __r;
        return __r;
    }
    void SetUids(const TArray<uint64> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FC_GameplayInventoryCache : FECSComponent
{
    UPROPERTY()
    TMap<TDataObjectPtr<FItemConfig>, FItemUidList> ConfigToUidList;

    FC_GameplayInventoryCache()
    {
        return;
    }
}

struct FC_GameplayInventoryUidGenerator : FECSComponent
{
    UPROPERTY()
    uint NextSeqId;


}

struct FGameplayInventoryBatchAddItemData
{
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_Config;
    UPROPERTY()
    int m_Number;

    FGameplayInventoryBatchAddItemData(const TDataObjectPtr<FItemConfig> &inout InConfig, const int InNumber)
    {
        this.SetConfig(InConfig);
        this.SetNumber(InNumber);
        return;
    }
    TDataObjectPtr<FItemConfig> GetConfig() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetConfig() property
    {
        TDataObjectPtr<FItemConfig> __r;
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    int GetNumber() const property
    {
        return this.m_Number;
    }
    void SetNumber(const int __Value) property
    {
        this.m_Number = __Value;
        return;
    }
}

struct FCE_GameplayInventoryItemAddedNotify : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<FGameplayInventoryBatchAddItemData> Items;

    FCE_GameplayInventoryItemAddedNotify()
    {
        return;
    }
}

struct FInventoryAddItemRecord
{
    UPROPERTY()
    FECSEntity Player;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> Item;
    UPROPERTY()
    int Number = 0;


}

struct FCS_InventoryAddItemReason : FECSSingleton
{
    UPROPERTY()
    TArray<uint> ReasonStack;

    FCS_InventoryAddItemReason()
    {
        return;
    }
}

struct FCS_InventoryAddItemCollect : FECSSingleton
{
    UPROPERTY()
    int ScopeDepth = 0;
    UPROPERTY()
    TArray<FInventoryAddItemRecord> Records;


}

struct FC_GameplayItemBank : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<TDataObjectPtr<FItemConfig>, int> m_Items;

    FC_GameplayItemBank()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_GameplayItemBank(const FC_GameplayItemBank &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Items = Other.m_Items;
        return;
    }
    FC_GameplayItemBank opAssign(const FC_GameplayItemBank &inout Other)
    {
        FC_GameplayItemBank __r;
        this.SetItems(Other.GetItems());
        return __r;
    }
    const TMap<TDataObjectPtr<FItemConfig>, int> GetItems() const property
    {
        const TMap<TDataObjectPtr<FItemConfig>, int> __r;
        return __r;
    }
    TMap<TDataObjectPtr<FItemConfig>, int> GetModify_Items() property
    {
        TMap<TDataObjectPtr<FItemConfig>, int> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetItems(const TMap<TDataObjectPtr<FItemConfig>, int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Items = __Value;
        return;
    }
}

namespace ECSFunc_FC_GameplayInventory
{
UFUNCTION()
bool HasGameplayInventory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventory);
}
FC_GameplayInventory& AssignGameplayInventory(const FECSEntity &inout Entity, const FC_GameplayInventory &inout DefaultValue = FC_GameplayInventory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGameplayInventory_BP(const FECSEntity &inout Entity, const FC_GameplayInventory &inout DefaultValue = FC_GameplayInventory())
{
    ECSFunc_FC_GameplayInventory::AssignGameplayInventory(Entity, DefaultValue);
    return;
}
FC_GameplayInventory& ModifyGameplayInventory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventory));
    return local_12.GetComp();
}
FC_GameplayInventory& ModifyOrAddGameplayInventory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventory));
    return local_12.GetComp();
}
const FC_GameplayInventory& GetGameplayInventory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventory));
    return local_12.GetComp();
}
UFUNCTION()
FC_GameplayInventory GetGameplayInventory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GameplayInventory& local_4 = ECSFunc_FC_GameplayInventory::GetGameplayInventory(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GameplayInventory();
}
const FC_GameplayInventory GetDefaultedGameplayInventory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GameplayInventory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventory);
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
FC_GameplayInventory GetDefaultedGameplayInventory_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GameplayInventory::GetDefaultedGameplayInventory(Entity);
}
UFUNCTION()
bool RemoveGameplayInventory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventory);
}
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GameplayInventory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GameplayInventory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GameplayInventory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GameplayInventory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GameplayInventory, bFixedFrame, bMustHandleAll);
}
void __MonitorGameplayInventoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GameplayInventory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameplayInventoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GameplayInventory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameplayInventoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GameplayInventory, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GameplayInventoryCache
{
UFUNCTION()
bool HasGameplayInventoryCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryCache);
}
FC_GameplayInventoryCache& AssignGameplayInventoryCache(const FECSEntity &inout Entity, const FC_GameplayInventoryCache &inout DefaultValue = FC_GameplayInventoryCache())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryCache, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGameplayInventoryCache_BP(const FECSEntity &inout Entity, const FC_GameplayInventoryCache &inout DefaultValue = FC_GameplayInventoryCache())
{
    ECSFunc_FC_GameplayInventoryCache::AssignGameplayInventoryCache(Entity, DefaultValue);
    return;
}
FC_GameplayInventoryCache& ModifyGameplayInventoryCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryCache));
    return local_12.GetComp();
}
FC_GameplayInventoryCache& ModifyOrAddGameplayInventoryCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryCache));
    return local_12.GetComp();
}
const FC_GameplayInventoryCache& GetGameplayInventoryCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryCache));
    return local_12.GetComp();
}
UFUNCTION()
FC_GameplayInventoryCache GetGameplayInventoryCache_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GameplayInventoryCache __r;
    bValid = false;
    bValid = ECSFunc_FC_GameplayInventoryCache::GetGameplayInventoryCache(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GameplayInventoryCache GetDefaultedGameplayInventoryCache(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GameplayInventoryCache __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryCache);
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
FC_GameplayInventoryCache GetDefaultedGameplayInventoryCache_BP(const FECSEntity &inout Entity)
{
    FC_GameplayInventoryCache __r;
    return __r;
}
UFUNCTION()
bool RemoveGameplayInventoryCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryCache);
}
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryCacheOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GameplayInventoryCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryCacheOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GameplayInventoryCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryCacheOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GameplayInventoryCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryCacheOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GameplayInventoryCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryCacheOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GameplayInventoryCache, bFixedFrame, bMustHandleAll);
}
void __MonitorGameplayInventoryCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GameplayInventoryCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameplayInventoryCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GameplayInventoryCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameplayInventoryCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GameplayInventoryCache, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GameplayInventoryUidGenerator
{
UFUNCTION()
bool HasGameplayInventoryUidGenerator(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryUidGenerator);
}
FC_GameplayInventoryUidGenerator& AssignGameplayInventoryUidGenerator(const FECSEntity &inout Entity, const FC_GameplayInventoryUidGenerator &inout DefaultValue = FC_GameplayInventoryUidGenerator())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryUidGenerator, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGameplayInventoryUidGenerator_BP(const FECSEntity &inout Entity, const FC_GameplayInventoryUidGenerator &inout DefaultValue = FC_GameplayInventoryUidGenerator())
{
    ECSFunc_FC_GameplayInventoryUidGenerator::AssignGameplayInventoryUidGenerator(Entity, DefaultValue);
    return;
}
FC_GameplayInventoryUidGenerator& ModifyGameplayInventoryUidGenerator(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryUidGenerator));
    return local_12.GetComp();
}
FC_GameplayInventoryUidGenerator& ModifyOrAddGameplayInventoryUidGenerator(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryUidGenerator));
    return local_12.GetComp();
}
const FC_GameplayInventoryUidGenerator& GetGameplayInventoryUidGenerator(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryUidGenerator));
    return local_12.GetComp();
}
UFUNCTION()
FC_GameplayInventoryUidGenerator GetGameplayInventoryUidGenerator_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GameplayInventoryUidGenerator& local_4 = ECSFunc_FC_GameplayInventoryUidGenerator::GetGameplayInventoryUidGenerator(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GameplayInventoryUidGenerator();
}
const FC_GameplayInventoryUidGenerator GetDefaultedGameplayInventoryUidGenerator(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GameplayInventoryUidGenerator __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryUidGenerator);
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
FC_GameplayInventoryUidGenerator GetDefaultedGameplayInventoryUidGenerator_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GameplayInventoryUidGenerator::GetDefaultedGameplayInventoryUidGenerator(Entity);
}
UFUNCTION()
bool RemoveGameplayInventoryUidGenerator(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GameplayInventoryUidGenerator);
}
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryUidGeneratorOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GameplayInventoryUidGenerator, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryUidGeneratorOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GameplayInventoryUidGenerator, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryUidGeneratorOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GameplayInventoryUidGenerator, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryUidGeneratorOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GameplayInventoryUidGenerator, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayInventoryUidGeneratorOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GameplayInventoryUidGenerator, bFixedFrame, bMustHandleAll);
}
void __MonitorGameplayInventoryUidGeneratorLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GameplayInventoryUidGenerator, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameplayInventoryUidGeneratorActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GameplayInventoryUidGenerator, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameplayInventoryUidGeneratorModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GameplayInventoryUidGenerator, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_InventoryAddItemReason
{
UFUNCTION()
bool HasInventoryAddItemReason(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_InventoryAddItemReason);
}
FCS_InventoryAddItemReason& AssignInventoryAddItemReason(const FECSWorldPtr &inout World, const FCS_InventoryAddItemReason &inout DefaultValue = FCS_InventoryAddItemReason())
{
    UScriptStruct local_6 = FCS_InventoryAddItemReason;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignInventoryAddItemReason_BP(const FECSWorldPtr &inout World, const FCS_InventoryAddItemReason &inout DefaultValue = FCS_InventoryAddItemReason())
{
    ECSFunc_FCS_InventoryAddItemReason::AssignInventoryAddItemReason(World, DefaultValue);
    return;
}
FCS_InventoryAddItemReason& ModifyInventoryAddItemReason(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_InventoryAddItemReason;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_InventoryAddItemReason& ModifyOrAddInventoryAddItemReason(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_InventoryAddItemReason;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_InventoryAddItemReason& GetInventoryAddItemReason(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_InventoryAddItemReason;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_InventoryAddItemReason GetInventoryAddItemReason_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_InventoryAddItemReason __r;
    bValid = false;
    bValid = ECSFunc_FCS_InventoryAddItemReason::GetInventoryAddItemReason(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_InventoryAddItemReason GetDefaultedInventoryAddItemReason(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_InventoryAddItemReason __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_InventoryAddItemReason);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_InventoryAddItemReason GetDefaultedInventoryAddItemReason_BP(const FECSWorldPtr &inout World)
{
    FCS_InventoryAddItemReason __r;
    return __r;
}
UFUNCTION()
bool RemoveInventoryAddItemReason(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_InventoryAddItemReason);
}
}
void __MonitorInventoryAddItemReasonLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_InventoryAddItemReason, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInventoryAddItemReasonActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_InventoryAddItemReason, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInventoryAddItemReasonModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_InventoryAddItemReason, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_InventoryAddItemCollect
{
UFUNCTION()
bool HasInventoryAddItemCollect(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_InventoryAddItemCollect);
}
FCS_InventoryAddItemCollect& AssignInventoryAddItemCollect(const FECSWorldPtr &inout World, const FCS_InventoryAddItemCollect &inout DefaultValue = FCS_InventoryAddItemCollect())
{
    UScriptStruct local_6 = FCS_InventoryAddItemCollect;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignInventoryAddItemCollect_BP(const FECSWorldPtr &inout World, const FCS_InventoryAddItemCollect &inout DefaultValue = FCS_InventoryAddItemCollect())
{
    ECSFunc_FCS_InventoryAddItemCollect::AssignInventoryAddItemCollect(World, DefaultValue);
    return;
}
FCS_InventoryAddItemCollect& ModifyInventoryAddItemCollect(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_InventoryAddItemCollect;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_InventoryAddItemCollect& ModifyOrAddInventoryAddItemCollect(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_InventoryAddItemCollect;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_InventoryAddItemCollect& GetInventoryAddItemCollect(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_InventoryAddItemCollect;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_InventoryAddItemCollect GetInventoryAddItemCollect_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_InventoryAddItemCollect __r;
    bValid = false;
    bValid = ECSFunc_FCS_InventoryAddItemCollect::GetInventoryAddItemCollect(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_InventoryAddItemCollect GetDefaultedInventoryAddItemCollect(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_InventoryAddItemCollect __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_InventoryAddItemCollect);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_InventoryAddItemCollect GetDefaultedInventoryAddItemCollect_BP(const FECSWorldPtr &inout World)
{
    FCS_InventoryAddItemCollect __r;
    return __r;
}
UFUNCTION()
bool RemoveInventoryAddItemCollect(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_InventoryAddItemCollect);
}
}
void __MonitorInventoryAddItemCollectLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_InventoryAddItemCollect, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInventoryAddItemCollectActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_InventoryAddItemCollect, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInventoryAddItemCollectModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_InventoryAddItemCollect, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GameplayItemBank
{
UFUNCTION()
bool HasGameplayItemBank(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GameplayItemBank);
}
FC_GameplayItemBank& AssignGameplayItemBank(const FECSEntity &inout Entity, const FC_GameplayItemBank &inout DefaultValue = FC_GameplayItemBank())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GameplayItemBank, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGameplayItemBank_BP(const FECSEntity &inout Entity, const FC_GameplayItemBank &inout DefaultValue = FC_GameplayItemBank())
{
    ECSFunc_FC_GameplayItemBank::AssignGameplayItemBank(Entity, DefaultValue);
    return;
}
FC_GameplayItemBank& ModifyGameplayItemBank(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GameplayItemBank));
    return local_12.GetComp();
}
FC_GameplayItemBank& ModifyOrAddGameplayItemBank(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GameplayItemBank));
    return local_12.GetComp();
}
const FC_GameplayItemBank& GetGameplayItemBank(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GameplayItemBank));
    return local_12.GetComp();
}
UFUNCTION()
FC_GameplayItemBank GetGameplayItemBank_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GameplayItemBank& local_4 = ECSFunc_FC_GameplayItemBank::GetGameplayItemBank(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GameplayItemBank();
}
const FC_GameplayItemBank GetDefaultedGameplayItemBank(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GameplayItemBank __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GameplayItemBank);
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
FC_GameplayItemBank GetDefaultedGameplayItemBank_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GameplayItemBank::GetDefaultedGameplayItemBank(Entity);
}
UFUNCTION()
bool RemoveGameplayItemBank(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GameplayItemBank);
}
}
FECSMonitorRuntimeView __GetMonitorGameplayItemBankOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GameplayItemBank, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayItemBankOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GameplayItemBank, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayItemBankOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GameplayItemBank, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayItemBankOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GameplayItemBank, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameplayItemBankOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GameplayItemBank, bFixedFrame, bMustHandleAll);
}
void __MonitorGameplayItemBankLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GameplayItemBank, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameplayItemBankActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GameplayItemBank, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameplayItemBankModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GameplayItemBank, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FGameplayInventoryItemData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FGameplayInventoryItemData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FGameplayInventoryItemData
{
int __IndexOf_Config()
{
    return 0;
}
int __IndexOf_Num()
{
    return 1;
}
int __IndexOf_LastModifiedTimestamp()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_GameplayInventory &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_GameplayInventory &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_GameplayInventory &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_GameplayInventory
{
int __IndexOf_Items()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_GameplayItemBank &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_GameplayItemBank &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_GameplayItemBank &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_GameplayItemBank
{
int __IndexOf_Items()
{
    return 0;
}
}
