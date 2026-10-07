
namespace __INTENRAL_FC_RelativeDesiredRotation_NS
{
    const TECSComponentDerivedPtr<FC_RelativeDesiredRotation> DerivedPtr = TECSComponentDerivedPtr<FC_RelativeDesiredRotation>();
    const FC_RelativeDesiredRotation DefaultValue = FC_RelativeDesiredRotation();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_RelativeDesiredRotationRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_RelativeDesiredRotation : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_Yaw;
    UPROPERTY()
    float32 m_SrcYaw;

    FC_RelativeDesiredRotation()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RelativeDesiredRotation(const FC_RelativeDesiredRotation &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RelativeDesiredRotation opAssign(const FC_RelativeDesiredRotation &inout Other)
    {
        FC_RelativeDesiredRotation __r;
        this.SetYaw(Other.GetYaw());
        this.SetSrcYaw(Other.GetSrcYaw());
        return __r;
    }
    float32 GetCorrelatedYaw() const
    {
        return (FMath::Sign(this.GetSrcYaw()) * this.GetYaw());
    }
    float32 GetYaw() const property
    {
        return this.m_Yaw;
    }
    void SetYaw(const float32 __Value) property
    {
        if (this.m_Yaw == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Yaw = __Value;
        return;
    }
    float32 GetSrcYaw() const property
    {
        return this.m_SrcYaw;
    }
    void SetSrcYaw(const float32 __Value) property
    {
        if (this.m_SrcYaw == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SrcYaw = __Value;
        return;
    }
}

class UESMAction_RelativeDesiredRotation : UESMBPBaseSpanTickAction
{
    UESMAction_RelativeDesiredRotation()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_7;
        int local_20 = 0;
        int local_26 = 0;
        int local_36 = 0;
        float32 local_37;
        float32 local_38;
        float32 local_39;
        int local_52 = 0;
        Has local_6;
        if (!(local_6.opCall()))
        {
            local_7 = false;
        }
        else
        {
            Has local_12;
            local_7 = local_12.opCall();
        }
        if (!(local_7))
        {
            return;
        }
        float32 local_27 = local_26.GetRelativeDesiredRotationYaw();
        if (local_26.GetMovementInput().IsNearlyZero(9.999999747378752e-5))
        {
            local_27 = 0.0f;
        }
        local_20.SetSrcYaw(local_27);
        local_37 = local_36.GetMaxDegree();
        local_38 = local_36.GetTargetAlpha();
        local_39 = local_36.GetSmoothTime();
        float32 local_28 = -local_37;
        float32 local_41 = FMath::Clamp(local_27, local_28, local_37);
        float32 local_28_2 = local_41 / local_37;
        float32 local_40 = FMath::EaseOut(0.0f, 1.0f, FMath::Abs(local_28_2), 2.0f);
        float32 local_44 = FMath::Sign(local_41) * local_40;
        float32 local_28_3 = local_44 * local_37;
        float32 local_41_2 = local_28_3 * local_38;
        FECSWorldPtr local_46 = Context.GetECSWorld();
        float32 local_28_4 = local_52.DeltaTime;
        local_20.SetYaw(FMath::Lerp(local_20.GetYaw(), local_41_2, local_28_4 / local_39));
        return;
    }
}

namespace FC_RelativeDesiredRotation
{
FC_RelativeDesiredRotation Interpolate(const FC_RelativeDesiredRotation &inout A, const FC_RelativeDesiredRotation &inout B, const float32 T, const float32 DeltaTime)
{
    FC_RelativeDesiredRotation local_4;
    local_4.SetYaw(FMath::Lerp(A.GetYaw(), B.GetYaw(), T));
    local_4.SetSrcYaw(FMath::Lerp(A.GetSrcYaw(), B.GetSrcYaw(), T));
    return local_4;
}
}
namespace ECSFunc_FC_RelativeDesiredRotation
{
UFUNCTION()
bool HasRelativeDesiredRotation(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RelativeDesiredRotation);
}
FC_RelativeDesiredRotation& AssignRelativeDesiredRotation(const FECSEntity &inout Entity, const FC_RelativeDesiredRotation &inout DefaultValue = FC_RelativeDesiredRotation())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RelativeDesiredRotation, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRelativeDesiredRotation_BP(const FECSEntity &inout Entity, const FC_RelativeDesiredRotation &inout DefaultValue = FC_RelativeDesiredRotation())
{
    ECSFunc_FC_RelativeDesiredRotation::AssignRelativeDesiredRotation(Entity, DefaultValue);
    return;
}
FC_RelativeDesiredRotation& ModifyRelativeDesiredRotation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RelativeDesiredRotation));
    return local_12.GetComp();
}
FC_RelativeDesiredRotation& ModifyOrAddRelativeDesiredRotation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RelativeDesiredRotation));
    return local_12.GetComp();
}
const FC_RelativeDesiredRotation& GetRelativeDesiredRotation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RelativeDesiredRotation));
    return local_12.GetComp();
}
UFUNCTION()
FC_RelativeDesiredRotation GetRelativeDesiredRotation_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RelativeDesiredRotation& local_4 = ECSFunc_FC_RelativeDesiredRotation::GetRelativeDesiredRotation(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RelativeDesiredRotation();
}
const FC_RelativeDesiredRotation GetDefaultedRelativeDesiredRotation(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RelativeDesiredRotation __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RelativeDesiredRotation);
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
FC_RelativeDesiredRotation GetDefaultedRelativeDesiredRotation_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RelativeDesiredRotation::GetDefaultedRelativeDesiredRotation(Entity);
}
UFUNCTION()
bool RemoveRelativeDesiredRotation(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RelativeDesiredRotation);
}
}
FECSMonitorRuntimeView __GetMonitorRelativeDesiredRotationOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RelativeDesiredRotation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeDesiredRotationOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RelativeDesiredRotation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeDesiredRotationOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RelativeDesiredRotation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeDesiredRotationOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RelativeDesiredRotation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeDesiredRotationOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RelativeDesiredRotation, bFixedFrame, bMustHandleAll);
}
void __MonitorRelativeDesiredRotationLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RelativeDesiredRotation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRelativeDesiredRotationActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RelativeDesiredRotation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRelativeDesiredRotationModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RelativeDesiredRotation, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_RelativeDesiredRotation_Yaw(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetYaw();
    return;
}
void GetEntityBBVar_RelativeDesiredRotation_GetCorrelatedYaw(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetCorrelatedYaw();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_RelativeDesiredRotation &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_RelativeDesiredRotation &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RelativeDesiredRotation &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RelativeDesiredRotation
{
int __IndexOf_Yaw()
{
    return 0;
}
int __IndexOf_SrcYaw()
{
    return 1;
}
}
