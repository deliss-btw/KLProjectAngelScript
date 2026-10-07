
namespace __INTENRAL_FC_CoachWheelControl_NS
{
    const TECSComponentDerivedPtr<FC_CoachWheelControl> DerivedPtr = TECSComponentDerivedPtr<FC_CoachWheelControl>();
    const FC_CoachWheelControl DefaultValue = FC_CoachWheelControl();

}
struct FWheelConfig
{
    UPROPERTY()
    FName WheelCtrlName;
    UPROPERTY()
    FVector LocationOffset;
    UPROPERTY()
    float32 WheelRadius = 70.0f;


}

struct FC_CoachWheelControl : FECSComponent
{
    UPROPERTY()
    FTransform LastTransform;
    UPROPERTY()
    bool bControlRigReady;
    UPROPERTY()
    TArray<FWheelConfig> WheelData;


}

struct FT_CoachWheelControl : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CoachWheelControl_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CoachWheelControl, NAME_None);
    UPROPERTY()
    FC_CoachWheelControl Config_FC_CoachWheelControl;

    FT_CoachWheelControl()
    {
        return;
    }
}

namespace ECSFunc_FC_CoachWheelControl
{
UFUNCTION()
bool HasCoachWheelControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CoachWheelControl);
}
FC_CoachWheelControl& AssignCoachWheelControl(const FECSEntity &inout Entity, const FC_CoachWheelControl &inout DefaultValue = FC_CoachWheelControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CoachWheelControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCoachWheelControl_BP(const FECSEntity &inout Entity, const FC_CoachWheelControl &inout DefaultValue = FC_CoachWheelControl())
{
    ECSFunc_FC_CoachWheelControl::AssignCoachWheelControl(Entity, DefaultValue);
    return;
}
FC_CoachWheelControl& ModifyCoachWheelControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CoachWheelControl));
    return local_12.GetComp();
}
FC_CoachWheelControl& ModifyOrAddCoachWheelControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CoachWheelControl));
    return local_12.GetComp();
}
const FC_CoachWheelControl& GetCoachWheelControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CoachWheelControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_CoachWheelControl GetCoachWheelControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CoachWheelControl __r;
    bValid = false;
    bValid = ECSFunc_FC_CoachWheelControl::GetCoachWheelControl(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CoachWheelControl GetDefaultedCoachWheelControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CoachWheelControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CoachWheelControl);
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
FC_CoachWheelControl GetDefaultedCoachWheelControl_BP(const FECSEntity &inout Entity)
{
    FC_CoachWheelControl __r;
    return __r;
}
UFUNCTION()
bool RemoveCoachWheelControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CoachWheelControl);
}
}
FECSMonitorRuntimeView __GetMonitorCoachWheelControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CoachWheelControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCoachWheelControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CoachWheelControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCoachWheelControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CoachWheelControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCoachWheelControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CoachWheelControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCoachWheelControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CoachWheelControl, bFixedFrame, bMustHandleAll);
}
void __MonitorCoachWheelControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CoachWheelControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCoachWheelControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CoachWheelControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCoachWheelControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CoachWheelControl, bFixedFrame, Details);
    return;
}
