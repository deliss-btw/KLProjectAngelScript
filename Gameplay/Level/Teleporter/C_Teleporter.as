
namespace __INTENRAL_FC_TeleporterConfig_NS
{
    const TECSComponentDerivedPtr<FC_TeleporterConfig> DerivedPtr = TECSComponentDerivedPtr<FC_TeleporterConfig>();
    const FC_TeleporterConfig DefaultValue = FC_TeleporterConfig();
}
namespace __INTENRAL_FCS_Teleporters_NS
{
    const TECSComponentDerivedPtr<FCS_Teleporters> DerivedPtr = TECSComponentDerivedPtr<FCS_Teleporters>();
    const FCS_Teleporters DefaultValue = FCS_Teleporters();
}
namespace __INTENRAL_FC_TeleportSlotConfig_NS
{
    const TECSComponentDerivedPtr<FC_TeleportSlotConfig> DerivedPtr = TECSComponentDerivedPtr<FC_TeleportSlotConfig>();
    const FC_TeleportSlotConfig DefaultValue = FC_TeleportSlotConfig();

}
struct FC_TeleporterConfig : FECSComponent
{
    UPROPERTY()
    TDataObjectPtr<FTeleporterConfig> TeleporterConfig;

    FC_TeleporterConfig()
    {
        return;
    }
}

struct FCS_Teleporters : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntity, TDataObjectPtr<FTeleporterConfig>> m_Teleporters;

    FCS_Teleporters()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_Teleporters(const FCS_Teleporters &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Teleporters = Other.m_Teleporters;
        return;
    }
    FCS_Teleporters opAssign(const FCS_Teleporters &inout Other)
    {
        FCS_Teleporters __r;
        this.SetTeleporters(Other.GetTeleporters());
        return __r;
    }
    FECSEntity GetTeleporter(const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig) const
    {
        if (!(TeleporterConfig))
        {
            return ENTITY_NULL;
        }
        for (auto& local_20 : this.GetTeleporters())
        {
            TDataObjectPtr<FTeleporterConfig> local_44;
            TDataObjectPtr<FTeleporterConfig> local_68;
            local_44 = local_68;
            if ((local_44 == TeleporterConfig.opImplConv()))
            {
                return local_20.GetKey();
            }
        }
        return ENTITY_NULL;
    }
    const TMap<FECSEntity, TDataObjectPtr<FTeleporterConfig>> GetTeleporters() const property
    {
        const TMap<FECSEntity, TDataObjectPtr<FTeleporterConfig>> __r;
        return __r;
    }
    TMap<FECSEntity, TDataObjectPtr<FTeleporterConfig>> GetModify_Teleporters() property
    {
        TMap<FECSEntity, TDataObjectPtr<FTeleporterConfig>> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTeleporters(const TMap<FECSEntity, TDataObjectPtr<FTeleporterConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Teleporters = __Value;
        return;
    }
}

struct FTeleportSlot
{
    UPROPERTY()
    FTransform SlotTransform;
    UPROPERTY()
    float32 SlotRadius;
    UPROPERTY()
    float32 SlotInnerRadius;


}

struct FTeleportSlotConfig
{
    UPROPERTY()
    TArray<FTeleportSlot> Slots;

    FTeleportSlotConfig()
    {
        return;
    }
}

struct FC_TeleportSlotConfig : FECSComponent
{
    UPROPERTY()
    FTeleportSlotConfig SlotConfig;

