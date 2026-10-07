
enum EEntityLifecycleUnifiedPhaseType
{
    None,
    Created,
    ConfigLoad,
    PrefabReady,
    InitReady,
    Alive,
    Limit,
    Die,
    PendingDestroy,
    Destroy,
}

namespace __INTENRAL_FC_EntityLifecyclePhase_NS
{
    const TECSComponentDerivedPtr<FC_EntityLifecyclePhase> DerivedPtr = TECSComponentDerivedPtr<FC_EntityLifecyclePhase>();
    const FC_EntityLifecyclePhase DefaultValue = FC_EntityLifecyclePhase();
}
namespace __INTENRAL_FCE_EntityLifecyclePhaseChanged_NS
{
    const TECSEventDerivedPtr<FCE_EntityLifecyclePhaseChanged> DerivedPtr = TECSEventDerivedPtr<FCE_EntityLifecyclePhaseChanged>();
}
namespace __INTENRAL_FCE_EntityOnReady_NS
{
    const TECSEventDerivedPtr<FCE_EntityOnReady> DerivedPtr = TECSEventDerivedPtr<FCE_EntityOnReady>();
}
namespace __INTENRAL_FCE_EntityOnDie_NS
{
    const TECSEventDerivedPtr<FCE_EntityOnDie> DerivedPtr = TECSEventDerivedPtr<FCE_EntityOnDie>();
}
namespace __INTENRAL_FCE_EntityOnPendingDestroy_NS
{
    const TECSEventDerivedPtr<FCE_EntityOnPendingDestroy> DerivedPtr = TECSEventDerivedPtr<FCE_EntityOnPendingDestroy>();

}
struct FC_EntityLifecyclePhase : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    EEntityLifecycleUnifiedPhaseType m_LasetPhase;
    UPROPERTY()
    EEntityLifecycleUnifiedPhaseType m_CurrentPhase;

    FC_EntityLifecyclePhase()
    {
        this.m_LasetPhase = EEntityLifecycleUnifiedPhaseType(0);
        this.m_CurrentPhase = EEntityLifecycleUnifiedPhaseType(0);
        this.__InitDirtyFlags();
        return;
    }
    FC_EntityLifecyclePhase(const FC_EntityLifecyclePhase &inout Other)
    {
        this.m_LasetPhase = EEntityLifecycleUnifiedPhaseType(0);
        this.m_CurrentPhase = EEntityLifecycleUnifiedPhaseType(0);
        this.__InitDirtyFlags();
        this.m_LasetPhase = Other.m_LasetPhase;
        this.m_CurrentPhase = Other.m_CurrentPhase;
        return;
    }
    FC_EntityLifecyclePhase opAssign(const FC_EntityLifecyclePhase &inout Other)
    {
        FC_EntityLifecyclePhase __r;
        this.SetLasetPhase(Other.GetLasetPhase());
        this.SetCurrentPhase(Other.GetCurrentPhase());
        return __r;
    }
    EEntityLifecycleUnifiedPhaseType GetLasetPhase() const property
    {
        return this.m_LasetPhase;
    }
    void SetLasetPhase(const EEntityLifecycleUnifiedPhaseType __Value) property
    {
        if (int(this.m_LasetPhase) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LasetPhase = __Value;
        return;
    }
    EEntityLifecycleUnifiedPhaseType GetCurrentPhase() const property
    {
        return this.m_CurrentPhase;
    }
    void SetCurrentPhase(const EEntityLifecycleUnifiedPhaseType __Value) property
    {
        if (int(this.m_CurrentPhase) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CurrentPhase = __Value;
        return;
    }
}

struct FCE_EntityLifecyclePhaseChanged : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntityId AffectedEntityId;
    UPROPERTY()
    EEntityLifecycleUnifiedPhaseType PreviousPhase;
    UPROPERTY()
    EEntityLifecycleUnifiedPhaseType NewPhase;


}

struct FCE_EntityOnReady : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntityId EntityId;

    FCE_EntityOnReady()
    {
        return;
    }
}

struct FCE_EntityOnDie : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntityId EntityId;

    FCE_EntityOnDie()
    {
        return;
    }
}

struct FCE_EntityOnPendingDestroy : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntityId EntityId;

    FCE_EntityOnPendingDestroy()
    {
        return;
    }
}

namespace ECSFunc_FC_EntityLifecyclePhase
{
UFUNCTION()
bool HasEntityLifecyclePhase(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EntityLifecyclePhase);
}
FC_EntityLifecyclePhase& AssignEntityLifecyclePhase(const FECSEntity &inout Entity, const FC_EntityLifecyclePhase &inout DefaultValue = FC_EntityLifecyclePhase())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EntityLifecyclePhase, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEntityLifecyclePhase_BP(const FECSEntity &inout Entity, const FC_EntityLifecyclePhase &inout DefaultValue = FC_EntityLifecyclePhase())
{
    ECSFunc_FC_EntityLifecyclePhase::AssignEntityLifecyclePhase(Entity, DefaultValue);
    return;
}
FC_EntityLifecyclePhase& ModifyEntityLifecyclePhase(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EntityLifecyclePhase));
    return local_12.GetComp();
}
FC_EntityLifecyclePhase& ModifyOrAddEntityLifecyclePhase(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EntityLifecyclePhase));
    return local_12.GetComp();
}
const FC_EntityLifecyclePhase& GetEntityLifecyclePhase(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EntityLifecyclePhase));
    return local_12.GetComp();
}
UFUNCTION()
FC_EntityLifecyclePhase GetEntityLifecyclePhase_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EntityLifecyclePhase& local_4 = ECSFunc_FC_EntityLifecyclePhase::GetEntityLifecyclePhase(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EntityLifecyclePhase();
}
const FC_EntityLifecyclePhase GetDefaultedEntityLifecyclePhase(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EntityLifecyclePhase __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EntityLifecyclePhase);
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
FC_EntityLifecyclePhase GetDefaultedEntityLifecyclePhase_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EntityLifecyclePhase::GetDefaultedEntityLifecyclePhase(Entity);
}
UFUNCTION()
bool RemoveEntityLifecyclePhase(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EntityLifecyclePhase);
}
}
FECSMonitorRuntimeView __GetMonitorEntityLifecyclePhaseOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EntityLifecyclePhase, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityLifecyclePhaseOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EntityLifecyclePhase, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityLifecyclePhaseOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EntityLifecyclePhase, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityLifecyclePhaseOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EntityLifecyclePhase, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityLifecyclePhaseOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EntityLifecyclePhase, bFixedFrame, bMustHandleAll);
}
void __MonitorEntityLifecyclePhaseLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EntityLifecyclePhase, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityLifecyclePhaseActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EntityLifecyclePhase, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityLifecyclePhaseModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EntityLifecyclePhase, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_EntityLifecyclePhase &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_EntityLifecyclePhase &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_EntityLifecyclePhase &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_EntityLifecyclePhase
{
int __IndexOf_LasetPhase()
{
    return 0;
}
int __IndexOf_CurrentPhase()
{
    return 1;
}
}
