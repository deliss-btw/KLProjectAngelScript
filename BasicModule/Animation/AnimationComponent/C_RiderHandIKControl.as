
namespace __INTENRAL_FC_RiderHandIKControl_NS
{
    const TECSComponentDerivedPtr<FC_RiderHandIKControl> DerivedPtr = TECSComponentDerivedPtr<FC_RiderHandIKControl>();
    const FC_RiderHandIKControl DefaultValue = FC_RiderHandIKControl();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_RiderHandIKControlRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_RiderHandIKControl : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_Weight;
    UPROPERTY()
    float32 m_LeftHandWeight;
    UPROPERTY()
    float32 m_RightHandWeight;
    UPROPERTY()
    float32 m_TargetWeight;
    UPROPERTY()
    float32 m_TargetLeftHandWeight;
    UPROPERTY()
    float32 m_TargetRightHandWeight;
    UPROPERTY()
    bool m_bHasCapturedReference;
    UPROPERTY()
    FTransform m_LeftHandRelativeToRoot;
    UPROPERTY()
    FTransform m_RightHandRelativeToRoot;
    UPROPERTY()
    FVector m_WyvernSocketWorldLocation;
    UPROPERTY()
    bool m_bHasWyvernSocketLocation;

    FC_RiderHandIKControl()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RiderHandIKControl(const FC_RiderHandIKControl &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RiderHandIKControl opAssign(const FC_RiderHandIKControl &inout Other)
    {
        FC_RiderHandIKControl __r;
        this.SetWeight(Other.GetWeight());
        this.SetLeftHandWeight(Other.GetLeftHandWeight());
        this.SetRightHandWeight(Other.GetRightHandWeight());
        this.SetTargetWeight(Other.GetTargetWeight());
        this.SetTargetLeftHandWeight(Other.GetTargetLeftHandWeight());
        this.SetTargetRightHandWeight(Other.GetTargetRightHandWeight());
        this.SetbHasCapturedReference(Other.GetbHasCapturedReference());
        this.SetLeftHandRelativeToRoot(Other.GetLeftHandRelativeToRoot());
        this.SetRightHandRelativeToRoot(Other.GetRightHandRelativeToRoot());
        this.SetWyvernSocketWorldLocation(Other.GetWyvernSocketWorldLocation());
        this.SetbHasWyvernSocketLocation(Other.GetbHasWyvernSocketLocation());
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
    float32 GetLeftHandWeight() const property
    {
        return this.m_LeftHandWeight;
    }
    void SetLeftHandWeight(const float32 __Value) property
    {
        if (this.m_LeftHandWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_LeftHandWeight = __Value;
        return;
    }
    float32 GetRightHandWeight() const property
    {
        return this.m_RightHandWeight;
    }
    void SetRightHandWeight(const float32 __Value) property
    {
        if (this.m_RightHandWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_RightHandWeight = __Value;
        return;
    }
    float32 GetTargetWeight() const property
    {
        return this.m_TargetWeight;
    }
    void SetTargetWeight(const float32 __Value) property
    {
        if (this.m_TargetWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_TargetWeight = __Value;
        return;
    }
    float32 GetTargetLeftHandWeight() const property
    {
        return this.m_TargetLeftHandWeight;
    }
    void SetTargetLeftHandWeight(const float32 __Value) property
    {
        if (this.m_TargetLeftHandWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_TargetLeftHandWeight = __Value;
        return;
    }
    float32 GetTargetRightHandWeight() const property
    {
        return this.m_TargetRightHandWeight;
    }
    void SetTargetRightHandWeight(const float32 __Value) property
    {
        if (this.m_TargetRightHandWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_TargetRightHandWeight = __Value;
        return;
    }
    bool GetbHasCapturedReference() const property
    {
        return this.m_bHasCapturedReference;
    }
    void SetbHasCapturedReference(const bool __Value) property
    {
        this.m_bHasCapturedReference = __Value;
        return;
    }
    const FTransform GetLeftHandRelativeToRoot() const property
    {
        const FTransform __r;
        return __r;
    }
    FTransform GetLeftHandRelativeToRoot() property
    {
        FTransform __r;
        return __r;
    }
    void SetLeftHandRelativeToRoot(const FTransform &inout __Value) property
    {
        this.m_LeftHandRelativeToRoot = __Value;
        return;
    }
    const FTransform GetRightHandRelativeToRoot() const property
    {
        const FTransform __r;
        return __r;
    }
    FTransform GetRightHandRelativeToRoot() property
    {
        FTransform __r;
        return __r;
    }
    void SetRightHandRelativeToRoot(const FTransform &inout __Value) property
    {
        this.m_RightHandRelativeToRoot = __Value;
        return;
    }
    const FVector GetWyvernSocketWorldLocation() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetWyvernSocketWorldLocation() property
    {
        FVector __r;
        return __r;
    }
    void SetWyvernSocketWorldLocation(const FVector &inout __Value) property
    {
        this.m_WyvernSocketWorldLocation = __Value;
        return;
    }
    bool GetbHasWyvernSocketLocation() const property
    {
        return this.m_bHasWyvernSocketLocation;
    }
    void SetbHasWyvernSocketLocation(const bool __Value) property
    {
        this.m_bHasWyvernSocketLocation = __Value;
        return;
    }
}

namespace FC_RiderHandIKControl
{
FC_RiderHandIKControl Interpolate(const FC_RiderHandIKControl &inout A, const FC_RiderHandIKControl &inout B, const float32 T, const float32 DeltaTime)
{
    FC_RiderHandIKControl local_64;
    local_64.SetWeight(FMath::Lerp(A.GetWeight(), B.GetWeight(), T));
    local_64.SetLeftHandWeight(FMath::Lerp(A.GetLeftHandWeight(), B.GetLeftHandWeight(), T));
    local_64.SetRightHandWeight(FMath::Lerp(A.GetRightHandWeight(), B.GetRightHandWeight(), T));
    local_64.SetTargetWeight(FMath::Lerp(A.GetTargetWeight(), B.GetTargetWeight(), T));
    local_64.SetTargetLeftHandWeight(FMath::Lerp(A.GetTargetLeftHandWeight(), B.GetTargetLeftHandWeight(), T));
    local_64.SetTargetRightHandWeight(FMath::Lerp(A.GetTargetRightHandWeight(), B.GetTargetRightHandWeight(), T));
    local_64.SetbHasCapturedReference(B.GetbHasCapturedReference());
    local_64.SetLeftHandRelativeToRoot(B.GetLeftHandRelativeToRoot());
    local_64.SetRightHandRelativeToRoot(B.GetRightHandRelativeToRoot());
    local_64.SetWyvernSocketWorldLocation(B.GetWyvernSocketWorldLocation());
    local_64.SetbHasWyvernSocketLocation(B.GetbHasWyvernSocketLocation());
    return local_64;
}
}
namespace ECSFunc_FC_RiderHandIKControl
{
UFUNCTION()
bool HasRiderHandIKControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RiderHandIKControl);
}
FC_RiderHandIKControl& AssignRiderHandIKControl(const FECSEntity &inout Entity, const FC_RiderHandIKControl &inout DefaultValue = FC_RiderHandIKControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RiderHandIKControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRiderHandIKControl_BP(const FECSEntity &inout Entity, const FC_RiderHandIKControl &inout DefaultValue = FC_RiderHandIKControl())
{
    ECSFunc_FC_RiderHandIKControl::AssignRiderHandIKControl(Entity, DefaultValue);
    return;
}
FC_RiderHandIKControl& ModifyRiderHandIKControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RiderHandIKControl));
    return local_12.GetComp();
}
FC_RiderHandIKControl& ModifyOrAddRiderHandIKControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RiderHandIKControl));
    return local_12.GetComp();
}
const FC_RiderHandIKControl& GetRiderHandIKControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RiderHandIKControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_RiderHandIKControl GetRiderHandIKControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RiderHandIKControl& local_4 = ECSFunc_FC_RiderHandIKControl::GetRiderHandIKControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RiderHandIKControl();
}
const FC_RiderHandIKControl GetDefaultedRiderHandIKControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RiderHandIKControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RiderHandIKControl);
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
FC_RiderHandIKControl GetDefaultedRiderHandIKControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RiderHandIKControl::GetDefaultedRiderHandIKControl(Entity);
}
UFUNCTION()
bool RemoveRiderHandIKControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RiderHandIKControl);
}
}
FECSMonitorRuntimeView __GetMonitorRiderHandIKControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RiderHandIKControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderHandIKControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RiderHandIKControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderHandIKControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RiderHandIKControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderHandIKControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RiderHandIKControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderHandIKControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RiderHandIKControl, bFixedFrame, bMustHandleAll);
}
void __MonitorRiderHandIKControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RiderHandIKControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRiderHandIKControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RiderHandIKControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRiderHandIKControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RiderHandIKControl, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_RiderHandIKControl &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_RiderHandIKControl &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RiderHandIKControl &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RiderHandIKControl
{
int __IndexOf_Weight()
{
    return 0;
}
int __IndexOf_LeftHandWeight()
{
    return 1;
}
int __IndexOf_RightHandWeight()
{
    return 2;
}
int __IndexOf_TargetWeight()
{
    return 3;
}
int __IndexOf_TargetLeftHandWeight()
{
    return 4;
}
int __IndexOf_TargetRightHandWeight()
{
    return 5;
}
}
