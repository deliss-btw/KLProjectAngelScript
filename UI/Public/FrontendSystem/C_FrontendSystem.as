
namespace __INTENRAL_FC_FrontendSystem_NS
{
    const TECSComponentDerivedPtr<FC_FrontendSystem> DerivedPtr = TECSComponentDerivedPtr<FC_FrontendSystem>();
    const FC_FrontendSystem DefaultValue = FC_FrontendSystem();
}
namespace __INTENRAL_FCE_FrontendSystemEnter_NS
{
    const TECSEventDerivedPtr<FCE_FrontendSystemEnter> DerivedPtr = TECSEventDerivedPtr<FCE_FrontendSystemEnter>();
}
namespace __INTENRAL_FCE_FrontendSystemExit_NS
{
    const TECSEventDerivedPtr<FCE_FrontendSystemExit> DerivedPtr = TECSEventDerivedPtr<FCE_FrontendSystemExit>();

}
struct FC_FrontendSystem : FECSComponent
{
    UPROPERTY()
    TArray<FFrontendSystemInstance> OpenedSystemInstances;
    UPROPERTY()
    int NextHandle = 0;


}

struct FCE_FrontendSystemEnter : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    const UFrontendSystemConfig FrontendSystem = nullptr;

    FCE_FrontendSystemEnter()
    {
        return;
    }
}

struct FCE_FrontendSystemExit : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    const UFrontendSystemConfig FrontendSystem = nullptr;

    FCE_FrontendSystemExit()
    {
        return;
    }
}

namespace ECSFunc_FC_FrontendSystem
{
UFUNCTION()
bool HasFrontendSystem(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystem);
}
FC_FrontendSystem& AssignFrontendSystem(const FECSEntity &inout Entity, const FC_FrontendSystem &inout DefaultValue = FC_FrontendSystem())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystem, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFrontendSystem_BP(const FECSEntity &inout Entity, const FC_FrontendSystem &inout DefaultValue = FC_FrontendSystem())
{
    ECSFunc_FC_FrontendSystem::AssignFrontendSystem(Entity, DefaultValue);
    return;
}
FC_FrontendSystem& ModifyFrontendSystem(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystem));
    return local_12.GetComp();
}
FC_FrontendSystem& ModifyOrAddFrontendSystem(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystem));
    return local_12.GetComp();
}
const FC_FrontendSystem& GetFrontendSystem(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystem));
    return local_12.GetComp();
}
UFUNCTION()
FC_FrontendSystem GetFrontendSystem_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FrontendSystem __r;
    bValid = false;
    bValid = ECSFunc_FC_FrontendSystem::GetFrontendSystem(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FrontendSystem GetDefaultedFrontendSystem(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FrontendSystem __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystem);
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
FC_FrontendSystem GetDefaultedFrontendSystem_BP(const FECSEntity &inout Entity)
{
    FC_FrontendSystem __r;
    return __r;
}
UFUNCTION()
bool RemoveFrontendSystem(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystem);
}
}
FECSMonitorRuntimeView __GetMonitorFrontendSystemOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FrontendSystem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFrontendSystemOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FrontendSystem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFrontendSystemOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FrontendSystem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFrontendSystemOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FrontendSystem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFrontendSystemOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FrontendSystem, bFixedFrame, bMustHandleAll);
}
void __MonitorFrontendSystemLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FrontendSystem, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFrontendSystemActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FrontendSystem, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFrontendSystemModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FrontendSystem, bFixedFrame, Details);
    return;
}
