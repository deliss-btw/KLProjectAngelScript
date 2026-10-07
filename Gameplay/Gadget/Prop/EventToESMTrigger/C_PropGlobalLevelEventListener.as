
namespace __INTENRAL_FC_PropGlobalLevelEventListener_NS
{
    const TECSComponentDerivedPtr<FC_PropGlobalLevelEventListener> DerivedPtr = TECSComponentDerivedPtr<FC_PropGlobalLevelEventListener>();
    const FC_PropGlobalLevelEventListener DefaultValue = FC_PropGlobalLevelEventListener();

}
struct FPropGlobalLevelEventLisenerConfigItem
{
    UPROPERTY()
    FName EventName;
    UPROPERTY()
    FNameHandle_ESMBBTrigger ESMTriggerToActivate;
    UPROPERTY()
    float32 ValidTime = 0.1f;


}

struct FC_PropGlobalLevelEventListener : FECSComponent
{
    UPROPERTY()
    TArray<FPropGlobalLevelEventLisenerConfigItem> ConfigItems;

    FC_PropGlobalLevelEventListener()
    {
        return;
    }
}

namespace ECSFunc_FC_PropGlobalLevelEventListener
{
UFUNCTION()
bool HasPropGlobalLevelEventListener(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PropGlobalLevelEventListener);
}
FC_PropGlobalLevelEventListener& AssignPropGlobalLevelEventListener(const FECSEntity &inout Entity, const FC_PropGlobalLevelEventListener &inout DefaultValue = FC_PropGlobalLevelEventListener())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PropGlobalLevelEventListener, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPropGlobalLevelEventListener_BP(const FECSEntity &inout Entity, const FC_PropGlobalLevelEventListener &inout DefaultValue = FC_PropGlobalLevelEventListener())
{
    ECSFunc_FC_PropGlobalLevelEventListener::AssignPropGlobalLevelEventListener(Entity, DefaultValue);
    return;
}
FC_PropGlobalLevelEventListener& ModifyPropGlobalLevelEventListener(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PropGlobalLevelEventListener));
    return local_12.GetComp();
}
FC_PropGlobalLevelEventListener& ModifyOrAddPropGlobalLevelEventListener(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PropGlobalLevelEventListener));
    return local_12.GetComp();
}
const FC_PropGlobalLevelEventListener& GetPropGlobalLevelEventListener(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PropGlobalLevelEventListener));
    return local_12.GetComp();
}
UFUNCTION()
FC_PropGlobalLevelEventListener GetPropGlobalLevelEventListener_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PropGlobalLevelEventListener __r;
    bValid = false;
    bValid = ECSFunc_FC_PropGlobalLevelEventListener::GetPropGlobalLevelEventListener(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PropGlobalLevelEventListener GetDefaultedPropGlobalLevelEventListener(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PropGlobalLevelEventListener __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PropGlobalLevelEventListener);
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
FC_PropGlobalLevelEventListener GetDefaultedPropGlobalLevelEventListener_BP(const FECSEntity &inout Entity)
{
    FC_PropGlobalLevelEventListener __r;
    return __r;
}
UFUNCTION()
bool RemovePropGlobalLevelEventListener(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PropGlobalLevelEventListener);
}
}
FECSMonitorRuntimeView __GetMonitorPropGlobalLevelEventListenerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PropGlobalLevelEventListener, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropGlobalLevelEventListenerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PropGlobalLevelEventListener, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropGlobalLevelEventListenerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PropGlobalLevelEventListener, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropGlobalLevelEventListenerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PropGlobalLevelEventListener, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropGlobalLevelEventListenerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PropGlobalLevelEventListener, bFixedFrame, bMustHandleAll);
}
void __MonitorPropGlobalLevelEventListenerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PropGlobalLevelEventListener, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropGlobalLevelEventListenerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PropGlobalLevelEventListener, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropGlobalLevelEventListenerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PropGlobalLevelEventListener, bFixedFrame, Details);
    return;
}
