
namespace __INTENRAL_FC_AnimPostProcessEnable_NS
{
    const TECSComponentDerivedPtr<FC_AnimPostProcessEnable> DerivedPtr = TECSComponentDerivedPtr<FC_AnimPostProcessEnable>();
    const FC_AnimPostProcessEnable DefaultValue = FC_AnimPostProcessEnable();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimPostProcessEnableRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_AnimPostProcessEnable : FECSComponent
{
    FRootDirtyFlags32 __DirtyFlags;
    UPROPERTY()
    int m_SteeringCount;
    UPROPERTY()
    int m_OrientationWarpingCount;
    UPROPERTY()
    int m_SteeringAOCount;
    UPROPERTY()
    int m_OffsetRootBoneCount;
    UPROPERTY()
    int m_StrafeMoveLeanCount;
    UPROPERTY()
    int m_NaviMoveLeanCount;
    UPROPERTY()
    int m_NaviDynamicMoveLeanCount;
    UPROPERTY()
    int m_FootPlacementCount;
    UPROPERTY()
    bool m_bEnableSteering;
    UPROPERTY()
    bool m_bEnableOrientationWarping;
    UPROPERTY()
    bool m_bEnableSteeringAO;
    UPROPERTY()
    bool m_bEnableOffsetRootBone;
    UPROPERTY()
    bool m_bEnableStrafeMoveLean;
    UPROPERTY()
    bool m_bEnableNaviMoveLean;
    UPROPERTY()
    bool m_bEnableNaviDynamicMoveLean;
    UPROPERTY()
    bool m_bEnableFootPlacement;

    FC_AnimPostProcessEnable()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimPostProcessEnable(const FC_AnimPostProcessEnable &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimPostProcessEnable opAssign(const FC_AnimPostProcessEnable &inout Other)
    {
        FC_AnimPostProcessEnable __r;
        this.SetSteeringCount(Other.GetSteeringCount());
        this.SetOrientationWarpingCount(Other.GetOrientationWarpingCount());
        this.SetSteeringAOCount(Other.GetSteeringAOCount());
        this.SetOffsetRootBoneCount(Other.GetOffsetRootBoneCount());
        this.SetStrafeMoveLeanCount(Other.GetStrafeMoveLeanCount());
        this.SetNaviMoveLeanCount(Other.GetNaviMoveLeanCount());
        this.SetNaviDynamicMoveLeanCount(Other.GetNaviDynamicMoveLeanCount());
        this.SetFootPlacementCount(Other.GetFootPlacementCount());
        this.SetbEnableSteering(Other.GetbEnableSteering());
        this.SetbEnableOrientationWarping(Other.GetbEnableOrientationWarping());
        this.SetbEnableSteeringAO(Other.GetbEnableSteeringAO());
        this.SetbEnableOffsetRootBone(Other.GetbEnableOffsetRootBone());
        this.SetbEnableStrafeMoveLean(Other.GetbEnableStrafeMoveLean());
        this.SetbEnableNaviMoveLean(Other.GetbEnableNaviMoveLean());
        this.SetbEnableNaviDynamicMoveLean(Other.GetbEnableNaviDynamicMoveLean());
        this.SetbEnableFootPlacement(Other.GetbEnableFootPlacement());
        return __r;
    }
    int GetSteeringCount() const property
    {
        return this.m_SteeringCount;
    }
    void SetSteeringCount(const int __Value) property
    {
        if (this.m_SteeringCount == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SteeringCount = __Value;
        return;
    }
    int GetOrientationWarpingCount() const property
    {
        return this.m_OrientationWarpingCount;
    }
    void SetOrientationWarpingCount(const int __Value) property
    {
        if (this.m_OrientationWarpingCount == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_OrientationWarpingCount = __Value;
        return;
    }
    int GetSteeringAOCount() const property
    {
        return this.m_SteeringAOCount;
    }
    void SetSteeringAOCount(const int __Value) property
    {
        if (this.m_SteeringAOCount == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_SteeringAOCount = __Value;
        return;
    }
    int GetOffsetRootBoneCount() const property
    {
        return this.m_OffsetRootBoneCount;
    }
    void SetOffsetRootBoneCount(const int __Value) property
    {
        if (this.m_OffsetRootBoneCount == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_OffsetRootBoneCount = __Value;
        return;
    }
    int GetStrafeMoveLeanCount() const property
    {
        return this.m_StrafeMoveLeanCount;
    }
    void SetStrafeMoveLeanCount(const int __Value) property
    {
        if (this.m_StrafeMoveLeanCount == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_StrafeMoveLeanCount = __Value;
        return;
    }
    int GetNaviMoveLeanCount() const property
    {
        return this.m_NaviMoveLeanCount;
    }
    void SetNaviMoveLeanCount(const int __Value) property
    {
        if (this.m_NaviMoveLeanCount == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_NaviMoveLeanCount = __Value;
        return;
    }
    int GetNaviDynamicMoveLeanCount() const property
    {
        return this.m_NaviDynamicMoveLeanCount;
    }
    void SetNaviDynamicMoveLeanCount(const int __Value) property
    {
        if (this.m_NaviDynamicMoveLeanCount == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_NaviDynamicMoveLeanCount = __Value;
        return;
    }
    int GetFootPlacementCount() const property
    {
        return this.m_FootPlacementCount;
    }
    void SetFootPlacementCount(const int __Value) property
    {
        if (this.m_FootPlacementCount == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_FootPlacementCount = __Value;
        return;
    }
    bool GetbEnableSteering() const property
    {
        return this.m_bEnableSteering;
    }
    void SetbEnableSteering(const bool __Value) property
    {
        if (!(this.m_bEnableSteering) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_bEnableSteering = __Value;
        return;
    }
    bool GetbEnableOrientationWarping() const property
    {
        return this.m_bEnableOrientationWarping;
    }
    void SetbEnableOrientationWarping(const bool __Value) property
    {
        if (!(this.m_bEnableOrientationWarping) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_bEnableOrientationWarping = __Value;
        return;
    }
    bool GetbEnableSteeringAO() const property
    {
        return this.m_bEnableSteeringAO;
    }
    void SetbEnableSteeringAO(const bool __Value) property
    {
        if (!(this.m_bEnableSteeringAO) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_bEnableSteeringAO = __Value;
        return;
    }
    bool GetbEnableOffsetRootBone() const property
    {
        return this.m_bEnableOffsetRootBone;
    }
    void SetbEnableOffsetRootBone(const bool __Value) property
    {
        if (!(this.m_bEnableOffsetRootBone) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_bEnableOffsetRootBone = __Value;
        return;
    }
    bool GetbEnableStrafeMoveLean() const property
    {
        return this.m_bEnableStrafeMoveLean;
    }
    void SetbEnableStrafeMoveLean(const bool __Value) property
    {
        if (!(this.m_bEnableStrafeMoveLean) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_bEnableStrafeMoveLean = __Value;
        return;
    }
    bool GetbEnableNaviMoveLean() const property
    {
        return this.m_bEnableNaviMoveLean;
    }
    void SetbEnableNaviMoveLean(const bool __Value) property
    {
        if (!(this.m_bEnableNaviMoveLean) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(13);
        this.m_bEnableNaviMoveLean = __Value;
        return;
    }
    bool GetbEnableNaviDynamicMoveLean() const property
    {
        return this.m_bEnableNaviDynamicMoveLean;
    }
    void SetbEnableNaviDynamicMoveLean(const bool __Value) property
    {
        if (!(this.m_bEnableNaviDynamicMoveLean) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_bEnableNaviDynamicMoveLean = __Value;
        return;
    }
    bool GetbEnableFootPlacement() const property
    {
        return this.m_bEnableFootPlacement;
    }
    void SetbEnableFootPlacement(const bool __Value) property
    {
        if (!(this.m_bEnableFootPlacement) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(15);
        this.m_bEnableFootPlacement = __Value;
        return;
    }
}

namespace FC_AnimPostProcessEnable
{
FC_AnimPostProcessEnable Interpolate(const FC_AnimPostProcessEnable &inout A, const FC_AnimPostProcessEnable &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimPostProcessEnable local_12;
    local_12.SetbEnableSteering(B.GetbEnableSteering());
    local_12.SetbEnableOrientationWarping(B.GetbEnableOrientationWarping());
    local_12.SetbEnableSteeringAO(B.GetbEnableSteeringAO());
    local_12.SetbEnableOffsetRootBone(B.GetbEnableOffsetRootBone());
    local_12.SetbEnableStrafeMoveLean(B.GetbEnableStrafeMoveLean());
    local_12.SetbEnableNaviMoveLean(B.GetbEnableNaviMoveLean());
    local_12.SetbEnableNaviDynamicMoveLean(B.GetbEnableNaviDynamicMoveLean());
    local_12.SetbEnableFootPlacement(B.GetbEnableFootPlacement());
    return local_12;
}
}
namespace ECSFunc_FC_AnimPostProcessEnable
{
UFUNCTION()
bool HasAnimPostProcessEnable(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimPostProcessEnable);
}
FC_AnimPostProcessEnable& AssignAnimPostProcessEnable(const FECSEntity &inout Entity, const FC_AnimPostProcessEnable &inout DefaultValue = FC_AnimPostProcessEnable())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimPostProcessEnable, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimPostProcessEnable_BP(const FECSEntity &inout Entity, const FC_AnimPostProcessEnable &inout DefaultValue = FC_AnimPostProcessEnable())
{
    ECSFunc_FC_AnimPostProcessEnable::AssignAnimPostProcessEnable(Entity, DefaultValue);
    return;
}
FC_AnimPostProcessEnable& ModifyAnimPostProcessEnable(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimPostProcessEnable));
    return local_12.GetComp();
}
FC_AnimPostProcessEnable& ModifyOrAddAnimPostProcessEnable(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimPostProcessEnable));
    return local_12.GetComp();
}
const FC_AnimPostProcessEnable& GetAnimPostProcessEnable(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimPostProcessEnable));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimPostProcessEnable GetAnimPostProcessEnable_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimPostProcessEnable& local_4 = ECSFunc_FC_AnimPostProcessEnable::GetAnimPostProcessEnable(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimPostProcessEnable();
}
const FC_AnimPostProcessEnable GetDefaultedAnimPostProcessEnable(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimPostProcessEnable __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimPostProcessEnable);
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
FC_AnimPostProcessEnable GetDefaultedAnimPostProcessEnable_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimPostProcessEnable::GetDefaultedAnimPostProcessEnable(Entity);
}
UFUNCTION()
bool RemoveAnimPostProcessEnable(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimPostProcessEnable);
}
}
FECSMonitorRuntimeView __GetMonitorAnimPostProcessEnableOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimPostProcessEnable, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimPostProcessEnableOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimPostProcessEnable, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimPostProcessEnableOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimPostProcessEnable, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimPostProcessEnableOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimPostProcessEnable, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimPostProcessEnableOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimPostProcessEnable, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimPostProcessEnableLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimPostProcessEnable, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimPostProcessEnableActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimPostProcessEnable, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimPostProcessEnableModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimPostProcessEnable, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags32 GetDirtyFlags(FC_AnimPostProcessEnable &inout Data)
{
    FRootDirtyFlags32 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimPostProcessEnable &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimPostProcessEnable &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimPostProcessEnable
{
int __IndexOf_SteeringCount()
{
    return 0;
}
int __IndexOf_OrientationWarpingCount()
{
    return 1;
}
int __IndexOf_SteeringAOCount()
{
    return 2;
}
int __IndexOf_OffsetRootBoneCount()
{
    return 3;
}
int __IndexOf_StrafeMoveLeanCount()
{
    return 4;
}
int __IndexOf_NaviMoveLeanCount()
{
    return 5;
}
int __IndexOf_NaviDynamicMoveLeanCount()
{
    return 6;
}
int __IndexOf_FootPlacementCount()
{
    return 7;
}
int __IndexOf_bEnableSteering()
{
    return 8;
}
int __IndexOf_bEnableOrientationWarping()
{
    return 9;
}
int __IndexOf_bEnableSteeringAO()
{
    return 10;
}
int __IndexOf_bEnableOffsetRootBone()
{
    return 11;
}
int __IndexOf_bEnableStrafeMoveLean()
{
    return 12;
}
int __IndexOf_bEnableNaviMoveLean()
{
    return 13;
}
int __IndexOf_bEnableNaviDynamicMoveLean()
{
    return 14;
}
int __IndexOf_bEnableFootPlacement()
{
    return 15;
}
}
