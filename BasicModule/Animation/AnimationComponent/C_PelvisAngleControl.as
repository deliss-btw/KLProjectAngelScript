
namespace __INTENRAL_FC_PelvisAngleControl_NS
{
    const TECSComponentDerivedPtr<FC_PelvisAngleControl> DerivedPtr = TECSComponentDerivedPtr<FC_PelvisAngleControl>();
    const FC_PelvisAngleControl DefaultValue = FC_PelvisAngleControl();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_PelvisAngleControlRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_PelvisAngleControl : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_Yaw;

    FC_PelvisAngleControl()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PelvisAngleControl(const FC_PelvisAngleControl &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PelvisAngleControl opAssign(const FC_PelvisAngleControl &inout Other)
    {
        FC_PelvisAngleControl __r;
        this.SetYaw(Other.GetYaw());
        return __r;
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
}

class UESMAction_PelvisAngleControl : UESMBPBaseSpanTickAction
{
    float32 BasePelvisAngle = 0.0f;


    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        FNameHandle_EntityBBVarFloat local_12;
        local_12;
        float32 local_13 = Context.GetEntity().GetBB_Float(local_12);
        local_6.SetYaw(FMath::Clamp((this.BasePelvisAngle + local_13), 0.0f, 90.0f));
        return;
    }
}

namespace FC_PelvisAngleControl
{
FC_PelvisAngleControl Interpolate(const FC_PelvisAngleControl &inout A, const FC_PelvisAngleControl &inout B, const float32 T, const float32 DeltaTime)
{
    FC_PelvisAngleControl local_2;
    local_2.SetYaw(FMath::Lerp(A.GetYaw(), B.GetYaw(), T));
    return local_2;
}
}
namespace ECSFunc_FC_PelvisAngleControl
{
UFUNCTION()
bool HasPelvisAngleControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PelvisAngleControl);
}
FC_PelvisAngleControl& AssignPelvisAngleControl(const FECSEntity &inout Entity, const FC_PelvisAngleControl &inout DefaultValue = FC_PelvisAngleControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PelvisAngleControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPelvisAngleControl_BP(const FECSEntity &inout Entity, const FC_PelvisAngleControl &inout DefaultValue = FC_PelvisAngleControl())
{
    ECSFunc_FC_PelvisAngleControl::AssignPelvisAngleControl(Entity, DefaultValue);
    return;
}
FC_PelvisAngleControl& ModifyPelvisAngleControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PelvisAngleControl));
    return local_12.GetComp();
}
FC_PelvisAngleControl& ModifyOrAddPelvisAngleControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PelvisAngleControl));
    return local_12.GetComp();
}
const FC_PelvisAngleControl& GetPelvisAngleControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PelvisAngleControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_PelvisAngleControl GetPelvisAngleControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PelvisAngleControl& local_4 = ECSFunc_FC_PelvisAngleControl::GetPelvisAngleControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PelvisAngleControl();
}
const FC_PelvisAngleControl GetDefaultedPelvisAngleControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PelvisAngleControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PelvisAngleControl);
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
FC_PelvisAngleControl GetDefaultedPelvisAngleControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PelvisAngleControl::GetDefaultedPelvisAngleControl(Entity);
}
UFUNCTION()
bool RemovePelvisAngleControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PelvisAngleControl);
}
}
FECSMonitorRuntimeView __GetMonitorPelvisAngleControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PelvisAngleControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPelvisAngleControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PelvisAngleControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPelvisAngleControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PelvisAngleControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPelvisAngleControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PelvisAngleControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPelvisAngleControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PelvisAngleControl, bFixedFrame, bMustHandleAll);
}
void __MonitorPelvisAngleControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PelvisAngleControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPelvisAngleControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PelvisAngleControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPelvisAngleControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PelvisAngleControl, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PelvisAngleControl &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PelvisAngleControl &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PelvisAngleControl &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PelvisAngleControl
{
int __IndexOf_Yaw()
{
    return 0;
}
}
