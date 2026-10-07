
namespace __INTENRAL_FC_WeaponMaterialConfig_NS
{
    const TECSComponentDerivedPtr<FC_WeaponMaterialConfig> DerivedPtr = TECSComponentDerivedPtr<FC_WeaponMaterialConfig>();
    const FC_WeaponMaterialConfig DefaultValue = FC_WeaponMaterialConfig();
}
namespace __INTENRAL_FC_CurrentWeaponAttachInfo_NS
{
    const TECSComponentDerivedPtr<FC_CurrentWeaponAttachInfo> DerivedPtr = TECSComponentDerivedPtr<FC_CurrentWeaponAttachInfo>();
    const FC_CurrentWeaponAttachInfo DefaultValue = FC_CurrentWeaponAttachInfo();

}
struct FC_WeaponMaterialConfig : FECSComponent
{
    UPROPERTY()
    TArray<FSingleMaterialParamRequestData> AttachToHandFadingMaterial;
    UPROPERTY()
    TArray<FSingleMaterialParamRequestData> AttachToBackFadingMaterial;

    FC_WeaponMaterialConfig()
    {
        return;
    }
}

struct FC_CurrentWeaponAttachInfo : FECSComponent
{
    UPROPERTY()
    EAttachmentSocket AttachSocket;


}

namespace ECSFunc_FC_WeaponMaterialConfig
{
UFUNCTION()
bool HasWeaponMaterialConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_WeaponMaterialConfig);
}
FC_WeaponMaterialConfig& AssignWeaponMaterialConfig(const FECSEntity &inout Entity, const FC_WeaponMaterialConfig &inout DefaultValue = FC_WeaponMaterialConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_WeaponMaterialConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignWeaponMaterialConfig_BP(const FECSEntity &inout Entity, const FC_WeaponMaterialConfig &inout DefaultValue = FC_WeaponMaterialConfig())
{
    ECSFunc_FC_WeaponMaterialConfig::AssignWeaponMaterialConfig(Entity, DefaultValue);
    return;
}
FC_WeaponMaterialConfig& ModifyWeaponMaterialConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_WeaponMaterialConfig));
    return local_12.GetComp();
}
FC_WeaponMaterialConfig& ModifyOrAddWeaponMaterialConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_WeaponMaterialConfig));
    return local_12.GetComp();
}
const FC_WeaponMaterialConfig& GetWeaponMaterialConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_WeaponMaterialConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_WeaponMaterialConfig GetWeaponMaterialConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_WeaponMaterialConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_WeaponMaterialConfig::GetWeaponMaterialConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_WeaponMaterialConfig GetDefaultedWeaponMaterialConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_WeaponMaterialConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_WeaponMaterialConfig);
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
FC_WeaponMaterialConfig GetDefaultedWeaponMaterialConfig_BP(const FECSEntity &inout Entity)
{
    FC_WeaponMaterialConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveWeaponMaterialConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_WeaponMaterialConfig);
}
}
FECSMonitorRuntimeView __GetMonitorWeaponMaterialConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_WeaponMaterialConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponMaterialConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_WeaponMaterialConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponMaterialConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_WeaponMaterialConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponMaterialConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_WeaponMaterialConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponMaterialConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_WeaponMaterialConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorWeaponMaterialConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_WeaponMaterialConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeaponMaterialConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_WeaponMaterialConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeaponMaterialConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_WeaponMaterialConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CurrentWeaponAttachInfo
{
UFUNCTION()
bool HasCurrentWeaponAttachInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CurrentWeaponAttachInfo);
}
FC_CurrentWeaponAttachInfo& AssignCurrentWeaponAttachInfo(const FECSEntity &inout Entity, const FC_CurrentWeaponAttachInfo &inout DefaultValue = FC_CurrentWeaponAttachInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CurrentWeaponAttachInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCurrentWeaponAttachInfo_BP(const FECSEntity &inout Entity, const FC_CurrentWeaponAttachInfo &inout DefaultValue = FC_CurrentWeaponAttachInfo())
{
    ECSFunc_FC_CurrentWeaponAttachInfo::AssignCurrentWeaponAttachInfo(Entity, DefaultValue);
    return;
}
FC_CurrentWeaponAttachInfo& ModifyCurrentWeaponAttachInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CurrentWeaponAttachInfo));
    return local_12.GetComp();
}
FC_CurrentWeaponAttachInfo& ModifyOrAddCurrentWeaponAttachInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CurrentWeaponAttachInfo));
    return local_12.GetComp();
}
const FC_CurrentWeaponAttachInfo& GetCurrentWeaponAttachInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CurrentWeaponAttachInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_CurrentWeaponAttachInfo GetCurrentWeaponAttachInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CurrentWeaponAttachInfo& local_4 = ECSFunc_FC_CurrentWeaponAttachInfo::GetCurrentWeaponAttachInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CurrentWeaponAttachInfo();
}
const FC_CurrentWeaponAttachInfo GetDefaultedCurrentWeaponAttachInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CurrentWeaponAttachInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CurrentWeaponAttachInfo);
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
FC_CurrentWeaponAttachInfo GetDefaultedCurrentWeaponAttachInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CurrentWeaponAttachInfo::GetDefaultedCurrentWeaponAttachInfo(Entity);
}
UFUNCTION()
bool RemoveCurrentWeaponAttachInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CurrentWeaponAttachInfo);
}
}
FECSMonitorRuntimeView __GetMonitorCurrentWeaponAttachInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CurrentWeaponAttachInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurrentWeaponAttachInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CurrentWeaponAttachInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurrentWeaponAttachInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CurrentWeaponAttachInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurrentWeaponAttachInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CurrentWeaponAttachInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurrentWeaponAttachInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CurrentWeaponAttachInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorCurrentWeaponAttachInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CurrentWeaponAttachInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCurrentWeaponAttachInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CurrentWeaponAttachInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCurrentWeaponAttachInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CurrentWeaponAttachInfo, bFixedFrame, Details);
    return;
}
