
namespace __INTENRAL_FC_RuntimeSplineMoveTarget_NS
{
    const TECSComponentDerivedPtr<FC_RuntimeSplineMoveTarget> DerivedPtr = TECSComponentDerivedPtr<FC_RuntimeSplineMoveTarget>();
    const FC_RuntimeSplineMoveTarget DefaultValue = FC_RuntimeSplineMoveTarget();
}
namespace __INTENRAL_FC_RuntimeSplineMoveState_NS
{
    const TECSComponentDerivedPtr<FC_RuntimeSplineMoveState> DerivedPtr = TECSComponentDerivedPtr<FC_RuntimeSplineMoveState>();
    const FC_RuntimeSplineMoveState DefaultValue = FC_RuntimeSplineMoveState();
}
namespace __INTENRAL_FC_SplineMoveConfig_NS
{
    const TECSComponentDerivedPtr<FC_SplineMoveConfig> DerivedPtr = TECSComponentDerivedPtr<FC_SplineMoveConfig>();
    const FC_SplineMoveConfig DefaultValue = FC_SplineMoveConfig();
}
namespace __INTENRAL_FC_SplineInfo_NS
{
    const TECSComponentDerivedPtr<FC_SplineInfo> DerivedPtr = TECSComponentDerivedPtr<FC_SplineInfo>();
    const FC_SplineInfo DefaultValue = FC_SplineInfo();
}
namespace __INTENRAL_FC_SuperHookFlyItemConfig_NS
{
    const TECSComponentDerivedPtr<FC_SuperHookFlyItemConfig> DerivedPtr = TECSComponentDerivedPtr<FC_SuperHookFlyItemConfig>();
    const FC_SuperHookFlyItemConfig DefaultValue = FC_SuperHookFlyItemConfig();
}
namespace __INTENRAL_FC_SuperHookFlyItem_NS
{
    const TECSComponentDerivedPtr<FC_SuperHookFlyItem> DerivedPtr = TECSComponentDerivedPtr<FC_SuperHookFlyItem>();
    const FC_SuperHookFlyItem DefaultValue = FC_SuperHookFlyItem();

}
struct FC_RuntimeSplineMoveTarget : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_SplineEntity;
    UPROPERTY()
    float32 m_MoveSpeed;
    UPROPERTY()
    FVector m_TargetLocation;

    FC_RuntimeSplineMoveTarget()
    {
        this.m_SplineEntity = ENTITY_NULL;
        this.m_MoveSpeed = -1.0f;
        this.__InitDirtyFlags();
        return;
    }
    FC_RuntimeSplineMoveTarget(const FC_RuntimeSplineMoveTarget &inout Other)
    {
        this.m_SplineEntity = ENTITY_NULL;
        this.m_MoveSpeed = -1.0f;
        this.__InitDirtyFlags();
        this.m_SplineEntity = Other.m_SplineEntity;
        this.m_MoveSpeed = Other.m_MoveSpeed;
        this.m_TargetLocation = Other.m_TargetLocation;
        return;
    }
    FC_RuntimeSplineMoveTarget opAssign(const FC_RuntimeSplineMoveTarget &inout Other)
    {
        FC_RuntimeSplineMoveTarget __r;
        this.SetSplineEntity(Other.GetSplineEntity());
        this.SetMoveSpeed(Other.GetMoveSpeed());
        this.SetTargetLocation(Other.GetTargetLocation());
        return __r;
    }
    const FECSEntity GetSplineEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_SplineEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetSplineEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SplineEntity = __Value;
        return;
    }
    float32 GetMoveSpeed() const property
    {
        return this.m_MoveSpeed;
    }
    void SetMoveSpeed(const float32 __Value) property
    {
        if (this.m_MoveSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MoveSpeed = __Value;
        return;
    }
    const FVector GetTargetLocation() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TargetLocation() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetTargetLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_TargetLocation = __Value;
        return;
    }
}

