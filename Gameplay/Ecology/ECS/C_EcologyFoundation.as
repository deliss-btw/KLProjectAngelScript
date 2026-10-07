
namespace __INTENRAL_FC_EcologyConfigReference_NS
{
    const TECSComponentDerivedPtr<FC_EcologyConfigReference> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyConfigReference>();
    const FC_EcologyConfigReference DefaultValue = FC_EcologyConfigReference();
}
namespace __INTENRAL_FC_EcologyVoxelUnit_NS
{
    const TECSComponentDerivedPtr<FC_EcologyVoxelUnit> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyVoxelUnit>();
    const FC_EcologyVoxelUnit DefaultValue = FC_EcologyVoxelUnit();
}
namespace __INTENRAL_FC_OwnerRegion_NS
{
    const TECSComponentDerivedPtr<FC_OwnerRegion> DerivedPtr = TECSComponentDerivedPtr<FC_OwnerRegion>();
    const FC_OwnerRegion DefaultValue = FC_OwnerRegion();

}
struct FC_EcologyConfigReference : FECSComponent
{
    UPROPERTY()
    FECSEntityId ConfigRef;
    UPROPERTY()
    UScriptStruct ConfigType = nullptr;

    FC_EcologyConfigReference()
    {
        return;
    }
    TConstRawPtr<FVirtualConfigData> ReadSpawnerConfig() const
    {
        TConstRawPtr<FVirtualConfigData> local_12;
        int local_24 = 0;
        int local_34 = 0;
        if (!(FECSEntity(this)))
        {
            return local_12;
        }
        Has local_18;
        bool local_9 = local_18.opCall();
        if (local_9)
        {
            return TConstRawPtr<FVirtualConfigData>(local_24.SpawnerConfig);
        }
        Has local_28;
        bool local_9_2 = local_28.opCall();
        if (local_9_2)
        {
            const FLevelConfigInstance& local_36 = local_34.GetLevelUnitConfigInstance();
            if (FInstancedStruct::GetPtr(local_36.GetConfigData()).opCall())
            {
                return TConstRawPtr<FVirtualConfigData>();
            }
        }
        return local_12;
    }
}

struct FC_EcologyVoxelUnit : FECSComponent
{
    UPROPERTY()
    EEcologyVoxelUnitSlot Slot;
    UPROPERTY()
    FVector AABBExtent;
    UPROPERTY()
    FBox LastScope;
    UPROPERTY()
    int SceneSpaceCost = 1;


}

struct FC_OwnerRegion : FECSComponent
{
    UPROPERTY()
    FVolumeProxy OwnerVolumeProxy;

    FC_OwnerRegion()
    {
        return;
    }
}

