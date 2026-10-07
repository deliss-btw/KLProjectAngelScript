
enum EEcologyUnitType
{
    Unknow,
    Resource,
    Modifier,
    Spawner,
    Point,
}

namespace __INTENRAL_FC_EcologyResourceConfig_NS
{
    const TECSComponentDerivedPtr<FC_EcologyResourceConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyResourceConfig>();
    const FC_EcologyResourceConfig DefaultValue = FC_EcologyResourceConfig();
}
namespace __INTENRAL_FC_EcologyEntityRouter_NS
{
    const TECSComponentDerivedPtr<FC_EcologyEntityRouter> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyEntityRouter>();
    const FC_EcologyEntityRouter DefaultValue = FC_EcologyEntityRouter();
}
namespace __INTENRAL_FC_EcologyTestConfig_NS
{
    const TECSComponentDerivedPtr<FC_EcologyTestConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyTestConfig>();
    const FC_EcologyTestConfig DefaultValue = FC_EcologyTestConfig();
}
namespace __INTENRAL_FC_EcologyResourceModifierConfig_NS
{
    const TECSComponentDerivedPtr<FC_EcologyResourceModifierConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyResourceModifierConfig>();
    const FC_EcologyResourceModifierConfig DefaultValue = FC_EcologyResourceModifierConfig();

// NOTE: class defaults are not authored in this module: FCommonEcologyUnitConfig (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

}
struct FC_EcologyResourceConfig : FECSComponent
{
    UPROPERTY()
    FVirtualConfigData ResourceConfig;

    FC_EcologyResourceConfig()
    {
        return;
    }
}

struct FC_EcologyEntityRouter : FECSComponent
{
    UPROPERTY()
    FECSEntityId OuterEntityId;
    UPROPERTY()
    TArray<FECSEntityId> TargetEntityId;

    FC_EcologyEntityRouter()
    {
        return;
    }
}

struct FC_EcologyTestConfig : FECSComponent
{
    UPROPERTY()
    TArray<FVirtualConfigData> ConfigList;

    FC_EcologyTestConfig()
    {
        return;
    }
}

struct FC_EcologyResourceModifierConfig : FECSComponent
{
    UPROPERTY()
    FEcologyResourceModifierConfig Modifier;
    UPROPERTY()
    TSoftObjectPtr<AECSRegionVolume> Scope;

    FC_EcologyResourceModifierConfig()
    {
        return;
    }
}

struct FEcologyUnitConfig : FSceneUnitConfig
{
    FSceneUnitConfig _base_FSceneUnitConfig;
    UPROPERTY()
    EEcologyUnitType Type;


    void SetupByActor(const AEcologyUnitECSPrefab Actor)
    {
        return;
    }
}

struct FCommonEcologyUnitConfig : FEcologyUnitConfig
{
    FEcologyUnitConfig _base_FEcologyUnitConfig;
    UPROPERTY()
    FVirtualConfigData ConfigData;

    FCommonEcologyUnitConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
    bool Activate_Implementation(const FLevelUnitExecuteContext &inout Context)
    {
        UScriptStruct local_6;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return true;
        }
        if (!(this.ConfigData.GetConfigType().IsChildOf(local_6)))
        {
            return false;
        }
        FEcologyConfigGenerateContext local_40;
        local_40.SetupByLevelUnitExecuteContext(Context);
        local_40.SetDefaultedTransform(this.Transform.GetLocation(), this.Transform.Rotator());
        local_40.bOuterIsConfig = true;
        TConstRawPtr<FEcologyConfig> local_58 = FInstancedStruct::GetPtr(this.ConfigData.GetConfigData()).opCall();
        FECSEntity local_64;
        local_64.GenerateRuntimeEntity(local_40);
        if (local_64.IsValid())
        {
            Has local_72;
            if (!(local_72.opCall()))
            {
                Assign local_76;
                local_76.opCall(FC_LevelUnitReadyTag());
            }
            if (this.bInitialInactive)
            {
                local_64.SetActive(false, FFPTime(-1));
            }
            Context.RegisterChildEntity(local_64);
            return true;
        }
        return false;
    }
    void Deactivate_Implementation(const FLevelUnitExecuteContext &inout Context)
    {
        int local_8 = 0;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        if (!(local_8))
        {
            return;
        }
        FECSEntity local_12 = FECSEntity(local_8.ChildEntity);
        if (local_12.IsValid())
        {
            ::FEcologyLifeCycleUtils::MarkEntityWaitDestroy(local_12);
        }
        return;
    }
}