    FC_TeleportSlotConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_TeleporterConfig
{
UFUNCTION()
bool HasTeleporterConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TeleporterConfig);
}
FC_TeleporterConfig& AssignTeleporterConfig(const FECSEntity &inout Entity, const FC_TeleporterConfig &inout DefaultValue = FC_TeleporterConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TeleporterConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTeleporterConfig_BP(const FECSEntity &inout Entity, const FC_TeleporterConfig &inout DefaultValue = FC_TeleporterConfig())
{
    ECSFunc_FC_TeleporterConfig::AssignTeleporterConfig(Entity, DefaultValue);
    return;
}
FC_TeleporterConfig& ModifyTeleporterConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TeleporterConfig));
    return local_12.GetComp();
}
FC_TeleporterConfig& ModifyOrAddTeleporterConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TeleporterConfig));
    return local_12.GetComp();
}
const FC_TeleporterConfig& GetTeleporterConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TeleporterConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_TeleporterConfig GetTeleporterConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TeleporterConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_TeleporterConfig::GetTeleporterConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TeleporterConfig GetDefaultedTeleporterConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TeleporterConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TeleporterConfig);
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
FC_TeleporterConfig GetDefaultedTeleporterConfig_BP(const FECSEntity &inout Entity)
{
    FC_TeleporterConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveTeleporterConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TeleporterConfig);
}
}
FECSMonitorRuntimeView __GetMonitorTeleporterConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TeleporterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleporterConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TeleporterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleporterConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TeleporterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleporterConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TeleporterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleporterConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TeleporterConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorTeleporterConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TeleporterConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleporterConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TeleporterConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleporterConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TeleporterConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_Teleporters
{
UFUNCTION()
bool HasTeleporters(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_Teleporters);
}
FCS_Teleporters& AssignTeleporters(const FECSWorldPtr &inout World, const FCS_Teleporters &inout DefaultValue = FCS_Teleporters())
{
    UScriptStruct local_6 = FCS_Teleporters;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTeleporters_BP(const FECSWorldPtr &inout World, const FCS_Teleporters &inout DefaultValue = FCS_Teleporters())
{
    ECSFunc_FCS_Teleporters::AssignTeleporters(World, DefaultValue);
    return;
}
FCS_Teleporters& ModifyTeleporters(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_Teleporters;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_Teleporters& ModifyOrAddTeleporters(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_Teleporters;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_Teleporters& GetTeleporters(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_Teleporters;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_Teleporters GetTeleporters_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_Teleporters& local_4 = ECSFunc_FCS_Teleporters::GetTeleporters(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_Teleporters();
}
const FCS_Teleporters GetDefaultedTeleporters(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_Teleporters __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_Teleporters);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_Teleporters GetDefaultedTeleporters_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_Teleporters::GetDefaultedTeleporters(World);
}
UFUNCTION()
bool RemoveTeleporters(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_Teleporters);
}
}
void __MonitorTeleportersLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_Teleporters, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportersActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_Teleporters, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportersModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_Teleporters, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TeleportSlotConfig
{
UFUNCTION()
bool HasTeleportSlotConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TeleportSlotConfig);
}
FC_TeleportSlotConfig& AssignTeleportSlotConfig(const FECSEntity &inout Entity, const FC_TeleportSlotConfig &inout DefaultValue = FC_TeleportSlotConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TeleportSlotConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTeleportSlotConfig_BP(const FECSEntity &inout Entity, const FC_TeleportSlotConfig &inout DefaultValue = FC_TeleportSlotConfig())
{
    ECSFunc_FC_TeleportSlotConfig::AssignTeleportSlotConfig(Entity, DefaultValue);
    return;
}
FC_TeleportSlotConfig& ModifyTeleportSlotConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TeleportSlotConfig));
    return local_12.GetComp();
}
FC_TeleportSlotConfig& ModifyOrAddTeleportSlotConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TeleportSlotConfig));
    return local_12.GetComp();
}
const FC_TeleportSlotConfig& GetTeleportSlotConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TeleportSlotConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_TeleportSlotConfig GetTeleportSlotConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TeleportSlotConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_TeleportSlotConfig::GetTeleportSlotConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TeleportSlotConfig GetDefaultedTeleportSlotConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TeleportSlotConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TeleportSlotConfig);
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
FC_TeleportSlotConfig GetDefaultedTeleportSlotConfig_BP(const FECSEntity &inout Entity)
{
    FC_TeleportSlotConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveTeleportSlotConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TeleportSlotConfig);
}
}
FECSMonitorRuntimeView __GetMonitorTeleportSlotConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TeleportSlotConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportSlotConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TeleportSlotConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportSlotConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TeleportSlotConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportSlotConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TeleportSlotConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportSlotConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TeleportSlotConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorTeleportSlotConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TeleportSlotConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportSlotConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TeleportSlotConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportSlotConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TeleportSlotConfig, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_Teleporters &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_Teleporters &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_Teleporters &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_Teleporters
{
int __IndexOf_Teleporters()
{
    return 0;
}
}
