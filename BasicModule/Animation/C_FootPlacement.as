
namespace __INTENRAL_FC_FootPlacement_NS
{
    const TECSComponentDerivedPtr<FC_FootPlacement> DerivedPtr = TECSComponentDerivedPtr<FC_FootPlacement>();
    const FC_FootPlacement DefaultValue = FC_FootPlacement();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_FootPlacementRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_FootPlacement : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_EnableCount;
    UPROPERTY()
    float32 m_Weight;

    FC_FootPlacement()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_FootPlacement(const FC_FootPlacement &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_FootPlacement opAssign(const FC_FootPlacement &inout Other)
    {
        FC_FootPlacement __r;
        this.SetEnableCount(Other.GetEnableCount());
        this.SetWeight(Other.GetWeight());
        return __r;
    }
    int GetEnableCount() const property
    {
        return this.m_EnableCount;
    }
    void SetEnableCount(const int __Value) property
    {
        if (this.m_EnableCount == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_EnableCount = __Value;
        return;
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
        this.__MarkDirty(1);
        this.m_Weight = __Value;
        return;
    }
}

namespace FC_FootPlacement
{
FC_FootPlacement Interpolate(const FC_FootPlacement &inout A, const FC_FootPlacement &inout B, const float32 T, const float32 DeltaTime)
{
    FC_FootPlacement local_4;
    local_4.SetWeight(FMath::Lerp(A.GetWeight(), B.GetWeight(), T));
    return local_4;
}
}
namespace ECSFunc_FC_FootPlacement
{
UFUNCTION()
bool HasFootPlacement(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FootPlacement);
}
FC_FootPlacement& AssignFootPlacement(const FECSEntity &inout Entity, const FC_FootPlacement &inout DefaultValue = FC_FootPlacement())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FootPlacement, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFootPlacement_BP(const FECSEntity &inout Entity, const FC_FootPlacement &inout DefaultValue = FC_FootPlacement())
{
    ECSFunc_FC_FootPlacement::AssignFootPlacement(Entity, DefaultValue);
    return;
}
FC_FootPlacement& ModifyFootPlacement(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FootPlacement));
    return local_12.GetComp();
}
FC_FootPlacement& ModifyOrAddFootPlacement(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FootPlacement));
    return local_12.GetComp();
}
const FC_FootPlacement& GetFootPlacement(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FootPlacement));
    return local_12.GetComp();
}
UFUNCTION()
FC_FootPlacement GetFootPlacement_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_FootPlacement& local_4 = ECSFunc_FC_FootPlacement::GetFootPlacement(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_FootPlacement();
}
const FC_FootPlacement GetDefaultedFootPlacement(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FootPlacement __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FootPlacement);
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
FC_FootPlacement GetDefaultedFootPlacement_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_FootPlacement::GetDefaultedFootPlacement(Entity);
}
UFUNCTION()
bool RemoveFootPlacement(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FootPlacement);
}
}
FECSMonitorRuntimeView __GetMonitorFootPlacementOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FootPlacement, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootPlacementOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FootPlacement, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootPlacementOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FootPlacement, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootPlacementOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FootPlacement, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootPlacementOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FootPlacement, bFixedFrame, bMustHandleAll);
}
void __MonitorFootPlacementLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FootPlacement, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFootPlacementActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FootPlacement, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFootPlacementModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FootPlacement, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_FootPlacement &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_FootPlacement &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_FootPlacement &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_FootPlacement
{
int __IndexOf_EnableCount()
{
    return 0;
}
int __IndexOf_Weight()
{
    return 1;
}
}
