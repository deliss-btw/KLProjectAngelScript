
namespace __INTENRAL_FC_AccountExclusiveTeleporterConfig_NS
{
    const TECSComponentDerivedPtr<FC_AccountExclusiveTeleporterConfig> DerivedPtr = TECSComponentDerivedPtr<FC_AccountExclusiveTeleporterConfig>();
    const FC_AccountExclusiveTeleporterConfig DefaultValue = FC_AccountExclusiveTeleporterConfig();
}
namespace __INTENRAL_FCE_TeleporterStateChanged_NS
{
    const TECSEventDerivedPtr<FCE_TeleporterStateChanged> DerivedPtr = TECSEventDerivedPtr<FCE_TeleporterStateChanged>();
}
namespace __INTENRAL_FCE_TeleporterOpenUI_NS
{
    const TECSEventDerivedPtr<FCE_TeleporterOpenUI> DerivedPtr = TECSEventDerivedPtr<FCE_TeleporterOpenUI>();
}
namespace __INTENRAL_FCE_AccountExclusiveTeleporterActivated_DataTracker_NS
{
    const TECSEventDerivedPtr<FCE_AccountExclusiveTeleporterActivated_DataTracker> DerivedPtr = TECSEventDerivedPtr<FCE_AccountExclusiveTeleporterActivated_DataTracker>();

}
struct FCE_TeleporterStateChanged : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TeleporterEntity;
    UPROPERTY()
    ETeleporterState OldState;
    UPROPERTY()
    ETeleporterState NewState;


}

struct FCE_TeleporterOpenUI : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_TeleporterOpenUI()
    {
        return;
    }
}

struct FC_AccountExclusiveTeleporterConfig : FECSComponent
{
    UPROPERTY()
    TDataObjectPtr<FTeleporterConfig> TeleporterConfig;
    UPROPERTY()
    FGameplayTag WidgetTag;
    UPROPERTY()
    FAccountExclusiveTeleporterStateConfig StateConfig;

    FC_AccountExclusiveTeleporterConfig()
    {
        return;
    }
    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        int local_10 = 0;
        if (!(this))
        {
            return;
        }
        if (ECS::GetRuntimeInfo().IsServer)
        {
            FECSWorldPtr local_4 = ECS::GetECSWorld();
            local_10.GetModify_Teleporters().Add(Entity, this);
        }
        return;
    }
}

struct FCE_AccountExclusiveTeleporterActivated_DataTracker : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TeleporterEntity;
    UPROPERTY()
    FECSEntity InteractSourceEntity;
    UPROPERTY()
    uint DataId;


}

namespace ECSFunc_FC_AccountExclusiveTeleporterConfig
{
UFUNCTION()
bool HasAccountExclusiveTeleporterConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveTeleporterConfig);
}
FC_AccountExclusiveTeleporterConfig& AssignAccountExclusiveTeleporterConfig(const FECSEntity &inout Entity, const FC_AccountExclusiveTeleporterConfig &inout DefaultValue = FC_AccountExclusiveTeleporterConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveTeleporterConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAccountExclusiveTeleporterConfig_BP(const FECSEntity &inout Entity, const FC_AccountExclusiveTeleporterConfig &inout DefaultValue = FC_AccountExclusiveTeleporterConfig())
{
    ECSFunc_FC_AccountExclusiveTeleporterConfig::AssignAccountExclusiveTeleporterConfig(Entity, DefaultValue);
    return;
}
FC_AccountExclusiveTeleporterConfig& ModifyAccountExclusiveTeleporterConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveTeleporterConfig));
    return local_12.GetComp();
}
FC_AccountExclusiveTeleporterConfig& ModifyOrAddAccountExclusiveTeleporterConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveTeleporterConfig));
    return local_12.GetComp();
}
const FC_AccountExclusiveTeleporterConfig& GetAccountExclusiveTeleporterConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveTeleporterConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_AccountExclusiveTeleporterConfig GetAccountExclusiveTeleporterConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AccountExclusiveTeleporterConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_AccountExclusiveTeleporterConfig::GetAccountExclusiveTeleporterConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AccountExclusiveTeleporterConfig GetDefaultedAccountExclusiveTeleporterConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AccountExclusiveTeleporterConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveTeleporterConfig);
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
FC_AccountExclusiveTeleporterConfig GetDefaultedAccountExclusiveTeleporterConfig_BP(const FECSEntity &inout Entity)
{
    FC_AccountExclusiveTeleporterConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveAccountExclusiveTeleporterConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveTeleporterConfig);
}
}
FECSMonitorRuntimeView __GetMonitorAccountExclusiveTeleporterConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AccountExclusiveTeleporterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusiveTeleporterConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AccountExclusiveTeleporterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusiveTeleporterConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AccountExclusiveTeleporterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusiveTeleporterConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AccountExclusiveTeleporterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusiveTeleporterConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AccountExclusiveTeleporterConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorAccountExclusiveTeleporterConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AccountExclusiveTeleporterConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAccountExclusiveTeleporterConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AccountExclusiveTeleporterConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAccountExclusiveTeleporterConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AccountExclusiveTeleporterConfig, bFixedFrame, Details);
    return;
}
