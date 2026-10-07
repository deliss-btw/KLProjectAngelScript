
namespace __INTENRAL_FC_PortalConfig_NS
{
    const TECSComponentDerivedPtr<FC_PortalConfig> DerivedPtr = TECSComponentDerivedPtr<FC_PortalConfig>();
    const FC_PortalConfig DefaultValue = FC_PortalConfig();

}
struct FC_PortalConfig : FECSComponent
{
    UPROPERTY()
    FName PortalDestination;
    UPROPERTY()
    FPortalStateConfig StateConfig;

    FC_PortalConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_PortalConfig
{
UFUNCTION()
bool HasPortalConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PortalConfig);
}
FC_PortalConfig& AssignPortalConfig(const FECSEntity &inout Entity, const FC_PortalConfig &inout DefaultValue = FC_PortalConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PortalConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPortalConfig_BP(const FECSEntity &inout Entity, const FC_PortalConfig &inout DefaultValue = FC_PortalConfig())
{
    ECSFunc_FC_PortalConfig::AssignPortalConfig(Entity, DefaultValue);
    return;
}
FC_PortalConfig& ModifyPortalConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PortalConfig));
    return local_12.GetComp();
}
FC_PortalConfig& ModifyOrAddPortalConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PortalConfig));
    return local_12.GetComp();
}
const FC_PortalConfig& GetPortalConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PortalConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_PortalConfig GetPortalConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PortalConfig& local_4 = ECSFunc_FC_PortalConfig::GetPortalConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PortalConfig();
}
const FC_PortalConfig GetDefaultedPortalConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PortalConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PortalConfig);
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
FC_PortalConfig GetDefaultedPortalConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PortalConfig::GetDefaultedPortalConfig(Entity);
}
UFUNCTION()
bool RemovePortalConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PortalConfig);
}
}
FECSMonitorRuntimeView __GetMonitorPortalConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PortalConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPortalConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PortalConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPortalConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PortalConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPortalConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PortalConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPortalConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PortalConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorPortalConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PortalConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPortalConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PortalConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPortalConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PortalConfig, bFixedFrame, Details);
    return;
}
