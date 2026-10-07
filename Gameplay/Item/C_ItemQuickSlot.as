
namespace __INTENRAL_FC_ItemQuickSlotNeedInitTag_NS
{
    const TECSComponentDerivedPtr<FC_ItemQuickSlotNeedInitTag> DerivedPtr = TECSComponentDerivedPtr<FC_ItemQuickSlotNeedInitTag>();
    const FC_ItemQuickSlotNeedInitTag DefaultValue = FC_ItemQuickSlotNeedInitTag();
}
namespace __INTENRAL_FC_ItemQuickSlot_NS
{
    const TECSComponentDerivedPtr<FC_ItemQuickSlot> DerivedPtr = TECSComponentDerivedPtr<FC_ItemQuickSlot>();
    const FC_ItemQuickSlot DefaultValue = FC_ItemQuickSlot();
}
namespace __INTENRAL_FC_ItemQuickSlotChangeHistory_NS
{
    const TECSComponentDerivedPtr<FC_ItemQuickSlotChangeHistory> DerivedPtr = TECSComponentDerivedPtr<FC_ItemQuickSlotChangeHistory>();
    const FC_ItemQuickSlotChangeHistory DefaultValue = FC_ItemQuickSlotChangeHistory();
}
namespace __INTENRAL_FCE_NotifyQuickSlotItemChanged_NS
{
    const TECSEventDerivedPtr<FCE_NotifyQuickSlotItemChanged> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyQuickSlotItemChanged>();
}
namespace __INTENRAL_FCE_RequestSetQuickSlotItem_NS
{
    const TECSEventDerivedPtr<FCE_RequestSetQuickSlotItem> DerivedPtr = TECSEventDerivedPtr<FCE_RequestSetQuickSlotItem>();
}
namespace __INTENRAL_FCE_ItemQuickSlotInit_NS
{
    const TECSEventDerivedPtr<FCE_ItemQuickSlotInit> DerivedPtr = TECSEventDerivedPtr<FCE_ItemQuickSlotInit>();

}
struct FC_ItemQuickSlotNeedInitTag : FECSComponent
{
    FC_ItemQuickSlotNeedInitTag()
    {
        return;
    }
}

struct FC_ItemQuickSlot : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<TDataObjectPtr<FItemQuickSlotConfig>, TDataObjectPtr<FItemConfig>> m_QuickSlots;

    FC_ItemQuickSlot()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ItemQuickSlot(const FC_ItemQuickSlot &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_QuickSlots = Other.m_QuickSlots;
        return;
    }
    FC_ItemQuickSlot opAssign(const FC_ItemQuickSlot &inout Other)
    {
        FC_ItemQuickSlot __r;
        this.SetQuickSlots(Other.GetQuickSlots());
        return __r;
    }
    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        FC_ItemQuickSlotNeedInitTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        return;
    }
    void Save(const FECSEntity &inout Entity)
    {
        Get local_4;
        const FC_PlayerController& local_6 = local_4.opCall();
        if (local_6)
        {
            int local_8;
            local_8 = local_6.GetPlayerId();
            FPbDsPlayerInfo local_32 = ::UGameDSConnectionSubsystem::Get().GetPlayerInfo(local_8);
            if (local_32.IsValid())
            {
                FPbDSMiscInfo local_52 = local_32.GetDsMiscInfo();
                local_52.ClearQuickSlotList();
                for (auto& local_70 : this.GetQuickSlots())
                {
                    TDataObjectPtr<FItemConfig> local_94;
                    TDataObjectPtr<FItemConfig> local_118;
                    local_94 = local_118;
                    if ((!((local_94 == nullptr))))
                    {
                        CastTo local_122;
                        if (local_122.opCall())
                        {
                            continue;
                        }
                        FPbQuickSlotInfo local_166 = local_52.AddQuickSlotList();
                        int local_167 = local_70.GetKey().opArrow().DataId;
                        local_166.SetSlotKey(local_167);
                        local_167 = opArrow().DataId;
                        local_166.SetItemKey(local_167);
                        XLog(ELog(0), FString().Append("Save QuickSlot: ").Append(local_166.GetSlotKey()).Append(" ").Append(local_166.GetItemKey()));
                    }
                }
            }
        }
        return;
    }
    const TMap<TDataObjectPtr<FItemQuickSlotConfig>, TDataObjectPtr<FItemConfig>> GetQuickSlots() const property
    {
        const TMap<TDataObjectPtr<FItemQuickSlotConfig>, TDataObjectPtr<FItemConfig>> __r;
        return __r;
    }
    TMap<TDataObjectPtr<FItemQuickSlotConfig>, TDataObjectPtr<FItemConfig>> GetModify_QuickSlots() property
    {
        TMap<TDataObjectPtr<FItemQuickSlotConfig>, TDataObjectPtr<FItemConfig>> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetQuickSlots(const TMap<TDataObjectPtr<FItemQuickSlotConfig>, TDataObjectPtr<FItemConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_QuickSlots = __Value;
        return;
    }
}

