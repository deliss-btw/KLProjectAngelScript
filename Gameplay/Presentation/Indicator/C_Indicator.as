
namespace __INTENRAL_FC_IndicatorConfig_NS
{
    const TECSComponentDerivedPtr<FC_IndicatorConfig> DerivedPtr = TECSComponentDerivedPtr<FC_IndicatorConfig>();
    const FC_IndicatorConfig DefaultValue = FC_IndicatorConfig();

}
struct FIndicatorExtraOutScreenCheckSocket
{
    UPROPERTY()
    FName SocketName;
    UPROPERTY()
    float32 SocketRadius;


}

struct FC_IndicatorConfig : FECSComponent
{
    UPROPERTY()
    TArray<FIndicatorExtraOutScreenCheckSocket> ExtraOutScreenCheckSockets;

    FC_IndicatorConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_IndicatorConfig
{
UFUNCTION()
bool HasIndicatorConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_IndicatorConfig);
}
FC_IndicatorConfig& AssignIndicatorConfig(const FECSEntity &inout Entity, const FC_IndicatorConfig &inout DefaultValue = FC_IndicatorConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_IndicatorConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignIndicatorConfig_BP(const FECSEntity &inout Entity, const FC_IndicatorConfig &inout DefaultValue = FC_IndicatorConfig())
{
    ECSFunc_FC_IndicatorConfig::AssignIndicatorConfig(Entity, DefaultValue);
    return;
}
FC_IndicatorConfig& ModifyIndicatorConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_IndicatorConfig));
    return local_12.GetComp();
}
FC_IndicatorConfig& ModifyOrAddIndicatorConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_IndicatorConfig));
    return local_12.GetComp();
}
const FC_IndicatorConfig& GetIndicatorConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_IndicatorConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_IndicatorConfig GetIndicatorConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_IndicatorConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_IndicatorConfig::GetIndicatorConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_IndicatorConfig GetDefaultedIndicatorConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_IndicatorConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_IndicatorConfig);
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
FC_IndicatorConfig GetDefaultedIndicatorConfig_BP(const FECSEntity &inout Entity)
{
    FC_IndicatorConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveIndicatorConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_IndicatorConfig);
}
}
FECSMonitorRuntimeView __GetMonitorIndicatorConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_IndicatorConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIndicatorConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_IndicatorConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIndicatorConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_IndicatorConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIndicatorConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_IndicatorConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIndicatorConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_IndicatorConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorIndicatorConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_IndicatorConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorIndicatorConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_IndicatorConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorIndicatorConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_IndicatorConfig, bFixedFrame, Details);
    return;
}
