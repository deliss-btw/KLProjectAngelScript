
namespace __INTENRAL_FC_ClientCapabilityParamsRequireRefreshTag_NS
{
    const TECSComponentDerivedPtr<FC_ClientCapabilityParamsRequireRefreshTag> DerivedPtr = TECSComponentDerivedPtr<FC_ClientCapabilityParamsRequireRefreshTag>();
    const FC_ClientCapabilityParamsRequireRefreshTag DefaultValue = FC_ClientCapabilityParamsRequireRefreshTag();
}
namespace __INTENRAL_FC_CapabilityInitConfig_NS
{
    const TECSComponentDerivedPtr<FC_CapabilityInitConfig> DerivedPtr = TECSComponentDerivedPtr<FC_CapabilityInitConfig>();
    const FC_CapabilityInitConfig DefaultValue = FC_CapabilityInitConfig();

}
struct FC_ClientCapabilityParamsRequireRefreshTag : FECSComponent
{
    FC_ClientCapabilityParamsRequireRefreshTag()
    {
        return;
    }
}

struct FC_CapabilityInitConfig : FECSComponent
{
    UPROPERTY()
    TArray<FCapabilityInitConfig> InitCapabilities;

    FC_CapabilityInitConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_ClientCapabilityParamsRequireRefreshTag
{
UFUNCTION()
bool HasClientCapabilityParamsRequireRefreshTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ClientCapabilityParamsRequireRefreshTag);
}
FC_ClientCapabilityParamsRequireRefreshTag& AssignClientCapabilityParamsRequireRefreshTag(const FECSEntity &inout Entity, const FC_ClientCapabilityParamsRequireRefreshTag &inout DefaultValue = FC_ClientCapabilityParamsRequireRefreshTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ClientCapabilityParamsRequireRefreshTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignClientCapabilityParamsRequireRefreshTag_BP(const FECSEntity &inout Entity, const FC_ClientCapabilityParamsRequireRefreshTag &inout DefaultValue = FC_ClientCapabilityParamsRequireRefreshTag())
{
    ECSFunc_FC_ClientCapabilityParamsRequireRefreshTag::AssignClientCapabilityParamsRequireRefreshTag(Entity, DefaultValue);
    return;
}
FC_ClientCapabilityParamsRequireRefreshTag& ModifyClientCapabilityParamsRequireRefreshTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ClientCapabilityParamsRequireRefreshTag));
    return local_12.GetComp();
}
FC_ClientCapabilityParamsRequireRefreshTag& ModifyOrAddClientCapabilityParamsRequireRefreshTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ClientCapabilityParamsRequireRefreshTag));
    return local_12.GetComp();
}
const FC_ClientCapabilityParamsRequireRefreshTag& GetClientCapabilityParamsRequireRefreshTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ClientCapabilityParamsRequireRefreshTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ClientCapabilityParamsRequireRefreshTag GetClientCapabilityParamsRequireRefreshTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ClientCapabilityParamsRequireRefreshTag& local_4 = ECSFunc_FC_ClientCapabilityParamsRequireRefreshTag::GetClientCapabilityParamsRequireRefreshTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ClientCapabilityParamsRequireRefreshTag();
}
const FC_ClientCapabilityParamsRequireRefreshTag GetDefaultedClientCapabilityParamsRequireRefreshTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ClientCapabilityParamsRequireRefreshTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ClientCapabilityParamsRequireRefreshTag);
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
FC_ClientCapabilityParamsRequireRefreshTag GetDefaultedClientCapabilityParamsRequireRefreshTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ClientCapabilityParamsRequireRefreshTag::GetDefaultedClientCapabilityParamsRequireRefreshTag(Entity);
}
UFUNCTION()
bool RemoveClientCapabilityParamsRequireRefreshTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ClientCapabilityParamsRequireRefreshTag);
}
}
FECSMonitorRuntimeView __GetMonitorClientCapabilityParamsRequireRefreshTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ClientCapabilityParamsRequireRefreshTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorClientCapabilityParamsRequireRefreshTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ClientCapabilityParamsRequireRefreshTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorClientCapabilityParamsRequireRefreshTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ClientCapabilityParamsRequireRefreshTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorClientCapabilityParamsRequireRefreshTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ClientCapabilityParamsRequireRefreshTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorClientCapabilityParamsRequireRefreshTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ClientCapabilityParamsRequireRefreshTag, bFixedFrame, bMustHandleAll);
}
void __MonitorClientCapabilityParamsRequireRefreshTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ClientCapabilityParamsRequireRefreshTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorClientCapabilityParamsRequireRefreshTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ClientCapabilityParamsRequireRefreshTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorClientCapabilityParamsRequireRefreshTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ClientCapabilityParamsRequireRefreshTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CapabilityInitConfig
{
UFUNCTION()
bool HasCapabilityInitConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CapabilityInitConfig);
}
FC_CapabilityInitConfig& AssignCapabilityInitConfig(const FECSEntity &inout Entity, const FC_CapabilityInitConfig &inout DefaultValue = FC_CapabilityInitConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CapabilityInitConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCapabilityInitConfig_BP(const FECSEntity &inout Entity, const FC_CapabilityInitConfig &inout DefaultValue = FC_CapabilityInitConfig())
{
    ECSFunc_FC_CapabilityInitConfig::AssignCapabilityInitConfig(Entity, DefaultValue);
    return;
}
FC_CapabilityInitConfig& ModifyCapabilityInitConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CapabilityInitConfig));
    return local_12.GetComp();
}
FC_CapabilityInitConfig& ModifyOrAddCapabilityInitConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CapabilityInitConfig));
    return local_12.GetComp();
}
const FC_CapabilityInitConfig& GetCapabilityInitConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CapabilityInitConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_CapabilityInitConfig GetCapabilityInitConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CapabilityInitConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_CapabilityInitConfig::GetCapabilityInitConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CapabilityInitConfig GetDefaultedCapabilityInitConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CapabilityInitConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CapabilityInitConfig);
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
FC_CapabilityInitConfig GetDefaultedCapabilityInitConfig_BP(const FECSEntity &inout Entity)
{
    FC_CapabilityInitConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveCapabilityInitConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CapabilityInitConfig);
}
}
FECSMonitorRuntimeView __GetMonitorCapabilityInitConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CapabilityInitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCapabilityInitConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CapabilityInitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCapabilityInitConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CapabilityInitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCapabilityInitConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CapabilityInitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCapabilityInitConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CapabilityInitConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorCapabilityInitConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CapabilityInitConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCapabilityInitConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CapabilityInitConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCapabilityInitConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CapabilityInitConfig, bFixedFrame, Details);
    return;
}
