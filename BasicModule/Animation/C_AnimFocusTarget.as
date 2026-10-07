
enum EAnimFocusSource
{
    None,
    LockTarget,
    ViewDir,
    SampleTrajectory,
    LongNeckHeadControlPoint,
}

namespace __INTENRAL_FC_AnimFocusTarget_NS
{
    const TECSComponentDerivedPtr<FC_AnimFocusTarget> DerivedPtr = TECSComponentDerivedPtr<FC_AnimFocusTarget>();
    const FC_AnimFocusTarget DefaultValue = FC_AnimFocusTarget();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimFocusTargetRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_AnimFocusTarget : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_UsedCounter;
    UPROPERTY()
    bool m_bValid;
    UPROPERTY()
    EAnimFocusSource m_ActiveSource;
    UPROPERTY()
    EAnimFocusSource m_OverrideSource;
    UPROPERTY()
    FVector m_TargetPositionWS;
    UPROPERTY()
    FVector m_TargetPositionCS;

    FC_AnimFocusTarget()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimFocusTarget(const FC_AnimFocusTarget &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimFocusTarget opAssign(const FC_AnimFocusTarget &inout Other)
    {
        FC_AnimFocusTarget __r;
        this.SetUsedCounter(Other.GetUsedCounter());
        this.SetbValid(Other.GetbValid());
        this.SetActiveSource(Other.GetActiveSource());
        this.SetOverrideSource(Other.GetOverrideSource());
        this.SetTargetPositionWS(Other.GetTargetPositionWS());
        this.SetTargetPositionCS(Other.GetTargetPositionCS());
        return __r;
    }
    int GetUsedCounter() const property
    {
        return this.m_UsedCounter;
    }
    void SetUsedCounter(const int __Value) property
    {
        if (this.m_UsedCounter == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_UsedCounter = __Value;
        return;
    }
    bool GetbValid() const property
    {
        return this.m_bValid;
    }
    void SetbValid(const bool __Value) property
    {
        if (!(this.m_bValid) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bValid = __Value;
        return;
    }
    EAnimFocusSource GetActiveSource() const property
    {
        return this.m_ActiveSource;
    }
    void SetActiveSource(const EAnimFocusSource __Value) property
    {
        if (int(this.m_ActiveSource) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ActiveSource = __Value;
        return;
    }
    EAnimFocusSource GetOverrideSource() const property
    {
        return this.m_OverrideSource;
    }
    void SetOverrideSource(const EAnimFocusSource __Value) property
    {
        if (int(this.m_OverrideSource) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_OverrideSource = __Value;
        return;
    }
    const FVector GetTargetPositionWS() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TargetPositionWS() property
    {
        FVector __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetTargetPositionWS(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_TargetPositionWS = __Value;
        return;
    }
    const FVector GetTargetPositionCS() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TargetPositionCS() property
    {
        FVector __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetTargetPositionCS(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_TargetPositionCS = __Value;
        return;
    }
}

class UESMAction_FocusSourceOverride : UESMBPBaseSpanAction
{
    UPROPERTY()
    EAnimFocusSource ForcedSource = EAnimFocusSource(2);


    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(6);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_AnimFocusTarget& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetOverrideSource(this.ForcedSource);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_AnimFocusTarget& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetOverrideSource(EAnimFocusSource(0));
        }
        return;
    }
}

namespace FC_AnimFocusTarget
{
FC_AnimFocusTarget Interpolate(const FC_AnimFocusTarget &inout A, const FC_AnimFocusTarget &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimFocusTarget local_16;
    local_16.SetTargetPositionWS(FMath::Lerp(A.GetTargetPositionWS(), B.GetTargetPositionWS(), T));
    local_16.SetTargetPositionCS(FMath::Lerp(A.GetTargetPositionCS(), B.GetTargetPositionCS(), T));
    return local_16;
}
void SetUseFocusTarget(const FECSEntity &inout Entity, const bool bUse)
{
    if (bUse)
    {
        ModifyOrAdd local_4;
        FC_AnimFocusTarget& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetUsedCounter((local_6.GetUsedCounter() + 1));
        }
        return;
    }
    Modify local_14;
    FC_AnimFocusTarget& local_6_2 = local_14.opCall();
    if (local_6_2)
    {
        local_6_2.SetUsedCounter((local_6_2.GetUsedCounter() - 1));
    }
    return;
}
}
namespace ECSFunc_FC_AnimFocusTarget
{
UFUNCTION()
bool HasAnimFocusTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimFocusTarget);
}
FC_AnimFocusTarget& AssignAnimFocusTarget(const FECSEntity &inout Entity, const FC_AnimFocusTarget &inout DefaultValue = FC_AnimFocusTarget())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimFocusTarget, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimFocusTarget_BP(const FECSEntity &inout Entity, const FC_AnimFocusTarget &inout DefaultValue = FC_AnimFocusTarget())
{
    ECSFunc_FC_AnimFocusTarget::AssignAnimFocusTarget(Entity, DefaultValue);
    return;
}
FC_AnimFocusTarget& ModifyAnimFocusTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimFocusTarget));
    return local_12.GetComp();
}
FC_AnimFocusTarget& ModifyOrAddAnimFocusTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimFocusTarget));
    return local_12.GetComp();
}
const FC_AnimFocusTarget& GetAnimFocusTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimFocusTarget));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimFocusTarget GetAnimFocusTarget_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimFocusTarget& local_4 = ECSFunc_FC_AnimFocusTarget::GetAnimFocusTarget(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimFocusTarget();
}
const FC_AnimFocusTarget GetDefaultedAnimFocusTarget(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimFocusTarget __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimFocusTarget);
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
FC_AnimFocusTarget GetDefaultedAnimFocusTarget_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimFocusTarget::GetDefaultedAnimFocusTarget(Entity);
}
UFUNCTION()
bool RemoveAnimFocusTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimFocusTarget);
}
}
FECSMonitorRuntimeView __GetMonitorAnimFocusTargetOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimFocusTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFocusTargetOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimFocusTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFocusTargetOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimFocusTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFocusTargetOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimFocusTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFocusTargetOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimFocusTarget, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimFocusTargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimFocusTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimFocusTargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimFocusTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimFocusTargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimFocusTarget, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimFocusTarget &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimFocusTarget &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimFocusTarget &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimFocusTarget
{
int __IndexOf_UsedCounter()
{
    return 0;
}
int __IndexOf_bValid()
{
    return 1;
}
int __IndexOf_ActiveSource()
{
    return 2;
}
int __IndexOf_OverrideSource()
{
    return 3;
}
int __IndexOf_TargetPositionWS()
{
    return 4;
}
int __IndexOf_TargetPositionCS()
{
    return 5;
}
}
