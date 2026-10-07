
namespace __INTENRAL_FC_FloatInterpolation_NS
{
    const TECSComponentDerivedPtr<FC_FloatInterpolation> DerivedPtr = TECSComponentDerivedPtr<FC_FloatInterpolation>();
    const FC_FloatInterpolation DefaultValue = FC_FloatInterpolation();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_FloatInterpolationRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_FloatInterpolation : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_Value;

    FC_FloatInterpolation()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_FloatInterpolation(const FC_FloatInterpolation &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_FloatInterpolation opAssign(const FC_FloatInterpolation &inout Other)
    {
        float32 local_1 = 0.0f;
        FC_FloatInterpolation __r;
        this.SetValue(local_1);
        return __r;
    }
    float32 GetValue() const property
    {
        return this.m_Value;
    }
    void SetValue(const float32 __Value) property
    {
        if (this.m_Value == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Value = __Value;
        return;
    }
}

class UESMAction_FloatInterpolation : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    float32 StartValue = 0.0f;
    UPROPERTY()
    float32 EndValue = 1.0f;
    UPROPERTY()
    FRuntimeFloatCurve InterpolationCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_FloatInterpolation& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetValue(this.StartValue);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_FloatInterpolation& local_6 = local_4.opCall();
        if (local_6)
        {
            float32 local_8;
            local_8 = 0.0f;
            float local_12 = Time.ActionDuration.ToSeconds();
            float32 local_9 = float32(local_12);
            if (local_9 > 0.0f)
            {
                float local_12_2 = Time.ActionLastTime.ToSeconds();
                local_8 = FMath::Clamp((float32(local_12_2) / local_9), 0.0f, 1.0f);
            }
            float32 local_10_2 = FMath::Lerp(this.StartValue, this.EndValue, this.InterpolationCurve.GetFloatValue(local_8, 0.0f));
            local_6.SetValue(local_10_2);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_FloatInterpolation& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetValue(this.EndValue);
        }
        return;
    }
}

namespace FC_FloatInterpolation
{
FC_FloatInterpolation Interpolate(const FC_FloatInterpolation &inout A, const FC_FloatInterpolation &inout B, const float32 T, const float32 DeltaTime)
{
    FC_FloatInterpolation local_2;
    float32 local_3 = 0.0f;
    float32 local_4 = 0.0f;
    local_2.SetValue((FMath::Lerp(local_4, local_3, T)));
    return local_2;
}
}
namespace ECSFunc_FC_FloatInterpolation
{
UFUNCTION()
bool HasFloatInterpolation(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FloatInterpolation);
}
FC_FloatInterpolation& AssignFloatInterpolation(const FECSEntity &inout Entity, const FC_FloatInterpolation &inout DefaultValue = FC_FloatInterpolation())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FloatInterpolation, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFloatInterpolation_BP(const FECSEntity &inout Entity, const FC_FloatInterpolation &inout DefaultValue = FC_FloatInterpolation())
{
    ECSFunc_FC_FloatInterpolation::AssignFloatInterpolation(Entity, DefaultValue);
    return;
}
FC_FloatInterpolation& ModifyFloatInterpolation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FloatInterpolation));
    return local_12.GetComp();
}
FC_FloatInterpolation& ModifyOrAddFloatInterpolation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FloatInterpolation));
    return local_12.GetComp();
}
const FC_FloatInterpolation& GetFloatInterpolation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FloatInterpolation));
    return local_12.GetComp();
}
UFUNCTION()
FC_FloatInterpolation GetFloatInterpolation_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_FloatInterpolation& local_4 = ECSFunc_FC_FloatInterpolation::GetFloatInterpolation(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_FloatInterpolation();
}
const FC_FloatInterpolation GetDefaultedFloatInterpolation(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FloatInterpolation __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FloatInterpolation);
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
FC_FloatInterpolation GetDefaultedFloatInterpolation_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_FloatInterpolation::GetDefaultedFloatInterpolation(Entity);
}
UFUNCTION()
bool RemoveFloatInterpolation(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FloatInterpolation);
}
}
FECSMonitorRuntimeView __GetMonitorFloatInterpolationOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FloatInterpolation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFloatInterpolationOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FloatInterpolation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFloatInterpolationOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FloatInterpolation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFloatInterpolationOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FloatInterpolation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFloatInterpolationOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FloatInterpolation, bFixedFrame, bMustHandleAll);
}
void __MonitorFloatInterpolationLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FloatInterpolation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFloatInterpolationActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FloatInterpolation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFloatInterpolationModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FloatInterpolation, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_FloatInterpolation &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_FloatInterpolation &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_FloatInterpolation &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_FloatInterpolation
{
int __IndexOf_Value()
{
    return 0;
}
}
