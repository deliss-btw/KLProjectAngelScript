
namespace __INTENRAL_FC_MpmClothControl_NS
{
    const TECSComponentDerivedPtr<FC_MpmClothControl> DerivedPtr = TECSComponentDerivedPtr<FC_MpmClothControl>();
    const FC_MpmClothControl DefaultValue = FC_MpmClothControl();

}
struct FC_MpmClothControl : FECSComponent
{
    UPROPERTY()
    float32 VelocityBlendingRatio = 0.0f;
    UPROPERTY()
    float32 MaxDistanceRatio = 1.0f;
    UPROPERTY()
    float32 AnimDriveScale = 1.0f;
    UPROPERTY()
    float32 TargetVelocityBlendingWeight = 0.0f;
    UPROPERTY()
    float32 TargetMaxDistanceWeight = 1.0f;
    UPROPERTY()
    float32 TargetAnimDriveWeight = 1.0f;
    UPROPERTY()
    float32 LerpTimeInSeconds = 1.0f;
    UPROPERTY()
    float32 TartgetLerpTimeInSeconds = 1.0f;
    UPROPERTY()
    float32 LerpSpeed = 0.15f;


}

struct FT_MpmClothControl : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MpmClothControl_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MpmClothControl, NAME_None);
    UPROPERTY()
    FC_MpmClothControl Config_FC_MpmClothControl;

    FT_MpmClothControl()
    {
        return;
    }
}

namespace ECSFunc_FC_MpmClothControl
{
UFUNCTION()
bool HasMpmClothControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MpmClothControl);
}
FC_MpmClothControl& AssignMpmClothControl(const FECSEntity &inout Entity, const FC_MpmClothControl &inout DefaultValue = FC_MpmClothControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MpmClothControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMpmClothControl_BP(const FECSEntity &inout Entity, const FC_MpmClothControl &inout DefaultValue = FC_MpmClothControl())
{
    ECSFunc_FC_MpmClothControl::AssignMpmClothControl(Entity, DefaultValue);
    return;
}
FC_MpmClothControl& ModifyMpmClothControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MpmClothControl));
    return local_12.GetComp();
}
FC_MpmClothControl& ModifyOrAddMpmClothControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MpmClothControl));
    return local_12.GetComp();
}
const FC_MpmClothControl& GetMpmClothControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MpmClothControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_MpmClothControl GetMpmClothControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MpmClothControl& local_4 = ECSFunc_FC_MpmClothControl::GetMpmClothControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MpmClothControl();
}
const FC_MpmClothControl GetDefaultedMpmClothControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MpmClothControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MpmClothControl);
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
FC_MpmClothControl GetDefaultedMpmClothControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MpmClothControl::GetDefaultedMpmClothControl(Entity);
}
UFUNCTION()
bool RemoveMpmClothControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MpmClothControl);
}
}
FECSMonitorRuntimeView __GetMonitorMpmClothControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MpmClothControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMpmClothControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MpmClothControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMpmClothControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MpmClothControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMpmClothControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MpmClothControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMpmClothControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MpmClothControl, bFixedFrame, bMustHandleAll);
}
void __MonitorMpmClothControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MpmClothControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMpmClothControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MpmClothControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMpmClothControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MpmClothControl, bFixedFrame, Details);
    return;
}
