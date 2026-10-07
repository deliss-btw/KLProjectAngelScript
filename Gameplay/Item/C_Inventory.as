
namespace FInventoryItemData
{
    const FInventoryItemData Dummy = FInventoryItemData();
}
namespace __INTENRAL_FC_CollectItem_NS
{
    const TECSComponentDerivedPtr<FC_CollectItem> DerivedPtr = TECSComponentDerivedPtr<FC_CollectItem>();
    const FC_CollectItem DefaultValue = FC_CollectItem();
}
namespace __INTENRAL_FC_InventoryInitConfig_NS
{
    const TECSComponentDerivedPtr<FC_InventoryInitConfig> DerivedPtr = TECSComponentDerivedPtr<FC_InventoryInitConfig>();
    const FC_InventoryInitConfig DefaultValue = FC_InventoryInitConfig();
}
namespace __INTENRAL_FC_ConsumableItemNeedInitTag_NS
{
    const TECSComponentDerivedPtr<FC_ConsumableItemNeedInitTag> DerivedPtr = TECSComponentDerivedPtr<FC_ConsumableItemNeedInitTag>();
    const FC_ConsumableItemNeedInitTag DefaultValue = FC_ConsumableItemNeedInitTag();
}
namespace __INTENRAL_FC_ThreeChooseOneInfo_NS
{
    const TECSComponentDerivedPtr<FC_ThreeChooseOneInfo> DerivedPtr = TECSComponentDerivedPtr<FC_ThreeChooseOneInfo>();
    const FC_ThreeChooseOneInfo DefaultValue = FC_ThreeChooseOneInfo();
}
namespace __INTENRAL_FC_ThreeChooseOnePlayerRecord_NS
{
    const TECSComponentDerivedPtr<FC_ThreeChooseOnePlayerRecord> DerivedPtr = TECSComponentDerivedPtr<FC_ThreeChooseOnePlayerRecord>();
    const FC_ThreeChooseOnePlayerRecord DefaultValue = FC_ThreeChooseOnePlayerRecord();
}
namespace __INTENRAL_FCE_ThreeChooseOneRequest_NS
{
    const TECSEventDerivedPtr<FCE_ThreeChooseOneRequest> DerivedPtr = TECSEventDerivedPtr<FCE_ThreeChooseOneRequest>();
}
namespace __INTENRAL_FCE_ConsumeCombatItemEvent_NS
{
    const TECSEventDerivedPtr<FCE_ConsumeCombatItemEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ConsumeCombatItemEvent>();
}
namespace __INTENRAL_FCE_UISetMotionIndex_NS
{
    const TECSEventDerivedPtr<FCE_UISetMotionIndex> DerivedPtr = TECSEventDerivedPtr<FCE_UISetMotionIndex>();
}
namespace __INTENRAL_FCE_SelectTargetChanged_NS
{
    const TECSEventDerivedPtr<FCE_SelectTargetChanged> DerivedPtr = TECSEventDerivedPtr<FCE_SelectTargetChanged>();

}
struct FC_CollectItem : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<int> m_Nums;
    UPROPERTY()
    TArray<TDataObjectPtr<FItemConfig>> m_Items;

    FC_CollectItem()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_CollectItem(const FC_CollectItem &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Nums = Other.m_Nums;
        this.m_Items = Other.m_Items;
        return;
    }
    FC_CollectItem opAssign(const FC_CollectItem &inout Other)
    {
        FC_CollectItem __r;
        this.SetNums(Other.GetNums());
        this.SetItems(Other.GetItems());
        return __r;
    }
    const TArray<int> GetNums() const property
    {
        const TArray<int> __r;
        return __r;
    }
    TArray<int> GetModify_Nums() property
    {
        TArray<int> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetNums(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Nums = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FItemConfig>> GetItems() const property
    {
        const TArray<TDataObjectPtr<FItemConfig>> __r;
        return __r;
    }
    TArray<TDataObjectPtr<FItemConfig>> GetModify_Items() property
    {
        TArray<TDataObjectPtr<FItemConfig>> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetItems(const TArray<TDataObjectPtr<FItemConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Items = __Value;
        return;
    }
}

struct FInventoryInitItem
{
    UPROPERTY()
    TDataObjectPtr<FItemConfig> Item;
    UPROPERTY()
    int Num;


}

struct FC_InventoryInitConfig : FECSComponent
{
    UPROPERTY()
    TArray<FInventoryInitItem> InitItems;

    FC_InventoryInitConfig()
    {
        return;
    }
}

struct FInventoryItemData
{
    UPROPERTY()
    int Num;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> Config;


}

struct FC_ConsumableItemNeedInitTag : FECSComponent
{
    FC_ConsumableItemNeedInitTag()
    {
        return;
    }
}

struct FC_ThreeChooseOneInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FTraitParam> m_Infos;

    FC_ThreeChooseOneInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ThreeChooseOneInfo(const FC_ThreeChooseOneInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Infos = Other.m_Infos;
        return;
    }
    FC_ThreeChooseOneInfo opAssign(const FC_ThreeChooseOneInfo &inout Other)
    {
        FC_ThreeChooseOneInfo __r;
        this.SetInfos(Other.GetInfos());
        return __r;
    }
    const TArray<FTraitParam> GetInfos() const property
    {
        const TArray<FTraitParam> __r;
        return __r;
    }
    TArray<FTraitParam> GetModify_Infos() property
    {
        TArray<FTraitParam> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetInfos(const TArray<FTraitParam> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Infos = __Value;
        return;
    }
}

struct FC_ThreeChooseOnePlayerRecord : FECSComponent
{
    UPROPERTY()
    TMap<TDataObjectPtr<FTraitConfig>, int> ChoosedTraitCount;

    FC_ThreeChooseOnePlayerRecord()
    {
        return;
    }
}

struct FCE_ThreeChooseOneRequest : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity ChooseItemEntity;
    UPROPERTY()
    int ChooseIndex;


    bool Validate() const
    {
        return true;
    }
}

struct FCE_ConsumeCombatItemEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FCombatItemConfig> CombatItemConfig;

    FCE_ConsumeCombatItemEvent()
    {
        return;
    }
}