struct FC_RuntimeSplineMoveState : FECSComponent
{
    FRootDirtyFlags32 __DirtyFlags;
    UPROPERTY()
    bool m_bIsMoving;
    UPROPERTY()
    bool m_bUseRootMotionSpeed;
    UPROPERTY()
    bool m_bMovingToStart;
    UPROPERTY()
    float32 m_RootMotionSpeedPct;
    UPROPERTY()
    FECSEntity m_SplineEntity;
    UPROPERTY()
    float32 m_DistanceOnSpline;
    UPROPERTY()
    float32 m_SplineTotalLength;
    UPROPERTY()
    float32 m_ConfigSpeed;
    UPROPERTY()
    int m_CurrentOffsetIndex;
    UPROPERTY()
    FVector m_StartLocationOnSpline;
    UPROPERTY()
    bool m_bReachedPeak;
    UPROPERTY()
    float32 m_PeakDistanceOnSpline;
    UPROPERTY()
    FVector m_FallToEndVelocity;
    UPROPERTY()
    float32 m_FallToEndAccelerationZ;
    UPROPERTY()
    float32 m_FallToEndTimeLeft;
    UPROPERTY()
    bool m_bHasSpeedFromCurve;
    UPROPERTY()
    float32 m_StartSpeedOnFromCurve;
    UPROPERTY()
    float32 m_SpeedFromCurve;
    UPROPERTY()
    FFPTime m_SpeedCurveStartTime;

