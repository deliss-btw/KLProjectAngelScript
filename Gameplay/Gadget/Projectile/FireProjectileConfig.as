
enum EProjectileSpawnPositionType
{
    Center,
    Bottom,
    Top,
}

enum EProjectileSpawnPositionOffsetType
{
    SpawnRotationDirectionOffset,
    OwnerEntityRotationDirectionOffset,
    WorldSpaceOffset,
    WorldSpace,
}

enum EProjectileSpawnRotationType
{
    EntityRotation,
    SocketRotation,
    WorldSpace,
}

enum EProjectileSpawnAimType
{
    None,
    Shooting,
    LockTarget,
}

enum EProjectileHitBehaviorType
{
    DamageTarget,
    Explosion,
    Penetration,
}

enum EProjectileHitTestType
{
    Movement,
    PenetrationInFrame,
}

enum EProjectileTrackTarget
{
    LockTarget,
    FromBlackBoard,
    LockTargetOrSoftLock,
}

enum EProjectileTrackType
{
    TrackEntityTarget,
    TrackTargetPos,
    TrackTargetHistoryPos,
    TrackAimTraceHitPos,
    TrackAimTraceHitEntityOrPos,
    TrackLockTarget,
}

enum EProjectileFireModeType
{
    SingleFireMode,
    IntervalFireMode,
}

enum EMultiProjectileFireModeType
{
    Default,
    RecordLastFireData,
}

enum EProjectileFireResourceType
{
    ConsumeEnergy,
    AccumulateHeat,
}


struct FFireProjectileConfig
{
    UPROPERTY()
    bool bFireByWeapon;
    UPROPERTY()
    TSoftClassPtr<AProjectilePrefab> ProjectilePrefab;
    UPROPERTY()
    bool bLocalPrediction;
    UPROPERTY()
    bool bInterpoBlendWithOwner;
    UPROPERTY()
    bool bAutoSelectAimShoot;
    UPROPERTY()
    FNameHandle_EntityBBVarBool AimMark;
    UPROPERTY()
    bool bForShooting;
    UPROPERTY()
    bool bSpawnWithPredictPath;
    UPROPERTY()
    FName ProjectileKey;
    UPROPERTY()
    bool bAimAtLockTarget;
    UPROPERTY()
    FVector AimAtLockTargetOffset;
    UPROPERTY()
    FVector MinRotateLimitAnimAtLockTarget;
    UPROPERTY()
    FVector MaxRotateLimitAnimAtLockTarget;
    UPROPERTY()
    bool bAimAtEntityBB;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity AimAtEntityBBHandle;
    UPROPERTY()
    FVector AimAtEntityBBOffset;
    UPROPERTY()
    FSpawnOnGroundConfig SpawnOnGroundConfig;
    UPROPERTY()
    FAttachRefName PositionAttachRefName;
    UPROPERTY()
    EProjectileSpawnPositionOffsetType SpawnPositionOffsetType;
    UPROPERTY()
    FVector PositionOffset;
    UPROPERTY()
    EProjectileSpawnRotationType SpawnRotationType;
    UPROPERTY()
    FRotator3f RotationOffset;
    UPROPERTY()
    FDataObjectPtr AttackDataConfig;
    UPROPERTY()
    FAttackHitTestProtectData HitTestProtectData;

    FFireProjectileConfig()
    {
        this.bFireByWeapon = false;
        this.bLocalPrediction = false;
        this.bInterpoBlendWithOwner = false;
        this.bAutoSelectAimShoot = false;
        FNameHandle_EntityBBVarBool local_6;
        local_6;
        this.bForShooting = false;
        this.bSpawnWithPredictPath = false;
        this.bAimAtLockTarget = false;
        this.AimAtLockTargetOffset = FVector::ZeroVector;
        this.MinRotateLimitAnimAtLockTarget = FVector(-180.0, -180.0, -180.0);
        this.MaxRotateLimitAnimAtLockTarget = FVector(180.0, 180.0, 180.0);
        this.bAimAtEntityBB = false;
        this.AimAtEntityBBOffset = FVector::ZeroVector;
        this.SpawnPositionOffsetType = EProjectileSpawnPositionOffsetType(0);
        this.SpawnRotationType = EProjectileSpawnRotationType(0);
        return;
    }
}

