
enum ERotationMode
{
    Navi,
    Strafe,
}

enum EMoveDirection
{
    F,
    B,
    LL,
    LR,
    RL,
    RR,
}

namespace __INTENRAL_FC_CharacterGroundMovementInfo_NS
{
    const TECSComponentDerivedPtr<FC_CharacterGroundMovementInfo> DerivedPtr = TECSComponentDerivedPtr<FC_CharacterGroundMovementInfo>();
    const FC_CharacterGroundMovementInfo DefaultValue = FC_CharacterGroundMovementInfo();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_CharacterGroundMovementInfoRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_CharacterGroundMovementInfo : FECSComponent
{
    FRootDirtyFlags32 __DirtyFlags;
    UPROPERTY()
    float32 m_PivotSpeedMin;
    UPROPERTY()
    float32 m_PivotSpeedMax;
    UPROPERTY()
    float32 m_PivotAngleAtMinSpeed;
    UPROPERTY()
    float32 m_PivotAngleAtMaxSpeed;
    UPROPERTY()
    float32 m_OrientationWarpingFullAngle;
    UPROPERTY()
    float32 m_OrientationWarpingZeroAngle;
    UPROPERTY()
    float32 m_OrientationWarpingIncreaseSpeed;
    UPROPERTY()
    float32 m_OrientationWarpingDecreaseSpeed;
    UPROPERTY()
    bool m_bIsMoving;
    UPROPERTY()
    bool m_bIsPivoting;
    UPROPERTY()
    FVector m_Velocity;
    UPROPERTY()
    FVector m_LastNonZeroVelocity;
    UPROPERTY()
    FVector m_Acceleration;
    UPROPERTY()
    float32 m_MoveSpeed;
    UPROPERTY()
    float32 m_MoveDeltaRotationYaw;
    UPROPERTY()
    FVector m_TransformForwardVector;
    UPROPERTY()
    float32 m_OrientationWarpingAlpha;
    UPROPERTY()
    EMoveDirection m_MoveDirection;
    UPROPERTY()
    ERotationMode m_RotationMode;
    UPROPERTY()
    float32 m_SteeringOffsetYaw;
    UPROPERTY()
    float32 m_SteeringProceduralTargetTime;

    FC_CharacterGroundMovementInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CharacterGroundMovementInfo(const FC_CharacterGroundMovementInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CharacterGroundMovementInfo opAssign(const FC_CharacterGroundMovementInfo &inout Other)
    {
        FC_CharacterGroundMovementInfo __r;
        this.SetPivotSpeedMin(Other.GetPivotSpeedMin());
        this.SetPivotSpeedMax(Other.GetPivotSpeedMax());
        this.SetPivotAngleAtMinSpeed(Other.GetPivotAngleAtMinSpeed());
        this.SetPivotAngleAtMaxSpeed(Other.GetPivotAngleAtMaxSpeed());
        this.SetOrientationWarpingFullAngle(Other.GetOrientationWarpingFullAngle());
        this.SetOrientationWarpingZeroAngle(Other.GetOrientationWarpingZeroAngle());
        this.SetOrientationWarpingIncreaseSpeed(Other.GetOrientationWarpingIncreaseSpeed());
        this.SetOrientationWarpingDecreaseSpeed(Other.GetOrientationWarpingDecreaseSpeed());
        this.SetbIsMoving(Other.GetbIsMoving());
        this.SetbIsPivoting(Other.GetbIsPivoting());
        this.SetVelocity(Other.GetVelocity());
        this.SetLastNonZeroVelocity(Other.GetLastNonZeroVelocity());
        this.SetAcceleration(Other.GetAcceleration());
        this.SetMoveSpeed(Other.GetMoveSpeed());
        this.SetMoveDeltaRotationYaw(Other.GetMoveDeltaRotationYaw());
        this.SetTransformForwardVector(Other.GetTransformForwardVector());
        this.SetOrientationWarpingAlpha(Other.GetOrientationWarpingAlpha());
        this.SetMoveDirection(Other.GetMoveDirection());
        this.SetRotationMode(Other.GetRotationMode());
        this.SetSteeringOffsetYaw(Other.GetSteeringOffsetYaw());
        this.SetSteeringProceduralTargetTime(Other.GetSteeringProceduralTargetTime());
        return __r;
    }
    bool IsMoving() const
    {
        return this.GetbIsMoving();
    }
    bool IsPivoting() const
    {
        return this.GetbIsPivoting();
    }
    float32 GetPivotSpeedMin() const property
    {
        return this.m_PivotSpeedMin;
    }
    void SetPivotSpeedMin(const float32 __Value) property
    {
        if (this.m_PivotSpeedMin == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PivotSpeedMin = __Value;
        return;
    }
    float32 GetPivotSpeedMax() const property
    {
        return this.m_PivotSpeedMax;
    }
    void SetPivotSpeedMax(const float32 __Value) property
    {
        if (this.m_PivotSpeedMax == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_PivotSpeedMax = __Value;
        return;
    }
    float32 GetPivotAngleAtMinSpeed() const property
    {
        return this.m_PivotAngleAtMinSpeed;
    }
    void SetPivotAngleAtMinSpeed(const float32 __Value) property
    {
        if (this.m_PivotAngleAtMinSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_PivotAngleAtMinSpeed = __Value;
        return;
    }
    float32 GetPivotAngleAtMaxSpeed() const property
    {
        return this.m_PivotAngleAtMaxSpeed;
    }
    void SetPivotAngleAtMaxSpeed(const float32 __Value) property
    {
        if (this.m_PivotAngleAtMaxSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_PivotAngleAtMaxSpeed = __Value;
        return;
    }
    float32 GetOrientationWarpingFullAngle() const property
    {
        return this.m_OrientationWarpingFullAngle;
    }
    void SetOrientationWarpingFullAngle(const float32 __Value) property
    {
        if (this.m_OrientationWarpingFullAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_OrientationWarpingFullAngle = __Value;
        return;
    }
    float32 GetOrientationWarpingZeroAngle() const property
    {
        return this.m_OrientationWarpingZeroAngle;
    }
    void SetOrientationWarpingZeroAngle(const float32 __Value) property
    {
        if (this.m_OrientationWarpingZeroAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_OrientationWarpingZeroAngle = __Value;
        return;
    }
    float32 GetOrientationWarpingIncreaseSpeed() const property
    {
        return this.m_OrientationWarpingIncreaseSpeed;
    }
    void SetOrientationWarpingIncreaseSpeed(const float32 __Value) property
    {
        if (this.m_OrientationWarpingIncreaseSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_OrientationWarpingIncreaseSpeed = __Value;
        return;
    }
    float32 GetOrientationWarpingDecreaseSpeed() const property
    {
        return this.m_OrientationWarpingDecreaseSpeed;
    }
    void SetOrientationWarpingDecreaseSpeed(const float32 __Value) property
    {
        if (this.m_OrientationWarpingDecreaseSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_OrientationWarpingDecreaseSpeed = __Value;
        return;
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
        this.__MarkDirty(8);
        this.m_bIsMoving = __Value;
        return;
    }
    bool GetbIsPivoting() const property
    {
        return this.m_bIsPivoting;
    }
    void SetbIsPivoting(const bool __Value) property
    {
        if (!(this.m_bIsPivoting) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_bIsPivoting = __Value;
        return;
    }
    FVector GetVelocity() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_Velocity() property
    {
        FVector __r;
        this.__MarkDirty(10);
        return __r;
    }
    void SetVelocity(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_Velocity = __Value;
        return;
    }
    const FVector GetLastNonZeroVelocity() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LastNonZeroVelocity() property
    {
        FVector __r;
        this.__MarkDirty(11);
        return __r;
    }
    void SetLastNonZeroVelocity(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_LastNonZeroVelocity = __Value;
        return;
    }
    const FVector GetAcceleration() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_Acceleration() property
    {
        FVector __r;
        this.__MarkDirty(12);
        return __r;
    }
    void SetAcceleration(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_Acceleration = __Value;
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
        this.__MarkDirty(13);
        this.m_MoveSpeed = __Value;
        return;
    }
    float32 GetMoveDeltaRotationYaw() const property
    {
        return this.m_MoveDeltaRotationYaw;
    }
    void SetMoveDeltaRotationYaw(const float32 __Value) property
    {
        if (this.m_MoveDeltaRotationYaw == __Value)
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_MoveDeltaRotationYaw = __Value;
        return;
    }
    const FVector GetTransformForwardVector() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TransformForwardVector() property
    {
        FVector __r;
        this.__MarkDirty(15);
        return __r;
    }
    void SetTransformForwardVector(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(15);
        this.m_TransformForwardVector = __Value;
        return;
    }
    float32 GetOrientationWarpingAlpha() const property
    {
        return this.m_OrientationWarpingAlpha;
    }
    void SetOrientationWarpingAlpha(const float32 __Value) property
    {
        if (this.m_OrientationWarpingAlpha == __Value)
        {
            return;
        }
        this.__MarkDirty(16);
        this.m_OrientationWarpingAlpha = __Value;
        return;
    }
    EMoveDirection GetMoveDirection() const property
    {
        return this.m_MoveDirection;
    }
    void SetMoveDirection(const EMoveDirection __Value) property
    {
        if (int(this.m_MoveDirection) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(17);
        this.m_MoveDirection = __Value;
        return;
    }
    ERotationMode GetRotationMode() const property
    {
        return this.m_RotationMode;
    }
    void SetRotationMode(const ERotationMode __Value) property
    {
        if (int(this.m_RotationMode) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(18);
        this.m_RotationMode = __Value;
        return;
    }
    float32 GetSteeringOffsetYaw() const property
    {
        return this.m_SteeringOffsetYaw;
    }
    void SetSteeringOffsetYaw(const float32 __Value) property
    {
        if (this.m_SteeringOffsetYaw == __Value)
        {
            return;
        }
        this.__MarkDirty(19);
        this.m_SteeringOffsetYaw = __Value;
        return;
    }
    float32 GetSteeringProceduralTargetTime() const property
    {
        return this.m_SteeringProceduralTargetTime;
    }
    void SetSteeringProceduralTargetTime(const float32 __Value) property
    {
        if (this.m_SteeringProceduralTargetTime == __Value)
        {
            return;
        }
        this.__MarkDirty(20);
        this.m_SteeringProceduralTargetTime = __Value;
        return;
    }
}

namespace FC_CharacterGroundMovementInfo
{
FC_CharacterGroundMovementInfo Interpolate(const FC_CharacterGroundMovementInfo &inout A, const FC_CharacterGroundMovementInfo &inout B, const float32 T, const float32 DeltaTime)
{
    FC_CharacterGroundMovementInfo local_40;
    local_40.SetbIsMoving(B.GetbIsMoving());
    local_40.SetbIsPivoting(B.GetbIsPivoting());
    local_40.SetVelocity(FMath::Lerp(A.GetVelocity(), B.GetVelocity(), T));
    local_40.SetLastNonZeroVelocity(FMath::Lerp(A.GetLastNonZeroVelocity(), B.GetLastNonZeroVelocity(), T));
    local_40.SetAcceleration(FMath::Lerp(A.GetAcceleration(), B.GetAcceleration(), T));
    local_40.SetMoveSpeed(FMath::Lerp(A.GetMoveSpeed(), B.GetMoveSpeed(), T));
    local_40.SetMoveDeltaRotationYaw(FMath::Lerp(A.GetMoveDeltaRotationYaw(), B.GetMoveDeltaRotationYaw(), T));
    local_40.SetTransformForwardVector(FMath::Lerp(A.GetTransformForwardVector(), B.GetTransformForwardVector(), T).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
    local_40.SetOrientationWarpingAlpha(FMath::Lerp(A.GetOrientationWarpingAlpha(), B.GetOrientationWarpingAlpha(), T));
    local_40.SetMoveDirection(B.GetMoveDirection());
    local_40.SetRotationMode(B.GetRotationMode());
    local_40.SetSteeringOffsetYaw(FMath::Lerp(A.GetSteeringOffsetYaw(), B.GetSteeringOffsetYaw(), T));
    local_40.SetSteeringProceduralTargetTime(FMath::Lerp(A.GetSteeringProceduralTargetTime(), B.GetSteeringProceduralTargetTime(), T));
    return local_40;
}
}
namespace ECSFunc_FC_CharacterGroundMovementInfo
{
UFUNCTION()
bool HasCharacterGroundMovementInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CharacterGroundMovementInfo);
}
FC_CharacterGroundMovementInfo& AssignCharacterGroundMovementInfo(const FECSEntity &inout Entity, const FC_CharacterGroundMovementInfo &inout DefaultValue = FC_CharacterGroundMovementInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CharacterGroundMovementInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCharacterGroundMovementInfo_BP(const FECSEntity &inout Entity, const FC_CharacterGroundMovementInfo &inout DefaultValue = FC_CharacterGroundMovementInfo())
{
    ECSFunc_FC_CharacterGroundMovementInfo::AssignCharacterGroundMovementInfo(Entity, DefaultValue);
    return;
}
FC_CharacterGroundMovementInfo& ModifyCharacterGroundMovementInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CharacterGroundMovementInfo));
    return local_12.GetComp();
}
FC_CharacterGroundMovementInfo& ModifyOrAddCharacterGroundMovementInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CharacterGroundMovementInfo));
    return local_12.GetComp();
}
const FC_CharacterGroundMovementInfo& GetCharacterGroundMovementInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CharacterGroundMovementInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_CharacterGroundMovementInfo GetCharacterGroundMovementInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CharacterGroundMovementInfo& local_4 = ECSFunc_FC_CharacterGroundMovementInfo::GetCharacterGroundMovementInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CharacterGroundMovementInfo();
}
const FC_CharacterGroundMovementInfo GetDefaultedCharacterGroundMovementInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CharacterGroundMovementInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CharacterGroundMovementInfo);
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
FC_CharacterGroundMovementInfo GetDefaultedCharacterGroundMovementInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CharacterGroundMovementInfo::GetDefaultedCharacterGroundMovementInfo(Entity);
}
UFUNCTION()
bool RemoveCharacterGroundMovementInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CharacterGroundMovementInfo);
}
}
FECSMonitorRuntimeView __GetMonitorCharacterGroundMovementInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CharacterGroundMovementInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterGroundMovementInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CharacterGroundMovementInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterGroundMovementInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CharacterGroundMovementInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterGroundMovementInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CharacterGroundMovementInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterGroundMovementInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CharacterGroundMovementInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorCharacterGroundMovementInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CharacterGroundMovementInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterGroundMovementInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CharacterGroundMovementInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterGroundMovementInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CharacterGroundMovementInfo, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_CharacterGroundMovementInfo_MoveSpeed(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetMoveSpeed();
    return;
}
void GetEntityBBVar_CharacterGroundMovementInfo_MoveDeltaRotationYaw(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetMoveDeltaRotationYaw();
    return;
}
void GetEntityBBVar_CharacterGroundMovementInfo_IsMoving(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().IsMoving();
    return;
}
void GetEntityBBVar_CharacterGroundMovementInfo_IsPivoting(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().IsPivoting();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags32 GetDirtyFlags(FC_CharacterGroundMovementInfo &inout Data)
{
    FRootDirtyFlags32 __r;
    return __r;
}
void InitDirtyFlags(FC_CharacterGroundMovementInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CharacterGroundMovementInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CharacterGroundMovementInfo
{
int __IndexOf_PivotSpeedMin()
{
    return 0;
}
int __IndexOf_PivotSpeedMax()
{
    return 1;
}
int __IndexOf_PivotAngleAtMinSpeed()
{
    return 2;
}
int __IndexOf_PivotAngleAtMaxSpeed()
{
    return 3;
}
int __IndexOf_OrientationWarpingFullAngle()
{
    return 4;
}
int __IndexOf_OrientationWarpingZeroAngle()
{
    return 5;
}
int __IndexOf_OrientationWarpingIncreaseSpeed()
{
    return 6;
}
int __IndexOf_OrientationWarpingDecreaseSpeed()
{
    return 7;
}
int __IndexOf_bIsMoving()
{
    return 8;
}
int __IndexOf_bIsPivoting()
{
    return 9;
}
int __IndexOf_Velocity()
{
    return 10;
}
int __IndexOf_LastNonZeroVelocity()
{
    return 11;
}
int __IndexOf_Acceleration()
{
    return 12;
}
int __IndexOf_MoveSpeed()
{
    return 13;
}
int __IndexOf_MoveDeltaRotationYaw()
{
    return 14;
}
int __IndexOf_TransformForwardVector()
{
    return 15;
}
int __IndexOf_OrientationWarpingAlpha()
{
    return 16;
}
int __IndexOf_MoveDirection()
{
    return 17;
}
int __IndexOf_RotationMode()
{
    return 18;
}
int __IndexOf_SteeringOffsetYaw()
{
    return 19;
}
int __IndexOf_SteeringProceduralTargetTime()
{
    return 20;
}
}
