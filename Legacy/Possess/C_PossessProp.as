
namespace __INTENRAL_FC_PossessPropConfig_NS
{
    const TECSComponentDerivedPtr<FC_PossessPropConfig> DerivedPtr = TECSComponentDerivedPtr<FC_PossessPropConfig>();
    const FC_PossessPropConfig DefaultValue = FC_PossessPropConfig();
}
namespace __INTENRAL_FC_PossessPropEnabled_NS
{
    const TECSComponentDerivedPtr<FC_PossessPropEnabled> DerivedPtr = TECSComponentDerivedPtr<FC_PossessPropEnabled>();
    const FC_PossessPropEnabled DefaultValue = FC_PossessPropEnabled();
}
namespace __INTENRAL_FC_PropPossessdBy_NS
{
    const TECSComponentDerivedPtr<FC_PropPossessdBy> DerivedPtr = TECSComponentDerivedPtr<FC_PropPossessdBy>();
    const FC_PropPossessdBy DefaultValue = FC_PropPossessdBy();
}
namespace __INTENRAL_FC_PossessingProp_NS
{
    const TECSComponentDerivedPtr<FC_PossessingProp> DerivedPtr = TECSComponentDerivedPtr<FC_PossessingProp>();
    const FC_PossessingProp DefaultValue = FC_PossessingProp();

}
struct FC_PossessPropConfig : FECSComponent
{
    UPROPERTY()
    bool bInitialDisabled;
    UPROPERTY()
    bool bEnableAttach;
    UPROPERTY()
    FAttachmentRequestParam AttachConfig;


    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        ModifyOrAdd local_6;
        local_6.opCall().SetbEnabled(!(this.bInitialDisabled));
        ModifyOrAdd local_10;
        local_10.opCall();
        return;
    }
}

struct FC_PossessPropEnabled : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bEnabled;

    FC_PossessPropEnabled()
    {
        this.m_bEnabled = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_PossessPropEnabled(const FC_PossessPropEnabled &inout Other)
    {
        this.m_bEnabled = false;
        this.__InitDirtyFlags();
        this.m_bEnabled = Other.m_bEnabled;
        return;
    }
    FC_PossessPropEnabled opAssign(const FC_PossessPropEnabled &inout Other)
    {
        FC_PossessPropEnabled __r;
        this.SetbEnabled(Other.GetbEnabled());
        return __r;
    }
    bool GetbEnabled() const property
    {
        return this.m_bEnabled;
    }
    void SetbEnabled(const bool __Value) property
    {
        if (!(this.m_bEnabled) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bEnabled = __Value;
        return;
    }
}

struct FT_PossessPropConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PossessPropConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PossessPropConfig, NAME_None);
    UPROPERTY()
    FC_PossessPropConfig Config_FC_PossessPropConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_InputTransferAcceptConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_InputTransferAcceptConfig, NAME_None);
    UPROPERTY()
    FC_InputTransferAcceptConfig Config_FC_InputTransferAcceptConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_DefaultAttachComponentMeshSpaceTransform_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_DefaultAttachComponentMeshSpaceTransform, NAME_None);
    UPROPERTY()
    FC_DefaultAttachComponentMeshSpaceTransform Config_FC_DefaultAttachComponentMeshSpaceTransform;

    FT_PossessPropConfig()
    {
        return;
    }
}

struct FC_PropPossessdBy : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_PossessedByEntity;

    FC_PropPossessdBy()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PropPossessdBy(const FC_PropPossessdBy &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_PossessedByEntity = Other.m_PossessedByEntity;
        return;
    }
    FC_PropPossessdBy opAssign(const FC_PropPossessdBy &inout Other)
    {
        FC_PropPossessdBy __r;
        this.SetPossessedByEntity(Other.GetPossessedByEntity());
        return __r;
    }
    const FECSEntity GetPossessedByEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_PossessedByEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPossessedByEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PossessedByEntity = __Value;
        return;
    }
}

struct FC_PossessingProp : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_PropEntity;
    UPROPERTY()
    bool m_bEnableAttach;
    UPROPERTY()
    FAttachmentRequestParam m_AttachConfig;

    FC_PossessingProp()
    {
        this.m_bEnableAttach = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_PossessingProp(const FC_PossessingProp &inout Other)
    {
        this.m_bEnableAttach = false;
        this.__InitDirtyFlags();
        this.m_PropEntity = Other.m_PropEntity;
        this.m_bEnableAttach = Other.m_bEnableAttach;
        this.m_AttachConfig = Other.m_AttachConfig;
        return;
    }
    FC_PossessingProp opAssign(const FC_PossessingProp &inout Other)
    {
        FC_PossessingProp __r;
        this.SetPropEntity(Other.GetPropEntity());
        this.SetbEnableAttach(Other.GetbEnableAttach());
        this.SetAttachConfig(Other.GetAttachConfig());
        return __r;
    }
    const FECSEntity GetPropEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_PropEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPropEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PropEntity = __Value;
        return;
    }
    bool GetbEnableAttach() const property
    {
        return this.m_bEnableAttach;
    }
    void SetbEnableAttach(const bool __Value) property
    {
        if (!(this.m_bEnableAttach) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bEnableAttach = __Value;
        return;
    }
    const FAttachmentRequestParam GetAttachConfig() const property
    {
        const FAttachmentRequestParam __r;
        return __r;
    }
    FAttachmentRequestParam GetAttachConfig() property
    {
        FAttachmentRequestParam __r;
        return __r;
    }
    void SetAttachConfig(const FAttachmentRequestParam &inout __Value) property
    {
        this.m_AttachConfig = __Value;
        return;
    }
}

