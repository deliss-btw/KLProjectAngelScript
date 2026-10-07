
namespace __INTENRAL_FC_AnimParamSocketAimControl_NS
{
    const TECSComponentDerivedPtr<FC_AnimParamSocketAimControl> DerivedPtr = TECSComponentDerivedPtr<FC_AnimParamSocketAimControl>();
    const FC_AnimParamSocketAimControl DefaultValue = FC_AnimParamSocketAimControl();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimParamSocketAimControlRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_AnimParamSocketAimControl : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_Enable;

    FC_AnimParamSocketAimControl()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimParamSocketAimControl(const FC_AnimParamSocketAimControl &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimParamSocketAimControl opAssign(const FC_AnimParamSocketAimControl &inout Other)
    {
        FC_AnimParamSocketAimControl __r;
        this.SetEnable(Other.GetEnable());
        return __r;
    }
    bool GetEnable() const property
    {
        return this.m_Enable;
    }
    void SetEnable(const bool __Value) property
    {
        if (!(this.m_Enable) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Enable = __Value;
        return;
    }
}

class UESMAction_AnimParamSingleBoneAimControl : UESMBPBaseSpanTickAction
{
    UESMAction_AnimParamSingleBoneAimControl()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::FC_AnimAimTargetControl::SetUseAnimAimTargetControl(Context.GetEntity(), true);
        ModifyOrAdd local_6;
        FC_AnimParamSocketAimControl& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.SetEnable(true);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        ::FC_AnimAimTargetControl::SetUseAnimAimTargetControl(Context.GetEntity(), false);
        return;
    }
}

namespace FC_AnimParamSocketAimControl
{
FC_AnimParamSocketAimControl Interpolate(const FC_AnimParamSocketAimControl &inout A, const FC_AnimParamSocketAimControl &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimParamSocketAimControl local_2;
    local_2.SetEnable(A.GetEnable());
    return local_2;
}
}
namespace ECSFunc_FC_AnimParamSocketAimControl
{
UFUNCTION()
bool HasAnimParamSocketAimControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimParamSocketAimControl);
}
FC_AnimParamSocketAimControl& AssignAnimParamSocketAimControl(const FECSEntity &inout Entity, const FC_AnimParamSocketAimControl &inout DefaultValue = FC_AnimParamSocketAimControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimParamSocketAimControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimParamSocketAimControl_BP(const FECSEntity &inout Entity, const FC_AnimParamSocketAimControl &inout DefaultValue = FC_AnimParamSocketAimControl())
{
    ECSFunc_FC_AnimParamSocketAimControl::AssignAnimParamSocketAimControl(Entity, DefaultValue);
    return;
}
FC_AnimParamSocketAimControl& ModifyAnimParamSocketAimControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimParamSocketAimControl));
    return local_12.GetComp();
}
FC_AnimParamSocketAimControl& ModifyOrAddAnimParamSocketAimControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimParamSocketAimControl));
    return local_12.GetComp();
}
const FC_AnimParamSocketAimControl& GetAnimParamSocketAimControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimParamSocketAimControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimParamSocketAimControl GetAnimParamSocketAimControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimParamSocketAimControl& local_4 = ECSFunc_FC_AnimParamSocketAimControl::GetAnimParamSocketAimControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimParamSocketAimControl();
}
const FC_AnimParamSocketAimControl GetDefaultedAnimParamSocketAimControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimParamSocketAimControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimParamSocketAimControl);
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
FC_AnimParamSocketAimControl GetDefaultedAnimParamSocketAimControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimParamSocketAimControl::GetDefaultedAnimParamSocketAimControl(Entity);
}
UFUNCTION()
bool RemoveAnimParamSocketAimControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimParamSocketAimControl);
}
}
FECSMonitorRuntimeView __GetMonitorAnimParamSocketAimControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimParamSocketAimControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamSocketAimControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimParamSocketAimControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamSocketAimControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimParamSocketAimControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamSocketAimControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimParamSocketAimControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamSocketAimControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimParamSocketAimControl, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimParamSocketAimControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimParamSocketAimControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamSocketAimControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimParamSocketAimControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamSocketAimControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimParamSocketAimControl, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimParamSocketAimControl &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimParamSocketAimControl &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimParamSocketAimControl &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimParamSocketAimControl
{
int __IndexOf_Enable()
{
    return 0;
}
}