struct FCE_UISetMotionIndex : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int PageIndex;


}

struct FCE_SelectTargetChanged : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity InteractTarget;

    FCE_SelectTargetChanged()
    {
        return;
    }
}

namespace ECSFunc_FC_CollectItem
{
UFUNCTION()
bool HasCollectItem(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CollectItem);
}
FC_CollectItem& AssignCollectItem(const FECSEntity &inout Entity, const FC_CollectItem &inout DefaultValue = FC_CollectItem())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CollectItem, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCollectItem_BP(const FECSEntity &inout Entity, const FC_CollectItem &inout DefaultValue = FC_CollectItem())
{
    ECSFunc_FC_CollectItem::AssignCollectItem(Entity, DefaultValue);
    return;
}
FC_CollectItem& ModifyCollectItem(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CollectItem));
    return local_12.GetComp();
}
FC_CollectItem& ModifyOrAddCollectItem(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CollectItem));
    return local_12.GetComp();
}
const FC_CollectItem& GetCollectItem(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CollectItem));
    return local_12.GetComp();
}
UFUNCTION()
FC_CollectItem GetCollectItem_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CollectItem& local_4 = ECSFunc_FC_CollectItem::GetCollectItem(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CollectItem();
}
const FC_CollectItem GetDefaultedCollectItem(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CollectItem __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CollectItem);
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
FC_CollectItem GetDefaultedCollectItem_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CollectItem::GetDefaultedCollectItem(Entity);
}
UFUNCTION()
bool RemoveCollectItem(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CollectItem);
}
}
FECSMonitorRuntimeView __GetMonitorCollectItemOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CollectItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectItemOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CollectItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectItemOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CollectItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectItemOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CollectItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectItemOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CollectItem, bFixedFrame, bMustHandleAll);
}
void __MonitorCollectItemLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CollectItem, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCollectItemActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CollectItem, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCollectItemModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CollectItem, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_InventoryInitConfig
{
UFUNCTION()
bool HasInventoryInitConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InventoryInitConfig);
}
FC_InventoryInitConfig& AssignInventoryInitConfig(const FECSEntity &inout Entity, const FC_InventoryInitConfig &inout DefaultValue = FC_InventoryInitConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InventoryInitConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInventoryInitConfig_BP(const FECSEntity &inout Entity, const FC_InventoryInitConfig &inout DefaultValue = FC_InventoryInitConfig())
{
    ECSFunc_FC_InventoryInitConfig::AssignInventoryInitConfig(Entity, DefaultValue);
    return;
}
FC_InventoryInitConfig& ModifyInventoryInitConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InventoryInitConfig));
    return local_12.GetComp();
}
FC_InventoryInitConfig& ModifyOrAddInventoryInitConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InventoryInitConfig));
    return local_12.GetComp();
}
const FC_InventoryInitConfig& GetInventoryInitConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InventoryInitConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_InventoryInitConfig GetInventoryInitConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_InventoryInitConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_InventoryInitConfig::GetInventoryInitConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_InventoryInitConfig GetDefaultedInventoryInitConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InventoryInitConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InventoryInitConfig);
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
FC_InventoryInitConfig GetDefaultedInventoryInitConfig_BP(const FECSEntity &inout Entity)
{
    FC_InventoryInitConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveInventoryInitConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InventoryInitConfig);
}
}
FECSMonitorRuntimeView __GetMonitorInventoryInitConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InventoryInitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInventoryInitConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InventoryInitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInventoryInitConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InventoryInitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInventoryInitConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InventoryInitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInventoryInitConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InventoryInitConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorInventoryInitConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InventoryInitConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInventoryInitConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InventoryInitConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInventoryInitConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InventoryInitConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ConsumableItemNeedInitTag
{
UFUNCTION()
bool HasConsumableItemNeedInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ConsumableItemNeedInitTag);
}
FC_ConsumableItemNeedInitTag& AssignConsumableItemNeedInitTag(const FECSEntity &inout Entity, const FC_ConsumableItemNeedInitTag &inout DefaultValue = FC_ConsumableItemNeedInitTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ConsumableItemNeedInitTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignConsumableItemNeedInitTag_BP(const FECSEntity &inout Entity, const FC_ConsumableItemNeedInitTag &inout DefaultValue = FC_ConsumableItemNeedInitTag())
{
    ECSFunc_FC_ConsumableItemNeedInitTag::AssignConsumableItemNeedInitTag(Entity, DefaultValue);
    return;
}
FC_ConsumableItemNeedInitTag& ModifyConsumableItemNeedInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ConsumableItemNeedInitTag));
    return local_12.GetComp();
}
FC_ConsumableItemNeedInitTag& ModifyOrAddConsumableItemNeedInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ConsumableItemNeedInitTag));
    return local_12.GetComp();
}
const FC_ConsumableItemNeedInitTag& GetConsumableItemNeedInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ConsumableItemNeedInitTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ConsumableItemNeedInitTag GetConsumableItemNeedInitTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ConsumableItemNeedInitTag& local_4 = ECSFunc_FC_ConsumableItemNeedInitTag::GetConsumableItemNeedInitTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ConsumableItemNeedInitTag();
}
const FC_ConsumableItemNeedInitTag GetDefaultedConsumableItemNeedInitTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ConsumableItemNeedInitTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ConsumableItemNeedInitTag);
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
FC_ConsumableItemNeedInitTag GetDefaultedConsumableItemNeedInitTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ConsumableItemNeedInitTag::GetDefaultedConsumableItemNeedInitTag(Entity);
}
UFUNCTION()
bool RemoveConsumableItemNeedInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ConsumableItemNeedInitTag);
}
}
FECSMonitorRuntimeView __GetMonitorConsumableItemNeedInitTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ConsumableItemNeedInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorConsumableItemNeedInitTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ConsumableItemNeedInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorConsumableItemNeedInitTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ConsumableItemNeedInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorConsumableItemNeedInitTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ConsumableItemNeedInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorConsumableItemNeedInitTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ConsumableItemNeedInitTag, bFixedFrame, bMustHandleAll);
}
void __MonitorConsumableItemNeedInitTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ConsumableItemNeedInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorConsumableItemNeedInitTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ConsumableItemNeedInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorConsumableItemNeedInitTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ConsumableItemNeedInitTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ThreeChooseOneInfo
{
UFUNCTION()
bool HasThreeChooseOneInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ThreeChooseOneInfo);
}
FC_ThreeChooseOneInfo& AssignThreeChooseOneInfo(const FECSEntity &inout Entity, const FC_ThreeChooseOneInfo &inout DefaultValue = FC_ThreeChooseOneInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ThreeChooseOneInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignThreeChooseOneInfo_BP(const FECSEntity &inout Entity, const FC_ThreeChooseOneInfo &inout DefaultValue = FC_ThreeChooseOneInfo())
{
    ECSFunc_FC_ThreeChooseOneInfo::AssignThreeChooseOneInfo(Entity, DefaultValue);
    return;
}
FC_ThreeChooseOneInfo& ModifyThreeChooseOneInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ThreeChooseOneInfo));
    return local_12.GetComp();
}
FC_ThreeChooseOneInfo& ModifyOrAddThreeChooseOneInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ThreeChooseOneInfo));
    return local_12.GetComp();
}
const FC_ThreeChooseOneInfo& GetThreeChooseOneInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ThreeChooseOneInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_ThreeChooseOneInfo GetThreeChooseOneInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ThreeChooseOneInfo& local_4 = ECSFunc_FC_ThreeChooseOneInfo::GetThreeChooseOneInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ThreeChooseOneInfo();
}
const FC_ThreeChooseOneInfo GetDefaultedThreeChooseOneInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ThreeChooseOneInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ThreeChooseOneInfo);
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
FC_ThreeChooseOneInfo GetDefaultedThreeChooseOneInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ThreeChooseOneInfo::GetDefaultedThreeChooseOneInfo(Entity);
}
UFUNCTION()
bool RemoveThreeChooseOneInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ThreeChooseOneInfo);
}
}
FECSMonitorRuntimeView __GetMonitorThreeChooseOneInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ThreeChooseOneInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThreeChooseOneInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ThreeChooseOneInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThreeChooseOneInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ThreeChooseOneInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThreeChooseOneInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ThreeChooseOneInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThreeChooseOneInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ThreeChooseOneInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorThreeChooseOneInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ThreeChooseOneInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThreeChooseOneInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ThreeChooseOneInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThreeChooseOneInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ThreeChooseOneInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ThreeChooseOnePlayerRecord
{
UFUNCTION()
bool HasThreeChooseOnePlayerRecord(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ThreeChooseOnePlayerRecord);
}
FC_ThreeChooseOnePlayerRecord& AssignThreeChooseOnePlayerRecord(const FECSEntity &inout Entity, const FC_ThreeChooseOnePlayerRecord &inout DefaultValue = FC_ThreeChooseOnePlayerRecord())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ThreeChooseOnePlayerRecord, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignThreeChooseOnePlayerRecord_BP(const FECSEntity &inout Entity, const FC_ThreeChooseOnePlayerRecord &inout DefaultValue = FC_ThreeChooseOnePlayerRecord())
{
    ECSFunc_FC_ThreeChooseOnePlayerRecord::AssignThreeChooseOnePlayerRecord(Entity, DefaultValue);
    return;
}
FC_ThreeChooseOnePlayerRecord& ModifyThreeChooseOnePlayerRecord(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ThreeChooseOnePlayerRecord));
    return local_12.GetComp();
}
FC_ThreeChooseOnePlayerRecord& ModifyOrAddThreeChooseOnePlayerRecord(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ThreeChooseOnePlayerRecord));
    return local_12.GetComp();
}
const FC_ThreeChooseOnePlayerRecord& GetThreeChooseOnePlayerRecord(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ThreeChooseOnePlayerRecord));
    return local_12.GetComp();
}
UFUNCTION()
FC_ThreeChooseOnePlayerRecord GetThreeChooseOnePlayerRecord_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ThreeChooseOnePlayerRecord __r;
    bValid = false;
    bValid = ECSFunc_FC_ThreeChooseOnePlayerRecord::GetThreeChooseOnePlayerRecord(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ThreeChooseOnePlayerRecord GetDefaultedThreeChooseOnePlayerRecord(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ThreeChooseOnePlayerRecord __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ThreeChooseOnePlayerRecord);
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
FC_ThreeChooseOnePlayerRecord GetDefaultedThreeChooseOnePlayerRecord_BP(const FECSEntity &inout Entity)
{
    FC_ThreeChooseOnePlayerRecord __r;
    return __r;
}
UFUNCTION()
bool RemoveThreeChooseOnePlayerRecord(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ThreeChooseOnePlayerRecord);
}
}
FECSMonitorRuntimeView __GetMonitorThreeChooseOnePlayerRecordOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ThreeChooseOnePlayerRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThreeChooseOnePlayerRecordOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ThreeChooseOnePlayerRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThreeChooseOnePlayerRecordOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ThreeChooseOnePlayerRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThreeChooseOnePlayerRecordOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ThreeChooseOnePlayerRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThreeChooseOnePlayerRecordOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ThreeChooseOnePlayerRecord, bFixedFrame, bMustHandleAll);
}
void __MonitorThreeChooseOnePlayerRecordLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ThreeChooseOnePlayerRecord, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThreeChooseOnePlayerRecordActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ThreeChooseOnePlayerRecord, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThreeChooseOnePlayerRecordModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ThreeChooseOnePlayerRecord, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CollectItem &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CollectItem &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CollectItem &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CollectItem
{
int __IndexOf_Nums()
{
    return 0;
}
int __IndexOf_Items()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ThreeChooseOneInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ThreeChooseOneInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ThreeChooseOneInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ThreeChooseOneInfo
{
int __IndexOf_Infos()
{
    return 0;
}
}