struct FItemQuickSlotChange
{
    UPROPERTY()
    TDataObjectPtr<FItemConfig> OldItem;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> NewItem;

    FItemQuickSlotChange()
    {
        return;
    }
}

struct FC_ItemQuickSlotChangeHistory : FECSComponent
{
    UPROPERTY()
    TMap<TDataObjectPtr<FItemQuickSlotConfig>, FItemQuickSlotChange> ChangeHistory;

    FC_ItemQuickSlotChangeHistory()
    {
        return;
    }
    void RecordChange(const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot, const TDataObjectPtr<FItemConfig> &inout OldItem, const TDataObjectPtr<FItemConfig> &inout NewItem)
    {
        FItemQuickSlotChange& local_2 = this.FindOrAdd(QuickSlot);
        if ((!(local_2.OldItem) && !(local_2.NewItem)))
        {
            local_2.OldItem = OldItem;
            local_2.NewItem = NewItem;
            return;
        }
        local_2.NewItem = NewItem;
        TDataObjectPtr<FItemConfig> local_28;
        local_28 = local_2.NewItem;
        FDataObjectPtr local_76;
        local_76;
        if ((local_28 == local_76))
        {
        }
        return;
    }
}

struct FCE_NotifyQuickSlotItemChanged : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FItemQuickSlotConfig> QuickSlot;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> OldItem;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> NewItem;

    FCE_NotifyQuickSlotItemChanged()
    {
        return;
    }
}

struct FCE_RequestSetQuickSlotItem : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FItemQuickSlotConfig> QuickSlot;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> Item;

    FCE_RequestSetQuickSlotItem()
    {
        return;
    }
}

struct FCE_ItemQuickSlotInit : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_ItemQuickSlotInit()
    {
        return;
    }
}

