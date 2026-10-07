
namespace __INTENRAL_FC_OculusConfig_NS
{
    const TECSComponentDerivedPtr<FC_OculusConfig> DerivedPtr = TECSComponentDerivedPtr<FC_OculusConfig>();
    const FC_OculusConfig DefaultValue = FC_OculusConfig();

}
struct FC_OculusConfig : FECSComponent
{
    UPROPERTY()
    float32 AddExperience = 100.0f;
    UPROPERTY()
    FOculusStateConfig StateConfig;


}

namespace ECSFunc_FC_OculusConfig
{
UFUNCTION()
bool HasOculusConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_OculusConfig);
}
FC_OculusConfig& AssignOculusConfig(const FECSEntity &inout Entity, const FC_OculusConfig &inout DefaultValue = FC_OculusConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_OculusConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignOculusConfig_BP(const FECSEntity &inout Entity, const FC_OculusConfig &inout DefaultValue = FC_OculusConfig())
{
    ECSFunc_FC_OculusConfig::AssignOculusConfig(Entity, DefaultValue);
    return;
}
FC_OculusConfig& ModifyOculusConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_OculusConfig));
    return local_12.GetComp();
}
FC_OculusConfig& ModifyOrAddOculusConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_OculusConfig));
    return local_12.GetComp();
}
const FC_OculusConfig& GetOculusConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_OculusConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_OculusConfig GetOculusConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_OculusConfig& local_4 = ECSFunc_FC_OculusConfig::GetOculusConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_OculusConfig();
}
const FC_OculusConfig GetDefaultedOculusConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_OculusConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_OculusConfig);
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
FC_OculusConfig GetDefaultedOculusConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_OculusConfig::GetDefaultedOculusConfig(Entity);
}
UFUNCTION()
bool RemoveOculusConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_OculusConfig);
}
}
FECSMonitorRuntimeView __GetMonitorOculusConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_OculusConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOculusConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_OculusConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOculusConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_OculusConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOculusConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_OculusConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOculusConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_OculusConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorOculusConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_OculusConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOculusConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_OculusConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOculusConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_OculusConfig, bFixedFrame, Details);
    return;
}
