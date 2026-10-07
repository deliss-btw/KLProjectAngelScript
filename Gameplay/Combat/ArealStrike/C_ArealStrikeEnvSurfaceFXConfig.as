
enum EArealStrikeEnvSurfaceFXStyle_Sparks
{
    WithSparks,
    WithoutSparks,
}

namespace __INTENRAL_FC_ArealStrikeEnvSurfaceFXConfig_NS
{
    const TECSComponentDerivedPtr<FC_ArealStrikeEnvSurfaceFXConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ArealStrikeEnvSurfaceFXConfig>();
    const FC_ArealStrikeEnvSurfaceFXConfig DefaultValue = FC_ArealStrikeEnvSurfaceFXConfig();

}
struct FC_ArealStrikeEnvSurfaceFXConfig : FECSComponent
{
    UPROPERTY()
    EArealStrikeEnvSurfaceFXStyle_Sparks Style_Sparks = EArealStrikeEnvSurfaceFXStyle_Sparks(0);


}

namespace ECSFunc_FC_ArealStrikeEnvSurfaceFXConfig
{
UFUNCTION()
bool HasArealStrikeEnvSurfaceFXConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ArealStrikeEnvSurfaceFXConfig);
}
FC_ArealStrikeEnvSurfaceFXConfig& AssignArealStrikeEnvSurfaceFXConfig(const FECSEntity &inout Entity, const FC_ArealStrikeEnvSurfaceFXConfig &inout DefaultValue = FC_ArealStrikeEnvSurfaceFXConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ArealStrikeEnvSurfaceFXConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignArealStrikeEnvSurfaceFXConfig_BP(const FECSEntity &inout Entity, const FC_ArealStrikeEnvSurfaceFXConfig &inout DefaultValue = FC_ArealStrikeEnvSurfaceFXConfig())
{
    ECSFunc_FC_ArealStrikeEnvSurfaceFXConfig::AssignArealStrikeEnvSurfaceFXConfig(Entity, DefaultValue);
    return;
}
FC_ArealStrikeEnvSurfaceFXConfig& ModifyArealStrikeEnvSurfaceFXConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ArealStrikeEnvSurfaceFXConfig));
    return local_12.GetComp();
}
FC_ArealStrikeEnvSurfaceFXConfig& ModifyOrAddArealStrikeEnvSurfaceFXConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ArealStrikeEnvSurfaceFXConfig));
    return local_12.GetComp();
}
const FC_ArealStrikeEnvSurfaceFXConfig& GetArealStrikeEnvSurfaceFXConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ArealStrikeEnvSurfaceFXConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ArealStrikeEnvSurfaceFXConfig GetArealStrikeEnvSurfaceFXConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ArealStrikeEnvSurfaceFXConfig& local_4 = ECSFunc_FC_ArealStrikeEnvSurfaceFXConfig::GetArealStrikeEnvSurfaceFXConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ArealStrikeEnvSurfaceFXConfig();
}
const FC_ArealStrikeEnvSurfaceFXConfig GetDefaultedArealStrikeEnvSurfaceFXConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ArealStrikeEnvSurfaceFXConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ArealStrikeEnvSurfaceFXConfig);
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
FC_ArealStrikeEnvSurfaceFXConfig GetDefaultedArealStrikeEnvSurfaceFXConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ArealStrikeEnvSurfaceFXConfig::GetDefaultedArealStrikeEnvSurfaceFXConfig(Entity);
}
UFUNCTION()
bool RemoveArealStrikeEnvSurfaceFXConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ArealStrikeEnvSurfaceFXConfig);
}
}
FECSMonitorRuntimeView __GetMonitorArealStrikeEnvSurfaceFXConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ArealStrikeEnvSurfaceFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorArealStrikeEnvSurfaceFXConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ArealStrikeEnvSurfaceFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorArealStrikeEnvSurfaceFXConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ArealStrikeEnvSurfaceFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorArealStrikeEnvSurfaceFXConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ArealStrikeEnvSurfaceFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorArealStrikeEnvSurfaceFXConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ArealStrikeEnvSurfaceFXConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorArealStrikeEnvSurfaceFXConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ArealStrikeEnvSurfaceFXConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorArealStrikeEnvSurfaceFXConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ArealStrikeEnvSurfaceFXConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorArealStrikeEnvSurfaceFXConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ArealStrikeEnvSurfaceFXConfig, bFixedFrame, Details);
    return;
}