    FC_RuntimeSplineMoveState()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RuntimeSplineMoveState(const FC_RuntimeSplineMoveState &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RuntimeSplineMoveState opAssign(const FC_RuntimeSplineMoveState &inout Other)
    {
        FC_RuntimeSplineMoveState __r;
        this.SetbIsMoving(Other.GetbIsMoving());
        this.SetbUseRootMotionSpeed(Other.GetbUseRootMotionSpeed());
        this.SetbMovingToStart(Other.GetbMovingToStart());
        this.SetRootMotionSpeedPct(Other.GetRootMotionSpeedPct());
        this.SetSplineEntity(Other.GetSplineEntity());
        this.SetDistanceOnSpline(Other.GetDistanceOnSpline());
        this.SetSplineTotalLength(Other.GetSplineTotalLength());
        this.SetConfigSpeed(Other.GetConfigSpeed());
        this.SetCurrentOffsetIndex(Other.GetCurrentOffsetIndex());
        this.SetStartLocationOnSpline(Other.GetStartLocationOnSpline());
        this.SetbReachedPeak(Other.GetbReachedPeak());
        this.SetPeakDistanceOnSpline(Other.GetPeakDistanceOnSpline());
        this.SetFallToEndVelocity(Other.GetFallToEndVelocity());
        this.SetFallToEndAccelerationZ(Other.GetFallToEndAccelerationZ());
        this.SetFallToEndTimeLeft(Other.GetFallToEndTimeLeft());
        this.SetbHasSpeedFromCurve(Other.GetbHasSpeedFromCurve());
        this.SetStartSpeedOnFromCurve(Other.GetStartSpeedOnFromCurve());
        this.SetSpeedFromCurve(Other.GetSpeedFromCurve());
        this.SetSpeedCurveStartTime(Other.GetSpeedCurveStartTime());
        return __r;
    }
    bool GetbIsMoving() const property
    {
        return this.m_bIsMoving;
    }
    void SetbIsMoving(const bool __Value) property
    {
        if (!(this.m_bIsMoving) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bIsMoving = __Value;
        return;
    }
    bool GetbUseRootMotionSpeed() const property
    {
        return this.m_bUseRootMotionSpeed;
    }
    void SetbUseRootMotionSpeed(const bool __Value) property
    {
        if (!(this.m_bUseRootMotionSpeed) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bUseRootMotionSpeed = __Value;
        return;
    }
    bool GetbMovingToStart() const property
    {
        return this.m_bMovingToStart;
    }
    void SetbMovingToStart(const bool __Value) property
    {
        if (!(this.m_bMovingToStart) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bMovingToStart = __Value;
        return;
    }
    float32 GetRootMotionSpeedPct() const property
    {
        return this.m_RootMotionSpeedPct;
    }
    void SetRootMotionSpeedPct(const float32 __Value) property
    {
        if (this.m_RootMotionSpeedPct == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_RootMotionSpeedPct = __Value;
        return;
    }
    const FECSEntity GetSplineEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_SplineEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetSplineEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_SplineEntity = __Value;
        return;
    }
    float32 GetDistanceOnSpline() const property
    {
        return this.m_DistanceOnSpline;
    }
    void SetDistanceOnSpline(const float32 __Value) property
    {
        if (this.m_DistanceOnSpline == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_DistanceOnSpline = __Value;
        return;
    }
    float32 GetSplineTotalLength() const property
    {
        return this.m_SplineTotalLength;
    }
    void SetSplineTotalLength(const float32 __Value) property
    {
        if (this.m_SplineTotalLength == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_SplineTotalLength = __Value;
        return;
    }
    float32 GetConfigSpeed() const property
    {
        return this.m_ConfigSpeed;
    }
    void SetConfigSpeed(const float32 __Value) property
    {
        if (this.m_ConfigSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_ConfigSpeed = __Value;
        return;
    }
    int GetCurrentOffsetIndex() const property
    {
        return this.m_CurrentOffsetIndex;
    }
    void SetCurrentOffsetIndex(const int __Value) property
    {
        if (this.m_CurrentOffsetIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_CurrentOffsetIndex = __Value;
        return;
    }
    const FVector GetStartLocationOnSpline() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_StartLocationOnSpline() property
    {
        FVector __r;
        this.__MarkDirty(9);
        return __r;
    }
    void SetStartLocationOnSpline(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_StartLocationOnSpline = __Value;
        return;
    }
    bool GetbReachedPeak() const property
    {
        return this.m_bReachedPeak;
    }
    void SetbReachedPeak(const bool __Value) property
    {
        if (!(this.m_bReachedPeak) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_bReachedPeak = __Value;
        return;
    }
    float32 GetPeakDistanceOnSpline() const property
    {
        return this.m_PeakDistanceOnSpline;
    }
    void SetPeakDistanceOnSpline(const float32 __Value) property
    {
        if (this.m_PeakDistanceOnSpline == __Value)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_PeakDistanceOnSpline = __Value;
        return;
    }
    const FVector GetFallToEndVelocity() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_FallToEndVelocity() property
    {
        FVector __r;
        this.__MarkDirty(12);
        return __r;
    }
    void SetFallToEndVelocity(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_FallToEndVelocity = __Value;
        return;
    }
    float32 GetFallToEndAccelerationZ() const property
    {
        return this.m_FallToEndAccelerationZ;
    }
    void SetFallToEndAccelerationZ(const float32 __Value) property
    {
        if (this.m_FallToEndAccelerationZ == __Value)
        {
            return;
        }
        this.__MarkDirty(13);
        this.m_FallToEndAccelerationZ = __Value;
        return;
    }
    float32 GetFallToEndTimeLeft() const property
    {
        return this.m_FallToEndTimeLeft;
    }
    void SetFallToEndTimeLeft(const float32 __Value) property
    {
        if (this.m_FallToEndTimeLeft == __Value)
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_FallToEndTimeLeft = __Value;
        return;
    }
    bool GetbHasSpeedFromCurve() const property
    {
        return this.m_bHasSpeedFromCurve;
    }
    void SetbHasSpeedFromCurve(const bool __Value) property
    {
        if (!(this.m_bHasSpeedFromCurve) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(15);
        this.m_bHasSpeedFromCurve = __Value;
        return;
    }
    float32 GetStartSpeedOnFromCurve() const property
    {
        return this.m_StartSpeedOnFromCurve;
    }
    void SetStartSpeedOnFromCurve(const float32 __Value) property
    {
        if (this.m_StartSpeedOnFromCurve == __Value)
        {
            return;
        }
        this.__MarkDirty(16);
        this.m_StartSpeedOnFromCurve = __Value;
        return;
    }
    float32 GetSpeedFromCurve() const property
    {
        return this.m_SpeedFromCurve;
    }
    void SetSpeedFromCurve(const float32 __Value) property
    {
        if (this.m_SpeedFromCurve == __Value)
        {
            return;
        }
        this.__MarkDirty(17);
        this.m_SpeedFromCurve = __Value;
        return;
    }
    const FFPTime GetSpeedCurveStartTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_SpeedCurveStartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(18);
        return __r;
    }
    void SetSpeedCurveStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(18);
        this.m_SpeedCurveStartTime = __Value;
        return;
    }
}

struct FC_SplineMoveConfig : FECSComponent
{
    UPROPERTY()
    float32 StartDistanceOnSpline;
    UPROPERTY()
    TArray<FVector> SplineOffsets;

    FC_SplineMoveConfig()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

struct FC_SplineInfo : FECSComponent
{
    UPROPERTY()
    FString Tag;
    UPROPERTY()
    TSoftObjectPtr<AECSPrefab> SplinePrefab = nullptr;
    UPROPERTY()
    float32 PeekPointSplineDistance = 0.0f;


    USplineComponent GetSpline() const
    {
        ASplinePointPrefab local_4;
        if (this.SplinePrefab.IsValid())
        {
            AECSPrefab local_6;
            local_4 = (Cast<ASplinePointPrefab>(local_6));
            if (local_4 != nullptr)
            {
                return local_4.Spline;
            }
        }
        return nullptr;
    }
}

struct FSuperHookFlyMovementConfig
{
    UPROPERTY()
    float32 OffsetZ = 0.0f;
    UPROPERTY()
    FRuntimeFloatCurve DistanceCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 1.0f);
    UPROPERTY()
    float32 DistanceCurveTime = 1.0f;
    UPROPERTY()
    float32 DistanceCurveValuePct = 1.0f;


}

struct FC_SuperHookFlyItemConfig : FECSComponent
{
    UPROPERTY()
    TSoftClassPtr<AECSPrefab> Prefab;
    UPROPERTY()
    FSuperHookFlyMovementConfig MovementConfig;

    FC_SuperHookFlyItemConfig()
    {
        return;
    }
}

struct FC_SuperHookFlyItem : FECSComponent
{
    UPROPERTY()
    FECSEntity OwnerPlayerEntity;
    UPROPERTY()
    FECSEntity SplinePointEntity;
    UPROPERTY()
    FFPTime StartTime;
    UPROPERTY()
    float32 DistanceAtSpline = 0.0f;
    UPROPERTY()
    FSuperHookFlyMovementConfig MovementConfig;
    UPROPERTY()
    TWeakObjectPtr<USplineComponent> Spline;


}

namespace ECSFunc_FC_RuntimeSplineMoveTarget
{
UFUNCTION()
bool HasRuntimeSplineMoveTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RuntimeSplineMoveTarget);
}
FC_RuntimeSplineMoveTarget& AssignRuntimeSplineMoveTarget(const FECSEntity &inout Entity, const FC_RuntimeSplineMoveTarget &inout DefaultValue = FC_RuntimeSplineMoveTarget())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RuntimeSplineMoveTarget, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRuntimeSplineMoveTarget_BP(const FECSEntity &inout Entity, const FC_RuntimeSplineMoveTarget &inout DefaultValue = FC_RuntimeSplineMoveTarget())
{
    ECSFunc_FC_RuntimeSplineMoveTarget::AssignRuntimeSplineMoveTarget(Entity, DefaultValue);
    return;
}
FC_RuntimeSplineMoveTarget& ModifyRuntimeSplineMoveTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RuntimeSplineMoveTarget));
    return local_12.GetComp();
}
FC_RuntimeSplineMoveTarget& ModifyOrAddRuntimeSplineMoveTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RuntimeSplineMoveTarget));
    return local_12.GetComp();
}
const FC_RuntimeSplineMoveTarget& GetRuntimeSplineMoveTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RuntimeSplineMoveTarget));
    return local_12.GetComp();
}
UFUNCTION()
FC_RuntimeSplineMoveTarget GetRuntimeSplineMoveTarget_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RuntimeSplineMoveTarget& local_4 = ECSFunc_FC_RuntimeSplineMoveTarget::GetRuntimeSplineMoveTarget(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RuntimeSplineMoveTarget();
}
const FC_RuntimeSplineMoveTarget GetDefaultedRuntimeSplineMoveTarget(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RuntimeSplineMoveTarget __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RuntimeSplineMoveTarget);
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
FC_RuntimeSplineMoveTarget GetDefaultedRuntimeSplineMoveTarget_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RuntimeSplineMoveTarget::GetDefaultedRuntimeSplineMoveTarget(Entity);
}
UFUNCTION()
bool RemoveRuntimeSplineMoveTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RuntimeSplineMoveTarget);
}
}
FECSMonitorRuntimeView __GetMonitorRuntimeSplineMoveTargetOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RuntimeSplineMoveTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeSplineMoveTargetOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RuntimeSplineMoveTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeSplineMoveTargetOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RuntimeSplineMoveTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeSplineMoveTargetOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RuntimeSplineMoveTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeSplineMoveTargetOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RuntimeSplineMoveTarget, bFixedFrame, bMustHandleAll);
}
void __MonitorRuntimeSplineMoveTargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RuntimeSplineMoveTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRuntimeSplineMoveTargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RuntimeSplineMoveTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRuntimeSplineMoveTargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RuntimeSplineMoveTarget, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_RuntimeSplineMoveState
{
UFUNCTION()
bool HasRuntimeSplineMoveState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RuntimeSplineMoveState);
}
FC_RuntimeSplineMoveState& AssignRuntimeSplineMoveState(const FECSEntity &inout Entity, const FC_RuntimeSplineMoveState &inout DefaultValue = FC_RuntimeSplineMoveState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RuntimeSplineMoveState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRuntimeSplineMoveState_BP(const FECSEntity &inout Entity, const FC_RuntimeSplineMoveState &inout DefaultValue = FC_RuntimeSplineMoveState())
{
    ECSFunc_FC_RuntimeSplineMoveState::AssignRuntimeSplineMoveState(Entity, DefaultValue);
    return;
}
FC_RuntimeSplineMoveState& ModifyRuntimeSplineMoveState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RuntimeSplineMoveState));
    return local_12.GetComp();
}
FC_RuntimeSplineMoveState& ModifyOrAddRuntimeSplineMoveState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RuntimeSplineMoveState));
    return local_12.GetComp();
}
const FC_RuntimeSplineMoveState& GetRuntimeSplineMoveState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RuntimeSplineMoveState));
    return local_12.GetComp();
}
UFUNCTION()
FC_RuntimeSplineMoveState GetRuntimeSplineMoveState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RuntimeSplineMoveState& local_4 = ECSFunc_FC_RuntimeSplineMoveState::GetRuntimeSplineMoveState(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RuntimeSplineMoveState();
}
const FC_RuntimeSplineMoveState GetDefaultedRuntimeSplineMoveState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RuntimeSplineMoveState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RuntimeSplineMoveState);
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
FC_RuntimeSplineMoveState GetDefaultedRuntimeSplineMoveState_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RuntimeSplineMoveState::GetDefaultedRuntimeSplineMoveState(Entity);
}
UFUNCTION()
bool RemoveRuntimeSplineMoveState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RuntimeSplineMoveState);
}
}
FECSMonitorRuntimeView __GetMonitorRuntimeSplineMoveStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RuntimeSplineMoveState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeSplineMoveStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RuntimeSplineMoveState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeSplineMoveStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RuntimeSplineMoveState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeSplineMoveStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RuntimeSplineMoveState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeSplineMoveStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RuntimeSplineMoveState, bFixedFrame, bMustHandleAll);
}
void __MonitorRuntimeSplineMoveStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RuntimeSplineMoveState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRuntimeSplineMoveStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RuntimeSplineMoveState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRuntimeSplineMoveStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RuntimeSplineMoveState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SplineMoveConfig
{
UFUNCTION()
bool HasSplineMoveConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SplineMoveConfig);
}
FC_SplineMoveConfig& AssignSplineMoveConfig(const FECSEntity &inout Entity, const FC_SplineMoveConfig &inout DefaultValue = FC_SplineMoveConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SplineMoveConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSplineMoveConfig_BP(const FECSEntity &inout Entity, const FC_SplineMoveConfig &inout DefaultValue = FC_SplineMoveConfig())
{
    ECSFunc_FC_SplineMoveConfig::AssignSplineMoveConfig(Entity, DefaultValue);
    return;
}
FC_SplineMoveConfig& ModifySplineMoveConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SplineMoveConfig));
    return local_12.GetComp();
}
FC_SplineMoveConfig& ModifyOrAddSplineMoveConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SplineMoveConfig));
    return local_12.GetComp();
}
const FC_SplineMoveConfig& GetSplineMoveConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SplineMoveConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_SplineMoveConfig GetSplineMoveConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SplineMoveConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_SplineMoveConfig::GetSplineMoveConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SplineMoveConfig GetDefaultedSplineMoveConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SplineMoveConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SplineMoveConfig);
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
FC_SplineMoveConfig GetDefaultedSplineMoveConfig_BP(const FECSEntity &inout Entity)
{
    FC_SplineMoveConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveSplineMoveConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SplineMoveConfig);
}
}
FECSMonitorRuntimeView __GetMonitorSplineMoveConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SplineMoveConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSplineMoveConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SplineMoveConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSplineMoveConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SplineMoveConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSplineMoveConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SplineMoveConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSplineMoveConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SplineMoveConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorSplineMoveConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SplineMoveConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSplineMoveConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SplineMoveConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSplineMoveConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SplineMoveConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SplineInfo
{
UFUNCTION()
bool HasSplineInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SplineInfo);
}
FC_SplineInfo& AssignSplineInfo(const FECSEntity &inout Entity, const FC_SplineInfo &inout DefaultValue = FC_SplineInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SplineInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSplineInfo_BP(const FECSEntity &inout Entity, const FC_SplineInfo &inout DefaultValue = FC_SplineInfo())
{
    ECSFunc_FC_SplineInfo::AssignSplineInfo(Entity, DefaultValue);
    return;
}
FC_SplineInfo& ModifySplineInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SplineInfo));
    return local_12.GetComp();
}
FC_SplineInfo& ModifyOrAddSplineInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SplineInfo));
    return local_12.GetComp();
}
const FC_SplineInfo& GetSplineInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SplineInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_SplineInfo GetSplineInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SplineInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_SplineInfo::GetSplineInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SplineInfo GetDefaultedSplineInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SplineInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SplineInfo);
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
FC_SplineInfo GetDefaultedSplineInfo_BP(const FECSEntity &inout Entity)
{
    FC_SplineInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveSplineInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SplineInfo);
}
}
FECSMonitorRuntimeView __GetMonitorSplineInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SplineInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSplineInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SplineInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSplineInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SplineInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSplineInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SplineInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSplineInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SplineInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorSplineInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SplineInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSplineInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SplineInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSplineInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SplineInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SuperHookFlyItemConfig
{
UFUNCTION()
bool HasSuperHookFlyItemConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SuperHookFlyItemConfig);
}
FC_SuperHookFlyItemConfig& AssignSuperHookFlyItemConfig(const FECSEntity &inout Entity, const FC_SuperHookFlyItemConfig &inout DefaultValue = FC_SuperHookFlyItemConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SuperHookFlyItemConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSuperHookFlyItemConfig_BP(const FECSEntity &inout Entity, const FC_SuperHookFlyItemConfig &inout DefaultValue = FC_SuperHookFlyItemConfig())
{
    ECSFunc_FC_SuperHookFlyItemConfig::AssignSuperHookFlyItemConfig(Entity, DefaultValue);
    return;
}
FC_SuperHookFlyItemConfig& ModifySuperHookFlyItemConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SuperHookFlyItemConfig));
    return local_12.GetComp();
}
FC_SuperHookFlyItemConfig& ModifyOrAddSuperHookFlyItemConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SuperHookFlyItemConfig));
    return local_12.GetComp();
}
const FC_SuperHookFlyItemConfig& GetSuperHookFlyItemConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SuperHookFlyItemConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_SuperHookFlyItemConfig GetSuperHookFlyItemConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SuperHookFlyItemConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_SuperHookFlyItemConfig::GetSuperHookFlyItemConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SuperHookFlyItemConfig GetDefaultedSuperHookFlyItemConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SuperHookFlyItemConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SuperHookFlyItemConfig);
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
FC_SuperHookFlyItemConfig GetDefaultedSuperHookFlyItemConfig_BP(const FECSEntity &inout Entity)
{
    FC_SuperHookFlyItemConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveSuperHookFlyItemConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SuperHookFlyItemConfig);
}
}
FECSMonitorRuntimeView __GetMonitorSuperHookFlyItemConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SuperHookFlyItemConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSuperHookFlyItemConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SuperHookFlyItemConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSuperHookFlyItemConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SuperHookFlyItemConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSuperHookFlyItemConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SuperHookFlyItemConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSuperHookFlyItemConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SuperHookFlyItemConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorSuperHookFlyItemConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SuperHookFlyItemConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSuperHookFlyItemConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SuperHookFlyItemConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSuperHookFlyItemConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SuperHookFlyItemConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SuperHookFlyItem
{
UFUNCTION()
bool HasSuperHookFlyItem(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SuperHookFlyItem);
}
FC_SuperHookFlyItem& AssignSuperHookFlyItem(const FECSEntity &inout Entity, const FC_SuperHookFlyItem &inout DefaultValue = FC_SuperHookFlyItem())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SuperHookFlyItem, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSuperHookFlyItem_BP(const FECSEntity &inout Entity, const FC_SuperHookFlyItem &inout DefaultValue = FC_SuperHookFlyItem())
{
    ECSFunc_FC_SuperHookFlyItem::AssignSuperHookFlyItem(Entity, DefaultValue);
    return;
}
FC_SuperHookFlyItem& ModifySuperHookFlyItem(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SuperHookFlyItem));
    return local_12.GetComp();
}
FC_SuperHookFlyItem& ModifyOrAddSuperHookFlyItem(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SuperHookFlyItem));
    return local_12.GetComp();
}
const FC_SuperHookFlyItem& GetSuperHookFlyItem(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SuperHookFlyItem));
    return local_12.GetComp();
}
UFUNCTION()
FC_SuperHookFlyItem GetSuperHookFlyItem_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SuperHookFlyItem __r;
    bValid = false;
    bValid = ECSFunc_FC_SuperHookFlyItem::GetSuperHookFlyItem(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SuperHookFlyItem GetDefaultedSuperHookFlyItem(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SuperHookFlyItem __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SuperHookFlyItem);
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
FC_SuperHookFlyItem GetDefaultedSuperHookFlyItem_BP(const FECSEntity &inout Entity)
{
    FC_SuperHookFlyItem __r;
    return __r;
}
UFUNCTION()
bool RemoveSuperHookFlyItem(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SuperHookFlyItem);
}
}
FECSMonitorRuntimeView __GetMonitorSuperHookFlyItemOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SuperHookFlyItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSuperHookFlyItemOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SuperHookFlyItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSuperHookFlyItemOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SuperHookFlyItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSuperHookFlyItemOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SuperHookFlyItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSuperHookFlyItemOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SuperHookFlyItem, bFixedFrame, bMustHandleAll);
}
void __MonitorSuperHookFlyItemLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SuperHookFlyItem, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSuperHookFlyItemActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SuperHookFlyItem, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSuperHookFlyItemModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SuperHookFlyItem, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_RuntimeSplineMoveTarget_MoveSpeed(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetMoveSpeed();
    return;
}
void GetEntityBBVar_RuntimeSplineMoveTarget_TargetLocation(const FECSEntity &inout Entity, FVector &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FVector(local_4.opCall().GetTargetLocation());
    return;
}
void GetEntityBBVar_RuntimeSplineMoveState_bIsMoving(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetbIsMoving();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_RuntimeSplineMoveTarget &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_RuntimeSplineMoveTarget &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RuntimeSplineMoveTarget &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RuntimeSplineMoveTarget
{
int __IndexOf_SplineEntity()
{
    return 0;
}
int __IndexOf_MoveSpeed()
{
    return 1;
}
int __IndexOf_TargetLocation()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags32 GetDirtyFlags(FC_RuntimeSplineMoveState &inout Data)
{
    FRootDirtyFlags32 __r;
    return __r;
}
void InitDirtyFlags(FC_RuntimeSplineMoveState &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RuntimeSplineMoveState &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RuntimeSplineMoveState
{
int __IndexOf_bIsMoving()
{
    return 0;
}
int __IndexOf_bUseRootMotionSpeed()
{
    return 1;
}
int __IndexOf_bMovingToStart()
{
    return 2;
}
int __IndexOf_RootMotionSpeedPct()
{
    return 3;
}
int __IndexOf_SplineEntity()
{
    return 4;
}
int __IndexOf_DistanceOnSpline()
{
    return 5;
}
int __IndexOf_SplineTotalLength()
{
    return 6;
}
int __IndexOf_ConfigSpeed()
{
    return 7;
}
int __IndexOf_CurrentOffsetIndex()
{
    return 8;
}
int __IndexOf_StartLocationOnSpline()
{
    return 9;
}
int __IndexOf_bReachedPeak()
{
    return 10;
}
int __IndexOf_PeakDistanceOnSpline()
{
    return 11;
}
int __IndexOf_FallToEndVelocity()
{
    return 12;
}
int __IndexOf_FallToEndAccelerationZ()
{
    return 13;
}
int __IndexOf_FallToEndTimeLeft()
{
    return 14;
}
int __IndexOf_bHasSpeedFromCurve()
{
    return 15;
}
int __IndexOf_StartSpeedOnFromCurve()
{
    return 16;
}
int __IndexOf_SpeedFromCurve()
{
    return 17;
}
int __IndexOf_SpeedCurveStartTime()
{
    return 18;
}
}
