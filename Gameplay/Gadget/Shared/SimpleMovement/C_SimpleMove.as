
namespace __INTENRAL_FC_SimpleECOMoveComponent_NS
{
    const TECSComponentDerivedPtr<FC_SimpleECOMoveComponent> DerivedPtr = TECSComponentDerivedPtr<FC_SimpleECOMoveComponent>();
    const FC_SimpleECOMoveComponent DefaultValue = FC_SimpleECOMoveComponent();
}
namespace __INTENRAL_FC_SimpleMoveComponent2_NS
{
    const TECSComponentDerivedPtr<FC_SimpleMoveComponent2> DerivedPtr = TECSComponentDerivedPtr<FC_SimpleMoveComponent2>();
    const FC_SimpleMoveComponent2 DefaultValue = FC_SimpleMoveComponent2();

}
struct FC_SimpleECOMoveComponent : FECSComponent
{
    UPROPERTY()
    FString ECOPathName;
    UPROPERTY()
    bool bInited = false;
    UPROPERTY()
    bool bIsMoving = false;
    UPROPERTY()
    bool bFinishMove = false;
    UPROPERTY()
    bool bIsRevering = false;
    UPROPERTY()
    bool bIsInHoldPosition = false;
    UPROPERTY()
    float32 CurrentHoldTimeLeft;
    UPROPERTY()
    FECOHoldPosition CurrentHoldPosition;
    UPROPERTY()
    float32 CurrentDistance = 0.0f;
    UPROPERTY()
    bool bIsPause = false;


}

struct FC_SimpleMoveComponent2 : FECSComponent
{
    UPROPERTY()
    bool bPlaceHolder = false;


}

struct FT_SimpleMoveTrait : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SimpleECOMoveComponent_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SimpleECOMoveComponent, NAME_None);
    UPROPERTY()
    bool bHas_FC_SimpleECOMoveComponent = true;
    UPROPERTY()
    FC_SimpleECOMoveComponent Config_FC_SimpleECOMoveComponent;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SimpleMoveComponent2_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SimpleMoveComponent2, NAME_None);
    UPROPERTY()
    bool bHas_FC_SimpleMoveComponent2 = true;
    UPROPERTY()
    FC_SimpleMoveComponent2 Config_FC_SimpleMoveComponent2;


}

namespace ECSFunc_FC_SimpleECOMoveComponent
{
UFUNCTION()
bool HasSimpleECOMoveComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SimpleECOMoveComponent);
}
FC_SimpleECOMoveComponent& AssignSimpleECOMoveComponent(const FECSEntity &inout Entity, const FC_SimpleECOMoveComponent &inout DefaultValue = FC_SimpleECOMoveComponent())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SimpleECOMoveComponent, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSimpleECOMoveComponent_BP(const FECSEntity &inout Entity, const FC_SimpleECOMoveComponent &inout DefaultValue = FC_SimpleECOMoveComponent())
{
    ECSFunc_FC_SimpleECOMoveComponent::AssignSimpleECOMoveComponent(Entity, DefaultValue);
    return;
}
FC_SimpleECOMoveComponent& ModifySimpleECOMoveComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SimpleECOMoveComponent));
    return local_12.GetComp();
}
FC_SimpleECOMoveComponent& ModifyOrAddSimpleECOMoveComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SimpleECOMoveComponent));
    return local_12.GetComp();
}
const FC_SimpleECOMoveComponent& GetSimpleECOMoveComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SimpleECOMoveComponent));
    return local_12.GetComp();
}
UFUNCTION()
FC_SimpleECOMoveComponent GetSimpleECOMoveComponent_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SimpleECOMoveComponent __r;
    bValid = false;
    bValid = ECSFunc_FC_SimpleECOMoveComponent::GetSimpleECOMoveComponent(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SimpleECOMoveComponent GetDefaultedSimpleECOMoveComponent(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SimpleECOMoveComponent __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SimpleECOMoveComponent);
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
FC_SimpleECOMoveComponent GetDefaultedSimpleECOMoveComponent_BP(const FECSEntity &inout Entity)
{
    FC_SimpleECOMoveComponent __r;
    return __r;
}
UFUNCTION()
bool RemoveSimpleECOMoveComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SimpleECOMoveComponent);
}
}
FECSMonitorRuntimeView __GetMonitorSimpleECOMoveComponentOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SimpleECOMoveComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleECOMoveComponentOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SimpleECOMoveComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleECOMoveComponentOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SimpleECOMoveComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleECOMoveComponentOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SimpleECOMoveComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleECOMoveComponentOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SimpleECOMoveComponent, bFixedFrame, bMustHandleAll);
}
void __MonitorSimpleECOMoveComponentLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SimpleECOMoveComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleECOMoveComponentActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SimpleECOMoveComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleECOMoveComponentModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SimpleECOMoveComponent, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SimpleMoveComponent2
{
UFUNCTION()
bool HasSimpleMoveComponent2(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SimpleMoveComponent2);
}
FC_SimpleMoveComponent2& AssignSimpleMoveComponent2(const FECSEntity &inout Entity, const FC_SimpleMoveComponent2 &inout DefaultValue = FC_SimpleMoveComponent2())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SimpleMoveComponent2, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSimpleMoveComponent2_BP(const FECSEntity &inout Entity, const FC_SimpleMoveComponent2 &inout DefaultValue = FC_SimpleMoveComponent2())
{
    ECSFunc_FC_SimpleMoveComponent2::AssignSimpleMoveComponent2(Entity, DefaultValue);
    return;
}
FC_SimpleMoveComponent2& ModifySimpleMoveComponent2(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SimpleMoveComponent2));
    return local_12.GetComp();
}
FC_SimpleMoveComponent2& ModifyOrAddSimpleMoveComponent2(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SimpleMoveComponent2));
    return local_12.GetComp();
}
const FC_SimpleMoveComponent2& GetSimpleMoveComponent2(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SimpleMoveComponent2));
    return local_12.GetComp();
}
UFUNCTION()
FC_SimpleMoveComponent2 GetSimpleMoveComponent2_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SimpleMoveComponent2& local_4 = ECSFunc_FC_SimpleMoveComponent2::GetSimpleMoveComponent2(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SimpleMoveComponent2();
}
const FC_SimpleMoveComponent2 GetDefaultedSimpleMoveComponent2(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SimpleMoveComponent2 __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SimpleMoveComponent2);
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
FC_SimpleMoveComponent2 GetDefaultedSimpleMoveComponent2_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SimpleMoveComponent2::GetDefaultedSimpleMoveComponent2(Entity);
}
UFUNCTION()
bool RemoveSimpleMoveComponent2(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SimpleMoveComponent2);
}
}
FECSMonitorRuntimeView __GetMonitorSimpleMoveComponent2OnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SimpleMoveComponent2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleMoveComponent2OnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SimpleMoveComponent2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleMoveComponent2OnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SimpleMoveComponent2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleMoveComponent2OnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SimpleMoveComponent2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleMoveComponent2OnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SimpleMoveComponent2, bFixedFrame, bMustHandleAll);
}
void __MonitorSimpleMoveComponent2Lifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SimpleMoveComponent2, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleMoveComponent2Activity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SimpleMoveComponent2, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleMoveComponent2Modification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SimpleMoveComponent2, bFixedFrame, Details);
    return;
}
