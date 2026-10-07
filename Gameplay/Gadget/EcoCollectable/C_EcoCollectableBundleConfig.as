
namespace EcoCollectable
{
enum ELocationType
{
    RelativeLocationOffset,
    COUNT,
}

}
namespace __INTENRAL_FC_EcoCollectableBundleConfig_NS
{
    const TECSComponentDerivedPtr<FC_EcoCollectableBundleConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EcoCollectableBundleConfig>();
    const FC_EcoCollectableBundleConfig DefaultValue = FC_EcoCollectableBundleConfig();

}
namespace EcoCollectable
{
struct FEcoCollectableSpawnTransform
{
    UPROPERTY()
    EcoCollectable::ELocationType LocationType = EcoCollectable::ELocationType(0);
    UPROPERTY()
    FName MeshLogicName;
    UPROPERTY()
    FVector RelativeLocationOffset;
    UPROPERTY()
    FRotator Rotation;


}

}
struct FC_EcoCollectableBundleConfig : FECSComponent
{
    UPROPERTY()
    TDataObjectPtr<FEcoCollectableCreatureDefinitionRow> CreatureDef;
    UPROPERTY()
    TArray<EcoCollectable::FEcoCollectableSpawnTransform> FruitTransformDefs;

    FC_EcoCollectableBundleConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_EcoCollectableBundleConfig
{
UFUNCTION()
bool HasEcoCollectableBundleConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcoCollectableBundleConfig);
}
FC_EcoCollectableBundleConfig& AssignEcoCollectableBundleConfig(const FECSEntity &inout Entity, const FC_EcoCollectableBundleConfig &inout DefaultValue = FC_EcoCollectableBundleConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcoCollectableBundleConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcoCollectableBundleConfig_BP(const FECSEntity &inout Entity, const FC_EcoCollectableBundleConfig &inout DefaultValue = FC_EcoCollectableBundleConfig())
{
    ECSFunc_FC_EcoCollectableBundleConfig::AssignEcoCollectableBundleConfig(Entity, DefaultValue);
    return;
}
FC_EcoCollectableBundleConfig& ModifyEcoCollectableBundleConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcoCollectableBundleConfig));
    return local_12.GetComp();
}
FC_EcoCollectableBundleConfig& ModifyOrAddEcoCollectableBundleConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcoCollectableBundleConfig));
    return local_12.GetComp();
}
const FC_EcoCollectableBundleConfig& GetEcoCollectableBundleConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcoCollectableBundleConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcoCollectableBundleConfig GetEcoCollectableBundleConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcoCollectableBundleConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EcoCollectableBundleConfig::GetEcoCollectableBundleConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcoCollectableBundleConfig GetDefaultedEcoCollectableBundleConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcoCollectableBundleConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcoCollectableBundleConfig);
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
FC_EcoCollectableBundleConfig GetDefaultedEcoCollectableBundleConfig_BP(const FECSEntity &inout Entity)
{
    FC_EcoCollectableBundleConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEcoCollectableBundleConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcoCollectableBundleConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEcoCollectableBundleConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcoCollectableBundleConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcoCollectableBundleConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcoCollectableBundleConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcoCollectableBundleConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcoCollectableBundleConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcoCollectableBundleConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcoCollectableBundleConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcoCollectableBundleConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcoCollectableBundleConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEcoCollectableBundleConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcoCollectableBundleConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcoCollectableBundleConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcoCollectableBundleConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcoCollectableBundleConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcoCollectableBundleConfig, bFixedFrame, Details);
    return;
}
