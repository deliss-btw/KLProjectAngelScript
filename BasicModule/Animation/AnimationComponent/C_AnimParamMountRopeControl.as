
namespace __INTENRAL_FC_AnimParamMountRopeControl_NS
{
    const TECSComponentDerivedPtr<FC_AnimParamMountRopeControl> DerivedPtr = TECSComponentDerivedPtr<FC_AnimParamMountRopeControl>();
    const FC_AnimParamMountRopeControl DefaultValue = FC_AnimParamMountRopeControl();

}
struct FC_AnimParamMountRopeControl : FECSComponent
{
    UPROPERTY()
    float32 Alpha = 0.0f;
    UPROPERTY()
    FVector C_LHandLocation = FVector(39.730701, -7.762312, 186.694946);
    UPROPERTY()
    FVector C_RHandLocation = FVector(39.730679, 7.760413, 186.694733);
    UPROPERTY()
    FVector C_LFootLocation = FVector(22.111237, -34.3241, 111.259811);
    UPROPERTY()
    FVector C_RFootLocation = FVector(22.109528, 34.321583, 111.25943);
    UPROPERTY()
    FQuat C_LFootRotation = FQuat(0.0, 0.0, 0.0, 1.0);
    UPROPERTY()
    FQuat C_RFootRotation = FQuat(0.0, 0.0, 0.0, 1.0);
    UPROPERTY()
    bool bIsEnabled = true;


}

class UESMAction_MountRopeConfig : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FRuntimeFloatCurve Weight = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 1.0f);

    UESMAction_MountRopeConfig()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Get local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        if (!(local_4.opCall().IsDriver()))
        {
            return;
        }
        if (local_4.opCall().GetMountEntity())
        {
            ModifyOrAdd local_12;
            FC_AnimParamMountRopeControl& local_14 = local_12.opCall();
            if (local_14)
            {
                local_14.Alpha = 1.0f;
                local_14.bIsEnabled = true;
            }
        }
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Get local_4;
        float32 local_21;
        if (!(local_4.opCall()))
        {
            return;
        }
        if (!(local_4.opCall().IsDriver()))
        {
            return;
        }
        if (local_4.opCall().GetMountEntity())
        {
            FC_AnimParamMountRopeControl local_14;
            float local_18 = Time.ActionDuration.ToSeconds();
            float32 local_19 = float32(local_18);
            if (local_19 > 0.0f)
            {
                float local_18_2 = Time.ActionLastTime.ToSeconds();
                local_21 = float32(local_18_2) / local_19;
            }
            else
            {
                local_21 = 1.0f;
            }
            local_14.Alpha = this.Weight.GetFloatValue(local_21, 0.0f);
            local_14.bIsEnabled = true;
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Get local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        if (!(local_4.opCall().IsDriver()))
        {
            return;
        }
        if (local_4.opCall().GetMountEntity())
        {
            ModifyOrAdd local_12;
            FC_AnimParamMountRopeControl& local_14 = local_12.opCall();
            if (local_14)
            {
                local_14.Alpha = 0.0f;
                local_14.bIsEnabled = false;
            }
        }
        return;
    }
}

namespace FC_AnimParamMountRopeControl
{
FC_AnimParamMountRopeControl Interpolate(const FC_AnimParamMountRopeControl &inout A, const FC_AnimParamMountRopeControl &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimParamMountRopeControl local_48;
    local_48.Alpha = FMath::Lerp(A.Alpha, B.Alpha, T);
    local_48.C_LHandLocation = FMath::Lerp(A.C_LHandLocation, B.C_LHandLocation, T);
    local_48.C_RHandLocation = FMath::Lerp(A.C_RHandLocation, B.C_RHandLocation, T);
    local_48.C_LFootLocation = FMath::Lerp(A.C_LFootLocation, B.C_LFootLocation, T);
    local_48.C_RFootLocation = FMath::Lerp(A.C_RFootLocation, B.C_RFootLocation, T);
    local_48.C_LFootRotation = FQuat::Slerp(A.C_LFootRotation, B.C_LFootRotation, T);
    local_48.C_RFootRotation = FQuat::Slerp(A.C_RFootRotation, B.C_RFootRotation, T);
    local_48.bIsEnabled = A.bIsEnabled;
    return local_48;
}
}
namespace ECSFunc_FC_AnimParamMountRopeControl
{
UFUNCTION()
bool HasAnimParamMountRopeControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimParamMountRopeControl);
}
FC_AnimParamMountRopeControl& AssignAnimParamMountRopeControl(const FECSEntity &inout Entity, const FC_AnimParamMountRopeControl &inout DefaultValue = FC_AnimParamMountRopeControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimParamMountRopeControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimParamMountRopeControl_BP(const FECSEntity &inout Entity, const FC_AnimParamMountRopeControl &inout DefaultValue = FC_AnimParamMountRopeControl())
{
    ECSFunc_FC_AnimParamMountRopeControl::AssignAnimParamMountRopeControl(Entity, DefaultValue);
    return;
}
FC_AnimParamMountRopeControl& ModifyAnimParamMountRopeControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimParamMountRopeControl));
    return local_12.GetComp();
}
FC_AnimParamMountRopeControl& ModifyOrAddAnimParamMountRopeControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimParamMountRopeControl));
    return local_12.GetComp();
}
const FC_AnimParamMountRopeControl& GetAnimParamMountRopeControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimParamMountRopeControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimParamMountRopeControl GetAnimParamMountRopeControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimParamMountRopeControl& local_4 = ECSFunc_FC_AnimParamMountRopeControl::GetAnimParamMountRopeControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimParamMountRopeControl();
}
const FC_AnimParamMountRopeControl GetDefaultedAnimParamMountRopeControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimParamMountRopeControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimParamMountRopeControl);
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
FC_AnimParamMountRopeControl GetDefaultedAnimParamMountRopeControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimParamMountRopeControl::GetDefaultedAnimParamMountRopeControl(Entity);
}
UFUNCTION()
bool RemoveAnimParamMountRopeControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimParamMountRopeControl);
}
}
FECSMonitorRuntimeView __GetMonitorAnimParamMountRopeControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimParamMountRopeControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamMountRopeControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimParamMountRopeControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamMountRopeControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimParamMountRopeControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamMountRopeControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimParamMountRopeControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamMountRopeControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimParamMountRopeControl, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimParamMountRopeControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimParamMountRopeControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamMountRopeControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimParamMountRopeControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamMountRopeControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimParamMountRopeControl, bFixedFrame, Details);
    return;
}
