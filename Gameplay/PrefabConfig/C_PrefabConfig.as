
namespace __INTENRAL_FC_PrefabConfig_NS
{
    const TECSComponentDerivedPtr<FC_PrefabConfig> DerivedPtr = TECSComponentDerivedPtr<FC_PrefabConfig>();
    const FC_PrefabConfig DefaultValue = FC_PrefabConfig();
}
namespace __INTENRAL_FC_PrefabConfigOverride_NS
{
    const TECSComponentDerivedPtr<FC_PrefabConfigOverride> DerivedPtr = TECSComponentDerivedPtr<FC_PrefabConfigOverride>();
    const FC_PrefabConfigOverride DefaultValue = FC_PrefabConfigOverride();
}
namespace __INTENRAL_FC_PrefabInfoDisplayConfig_NS
{
    const TECSComponentDerivedPtr<FC_PrefabInfoDisplayConfig> DerivedPtr = TECSComponentDerivedPtr<FC_PrefabInfoDisplayConfig>();
    const FC_PrefabInfoDisplayConfig DefaultValue = FC_PrefabInfoDisplayConfig();

}
struct FC_PrefabConfig : FECSComponent
{
    UPROPERTY()
    TDataObjectPtr<FBasePrefabConfig> ConfigPtr;
    UPROPERTY()
    EPrefabType PrefabType = EPrefabType(0);
    UPROPERTY()
    FDataObjectPtr ConfigHandle;


    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FName GetPrefabAvatarName() const
    {
        return this.ConfigHandle.GetDataName();
    }
    bool GetMonsterConfigRow(const FName &inout InputRowName, FMonsterPrefabConfig &inout TargetRow) const
    {
        UDataTable local_6 = (Cast<UDataTable>(this.ConfigHandle.GetRoot()));
        if (local_6 != nullptr)
        {
            return local_6.FindRow(InputRowName, TargetRow);
        }
        return false;
    }
    bool GetPropConfigRow(const FName &inout InputRowName, FPropPrefabConfig &inout TargetRow) const
    {
        UDataTable local_6 = (Cast<UDataTable>(this.ConfigHandle.GetRoot()));
        if (local_6 != nullptr)
        {
            return local_6.FindRow(InputRowName, TargetRow);
        }
        return false;
    }
}

struct FC_PrefabConfigOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FBasePrefabConfig> m_ConfigPtr;
    UPROPERTY()
    EPrefabType m_PrefabType;

    FC_PrefabConfigOverride()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PrefabConfigOverride(const FC_PrefabConfigOverride &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PrefabConfigOverride opAssign(const FC_PrefabConfigOverride &inout Other)
    {
        FC_PrefabConfigOverride __r;
        this.SetConfigPtr(Other.GetConfigPtr());
        this.SetPrefabType(Other.GetPrefabType());
        return __r;
    }
    FName GetPrefabAvatarName() const
    {
        return this.GetConfigPtr().GetDataName();
    }
    const TDataObjectPtr<FBasePrefabConfig> GetConfigPtr() const property
    {
        const TDataObjectPtr<FBasePrefabConfig> __r;
        return __r;
    }
    TDataObjectPtr<FBasePrefabConfig> GetModify_ConfigPtr() property
    {
        TDataObjectPtr<FBasePrefabConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetConfigPtr(const TDataObjectPtr<FBasePrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ConfigPtr = __Value;
        return;
    }
    EPrefabType GetPrefabType() const property
    {
        return this.m_PrefabType;
    }
    void SetPrefabType(const EPrefabType __Value) property
    {
        if (int(this.m_PrefabType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_PrefabType = __Value;
        return;
    }
}

struct FC_PrefabInfoDisplayConfig : FECSComponent
{
    UPROPERTY()
    float32 MaxShowDistance = 0.0f;
    UPROPERTY()
    float32 MinShowDistance = 0.0f;
    UPROPERTY()
    bool bDisplayName = true;
    UPROPERTY()
    bool bDisplayIcon = true;
    UPROPERTY()
    bool bOverrideDisplayOffset;
    UPROPERTY()
    EOffsetRefType OverrideDisplayOffsetType;
    UPROPERTY()
    FVector OverrideDisplayOffset = FVector::ZeroVector;
    UPROPERTY()
    TDataObjectPtr<FEntityInfoDisplayConfig> EntityInfoDisplayConfig;


}

struct FT_PrefabConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PrefabConfig_Defination;
    UPROPERTY()
    FC_PrefabConfig Config_FC_PrefabConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PrefabInfoDisplayConfig_Defination;
    UPROPERTY()
    bool bHas_FC_PrefabInfoDisplayConfig;
    UPROPERTY()
    FC_PrefabInfoDisplayConfig Config_FC_PrefabInfoDisplayConfig;

    default CustomName = FName("еџєжњ¬й…ЌзЅ® (FT_PrefabConfig)");

    FT_PrefabConfig()
    {
        this.FC_PrefabConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PrefabConfig, NAME_None);
        this.FC_PrefabInfoDisplayConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PrefabInfoDisplayConfig, NAME_None);
        this.bHas_FC_PrefabInfoDisplayConfig = false;
        this.__InitDefaults();
        return;
    }
}

