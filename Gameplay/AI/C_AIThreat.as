
enum EAIThreatType
{
    Low,
    Medium,
    High,
    Player,
}

namespace __INTENRAL_FC_AIThreatConfig_NS
{
    const TECSComponentDerivedPtr<FC_AIThreatConfig> DerivedPtr = TECSComponentDerivedPtr<FC_AIThreatConfig>();
    const FC_AIThreatConfig DefaultValue = FC_AIThreatConfig();

}
struct FC_AIThreatConfig : FECSComponent
{
    UPROPERTY()
    EAIThreatType AIThreatType;


}

namespace ECSFunc_FC_AIThreatConfig
{
UFUNCTION()
bool HasAIThreatConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIThreatConfig);
}
FC_AIThreatConfig& AssignAIThreatConfig(const FECSEntity &inout Entity, const FC_AIThreatConfig &inout DefaultValue = FC_AIThreatConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIThreatConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIThreatConfig_BP(const FECSEntity &inout Entity, const FC_AIThreatConfig &inout DefaultValue = FC_AIThreatConfig())
{
    ECSFunc_FC_AIThreatConfig::AssignAIThreatConfig(Entity, DefaultValue);
    return;
}
FC_AIThreatConfig& ModifyAIThreatConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIThreatConfig));
    return local_12.GetComp();
}
FC_AIThreatConfig& ModifyOrAddAIThreatConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIThreatConfig));
    return local_12.GetComp();
}
const FC_AIThreatConfig& GetAIThreatConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIThreatConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIThreatConfig GetAIThreatConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIThreatConfig& local_4 = ECSFunc_FC_AIThreatConfig::GetAIThreatConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIThreatConfig();
}
const FC_AIThreatConfig GetDefaultedAIThreatConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIThreatConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIThreatConfig);
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
FC_AIThreatConfig GetDefaultedAIThreatConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIThreatConfig::GetDefaultedAIThreatConfig(Entity);
}
UFUNCTION()
bool RemoveAIThreatConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIThreatConfig);
}
}
FECSMonitorRuntimeView __GetMonitorAIThreatConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIThreatConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIThreatConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIThreatConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIThreatConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIThreatConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIThreatConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIThreatConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIThreatConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIThreatConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorAIThreatConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIThreatConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIThreatConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIThreatConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIThreatConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIThreatConfig, bFixedFrame, Details);
    return;
}
