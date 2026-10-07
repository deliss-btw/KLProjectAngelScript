
namespace __INTENRAL_FC_PropEcologyListenerConfig_NS
{
    const TECSComponentDerivedPtr<FC_PropEcologyListenerConfig> DerivedPtr = TECSComponentDerivedPtr<FC_PropEcologyListenerConfig>();
    const FC_PropEcologyListenerConfig DefaultValue = FC_PropEcologyListenerConfig();

}
namespace PropEcologyListener
{
struct FPropEcologyListenerConfigItem
{
    UPROPERTY()
    FGameplayTagContainer WeatherTags;
    UPROPERTY()
    FGameplayTagContainer TimeSegmentTags;
    UPROPERTY()
    FNameHandle_ESMBBTrigger ESMTriggerToActivate;
    UPROPERTY()
    float32 ValidTime = 0.1f;


}

}
struct FC_PropEcologyListenerConfig : FECSComponent
{
    UPROPERTY()
    TArray<PropEcologyListener::FPropEcologyListenerConfigItem> ConfigItems;

    FC_PropEcologyListenerConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_PropEcologyListenerConfig
{
UFUNCTION()
bool HasPropEcologyListenerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyListenerConfig);
}
FC_PropEcologyListenerConfig& AssignPropEcologyListenerConfig(const FECSEntity &inout Entity, const FC_PropEcologyListenerConfig &inout DefaultValue = FC_PropEcologyListenerConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyListenerConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPropEcologyListenerConfig_BP(const FECSEntity &inout Entity, const FC_PropEcologyListenerConfig &inout DefaultValue = FC_PropEcologyListenerConfig())
{
    ECSFunc_FC_PropEcologyListenerConfig::AssignPropEcologyListenerConfig(Entity, DefaultValue);
    return;
}
FC_PropEcologyListenerConfig& ModifyPropEcologyListenerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyListenerConfig));
    return local_12.GetComp();
}
FC_PropEcologyListenerConfig& ModifyOrAddPropEcologyListenerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyListenerConfig));
    return local_12.GetComp();
}
const FC_PropEcologyListenerConfig& GetPropEcologyListenerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyListenerConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_PropEcologyListenerConfig GetPropEcologyListenerConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PropEcologyListenerConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_PropEcologyListenerConfig::GetPropEcologyListenerConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PropEcologyListenerConfig GetDefaultedPropEcologyListenerConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PropEcologyListenerConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyListenerConfig);
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
FC_PropEcologyListenerConfig GetDefaultedPropEcologyListenerConfig_BP(const FECSEntity &inout Entity)
{
    FC_PropEcologyListenerConfig __r;
    return __r;
}
UFUNCTION()
bool RemovePropEcologyListenerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyListenerConfig);
}
}
FECSMonitorRuntimeView __GetMonitorPropEcologyListenerConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PropEcologyListenerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEcologyListenerConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PropEcologyListenerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEcologyListenerConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PropEcologyListenerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEcologyListenerConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PropEcologyListenerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEcologyListenerConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PropEcologyListenerConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorPropEcologyListenerConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PropEcologyListenerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropEcologyListenerConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PropEcologyListenerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropEcologyListenerConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PropEcologyListenerConfig, bFixedFrame, Details);
    return;
}