struct FFireProjectileData
{
    FSubDirtyFlags32 __DirtyFlags;
    UPROPERTY()
    TSoftClassPtr<AProjectilePrefab> m_ProjectilePrefab;
    UPROPERTY()
    bool m_bLocalPrediction;
    UPROPERTY()
    bool m_bInterpoBlendWithOwner;
    UPROPERTY()
    bool m_bForShooting;
    UPROPERTY()
    bool m_bAimAtLockTarget;
    UPROPERTY()
    FVector m_AimAtLockTargetOffset;
    UPROPERTY()
    FVector m_AimAtEntityBBOffset;
    UPROPERTY()
    FVector m_MinRotateLimitAnimAtLockTarget;
    UPROPERTY()
    FVector m_MaxRotateLimitAnimAtLockTarget;
    UPROPERTY()
    bool m_bOverrideAimAtPosition;
    UPROPERTY()
    FVector m_OverrideAimAtPosition;
    UPROPERTY()
    FSpawnOnGroundConfig m_SpawnOnGroundConfig;
    UPROPERTY()
    FAttachRefName m_PositionAttachRefName;
    UPROPERTY()
    EProjectileSpawnPositionOffsetType m_SpawnPositionOffsetType;
    UPROPERTY()
    FVector m_PositionOffset;
    UPROPERTY()
    EProjectileSpawnRotationType m_SpawnRotationType;
    UPROPERTY()
    FRotator3f m_RotationOffset;
    UPROPERTY()
    bool m_bSpawnWithPredictPath;
    UPROPERTY()
    FName m_ProjectileKey;

