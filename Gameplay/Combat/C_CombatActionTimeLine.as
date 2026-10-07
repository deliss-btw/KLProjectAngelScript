
enum ECombatTimelineTimePoint
{
    Spawn,
    HitEntity,
    Destroy,
    HitScene,
}

namespace __INTENRAL_FC_CombatActionTimelineConfig_NS
{
    const TECSComponentDerivedPtr<FC_CombatActionTimelineConfig> DerivedPtr = TECSComponentDerivedPtr<FC_CombatActionTimelineConfig>();
    const FC_CombatActionTimelineConfig DefaultValue = FC_CombatActionTimelineConfig();
}
namespace __INTENRAL_FC_CombatActionPendingTrigger_NS
{
    const TECSComponentDerivedPtr<FC_CombatActionPendingTrigger> DerivedPtr = TECSComponentDerivedPtr<FC_CombatActionPendingTrigger>();
    const FC_CombatActionPendingTrigger DefaultValue = FC_CombatActionPendingTrigger();
}
namespace __INTENRAL_FC_CombatActionAgent_NS
{
    const TECSComponentDerivedPtr<FC_CombatActionAgent> DerivedPtr = TECSComponentDerivedPtr<FC_CombatActionAgent>();
    const FC_CombatActionAgent DefaultValue = FC_CombatActionAgent();

}
struct FCombatTimelineActionAbilityEffectEvent
{
    UPROPERTY()
    TSubclassOf<UEASAbility> AbilityClass;
    UPROPERTY()
    FName EventName;

    FCombatTimelineActionAbilityEffectEvent()
    {
        return;
    }
}

struct FCombatTimelineActionHitTest
{
    UPROPERTY()
    FFPTime HitTestDelayTime;
    UPROPERTY()
    FVector PositionOffset;
    UPROPERTY()
    FRotator3f RotationOffset;
    UPROPERTY()
    FHitTestShape HitTestShape;
    UPROPERTY()
    FDataObjectPtr AttackData;
    UPROPERTY()
    FAreaStrikeShape StrikeShape;
    UPROPERTY()
    FVector3f StrikeDirection = FVector3f::UpVector;

    FCombatTimelineActionHitTest()
    {
        return;
    }
}

struct FCombatTimelineActionSpawnFX
{
    UPROPERTY()
    FFPTime SpawnFXDelayTime;
    UPROPERTY()
    FFXConfig FXConfig;
    UPROPERTY()
    EAttachFXStopMethod AttachFXStopMethod = EAttachFXStopMethod(4);


}

struct FCombatTimelineActionPoint
{
    UPROPERTY()
    ECombatTimelineTimePoint BaseTime;
    UPROPERTY()
    uint8 DestroyTypeFilter = (7 != 0);
    UPROPERTY()
    FFPTime DelayTime;
    UPROPERTY()
    int RepeatCount = 1;
    UPROPERTY()
    FFPTime RepeatDelayTime;
    UPROPERTY()
    TArray<FCombatTimelineActionSpawnFX> SpawnFXActions;
    UPROPERTY()
    TArray<FCombatTimelineActionHitTest> HitTestActions;
    UPROPERTY()
    TArray<FCombatTimelineActionAbilityEffectEvent> AbilityEffectEventActions;


}

struct FC_CombatActionTimelineConfig : FECSComponent
{
    UPROPERTY()
    TArray<FCombatTimelineActionPoint> ActionTimePoints;

    FC_CombatActionTimelineConfig()
    {
        return;
    }
}

struct FCombatActionTrigger
{
    UPROPERTY()
    int m_IndexInConfig;
    UPROPERTY()
    FFPTime m_TriggerTime;


    int GetIndexInConfig() const property
    {
        return this.m_IndexInConfig;
    }
    void SetIndexInConfig(const int __Value) property
    {
        this.m_IndexInConfig = __Value;
        return;
    }
    const FFPTime GetTriggerTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetTriggerTime() property
    {
        FFPTime __r;
        return __r;
    }
    void SetTriggerTime(const FFPTime &inout __Value) property
    {
        this.m_TriggerTime = __Value;
        return;
    }
}

