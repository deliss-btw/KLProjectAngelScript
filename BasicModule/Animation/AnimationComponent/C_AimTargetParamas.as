
namespace __INTENRAL_FC_AimTargetControl_NS
{
    const TECSComponentDerivedPtr<FC_AimTargetControl> DerivedPtr = TECSComponentDerivedPtr<FC_AimTargetControl>();
    const FC_AimTargetControl DefaultValue = FC_AimTargetControl();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AimTargetControlRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_AimTargetControl : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector m_AimTarget;
    UPROPERTY()
    float32 m_AimTargetPitch;
    UPROPERTY()
    float32 m_AimTargetYaw;

    FC_AimTargetControl()
    {
        this.m_AimTarget = FVector(0.0, 0.0, 0.0);
        this.m_AimTargetPitch = 0.0f;
        this.m_AimTargetYaw = 0.0f;
        this.__InitDirtyFlags();
        return;
    }
    FC_AimTargetControl(const FC_AimTargetControl &inout Other)
    {
        this.m_AimTarget = FVector(0.0, 0.0, 0.0);
        this.m_AimTargetPitch = 0.0f;
        this.m_AimTargetYaw = 0.0f;
        this.__InitDirtyFlags();
        this.m_AimTarget = Other.m_AimTarget;
        this.m_AimTargetPitch = Other.m_AimTargetPitch;
        this.m_AimTargetYaw = Other.m_AimTargetYaw;
        return;
    }
    FC_AimTargetControl opAssign(const FC_AimTargetControl &inout Other)
    {
        FC_AimTargetControl __r;
        this.SetAimTarget(Other.GetAimTarget());
        this.SetAimTargetPitch(Other.GetAimTargetPitch());
        this.SetAimTargetYaw(Other.GetAimTargetYaw());
        return __r;
    }
    const FVector GetAimTarget() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_AimTarget() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAimTarget(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AimTarget = __Value;
        return;
    }
    float32 GetAimTargetPitch() const property
    {
        return this.m_AimTargetPitch;
    }
    void SetAimTargetPitch(const float32 __Value) property
    {
        if (this.m_AimTargetPitch == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_AimTargetPitch = __Value;
        return;
    }
    float32 GetAimTargetYaw() const property
    {
        return this.m_AimTargetYaw;
    }
    void SetAimTargetYaw(const float32 __Value) property
    {
        if (this.m_AimTargetYaw == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_AimTargetYaw = __Value;
        return;
    }
}

class UESMAction_AimTargetControl : UESMBPBaseSpanTickAction
{
    UESMAction_AimTargetControl()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FVector local_6;
        int local_20 = 0;
        int local_26 = 0;
        int local_32 = 0;
        ModifyOrAdd local_10;
        FC_AimTargetControl& local_12 = local_10.opCall();
        if (local_12)
        {
            FRotator local_44 = FCharacterInputUtils::GetViewInputDir(Context.GetEntity(), Time.WorldTime);
            FVector local_56 = FCharacterInputUtils::GetViewOffset(Context.GetEntity(), Time.WorldTime);
            if (local_20 && local_20.GetbCachedValidLockTargetPosition() && !(local_26.GetbIsAiming()))
            {
                local_6 = local_20.GetLogicLockTargetPosition();
            }
            else
            {
                local_6 = ((FVector(local_32.GetPosition()) + local_56) + (local_44.GetForwardVector() * 1000.0));
            }
            local_12.SetAimTarget((local_32.ToFTransform().InverseTransformPosition(local_6) - FVector(0.0, 0.0, 30.0)));
            local_6 = local_12.GetAimTarget();
            FVector local_50 = local_6.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            local_12.SetAimTargetYaw(float32((FMath::RadiansToDegrees(FMath::Atan2(local_6.Y, local_6.X)))));
            float local_66 = FMath::RadiansToDegrees(FMath::Atan2(local_6.Z, (FMath::Sqrt((local_6.X * local_6.X) + (local_6.Y * local_6.Y)))));
            local_12.SetAimTargetPitch(float32(local_66));
        }
        return;
    }
}

namespace FC_AimTargetControl
{
FC_AimTargetControl Interpolate(const FC_AimTargetControl &inout A, const FC_AimTargetControl &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AimTargetControl local_10;
    local_10.SetAimTarget(FMath::Lerp(A.GetAimTarget(), B.GetAimTarget(), T));
    local_10.SetAimTargetPitch(FMath::Lerp(A.GetAimTargetPitch(), B.GetAimTargetPitch(), T));
    local_10.SetAimTargetYaw(FMath::Lerp(A.GetAimTargetYaw(), B.GetAimTargetYaw(), T));
    return local_10;
}
}
namespace ECSFunc_FC_AimTargetControl
{
UFUNCTION()
bool HasAimTargetControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AimTargetControl);
}
FC_AimTargetControl& AssignAimTargetControl(const FECSEntity &inout Entity, const FC_AimTargetControl &inout DefaultValue = FC_AimTargetControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AimTargetControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAimTargetControl_BP(const FECSEntity &inout Entity, const FC_AimTargetControl &inout DefaultValue = FC_AimTargetControl())
{
    ECSFunc_FC_AimTargetControl::AssignAimTargetControl(Entity, DefaultValue);
    return;
}
FC_AimTargetControl& ModifyAimTargetControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AimTargetControl));
    return local_12.GetComp();
}
FC_AimTargetControl& ModifyOrAddAimTargetControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AimTargetControl));
    return local_12.GetComp();
}
const FC_AimTargetControl& GetAimTargetControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AimTargetControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_AimTargetControl GetAimTargetControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AimTargetControl& local_4 = ECSFunc_FC_AimTargetControl::GetAimTargetControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AimTargetControl();
}
const FC_AimTargetControl GetDefaultedAimTargetControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AimTargetControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AimTargetControl);
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
FC_AimTargetControl GetDefaultedAimTargetControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AimTargetControl::GetDefaultedAimTargetControl(Entity);
}
UFUNCTION()
bool RemoveAimTargetControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AimTargetControl);
}
}
FECSMonitorRuntimeView __GetMonitorAimTargetControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AimTargetControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimTargetControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AimTargetControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimTargetControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AimTargetControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimTargetControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AimTargetControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimTargetControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AimTargetControl, bFixedFrame, bMustHandleAll);
}
void __MonitorAimTargetControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AimTargetControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAimTargetControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AimTargetControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAimTargetControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AimTargetControl, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_AimTargetControl_AimTarget(const FECSEntity &inout Entity, FVector &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FVector(local_4.opCall().GetAimTarget());
    return;
}
void GetEntityBBVar_AimTargetControl_AimTargetPitch(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetAimTargetPitch();
    return;
}
void GetEntityBBVar_AimTargetControl_AimTargetYaw(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetAimTargetYaw();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AimTargetControl &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AimTargetControl &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AimTargetControl &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AimTargetControl
{
int __IndexOf_AimTarget()
{
    return 0;
}
int __IndexOf_AimTargetPitch()
{
    return 1;
}
int __IndexOf_AimTargetYaw()
{
    return 2;
}
}