namespace FItemQuickSlotConfig
{
TDataObjectPtr<FItemQuickSlotConfig> GetByDataId(const uint DataId)
{
    return TDataObjectPtr<FItemQuickSlotConfig>();
}
}
namespace ECSFunc_FC_ItemQuickSlotNeedInitTag
{
UFUNCTION()
bool HasItemQuickSlotNeedInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlotNeedInitTag);
}
FC_ItemQuickSlotNeedInitTag& AssignItemQuickSlotNeedInitTag(const FECSEntity &inout Entity, const FC_ItemQuickSlotNeedInitTag &inout DefaultValue = FC_ItemQuickSlotNeedInitTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlotNeedInitTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignItemQuickSlotNeedInitTag_BP(const FECSEntity &inout Entity, const FC_ItemQuickSlotNeedInitTag &inout DefaultValue = FC_ItemQuickSlotNeedInitTag())
{
    ECSFunc_FC_ItemQuickSlotNeedInitTag::AssignItemQuickSlotNeedInitTag(Entity, DefaultValue);
    return;
}
FC_ItemQuickSlotNeedInitTag& ModifyItemQuickSlotNeedInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlotNeedInitTag));
    return local_12.GetComp();
}
FC_ItemQuickSlotNeedInitTag& ModifyOrAddItemQuickSlotNeedInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlotNeedInitTag));
    return local_12.GetComp();
}
const FC_ItemQuickSlotNeedInitTag& GetItemQuickSlotNeedInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlotNeedInitTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ItemQuickSlotNeedInitTag GetItemQuickSlotNeedInitTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ItemQuickSlotNeedInitTag& local_4 = ECSFunc_FC_ItemQuickSlotNeedInitTag::GetItemQuickSlotNeedInitTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ItemQuickSlotNeedInitTag();
}
const FC_ItemQuickSlotNeedInitTag GetDefaultedItemQuickSlotNeedInitTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ItemQuickSlotNeedInitTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlotNeedInitTag);
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
FC_ItemQuickSlotNeedInitTag GetDefaultedItemQuickSlotNeedInitTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ItemQuickSlotNeedInitTag::GetDefaultedItemQuickSlotNeedInitTag(Entity);
}
UFUNCTION()
bool RemoveItemQuickSlotNeedInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlotNeedInitTag);
}
}
FECSMonitorRuntimeView __GetMonitorItemQuickSlotNeedInitTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ItemQuickSlotNeedInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemQuickSlotNeedInitTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ItemQuickSlotNeedInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemQuickSlotNeedInitTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ItemQuickSlotNeedInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemQuickSlotNeedInitTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ItemQuickSlotNeedInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemQuickSlotNeedInitTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ItemQuickSlotNeedInitTag, bFixedFrame, bMustHandleAll);
}
void __MonitorItemQuickSlotNeedInitTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ItemQuickSlotNeedInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorItemQuickSlotNeedInitTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ItemQuickSlotNeedInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorItemQuickSlotNeedInitTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ItemQuickSlotNeedInitTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ItemQuickSlot
{
UFUNCTION()
bool HasItemQuickSlot(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlot);
}
FC_ItemQuickSlot& AssignItemQuickSlot(const FECSEntity &inout Entity, const FC_ItemQuickSlot &inout DefaultValue = FC_ItemQuickSlot())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlot, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignItemQuickSlot_BP(const FECSEntity &inout Entity, const FC_ItemQuickSlot &inout DefaultValue = FC_ItemQuickSlot())
{
    ECSFunc_FC_ItemQuickSlot::AssignItemQuickSlot(Entity, DefaultValue);
    return;
}
FC_ItemQuickSlot& ModifyItemQuickSlot(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlot));
    return local_12.GetComp();
}
FC_ItemQuickSlot& ModifyOrAddItemQuickSlot(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlot));
    return local_12.GetComp();
}
const FC_ItemQuickSlot& GetItemQuickSlot(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlot));
    return local_12.GetComp();
}
UFUNCTION()
FC_ItemQuickSlot GetItemQuickSlot_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ItemQuickSlot& local_4 = ECSFunc_FC_ItemQuickSlot::GetItemQuickSlot(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ItemQuickSlot();
}
const FC_ItemQuickSlot GetDefaultedItemQuickSlot(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ItemQuickSlot __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlot);
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
FC_ItemQuickSlot GetDefaultedItemQuickSlot_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ItemQuickSlot::GetDefaultedItemQuickSlot(Entity);
}
UFUNCTION()
bool RemoveItemQuickSlot(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlot);
}
}
FECSMonitorRuntimeView __GetMonitorItemQuickSlotOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ItemQuickSlot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemQuickSlotOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ItemQuickSlot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemQuickSlotOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ItemQuickSlot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemQuickSlotOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ItemQuickSlot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemQuickSlotOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ItemQuickSlot, bFixedFrame, bMustHandleAll);
}
void __MonitorItemQuickSlotLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ItemQuickSlot, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorItemQuickSlotActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ItemQuickSlot, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorItemQuickSlotModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ItemQuickSlot, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ItemQuickSlotChangeHistory
{
UFUNCTION()
bool HasItemQuickSlotChangeHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlotChangeHistory);
}
FC_ItemQuickSlotChangeHistory& AssignItemQuickSlotChangeHistory(const FECSEntity &inout Entity, const FC_ItemQuickSlotChangeHistory &inout DefaultValue = FC_ItemQuickSlotChangeHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlotChangeHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignItemQuickSlotChangeHistory_BP(const FECSEntity &inout Entity, const FC_ItemQuickSlotChangeHistory &inout DefaultValue = FC_ItemQuickSlotChangeHistory())
{
    ECSFunc_FC_ItemQuickSlotChangeHistory::AssignItemQuickSlotChangeHistory(Entity, DefaultValue);
    return;
}
FC_ItemQuickSlotChangeHistory& ModifyItemQuickSlotChangeHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlotChangeHistory));
    return local_12.GetComp();
}
FC_ItemQuickSlotChangeHistory& ModifyOrAddItemQuickSlotChangeHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlotChangeHistory));
    return local_12.GetComp();
}
const FC_ItemQuickSlotChangeHistory& GetItemQuickSlotChangeHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlotChangeHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_ItemQuickSlotChangeHistory GetItemQuickSlotChangeHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ItemQuickSlotChangeHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_ItemQuickSlotChangeHistory::GetItemQuickSlotChangeHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ItemQuickSlotChangeHistory GetDefaultedItemQuickSlotChangeHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ItemQuickSlotChangeHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlotChangeHistory);
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
FC_ItemQuickSlotChangeHistory GetDefaultedItemQuickSlotChangeHistory_BP(const FECSEntity &inout Entity)
{
    FC_ItemQuickSlotChangeHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveItemQuickSlotChangeHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ItemQuickSlotChangeHistory);
}
}
FECSMonitorRuntimeView __GetMonitorItemQuickSlotChangeHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ItemQuickSlotChangeHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemQuickSlotChangeHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ItemQuickSlotChangeHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemQuickSlotChangeHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ItemQuickSlotChangeHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemQuickSlotChangeHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ItemQuickSlotChangeHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemQuickSlotChangeHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ItemQuickSlotChangeHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorItemQuickSlotChangeHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ItemQuickSlotChangeHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorItemQuickSlotChangeHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ItemQuickSlotChangeHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorItemQuickSlotChangeHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ItemQuickSlotChangeHistory, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ItemQuickSlot &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ItemQuickSlot &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ItemQuickSlot &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ItemQuickSlot
{
int __IndexOf_QuickSlots()
{
    return 0;
}
}