struct FC_CombatActionPendingTrigger : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_NextTriggerTime;
    UPROPERTY()
    TArray<FCombatActionTrigger> m_WaitingActionTriggers;

    FC_CombatActionPendingTrigger()
    {
        this.m_NextTriggerTime = -1;
        this.__InitDirtyFlags();
        return;
    }
    FC_CombatActionPendingTrigger(const FC_CombatActionPendingTrigger &inout Other)
    {
        this.m_NextTriggerTime = -1;
        this.__InitDirtyFlags();
        this.m_NextTriggerTime = Other.m_NextTriggerTime;
        this.m_WaitingActionTriggers = Other.m_WaitingActionTriggers;
        return;
    }
    FC_CombatActionPendingTrigger opAssign(const FC_CombatActionPendingTrigger &inout Other)
    {
        FC_CombatActionPendingTrigger __r;
        this.SetNextTriggerTime(Other.GetNextTriggerTime());
        this.SetWaitingActionTriggers(Other.GetWaitingActionTriggers());
        return __r;
    }
    void AddTrigger(const FCombatActionTrigger &inout Trigger)
    {
        if ((FFPTime(this.GetNextTriggerTime()) == -1.0) || ((FFPTime(Trigger.GetTriggerTime()).opCmp(this.GetNextTriggerTime()) < 0)))
        {
            this.SetNextTriggerTime(Trigger.GetTriggerTime());
        }
        this.GetModify_WaitingActionTriggers().Add(Trigger);
        return;
    }
    const FFPTime GetNextTriggerTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_NextTriggerTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetNextTriggerTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_NextTriggerTime = __Value;
        return;
    }
    const TArray<FCombatActionTrigger> GetWaitingActionTriggers() const property
    {
        const TArray<FCombatActionTrigger> __r;
        return __r;
    }
    TArray<FCombatActionTrigger> GetModify_WaitingActionTriggers() property
    {
        TArray<FCombatActionTrigger> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetWaitingActionTriggers(const TArray<FCombatActionTrigger> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_WaitingActionTriggers = __Value;
        return;
    }
}

struct FCombatTimelineActionContext
{
    UPROPERTY()
    FFPTime TriggerTime;
    UPROPERTY()
    FTransform Transform;
    UPROPERTY()
    FCombatTimelineActionPoint ActionTimePoint;

    FCombatTimelineActionContext()
    {
        return;
    }
}

struct FC_CombatActionAgent : FECSComponent
{
    UPROPERTY()
    TArray<FCombatTimelineActionContext> Actions;

    FC_CombatActionAgent()
    {
        return;
    }
}

