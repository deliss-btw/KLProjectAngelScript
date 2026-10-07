
namespace __INTENRAL_FC_AnimParamRandomFootstep_NS
{
    const TECSComponentDerivedPtr<FC_AnimParamRandomFootstep> DerivedPtr = TECSComponentDerivedPtr<FC_AnimParamRandomFootstep>();
    const FC_AnimParamRandomFootstep DefaultValue = FC_AnimParamRandomFootstep();

}
struct FC_AnimParamRandomFootstep : FECSComponent
{
    UPROPERTY()
    float32 FrontFootValue = 0.0f;
    UPROPERTY()
    float32 BackFootValue = 0.0f;
    UPROPERTY()
    bool bIsEnabled = false;
    UPROPERTY()
    float32 RemainingTime = 0.0f;


}

class UESMAction_AnimRandomFootstep : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool bUseSpanAsInterval = true;
    UPROPERTY()
    float32 Interval = 3.0f;


    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    bool IsNotifyTypeAllowed_Implementation(const EESMNotifyType InType) const
    {
        return (int(InType) == 1);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FC_AnimParamRandomFootstep local_6;
        local_6.BackFootValue = local_6.FrontFootValue;
        local_6.FrontFootValue = FMath::RandRange(-1.0f, 1.0f);
        local_6.bIsEnabled = true;
        local_6.RemainingTime = this.GetEffectiveInterval(Time);
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        float local_8 = Time.ActionDeltaTime.ToSeconds();
        float32 local_9 = float32(local_8);
        FC_AnimParamRandomFootstep local_6;
        local_6.RemainingTime -= local_9;
        if (local_6.RemainingTime <= 0.0f)
        {
            local_6.BackFootValue = local_6.FrontFootValue;
            local_6.FrontFootValue = FMath::RandRange(-1.0f, 1.0f);
            local_6.RemainingTime = this.GetEffectiveInterval(Time);
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FC_AnimParamRandomFootstep local_6;
        local_6.FrontFootValue = 0.0f;
        local_6.BackFootValue = 0.0f;
        local_6.RemainingTime = 0.0f;
        local_6.bIsEnabled = false;
        return;
    }
    float32 GetEffectiveInterval(const FESMActionTime &inout Time) const
    {
        if (this.bUseSpanAsInterval)
        {
            return float32(Time.ActionDuration.ToSeconds());
        }
        return this.Interval;
    }
}

namespace FC_AnimParamRandomFootstep
{
FC_AnimParamRandomFootstep Interpolate(const FC_AnimParamRandomFootstep &inout A, const FC_AnimParamRandomFootstep &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimParamRandomFootstep local_4;
    local_4.FrontFootValue = FMath::Lerp(A.FrontFootValue, B.FrontFootValue, T);
    local_4.BackFootValue = FMath::Lerp(A.BackFootValue, B.BackFootValue, T);
    local_4.bIsEnabled = A.bIsEnabled;
    local_4.RemainingTime = FMath::Lerp(A.RemainingTime, B.RemainingTime, T);
    return local_4;
}
}
namespace ECSFunc_FC_AnimParamRandomFootstep
{
UFUNCTION()
bool HasAnimParamRandomFootstep(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRandomFootstep);
}
FC_AnimParamRandomFootstep& AssignAnimParamRandomFootstep(const FECSEntity &inout Entity, const FC_AnimParamRandomFootstep &inout DefaultValue = FC_AnimParamRandomFootstep())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRandomFootstep, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimParamRandomFootstep_BP(const FECSEntity &inout Entity, const FC_AnimParamRandomFootstep &inout DefaultValue = FC_AnimParamRandomFootstep())
{
    ECSFunc_FC_AnimParamRandomFootstep::AssignAnimParamRandomFootstep(Entity, DefaultValue);
    return;
}
FC_AnimParamRandomFootstep& ModifyAnimParamRandomFootstep(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRandomFootstep));
    return local_12.GetComp();
}
FC_AnimParamRandomFootstep& ModifyOrAddAnimParamRandomFootstep(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRandomFootstep));
    return local_12.GetComp();
}
const FC_AnimParamRandomFootstep& GetAnimParamRandomFootstep(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRandomFootstep));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimParamRandomFootstep GetAnimParamRandomFootstep_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimParamRandomFootstep& local_4 = ECSFunc_FC_AnimParamRandomFootstep::GetAnimParamRandomFootstep(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimParamRandomFootstep();
}
const FC_AnimParamRandomFootstep GetDefaultedAnimParamRandomFootstep(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimParamRandomFootstep __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRandomFootstep);
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
FC_AnimParamRandomFootstep GetDefaultedAnimParamRandomFootstep_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimParamRandomFootstep::GetDefaultedAnimParamRandomFootstep(Entity);
}
UFUNCTION()
bool RemoveAnimParamRandomFootstep(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRandomFootstep);
}
}
FECSMonitorRuntimeView __GetMonitorAnimParamRandomFootstepOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimParamRandomFootstep, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRandomFootstepOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimParamRandomFootstep, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRandomFootstepOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimParamRandomFootstep, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRandomFootstepOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimParamRandomFootstep, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRandomFootstepOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimParamRandomFootstep, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimParamRandomFootstepLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimParamRandomFootstep, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamRandomFootstepActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimParamRandomFootstep, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamRandomFootstepModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimParamRandomFootstep, bFixedFrame, Details);
    return;
}