namespace ECSFunc_FC_EcologyResourceConfig
{
UFUNCTION()
bool HasEcologyResourceConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceConfig);
}
FC_EcologyResourceConfig& AssignEcologyResourceConfig(const FECSEntity &inout Entity, const FC_EcologyResourceConfig &inout DefaultValue = FC_EcologyResourceConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyResourceConfig_BP(const FECSEntity &inout Entity, const FC_EcologyResourceConfig &inout DefaultValue = FC_EcologyResourceConfig())
{
    ECSFunc_FC_EcologyResourceConfig::AssignEcologyResourceConfig(Entity, DefaultValue);
    return;
}
FC_EcologyResourceConfig& ModifyEcologyResourceConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceConfig));
    return local_12.GetComp();
}
FC_EcologyResourceConfig& ModifyOrAddEcologyResourceConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceConfig));
    return local_12.GetComp();
}
const FC_EcologyResourceConfig& GetEcologyResourceConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyResourceConfig GetEcologyResourceConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyResourceConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyResourceConfig::GetEcologyResourceConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyResourceConfig GetDefaultedEcologyResourceConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyResourceConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceConfig);
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
FC_EcologyResourceConfig GetDefaultedEcologyResourceConfig_BP(const FECSEntity &inout Entity)
{
    FC_EcologyResourceConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyResourceConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyResourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyResourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyResourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyResourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyResourceConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyResourceConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyResourceConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyResourceConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyResourceConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyResourceConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyResourceConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyEntityRouter
{
UFUNCTION()
bool HasEcologyEntityRouter(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyEntityRouter);
}
FC_EcologyEntityRouter& AssignEcologyEntityRouter(const FECSEntity &inout Entity, const FC_EcologyEntityRouter &inout DefaultValue = FC_EcologyEntityRouter())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyEntityRouter, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyEntityRouter_BP(const FECSEntity &inout Entity, const FC_EcologyEntityRouter &inout DefaultValue = FC_EcologyEntityRouter())
{
    ECSFunc_FC_EcologyEntityRouter::AssignEcologyEntityRouter(Entity, DefaultValue);
    return;
}
FC_EcologyEntityRouter& ModifyEcologyEntityRouter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyEntityRouter));
    return local_12.GetComp();
}
FC_EcologyEntityRouter& ModifyOrAddEcologyEntityRouter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyEntityRouter));
    return local_12.GetComp();
}
const FC_EcologyEntityRouter& GetEcologyEntityRouter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyEntityRouter));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyEntityRouter GetEcologyEntityRouter_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyEntityRouter __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyEntityRouter::GetEcologyEntityRouter(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyEntityRouter GetDefaultedEcologyEntityRouter(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyEntityRouter __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyEntityRouter);
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
FC_EcologyEntityRouter GetDefaultedEcologyEntityRouter_BP(const FECSEntity &inout Entity)
{
    FC_EcologyEntityRouter __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyEntityRouter(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyEntityRouter);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyEntityRouterOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyEntityRouter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyEntityRouterOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyEntityRouter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyEntityRouterOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyEntityRouter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyEntityRouterOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyEntityRouter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyEntityRouterOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyEntityRouter, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyEntityRouterLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyEntityRouter, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyEntityRouterActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyEntityRouter, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyEntityRouterModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyEntityRouter, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyTestConfig
{
UFUNCTION()
bool HasEcologyTestConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyTestConfig);
}
FC_EcologyTestConfig& AssignEcologyTestConfig(const FECSEntity &inout Entity, const FC_EcologyTestConfig &inout DefaultValue = FC_EcologyTestConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyTestConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyTestConfig_BP(const FECSEntity &inout Entity, const FC_EcologyTestConfig &inout DefaultValue = FC_EcologyTestConfig())
{
    ECSFunc_FC_EcologyTestConfig::AssignEcologyTestConfig(Entity, DefaultValue);
    return;
}
FC_EcologyTestConfig& ModifyEcologyTestConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyTestConfig));
    return local_12.GetComp();
}
FC_EcologyTestConfig& ModifyOrAddEcologyTestConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyTestConfig));
    return local_12.GetComp();
}
const FC_EcologyTestConfig& GetEcologyTestConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyTestConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyTestConfig GetEcologyTestConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyTestConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyTestConfig::GetEcologyTestConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyTestConfig GetDefaultedEcologyTestConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyTestConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyTestConfig);
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
FC_EcologyTestConfig GetDefaultedEcologyTestConfig_BP(const FECSEntity &inout Entity)
{
    FC_EcologyTestConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyTestConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyTestConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyTestConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyTestConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyTestConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyTestConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyTestConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyTestConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyTestConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyTestConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyTestConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyTestConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyTestConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyTestConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyTestConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyTestConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyTestConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyTestConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyResourceModifierConfig
{
UFUNCTION()
bool HasEcologyResourceModifierConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceModifierConfig);
}
FC_EcologyResourceModifierConfig& AssignEcologyResourceModifierConfig(const FECSEntity &inout Entity, const FC_EcologyResourceModifierConfig &inout DefaultValue = FC_EcologyResourceModifierConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceModifierConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyResourceModifierConfig_BP(const FECSEntity &inout Entity, const FC_EcologyResourceModifierConfig &inout DefaultValue = FC_EcologyResourceModifierConfig())
{
    ECSFunc_FC_EcologyResourceModifierConfig::AssignEcologyResourceModifierConfig(Entity, DefaultValue);
    return;
}
FC_EcologyResourceModifierConfig& ModifyEcologyResourceModifierConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceModifierConfig));
    return local_12.GetComp();
}
FC_EcologyResourceModifierConfig& ModifyOrAddEcologyResourceModifierConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceModifierConfig));
    return local_12.GetComp();
}
const FC_EcologyResourceModifierConfig& GetEcologyResourceModifierConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceModifierConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyResourceModifierConfig GetEcologyResourceModifierConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyResourceModifierConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyResourceModifierConfig::GetEcologyResourceModifierConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyResourceModifierConfig GetDefaultedEcologyResourceModifierConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyResourceModifierConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceModifierConfig);
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
FC_EcologyResourceModifierConfig GetDefaultedEcologyResourceModifierConfig_BP(const FECSEntity &inout Entity)
{
    FC_EcologyResourceModifierConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyResourceModifierConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceModifierConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceModifierConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyResourceModifierConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceModifierConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyResourceModifierConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceModifierConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyResourceModifierConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceModifierConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyResourceModifierConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceModifierConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyResourceModifierConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyResourceModifierConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyResourceModifierConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyResourceModifierConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyResourceModifierConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyResourceModifierConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyResourceModifierConfig, bFixedFrame, Details);
    return;
}