namespace ECSFunc_FC_PossessPropConfig
{
UFUNCTION()
bool HasPossessPropConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PossessPropConfig);
}
FC_PossessPropConfig& AssignPossessPropConfig(const FECSEntity &inout Entity, const FC_PossessPropConfig &inout DefaultValue = FC_PossessPropConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PossessPropConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPossessPropConfig_BP(const FECSEntity &inout Entity, const FC_PossessPropConfig &inout DefaultValue = FC_PossessPropConfig())
{
    ECSFunc_FC_PossessPropConfig::AssignPossessPropConfig(Entity, DefaultValue);
    return;
}
FC_PossessPropConfig& ModifyPossessPropConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PossessPropConfig));
    return local_12.GetComp();
}
FC_PossessPropConfig& ModifyOrAddPossessPropConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PossessPropConfig));
    return local_12.GetComp();
}
const FC_PossessPropConfig& GetPossessPropConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PossessPropConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_PossessPropConfig GetPossessPropConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PossessPropConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_PossessPropConfig::GetPossessPropConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PossessPropConfig GetDefaultedPossessPropConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PossessPropConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PossessPropConfig);
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
FC_PossessPropConfig GetDefaultedPossessPropConfig_BP(const FECSEntity &inout Entity)
{
    FC_PossessPropConfig __r;
    return __r;
}
UFUNCTION()
bool RemovePossessPropConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PossessPropConfig);
}
}
FECSMonitorRuntimeView __GetMonitorPossessPropConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PossessPropConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPossessPropConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PossessPropConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPossessPropConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PossessPropConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPossessPropConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PossessPropConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPossessPropConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PossessPropConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorPossessPropConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PossessPropConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPossessPropConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PossessPropConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPossessPropConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PossessPropConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PossessPropEnabled
{
UFUNCTION()
bool HasPossessPropEnabled(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PossessPropEnabled);
}
FC_PossessPropEnabled& AssignPossessPropEnabled(const FECSEntity &inout Entity, const FC_PossessPropEnabled &inout DefaultValue = FC_PossessPropEnabled())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PossessPropEnabled, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPossessPropEnabled_BP(const FECSEntity &inout Entity, const FC_PossessPropEnabled &inout DefaultValue = FC_PossessPropEnabled())
{
    ECSFunc_FC_PossessPropEnabled::AssignPossessPropEnabled(Entity, DefaultValue);
    return;
}
FC_PossessPropEnabled& ModifyPossessPropEnabled(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PossessPropEnabled));
    return local_12.GetComp();
}
FC_PossessPropEnabled& ModifyOrAddPossessPropEnabled(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PossessPropEnabled));
    return local_12.GetComp();
}
const FC_PossessPropEnabled& GetPossessPropEnabled(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PossessPropEnabled));
    return local_12.GetComp();
}
UFUNCTION()
FC_PossessPropEnabled GetPossessPropEnabled_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PossessPropEnabled& local_4 = ECSFunc_FC_PossessPropEnabled::GetPossessPropEnabled(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PossessPropEnabled();
}
const FC_PossessPropEnabled GetDefaultedPossessPropEnabled(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PossessPropEnabled __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PossessPropEnabled);
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
FC_PossessPropEnabled GetDefaultedPossessPropEnabled_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PossessPropEnabled::GetDefaultedPossessPropEnabled(Entity);
}
UFUNCTION()
bool RemovePossessPropEnabled(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PossessPropEnabled);
}
}
FECSMonitorRuntimeView __GetMonitorPossessPropEnabledOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PossessPropEnabled, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPossessPropEnabledOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PossessPropEnabled, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPossessPropEnabledOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PossessPropEnabled, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPossessPropEnabledOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PossessPropEnabled, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPossessPropEnabledOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PossessPropEnabled, bFixedFrame, bMustHandleAll);
}
void __MonitorPossessPropEnabledLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PossessPropEnabled, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPossessPropEnabledActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PossessPropEnabled, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPossessPropEnabledModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PossessPropEnabled, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PropPossessdBy
{
UFUNCTION()
bool HasPropPossessdBy(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PropPossessdBy);
}
FC_PropPossessdBy& AssignPropPossessdBy(const FECSEntity &inout Entity, const FC_PropPossessdBy &inout DefaultValue = FC_PropPossessdBy())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PropPossessdBy, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPropPossessdBy_BP(const FECSEntity &inout Entity, const FC_PropPossessdBy &inout DefaultValue = FC_PropPossessdBy())
{
    ECSFunc_FC_PropPossessdBy::AssignPropPossessdBy(Entity, DefaultValue);
    return;
}
FC_PropPossessdBy& ModifyPropPossessdBy(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PropPossessdBy));
    return local_12.GetComp();
}
FC_PropPossessdBy& ModifyOrAddPropPossessdBy(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PropPossessdBy));
    return local_12.GetComp();
}
const FC_PropPossessdBy& GetPropPossessdBy(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PropPossessdBy));
    return local_12.GetComp();
}
UFUNCTION()
FC_PropPossessdBy GetPropPossessdBy_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PropPossessdBy& local_4 = ECSFunc_FC_PropPossessdBy::GetPropPossessdBy(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PropPossessdBy();
}
const FC_PropPossessdBy GetDefaultedPropPossessdBy(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PropPossessdBy __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PropPossessdBy);
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
FC_PropPossessdBy GetDefaultedPropPossessdBy_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PropPossessdBy::GetDefaultedPropPossessdBy(Entity);
}
UFUNCTION()
bool RemovePropPossessdBy(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PropPossessdBy);
}
}
FECSMonitorRuntimeView __GetMonitorPropPossessdByOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PropPossessdBy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropPossessdByOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PropPossessdBy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropPossessdByOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PropPossessdBy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropPossessdByOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PropPossessdBy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropPossessdByOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PropPossessdBy, bFixedFrame, bMustHandleAll);
}
void __MonitorPropPossessdByLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PropPossessdBy, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropPossessdByActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PropPossessdBy, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropPossessdByModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PropPossessdBy, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PossessingProp
{
UFUNCTION()
bool HasPossessingProp(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PossessingProp);
}
FC_PossessingProp& AssignPossessingProp(const FECSEntity &inout Entity, const FC_PossessingProp &inout DefaultValue = FC_PossessingProp())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PossessingProp, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPossessingProp_BP(const FECSEntity &inout Entity, const FC_PossessingProp &inout DefaultValue = FC_PossessingProp())
{
    ECSFunc_FC_PossessingProp::AssignPossessingProp(Entity, DefaultValue);
    return;
}
FC_PossessingProp& ModifyPossessingProp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PossessingProp));
    return local_12.GetComp();
}
FC_PossessingProp& ModifyOrAddPossessingProp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PossessingProp));
    return local_12.GetComp();
}
const FC_PossessingProp& GetPossessingProp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PossessingProp));
    return local_12.GetComp();
}
UFUNCTION()
FC_PossessingProp GetPossessingProp_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PossessingProp& local_4 = ECSFunc_FC_PossessingProp::GetPossessingProp(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PossessingProp();
}
const FC_PossessingProp GetDefaultedPossessingProp(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PossessingProp __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PossessingProp);
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
FC_PossessingProp GetDefaultedPossessingProp_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PossessingProp::GetDefaultedPossessingProp(Entity);
}
UFUNCTION()
bool RemovePossessingProp(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PossessingProp);
}
}
FECSMonitorRuntimeView __GetMonitorPossessingPropOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PossessingProp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPossessingPropOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PossessingProp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPossessingPropOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PossessingProp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPossessingPropOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PossessingProp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPossessingPropOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PossessingProp, bFixedFrame, bMustHandleAll);
}
void __MonitorPossessingPropLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PossessingProp, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPossessingPropActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PossessingProp, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPossessingPropModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PossessingProp, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_PossessPropEnabled_bEnabled(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetbEnabled();
    return;
}
void GetEntityBBVar_PropPossessdBy_PossessedByEntity(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetPossessedByEntity());
    return;
}
void GetEntityBBVar_PossessingProp_PropEntity(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetPropEntity());
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PossessPropEnabled &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PossessPropEnabled &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PossessPropEnabled &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PossessPropEnabled
{
int __IndexOf_bEnabled()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PropPossessdBy &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PropPossessdBy &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PropPossessdBy &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PropPossessdBy
{
int __IndexOf_PossessedByEntity()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_PossessingProp &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_PossessingProp &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PossessingProp &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PossessingProp
{
int __IndexOf_PropEntity()
{
    return 0;
}
int __IndexOf_bEnableAttach()
{
    return 1;
}
int __IndexOf_AttachConfig()
{
    return 2;
}
}
