
namespace __INTENRAL_FC_ConstMonsterSpawnerConfig_NS
{
    const TECSComponentDerivedPtr<FC_ConstMonsterSpawnerConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ConstMonsterSpawnerConfig>();
    const FC_ConstMonsterSpawnerConfig DefaultValue = FC_ConstMonsterSpawnerConfig();

}
struct FC_ConstMonsterSpawnerConfig : FECSComponent
{
    UPROPERTY()
    FVirtualConfigData Config;

    FC_ConstMonsterSpawnerConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_ConstMonsterSpawnerConfig
{
UFUNCTION()
bool HasConstMonsterSpawnerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ConstMonsterSpawnerConfig);
}
FC_ConstMonsterSpawnerConfig& AssignConstMonsterSpawnerConfig(const FECSEntity &inout Entity, const FC_ConstMonsterSpawnerConfig &inout DefaultValue = FC_ConstMonsterSpawnerConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ConstMonsterSpawnerConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignConstMonsterSpawnerConfig_BP(const FECSEntity &inout Entity, const FC_ConstMonsterSpawnerConfig &inout DefaultValue = FC_ConstMonsterSpawnerConfig())
{
    ECSFunc_FC_ConstMonsterSpawnerConfig::AssignConstMonsterSpawnerConfig(Entity, DefaultValue);
    return;
}
FC_ConstMonsterSpawnerConfig& ModifyConstMonsterSpawnerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ConstMonsterSpawnerConfig));
    return local_12.GetComp();
}
FC_ConstMonsterSpawnerConfig& ModifyOrAddConstMonsterSpawnerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ConstMonsterSpawnerConfig));
    return local_12.GetComp();
}
const FC_ConstMonsterSpawnerConfig& GetConstMonsterSpawnerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ConstMonsterSpawnerConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ConstMonsterSpawnerConfig GetConstMonsterSpawnerConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ConstMonsterSpawnerConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_ConstMonsterSpawnerConfig::GetConstMonsterSpawnerConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ConstMonsterSpawnerConfig GetDefaultedConstMonsterSpawnerConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ConstMonsterSpawnerConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ConstMonsterSpawnerConfig);
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
FC_ConstMonsterSpawnerConfig GetDefaultedConstMonsterSpawnerConfig_BP(const FECSEntity &inout Entity)
{
    FC_ConstMonsterSpawnerConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveConstMonsterSpawnerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ConstMonsterSpawnerConfig);
}
}
FECSMonitorRuntimeView __GetMonitorConstMonsterSpawnerConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ConstMonsterSpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorConstMonsterSpawnerConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ConstMonsterSpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorConstMonsterSpawnerConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ConstMonsterSpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorConstMonsterSpawnerConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ConstMonsterSpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorConstMonsterSpawnerConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ConstMonsterSpawnerConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorConstMonsterSpawnerConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ConstMonsterSpawnerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorConstMonsterSpawnerConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ConstMonsterSpawnerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorConstMonsterSpawnerConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ConstMonsterSpawnerConfig, bFixedFrame, Details);
    return;
}
