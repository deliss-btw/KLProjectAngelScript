
namespace __INTENRAL_FC_FootIKControl_NS
{
    const TECSComponentDerivedPtr<FC_FootIKControl> DerivedPtr = TECSComponentDerivedPtr<FC_FootIKControl>();
    const FC_FootIKControl DefaultValue = FC_FootIKControl();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_FootIKControlRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_FootIKControl : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_Weight;
    UPROPERTY()
    FVector m_FloorNormal;
    UPROPERTY()
    FVector m_GroundPlaneLocation;
    UPROPERTY()
    FQuat m_GroundPlaneRotation;
    UPROPERTY()
    float32 m_BodyPivotControl;
    UPROPERTY()
    float32 m_LegFollowBodyRotationWeight;
    UPROPERTY()
    float32 m_TargetBodyPivotControl;
    UPROPERTY()
    float32 m_TargetLegFollowBodyRotationWeight;

    FC_FootIKControl()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_FootIKControl(const FC_FootIKControl &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_FootIKControl opAssign(const FC_FootIKControl &inout Other)
    {
        FC_FootIKControl __r;
        this.SetWeight(Other.GetWeight());
        this.SetFloorNormal(Other.GetFloorNormal());
        this.SetGroundPlaneLocation(Other.GetGroundPlaneLocation());
        this.SetGroundPlaneRotation(Other.GetGroundPlaneRotation());
        this.SetBodyPivotControl(Other.GetBodyPivotControl());
        this.SetLegFollowBodyRotationWeight(Other.GetLegFollowBodyRotationWeight());
        this.SetTargetBodyPivotControl(Other.GetTargetBodyPivotControl());
        this.SetTargetLegFollowBodyRotationWeight(Other.GetTargetLegFollowBodyRotationWeight());
        return __r;
    }
    float32 GetWeight() const property
    {
        return this.m_Weight;
    }
    void SetWeight(const float32 __Value) property
    {
        if (this.m_Weight == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Weight = __Value;
        return;
    }
    const FVector GetFloorNormal() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_FloorNormal() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetFloorNormal(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_FloorNormal = __Value;
        return;
    }
    const FVector GetGroundPlaneLocation() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetGroundPlaneLocation() property
    {
        FVector __r;
        return __r;
    }
    void SetGroundPlaneLocation(const FVector &inout __Value) property
    {
        this.m_GroundPlaneLocation = __Value;
        return;
    }
    const FQuat GetGroundPlaneRotation() const property
    {
        const FQuat __r;
        return __r;
    }
    FQuat GetGroundPlaneRotation() property
    {
        FQuat __r;
        return __r;
    }
    void SetGroundPlaneRotation(const FQuat &inout __Value) property
    {
        this.m_GroundPlaneRotation = __Value;
        return;
    }
    float32 GetBodyPivotControl() const property
    {
        return this.m_BodyPivotControl;
    }
    void SetBodyPivotControl(const float32 __Value) property
    {
        if (this.m_BodyPivotControl == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_BodyPivotControl = __Value;
        return;
    }
    float32 GetLegFollowBodyRotationWeight() const property
    {
        return this.m_LegFollowBodyRotationWeight;
    }
    void SetLegFollowBodyRotationWeight(const float32 __Value) property
    {
        if (this.m_LegFollowBodyRotationWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_LegFollowBodyRotationWeight = __Value;
        return;
    }
    float32 GetTargetBodyPivotControl() const property
    {
        return this.m_TargetBodyPivotControl;
    }
    void SetTargetBodyPivotControl(const float32 __Value) property
    {
        if (this.m_TargetBodyPivotControl == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_TargetBodyPivotControl = __Value;
        return;
    }
    float32 GetTargetLegFollowBodyRotationWeight() const property
    {
        return this.m_TargetLegFollowBodyRotationWeight;
    }
    void SetTargetLegFollowBodyRotationWeight(const float32 __Value) property
    {
        if (this.m_TargetLegFollowBodyRotationWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_TargetLegFollowBodyRotationWeight = __Value;
        return;
    }
}

namespace FC_FootIKControl
{
FC_FootIKControl Interpolate(const FC_FootIKControl &inout A, const FC_FootIKControl &inout B, const float32 T, const float32 DeltaTime)
{
    FC_FootIKControl local_28;
    local_28.SetWeight(FMath::Lerp(A.GetWeight(), B.GetWeight(), T));
    local_28.SetBodyPivotControl(FMath::Lerp(A.GetBodyPivotControl(), B.GetBodyPivotControl(), T));
    local_28.SetLegFollowBodyRotationWeight(FMath::Lerp(A.GetLegFollowBodyRotationWeight(), B.GetLegFollowBodyRotationWeight(), T));
    local_28.SetFloorNormal(FMath::Lerp(A.GetFloorNormal(), B.GetFloorNormal(), T));
    local_28.SetGroundPlaneLocation(FMath::Lerp(A.GetGroundPlaneLocation(), B.GetGroundPlaneLocation(), T));
    local_28.SetGroundPlaneRotation(FQuat::Slerp(A.GetGroundPlaneRotation(), B.GetGroundPlaneRotation(), T));
    local_28.SetTargetBodyPivotControl(FMath::Lerp(A.GetTargetBodyPivotControl(), B.GetTargetBodyPivotControl(), T));
    local_28.SetTargetLegFollowBodyRotationWeight(FMath::Lerp(A.GetTargetLegFollowBodyRotationWeight(), B.GetTargetLegFollowBodyRotationWeight(), T));
    return local_28;
}
}
namespace ECSFunc_FC_FootIKControl
{
UFUNCTION()
bool HasFootIKControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FootIKControl);
}
FC_FootIKControl& AssignFootIKControl(const FECSEntity &inout Entity, const FC_FootIKControl &inout DefaultValue = FC_FootIKControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FootIKControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFootIKControl_BP(const FECSEntity &inout Entity, const FC_FootIKControl &inout DefaultValue = FC_FootIKControl())
{
    ECSFunc_FC_FootIKControl::AssignFootIKControl(Entity, DefaultValue);
    return;
}
FC_FootIKControl& ModifyFootIKControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FootIKControl));
    return local_12.GetComp();
}
FC_FootIKControl& ModifyOrAddFootIKControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FootIKControl));
    return local_12.GetComp();
}
const FC_FootIKControl& GetFootIKControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FootIKControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_FootIKControl GetFootIKControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_FootIKControl& local_4 = ECSFunc_FC_FootIKControl::GetFootIKControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_FootIKControl();
}
const FC_FootIKControl GetDefaultedFootIKControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FootIKControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FootIKControl);
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
FC_FootIKControl GetDefaultedFootIKControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_FootIKControl::GetDefaultedFootIKControl(Entity);
}
UFUNCTION()
bool RemoveFootIKControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FootIKControl);
}
}
FECSMonitorRuntimeView __GetMonitorFootIKControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FootIKControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootIKControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FootIKControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootIKControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FootIKControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootIKControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FootIKControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootIKControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FootIKControl, bFixedFrame, bMustHandleAll);
}
void __MonitorFootIKControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FootIKControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFootIKControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FootIKControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFootIKControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FootIKControl, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_FootIKControl &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_FootIKControl &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_FootIKControl &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_FootIKControl
{
int __IndexOf_Weight()
{
    return 0;
}
int __IndexOf_FloorNormal()
{
    return 1;
}
int __IndexOf_BodyPivotControl()
{
    return 2;
}
int __IndexOf_LegFollowBodyRotationWeight()
{
    return 3;
}
int __IndexOf_TargetBodyPivotControl()
{
    return 4;
}
int __IndexOf_TargetLegFollowBodyRotationWeight()
{
    return 5;
}
}
