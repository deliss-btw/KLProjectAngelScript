
namespace __INTENRAL_FC_ItemAction_NS
{
    const TECSComponentDerivedPtr<FC_ItemAction> DerivedPtr = TECSComponentDerivedPtr<FC_ItemAction>();
    const FC_ItemAction DefaultValue = FC_ItemAction();
}
namespace __INTENRAL_FC_ItemActionESM_NS
{
    const TECSComponentDerivedPtr<FC_ItemActionESM> DerivedPtr = TECSComponentDerivedPtr<FC_ItemActionESM>();
    const FC_ItemActionESM DefaultValue = FC_ItemActionESM();
}
namespace __INTENRAL_FCE_ItemActionStart_NS
{
    const TECSEventDerivedPtr<FCE_ItemActionStart> DerivedPtr = TECSEventDerivedPtr<FCE_ItemActionStart>();

}
struct FC_ItemAction : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FItemActionInstance> m_RunningItemActions;
    UPROPERTY()
    TArray<int> m_ExecutingItemActionIndexStack;
    UPROPERTY()
    int m_NextInstanceID;
    UPROPERTY()
    bool m_bNeedClear;

    FC_ItemAction()
    {
        this.m_NextInstanceID = 0;
        this.m_bNeedClear = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_ItemAction(const FC_ItemAction &inout Other)
    {
        this.m_NextInstanceID = 0;
        this.m_bNeedClear = false;
        this.__InitDirtyFlags();
        this.m_RunningItemActions = Other.m_RunningItemActions;
        this.m_ExecutingItemActionIndexStack = Other.m_ExecutingItemActionIndexStack;
        this.m_NextInstanceID = int(Other.m_NextInstanceID);
        this.m_bNeedClear = Other.m_bNeedClear;
        return;
    }
    FC_ItemAction opAssign(const FC_ItemAction &inout Other)
    {
        FC_ItemAction __r;
        this.SetRunningItemActions(Other.GetRunningItemActions());
        this.SetExecutingItemActionIndexStack(Other.GetExecutingItemActionIndexStack());
        this.SetNextInstanceID(Other.GetNextInstanceID());
        this.SetbNeedClear(Other.GetbNeedClear());
        return __r;
    }
    bool HasRunningAction(const FItemActionConfigPtr &inout ConfigPtr) const
    {
        for (auto& local_16 : this.GetRunningItemActions())
        {
            if ((local_16.GetActionConfigPtr() == ConfigPtr))
            {
                return true;
            }
        }
        return false;
    }
    int FindRunningActionIndex(const FItemActionConfigPtr &inout ConfigPtr) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    FItemActionConfigPtr FindRunningActionByInstanceID(const int InstanceID) const
    {
        FItemActionConfigPtr __r;
        if (InstanceID < 0)
        {
        }
        else
        {
            int local_29 = 0;
            for (; local_29 < this.GetRunningItemActions().Num(); ++local_29)
            {
                if (this.GetRunningItemActions()[local_29].GetInstanceID() == InstanceID)
                {
                    FItemActionConfigPtr local_28 = this.GetRunningItemActions()[local_29].GetActionConfigPtr();
                    return __r;
                }
            }
        }
        return __r;
    }
    int FindRunningActionIndexByInstanceID(const int InstanceID) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    int ExecuteNewAction(const FItemActionSource &inout ActionSource, const FItemActionConfigPtr &inout ActionConfigPtr)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    void TickRunningActions()
    {
        int local_1 = 0;
        for (; local_1 < this.GetRunningItemActions().Num(); )
        {
            this.BeginExecute(local_1);
            this.GetExecutingInstance().GetActionConfig().TickAction(this.GetExecutingInstance().GetRuntimeInfo());
            this.EndExecute();
            ++local_1;
        }
        return;
    }
    int BeginExecuteNewInstance(const FItemActionConfigPtr &inout Config, const FItemActionSource &inout ActionSource)
    {
        int local_49;
        this.GetModify_ExecutingItemActionIndexStack().Add(this.GetModify_RunningItemActions().Num());
        FItemActionRuntimeInfo local_48;
        local_48.SetActionSource(ActionSource);
        local_49 = this.GetNextInstanceID();
        this.SetNextInstanceID((this.GetNextInstanceID() + 1));
        if (this.GetNextInstanceID() < 0)
        {
            this.SetNextInstanceID(0);
        }
        this.GetModify_RunningItemActions().Add(FItemActionInstance(Config, local_48, local_49));
        return local_49;
    }
    bool EndExecuteNewInstance()
    {
        bool local_1;
        if (this.GetRunningItemActions().Last(0).GetIsAlive())
        {
            this.GetExecutingInstance().GetActionConfig().ExecuteEnterRunning(this.GetExecutingInstance().GetRuntimeInfo());
            local_1 = true;
        }
        else
        {
            this.GetModify_RunningItemActions().RemoveAt(this.GetExecutingItemActionIndexStack().Last(0));
            local_1 = false;
        }
        this.GetModify_ExecutingItemActionIndexStack().RemoveAt((this.GetExecutingItemActionIndexStack().Num() - 1));
        return local_1;
    }
    void BeginExecute(const int ExecuteIndex)
    {
        this.GetModify_ExecutingItemActionIndexStack().Add(ExecuteIndex);
        return;
    }
    void EndExecute()
    {
        if (!(this.GetExecutingItemActionIndexStack().IsEmpty()))
        {
            if (!(this.GetExecutingInstance().GetIsAlive()))
            {
                this.SetbNeedClear(true);
            }
        }
        this.GetModify_ExecutingItemActionIndexStack().RemoveAt((this.GetExecutingItemActionIndexStack().Num() - 1));
        return;
    }
    FItemActionInstance& GetExecutingInstance()
    {
        return this.GetModify_RunningItemActions()[this.GetExecutingItemActionIndexStack().Last(0)];
    }
    void ClearNotAliveInstances()
    {
        if (!(this.GetbNeedClear()))
        {
            return;
        }
        this.SetbNeedClear(false);
        TArray<int> local_6;
        int local_7 = 0;
        for (; local_7 < this.GetRunningItemActions().Num(); ++local_7)
        {
            if (!(this.GetRunningItemActions()[local_7].GetIsAlive()))
            {
                local_6.Add(local_7);
            }
        }
        if (local_6.IsEmpty())
        {
            return;
        }
        int local_8 = this.GetRunningItemActions().Num() - local_6.Num();
        int local_10 = 0;
        int local_11 = local_8;
        for (; local_11 < this.GetRunningItemActions().Num(); ++local_11)
        {
            if (local_6.Contains(local_11))
            {
                continue;
            }
            int local_7_2 = local_6[local_10];
            ++local_10;
        }
        this.GetModify_RunningItemActions().SetNum(local_8);
        return;
    }
    const TArray<FItemActionInstance> GetRunningItemActions() const property
    {
        const TArray<FItemActionInstance> __r;
        return __r;
    }
    TArray<FItemActionInstance> GetModify_RunningItemActions() property
    {
        TArray<FItemActionInstance> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRunningItemActions(const TArray<FItemActionInstance> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RunningItemActions = __Value;
        return;
    }
    const TArray<int> GetExecutingItemActionIndexStack() const property
    {
        const TArray<int> __r;
        return __r;
    }
    TArray<int> GetModify_ExecutingItemActionIndexStack() property
    {
        TArray<int> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetExecutingItemActionIndexStack(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ExecutingItemActionIndexStack = __Value;
        return;
    }
    int GetNextInstanceID() const property
    {
        return this.m_NextInstanceID;
    }
    void SetNextInstanceID(const int __Value) property
    {
        if (this.m_NextInstanceID == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_NextInstanceID = __Value;
        return;
    }
    bool GetbNeedClear() const property
    {
        return this.m_bNeedClear;
    }
    void SetbNeedClear(const bool __Value) property
    {
        if (!(this.m_bNeedClear) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bNeedClear = __Value;
        return;
    }
}

struct FC_ItemActionESM : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_ItemActionTag;
    UPROPERTY()
    bool m_bHasPayCost;
    UPROPERTY()
    int m_RunningESMActionIndexID;
    UPROPERTY()
    int m_PendingESMActionIndexID;
    UPROPERTY()
    FECSEntity m_OwnerEntity;

    FC_ItemActionESM()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ItemActionESM(const FC_ItemActionESM &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ItemActionESM opAssign(const FC_ItemActionESM &inout Other)
    {
        FC_ItemActionESM __r;
        this.SetItemActionTag(Other.GetItemActionTag());
        this.SetbHasPayCost(Other.GetbHasPayCost());
        this.SetRunningESMActionIndexID(Other.GetRunningESMActionIndexID());
        this.SetPendingESMActionIndexID(Other.GetPendingESMActionIndexID());
        this.SetOwnerEntity(Other.GetOwnerEntity());
        return __r;
    }
    void NotifyEnterESMAction()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void NotifyExitESMAction()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void NotifyESMActionPayCost()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void NotifyESMActionCustomTrigger(const FGameplayTag &inout CustomTrigger)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    bool RegisterPendingESMAction()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    int GetRunningESMActionIndex() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    UItemActionConfig_ESMAction GetExecutingESMActionConfig()
    {
        Modify local_4;
        return Cast<UItemActionConfig_ESMAction>(local_4.opCall().GetExecutingInstance().GetActionConfig());
    }
    FName GetItemActionTag() const property
    {
        return this.m_ItemActionTag;
    }
    void SetItemActionTag(const FName &inout __Value) property
    {
        if ((this.m_ItemActionTag == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ItemActionTag = __Value;
        return;
    }
    bool GetbHasPayCost() const property
    {
        return this.m_bHasPayCost;
    }
    void SetbHasPayCost(const bool __Value) property
    {
        if (!(this.m_bHasPayCost) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bHasPayCost = __Value;
        return;
    }
    int GetRunningESMActionIndexID() const property
    {
        return this.m_RunningESMActionIndexID;
    }
    void SetRunningESMActionIndexID(const int __Value) property
    {
        if (this.m_RunningESMActionIndexID == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_RunningESMActionIndexID = __Value;
        return;
    }
    int GetPendingESMActionIndexID() const property
    {
        return this.m_PendingESMActionIndexID;
    }
    void SetPendingESMActionIndexID(const int __Value) property
    {
        if (this.m_PendingESMActionIndexID == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_PendingESMActionIndexID = __Value;
        return;
    }
    FECSEntity GetOwnerEntity() const property
    {
        FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_OwnerEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetOwnerEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_OwnerEntity = __Value;
        return;
    }
}

struct FCE_ItemActionStart : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FItemActionSource ItemActionSource;
    UPROPERTY()
    FItemActionConfigPtr ItemActionConfig;

    FCE_ItemActionStart()
    {
        return;
    }
}

namespace ECSFunc_FC_ItemAction
{
UFUNCTION()
bool HasItemAction(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ItemAction);
}
FC_ItemAction& AssignItemAction(const FECSEntity &inout Entity, const FC_ItemAction &inout DefaultValue = FC_ItemAction())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ItemAction, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignItemAction_BP(const FECSEntity &inout Entity, const FC_ItemAction &inout DefaultValue = FC_ItemAction())
{
    ECSFunc_FC_ItemAction::AssignItemAction(Entity, DefaultValue);
    return;
}
FC_ItemAction& ModifyItemAction(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ItemAction));
    return local_12.GetComp();
}
FC_ItemAction& ModifyOrAddItemAction(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ItemAction));
    return local_12.GetComp();
}
const FC_ItemAction& GetItemAction(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ItemAction));
    return local_12.GetComp();
}
UFUNCTION()
FC_ItemAction GetItemAction_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ItemAction& local_4 = ECSFunc_FC_ItemAction::GetItemAction(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ItemAction();
}
const FC_ItemAction GetDefaultedItemAction(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ItemAction __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ItemAction);
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
FC_ItemAction GetDefaultedItemAction_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ItemAction::GetDefaultedItemAction(Entity);
}
UFUNCTION()
bool RemoveItemAction(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ItemAction);
}
}
FECSMonitorRuntimeView __GetMonitorItemActionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ItemAction, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemActionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ItemAction, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemActionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ItemAction, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemActionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ItemAction, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemActionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ItemAction, bFixedFrame, bMustHandleAll);
}
void __MonitorItemActionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ItemAction, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorItemActionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ItemAction, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorItemActionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ItemAction, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ItemActionESM
{
UFUNCTION()
bool HasItemActionESM(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ItemActionESM);
}
FC_ItemActionESM& AssignItemActionESM(const FECSEntity &inout Entity, const FC_ItemActionESM &inout DefaultValue = FC_ItemActionESM())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ItemActionESM, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignItemActionESM_BP(const FECSEntity &inout Entity, const FC_ItemActionESM &inout DefaultValue = FC_ItemActionESM())
{
    ECSFunc_FC_ItemActionESM::AssignItemActionESM(Entity, DefaultValue);
    return;
}
FC_ItemActionESM& ModifyItemActionESM(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ItemActionESM));
    return local_12.GetComp();
}
FC_ItemActionESM& ModifyOrAddItemActionESM(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ItemActionESM));
    return local_12.GetComp();
}
const FC_ItemActionESM& GetItemActionESM(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ItemActionESM));
    return local_12.GetComp();
}
UFUNCTION()
FC_ItemActionESM GetItemActionESM_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ItemActionESM& local_4 = ECSFunc_FC_ItemActionESM::GetItemActionESM(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ItemActionESM();
}
const FC_ItemActionESM GetDefaultedItemActionESM(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ItemActionESM __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ItemActionESM);
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
FC_ItemActionESM GetDefaultedItemActionESM_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ItemActionESM::GetDefaultedItemActionESM(Entity);
}
UFUNCTION()
bool RemoveItemActionESM(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ItemActionESM);
}
}
FECSMonitorRuntimeView __GetMonitorItemActionESMOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ItemActionESM, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemActionESMOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ItemActionESM, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemActionESMOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ItemActionESM, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemActionESMOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ItemActionESM, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemActionESMOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ItemActionESM, bFixedFrame, bMustHandleAll);
}
void __MonitorItemActionESMLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ItemActionESM, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorItemActionESMActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ItemActionESM, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorItemActionESMModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ItemActionESM, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_ItemActionESM_ItemActionTag(const FECSEntity &inout Entity, FName &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FName(local_4.opCall().GetItemActionTag());
    return;
}
void GetEntityBBVar_ItemActionESM_bHasPayCost(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetbHasPayCost();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ItemAction &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ItemAction &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ItemAction &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ItemAction
{
int __IndexOf_RunningItemActions()
{
    return 0;
}
int __IndexOf_ExecutingItemActionIndexStack()
{
    return 1;
}
int __IndexOf_NextInstanceID()
{
    return 2;
}
int __IndexOf_bNeedClear()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ItemActionESM &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ItemActionESM &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ItemActionESM &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ItemActionESM
{
int __IndexOf_ItemActionTag()
{
    return 0;
}
int __IndexOf_bHasPayCost()
{
    return 1;
}
int __IndexOf_RunningESMActionIndexID()
{
    return 2;
}
int __IndexOf_PendingESMActionIndexID()
{
    return 3;
}
int __IndexOf_OwnerEntity()
{
    return 4;
}
}
