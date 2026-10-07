
namespace __INTENRAL_FC_ReadyToDestroyTag_NS
{
    const TECSComponentDerivedPtr<FC_ReadyToDestroyTag> DerivedPtr = TECSComponentDerivedPtr<FC_ReadyToDestroyTag>();
    const FC_ReadyToDestroyTag DefaultValue = FC_ReadyToDestroyTag();
}
namespace __INTENRAL_FC_SpawnAppearConfig_NS
{
    const TECSComponentDerivedPtr<FC_SpawnAppearConfig> DerivedPtr = TECSComponentDerivedPtr<FC_SpawnAppearConfig>();
    const FC_SpawnAppearConfig DefaultValue = FC_SpawnAppearConfig();
}
namespace __INTENRAL_FCE_EntityDisappear_NS
{
    const TECSEventDerivedPtr<FCE_EntityDisappear> DerivedPtr = TECSEventDerivedPtr<FCE_EntityDisappear>();

}
struct FCE_EntityDisappear : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FFPTime FadeOutDuration;
    UPROPERTY()
    bool bDisableMoveCollision = true;
    UPROPERTY()
    bool bDisableHitBox = true;
    UPROPERTY()
    bool bDisableOverlapCollision = true;


}

struct FC_ReadyToDestroyTag : FECSComponent
{
    FC_ReadyToDestroyTag()
    {
        return;
    }
}

struct FC_SpawnAppearConfig : FECSComponent
{
    UPROPERTY()
    float32 SpawnAppearDuration = 0.5f;


}

namespace ECSFunc_FC_ReadyToDestroyTag
{
UFUNCTION()
bool HasReadyToDestroyTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ReadyToDestroyTag);
}
FC_ReadyToDestroyTag& AssignReadyToDestroyTag(const FECSEntity &inout Entity, const FC_ReadyToDestroyTag &inout DefaultValue = FC_ReadyToDestroyTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ReadyToDestroyTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignReadyToDestroyTag_BP(const FECSEntity &inout Entity, const FC_ReadyToDestroyTag &inout DefaultValue = FC_ReadyToDestroyTag())
{
    ECSFunc_FC_ReadyToDestroyTag::AssignReadyToDestroyTag(Entity, DefaultValue);
    return;
}
FC_ReadyToDestroyTag& ModifyReadyToDestroyTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ReadyToDestroyTag));
    return local_12.GetComp();
}
FC_ReadyToDestroyTag& ModifyOrAddReadyToDestroyTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ReadyToDestroyTag));
    return local_12.GetComp();
}
const FC_ReadyToDestroyTag& GetReadyToDestroyTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ReadyToDestroyTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ReadyToDestroyTag GetReadyToDestroyTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ReadyToDestroyTag& local_4 = ECSFunc_FC_ReadyToDestroyTag::GetReadyToDestroyTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ReadyToDestroyTag();
}
const FC_ReadyToDestroyTag GetDefaultedReadyToDestroyTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ReadyToDestroyTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ReadyToDestroyTag);
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
FC_ReadyToDestroyTag GetDefaultedReadyToDestroyTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ReadyToDestroyTag::GetDefaultedReadyToDestroyTag(Entity);
}
UFUNCTION()
bool RemoveReadyToDestroyTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ReadyToDestroyTag);
}
}
FECSMonitorRuntimeView __GetMonitorReadyToDestroyTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ReadyToDestroyTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorReadyToDestroyTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ReadyToDestroyTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorReadyToDestroyTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ReadyToDestroyTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorReadyToDestroyTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ReadyToDestroyTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorReadyToDestroyTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ReadyToDestroyTag, bFixedFrame, bMustHandleAll);
}
void __MonitorReadyToDestroyTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ReadyToDestroyTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorReadyToDestroyTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ReadyToDestroyTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorReadyToDestroyTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ReadyToDestroyTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SpawnAppearConfig
{
UFUNCTION()
bool HasSpawnAppearConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SpawnAppearConfig);
}
FC_SpawnAppearConfig& AssignSpawnAppearConfig(const FECSEntity &inout Entity, const FC_SpawnAppearConfig &inout DefaultValue = FC_SpawnAppearConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SpawnAppearConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSpawnAppearConfig_BP(const FECSEntity &inout Entity, const FC_SpawnAppearConfig &inout DefaultValue = FC_SpawnAppearConfig())
{
    ECSFunc_FC_SpawnAppearConfig::AssignSpawnAppearConfig(Entity, DefaultValue);
    return;
}
FC_SpawnAppearConfig& ModifySpawnAppearConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SpawnAppearConfig));
    return local_12.GetComp();
}
FC_SpawnAppearConfig& ModifyOrAddSpawnAppearConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SpawnAppearConfig));
    return local_12.GetComp();
}
const FC_SpawnAppearConfig& GetSpawnAppearConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SpawnAppearConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_SpawnAppearConfig GetSpawnAppearConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SpawnAppearConfig& local_4 = ECSFunc_FC_SpawnAppearConfig::GetSpawnAppearConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SpawnAppearConfig();
}
const FC_SpawnAppearConfig GetDefaultedSpawnAppearConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SpawnAppearConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SpawnAppearConfig);
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
FC_SpawnAppearConfig GetDefaultedSpawnAppearConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SpawnAppearConfig::GetDefaultedSpawnAppearConfig(Entity);
}
UFUNCTION()
bool RemoveSpawnAppearConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SpawnAppearConfig);
}
}
FECSMonitorRuntimeView __GetMonitorSpawnAppearConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SpawnAppearConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnAppearConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SpawnAppearConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnAppearConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SpawnAppearConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnAppearConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SpawnAppearConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnAppearConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SpawnAppearConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorSpawnAppearConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SpawnAppearConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnAppearConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SpawnAppearConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnAppearConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SpawnAppearConfig, bFixedFrame, Details);
    return;
}