UFUNCTION()
TDataObjectPtr<FBasePrefabConfig> GetPrefabConfigPtr(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_PrefabConfigOverride& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.GetConfigPtr();
    }
    GetDefaulted local_36;
    return local_36.opCall().ConfigPtr;
}
UFUNCTION()
EPrefabType GetPrefabType(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_PrefabConfigOverride& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.GetPrefabType();
    }
    GetDefaulted local_12;
    return local_12.opCall().PrefabType;
}
UFUNCTION()
FName GetPrefabAvatarName(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_PrefabConfigOverride& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.GetPrefabAvatarName();
    }
    GetDefaulted local_14;
    return local_14.opCall().GetPrefabAvatarName();
}
UFUNCTION()
FName GetPrefabAvatarSwitchName(const FECSEntity &inout Entity)
{
    TDataObjectPtr<FAvatarPrefabConfig> local_48 = GetAvatarConfig(Entity);
    if ((!((local_48 == nullptr))))
    {
        return local_48.opArrow().AvatarAudioSwitchName;
    }
    return NAME_None;
}
void UsingPrefabConfigSample(const FECSEntity &inout Entity)
{
    TDataObjectPtr<FAvatarPrefabConfig> local_48 = GetAvatarConfig(Entity);
    if ((!((local_48 == nullptr))))
    {
        XError(ELog(0), FString().Append("AvatarConfigPtr: ").Append(local_48.opArrow().DisplayName));
    }
    TDataObjectPtr<FPropPrefabConfig> local_128 = TDataObjectPtr<FPropPrefabConfig>(GetPrefabConfigPtr(Entity).CastTo(FPropPrefabConfig));
    if ((!((local_48 == nullptr))))
    {
        XError(ELog(0), FString().Append("AvatarConfigPtr: ").Append(local_48.opArrow().DisplayName));
    }
    return;
}
namespace ECSFunc_FC_PrefabConfig
{
UFUNCTION()
bool HasPrefabConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PrefabConfig);
}
FC_PrefabConfig& AssignPrefabConfig(const FECSEntity &inout Entity, const FC_PrefabConfig &inout DefaultValue = FC_PrefabConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PrefabConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPrefabConfig_BP(const FECSEntity &inout Entity, const FC_PrefabConfig &inout DefaultValue = FC_PrefabConfig())
{
    ECSFunc_FC_PrefabConfig::AssignPrefabConfig(Entity, DefaultValue);
    return;
}
FC_PrefabConfig& ModifyPrefabConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PrefabConfig));
    return local_12.GetComp();
}
FC_PrefabConfig& ModifyOrAddPrefabConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PrefabConfig));
    return local_12.GetComp();
}
const FC_PrefabConfig& GetPrefabConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PrefabConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_PrefabConfig GetPrefabConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PrefabConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_PrefabConfig::GetPrefabConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PrefabConfig GetDefaultedPrefabConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PrefabConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PrefabConfig);
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
FC_PrefabConfig GetDefaultedPrefabConfig_BP(const FECSEntity &inout Entity)
{
    FC_PrefabConfig __r;
    return __r;
}
UFUNCTION()
bool RemovePrefabConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PrefabConfig);
}
}
FECSMonitorRuntimeView __GetMonitorPrefabConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PrefabConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PrefabConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PrefabConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PrefabConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PrefabConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorPrefabConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PrefabConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPrefabConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PrefabConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPrefabConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PrefabConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PrefabConfigOverride
{
UFUNCTION()
bool HasPrefabConfigOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PrefabConfigOverride);
}
FC_PrefabConfigOverride& AssignPrefabConfigOverride(const FECSEntity &inout Entity, const FC_PrefabConfigOverride &inout DefaultValue = FC_PrefabConfigOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PrefabConfigOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPrefabConfigOverride_BP(const FECSEntity &inout Entity, const FC_PrefabConfigOverride &inout DefaultValue = FC_PrefabConfigOverride())
{
    ECSFunc_FC_PrefabConfigOverride::AssignPrefabConfigOverride(Entity, DefaultValue);
    return;
}
FC_PrefabConfigOverride& ModifyPrefabConfigOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PrefabConfigOverride));
    return local_12.GetComp();
}
FC_PrefabConfigOverride& ModifyOrAddPrefabConfigOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PrefabConfigOverride));
    return local_12.GetComp();
}
const FC_PrefabConfigOverride& GetPrefabConfigOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PrefabConfigOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_PrefabConfigOverride GetPrefabConfigOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PrefabConfigOverride& local_4 = ECSFunc_FC_PrefabConfigOverride::GetPrefabConfigOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PrefabConfigOverride();
}
const FC_PrefabConfigOverride GetDefaultedPrefabConfigOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PrefabConfigOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PrefabConfigOverride);
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
FC_PrefabConfigOverride GetDefaultedPrefabConfigOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PrefabConfigOverride::GetDefaultedPrefabConfigOverride(Entity);
}
UFUNCTION()
bool RemovePrefabConfigOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PrefabConfigOverride);
}
}
FECSMonitorRuntimeView __GetMonitorPrefabConfigOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PrefabConfigOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabConfigOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PrefabConfigOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabConfigOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PrefabConfigOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabConfigOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PrefabConfigOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabConfigOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PrefabConfigOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorPrefabConfigOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PrefabConfigOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPrefabConfigOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PrefabConfigOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPrefabConfigOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PrefabConfigOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PrefabInfoDisplayConfig
{
UFUNCTION()
bool HasPrefabInfoDisplayConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PrefabInfoDisplayConfig);
}
FC_PrefabInfoDisplayConfig& AssignPrefabInfoDisplayConfig(const FECSEntity &inout Entity, const FC_PrefabInfoDisplayConfig &inout DefaultValue = FC_PrefabInfoDisplayConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PrefabInfoDisplayConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPrefabInfoDisplayConfig_BP(const FECSEntity &inout Entity, const FC_PrefabInfoDisplayConfig &inout DefaultValue = FC_PrefabInfoDisplayConfig())
{
    ECSFunc_FC_PrefabInfoDisplayConfig::AssignPrefabInfoDisplayConfig(Entity, DefaultValue);
    return;
}
FC_PrefabInfoDisplayConfig& ModifyPrefabInfoDisplayConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PrefabInfoDisplayConfig));
    return local_12.GetComp();
}
FC_PrefabInfoDisplayConfig& ModifyOrAddPrefabInfoDisplayConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PrefabInfoDisplayConfig));
    return local_12.GetComp();
}
const FC_PrefabInfoDisplayConfig& GetPrefabInfoDisplayConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PrefabInfoDisplayConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_PrefabInfoDisplayConfig GetPrefabInfoDisplayConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PrefabInfoDisplayConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_PrefabInfoDisplayConfig::GetPrefabInfoDisplayConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PrefabInfoDisplayConfig GetDefaultedPrefabInfoDisplayConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PrefabInfoDisplayConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PrefabInfoDisplayConfig);
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
FC_PrefabInfoDisplayConfig GetDefaultedPrefabInfoDisplayConfig_BP(const FECSEntity &inout Entity)
{
    FC_PrefabInfoDisplayConfig __r;
    return __r;
}
UFUNCTION()
bool RemovePrefabInfoDisplayConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PrefabInfoDisplayConfig);
}
}
FECSMonitorRuntimeView __GetMonitorPrefabInfoDisplayConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PrefabInfoDisplayConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabInfoDisplayConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PrefabInfoDisplayConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabInfoDisplayConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PrefabInfoDisplayConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabInfoDisplayConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PrefabInfoDisplayConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabInfoDisplayConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PrefabInfoDisplayConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorPrefabInfoDisplayConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PrefabInfoDisplayConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPrefabInfoDisplayConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PrefabInfoDisplayConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPrefabInfoDisplayConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PrefabInfoDisplayConfig, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PrefabConfigOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PrefabConfigOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PrefabConfigOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PrefabConfigOverride
{
int __IndexOf_ConfigPtr()
{
    return 0;
}
int __IndexOf_PrefabType()
{
    return 1;
}
}