namespace ECSFunc_FC_CombatActionTimelineConfig
{
UFUNCTION()
bool HasCombatActionTimelineConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatActionTimelineConfig);
}
FC_CombatActionTimelineConfig& AssignCombatActionTimelineConfig(const FECSEntity &inout Entity, const FC_CombatActionTimelineConfig &inout DefaultValue = FC_CombatActionTimelineConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatActionTimelineConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatActionTimelineConfig_BP(const FECSEntity &inout Entity, const FC_CombatActionTimelineConfig &inout DefaultValue = FC_CombatActionTimelineConfig())
{
    ECSFunc_FC_CombatActionTimelineConfig::AssignCombatActionTimelineConfig(Entity, DefaultValue);
    return;
}
FC_CombatActionTimelineConfig& ModifyCombatActionTimelineConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatActionTimelineConfig));
    return local_12.GetComp();
}
FC_CombatActionTimelineConfig& ModifyOrAddCombatActionTimelineConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatActionTimelineConfig));
    return local_12.GetComp();
}
const FC_CombatActionTimelineConfig& GetCombatActionTimelineConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatActionTimelineConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatActionTimelineConfig GetCombatActionTimelineConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CombatActionTimelineConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_CombatActionTimelineConfig::GetCombatActionTimelineConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CombatActionTimelineConfig GetDefaultedCombatActionTimelineConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatActionTimelineConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatActionTimelineConfig);
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
FC_CombatActionTimelineConfig GetDefaultedCombatActionTimelineConfig_BP(const FECSEntity &inout Entity)
{
    FC_CombatActionTimelineConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveCombatActionTimelineConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatActionTimelineConfig);
}
}
FECSMonitorRuntimeView __GetMonitorCombatActionTimelineConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatActionTimelineConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatActionTimelineConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatActionTimelineConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatActionTimelineConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatActionTimelineConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatActionTimelineConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatActionTimelineConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatActionTimelineConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatActionTimelineConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatActionTimelineConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatActionTimelineConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatActionTimelineConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatActionTimelineConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatActionTimelineConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatActionTimelineConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatActionPendingTrigger
{
UFUNCTION()
bool HasCombatActionPendingTrigger(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatActionPendingTrigger);
}
FC_CombatActionPendingTrigger& AssignCombatActionPendingTrigger(const FECSEntity &inout Entity, const FC_CombatActionPendingTrigger &inout DefaultValue = FC_CombatActionPendingTrigger())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatActionPendingTrigger, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatActionPendingTrigger_BP(const FECSEntity &inout Entity, const FC_CombatActionPendingTrigger &inout DefaultValue = FC_CombatActionPendingTrigger())
{
    ECSFunc_FC_CombatActionPendingTrigger::AssignCombatActionPendingTrigger(Entity, DefaultValue);
    return;
}
FC_CombatActionPendingTrigger& ModifyCombatActionPendingTrigger(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatActionPendingTrigger));
    return local_12.GetComp();
}
FC_CombatActionPendingTrigger& ModifyOrAddCombatActionPendingTrigger(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatActionPendingTrigger));
    return local_12.GetComp();
}
const FC_CombatActionPendingTrigger& GetCombatActionPendingTrigger(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatActionPendingTrigger));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatActionPendingTrigger GetCombatActionPendingTrigger_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CombatActionPendingTrigger& local_4 = ECSFunc_FC_CombatActionPendingTrigger::GetCombatActionPendingTrigger(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CombatActionPendingTrigger();
}
const FC_CombatActionPendingTrigger GetDefaultedCombatActionPendingTrigger(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatActionPendingTrigger __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatActionPendingTrigger);
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
FC_CombatActionPendingTrigger GetDefaultedCombatActionPendingTrigger_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CombatActionPendingTrigger::GetDefaultedCombatActionPendingTrigger(Entity);
}
UFUNCTION()
bool RemoveCombatActionPendingTrigger(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatActionPendingTrigger);
}
}
FECSMonitorRuntimeView __GetMonitorCombatActionPendingTriggerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatActionPendingTrigger, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatActionPendingTriggerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatActionPendingTrigger, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatActionPendingTriggerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatActionPendingTrigger, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatActionPendingTriggerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatActionPendingTrigger, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatActionPendingTriggerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatActionPendingTrigger, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatActionPendingTriggerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatActionPendingTrigger, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatActionPendingTriggerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatActionPendingTrigger, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatActionPendingTriggerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatActionPendingTrigger, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatActionAgent
{
UFUNCTION()
bool HasCombatActionAgent(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatActionAgent);
}
FC_CombatActionAgent& AssignCombatActionAgent(const FECSEntity &inout Entity, const FC_CombatActionAgent &inout DefaultValue = FC_CombatActionAgent())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatActionAgent, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatActionAgent_BP(const FECSEntity &inout Entity, const FC_CombatActionAgent &inout DefaultValue = FC_CombatActionAgent())
{
    ECSFunc_FC_CombatActionAgent::AssignCombatActionAgent(Entity, DefaultValue);
    return;
}
FC_CombatActionAgent& ModifyCombatActionAgent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatActionAgent));
    return local_12.GetComp();
}
FC_CombatActionAgent& ModifyOrAddCombatActionAgent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatActionAgent));
    return local_12.GetComp();
}
const FC_CombatActionAgent& GetCombatActionAgent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatActionAgent));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatActionAgent GetCombatActionAgent_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CombatActionAgent __r;
    bValid = false;
    bValid = ECSFunc_FC_CombatActionAgent::GetCombatActionAgent(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CombatActionAgent GetDefaultedCombatActionAgent(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatActionAgent __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatActionAgent);
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
FC_CombatActionAgent GetDefaultedCombatActionAgent_BP(const FECSEntity &inout Entity)
{
    FC_CombatActionAgent __r;
    return __r;
}
UFUNCTION()
bool RemoveCombatActionAgent(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatActionAgent);
}
}
FECSMonitorRuntimeView __GetMonitorCombatActionAgentOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatActionAgent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatActionAgentOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatActionAgent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatActionAgentOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatActionAgent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatActionAgentOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatActionAgent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatActionAgentOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatActionAgent, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatActionAgentLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatActionAgent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatActionAgentActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatActionAgent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatActionAgentModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatActionAgent, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CombatActionPendingTrigger &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CombatActionPendingTrigger &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CombatActionPendingTrigger &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CombatActionPendingTrigger
{
int __IndexOf_NextTriggerTime()
{
    return 0;
}
int __IndexOf_WaitingActionTriggers()
{
    return 1;
}
}
