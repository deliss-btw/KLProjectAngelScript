
namespace __INTENRAL_FC_EcosimAIV2StaticPointConfig_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2StaticPointConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2StaticPointConfig>();
    const FC_EcosimAIV2StaticPointConfig DefaultValue = FC_EcosimAIV2StaticPointConfig();

}
struct FC_EcosimAIV2StaticPointConfig : FECSComponent
{
    UPROPERTY()
    FString Comment;

    FC_EcosimAIV2StaticPointConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_EcosimAIV2StaticPointConfig
{
UFUNCTION()
bool HasEcosimAIV2StaticPointConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2StaticPointConfig);
}
FC_EcosimAIV2StaticPointConfig& AssignEcosimAIV2StaticPointConfig(const FECSEntity &inout Entity, const FC_EcosimAIV2StaticPointConfig &inout DefaultValue = FC_EcosimAIV2StaticPointConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2StaticPointConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2StaticPointConfig_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2StaticPointConfig &inout DefaultValue = FC_EcosimAIV2StaticPointConfig())
{
    ECSFunc_FC_EcosimAIV2StaticPointConfig::AssignEcosimAIV2StaticPointConfig(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2StaticPointConfig& ModifyEcosimAIV2StaticPointConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2StaticPointConfig));
    return local_12.GetComp();
}
FC_EcosimAIV2StaticPointConfig& ModifyOrAddEcosimAIV2StaticPointConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2StaticPointConfig));
    return local_12.GetComp();
}
const FC_EcosimAIV2StaticPointConfig& GetEcosimAIV2StaticPointConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2StaticPointConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2StaticPointConfig GetEcosimAIV2StaticPointConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2StaticPointConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2StaticPointConfig::GetEcosimAIV2StaticPointConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2StaticPointConfig GetDefaultedEcosimAIV2StaticPointConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2StaticPointConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2StaticPointConfig);
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
FC_EcosimAIV2StaticPointConfig GetDefaultedEcosimAIV2StaticPointConfig_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2StaticPointConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2StaticPointConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2StaticPointConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2StaticPointConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2StaticPointConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2StaticPointConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2StaticPointConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2StaticPointConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2StaticPointConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2StaticPointConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2StaticPointConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2StaticPointConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2StaticPointConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2StaticPointConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2StaticPointConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2StaticPointConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2StaticPointConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2StaticPointConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2StaticPointConfig, bFixedFrame, Details);
    return;
}
