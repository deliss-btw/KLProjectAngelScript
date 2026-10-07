
namespace __INTENRAL_FC_SceneInteractComp_NS
{
    const TECSComponentDerivedPtr<FC_SceneInteractComp> DerivedPtr = TECSComponentDerivedPtr<FC_SceneInteractComp>();
    const FC_SceneInteractComp DefaultValue = FC_SceneInteractComp();
}
namespace __INTENRAL_FC_WeaponDraggingFx_NS
{
    const TECSComponentDerivedPtr<FC_WeaponDraggingFx> DerivedPtr = TECSComponentDerivedPtr<FC_WeaponDraggingFx>();
    const FC_WeaponDraggingFx DefaultValue = FC_WeaponDraggingFx();

}
struct FC_SceneInteractComp : FECSComponent
{
    UPROPERTY()
    FName PhysicalSurfaceName;
    UPROPERTY()
    FName FinalRootName;
    UPROPERTY()
    FECSEntity SocketAttachedEntity;
    UPROPERTY()
    UPrimitiveComponent HitPrimitiveComponent = nullptr;

    FC_SceneInteractComp()
    {
        return;
    }
}

struct FC_WeaponDraggingFx : FECSComponent
{
    UPROPERTY()
    FECSEntity FxEntity;
    UPROPERTY()
    AActor FxActor = nullptr;

    FC_WeaponDraggingFx()
    {
        return;
    }
    bool HasValidFX() const
    {
        return this.IsValid() || ((this.FxActor != nullptr));
    }
    void ClearAllFX()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

namespace ECSFunc_FC_SceneInteractComp
{
UFUNCTION()
bool HasSceneInteractComp(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SceneInteractComp);
}
FC_SceneInteractComp& AssignSceneInteractComp(const FECSEntity &inout Entity, const FC_SceneInteractComp &inout DefaultValue = FC_SceneInteractComp())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SceneInteractComp, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSceneInteractComp_BP(const FECSEntity &inout Entity, const FC_SceneInteractComp &inout DefaultValue = FC_SceneInteractComp())
{
    ECSFunc_FC_SceneInteractComp::AssignSceneInteractComp(Entity, DefaultValue);
    return;
}
FC_SceneInteractComp& ModifySceneInteractComp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SceneInteractComp));
    return local_12.GetComp();
}
FC_SceneInteractComp& ModifyOrAddSceneInteractComp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SceneInteractComp));
    return local_12.GetComp();
}
const FC_SceneInteractComp& GetSceneInteractComp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SceneInteractComp));
    return local_12.GetComp();
}
UFUNCTION()
FC_SceneInteractComp GetSceneInteractComp_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SceneInteractComp __r;
    bValid = false;
    bValid = ECSFunc_FC_SceneInteractComp::GetSceneInteractComp(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SceneInteractComp GetDefaultedSceneInteractComp(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SceneInteractComp __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SceneInteractComp);
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
FC_SceneInteractComp GetDefaultedSceneInteractComp_BP(const FECSEntity &inout Entity)
{
    FC_SceneInteractComp __r;
    return __r;
}
UFUNCTION()
bool RemoveSceneInteractComp(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SceneInteractComp);
}
}
FECSMonitorRuntimeView __GetMonitorSceneInteractCompOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SceneInteractComp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSceneInteractCompOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SceneInteractComp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSceneInteractCompOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SceneInteractComp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSceneInteractCompOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SceneInteractComp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSceneInteractCompOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SceneInteractComp, bFixedFrame, bMustHandleAll);
}
void __MonitorSceneInteractCompLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SceneInteractComp, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSceneInteractCompActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SceneInteractComp, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSceneInteractCompModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SceneInteractComp, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_WeaponDraggingFx
{
UFUNCTION()
bool HasWeaponDraggingFx(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_WeaponDraggingFx);
}
FC_WeaponDraggingFx& AssignWeaponDraggingFx(const FECSEntity &inout Entity, const FC_WeaponDraggingFx &inout DefaultValue = FC_WeaponDraggingFx())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_WeaponDraggingFx, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignWeaponDraggingFx_BP(const FECSEntity &inout Entity, const FC_WeaponDraggingFx &inout DefaultValue = FC_WeaponDraggingFx())
{
    ECSFunc_FC_WeaponDraggingFx::AssignWeaponDraggingFx(Entity, DefaultValue);
    return;
}
FC_WeaponDraggingFx& ModifyWeaponDraggingFx(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_WeaponDraggingFx));
    return local_12.GetComp();
}
FC_WeaponDraggingFx& ModifyOrAddWeaponDraggingFx(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_WeaponDraggingFx));
    return local_12.GetComp();
}
const FC_WeaponDraggingFx& GetWeaponDraggingFx(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_WeaponDraggingFx));
    return local_12.GetComp();
}
UFUNCTION()
FC_WeaponDraggingFx GetWeaponDraggingFx_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_WeaponDraggingFx __r;
    bValid = false;
    bValid = ECSFunc_FC_WeaponDraggingFx::GetWeaponDraggingFx(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_WeaponDraggingFx GetDefaultedWeaponDraggingFx(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_WeaponDraggingFx __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_WeaponDraggingFx);
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
FC_WeaponDraggingFx GetDefaultedWeaponDraggingFx_BP(const FECSEntity &inout Entity)
{
    FC_WeaponDraggingFx __r;
    return __r;
}
UFUNCTION()
bool RemoveWeaponDraggingFx(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_WeaponDraggingFx);
}
}
FECSMonitorRuntimeView __GetMonitorWeaponDraggingFxOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_WeaponDraggingFx, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponDraggingFxOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_WeaponDraggingFx, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponDraggingFxOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_WeaponDraggingFx, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponDraggingFxOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_WeaponDraggingFx, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponDraggingFxOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_WeaponDraggingFx, bFixedFrame, bMustHandleAll);
}
void __MonitorWeaponDraggingFxLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_WeaponDraggingFx, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeaponDraggingFxActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_WeaponDraggingFx, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeaponDraggingFxModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_WeaponDraggingFx, bFixedFrame, Details);
    return;
}
