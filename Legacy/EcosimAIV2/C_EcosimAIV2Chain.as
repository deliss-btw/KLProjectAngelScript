
namespace __INTENRAL_FC_EcosimAIV2ChainParentConfig_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2ChainParentConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2ChainParentConfig>();
    const FC_EcosimAIV2ChainParentConfig DefaultValue = FC_EcosimAIV2ChainParentConfig();
}
namespace __INTENRAL_FC_EcosimAIV2ChainChildConfig_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2ChainChildConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2ChainChildConfig>();
    const FC_EcosimAIV2ChainChildConfig DefaultValue = FC_EcosimAIV2ChainChildConfig();
}
namespace __INTENRAL_FC_EcosimAIV2ChainStateConfig_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2ChainStateConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2ChainStateConfig>();
    const FC_EcosimAIV2ChainStateConfig DefaultValue = FC_EcosimAIV2ChainStateConfig();
}
namespace __INTENRAL_FC_EcosimAIV2ChainInfo_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2ChainInfo> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2ChainInfo>();
    const FC_EcosimAIV2ChainInfo DefaultValue = FC_EcosimAIV2ChainInfo();

}
struct FC_EcosimAIV2ChainParentConfig : FECSComponent
{
    UPROPERTY()
    FChainJointInfo ParentJointInfo;

    FC_EcosimAIV2ChainParentConfig()
    {
        return;
    }
}

struct FC_EcosimAIV2ChainChildConfig : FECSComponent
{
    UPROPERTY()
    FChainJointInfo ChildJointInfo;
    UPROPERTY()
    FChainChildCenterInfo ChildCenterInfo;
    UPROPERTY()
    FChainLinkInfo LinkInfo;

    FC_EcosimAIV2ChainChildConfig()
    {
        return;
    }
}

struct FC_EcosimAIV2ChainStateConfig : FECSComponent
{
    UPROPERTY()
    bool bUnChainWhenDead = true;


}

struct FC_EcosimAIV2ChainInfo : FECSComponent
{
    UPROPERTY()
    bool bHasChainChild = false;


}

