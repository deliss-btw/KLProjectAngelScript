
namespace __INTENRAL_FC_EcosimAIV2LevelControlEvents_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2LevelControlEvents> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2LevelControlEvents>();
    const FC_EcosimAIV2LevelControlEvents DefaultValue = FC_EcosimAIV2LevelControlEvents();
}
namespace __INTENRAL_FCE_EcosimAIV2LevelControlMoveToSpecifiedFinish_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2LevelControlMoveToSpecifiedFinish> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2LevelControlMoveToSpecifiedFinish>();
}
namespace __INTENRAL_FCE_EcosimAIV2LevelControlOnComplete_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2LevelControlOnComplete> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2LevelControlOnComplete>();
}
namespace __INTENRAL_FCE_EcosimAIV2LevelControlOnFailed_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2LevelControlOnFailed> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2LevelControlOnFailed>();
}
namespace __INTENRAL_FCE_EcosimAIV2LevelControlOnCancel_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2LevelControlOnCancel> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2LevelControlOnCancel>();

}
struct FCE_EcosimAIV2LevelControlMoveToSpecifiedFinish : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName MoveToKeyName;

    FCE_EcosimAIV2LevelControlMoveToSpecifiedFinish()
    {
        return;
    }
}

struct FCE_EcosimAIV2LevelControlOnComplete : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_EcosimAIV2LevelControlOnComplete()
    {
        return;
    }
}

struct FCE_EcosimAIV2LevelControlOnFailed : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_EcosimAIV2LevelControlOnFailed()
    {
        return;
    }
}

struct FCE_EcosimAIV2LevelControlOnCancel : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_EcosimAIV2LevelControlOnCancel()
    {
        return;
    }
}

struct FC_EcosimAIV2LevelControlEvents : FECSComponent
{
    UPROPERTY()
    FOnAsyncActionDoneDelegate OnComplete;
    UPROPERTY()
    FOnAsyncActionDoneDelegate OnComplete1;
    UPROPERTY()
    FOnAsyncActionDoneDelegate OnFailed;
    UPROPERTY()
    FOnAsyncActionDoneDelegate OnCancel;

    FC_EcosimAIV2LevelControlEvents()
    {
        return;
    }
}

namespace ECSFunc_FC_EcosimAIV2LevelControlEvents
{
UFUNCTION()
bool HasEcosimAIV2LevelControlEvents(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelControlEvents);
}
FC_EcosimAIV2LevelControlEvents& AssignEcosimAIV2LevelControlEvents(const FECSEntity &inout Entity, const FC_EcosimAIV2LevelControlEvents &inout DefaultValue = FC_EcosimAIV2LevelControlEvents())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelControlEvents, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2LevelControlEvents_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2LevelControlEvents &inout DefaultValue = FC_EcosimAIV2LevelControlEvents())
{
    ECSFunc_FC_EcosimAIV2LevelControlEvents::AssignEcosimAIV2LevelControlEvents(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2LevelControlEvents& ModifyEcosimAIV2LevelControlEvents(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelControlEvents));
    return local_12.GetComp();
}
FC_EcosimAIV2LevelControlEvents& ModifyOrAddEcosimAIV2LevelControlEvents(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelControlEvents));
    return local_12.GetComp();
}
const FC_EcosimAIV2LevelControlEvents& GetEcosimAIV2LevelControlEvents(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelControlEvents));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2LevelControlEvents GetEcosimAIV2LevelControlEvents_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2LevelControlEvents __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2LevelControlEvents::GetEcosimAIV2LevelControlEvents(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2LevelControlEvents GetDefaultedEcosimAIV2LevelControlEvents(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2LevelControlEvents __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelControlEvents);
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
FC_EcosimAIV2LevelControlEvents GetDefaultedEcosimAIV2LevelControlEvents_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2LevelControlEvents __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2LevelControlEvents(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelControlEvents);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LevelControlEventsOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2LevelControlEvents, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LevelControlEventsOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2LevelControlEvents, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LevelControlEventsOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2LevelControlEvents, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LevelControlEventsOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2LevelControlEvents, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LevelControlEventsOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2LevelControlEvents, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2LevelControlEventsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2LevelControlEvents, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2LevelControlEventsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2LevelControlEvents, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2LevelControlEventsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2LevelControlEvents, bFixedFrame, Details);
    return;
}
