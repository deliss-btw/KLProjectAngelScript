
enum EThrowTargetType
{
    Projectile,
    Prop,
}

namespace __INTENRAL_FC_ThrowProjectilePropConfig_NS
{
    const TECSComponentDerivedPtr<FC_ThrowProjectilePropConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ThrowProjectilePropConfig>();
    const FC_ThrowProjectilePropConfig DefaultValue = FC_ThrowProjectilePropConfig();
}
namespace __INTENRAL_FCS_ThrowPredictPathTrace_NS
{
    const TECSComponentDerivedPtr<FCS_ThrowPredictPathTrace> DerivedPtr = TECSComponentDerivedPtr<FCS_ThrowPredictPathTrace>();
    const FCS_ThrowPredictPathTrace DefaultValue = FCS_ThrowPredictPathTrace();
}
namespace __INTENRAL_FC_NeedSendThrowPredictPath_NS
{
    const TECSComponentDerivedPtr<FC_NeedSendThrowPredictPath> DerivedPtr = TECSComponentDerivedPtr<FC_NeedSendThrowPredictPath>();
    const FC_NeedSendThrowPredictPath DefaultValue = FC_NeedSendThrowPredictPath();
}
namespace __INTENRAL_FC_ThrowPredictPath_NS
{
    const TECSComponentDerivedPtr<FC_ThrowPredictPath> DerivedPtr = TECSComponentDerivedPtr<FC_ThrowPredictPath>();
    const FC_ThrowPredictPath DefaultValue = FC_ThrowPredictPath();
}
namespace __INTENRAL_FC_ThrowPredictPathKey_NS
{
    const TECSComponentDerivedPtr<FC_ThrowPredictPathKey> DerivedPtr = TECSComponentDerivedPtr<FC_ThrowPredictPathKey>();
    const FC_ThrowPredictPathKey DefaultValue = FC_ThrowPredictPathKey();
}
namespace __INTENRAL_FC_ThrowPredictPathData_NS
{
    const TECSComponentDerivedPtr<FC_ThrowPredictPathData> DerivedPtr = TECSComponentDerivedPtr<FC_ThrowPredictPathData>();
    const FC_ThrowPredictPathData DefaultValue = FC_ThrowPredictPathData();
}
namespace __INTENRAL_FC_UpdateThrowPredictPath_NS
{
    const TECSComponentDerivedPtr<FC_UpdateThrowPredictPath> DerivedPtr = TECSComponentDerivedPtr<FC_UpdateThrowPredictPath>();
    const FC_UpdateThrowPredictPath DefaultValue = FC_UpdateThrowPredictPath();
}
namespace __INTENRAL_FC_ThrowPredictPathView_NS
{
    const TECSComponentDerivedPtr<FC_ThrowPredictPathView> DerivedPtr = TECSComponentDerivedPtr<FC_ThrowPredictPathView>();
    const FC_ThrowPredictPathView DefaultValue = FC_ThrowPredictPathView();
}
namespace __INTENRAL_FC_ThrowDetachVisualBlendTag_NS
{
    const TECSComponentDerivedPtr<FC_ThrowDetachVisualBlendTag> DerivedPtr = TECSComponentDerivedPtr<FC_ThrowDetachVisualBlendTag>();
    const FC_ThrowDetachVisualBlendTag DefaultValue = FC_ThrowDetachVisualBlendTag();
}
namespace __INTENRAL_FC_ThrowDetachVisualBlendOwnedTag_NS
{
    const TECSComponentDerivedPtr<FC_ThrowDetachVisualBlendOwnedTag> DerivedPtr = TECSComponentDerivedPtr<FC_ThrowDetachVisualBlendOwnedTag>();
    const FC_ThrowDetachVisualBlendOwnedTag DefaultValue = FC_ThrowDetachVisualBlendOwnedTag();
}
namespace __INTENRAL_FCE_SendThrowPredictPath_NS
{
    const TECSEventDerivedPtr<FCE_SendThrowPredictPath> DerivedPtr = TECSEventDerivedPtr<FCE_SendThrowPredictPath>();

}
struct FThrowPredictPathParams
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    float32 m_CollisionScale;
    UPROPERTY()
    float32 m_InitSpeed;
    UPROPERTY()
    float32 m_GravityScale;
    UPROPERTY()
    float32 m_MaxSimTime;
    UPROPERTY()
    float32 m_SimFrequency;
    UPROPERTY()
    bool m_bTraceWithCollision;
    UPROPERTY()
    FCollisionShapeInfo m_ShapeInfo;

    FThrowPredictPathParams()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FThrowPredictPathParams(const FThrowPredictPathParams &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FThrowPredictPathParams opAssign(const FThrowPredictPathParams &inout Other)
    {
        FThrowPredictPathParams __r;
        this.SetCollisionScale(Other.GetCollisionScale());
        this.SetInitSpeed(Other.GetInitSpeed());
        this.SetGravityScale(Other.GetGravityScale());
        this.SetMaxSimTime(Other.GetMaxSimTime());
        this.SetSimFrequency(Other.GetSimFrequency());
        this.SetbTraceWithCollision(Other.GetbTraceWithCollision());
        this.SetShapeInfo(Other.GetShapeInfo());
        return __r;
    }
    float32 GetCollisionScale() const property
    {
        return this.m_CollisionScale;
    }
    void SetCollisionScale(const float32 __Value) property
    {
        if (this.m_CollisionScale == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_CollisionScale = __Value;
        return;
    }
    float32 GetInitSpeed() const property
    {
        return this.m_InitSpeed;
    }
    void SetInitSpeed(const float32 __Value) property
    {
        if (this.m_InitSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_InitSpeed = __Value;
        return;
    }
    float32 GetGravityScale() const property
    {
        return this.m_GravityScale;
    }
    void SetGravityScale(const float32 __Value) property
    {
        if (this.m_GravityScale == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_GravityScale = __Value;
        return;
    }
    float32 GetMaxSimTime() const property
    {
        return this.m_MaxSimTime;
    }
    void SetMaxSimTime(const float32 __Value) property
    {
        if (this.m_MaxSimTime == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_MaxSimTime = __Value;
        return;
    }
    float32 GetSimFrequency() const property
    {
        return this.m_SimFrequency;
    }
    void SetSimFrequency(const float32 __Value) property
    {
        if (this.m_SimFrequency == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_SimFrequency = __Value;
        return;
    }
    bool GetbTraceWithCollision() const property
    {
        return this.m_bTraceWithCollision;
    }
    void SetbTraceWithCollision(const bool __Value) property
    {
        if (!(this.m_bTraceWithCollision) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bTraceWithCollision = __Value;
        return;
    }
    const FCollisionShapeInfo GetShapeInfo() const property
    {
        const FCollisionShapeInfo __r;
        return __r;
    }
    FCollisionShapeInfo GetShapeInfo() property
    {
        FCollisionShapeInfo __r;
        return __r;
    }
    void SetShapeInfo(const FCollisionShapeInfo &inout __Value) property
    {
        this.m_ShapeInfo = __Value;
        return;
    }
}

struct FThrowPredictPathData
{
    UPROPERTY()
    FRuntimeFloatCurve PitchMappingCurve;
    UPROPERTY()
    FTransform SocketRelativeTransform;
    UPROPERTY()
    FThrowPredictPathParams PredictPathParams;

    FThrowPredictPathData()
    {
        return;
    }
}

struct FThrowTargetInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    EThrowTargetType m_TargetType;
    UPROPERTY()
    FName m_ProjectileKey;
    UPROPERTY()
    FECSEntityId m_OwnerId;
    UPROPERTY()
    FECSEntityId m_PropEntityId;

    FThrowTargetInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FThrowTargetInfo(const FThrowTargetInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FThrowTargetInfo(const FName &inout InProjectileKey, const FECSEntityId &inout InOwnerId)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FThrowTargetInfo(const FECSEntityId &inout InPropEntityId, const FECSEntityId &inout InOwnerId)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FThrowTargetInfo opAssign(const FThrowTargetInfo &inout Other)
    {
        FThrowTargetInfo __r;
        this.SetTargetType(Other.GetTargetType());
        this.SetProjectileKey(Other.GetProjectileKey());
        this.SetOwnerId(Other.GetOwnerId());
        this.SetPropEntityId(Other.GetPropEntityId());
        return __r;
    }
    uint Hash() const
    {
        return (HashCombine((HashCombine((HashCombine((HashCombine(0, int(this.GetTargetType()))), this.GetProjectileKey().GetHash())), this.GetOwnerId().GetIdValue())), this.GetPropEntityId().GetIdValue()));
    }
    EThrowTargetType GetTargetType() const property
    {
        return this.m_TargetType;
    }
    void SetTargetType(const EThrowTargetType __Value) property
    {
        if (int(this.m_TargetType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TargetType = __Value;
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
        this.__MarkDirty(1);
        this.m_ProjectileKey = __Value;
        return;
    }
    const FECSEntityId GetOwnerId() const property
    {
        const FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_OwnerId() property
    {
        FECSEntityId __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetOwnerId(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_OwnerId = __Value;
        return;
    }
    const FECSEntityId GetPropEntityId() const property
    {
        const FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_PropEntityId() property
    {
        FECSEntityId __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetPropEntityId(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_PropEntityId = __Value;
        return;
    }
}

struct FThrowAttachInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_SocketName;
    UPROPERTY()
    FVector m_AttachLocationOffset;
    UPROPERTY()
    FRotator m_AttachRotationOffset;
    UPROPERTY()
    FVector m_DetachLocationOffset;
    UPROPERTY()
    FRotator m_DetachRotationOffset;
    UPROPERTY()
    bool m_bUseDetachOffset;
    UPROPERTY()
    bool m_bUseRootRotationOffset;

    FThrowAttachInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FThrowAttachInfo(const FThrowAttachInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FThrowAttachInfo opAssign(const FThrowAttachInfo &inout Other)
    {
        FThrowAttachInfo __r;
        this.SetSocketName(Other.GetSocketName());
        this.SetAttachLocationOffset(Other.GetAttachLocationOffset());
        this.SetAttachRotationOffset(Other.GetAttachRotationOffset());
        this.SetDetachLocationOffset(Other.GetDetachLocationOffset());
        this.SetDetachRotationOffset(Other.GetDetachRotationOffset());
        this.SetbUseDetachOffset(Other.GetbUseDetachOffset());
        this.SetbUseRootRotationOffset(Other.GetbUseRootRotationOffset());
        return __r;
    }
    FName GetSocketName() const property
    {
        return this.m_SocketName;
    }
    void SetSocketName(const FName &inout __Value) property
    {
        if ((this.m_SocketName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SocketName = __Value;
        return;
    }
    const FVector GetAttachLocationOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_AttachLocationOffset() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetAttachLocationOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_AttachLocationOffset = __Value;
        return;
    }
    const FRotator GetAttachRotationOffset() const property
    {
        const FRotator __r;
        return __r;
    }
    FRotator GetModify_AttachRotationOffset() property
    {
        FRotator __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetAttachRotationOffset(const FRotator &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_AttachRotationOffset = __Value;
        return;
    }
    const FVector GetDetachLocationOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_DetachLocationOffset() property
    {
        FVector __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetDetachLocationOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_DetachLocationOffset = __Value;
        return;
    }
    const FRotator GetDetachRotationOffset() const property
    {
        const FRotator __r;
        return __r;
    }
    FRotator GetModify_DetachRotationOffset() property
    {
        FRotator __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetDetachRotationOffset(const FRotator &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_DetachRotationOffset = __Value;
        return;
    }
    bool GetbUseDetachOffset() const property
    {
        return this.m_bUseDetachOffset;
    }
    void SetbUseDetachOffset(const bool __Value) property
    {
        if (!(this.m_bUseDetachOffset) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bUseDetachOffset = __Value;
        return;
    }
    bool GetbUseRootRotationOffset() const property
    {
        return this.m_bUseRootRotationOffset;
    }
    void SetbUseRootRotationOffset(const bool __Value) property
    {
        if (!(this.m_bUseRootRotationOffset) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_bUseRootRotationOffset = __Value;
        return;
    }
}

struct FC_ThrowProjectilePropConfig : FECSComponent
{
    UPROPERTY()
    int ThrowItemIndex = 0;


}

struct FCS_ThrowPredictPathTrace : FECSSingleton
{
    UPROPERTY()
    TMap<FThrowTargetInfo, FKLPredictProjectilePathResult> PathTraceResults;
    UPROPERTY()
    TMap<FThrowTargetInfo, FKLPredictProjectilePathResult> PreparedPredictPaths;
    UPROPERTY()
    TSet<FThrowTargetInfo> UploadedProjectileKeys;
    UPROPERTY()
    TMap<FThrowTargetInfo, FVector3f> PreparedLaunchVelocities;
    UPROPERTY()
    FSceneQueryCache PathTraceCache;

    FCS_ThrowPredictPathTrace()
    {
        return;
    }
}

struct FCE_SendThrowPredictPath : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FThrowTargetInfo TargetInfo;
    UPROPERTY()
    FKLPredictProjectilePathResult PredictPath;

    FCE_SendThrowPredictPath()
    {
        return;
    }
}

struct FC_NeedSendThrowPredictPath : FECSComponent
{
    UPROPERTY()
    FThrowTargetInfo TargetInfo;
    UPROPERTY()
    FKLPredictProjectilePathResult PredictPath;

    FC_NeedSendThrowPredictPath()
    {
        return;
    }
}

struct FC_ThrowPredictPath : FECSComponent
{
    UPROPERTY()
    FKLPredictProjectilePathResult PredictPath;

    FC_ThrowPredictPath()
    {
        return;
    }
}

struct FC_ThrowPredictPathKey : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FThrowTargetInfo m_KeyInfo;

    FC_ThrowPredictPathKey()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ThrowPredictPathKey(const FC_ThrowPredictPathKey &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_KeyInfo = Other.m_KeyInfo;
        return;
    }
    FC_ThrowPredictPathKey opAssign(const FC_ThrowPredictPathKey &inout Other)
    {
        FC_ThrowPredictPathKey __r;
        this.SetKeyInfo(Other.GetKeyInfo());
        return __r;
    }
    const FThrowTargetInfo GetKeyInfo() const property
    {
        const FThrowTargetInfo __r;
        return __r;
    }
    FThrowTargetInfo GetKeyInfo() property
    {
        FThrowTargetInfo __r;
        return __r;
    }
    void SetKeyInfo(const FThrowTargetInfo &inout __Value) property
    {
        this.m_KeyInfo = __Value;
        return;
    }
}

struct FC_ThrowPredictPathData : FECSComponent
{
    UPROPERTY()
    TMap<FThrowTargetInfo, FThrowPredictPathData> ThrowPathDataMap;

    FC_ThrowPredictPathData()
    {
        return;
    }
}

struct FC_UpdateThrowPredictPath : FECSComponent
{
    FRootDirtyFlags64 __DirtyFlags;
    UPROPERTY()
    FThrowTargetInfo m_TargetInfo;
    UPROPERTY()
    TDataObjectPtr<FThrowPredictPathConfig> m_PredictPathConfig;
    UPROPERTY()
    FFireProjectileData m_FireData;
    UPROPERTY()
    FThrowAttachInfo m_AttachInfo;
    UPROPERTY()
    FThrowPredictPathParams m_PredictParams;

    FC_UpdateThrowPredictPath()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_UpdateThrowPredictPath(const FC_UpdateThrowPredictPath &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_TargetInfo = Other.m_TargetInfo;
        this.m_PredictPathConfig = Other.m_PredictPathConfig;
        this.m_FireData = Other.m_FireData;
        this.m_AttachInfo = Other.m_AttachInfo;
        this.m_PredictParams = Other.m_PredictParams;
        return;
    }
    FC_UpdateThrowPredictPath opAssign(const FC_UpdateThrowPredictPath &inout Other)
    {
        FC_UpdateThrowPredictPath __r;
        this.SetTargetInfo(Other.GetTargetInfo());
        this.SetPredictPathConfig(Other.GetPredictPathConfig());
        this.SetFireData(Other.GetFireData());
        this.SetAttachInfo(Other.GetAttachInfo());
        this.SetPredictParams(Other.GetPredictParams());
        return __r;
    }
    const FThrowTargetInfo GetTargetInfo() const property
    {
        const FThrowTargetInfo __r;
        return __r;
    }
    FThrowTargetInfo GetTargetInfo() property
    {
        FThrowTargetInfo __r;
        return __r;
    }
    void SetTargetInfo(const FThrowTargetInfo &inout __Value) property
    {
        this.m_TargetInfo = __Value;
        return;
    }
    const TDataObjectPtr<FThrowPredictPathConfig> GetPredictPathConfig() const property
    {
        const TDataObjectPtr<FThrowPredictPathConfig> __r;
        return __r;
    }
    TDataObjectPtr<FThrowPredictPathConfig> GetModify_PredictPathConfig() property
    {
        TDataObjectPtr<FThrowPredictPathConfig> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetPredictPathConfig(const TDataObjectPtr<FThrowPredictPathConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_PredictPathConfig = __Value;
        return;
    }
    const FFireProjectileData GetFireData() const property
    {
        const FFireProjectileData __r;
        return __r;
    }
    FFireProjectileData GetFireData() property
    {
        FFireProjectileData __r;
        return __r;
    }
    void SetFireData(const FFireProjectileData &inout __Value) property
    {
        this.m_FireData = __Value;
        return;
    }
    const FThrowAttachInfo GetAttachInfo() const property
    {
        const FThrowAttachInfo __r;
        return __r;
    }
    FThrowAttachInfo GetAttachInfo() property
    {
        FThrowAttachInfo __r;
        return __r;
    }
    void SetAttachInfo(const FThrowAttachInfo &inout __Value) property
    {
        this.m_AttachInfo = __Value;
        return;
    }
    const FThrowPredictPathParams GetPredictParams() const property
    {
        const FThrowPredictPathParams __r;
        return __r;
    }
    FThrowPredictPathParams GetPredictParams() property
    {
        FThrowPredictPathParams __r;
        return __r;
    }
    void SetPredictParams(const FThrowPredictPathParams &inout __Value) property
    {
        this.m_PredictParams = __Value;
        return;
    }
}

struct FC_ThrowPredictPathView : FECSComponent
{
    UPROPERTY()
    FThrowTargetInfo TargetInfo;
    UPROPERTY()
    FECSEntity FXEntity;
    UPROPERTY()
    FSceneQueryCache ViewPathTraceCache;

    FC_ThrowPredictPathView()
    {
        return;
    }
}

struct FC_ThrowDetachVisualBlendTag : FECSComponent
{
    FC_ThrowDetachVisualBlendTag()
    {
        return;
    }
}

struct FC_ThrowDetachVisualBlendOwnedTag : FECSComponent
{
    FC_ThrowDetachVisualBlendOwnedTag()
    {
        return;
    }
}

namespace ECSFunc_FC_ThrowProjectilePropConfig
{
UFUNCTION()
bool HasThrowProjectilePropConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ThrowProjectilePropConfig);
}
FC_ThrowProjectilePropConfig& AssignThrowProjectilePropConfig(const FECSEntity &inout Entity, const FC_ThrowProjectilePropConfig &inout DefaultValue = FC_ThrowProjectilePropConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ThrowProjectilePropConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignThrowProjectilePropConfig_BP(const FECSEntity &inout Entity, const FC_ThrowProjectilePropConfig &inout DefaultValue = FC_ThrowProjectilePropConfig())
{
    ECSFunc_FC_ThrowProjectilePropConfig::AssignThrowProjectilePropConfig(Entity, DefaultValue);
    return;
}
FC_ThrowProjectilePropConfig& ModifyThrowProjectilePropConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ThrowProjectilePropConfig));
    return local_12.GetComp();
}
FC_ThrowProjectilePropConfig& ModifyOrAddThrowProjectilePropConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ThrowProjectilePropConfig));
    return local_12.GetComp();
}
const FC_ThrowProjectilePropConfig& GetThrowProjectilePropConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ThrowProjectilePropConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ThrowProjectilePropConfig GetThrowProjectilePropConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ThrowProjectilePropConfig& local_4 = ECSFunc_FC_ThrowProjectilePropConfig::GetThrowProjectilePropConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ThrowProjectilePropConfig();
}
const FC_ThrowProjectilePropConfig GetDefaultedThrowProjectilePropConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ThrowProjectilePropConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ThrowProjectilePropConfig);
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
FC_ThrowProjectilePropConfig GetDefaultedThrowProjectilePropConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ThrowProjectilePropConfig::GetDefaultedThrowProjectilePropConfig(Entity);
}
UFUNCTION()
bool RemoveThrowProjectilePropConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ThrowProjectilePropConfig);
}
}
FECSMonitorRuntimeView __GetMonitorThrowProjectilePropConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ThrowProjectilePropConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowProjectilePropConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ThrowProjectilePropConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowProjectilePropConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ThrowProjectilePropConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowProjectilePropConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ThrowProjectilePropConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowProjectilePropConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ThrowProjectilePropConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorThrowProjectilePropConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ThrowProjectilePropConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowProjectilePropConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ThrowProjectilePropConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowProjectilePropConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ThrowProjectilePropConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_ThrowPredictPathTrace
{
UFUNCTION()
bool HasThrowPredictPathTrace(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_ThrowPredictPathTrace);
}
FCS_ThrowPredictPathTrace& AssignThrowPredictPathTrace(const FECSWorldPtr &inout World, const FCS_ThrowPredictPathTrace &inout DefaultValue = FCS_ThrowPredictPathTrace())
{
    UScriptStruct local_6 = FCS_ThrowPredictPathTrace;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignThrowPredictPathTrace_BP(const FECSWorldPtr &inout World, const FCS_ThrowPredictPathTrace &inout DefaultValue = FCS_ThrowPredictPathTrace())
{
    ECSFunc_FCS_ThrowPredictPathTrace::AssignThrowPredictPathTrace(World, DefaultValue);
    return;
}
FCS_ThrowPredictPathTrace& ModifyThrowPredictPathTrace(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ThrowPredictPathTrace;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_ThrowPredictPathTrace& ModifyOrAddThrowPredictPathTrace(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ThrowPredictPathTrace;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_ThrowPredictPathTrace& GetThrowPredictPathTrace(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ThrowPredictPathTrace;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_ThrowPredictPathTrace GetThrowPredictPathTrace_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_ThrowPredictPathTrace __r;
    bValid = false;
    bValid = ECSFunc_FCS_ThrowPredictPathTrace::GetThrowPredictPathTrace(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_ThrowPredictPathTrace GetDefaultedThrowPredictPathTrace(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_ThrowPredictPathTrace __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_ThrowPredictPathTrace);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_ThrowPredictPathTrace GetDefaultedThrowPredictPathTrace_BP(const FECSWorldPtr &inout World)
{
    FCS_ThrowPredictPathTrace __r;
    return __r;
}
UFUNCTION()
bool RemoveThrowPredictPathTrace(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_ThrowPredictPathTrace);
}
}
void __MonitorThrowPredictPathTraceLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_ThrowPredictPathTrace, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictPathTraceActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_ThrowPredictPathTrace, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictPathTraceModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_ThrowPredictPathTrace, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_NeedSendThrowPredictPath
{
UFUNCTION()
bool HasNeedSendThrowPredictPath(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NeedSendThrowPredictPath);
}
FC_NeedSendThrowPredictPath& AssignNeedSendThrowPredictPath(const FECSEntity &inout Entity, const FC_NeedSendThrowPredictPath &inout DefaultValue = FC_NeedSendThrowPredictPath())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NeedSendThrowPredictPath, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNeedSendThrowPredictPath_BP(const FECSEntity &inout Entity, const FC_NeedSendThrowPredictPath &inout DefaultValue = FC_NeedSendThrowPredictPath())
{
    ECSFunc_FC_NeedSendThrowPredictPath::AssignNeedSendThrowPredictPath(Entity, DefaultValue);
    return;
}
FC_NeedSendThrowPredictPath& ModifyNeedSendThrowPredictPath(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NeedSendThrowPredictPath));
    return local_12.GetComp();
}
FC_NeedSendThrowPredictPath& ModifyOrAddNeedSendThrowPredictPath(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NeedSendThrowPredictPath));
    return local_12.GetComp();
}
const FC_NeedSendThrowPredictPath& GetNeedSendThrowPredictPath(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NeedSendThrowPredictPath));
    return local_12.GetComp();
}
UFUNCTION()
FC_NeedSendThrowPredictPath GetNeedSendThrowPredictPath_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_NeedSendThrowPredictPath __r;
    bValid = false;
    bValid = ECSFunc_FC_NeedSendThrowPredictPath::GetNeedSendThrowPredictPath(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_NeedSendThrowPredictPath GetDefaultedNeedSendThrowPredictPath(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NeedSendThrowPredictPath __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NeedSendThrowPredictPath);
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
FC_NeedSendThrowPredictPath GetDefaultedNeedSendThrowPredictPath_BP(const FECSEntity &inout Entity)
{
    FC_NeedSendThrowPredictPath __r;
    return __r;
}
UFUNCTION()
bool RemoveNeedSendThrowPredictPath(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NeedSendThrowPredictPath);
}
}
FECSMonitorRuntimeView __GetMonitorNeedSendThrowPredictPathOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NeedSendThrowPredictPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNeedSendThrowPredictPathOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NeedSendThrowPredictPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNeedSendThrowPredictPathOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NeedSendThrowPredictPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNeedSendThrowPredictPathOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NeedSendThrowPredictPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNeedSendThrowPredictPathOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NeedSendThrowPredictPath, bFixedFrame, bMustHandleAll);
}
void __MonitorNeedSendThrowPredictPathLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NeedSendThrowPredictPath, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNeedSendThrowPredictPathActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NeedSendThrowPredictPath, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNeedSendThrowPredictPathModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NeedSendThrowPredictPath, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ThrowPredictPath
{
UFUNCTION()
bool HasThrowPredictPath(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPath);
}
FC_ThrowPredictPath& AssignThrowPredictPath(const FECSEntity &inout Entity, const FC_ThrowPredictPath &inout DefaultValue = FC_ThrowPredictPath())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPath, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignThrowPredictPath_BP(const FECSEntity &inout Entity, const FC_ThrowPredictPath &inout DefaultValue = FC_ThrowPredictPath())
{
    ECSFunc_FC_ThrowPredictPath::AssignThrowPredictPath(Entity, DefaultValue);
    return;
}
FC_ThrowPredictPath& ModifyThrowPredictPath(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPath));
    return local_12.GetComp();
}
FC_ThrowPredictPath& ModifyOrAddThrowPredictPath(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPath));
    return local_12.GetComp();
}
const FC_ThrowPredictPath& GetThrowPredictPath(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPath));
    return local_12.GetComp();
}
UFUNCTION()
FC_ThrowPredictPath GetThrowPredictPath_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ThrowPredictPath __r;
    bValid = false;
    bValid = ECSFunc_FC_ThrowPredictPath::GetThrowPredictPath(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ThrowPredictPath GetDefaultedThrowPredictPath(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ThrowPredictPath __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPath);
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
FC_ThrowPredictPath GetDefaultedThrowPredictPath_BP(const FECSEntity &inout Entity)
{
    FC_ThrowPredictPath __r;
    return __r;
}
UFUNCTION()
bool RemoveThrowPredictPath(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPath);
}
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ThrowPredictPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ThrowPredictPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ThrowPredictPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ThrowPredictPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ThrowPredictPath, bFixedFrame, bMustHandleAll);
}
void __MonitorThrowPredictPathLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ThrowPredictPath, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictPathActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ThrowPredictPath, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictPathModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ThrowPredictPath, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ThrowPredictPathKey
{
UFUNCTION()
bool HasThrowPredictPathKey(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathKey);
}
FC_ThrowPredictPathKey& AssignThrowPredictPathKey(const FECSEntity &inout Entity, const FC_ThrowPredictPathKey &inout DefaultValue = FC_ThrowPredictPathKey())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathKey, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignThrowPredictPathKey_BP(const FECSEntity &inout Entity, const FC_ThrowPredictPathKey &inout DefaultValue = FC_ThrowPredictPathKey())
{
    ECSFunc_FC_ThrowPredictPathKey::AssignThrowPredictPathKey(Entity, DefaultValue);
    return;
}
FC_ThrowPredictPathKey& ModifyThrowPredictPathKey(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathKey));
    return local_12.GetComp();
}
FC_ThrowPredictPathKey& ModifyOrAddThrowPredictPathKey(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathKey));
    return local_12.GetComp();
}
const FC_ThrowPredictPathKey& GetThrowPredictPathKey(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathKey));
    return local_12.GetComp();
}
UFUNCTION()
FC_ThrowPredictPathKey GetThrowPredictPathKey_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ThrowPredictPathKey& local_4 = ECSFunc_FC_ThrowPredictPathKey::GetThrowPredictPathKey(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ThrowPredictPathKey();
}
const FC_ThrowPredictPathKey GetDefaultedThrowPredictPathKey(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ThrowPredictPathKey __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathKey);
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
FC_ThrowPredictPathKey GetDefaultedThrowPredictPathKey_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ThrowPredictPathKey::GetDefaultedThrowPredictPathKey(Entity);
}
UFUNCTION()
bool RemoveThrowPredictPathKey(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathKey);
}
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathKeyOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ThrowPredictPathKey, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathKeyOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ThrowPredictPathKey, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathKeyOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ThrowPredictPathKey, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathKeyOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ThrowPredictPathKey, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathKeyOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ThrowPredictPathKey, bFixedFrame, bMustHandleAll);
}
void __MonitorThrowPredictPathKeyLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ThrowPredictPathKey, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictPathKeyActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ThrowPredictPathKey, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictPathKeyModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ThrowPredictPathKey, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ThrowPredictPathData
{
UFUNCTION()
bool HasThrowPredictPathData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathData);
}
FC_ThrowPredictPathData& AssignThrowPredictPathData(const FECSEntity &inout Entity, const FC_ThrowPredictPathData &inout DefaultValue = FC_ThrowPredictPathData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignThrowPredictPathData_BP(const FECSEntity &inout Entity, const FC_ThrowPredictPathData &inout DefaultValue = FC_ThrowPredictPathData())
{
    ECSFunc_FC_ThrowPredictPathData::AssignThrowPredictPathData(Entity, DefaultValue);
    return;
}
FC_ThrowPredictPathData& ModifyThrowPredictPathData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathData));
    return local_12.GetComp();
}
FC_ThrowPredictPathData& ModifyOrAddThrowPredictPathData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathData));
    return local_12.GetComp();
}
const FC_ThrowPredictPathData& GetThrowPredictPathData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathData));
    return local_12.GetComp();
}
UFUNCTION()
FC_ThrowPredictPathData GetThrowPredictPathData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ThrowPredictPathData __r;
    bValid = false;
    bValid = ECSFunc_FC_ThrowPredictPathData::GetThrowPredictPathData(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ThrowPredictPathData GetDefaultedThrowPredictPathData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ThrowPredictPathData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathData);
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
FC_ThrowPredictPathData GetDefaultedThrowPredictPathData_BP(const FECSEntity &inout Entity)
{
    FC_ThrowPredictPathData __r;
    return __r;
}
UFUNCTION()
bool RemoveThrowPredictPathData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathData);
}
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ThrowPredictPathData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ThrowPredictPathData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ThrowPredictPathData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ThrowPredictPathData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ThrowPredictPathData, bFixedFrame, bMustHandleAll);
}
void __MonitorThrowPredictPathDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ThrowPredictPathData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictPathDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ThrowPredictPathData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictPathDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ThrowPredictPathData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_UpdateThrowPredictPath
{
UFUNCTION()
bool HasUpdateThrowPredictPath(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_UpdateThrowPredictPath);
}
FC_UpdateThrowPredictPath& AssignUpdateThrowPredictPath(const FECSEntity &inout Entity, const FC_UpdateThrowPredictPath &inout DefaultValue = FC_UpdateThrowPredictPath())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_UpdateThrowPredictPath, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignUpdateThrowPredictPath_BP(const FECSEntity &inout Entity, const FC_UpdateThrowPredictPath &inout DefaultValue = FC_UpdateThrowPredictPath())
{
    ECSFunc_FC_UpdateThrowPredictPath::AssignUpdateThrowPredictPath(Entity, DefaultValue);
    return;
}
FC_UpdateThrowPredictPath& ModifyUpdateThrowPredictPath(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_UpdateThrowPredictPath));
    return local_12.GetComp();
}
FC_UpdateThrowPredictPath& ModifyOrAddUpdateThrowPredictPath(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_UpdateThrowPredictPath));
    return local_12.GetComp();
}
const FC_UpdateThrowPredictPath& GetUpdateThrowPredictPath(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_UpdateThrowPredictPath));
    return local_12.GetComp();
}
UFUNCTION()
FC_UpdateThrowPredictPath GetUpdateThrowPredictPath_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_UpdateThrowPredictPath& local_4 = ECSFunc_FC_UpdateThrowPredictPath::GetUpdateThrowPredictPath(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_UpdateThrowPredictPath();
}
const FC_UpdateThrowPredictPath GetDefaultedUpdateThrowPredictPath(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_UpdateThrowPredictPath __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_UpdateThrowPredictPath);
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
FC_UpdateThrowPredictPath GetDefaultedUpdateThrowPredictPath_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_UpdateThrowPredictPath::GetDefaultedUpdateThrowPredictPath(Entity);
}
UFUNCTION()
bool RemoveUpdateThrowPredictPath(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_UpdateThrowPredictPath);
}
}
FECSMonitorRuntimeView __GetMonitorUpdateThrowPredictPathOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_UpdateThrowPredictPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateThrowPredictPathOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_UpdateThrowPredictPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateThrowPredictPathOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_UpdateThrowPredictPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateThrowPredictPathOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_UpdateThrowPredictPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateThrowPredictPathOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_UpdateThrowPredictPath, bFixedFrame, bMustHandleAll);
}
void __MonitorUpdateThrowPredictPathLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_UpdateThrowPredictPath, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorUpdateThrowPredictPathActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_UpdateThrowPredictPath, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorUpdateThrowPredictPathModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_UpdateThrowPredictPath, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ThrowPredictPathView
{
UFUNCTION()
bool HasThrowPredictPathView(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathView);
}
FC_ThrowPredictPathView& AssignThrowPredictPathView(const FECSEntity &inout Entity, const FC_ThrowPredictPathView &inout DefaultValue = FC_ThrowPredictPathView())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathView, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignThrowPredictPathView_BP(const FECSEntity &inout Entity, const FC_ThrowPredictPathView &inout DefaultValue = FC_ThrowPredictPathView())
{
    ECSFunc_FC_ThrowPredictPathView::AssignThrowPredictPathView(Entity, DefaultValue);
    return;
}
FC_ThrowPredictPathView& ModifyThrowPredictPathView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathView));
    return local_12.GetComp();
}
FC_ThrowPredictPathView& ModifyOrAddThrowPredictPathView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathView));
    return local_12.GetComp();
}
const FC_ThrowPredictPathView& GetThrowPredictPathView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathView));
    return local_12.GetComp();
}
UFUNCTION()
FC_ThrowPredictPathView GetThrowPredictPathView_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ThrowPredictPathView __r;
    bValid = false;
    bValid = ECSFunc_FC_ThrowPredictPathView::GetThrowPredictPathView(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ThrowPredictPathView GetDefaultedThrowPredictPathView(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ThrowPredictPathView __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathView);
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
FC_ThrowPredictPathView GetDefaultedThrowPredictPathView_BP(const FECSEntity &inout Entity)
{
    FC_ThrowPredictPathView __r;
    return __r;
}
UFUNCTION()
bool RemoveThrowPredictPathView(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictPathView);
}
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathViewOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ThrowPredictPathView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathViewOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ThrowPredictPathView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathViewOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ThrowPredictPathView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathViewOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ThrowPredictPathView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictPathViewOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ThrowPredictPathView, bFixedFrame, bMustHandleAll);
}
void __MonitorThrowPredictPathViewLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ThrowPredictPathView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictPathViewActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ThrowPredictPathView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictPathViewModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ThrowPredictPathView, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ThrowDetachVisualBlendTag
{
UFUNCTION()
bool HasThrowDetachVisualBlendTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ThrowDetachVisualBlendTag);
}
FC_ThrowDetachVisualBlendTag& AssignThrowDetachVisualBlendTag(const FECSEntity &inout Entity, const FC_ThrowDetachVisualBlendTag &inout DefaultValue = FC_ThrowDetachVisualBlendTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ThrowDetachVisualBlendTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignThrowDetachVisualBlendTag_BP(const FECSEntity &inout Entity, const FC_ThrowDetachVisualBlendTag &inout DefaultValue = FC_ThrowDetachVisualBlendTag())
{
    ECSFunc_FC_ThrowDetachVisualBlendTag::AssignThrowDetachVisualBlendTag(Entity, DefaultValue);
    return;
}
FC_ThrowDetachVisualBlendTag& ModifyThrowDetachVisualBlendTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ThrowDetachVisualBlendTag));
    return local_12.GetComp();
}
FC_ThrowDetachVisualBlendTag& ModifyOrAddThrowDetachVisualBlendTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ThrowDetachVisualBlendTag));
    return local_12.GetComp();
}
const FC_ThrowDetachVisualBlendTag& GetThrowDetachVisualBlendTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ThrowDetachVisualBlendTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ThrowDetachVisualBlendTag GetThrowDetachVisualBlendTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ThrowDetachVisualBlendTag& local_4 = ECSFunc_FC_ThrowDetachVisualBlendTag::GetThrowDetachVisualBlendTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ThrowDetachVisualBlendTag();
}
const FC_ThrowDetachVisualBlendTag GetDefaultedThrowDetachVisualBlendTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ThrowDetachVisualBlendTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ThrowDetachVisualBlendTag);
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
FC_ThrowDetachVisualBlendTag GetDefaultedThrowDetachVisualBlendTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ThrowDetachVisualBlendTag::GetDefaultedThrowDetachVisualBlendTag(Entity);
}
UFUNCTION()
bool RemoveThrowDetachVisualBlendTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ThrowDetachVisualBlendTag);
}
}
FECSMonitorRuntimeView __GetMonitorThrowDetachVisualBlendTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ThrowDetachVisualBlendTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowDetachVisualBlendTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ThrowDetachVisualBlendTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowDetachVisualBlendTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ThrowDetachVisualBlendTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowDetachVisualBlendTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ThrowDetachVisualBlendTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowDetachVisualBlendTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ThrowDetachVisualBlendTag, bFixedFrame, bMustHandleAll);
}
void __MonitorThrowDetachVisualBlendTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ThrowDetachVisualBlendTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowDetachVisualBlendTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ThrowDetachVisualBlendTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowDetachVisualBlendTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ThrowDetachVisualBlendTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ThrowDetachVisualBlendOwnedTag
{
UFUNCTION()
bool HasThrowDetachVisualBlendOwnedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ThrowDetachVisualBlendOwnedTag);
}
FC_ThrowDetachVisualBlendOwnedTag& AssignThrowDetachVisualBlendOwnedTag(const FECSEntity &inout Entity, const FC_ThrowDetachVisualBlendOwnedTag &inout DefaultValue = FC_ThrowDetachVisualBlendOwnedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ThrowDetachVisualBlendOwnedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignThrowDetachVisualBlendOwnedTag_BP(const FECSEntity &inout Entity, const FC_ThrowDetachVisualBlendOwnedTag &inout DefaultValue = FC_ThrowDetachVisualBlendOwnedTag())
{
    ECSFunc_FC_ThrowDetachVisualBlendOwnedTag::AssignThrowDetachVisualBlendOwnedTag(Entity, DefaultValue);
    return;
}
FC_ThrowDetachVisualBlendOwnedTag& ModifyThrowDetachVisualBlendOwnedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ThrowDetachVisualBlendOwnedTag));
    return local_12.GetComp();
}
FC_ThrowDetachVisualBlendOwnedTag& ModifyOrAddThrowDetachVisualBlendOwnedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ThrowDetachVisualBlendOwnedTag));
    return local_12.GetComp();
}
const FC_ThrowDetachVisualBlendOwnedTag& GetThrowDetachVisualBlendOwnedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ThrowDetachVisualBlendOwnedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ThrowDetachVisualBlendOwnedTag GetThrowDetachVisualBlendOwnedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ThrowDetachVisualBlendOwnedTag& local_4 = ECSFunc_FC_ThrowDetachVisualBlendOwnedTag::GetThrowDetachVisualBlendOwnedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ThrowDetachVisualBlendOwnedTag();
}
const FC_ThrowDetachVisualBlendOwnedTag GetDefaultedThrowDetachVisualBlendOwnedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ThrowDetachVisualBlendOwnedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ThrowDetachVisualBlendOwnedTag);
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
FC_ThrowDetachVisualBlendOwnedTag GetDefaultedThrowDetachVisualBlendOwnedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ThrowDetachVisualBlendOwnedTag::GetDefaultedThrowDetachVisualBlendOwnedTag(Entity);
}
UFUNCTION()
bool RemoveThrowDetachVisualBlendOwnedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ThrowDetachVisualBlendOwnedTag);
}
}
FECSMonitorRuntimeView __GetMonitorThrowDetachVisualBlendOwnedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ThrowDetachVisualBlendOwnedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowDetachVisualBlendOwnedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ThrowDetachVisualBlendOwnedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowDetachVisualBlendOwnedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ThrowDetachVisualBlendOwnedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowDetachVisualBlendOwnedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ThrowDetachVisualBlendOwnedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowDetachVisualBlendOwnedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ThrowDetachVisualBlendOwnedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorThrowDetachVisualBlendOwnedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ThrowDetachVisualBlendOwnedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowDetachVisualBlendOwnedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ThrowDetachVisualBlendOwnedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowDetachVisualBlendOwnedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ThrowDetachVisualBlendOwnedTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FThrowPredictPathParams &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FThrowPredictPathParams &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FThrowPredictPathParams
{
int __IndexOf_CollisionScale()
{
    return 0;
}
int __IndexOf_InitSpeed()
{
    return 1;
}
int __IndexOf_GravityScale()
{
    return 2;
}
int __IndexOf_MaxSimTime()
{
    return 3;
}
int __IndexOf_SimFrequency()
{
    return 4;
}
int __IndexOf_bTraceWithCollision()
{
    return 5;
}
int __IndexOf_ShapeInfo()
{
    return 6;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FThrowTargetInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FThrowTargetInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FThrowTargetInfo
{
int __IndexOf_TargetType()
{
    return 0;
}
int __IndexOf_ProjectileKey()
{
    return 1;
}
int __IndexOf_OwnerId()
{
    return 2;
}
int __IndexOf_PropEntityId()
{
    return 3;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FThrowAttachInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FThrowAttachInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FThrowAttachInfo
{
int __IndexOf_SocketName()
{
    return 0;
}
int __IndexOf_AttachLocationOffset()
{
    return 1;
}
int __IndexOf_AttachRotationOffset()
{
    return 2;
}
int __IndexOf_DetachLocationOffset()
{
    return 3;
}
int __IndexOf_DetachRotationOffset()
{
    return 4;
}
int __IndexOf_bUseDetachOffset()
{
    return 5;
}
int __IndexOf_bUseRootRotationOffset()
{
    return 6;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ThrowPredictPathKey &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ThrowPredictPathKey &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ThrowPredictPathKey &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ThrowPredictPathKey
{
int __IndexOf_KeyInfo()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags64 GetDirtyFlags(FC_UpdateThrowPredictPath &inout Data)
{
    FRootDirtyFlags64 __r;
    return __r;
}
void InitDirtyFlags(FC_UpdateThrowPredictPath &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_UpdateThrowPredictPath &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_UpdateThrowPredictPath
{
int __IndexOf_TargetInfo()
{
    return 0;
}
int __IndexOf_PredictPathConfig()
{
    return 4;
}
int __IndexOf_FireData()
{
    return 5;
}
int __IndexOf_AttachInfo()
{
    return 31;
}
int __IndexOf_PredictParams()
{
    return 38;
}
}