namespace ECSFunc_FC_EcosimAIV2ChainParentConfig
{
UFUNCTION()
bool HasEcosimAIV2ChainParentConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainParentConfig);
}
FC_EcosimAIV2ChainParentConfig& AssignEcosimAIV2ChainParentConfig(const FECSEntity &inout Entity, const FC_EcosimAIV2ChainParentConfig &inout DefaultValue = FC_EcosimAIV2ChainParentConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainParentConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2ChainParentConfig_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2ChainParentConfig &inout DefaultValue = FC_EcosimAIV2ChainParentConfig())
{
    ECSFunc_FC_EcosimAIV2ChainParentConfig::AssignEcosimAIV2ChainParentConfig(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2ChainParentConfig& ModifyEcosimAIV2ChainParentConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainParentConfig));
    return local_12.GetComp();
}
FC_EcosimAIV2ChainParentConfig& ModifyOrAddEcosimAIV2ChainParentConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainParentConfig));
    return local_12.GetComp();
}
const FC_EcosimAIV2ChainParentConfig& GetEcosimAIV2ChainParentConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainParentConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2ChainParentConfig GetEcosimAIV2ChainParentConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2ChainParentConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2ChainParentConfig::GetEcosimAIV2ChainParentConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2ChainParentConfig GetDefaultedEcosimAIV2ChainParentConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2ChainParentConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainParentConfig);
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
FC_EcosimAIV2ChainParentConfig GetDefaultedEcosimAIV2ChainParentConfig_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2ChainParentConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2ChainParentConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainParentConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainParentConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2ChainParentConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainParentConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2ChainParentConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainParentConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2ChainParentConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainParentConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2ChainParentConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainParentConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2ChainParentConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2ChainParentConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2ChainParentConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2ChainParentConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2ChainParentConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2ChainParentConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2ChainParentConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2ChainChildConfig
{
UFUNCTION()
bool HasEcosimAIV2ChainChildConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainChildConfig);
}
FC_EcosimAIV2ChainChildConfig& AssignEcosimAIV2ChainChildConfig(const FECSEntity &inout Entity, const FC_EcosimAIV2ChainChildConfig &inout DefaultValue = FC_EcosimAIV2ChainChildConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainChildConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2ChainChildConfig_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2ChainChildConfig &inout DefaultValue = FC_EcosimAIV2ChainChildConfig())
{
    ECSFunc_FC_EcosimAIV2ChainChildConfig::AssignEcosimAIV2ChainChildConfig(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2ChainChildConfig& ModifyEcosimAIV2ChainChildConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainChildConfig));
    return local_12.GetComp();
}
FC_EcosimAIV2ChainChildConfig& ModifyOrAddEcosimAIV2ChainChildConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainChildConfig));
    return local_12.GetComp();
}
const FC_EcosimAIV2ChainChildConfig& GetEcosimAIV2ChainChildConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainChildConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2ChainChildConfig GetEcosimAIV2ChainChildConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2ChainChildConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2ChainChildConfig::GetEcosimAIV2ChainChildConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2ChainChildConfig GetDefaultedEcosimAIV2ChainChildConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2ChainChildConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainChildConfig);
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
FC_EcosimAIV2ChainChildConfig GetDefaultedEcosimAIV2ChainChildConfig_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2ChainChildConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2ChainChildConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainChildConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainChildConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2ChainChildConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainChildConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2ChainChildConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainChildConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2ChainChildConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainChildConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2ChainChildConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainChildConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2ChainChildConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2ChainChildConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2ChainChildConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2ChainChildConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2ChainChildConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2ChainChildConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2ChainChildConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2ChainStateConfig
{
UFUNCTION()
bool HasEcosimAIV2ChainStateConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainStateConfig);
}
FC_EcosimAIV2ChainStateConfig& AssignEcosimAIV2ChainStateConfig(const FECSEntity &inout Entity, const FC_EcosimAIV2ChainStateConfig &inout DefaultValue = FC_EcosimAIV2ChainStateConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainStateConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2ChainStateConfig_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2ChainStateConfig &inout DefaultValue = FC_EcosimAIV2ChainStateConfig())
{
    ECSFunc_FC_EcosimAIV2ChainStateConfig::AssignEcosimAIV2ChainStateConfig(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2ChainStateConfig& ModifyEcosimAIV2ChainStateConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainStateConfig));
    return local_12.GetComp();
}
FC_EcosimAIV2ChainStateConfig& ModifyOrAddEcosimAIV2ChainStateConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainStateConfig));
    return local_12.GetComp();
}
const FC_EcosimAIV2ChainStateConfig& GetEcosimAIV2ChainStateConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainStateConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2ChainStateConfig GetEcosimAIV2ChainStateConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcosimAIV2ChainStateConfig& local_4 = ECSFunc_FC_EcosimAIV2ChainStateConfig::GetEcosimAIV2ChainStateConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcosimAIV2ChainStateConfig();
}
const FC_EcosimAIV2ChainStateConfig GetDefaultedEcosimAIV2ChainStateConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2ChainStateConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainStateConfig);
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
FC_EcosimAIV2ChainStateConfig GetDefaultedEcosimAIV2ChainStateConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcosimAIV2ChainStateConfig::GetDefaultedEcosimAIV2ChainStateConfig(Entity);
}
UFUNCTION()
bool RemoveEcosimAIV2ChainStateConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainStateConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainStateConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2ChainStateConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainStateConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2ChainStateConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainStateConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2ChainStateConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainStateConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2ChainStateConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainStateConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2ChainStateConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2ChainStateConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2ChainStateConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2ChainStateConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2ChainStateConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2ChainStateConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2ChainStateConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2ChainInfo
{
UFUNCTION()
bool HasEcosimAIV2ChainInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainInfo);
}
FC_EcosimAIV2ChainInfo& AssignEcosimAIV2ChainInfo(const FECSEntity &inout Entity, const FC_EcosimAIV2ChainInfo &inout DefaultValue = FC_EcosimAIV2ChainInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2ChainInfo_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2ChainInfo &inout DefaultValue = FC_EcosimAIV2ChainInfo())
{
    ECSFunc_FC_EcosimAIV2ChainInfo::AssignEcosimAIV2ChainInfo(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2ChainInfo& ModifyEcosimAIV2ChainInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainInfo));
    return local_12.GetComp();
}
FC_EcosimAIV2ChainInfo& ModifyOrAddEcosimAIV2ChainInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainInfo));
    return local_12.GetComp();
}
const FC_EcosimAIV2ChainInfo& GetEcosimAIV2ChainInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2ChainInfo GetEcosimAIV2ChainInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcosimAIV2ChainInfo& local_4 = ECSFunc_FC_EcosimAIV2ChainInfo::GetEcosimAIV2ChainInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcosimAIV2ChainInfo();
}
const FC_EcosimAIV2ChainInfo GetDefaultedEcosimAIV2ChainInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2ChainInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainInfo);
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
FC_EcosimAIV2ChainInfo GetDefaultedEcosimAIV2ChainInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcosimAIV2ChainInfo::GetDefaultedEcosimAIV2ChainInfo(Entity);
}
UFUNCTION()
bool RemoveEcosimAIV2ChainInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2ChainInfo);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2ChainInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2ChainInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2ChainInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2ChainInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2ChainInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2ChainInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2ChainInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2ChainInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2ChainInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2ChainInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2ChainInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2ChainInfo, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_EcosimAIV2ChainInfo_bHasChainChild(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().bHasChainChild;
    return;
}
}
