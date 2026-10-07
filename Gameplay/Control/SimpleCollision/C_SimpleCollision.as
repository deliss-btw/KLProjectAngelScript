
namespace __INTENRAL_FC_SimpleCollisionConfig_NS
{
    const TECSComponentDerivedPtr<FC_SimpleCollisionConfig> DerivedPtr = TECSComponentDerivedPtr<FC_SimpleCollisionConfig>();
    const FC_SimpleCollisionConfig DefaultValue = FC_SimpleCollisionConfig();
}
namespace __INTENRAL_FC_SimpleCollision_NS
{
    const TECSComponentDerivedPtr<FC_SimpleCollision> DerivedPtr = TECSComponentDerivedPtr<FC_SimpleCollision>();
    const FC_SimpleCollision DefaultValue = FC_SimpleCollision();

}
struct FC_SimpleCollisionConfig : FECSComponent
{
    UPROPERTY()
    FCollisionShapeInfo Shape;
    UPROPERTY()
    FVector3f PosOffset = FVector3f::ZeroVector;
    UPROPERTY()
    FRotator3f RotOffset = FRotator3f::ZeroRotator;
    UPROPERTY()
    ECollisionChannel Channel = ECollisionChannel(19);
    UPROPERTY()
    float32 SlideRatio = 0.8f;
    UPROPERTY()
    bool bApplyExtraCollisionAsChainChild = false;


}

struct FC_SimpleCollision : FECSComponent
{
    UPROPERTY()
    FSceneQueryCache SweepCache;
    UPROPERTY()
    FVector3f ConstrainedDeltaMovement = FVector3f::ZeroVector;

    FC_SimpleCollision()
    {
        return;
    }
}

namespace ECSFunc_FC_SimpleCollisionConfig
{
UFUNCTION()
bool HasSimpleCollisionConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SimpleCollisionConfig);
}
FC_SimpleCollisionConfig& AssignSimpleCollisionConfig(const FECSEntity &inout Entity, const FC_SimpleCollisionConfig &inout DefaultValue = FC_SimpleCollisionConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SimpleCollisionConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSimpleCollisionConfig_BP(const FECSEntity &inout Entity, const FC_SimpleCollisionConfig &inout DefaultValue = FC_SimpleCollisionConfig())
{
    ECSFunc_FC_SimpleCollisionConfig::AssignSimpleCollisionConfig(Entity, DefaultValue);
    return;
}
FC_SimpleCollisionConfig& ModifySimpleCollisionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SimpleCollisionConfig));
    return local_12.GetComp();
}
FC_SimpleCollisionConfig& ModifyOrAddSimpleCollisionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SimpleCollisionConfig));
    return local_12.GetComp();
}
const FC_SimpleCollisionConfig& GetSimpleCollisionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SimpleCollisionConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_SimpleCollisionConfig GetSimpleCollisionConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SimpleCollisionConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_SimpleCollisionConfig::GetSimpleCollisionConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SimpleCollisionConfig GetDefaultedSimpleCollisionConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SimpleCollisionConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SimpleCollisionConfig);
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
FC_SimpleCollisionConfig GetDefaultedSimpleCollisionConfig_BP(const FECSEntity &inout Entity)
{
    FC_SimpleCollisionConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveSimpleCollisionConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SimpleCollisionConfig);
}
}
FECSMonitorRuntimeView __GetMonitorSimpleCollisionConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SimpleCollisionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleCollisionConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SimpleCollisionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleCollisionConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SimpleCollisionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleCollisionConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SimpleCollisionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleCollisionConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SimpleCollisionConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorSimpleCollisionConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SimpleCollisionConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleCollisionConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SimpleCollisionConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleCollisionConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SimpleCollisionConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SimpleCollision
{
UFUNCTION()
bool HasSimpleCollision(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SimpleCollision);
}
FC_SimpleCollision& AssignSimpleCollision(const FECSEntity &inout Entity, const FC_SimpleCollision &inout DefaultValue = FC_SimpleCollision())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SimpleCollision, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSimpleCollision_BP(const FECSEntity &inout Entity, const FC_SimpleCollision &inout DefaultValue = FC_SimpleCollision())
{
    ECSFunc_FC_SimpleCollision::AssignSimpleCollision(Entity, DefaultValue);
    return;
}
FC_SimpleCollision& ModifySimpleCollision(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SimpleCollision));
    return local_12.GetComp();
}
FC_SimpleCollision& ModifyOrAddSimpleCollision(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SimpleCollision));
    return local_12.GetComp();
}
const FC_SimpleCollision& GetSimpleCollision(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SimpleCollision));
    return local_12.GetComp();
}
UFUNCTION()
FC_SimpleCollision GetSimpleCollision_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SimpleCollision __r;
    bValid = false;
    bValid = ECSFunc_FC_SimpleCollision::GetSimpleCollision(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SimpleCollision GetDefaultedSimpleCollision(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SimpleCollision __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SimpleCollision);
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
FC_SimpleCollision GetDefaultedSimpleCollision_BP(const FECSEntity &inout Entity)
{
    FC_SimpleCollision __r;
    return __r;
}
UFUNCTION()
bool RemoveSimpleCollision(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SimpleCollision);
}
}
FECSMonitorRuntimeView __GetMonitorSimpleCollisionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SimpleCollision, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleCollisionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SimpleCollision, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleCollisionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SimpleCollision, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleCollisionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SimpleCollision, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleCollisionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SimpleCollision, bFixedFrame, bMustHandleAll);
}
void __MonitorSimpleCollisionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SimpleCollision, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleCollisionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SimpleCollision, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleCollisionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SimpleCollision, bFixedFrame, Details);
    return;
}