namespace ECSFunc_FC_EcologyConfigReference
{
UFUNCTION()
bool HasEcologyConfigReference(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyConfigReference);
}
FC_EcologyConfigReference& AssignEcologyConfigReference(const FECSEntity &inout Entity, const FC_EcologyConfigReference &inout DefaultValue = FC_EcologyConfigReference())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyConfigReference, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyConfigReference_BP(const FECSEntity &inout Entity, const FC_EcologyConfigReference &inout DefaultValue = FC_EcologyConfigReference())
{
    ECSFunc_FC_EcologyConfigReference::AssignEcologyConfigReference(Entity, DefaultValue);
    return;
}
FC_EcologyConfigReference& ModifyEcologyConfigReference(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyConfigReference));
    return local_12.GetComp();
}
FC_EcologyConfigReference& ModifyOrAddEcologyConfigReference(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyConfigReference));
    return local_12.GetComp();
}
const FC_EcologyConfigReference& GetEcologyConfigReference(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyConfigReference));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyConfigReference GetEcologyConfigReference_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyConfigReference __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyConfigReference::GetEcologyConfigReference(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyConfigReference GetDefaultedEcologyConfigReference(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyConfigReference __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyConfigReference);
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
FC_EcologyConfigReference GetDefaultedEcologyConfigReference_BP(const FECSEntity &inout Entity)
{
    FC_EcologyConfigReference __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyConfigReference(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyConfigReference);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyConfigReferenceOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyConfigReference, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyConfigReferenceOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyConfigReference, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyConfigReferenceOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyConfigReference, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyConfigReferenceOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyConfigReference, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyConfigReferenceOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyConfigReference, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyConfigReferenceLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyConfigReference, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyConfigReferenceActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyConfigReference, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyConfigReferenceModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyConfigReference, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyVoxelUnit
{
UFUNCTION()
bool HasEcologyVoxelUnit(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyVoxelUnit);
}
FC_EcologyVoxelUnit& AssignEcologyVoxelUnit(const FECSEntity &inout Entity, const FC_EcologyVoxelUnit &inout DefaultValue = FC_EcologyVoxelUnit())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyVoxelUnit, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyVoxelUnit_BP(const FECSEntity &inout Entity, const FC_EcologyVoxelUnit &inout DefaultValue = FC_EcologyVoxelUnit())
{
    ECSFunc_FC_EcologyVoxelUnit::AssignEcologyVoxelUnit(Entity, DefaultValue);
    return;
}
FC_EcologyVoxelUnit& ModifyEcologyVoxelUnit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyVoxelUnit));
    return local_12.GetComp();
}
FC_EcologyVoxelUnit& ModifyOrAddEcologyVoxelUnit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyVoxelUnit));
    return local_12.GetComp();
}
const FC_EcologyVoxelUnit& GetEcologyVoxelUnit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyVoxelUnit));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyVoxelUnit GetEcologyVoxelUnit_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcologyVoxelUnit& local_4 = ECSFunc_FC_EcologyVoxelUnit::GetEcologyVoxelUnit(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcologyVoxelUnit();
}
const FC_EcologyVoxelUnit GetDefaultedEcologyVoxelUnit(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyVoxelUnit __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyVoxelUnit);
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
FC_EcologyVoxelUnit GetDefaultedEcologyVoxelUnit_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcologyVoxelUnit::GetDefaultedEcologyVoxelUnit(Entity);
}
UFUNCTION()
bool RemoveEcologyVoxelUnit(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyVoxelUnit);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyVoxelUnitOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyVoxelUnit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyVoxelUnitOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyVoxelUnit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyVoxelUnitOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyVoxelUnit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyVoxelUnitOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyVoxelUnit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyVoxelUnitOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyVoxelUnit, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyVoxelUnitLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyVoxelUnit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyVoxelUnitActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyVoxelUnit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyVoxelUnitModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyVoxelUnit, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_OwnerRegion
{
UFUNCTION()
bool HasOwnerRegion(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_OwnerRegion);
}
FC_OwnerRegion& AssignOwnerRegion(const FECSEntity &inout Entity, const FC_OwnerRegion &inout DefaultValue = FC_OwnerRegion())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_OwnerRegion, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignOwnerRegion_BP(const FECSEntity &inout Entity, const FC_OwnerRegion &inout DefaultValue = FC_OwnerRegion())
{
    ECSFunc_FC_OwnerRegion::AssignOwnerRegion(Entity, DefaultValue);
    return;
}
FC_OwnerRegion& ModifyOwnerRegion(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_OwnerRegion));
    return local_12.GetComp();
}
FC_OwnerRegion& ModifyOrAddOwnerRegion(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_OwnerRegion));
    return local_12.GetComp();
}
const FC_OwnerRegion& GetOwnerRegion(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_OwnerRegion));
    return local_12.GetComp();
}
UFUNCTION()
FC_OwnerRegion GetOwnerRegion_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_OwnerRegion __r;
    bValid = false;
    bValid = ECSFunc_FC_OwnerRegion::GetOwnerRegion(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_OwnerRegion GetDefaultedOwnerRegion(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_OwnerRegion __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_OwnerRegion);
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
FC_OwnerRegion GetDefaultedOwnerRegion_BP(const FECSEntity &inout Entity)
{
    FC_OwnerRegion __r;
    return __r;
}
UFUNCTION()
bool RemoveOwnerRegion(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_OwnerRegion);
}
}
FECSMonitorRuntimeView __GetMonitorOwnerRegionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_OwnerRegion, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOwnerRegionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_OwnerRegion, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOwnerRegionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_OwnerRegion, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOwnerRegionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_OwnerRegion, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOwnerRegionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_OwnerRegion, bFixedFrame, bMustHandleAll);
}
void __MonitorOwnerRegionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_OwnerRegion, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOwnerRegionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_OwnerRegion, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOwnerRegionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_OwnerRegion, bFixedFrame, Details);
    return;
}
