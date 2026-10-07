
namespace __INTENRAL_FC_TurretAttachmentConfig_NS
{
    const TECSComponentDerivedPtr<FC_TurretAttachmentConfig> DerivedPtr = TECSComponentDerivedPtr<FC_TurretAttachmentConfig>();
    const FC_TurretAttachmentConfig DefaultValue = FC_TurretAttachmentConfig();

}
struct FC_TurretAttachmentConfig : FECSComponent
{
    UPROPERTY()
    FAttachmentRequestParam AttachConfig;

    FC_TurretAttachmentConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_TurretAttachmentConfig
{
UFUNCTION()
bool HasTurretAttachmentConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TurretAttachmentConfig);
}
FC_TurretAttachmentConfig& AssignTurretAttachmentConfig(const FECSEntity &inout Entity, const FC_TurretAttachmentConfig &inout DefaultValue = FC_TurretAttachmentConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TurretAttachmentConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTurretAttachmentConfig_BP(const FECSEntity &inout Entity, const FC_TurretAttachmentConfig &inout DefaultValue = FC_TurretAttachmentConfig())
{
    ECSFunc_FC_TurretAttachmentConfig::AssignTurretAttachmentConfig(Entity, DefaultValue);
    return;
}
FC_TurretAttachmentConfig& ModifyTurretAttachmentConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TurretAttachmentConfig));
    return local_12.GetComp();
}
FC_TurretAttachmentConfig& ModifyOrAddTurretAttachmentConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TurretAttachmentConfig));
    return local_12.GetComp();
}
const FC_TurretAttachmentConfig& GetTurretAttachmentConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TurretAttachmentConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_TurretAttachmentConfig GetTurretAttachmentConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TurretAttachmentConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_TurretAttachmentConfig::GetTurretAttachmentConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TurretAttachmentConfig GetDefaultedTurretAttachmentConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TurretAttachmentConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TurretAttachmentConfig);
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
FC_TurretAttachmentConfig GetDefaultedTurretAttachmentConfig_BP(const FECSEntity &inout Entity)
{
    FC_TurretAttachmentConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveTurretAttachmentConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TurretAttachmentConfig);
}
}
FECSMonitorRuntimeView __GetMonitorTurretAttachmentConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TurretAttachmentConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTurretAttachmentConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TurretAttachmentConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTurretAttachmentConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TurretAttachmentConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTurretAttachmentConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TurretAttachmentConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTurretAttachmentConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TurretAttachmentConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorTurretAttachmentConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TurretAttachmentConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTurretAttachmentConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TurretAttachmentConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTurretAttachmentConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TurretAttachmentConfig, bFixedFrame, Details);
    return;
}