    FFireProjectileData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FFireProjectileData(const FFireProjectileData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FFireProjectileData(const FFireProjectileConfig &inout Config)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FFireProjectileData opAssign(const FFireProjectileData &inout Other)
    {
        FFireProjectileData __r;
        this.SetProjectilePrefab(Other.GetProjectilePrefab());
        this.SetbLocalPrediction(Other.GetbLocalPrediction());
        this.SetbInterpoBlendWithOwner(Other.GetbInterpoBlendWithOwner());
        this.SetbForShooting(Other.GetbForShooting());
        this.SetbAimAtLockTarget(Other.GetbAimAtLockTarget());
        this.SetAimAtLockTargetOffset(Other.GetAimAtLockTargetOffset());
        this.SetAimAtEntityBBOffset(Other.GetAimAtEntityBBOffset());
        this.SetMinRotateLimitAnimAtLockTarget(Other.GetMinRotateLimitAnimAtLockTarget());
        this.SetMaxRotateLimitAnimAtLockTarget(Other.GetMaxRotateLimitAnimAtLockTarget());
        this.SetbOverrideAimAtPosition(Other.GetbOverrideAimAtPosition());
        this.SetOverrideAimAtPosition(Other.GetOverrideAimAtPosition());
        this.SetSpawnOnGroundConfig(Other.GetSpawnOnGroundConfig());
        this.SetPositionAttachRefName(Other.GetPositionAttachRefName());
        this.SetSpawnPositionOffsetType(Other.GetSpawnPositionOffsetType());
        this.SetPositionOffset(Other.GetPositionOffset());
        this.SetSpawnRotationType(Other.GetSpawnRotationType());
        this.SetRotationOffset(Other.GetRotationOffset());
        this.SetbSpawnWithPredictPath(Other.GetbSpawnWithPredictPath());
        this.SetProjectileKey(Other.GetProjectileKey());
        return __r;
    }
    const TSoftClassPtr<AProjectilePrefab> GetProjectilePrefab() const property
    {
        const TSoftClassPtr<AProjectilePrefab> __r;
        return __r;
    }
    TSoftClassPtr<AProjectilePrefab> GetModify_ProjectilePrefab() property
    {
        TSoftClassPtr<AProjectilePrefab> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetProjectilePrefab(const TSoftClassPtr<AProjectilePrefab> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ProjectilePrefab = __Value;
        return;
    }
    bool GetbLocalPrediction() const property
    {
        return this.m_bLocalPrediction;
    }
    void SetbLocalPrediction(const bool __Value) property
    {
        if (!(this.m_bLocalPrediction) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bLocalPrediction = __Value;
        return;
    }
    bool GetbInterpoBlendWithOwner() const property
    {
        return this.m_bInterpoBlendWithOwner;
    }
    void SetbInterpoBlendWithOwner(const bool __Value) property
    {
        if (!(this.m_bInterpoBlendWithOwner) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bInterpoBlendWithOwner = __Value;
        return;
    }
    bool GetbForShooting() const property
    {
        return this.m_bForShooting;
    }
    void SetbForShooting(const bool __Value) property
    {
        if (!(this.m_bForShooting) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bForShooting = __Value;
        return;
    }
    bool GetbAimAtLockTarget() const property
    {
        return this.m_bAimAtLockTarget;
    }
    void SetbAimAtLockTarget(const bool __Value) property
    {
        if (!(this.m_bAimAtLockTarget) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bAimAtLockTarget = __Value;
        return;
    }
    const FVector GetAimAtLockTargetOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_AimAtLockTargetOffset() property
    {
        FVector __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetAimAtLockTargetOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_AimAtLockTargetOffset = __Value;
        return;
    }
    const FVector GetAimAtEntityBBOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_AimAtEntityBBOffset() property
    {
        FVector __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetAimAtEntityBBOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_AimAtEntityBBOffset = __Value;
        return;
    }
    const FVector GetMinRotateLimitAnimAtLockTarget() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_MinRotateLimitAnimAtLockTarget() property
    {
        FVector __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetMinRotateLimitAnimAtLockTarget(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_MinRotateLimitAnimAtLockTarget = __Value;
        return;
    }
    const FVector GetMaxRotateLimitAnimAtLockTarget() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_MaxRotateLimitAnimAtLockTarget() property
    {
        FVector __r;
        this.__MarkDirty(8);
        return __r;
    }
    void SetMaxRotateLimitAnimAtLockTarget(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_MaxRotateLimitAnimAtLockTarget = __Value;
        return;
    }
    bool GetbOverrideAimAtPosition() const property
    {
        return this.m_bOverrideAimAtPosition;
    }
    void SetbOverrideAimAtPosition(const bool __Value) property
    {
        if (!(this.m_bOverrideAimAtPosition) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_bOverrideAimAtPosition = __Value;
        return;
    }
    const FVector GetOverrideAimAtPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_OverrideAimAtPosition() property
    {
        FVector __r;
        this.__MarkDirty(10);
        return __r;
    }
    void SetOverrideAimAtPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_OverrideAimAtPosition = __Value;
        return;
    }
    const FSpawnOnGroundConfig GetSpawnOnGroundConfig() const property
    {
        const FSpawnOnGroundConfig __r;
        return __r;
    }
    FSpawnOnGroundConfig GetSpawnOnGroundConfig() property
    {
        FSpawnOnGroundConfig __r;
        return __r;
    }
    void SetSpawnOnGroundConfig(const FSpawnOnGroundConfig &inout __Value) property
    {
        this.m_SpawnOnGroundConfig = __Value;
        return;
    }
    const FAttachRefName GetPositionAttachRefName() const property
    {
        const FAttachRefName __r;
        return __r;
    }
    FAttachRefName GetModify_PositionAttachRefName() property
    {
        FAttachRefName __r;
        this.__MarkDirty(19);
        return __r;
    }
    void SetPositionAttachRefName(const FAttachRefName &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(19);
        this.m_PositionAttachRefName = __Value;
        return;
    }
    EProjectileSpawnPositionOffsetType GetSpawnPositionOffsetType() const property
    {
        return this.m_SpawnPositionOffsetType;
    }
    void SetSpawnPositionOffsetType(const EProjectileSpawnPositionOffsetType __Value) property
    {
        if (int(this.m_SpawnPositionOffsetType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(20);
        this.m_SpawnPositionOffsetType = __Value;
        return;
    }
    FVector GetPositionOffset() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_PositionOffset() property
    {
        FVector __r;
        this.__MarkDirty(21);
        return __r;
    }
    void SetPositionOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(21);
        this.m_PositionOffset = __Value;
        return;
    }
    EProjectileSpawnRotationType GetSpawnRotationType() const property
    {
        return this.m_SpawnRotationType;
    }
    void SetSpawnRotationType(const EProjectileSpawnRotationType __Value) property
    {
        if (int(this.m_SpawnRotationType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(22);
        this.m_SpawnRotationType = __Value;
        return;
    }
    const FRotator3f GetRotationOffset() const property
    {
        const FRotator3f __r;
        return __r;
    }
    FRotator3f GetModify_RotationOffset() property
    {
        FRotator3f __r;
        this.__MarkDirty(23);
        return __r;
    }
    void SetRotationOffset(const FRotator3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(23);
        this.m_RotationOffset = __Value;
        return;
    }
    bool GetbSpawnWithPredictPath() const property
    {
        return this.m_bSpawnWithPredictPath;
    }
    void SetbSpawnWithPredictPath(const bool __Value) property
    {
        if (!(this.m_bSpawnWithPredictPath) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(24);
        this.m_bSpawnWithPredictPath = __Value;
        return;
    }
    FName GetProjectileKey() const property
    {
        return this.m_ProjectileKey;
    }
    void SetProjectileKey(const FName &inout __Value) property
    {
        if ((this.m_ProjectileKey == __Value))
        {
            return;
        }
        this.__MarkDirty(25);
        this.m_ProjectileKey = __Value;
        return;
    }
}

struct FProjectileFireModeConfig
{
    UPROPERTY()
    EProjectileFireModeType FireMode = EProjectileFireModeType(0);
    UPROPERTY()
    float32 FireInterval = 1.0f;
    UPROPERTY()
    EMultiProjectileFireModeType MultiProjectileFireMode = EMultiProjectileFireModeType(0);
    UPROPERTY()
    int FireNumPerInterval = 1;
    UPROPERTY()
    FRotator3f RotationOffsetPerFire = FRotator3f::ZeroRotator;


}

namespace AutoDelta
{
FSubDirtyFlags32 GetDirtyFlags(FFireProjectileData &inout Data)
{
    FSubDirtyFlags32 __r;
    return __r;
}
void ClearDirtyFlags(FFireProjectileData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FFireProjectileData
{
int __IndexOf_ProjectilePrefab()
{
    return 0;
}
int __IndexOf_bLocalPrediction()
{
    return 1;
}
int __IndexOf_bInterpoBlendWithOwner()
{
    return 2;
}
int __IndexOf_bForShooting()
{
    return 3;
}
int __IndexOf_bAimAtLockTarget()
{
    return 4;
}
int __IndexOf_AimAtLockTargetOffset()
{
    return 5;
}
int __IndexOf_AimAtEntityBBOffset()
{
    return 6;
}
int __IndexOf_MinRotateLimitAnimAtLockTarget()
{
    return 7;
}
int __IndexOf_MaxRotateLimitAnimAtLockTarget()
{
    return 8;
}
int __IndexOf_bOverrideAimAtPosition()
{
    return 9;
}
int __IndexOf_OverrideAimAtPosition()
{
    return 10;
}
int __IndexOf_SpawnOnGroundConfig()
{
    return 11;
}
int __IndexOf_PositionAttachRefName()
{
    return 19;
}
int __IndexOf_SpawnPositionOffsetType()
{
    return 20;
}
int __IndexOf_PositionOffset()
{
    return 21;
}
int __IndexOf_SpawnRotationType()
{
    return 22;
}
int __IndexOf_RotationOffset()
{
    return 23;
}
int __IndexOf_bSpawnWithPredictPath()
{
    return 24;
}
int __IndexOf_ProjectileKey()
{
    return 25;
}
}
