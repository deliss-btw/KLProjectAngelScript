
namespace __INTENRAL_FC_EcologyActivityTargetConfig_NS
{
    const TECSComponentDerivedPtr<FC_EcologyActivityTargetConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyActivityTargetConfig>();
    const FC_EcologyActivityTargetConfig DefaultValue = FC_EcologyActivityTargetConfig();

}
struct FC_EcologyActivityTargetConfig : FECSComponent
{
    UPROPERTY()
    FCreatureActivityTargetConfig Config;

    FC_EcologyActivityTargetConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_EcologyActivityTargetConfig
{
UFUNCTION()
bool HasEcologyActivityTargetConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyActivityTargetConfig);
}
FC_EcologyActivityTargetConfig& AssignEcologyActivityTargetConfig(const FECSEntity &inout Entity, const FC_EcologyActivityTargetConfig &inout DefaultValue = FC_EcologyActivityTargetConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyActivityTargetConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyActivityTargetConfig_BP(const FECSEntity &inout Entity, const FC_EcologyActivityTargetConfig &inout DefaultValue = FC_EcologyActivityTargetConfig())
{
    ECSFunc_FC_EcologyActivityTargetConfig::AssignEcologyActivityTargetConfig(Entity, DefaultValue);
    return;
}
FC_EcologyActivityTargetConfig& ModifyEcologyActivityTargetConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyActivityTargetConfig));
    return local_12.GetComp();
}
FC_EcologyActivityTargetConfig& ModifyOrAddEcologyActivityTargetConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyActivityTargetConfig));
    return local_12.GetComp();
}
const FC_EcologyActivityTargetConfig& GetEcologyActivityTargetConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyActivityTargetConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyActivityTargetConfig GetEcologyActivityTargetConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyActivityTargetConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyActivityTargetConfig::GetEcologyActivityTargetConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyActivityTargetConfig GetDefaultedEcologyActivityTargetConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyActivityTargetConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyActivityTargetConfig);
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
FC_EcologyActivityTargetConfig GetDefaultedEcologyActivityTargetConfig_BP(const FECSEntity &inout Entity)
{
    FC_EcologyActivityTargetConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyActivityTargetConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyActivityTargetConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyActivityTargetConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyActivityTargetConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyActivityTargetConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyActivityTargetConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyActivityTargetConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyActivityTargetConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyActivityTargetConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyActivityTargetConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyActivityTargetConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyActivityTargetConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyActivityTargetConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyActivityTargetConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyActivityTargetConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyActivityTargetConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyActivityTargetConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyActivityTargetConfig, bFixedFrame, Details);
    return;
}
