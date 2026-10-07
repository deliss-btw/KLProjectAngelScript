
namespace __INTENRAL_FC_EcologyDOTSensor_NS
{
    const TECSComponentDerivedPtr<FC_EcologyDOTSensor> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyDOTSensor>();
    const FC_EcologyDOTSensor DefaultValue = FC_EcologyDOTSensor();
}
namespace __INTENRAL_FCE_DOTSensorStateChange_NS
{
    const TECSEventDerivedPtr<FCE_DOTSensorStateChange> DerivedPtr = TECSEventDerivedPtr<FCE_DOTSensorStateChange>();

}
struct FEcologyDOTSensorConfig
{
    UPROPERTY()
    FKLGameplayTagQuery DOTConditionQuery;

    FEcologyDOTSensorConfig()
    {
        return;
    }
}

struct FEcologyDOTSensorUnit
{
    UPROPERTY()
    FName SensorName;
    UPROPERTY()
    FEcologyDOTCondition Condition;
    UPROPERTY()
    bool bIsEnter = false;


}

struct FC_EcologyDOTSensor : FECSComponent
{
    UPROPERTY()
    TMap<FName, FEcologyDOTSensorUnit> DOTSensorMap;

    FC_EcologyDOTSensor()
    {
        return;
    }
}

struct FCE_DOTSensorStateChange : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TMap<FName, bool> ChangedState;

    FCE_DOTSensorStateChange()
    {
        return;
    }
    bool IsTargetStateChanged(const FName &inout Name)
    {
        return this.ChangedState.Contains(Name);
    }
    bool GetNewState(const FName &inout Name)
    {
        if (this.ChangedState.Contains(Name))
        {
            int local_1 = this.ChangedState[Name];
            return (local_1 != 0);
        }
        return false;
    }
}

namespace ECSFunc_FC_EcologyDOTSensor
{
UFUNCTION()
bool HasEcologyDOTSensor(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyDOTSensor);
}
FC_EcologyDOTSensor& AssignEcologyDOTSensor(const FECSEntity &inout Entity, const FC_EcologyDOTSensor &inout DefaultValue = FC_EcologyDOTSensor())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyDOTSensor, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyDOTSensor_BP(const FECSEntity &inout Entity, const FC_EcologyDOTSensor &inout DefaultValue = FC_EcologyDOTSensor())
{
    ECSFunc_FC_EcologyDOTSensor::AssignEcologyDOTSensor(Entity, DefaultValue);
    return;
}
FC_EcologyDOTSensor& ModifyEcologyDOTSensor(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyDOTSensor));
    return local_12.GetComp();
}
FC_EcologyDOTSensor& ModifyOrAddEcologyDOTSensor(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyDOTSensor));
    return local_12.GetComp();
}
const FC_EcologyDOTSensor& GetEcologyDOTSensor(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyDOTSensor));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyDOTSensor GetEcologyDOTSensor_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyDOTSensor __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyDOTSensor::GetEcologyDOTSensor(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyDOTSensor GetDefaultedEcologyDOTSensor(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyDOTSensor __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyDOTSensor);
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
FC_EcologyDOTSensor GetDefaultedEcologyDOTSensor_BP(const FECSEntity &inout Entity)
{
    FC_EcologyDOTSensor __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyDOTSensor(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyDOTSensor);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyDOTSensorOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyDOTSensor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyDOTSensorOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyDOTSensor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyDOTSensorOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyDOTSensor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyDOTSensorOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyDOTSensor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyDOTSensorOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyDOTSensor, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyDOTSensorLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyDOTSensor, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyDOTSensorActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyDOTSensor, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyDOTSensorModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyDOTSensor, bFixedFrame, Details);
    return;
}
