
enum EItemActionType
{
    Use,
    Drop,
    Destroy,
    Equip,
    MAX,
}

enum EItemActionTriggerPhase
{
    OnStartAction,
    OnPreExecuteAction,
    OnEnterRunning,
    OnExitRunning,
    OnFinishExcuteAction,
    OnExcutionFailed,
}


struct FItemActionSource
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_ItemOwner;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_ItemConfig;
    UPROPERTY()
    uint64 m_ItemUid;
    UPROPERTY()
    bool m_bSpecifyInventoryID;

    FItemActionSource()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FItemActionSource(const FItemActionSource &inout Other)
    {
        this.m_ItemUid = 0;
        this.m_bSpecifyInventoryID = false;
        this.m_ItemOwner = Other.m_ItemOwner;
        this.m_ItemConfig = Other.m_ItemConfig;
        this.m_ItemUid = Other.m_ItemUid;
        this.m_bSpecifyInventoryID = Other.m_bSpecifyInventoryID;
        return;
    }
    FItemActionSource opAssign(const FItemActionSource &inout Other)
    {
        FItemActionSource __r;
        this.SetItemOwner(Other.GetItemOwner());
        this.SetItemConfig(Other.GetItemConfig());
        this.SetItemUid(Other.GetItemUid());
        this.SetbSpecifyInventoryID(Other.GetbSpecifyInventoryID());
        return __r;
    }
    bool IsValid() const
    {
        bool local_1;
        if (!(this.GetItemOwner().IsValid()))
        {
            local_1 = false;
        }
        else
        {
            local_1 = this.GetItemConfig();
        }
        return local_1;
    }
    bool opImplConv() const
    {
        return this.IsValid();
    }
    const FECSEntity GetItemOwner() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_ItemOwner() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetItemOwner(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ItemOwner = __Value;
        return;
    }
    TDataObjectPtr<FItemConfig> GetItemConfig() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_ItemConfig() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetItemConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ItemConfig = __Value;
        return;
    }
    uint64 GetItemUid() const property
    {
        return this.m_ItemUid;
    }
    void SetItemUid(const uint64 __Value) property
    {
        if (this.m_ItemUid == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ItemUid = __Value;
        return;
    }
    bool GetbSpecifyInventoryID() const property
    {
        return this.m_bSpecifyInventoryID;
    }
    void SetbSpecifyInventoryID(const bool __Value) property
    {
        if (!(this.m_bSpecifyInventoryID) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bSpecifyInventoryID = __Value;
        return;
    }
}

struct FItemActionRuntimeInfo
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FItemActionSource m_ActionSource;
    UPROPERTY()
    TArray<EItemActionTriggerPhase> m_ExecutedPhases;
    UPROPERTY()
    FFPTime m_ActionStartTime = -1;
    UPROPERTY()
    FFPTime m_ActionTimeout = -1;
    UPROPERTY()
    bool m_bRunning;
    UPROPERTY()
    bool m_bCostPaid;
    UPROPERTY()
    bool m_bFinished;
    UPROPERTY()
    bool m_bFailed;

    FItemActionRuntimeInfo(const FItemActionRuntimeInfo &inout Other)
    {
        this.m_ActionSource = Other.m_ActionSource;
        this.m_ExecutedPhases = Other.m_ExecutedPhases;
        this.m_ActionStartTime = Other.m_ActionStartTime;
        this.m_ActionTimeout = Other.m_ActionTimeout;
        this.m_bRunning = Other.m_bRunning;
        this.m_bCostPaid = Other.m_bCostPaid;
        this.m_bFinished = Other.m_bFinished;
        this.m_bFailed = Other.m_bFailed;
        return;
    }
    FItemActionRuntimeInfo opAssign(const FItemActionRuntimeInfo &inout Other)
    {
        FItemActionRuntimeInfo __r;
        this.SetActionSource(Other.GetActionSource());
        this.SetExecutedPhases(Other.GetExecutedPhases());
        this.SetActionStartTime(Other.GetActionStartTime());
        this.SetActionTimeout(Other.GetActionTimeout());
        this.SetbRunning(Other.GetbRunning());
        this.SetbCostPaid(Other.GetbCostPaid());
        this.SetbFinished(Other.GetbFinished());
        this.SetbFailed(Other.GetbFailed());
        return __r;
    }
    const FItemActionSource GetActionSource() const property
    {
        const FItemActionSource __r;
        return __r;
    }
    FItemActionSource GetActionSource() property
    {
        FItemActionSource __r;
        return __r;
    }
    void SetActionSource(const FItemActionSource &inout __Value) property
    {
        this.m_ActionSource = __Value;
        return;
    }
    const TArray<EItemActionTriggerPhase> GetExecutedPhases() const property
    {
        const TArray<EItemActionTriggerPhase> __r;
        return __r;
    }
    TArray<EItemActionTriggerPhase> GetModify_ExecutedPhases() property
    {
        TArray<EItemActionTriggerPhase> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetExecutedPhases(const TArray<EItemActionTriggerPhase> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_ExecutedPhases = __Value;
        return;
    }
    const FFPTime GetActionStartTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_ActionStartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetActionStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_ActionStartTime = __Value;
        return;
    }
    const FFPTime GetActionTimeout() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_ActionTimeout() property
    {
        FFPTime __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetActionTimeout(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_ActionTimeout = __Value;
        return;
    }
    bool GetbRunning() const property
    {
        return this.m_bRunning;
    }
    void SetbRunning(const bool __Value) property
    {
        if (!(this.m_bRunning) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_bRunning = __Value;
        return;
    }
    bool GetbCostPaid() const property
    {
        return this.m_bCostPaid;
    }
    void SetbCostPaid(const bool __Value) property
    {
        if (!(this.m_bCostPaid) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_bCostPaid = __Value;
        return;
    }
    bool GetbFinished() const property
    {
        return this.m_bFinished;
    }
    void SetbFinished(const bool __Value) property
    {
        if (!(this.m_bFinished) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_bFinished = __Value;
        return;
    }
    bool GetbFailed() const property
    {
        return this.m_bFailed;
    }
    void SetbFailed(const bool __Value) property
    {
        if (!(this.m_bFailed) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_bFailed = __Value;
        return;
    }
}

struct FItemActionTriggerArray
{
    UPROPERTY()
    TArray<UItemActionTriggerBase> Triggers;

    FItemActionTriggerArray()
    {
        return;
    }
}

UCLASS(Abstract)
class UItemActionConfigBase : UDataAsset
{
    UPROPERTY()
    int ItemCostNum;
    UPROPERTY()
    TMap<EItemActionTriggerPhase, FItemActionTriggerArray> ActionTriggers;

    UItemActionConfigBase()
    {
        return;
    }
    bool CanExecuteAction(const FItemActionSource &inout ActionSource) const
    {
        return true;
    }
    void ExecuteAction(FItemActionRuntimeInfo &inout RuntimeInfo) const
    {
        if (!(this.CanExecuteAction(RuntimeInfo.GetActionSource())))
        {
            this.ExecuteFail(RuntimeInfo);
            return;
        }
        this.ExecuteTriggers(EItemActionTriggerPhase(0), RuntimeInfo);
        if (!(this.OnCalculateCanAffordCost(RuntimeInfo.GetActionSource())))
        {
            this.ExecuteFail(RuntimeInfo);
            return;
        }
        this.ExecuteTriggers(EItemActionTriggerPhase(1), RuntimeInfo);
        this.OnExecutionStart(RuntimeInfo);
        return;
    }
    void OnExecutionStart(FItemActionRuntimeInfo &inout RuntimeInfo) const
    {
        return;
    }
    void OnActionTick(FItemActionRuntimeInfo &inout RuntimeInfo) const
    {
        return;
    }
    void TickAction(FItemActionRuntimeInfo &inout RuntimeInfo) const
    {
        this.OnActionTick(RuntimeInfo);
        return;
    }
    void ExecuteCustomTriggers(const FItemActionRuntimeInfo &inout RuntimeInfo, const TArray<UItemActionTriggerBase> &inout Triggers) const
    {
        this.ExecuteTriggersInternal(Triggers, RuntimeInfo.GetActionSource());
        return;
    }
    bool ExecutePayCost(FItemActionRuntimeInfo &inout RuntimeInfo) const
    {
        if (RuntimeInfo.GetbFinished() || RuntimeInfo.GetbFailed())
        {
            return false;
        }
        if (RuntimeInfo.GetbCostPaid())
        {
            return true;
        }
        if (this.OnPayCost(RuntimeInfo.GetActionSource()))
        {
            RuntimeInfo.SetbCostPaid(true);
            return true;
        }
        return false;
    }
    void ExecuteEnterRunning(FItemActionRuntimeInfo &inout RuntimeInfo) const
    {
        if (!(RuntimeInfo.GetbFailed()) && !(RuntimeInfo.GetbFinished()) && !(RuntimeInfo.GetbRunning()))
        {
            RuntimeInfo.SetbRunning(true);
            this.ExecuteTriggers(EItemActionTriggerPhase(2), RuntimeInfo);
        }
        return;
    }
    void ExecuteExitRunning(FItemActionRuntimeInfo &inout RuntimeInfo) const
    {
        if (!(RuntimeInfo.GetbFailed()) && !(RuntimeInfo.GetbFinished()) && RuntimeInfo.GetbRunning())
        {
            RuntimeInfo.SetbRunning(false);
            this.ExecuteTriggers(EItemActionTriggerPhase(3), RuntimeInfo);
        }
        return;
    }
    void ExecuteFinish(FItemActionRuntimeInfo &inout RuntimeInfo) const
    {
        if (!(RuntimeInfo.GetbFinished()))
        {
            this.ExecuteExitRunning(RuntimeInfo);
            RuntimeInfo.SetbFinished(true);
            this.ExecuteTriggers(EItemActionTriggerPhase(4), RuntimeInfo);
        }
        return;
    }
    void ExecuteFail(FItemActionRuntimeInfo &inout RuntimeInfo) const
    {
        if (!(RuntimeInfo.GetbFailed()))
        {
            this.ExecuteExitRunning(RuntimeInfo);
            RuntimeInfo.SetbFailed(true);
            this.ExecuteTriggers(EItemActionTriggerPhase(5), RuntimeInfo);
        }
        return;
    }
    bool OnPayCost(const FItemActionSource &inout ActionSource) const
    {
        if (!(this.OnCalculateCanAffordCost(ActionSource)))
        {
            return false;
        }
        else
        {
            if (!(ECS::GetRuntimeInfo().IsServer))
            {
                return true;
            }
            else
            {
                if (ActionSource.GetbSpecifyInventoryID())
                {
                    return ::InventoryUtils::RemoveInventoryItemByInventoryID(ActionSource.GetItemOwner(), ActionSource.GetItemUid(), this.ItemCostNum);
                }
                else
                {
                    return ::InventoryUtils::RemoveInventoryItem(ActionSource.GetItemOwner(), ActionSource.GetItemConfig(), this.ItemCostNum);
                }
            }
        }
    }
    bool OnCalculateCanAffordCost(const FItemActionSource &inout ActionSource) const
    {
        int local_4;
        if (this.ItemCostNum <= 0)
        {
            return true;
        }
        if (ActionSource.GetbSpecifyInventoryID())
        {
            local_4 = ::InventoryUtils::GetInventoryItemNumberByInventoryID(ActionSource.GetItemOwner(), ActionSource.GetItemUid());
        }
        else
        {
            local_4 = ::InventoryUtils::GetInventoryItemNumber(ActionSource.GetItemOwner(), ActionSource.GetItemConfig());
        }
        return (local_4 >= this.ItemCostNum);
    }
    void ExecuteTriggers(const EItemActionTriggerPhase Phase, FItemActionRuntimeInfo &inout RuntimeInfo) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void ExecuteTriggersInternal(const TArray<UItemActionTriggerBase> &inout Triggers, const FItemActionSource &inout ActionSource) const
    {
        for (auto local_16 : Triggers)
        {
            local_16.Execute(ActionSource);
        }
        return;
    }
}

namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FItemActionSource &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FItemActionSource &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FItemActionSource
{
int __IndexOf_ItemOwner()
{
    return 0;
}
int __IndexOf_ItemConfig()
{
    return 1;
}
int __IndexOf_ItemUid()
{
    return 2;
}
int __IndexOf_bSpecifyInventoryID()
{
    return 3;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FItemActionRuntimeInfo &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FItemActionRuntimeInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FItemActionRuntimeInfo
{
int __IndexOf_ActionSource()
{
    return 0;
}
int __IndexOf_ExecutedPhases()
{
    return 4;
}
int __IndexOf_ActionStartTime()
{
    return 5;
}
int __IndexOf_ActionTimeout()
{
    return 6;
}
int __IndexOf_bRunning()
{
    return 7;
}
int __IndexOf_bCostPaid()
{
    return 8;
}
int __IndexOf_bFinished()
{
    return 9;
}
int __IndexOf_bFailed()
{
    return 10;
}
}
