
enum EHitTestCheckResult
{
    Hit,
    NoValidEntity,
    NotActive,
    WrongFaction,
    Invincible,
    Dodge,
    PerfectDodge,
    Airborne,
    HitInvincible,
    GuardInvincible,
    DeadEntity,
    Destructible,
}

enum EHitEffectTriggerTime
{
    FirstHit,
    EveryHit,
    LastHit,
    Destroy,
}

enum EHitShakeBodyType
{
    Default,
    NATIVE_MAX = 0,
    Head,
    Body,
    LeftArm,
    RightArm,
    LeftLeg,
    RightLeg,
    Tail,
}

enum EHitCheckConditionRelationType
{
    AttackerOnly,
    TargetOnly,
    AttackerAndTarget,
}

enum EMutualClashDamageType
{
    Normal,
    Lock,
    Clear,
}

enum ESpecialHitContainerCondition
{
    Any,
    All,
}

namespace __INTENRAL_FC_HitConfig_NS
{
    const TECSComponentDerivedPtr<FC_HitConfig> DerivedPtr = TECSComponentDerivedPtr<FC_HitConfig>();
    const FC_HitConfig DefaultValue = FC_HitConfig();
}
namespace __INTENRAL_FC_IgnoreHitShake_NS
{
    const TECSComponentDerivedPtr<FC_IgnoreHitShake> DerivedPtr = TECSComponentDerivedPtr<FC_IgnoreHitShake>();
    const FC_IgnoreHitShake DefaultValue = FC_IgnoreHitShake();
}
namespace __INTENRAL_FC_HittableConfig_NS
{
    const TECSComponentDerivedPtr<FC_HittableConfig> DerivedPtr = TECSComponentDerivedPtr<FC_HittableConfig>();
    const FC_HittableConfig DefaultValue = FC_HittableConfig();
}
namespace __INTENRAL_FC_HitTestProtectRecord_NS
{
    const TECSComponentDerivedPtr<FC_HitTestProtectRecord> DerivedPtr = TECSComponentDerivedPtr<FC_HitTestProtectRecord>();
    const FC_HitTestProtectRecord DefaultValue = FC_HitTestProtectRecord();
}
namespace __INTENRAL_FC_HittableDataRuntime_NS
{
    const TECSComponentDerivedPtr<FC_HittableDataRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_HittableDataRuntime>();
    const FC_HittableDataRuntime DefaultValue = FC_HittableDataRuntime();
}
namespace __INTENRAL_FC_IgnoreSpecificAttackTagHit_NS
{
    const TECSComponentDerivedPtr<FC_IgnoreSpecificAttackTagHit> DerivedPtr = TECSComponentDerivedPtr<FC_IgnoreSpecificAttackTagHit>();
    const FC_IgnoreSpecificAttackTagHit DefaultValue = FC_IgnoreSpecificAttackTagHit();
}
namespace __INTENRAL_FC_AttackIgnoreSpecificTarget_NS
{
    const TECSComponentDerivedPtr<FC_AttackIgnoreSpecificTarget> DerivedPtr = TECSComponentDerivedPtr<FC_AttackIgnoreSpecificTarget>();
    const FC_AttackIgnoreSpecificTarget DefaultValue = FC_AttackIgnoreSpecificTarget();
}
namespace __INTENRAL_FC_HitReaction_NS
{
    const TECSComponentDerivedPtr<FC_HitReaction> DerivedPtr = TECSComponentDerivedPtr<FC_HitReaction>();
    const FC_HitReaction DefaultValue = FC_HitReaction();
}
namespace __INTENRAL_FC_HitReactionConfig_NS
{
    const TECSComponentDerivedPtr<FC_HitReactionConfig> DerivedPtr = TECSComponentDerivedPtr<FC_HitReactionConfig>();
    const FC_HitReactionConfig DefaultValue = FC_HitReactionConfig();
}
namespace __INTENRAL_FC_BeHitRecoverAttributeConfig_NS
{
    const TECSComponentDerivedPtr<FC_BeHitRecoverAttributeConfig> DerivedPtr = TECSComponentDerivedPtr<FC_BeHitRecoverAttributeConfig>();
    const FC_BeHitRecoverAttributeConfig DefaultValue = FC_BeHitRecoverAttributeConfig();
}
namespace __INTENRAL_FC_AttackerHitPresentationConfig_NS
{
    const TECSComponentDerivedPtr<FC_AttackerHitPresentationConfig> DerivedPtr = TECSComponentDerivedPtr<FC_AttackerHitPresentationConfig>();
    const FC_AttackerHitPresentationConfig DefaultValue = FC_AttackerHitPresentationConfig();
}
namespace __INTENRAL_FC_AttackerHitPresentation_NS
{
    const TECSComponentDerivedPtr<FC_AttackerHitPresentation> DerivedPtr = TECSComponentDerivedPtr<FC_AttackerHitPresentation>();
    const FC_AttackerHitPresentation DefaultValue = FC_AttackerHitPresentation();
}
namespace __INTENRAL_FC_BeHitPresentationConfig_NS
{
    const TECSComponentDerivedPtr<FC_BeHitPresentationConfig> DerivedPtr = TECSComponentDerivedPtr<FC_BeHitPresentationConfig>();
    const FC_BeHitPresentationConfig DefaultValue = FC_BeHitPresentationConfig();
}
namespace __INTENRAL_FC_MutualClash_NS
{
    const TECSComponentDerivedPtr<FC_MutualClash> DerivedPtr = TECSComponentDerivedPtr<FC_MutualClash>();
    const FC_MutualClash DefaultValue = FC_MutualClash();
}
namespace __INTENRAL_FC_MutualClashActionInfo_NS
{
    const TECSComponentDerivedPtr<FC_MutualClashActionInfo> DerivedPtr = TECSComponentDerivedPtr<FC_MutualClashActionInfo>();
    const FC_MutualClashActionInfo DefaultValue = FC_MutualClashActionInfo();
}
namespace __INTENRAL_FC_DefenseHit_NS
{
    const TECSComponentDerivedPtr<FC_DefenseHit> DerivedPtr = TECSComponentDerivedPtr<FC_DefenseHit>();
    const FC_DefenseHit DefaultValue = FC_DefenseHit();
}
namespace __INTENRAL_FC_HitBoxPriorityHit_NS
{
    const TECSComponentDerivedPtr<FC_HitBoxPriorityHit> DerivedPtr = TECSComponentDerivedPtr<FC_HitBoxPriorityHit>();
    const FC_HitBoxPriorityHit DefaultValue = FC_HitBoxPriorityHit();
}
namespace __INTENRAL_FC_OnlyAcceptSpecificEntityAttack_NS
{
    const TECSComponentDerivedPtr<FC_OnlyAcceptSpecificEntityAttack> DerivedPtr = TECSComponentDerivedPtr<FC_OnlyAcceptSpecificEntityAttack>();
    const FC_OnlyAcceptSpecificEntityAttack DefaultValue = FC_OnlyAcceptSpecificEntityAttack();
}
namespace __INTENRAL_FC_IgnoreAttackFromEntities_NS
{
    const TECSComponentDerivedPtr<FC_IgnoreAttackFromEntities> DerivedPtr = TECSComponentDerivedPtr<FC_IgnoreAttackFromEntities>();
    const FC_IgnoreAttackFromEntities DefaultValue = FC_IgnoreAttackFromEntities();
}
namespace __INTENRAL_FCE_MutualClashEvent_NS
{
    const TECSEventDerivedPtr<FCE_MutualClashEvent> DerivedPtr = TECSEventDerivedPtr<FCE_MutualClashEvent>();
}
namespace __INTENRAL_FCE_MutualClashAttributeConsumeEvent_NS
{
    const TECSEventDerivedPtr<FCE_MutualClashAttributeConsumeEvent> DerivedPtr = TECSEventDerivedPtr<FCE_MutualClashAttributeConsumeEvent>();
}
namespace __INTENRAL_FCE_MutualClashPlayerBeHitFromNoRangeEvent_NS
{
    const TECSEventDerivedPtr<FCE_MutualClashPlayerBeHitFromNoRangeEvent> DerivedPtr = TECSEventDerivedPtr<FCE_MutualClashPlayerBeHitFromNoRangeEvent>();
}
namespace __INTENRAL_FCE_DefenseHitEvent_NS
{
    const TECSEventDerivedPtr<FCE_DefenseHitEvent> DerivedPtr = TECSEventDerivedPtr<FCE_DefenseHitEvent>();

}
struct FHitTestCheckResult
{
    UPROPERTY()
    int ConditionalResolveIndex = -1;
    UPROPERTY()
    EHitTestCheckResult CheckResult;
    UPROPERTY()
    EFactionRelationSplitSelf Relation;


}

struct FHitStrikeData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FDataObjectPtr m_DecalConfig;
    UPROPERTY()
    FAreaStrikeShape m_StrikeShape;
    UPROPERTY()
    FVector m_StrikeDirection;
    UPROPERTY()
    bool m_bUseCustomStrikeTransform;
    UPROPERTY()
    FVector m_CustomStrikeTransformPos;
    UPROPERTY()
    FQuat m_CustomStrikeTransformRot;

    FHitStrikeData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FHitStrikeData(const FHitStrikeData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FHitStrikeData opAssign(const FHitStrikeData &inout Other)
    {
        FHitStrikeData __r;
        this.SetDecalConfig(Other.GetDecalConfig());
        this.SetStrikeShape(Other.GetStrikeShape());
        this.SetStrikeDirection(Other.GetStrikeDirection());
        this.SetbUseCustomStrikeTransform(Other.GetbUseCustomStrikeTransform());
        this.SetCustomStrikeTransformPos(Other.GetCustomStrikeTransformPos());
        this.SetCustomStrikeTransformRot(Other.GetCustomStrikeTransformRot());
        return __r;
    }
    const FDataObjectPtr GetDecalConfig() const property
    {
        const FDataObjectPtr __r;
        return __r;
    }
    FDataObjectPtr GetModify_DecalConfig() property
    {
        FDataObjectPtr __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDecalConfig(const FDataObjectPtr &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DecalConfig = __Value;
        return;
    }
    const FAreaStrikeShape GetStrikeShape() const property
    {
        const FAreaStrikeShape __r;
        return __r;
    }
    FAreaStrikeShape GetModify_StrikeShape() property
    {
        FAreaStrikeShape __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetStrikeShape(const FAreaStrikeShape &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_StrikeShape = __Value;
        return;
    }
    const FVector GetStrikeDirection() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_StrikeDirection() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetStrikeDirection(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_StrikeDirection = __Value;
        return;
    }
    bool GetbUseCustomStrikeTransform() const property
    {
        return this.m_bUseCustomStrikeTransform;
    }
    void SetbUseCustomStrikeTransform(const bool __Value) property
    {
        if (!(this.m_bUseCustomStrikeTransform) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bUseCustomStrikeTransform = __Value;
        return;
    }
    const FVector GetCustomStrikeTransformPos() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_CustomStrikeTransformPos() property
    {
        FVector __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetCustomStrikeTransformPos(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_CustomStrikeTransformPos = __Value;
        return;
    }
    const FQuat GetCustomStrikeTransformRot() const property
    {
        const FQuat __r;
        return __r;
    }
    FQuat GetModify_CustomStrikeTransformRot() property
    {
        FQuat __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetCustomStrikeTransformRot(const FQuat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_CustomStrikeTransformRot = __Value;
        return;
    }
}

struct FHitEventParam
{
    UPROPERTY()
    bool bPredictable = true;
    UPROPERTY()
    bool bClientWaitForServerOnHit = false;
    UPROPERTY()
    bool bNeedHitMeshPresentation = true;
    UPROPERTY()
    bool bAttackHitFXSpawnToStrikeCenterLine = false;
    UPROPERTY()
    bool bHitWeakness = false;
    UPROPERTY()
    FName HitBoneName;
    UPROPERTY()
    UGamePhysicalMaterial PhysicalMaterial = nullptr;
    UPROPERTY()
    FName HitBodyPart;
    UPROPERTY()
    EHitShakeBodyType HitShakeBodyType;
    UPROPERTY()
    FName OverrideAnimSocket;
    UPROPERTY()
    FVector HitPosition;
    UPROPERTY()
    FStrikeEventData StrikeData;
    UPROPERTY()
    FTransform CustomStrikeTransform;
    UPROPERTY()
    FDataObjectPtr HitDecalConfig;
    UPROPERTY()
    FName StrikeKey;
    UPROPERTY()
    TDataObjectPtr<FAttackData> AttackData;


}

struct FHitPresentationData
{
    UPROPERTY()
    UMeshComponent HitMeshComp;
    UPROPERTY()
    FVector HitFanPlaneNormal;
    UPROPERTY()
    FVector HitLocation;
    UPROPERTY()
    FVector HitNormal;
    UPROPERTY()
    FName HitBoneName;
    UPROPERTY()
    UPhysicalMaterial PhysicsMaterial = nullptr;

    FHitPresentationData()
    {
        return;
    }
}

struct FC_HitConfig : FECSComponent
{
    UPROPERTY()
    int MaxHitCount = 1;
    UPROPERTY()
    int MaxHitCountPerTarget = 1;
    UPROPERTY()
    float32 AttenuationRatioPerHit = 1.0f;
    UPROPERTY()
    float32 AttenuationRatioMin = 0.1f;
    UPROPERTY()
    FFPTime HitInterval = -1;


}

struct FC_IgnoreHitShake : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint8 m_Counter;

    FC_IgnoreHitShake()
    {
        this.m_Counter = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_IgnoreHitShake(const FC_IgnoreHitShake &inout Other)
    {
        this.m_Counter = false;
        this.__InitDirtyFlags();
        this.m_Counter = (int(Other.m_Counter) != 0);
        return;
    }
    FC_IgnoreHitShake opAssign(const FC_IgnoreHitShake &inout Other)
    {
        FC_IgnoreHitShake __r;
        this.SetCounter(uint8(Other.GetCounter()));
        return __r;
    }
    uint8 GetCounter() const property
    {
        return this.m_Counter;
    }
    void SetCounter(const uint8 __Value) property
    {
        if (this.m_Counter == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Counter = (__Value != 0);
        return;
    }
}

struct FHitCheckCondition
{
    UPROPERTY()
    uint8 Relation = (2 != 0);
    UPROPERTY()
    EHitCheckConditionRelationType RelationCheckType = EHitCheckConditionRelationType(0);
    UPROPERTY()
    bool bInverseCheckTags = false;
    UPROPERTY()
    TArray<FName> AttackTags;


}

struct FHitResolveOption
{
    UPROPERTY()
    float32 OverrideDamageToHp = -1.0f;
    UPROPERTY()
    float32 MinHpReserve = -1.0f;
    UPROPERTY()
    float32 MaxDamageToHp = -1.0f;
    UPROPERTY()
    int OverrideDamageToHitCount = -1;
    UPROPERTY()
    int MinHitCountReserve = -1;
    UPROPERTY()
    int MaxDamageToHitCount = -1;


}

struct FHitCondtionResolvePair
{
    UPROPERTY()
    FHitCheckCondition Condition;
    UPROPERTY()
    FHitResolveOption ResolveOption;

    FHitCondtionResolvePair()
    {
        return;
    }
}

struct FC_HittableConfig : FECSComponent
{
    UPROPERTY()
    bool bNoReactToProjectile = false;
    UPROPERTY()
    FHitCheckCondition DefaultCondition;
    UPROPERTY()
    FHitResolveOption DefaultResolveOption;
    UPROPERTY()
    TArray<FHitCondtionResolvePair> ConditionalResolveOptions;


}

struct FC_HitTestProtectRecord : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FName, FFPTime> m_MultiStrikeProtect;
    UPROPERTY()
    TMap<FName, FFPTime> m_DodgeProtect;
    UPROPERTY()
    TMap<FName, FFPTime> m_ForceHitInvincible;

    FC_HitTestProtectRecord()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_HitTestProtectRecord(const FC_HitTestProtectRecord &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_MultiStrikeProtect = Other.m_MultiStrikeProtect;
        this.m_DodgeProtect = Other.m_DodgeProtect;
        this.m_ForceHitInvincible = Other.m_ForceHitInvincible;
        return;
    }
    FC_HitTestProtectRecord opAssign(const FC_HitTestProtectRecord &inout Other)
    {
        FC_HitTestProtectRecord __r;
        this.SetMultiStrikeProtect(Other.GetMultiStrikeProtect());
        this.SetDodgeProtect(Other.GetDodgeProtect());
        this.SetForceHitInvincible(Other.GetForceHitInvincible());
        return __r;
    }
    const TMap<FName, FFPTime> GetMultiStrikeProtect() const property
    {
        const TMap<FName, FFPTime> __r;
        return __r;
    }
    TMap<FName, FFPTime> GetModify_MultiStrikeProtect() property
    {
        TMap<FName, FFPTime> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetMultiStrikeProtect(const TMap<FName, FFPTime> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MultiStrikeProtect = __Value;
        return;
    }
    const TMap<FName, FFPTime> GetDodgeProtect() const property
    {
        const TMap<FName, FFPTime> __r;
        return __r;
    }
    TMap<FName, FFPTime> GetModify_DodgeProtect() property
    {
        TMap<FName, FFPTime> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetDodgeProtect(const TMap<FName, FFPTime> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_DodgeProtect = __Value;
        return;
    }
    const TMap<FName, FFPTime> GetForceHitInvincible() const property
    {
        const TMap<FName, FFPTime> __r;
        return __r;
    }
    TMap<FName, FFPTime> GetModify_ForceHitInvincible() property
    {
        TMap<FName, FFPTime> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetForceHitInvincible(const TMap<FName, FFPTime> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ForceHitInvincible = __Value;
        return;
    }
}

struct FHitStatisticData
{
    UPROPERTY()
    int m_HitCount;
    UPROPERTY()
    float32 m_DamageToHp;


    int GetHitCount() const property
    {
        return this.m_HitCount;
    }
    void SetHitCount(const int __Value) property
    {
        this.m_HitCount = __Value;
        return;
    }
    float32 GetDamageToHp() const property
    {
        return this.m_DamageToHp;
    }
    void SetDamageToHp(const float32 __Value) property
    {
        this.m_DamageToHp = __Value;
        return;
    }
}

struct FC_HittableDataRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FHitStatisticData m_DefaultHitData;
    UPROPERTY()
    TArray<FHitStatisticData> m_ConditionalHitDatas;

    FC_HittableDataRuntime()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_HittableDataRuntime(const FC_HittableDataRuntime &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DefaultHitData = Other.m_DefaultHitData;
        this.m_ConditionalHitDatas = Other.m_ConditionalHitDatas;
        return;
    }
    FC_HittableDataRuntime opAssign(const FC_HittableDataRuntime &inout Other)
    {
        FC_HittableDataRuntime __r;
        this.SetDefaultHitData(Other.GetDefaultHitData());
        this.SetConditionalHitDatas(Other.GetConditionalHitDatas());
        return __r;
    }
    const FHitStatisticData GetDefaultHitData() const property
    {
        const FHitStatisticData __r;
        return __r;
    }
    FHitStatisticData GetModify_DefaultHitData() property
    {
        FHitStatisticData __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDefaultHitData(const FHitStatisticData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DefaultHitData = __Value;
        return;
    }
    const TArray<FHitStatisticData> GetConditionalHitDatas() const property
    {
        const TArray<FHitStatisticData> __r;
        return __r;
    }
    TArray<FHitStatisticData> GetModify_ConditionalHitDatas() property
    {
        TArray<FHitStatisticData> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetConditionalHitDatas(const TArray<FHitStatisticData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ConditionalHitDatas = __Value;
        return;
    }
}

struct FC_IgnoreSpecificAttackTagHit : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bInverseIgnore;
    UPROPERTY()
    TMap<FName, int> m_CountByTagName;

    FC_IgnoreSpecificAttackTagHit()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_IgnoreSpecificAttackTagHit(const FC_IgnoreSpecificAttackTagHit &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_IgnoreSpecificAttackTagHit opAssign(const FC_IgnoreSpecificAttackTagHit &inout Other)
    {
        FC_IgnoreSpecificAttackTagHit __r;
        this.SetbInverseIgnore(Other.GetbInverseIgnore());
        this.SetCountByTagName(Other.GetCountByTagName());
        return __r;
    }
    bool GetbInverseIgnore() const property
    {
        return this.m_bInverseIgnore;
    }
    void SetbInverseIgnore(const bool __Value) property
    {
        if (!(this.m_bInverseIgnore) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bInverseIgnore = __Value;
        return;
    }
    const TMap<FName, int> GetCountByTagName() const property
    {
        const TMap<FName, int> __r;
        return __r;
    }
    TMap<FName, int> GetModify_CountByTagName() property
    {
        TMap<FName, int> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetCountByTagName(const TMap<FName, int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CountByTagName = __Value;
        return;
    }
}

struct FC_AttackIgnoreSpecificTarget : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<TDataObjectPtr<FAttackData>, TDataObjectPtr<FAttackIgnoreTargetCondition>> m_ConditionByAttackData;

    FC_AttackIgnoreSpecificTarget()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_AttackIgnoreSpecificTarget(const FC_AttackIgnoreSpecificTarget &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_ConditionByAttackData = Other.m_ConditionByAttackData;
        return;
    }
    FC_AttackIgnoreSpecificTarget opAssign(const FC_AttackIgnoreSpecificTarget &inout Other)
    {
        FC_AttackIgnoreSpecificTarget __r;
        this.SetConditionByAttackData(Other.GetConditionByAttackData());
        return __r;
    }
    const TMap<TDataObjectPtr<FAttackData>, TDataObjectPtr<FAttackIgnoreTargetCondition>> GetConditionByAttackData() const property
    {
        const TMap<TDataObjectPtr<FAttackData>, TDataObjectPtr<FAttackIgnoreTargetCondition>> __r;
        return __r;
    }
    TMap<TDataObjectPtr<FAttackData>, TDataObjectPtr<FAttackIgnoreTargetCondition>> GetModify_ConditionByAttackData() property
    {
        TMap<TDataObjectPtr<FAttackData>, TDataObjectPtr<FAttackIgnoreTargetCondition>> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetConditionByAttackData(const TMap<TDataObjectPtr<FAttackData>, TDataObjectPtr<FAttackIgnoreTargetCondition>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ConditionByAttackData = __Value;
        return;
    }
}

struct FHitBreakResistanceData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_Leve2Count;
    UPROPERTY()
    int m_Leve3Count;
    UPROPERTY()
    int m_Leve4Count;

    FHitBreakResistanceData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FHitBreakResistanceData(const FHitBreakResistanceData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FHitBreakResistanceData opAssign(const FHitBreakResistanceData &inout Other)
    {
        FHitBreakResistanceData __r;
        this.SetLeve2Count(Other.GetLeve2Count());
        this.SetLeve3Count(Other.GetLeve3Count());
        this.SetLeve4Count(Other.GetLeve4Count());
        return __r;
    }
    EHitBreakResistanceLevel GetResistanceLevel() const
    {
        if (this.GetLeve4Count() > 0)
        {
            return EHitBreakResistanceLevel(4);
        }
        if (this.GetLeve3Count() > 0)
        {
            return EHitBreakResistanceLevel(3);
        }
        if (this.GetLeve2Count() > 0)
        {
            return EHitBreakResistanceLevel(2);
        }
        return EHitBreakResistanceLevel(1);
    }
    bool CanBreak(const EHitBreakLevel Level) const
    {
        int local_5 = int(Level);
        int local_6 = int(this.GetResistanceLevel());
        return (local_5 >= local_6);
    }
    int GetLeve2Count() const property
    {
        return this.m_Leve2Count;
    }
    void SetLeve2Count(const int __Value) property
    {
        if (this.m_Leve2Count == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Leve2Count = __Value;
        return;
    }
    int GetLeve3Count() const property
    {
        return this.m_Leve3Count;
    }
    void SetLeve3Count(const int __Value) property
    {
        if (this.m_Leve3Count == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Leve3Count = __Value;
        return;
    }
    int GetLeve4Count() const property
    {
        return this.m_Leve4Count;
    }
    void SetLeve4Count(const int __Value) property
    {
        if (this.m_Leve4Count == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Leve4Count = __Value;
        return;
    }
}

struct FC_HitReaction : FECSComponent
{
    FRootDirtyFlags32 __DirtyFlags;
    UPROPERTY()
    TArray<EHitReactionState> m_StackedHitStates;
    UPROPERTY()
    bool m_bIsBlowHeavy;
    UPROPERTY()
    float32 m_HitAngle;
    UPROPERTY()
    float32 m_HitFromAngle;
    UPROPERTY()
    float32 m_HitImpulseFromAngle;
    UPROPERTY()
    float32 m_HitImpulseX;
    UPROPERTY()
    float32 m_HitImpulseZ;
    UPROPERTY()
    EPrefabType m_AttackerPrefabType;
    UPROPERTY()
    FFPTime m_DamageStartTime;
    UPROPERTY()
    FFPTime m_BreakStartTime;
    UPROPERTY()
    float32 m_HitStunDuration;
    UPROPERTY()
    FHitBreakResistanceData m_HitBreakResistance;
    UPROPERTY()
    FFPTime m_LastHitProtectTime;
    UPROPERTY()
    int m_HitProtectCount;
    UPROPERTY()
    int m_StaggerCount;
    UPROPERTY()
    bool m_bToBreakCurFrame;

    FC_HitReaction()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_HitReaction(const FC_HitReaction &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_HitReaction opAssign(const FC_HitReaction &inout Other)
    {
        FC_HitReaction __r;
        this.SetStackedHitStates(Other.GetStackedHitStates());
        this.SetbIsBlowHeavy(Other.GetbIsBlowHeavy());
        this.SetHitAngle(Other.GetHitAngle());
        this.SetHitFromAngle(Other.GetHitFromAngle());
        this.SetHitImpulseFromAngle(Other.GetHitImpulseFromAngle());
        this.SetHitImpulseX(Other.GetHitImpulseX());
        this.SetHitImpulseZ(Other.GetHitImpulseZ());
        this.SetAttackerPrefabType(Other.GetAttackerPrefabType());
        this.SetDamageStartTime(Other.GetDamageStartTime());
        this.SetBreakStartTime(Other.GetBreakStartTime());
        this.SetHitStunDuration(Other.GetHitStunDuration());
        this.SetHitBreakResistance(Other.GetHitBreakResistance());
        this.SetLastHitProtectTime(Other.GetLastHitProtectTime());
        this.SetHitProtectCount(Other.GetHitProtectCount());
        this.SetStaggerCount(Other.GetStaggerCount());
        this.SetbToBreakCurFrame(Other.GetbToBreakCurFrame());
        return __r;
    }
    EHitReactionState GetCurrentHitState() const property
    {
        if (this.GetStackedHitStates().Num() == 0)
        {
            return EHitReactionState(0);
        }
        int local_6 = this.GetStackedHitStates().Num() - 1;
        for (; local_6 >= 0; --local_6)
        {
            if ((int(this.GetStackedHitStates()[local_6])) != 0)
            {
                return this.GetStackedHitStates()[local_6];
            }
        }
        return EHitReactionState(0);
    }
    int PushHitState(const EHitReactionState HitState)
    {
        if (int(HitState) == 0)
        {
            XError(ELog(42), "FC_HitReaction PushHitState is None");
            return -1;
        }
        return this.GetModify_StackedHitStates().Add(HitState);
    }
    void DiscardHitState(const int Index)
    {
        if (Index >= 0 && (Index < this.GetStackedHitStates().Num()))
        {
            this.GetModify_StackedHitStates()[Index] = EHitReactionState(0);
        }
        int local_7 = this.GetStackedHitStates().Num() - 1;
        for (; local_7 >= 0; --local_7)
        {
            if ((int(this.GetStackedHitStates()[local_7])) == 0)
            {
                this.GetModify_StackedHitStates().RemoveAt(local_7);
                continue;
            }
            break;
        }
        return;
    }
    const TArray<EHitReactionState> GetStackedHitStates() const property
    {
        const TArray<EHitReactionState> __r;
        return __r;
    }
    TArray<EHitReactionState> GetModify_StackedHitStates() property
    {
        TArray<EHitReactionState> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetStackedHitStates(const TArray<EHitReactionState> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_StackedHitStates = __Value;
        return;
    }
    bool GetbIsBlowHeavy() const property
    {
        return this.m_bIsBlowHeavy;
    }
    void SetbIsBlowHeavy(const bool __Value) property
    {
        if (!(this.m_bIsBlowHeavy) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bIsBlowHeavy = __Value;
        return;
    }
    float32 GetHitAngle() const property
    {
        return this.m_HitAngle;
    }
    void SetHitAngle(const float32 __Value) property
    {
        if (this.m_HitAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_HitAngle = __Value;
        return;
    }
    float32 GetHitFromAngle() const property
    {
        return this.m_HitFromAngle;
    }
    void SetHitFromAngle(const float32 __Value) property
    {
        if (this.m_HitFromAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_HitFromAngle = __Value;
        return;
    }
    float32 GetHitImpulseFromAngle() const property
    {
        return this.m_HitImpulseFromAngle;
    }
    void SetHitImpulseFromAngle(const float32 __Value) property
    {
        if (this.m_HitImpulseFromAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_HitImpulseFromAngle = __Value;
        return;
    }
    float32 GetHitImpulseX() const property
    {
        return this.m_HitImpulseX;
    }
    void SetHitImpulseX(const float32 __Value) property
    {
        if (this.m_HitImpulseX == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_HitImpulseX = __Value;
        return;
    }
    float32 GetHitImpulseZ() const property
    {
        return this.m_HitImpulseZ;
    }
    void SetHitImpulseZ(const float32 __Value) property
    {
        if (this.m_HitImpulseZ == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_HitImpulseZ = __Value;
        return;
    }
    EPrefabType GetAttackerPrefabType() const property
    {
        return this.m_AttackerPrefabType;
    }
    void SetAttackerPrefabType(const EPrefabType __Value) property
    {
        if (int(this.m_AttackerPrefabType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_AttackerPrefabType = __Value;
        return;
    }
    const FFPTime GetDamageStartTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_DamageStartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(8);
        return __r;
    }
    void SetDamageStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_DamageStartTime = __Value;
        return;
    }
    const FFPTime GetBreakStartTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_BreakStartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(9);
        return __r;
    }
    void SetBreakStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_BreakStartTime = __Value;
        return;
    }
    float32 GetHitStunDuration() const property
    {
        return this.m_HitStunDuration;
    }
    void SetHitStunDuration(const float32 __Value) property
    {
        if (this.m_HitStunDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_HitStunDuration = __Value;
        return;
    }
    const FHitBreakResistanceData GetHitBreakResistance() const property
    {
        const FHitBreakResistanceData __r;
        return __r;
    }
    FHitBreakResistanceData GetHitBreakResistance() property
    {
        FHitBreakResistanceData __r;
        return __r;
    }
    void SetHitBreakResistance(const FHitBreakResistanceData &inout __Value) property
    {
        this.m_HitBreakResistance = __Value;
        return;
    }
    const FFPTime GetLastHitProtectTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_LastHitProtectTime() property
    {
        FFPTime __r;
        this.__MarkDirty(14);
        return __r;
    }
    void SetLastHitProtectTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_LastHitProtectTime = __Value;
        return;
    }
    int GetHitProtectCount() const property
    {
        return this.m_HitProtectCount;
    }
    void SetHitProtectCount(const int __Value) property
    {
        if (this.m_HitProtectCount == __Value)
        {
            return;
        }
        this.__MarkDirty(15);
        this.m_HitProtectCount = __Value;
        return;
    }
    int GetStaggerCount() const property
    {
        return this.m_StaggerCount;
    }
    void SetStaggerCount(const int __Value) property
    {
        if (this.m_StaggerCount == __Value)
        {
            return;
        }
        this.__MarkDirty(16);
        this.m_StaggerCount = __Value;
        return;
    }
    bool GetbToBreakCurFrame() const property
    {
        return this.m_bToBreakCurFrame;
    }
    void SetbToBreakCurFrame(const bool __Value) property
    {
        if (!(this.m_bToBreakCurFrame) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(17);
        this.m_bToBreakCurFrame = __Value;
        return;
    }
}

struct FC_HitReactionConfig : FECSComponent
{
    UPROPERTY()
    bool bUseNewHitStateTransit = false;
    UPROPERTY()
    EHitReactionType HitReactionType = EHitReactionType(0);
    UPROPERTY()
    EHitReactionPrefabBodyType PrefabBodyType = EHitReactionPrefabBodyType(0);
    UPROPERTY()
    EBeHitCheckDirectionType BeHitCheckDirectionType = EBeHitCheckDirectionType(0);
    UPROPERTY()
    EBeHitCheckDirectionType BossGroundStaggerDirectionType = EBeHitCheckDirectionType(1);
    UPROPERTY()
    EBeHitCheckDirectionType BossGroundBreakDirectionType = EBeHitCheckDirectionType(1);
    UPROPERTY()
    EAirHitReactionType BossAirHitReactionType = EAirHitReactionType(2);
    UPROPERTY()
    EBeHitCheckDirectionType BossAirStaggerDirectionType = EBeHitCheckDirectionType(1);
    UPROPERTY()
    EHitTurnType HitTurnType = EHitTurnType(0);
    UPROPERTY()
    TArray<float32> PosturePhaseList;
    UPROPERTY()
    bool CanBeHitFreezeFrame = false;
    UPROPERTY()
    bool CanBlowUp = true;
    UPROPERTY()
    float32 HeavyHitTime = 0.7f;
    UPROPERTY()
    float32 RetreatHitTime = 0.7f;
    UPROPERTY()
    float32 BlowStartHitTime = 0.7f;
    UPROPERTY()
    float32 LandTime = 1.0f;
    UPROPERTY()
    float32 LieDownTime = 2.0f;
    UPROPERTY()
    float32 StaggerHitTime = 2.0f;
    UPROPERTY()
    float32 StaggerAirHitTime = 2.0f;
    UPROPERTY()
    float32 BreakStartTime = 2.0f;
    UPROPERTY()
    float32 BreakAirStartTime = 2.0f;
    UPROPERTY()
    float32 BreakEndTime = 2.0f;
    UPROPERTY()
    float32 BreakTime = 5.0f;
    UPROPERTY()
    float32 DeathTime = 3.0f;
    UPROPERTY()
    float32 DeathDestroyTime = 5.0f;
    UPROPERTY()
    TMap<EAbnormalState, FName> AbnormalStateHitState;
    UPROPERTY()
    TMap<EAbnormalState, FName> WeaknessAbnormalStateHitState;
    UPROPERTY()
    EHitBreakResistanceLevel DefaultHitBreakResistanceLevel = EHitBreakResistanceLevel(1);


}

struct FBeHitRecoverAttribute
{
    UPROPERTY()
    FGameAttributeRef GameAttribute;
    UPROPERTY()
    float32 RecoverValue;


}

struct FC_BeHitRecoverAttributeConfig : FECSComponent
{
    UPROPERTY()
    TArray<FBeHitRecoverAttribute> BeHitRecoverAttributeConfig;

    FC_BeHitRecoverAttributeConfig()
    {
        return;
    }
}

struct FC_AttackerHitPresentationConfig : FECSComponent
{
    UPROPERTY()
    bool bShowDamageNumToOwner = true;


}

struct FC_AttackerHitPresentation : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_AttackerHitOwner;

    FC_AttackerHitPresentation()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_AttackerHitPresentation(const FC_AttackerHitPresentation &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_AttackerHitOwner = Other.m_AttackerHitOwner;
        return;
    }
    FC_AttackerHitPresentation opAssign(const FC_AttackerHitPresentation &inout Other)
    {
        FC_AttackerHitPresentation __r;
        this.SetAttackerHitOwner(Other.GetAttackerHitOwner());
        return __r;
    }
    const FECSEntity GetAttackerHitOwner() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_AttackerHitOwner() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAttackerHitOwner(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AttackerHitOwner = __Value;
        return;
    }
}

struct FC_BeHitPresentationConfig : FECSComponent
{
    UPROPERTY()
    bool bShowHitFX = true;
    UPROPERTY()
    bool bShowDamageNum = true;


}

struct FC_MutualClash : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bIsPlayer;
    UPROPERTY()
    int m_TotalClashCount;
    UPROPERTY()
    float32 m_HitAngle;
    UPROPERTY()
    float32 m_HitFromAngle;

    FC_MutualClash()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_MutualClash(const FC_MutualClash &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_MutualClash opAssign(const FC_MutualClash &inout Other)
    {
        FC_MutualClash __r;
        this.SetbIsPlayer(Other.GetbIsPlayer());
        this.SetTotalClashCount(Other.GetTotalClashCount());
        this.SetHitAngle(Other.GetHitAngle());
        this.SetHitFromAngle(Other.GetHitFromAngle());
        return __r;
    }
    bool GetbIsPlayer() const property
    {
        return this.m_bIsPlayer;
    }
    void SetbIsPlayer(const bool __Value) property
    {
        if (!(this.m_bIsPlayer) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bIsPlayer = __Value;
        return;
    }
    int GetTotalClashCount() const property
    {
        return this.m_TotalClashCount;
    }
    void SetTotalClashCount(const int __Value) property
    {
        if (this.m_TotalClashCount == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TotalClashCount = __Value;
        return;
    }
    float32 GetHitAngle() const property
    {
        return this.m_HitAngle;
    }
    void SetHitAngle(const float32 __Value) property
    {
        if (this.m_HitAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_HitAngle = __Value;
        return;
    }
    float32 GetHitFromAngle() const property
    {
        return this.m_HitFromAngle;
    }
    void SetHitFromAngle(const float32 __Value) property
    {
        if (this.m_HitFromAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_HitFromAngle = __Value;
        return;
    }
}

struct FC_MutualClashActionInfo : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    bool m_bIsPlayer;
    UPROPERTY()
    EMutualClashDamageType m_MutualClashDamageType;
    UPROPERTY()
    float32 m_ConsumeMutualClashValue;
    UPROPERTY()
    bool m_bTrigger;
    UPROPERTY()
    bool m_bHappenClash;
    UPROPERTY()
    bool m_bCheckDirection;
    UPROPERTY()
    FECSEntity m_FromEntity;
    UPROPERTY()
    FECSEntity m_EventEntity;
    UPROPERTY()
    FName m_HitState;

    FC_MutualClashActionInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_MutualClashActionInfo(const FC_MutualClashActionInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_MutualClashActionInfo opAssign(const FC_MutualClashActionInfo &inout Other)
    {
        FC_MutualClashActionInfo __r;
        this.SetbIsPlayer(Other.GetbIsPlayer());
        this.SetMutualClashDamageType(Other.GetMutualClashDamageType());
        this.SetConsumeMutualClashValue(Other.GetConsumeMutualClashValue());
        this.SetbTrigger(Other.GetbTrigger());
        this.SetbHappenClash(Other.GetbHappenClash());
        this.SetbCheckDirection(Other.GetbCheckDirection());
        this.SetFromEntity(Other.GetFromEntity());
        this.SetEventEntity(Other.GetEventEntity());
        this.SetHitState(Other.GetHitState());
        return __r;
    }
    bool GetbIsPlayer() const property
    {
        return this.m_bIsPlayer;
    }
    void SetbIsPlayer(const bool __Value) property
    {
        if (!(this.m_bIsPlayer) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bIsPlayer = __Value;
        return;
    }
    EMutualClashDamageType GetMutualClashDamageType() const property
    {
        return this.m_MutualClashDamageType;
    }
    void SetMutualClashDamageType(const EMutualClashDamageType __Value) property
    {
        if (int(this.m_MutualClashDamageType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MutualClashDamageType = __Value;
        return;
    }
    float32 GetConsumeMutualClashValue() const property
    {
        return this.m_ConsumeMutualClashValue;
    }
    void SetConsumeMutualClashValue(const float32 __Value) property
    {
        if (this.m_ConsumeMutualClashValue == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ConsumeMutualClashValue = __Value;
        return;
    }
    bool GetbTrigger() const property
    {
        return this.m_bTrigger;
    }
    void SetbTrigger(const bool __Value) property
    {
        if (!(this.m_bTrigger) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bTrigger = __Value;
        return;
    }
    bool GetbHappenClash() const property
    {
        return this.m_bHappenClash;
    }
    void SetbHappenClash(const bool __Value) property
    {
        if (!(this.m_bHappenClash) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bHappenClash = __Value;
        return;
    }
    bool GetbCheckDirection() const property
    {
        return this.m_bCheckDirection;
    }
    void SetbCheckDirection(const bool __Value) property
    {
        if (!(this.m_bCheckDirection) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bCheckDirection = __Value;
        return;
    }
    const FECSEntity GetFromEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_FromEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetFromEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_FromEntity = __Value;
        return;
    }
    const FECSEntity GetEventEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_EventEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetEventEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_EventEntity = __Value;
        return;
    }
    FName GetHitState() const property
    {
        return this.m_HitState;
    }
    void SetHitState(const FName &inout __Value) property
    {
        if ((this.m_HitState == __Value))
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_HitState = __Value;
        return;
    }
}

struct FCE_MutualClashEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName Name;
    UPROPERTY()
    FECSEntity BeMutualClashEntity;

    FCE_MutualClashEvent()
    {
        return;
    }
}

struct FCE_MutualClashAttributeConsumeEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bPlayerBeHit = false;
    UPROPERTY()
    FECSEntity BeMutualClashEntity;


}

struct FCE_MutualClashPlayerBeHitFromNoRangeEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_MutualClashPlayerBeHitFromNoRangeEvent()
    {
        return;
    }
}

struct FDefenseHitData
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    bool m_bIsParry;
    UPROPERTY()
    bool m_bCanDefense;
    UPROPERTY()
    bool m_bBanAttackPresentation;
    UPROPERTY()
    float32 m_DefenseSuccessConsumeStamina;
    UPROPERTY()
    float32 m_DefenseFailedConsumeStamina;
    UPROPERTY()
    bool m_bBreakWhenStaminaClear;
    UPROPERTY()
    FName m_BreakStateWhenStaminaClear;
    UPROPERTY()
    float32 m_DefenseSuccessDamageRatio;
    UPROPERTY()
    float32 m_DefenseFailedDamageRatio;
    UPROPERTY()
    bool m_bTransitDefenseSuccess;
    UPROPERTY()
    FName m_DefenseSuccessTransitStateName;
    UPROPERTY()
    bool m_bTransitDefenseFailed;
    UPROPERTY()
    FName m_DefenseFailedTransitStateName;

    FDefenseHitData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDefenseHitData(const FDefenseHitData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDefenseHitData opAssign(const FDefenseHitData &inout Other)
    {
        FDefenseHitData __r;
        this.SetbIsParry(Other.GetbIsParry());
        this.SetbCanDefense(Other.GetbCanDefense());
        this.SetbBanAttackPresentation(Other.GetbBanAttackPresentation());
        this.SetDefenseSuccessConsumeStamina(Other.GetDefenseSuccessConsumeStamina());
        this.SetDefenseFailedConsumeStamina(Other.GetDefenseFailedConsumeStamina());
        this.SetbBreakWhenStaminaClear(Other.GetbBreakWhenStaminaClear());
        this.SetBreakStateWhenStaminaClear(Other.GetBreakStateWhenStaminaClear());
        this.SetDefenseSuccessDamageRatio(Other.GetDefenseSuccessDamageRatio());
        this.SetDefenseFailedDamageRatio(Other.GetDefenseFailedDamageRatio());
        this.SetbTransitDefenseSuccess(Other.GetbTransitDefenseSuccess());
        this.SetDefenseSuccessTransitStateName(Other.GetDefenseSuccessTransitStateName());
        this.SetbTransitDefenseFailed(Other.GetbTransitDefenseFailed());
        this.SetDefenseFailedTransitStateName(Other.GetDefenseFailedTransitStateName());
        return __r;
    }
    bool GetbIsParry() const property
    {
        return this.m_bIsParry;
    }
    void SetbIsParry(const bool __Value) property
    {
        if (!(this.m_bIsParry) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bIsParry = __Value;
        return;
    }
    bool GetbCanDefense() const property
    {
        return this.m_bCanDefense;
    }
    void SetbCanDefense(const bool __Value) property
    {
        if (!(this.m_bCanDefense) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bCanDefense = __Value;
        return;
    }
    bool GetbBanAttackPresentation() const property
    {
        return this.m_bBanAttackPresentation;
    }
    void SetbBanAttackPresentation(const bool __Value) property
    {
        if (!(this.m_bBanAttackPresentation) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bBanAttackPresentation = __Value;
        return;
    }
    float32 GetDefenseSuccessConsumeStamina() const property
    {
        return this.m_DefenseSuccessConsumeStamina;
    }
    void SetDefenseSuccessConsumeStamina(const float32 __Value) property
    {
        if (this.m_DefenseSuccessConsumeStamina == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_DefenseSuccessConsumeStamina = __Value;
        return;
    }
    float32 GetDefenseFailedConsumeStamina() const property
    {
        return this.m_DefenseFailedConsumeStamina;
    }
    void SetDefenseFailedConsumeStamina(const float32 __Value) property
    {
        if (this.m_DefenseFailedConsumeStamina == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_DefenseFailedConsumeStamina = __Value;
        return;
    }
    bool GetbBreakWhenStaminaClear() const property
    {
        return this.m_bBreakWhenStaminaClear;
    }
    void SetbBreakWhenStaminaClear(const bool __Value) property
    {
        if (!(this.m_bBreakWhenStaminaClear) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bBreakWhenStaminaClear = __Value;
        return;
    }
    FName GetBreakStateWhenStaminaClear() const property
    {
        return this.m_BreakStateWhenStaminaClear;
    }
    void SetBreakStateWhenStaminaClear(const FName &inout __Value) property
    {
        if ((this.m_BreakStateWhenStaminaClear == __Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_BreakStateWhenStaminaClear = __Value;
        return;
    }
    float32 GetDefenseSuccessDamageRatio() const property
    {
        return this.m_DefenseSuccessDamageRatio;
    }
    void SetDefenseSuccessDamageRatio(const float32 __Value) property
    {
        if (this.m_DefenseSuccessDamageRatio == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_DefenseSuccessDamageRatio = __Value;
        return;
    }
    float32 GetDefenseFailedDamageRatio() const property
    {
        return this.m_DefenseFailedDamageRatio;
    }
    void SetDefenseFailedDamageRatio(const float32 __Value) property
    {
        if (this.m_DefenseFailedDamageRatio == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_DefenseFailedDamageRatio = __Value;
        return;
    }
    bool GetbTransitDefenseSuccess() const property
    {
        return this.m_bTransitDefenseSuccess;
    }
    void SetbTransitDefenseSuccess(const bool __Value) property
    {
        if (!(this.m_bTransitDefenseSuccess) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_bTransitDefenseSuccess = __Value;
        return;
    }
    FName GetDefenseSuccessTransitStateName() const property
    {
        return this.m_DefenseSuccessTransitStateName;
    }
    void SetDefenseSuccessTransitStateName(const FName &inout __Value) property
    {
        if ((this.m_DefenseSuccessTransitStateName == __Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_DefenseSuccessTransitStateName = __Value;
        return;
    }
    bool GetbTransitDefenseFailed() const property
    {
        return this.m_bTransitDefenseFailed;
    }
    void SetbTransitDefenseFailed(const bool __Value) property
    {
        if (!(this.m_bTransitDefenseFailed) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_bTransitDefenseFailed = __Value;
        return;
    }
    FName GetDefenseFailedTransitStateName() const property
    {
        return this.m_DefenseFailedTransitStateName;
    }
    void SetDefenseFailedTransitStateName(const FName &inout __Value) property
    {
        if ((this.m_DefenseFailedTransitStateName == __Value))
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_DefenseFailedTransitStateName = __Value;
        return;
    }
}

struct FC_DefenseHit : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FDefenseHitData> m_DefenseHitDatas;

    FC_DefenseHit()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_DefenseHit(const FC_DefenseHit &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DefenseHitDatas = Other.m_DefenseHitDatas;
        return;
    }
    FC_DefenseHit opAssign(const FC_DefenseHit &inout Other)
    {
        FC_DefenseHit __r;
        this.SetDefenseHitDatas(Other.GetDefenseHitDatas());
        return __r;
    }
    const TArray<FDefenseHitData> GetDefenseHitDatas() const property
    {
        const TArray<FDefenseHitData> __r;
        return __r;
    }
    TArray<FDefenseHitData> GetModify_DefenseHitDatas() property
    {
        TArray<FDefenseHitData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDefenseHitDatas(const TArray<FDefenseHitData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DefenseHitDatas = __Value;
        return;
    }
}

struct FCE_DefenseHitEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Attacker;
    UPROPERTY()
    bool bIsParry;
    UPROPERTY()
    TDataObjectPtr<FAttackData> AttackData;


}

struct FC_HitBoxPriorityHit : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_HitBoxName;
    UPROPERTY()
    float32 m_XYAngleMax;
    UPROPERTY()
    float32 m_ZAngleMax;
    UPROPERTY()
    FVector m_HitBoxCenterOffset;

    FC_HitBoxPriorityHit()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_HitBoxPriorityHit(const FC_HitBoxPriorityHit &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_HitBoxPriorityHit opAssign(const FC_HitBoxPriorityHit &inout Other)
    {
        FC_HitBoxPriorityHit __r;
        this.SetHitBoxName(Other.GetHitBoxName());
        this.SetXYAngleMax(Other.GetXYAngleMax());
        this.SetZAngleMax(Other.GetZAngleMax());
        this.SetHitBoxCenterOffset(Other.GetHitBoxCenterOffset());
        return __r;
    }
    FName GetHitBoxName() const property
    {
        return this.m_HitBoxName;
    }
    void SetHitBoxName(const FName &inout __Value) property
    {
        if ((this.m_HitBoxName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_HitBoxName = __Value;
        return;
    }
    float32 GetXYAngleMax() const property
    {
        return this.m_XYAngleMax;
    }
    void SetXYAngleMax(const float32 __Value) property
    {
        if (this.m_XYAngleMax == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_XYAngleMax = __Value;
        return;
    }
    float32 GetZAngleMax() const property
    {
        return this.m_ZAngleMax;
    }
    void SetZAngleMax(const float32 __Value) property
    {
        if (this.m_ZAngleMax == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ZAngleMax = __Value;
        return;
    }
    const FVector GetHitBoxCenterOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_HitBoxCenterOffset() property
    {
        FVector __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetHitBoxCenterOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_HitBoxCenterOffset = __Value;
        return;
    }
}

struct FC_OnlyAcceptSpecificEntityAttack : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_AcceptedEntity;

    FC_OnlyAcceptSpecificEntityAttack()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_OnlyAcceptSpecificEntityAttack(const FC_OnlyAcceptSpecificEntityAttack &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_AcceptedEntity = Other.m_AcceptedEntity;
        return;
    }
    FC_OnlyAcceptSpecificEntityAttack opAssign(const FC_OnlyAcceptSpecificEntityAttack &inout Other)
    {
        FC_OnlyAcceptSpecificEntityAttack __r;
        this.SetAcceptedEntity(Other.GetAcceptedEntity());
        return __r;
    }
    const FECSEntity GetAcceptedEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_AcceptedEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAcceptedEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AcceptedEntity = __Value;
        return;
    }
}

struct FC_IgnoreAttackFromEntities : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FECSEntity> m_IgnoredEntities;

    FC_IgnoreAttackFromEntities()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_IgnoreAttackFromEntities(const FC_IgnoreAttackFromEntities &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_IgnoredEntities = Other.m_IgnoredEntities;
        return;
    }
    FC_IgnoreAttackFromEntities opAssign(const FC_IgnoreAttackFromEntities &inout Other)
    {
        FC_IgnoreAttackFromEntities __r;
        this.SetIgnoredEntities(Other.GetIgnoredEntities());
        return __r;
    }
    const TArray<FECSEntity> GetIgnoredEntities() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetModify_IgnoredEntities() property
    {
        TArray<FECSEntity> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetIgnoredEntities(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_IgnoredEntities = __Value;
        return;
    }
}

struct FSpecialHitTypeToESMState
{
    UPROPERTY()
    ESpecialHitContainerCondition Condition;
    UPROPERTY()
    TArray<FGameplayTag> TagsCheck;
    UPROPERTY()
    TArray<FGameplayTag> ForbidTagsCheck;
    UPROPERTY()
    bool bApplyToAllType;
    UPROPERTY()
    EMonsterRank MonsterRank;
    UPROPERTY()
    EHitStateType HitStatePriority = EHitStateType(0);
    UPROPERTY()
    FName ESMState;
    UPROPERTY()
    FBuffConfigRef CDBuff;
    UPROPERTY()
    float32 BossCDDuration = 30.0f;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> HitBossMessageHintConfig;
    UPROPERTY()
    float32 HitBossMessageHintRange = 2000.0f;


}

class USpecialHitTypeToESMStateAsset : UDataAsset
{
    UPROPERTY()
    TMap<FGameplayTag, FSpecialHitTypeToESMState> SpecialHitTypeToESMStateConfigs;

    USpecialHitTypeToESMStateAsset()
    {
        return;
    }
}

namespace ECSFunc_FC_HitConfig
{
UFUNCTION()
bool HasHitConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HitConfig);
}
FC_HitConfig& AssignHitConfig(const FECSEntity &inout Entity, const FC_HitConfig &inout DefaultValue = FC_HitConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HitConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHitConfig_BP(const FECSEntity &inout Entity, const FC_HitConfig &inout DefaultValue = FC_HitConfig())
{
    ECSFunc_FC_HitConfig::AssignHitConfig(Entity, DefaultValue);
    return;
}
FC_HitConfig& ModifyHitConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HitConfig));
    return local_12.GetComp();
}
FC_HitConfig& ModifyOrAddHitConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HitConfig));
    return local_12.GetComp();
}
const FC_HitConfig& GetHitConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HitConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_HitConfig GetHitConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_HitConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_HitConfig::GetHitConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_HitConfig GetDefaultedHitConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HitConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HitConfig);
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
FC_HitConfig GetDefaultedHitConfig_BP(const FECSEntity &inout Entity)
{
    FC_HitConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveHitConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HitConfig);
}
}
FECSMonitorRuntimeView __GetMonitorHitConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HitConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorHitConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HitConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HitConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HitConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_IgnoreHitShake
{
UFUNCTION()
bool HasIgnoreHitShake(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_IgnoreHitShake);
}
FC_IgnoreHitShake& AssignIgnoreHitShake(const FECSEntity &inout Entity, const FC_IgnoreHitShake &inout DefaultValue = FC_IgnoreHitShake())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_IgnoreHitShake, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignIgnoreHitShake_BP(const FECSEntity &inout Entity, const FC_IgnoreHitShake &inout DefaultValue = FC_IgnoreHitShake())
{
    ECSFunc_FC_IgnoreHitShake::AssignIgnoreHitShake(Entity, DefaultValue);
    return;
}
FC_IgnoreHitShake& ModifyIgnoreHitShake(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_IgnoreHitShake));
    return local_12.GetComp();
}
FC_IgnoreHitShake& ModifyOrAddIgnoreHitShake(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_IgnoreHitShake));
    return local_12.GetComp();
}
const FC_IgnoreHitShake& GetIgnoreHitShake(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_IgnoreHitShake));
    return local_12.GetComp();
}
UFUNCTION()
FC_IgnoreHitShake GetIgnoreHitShake_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_IgnoreHitShake& local_4 = ECSFunc_FC_IgnoreHitShake::GetIgnoreHitShake(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_IgnoreHitShake();
}
const FC_IgnoreHitShake GetDefaultedIgnoreHitShake(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_IgnoreHitShake __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_IgnoreHitShake);
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
FC_IgnoreHitShake GetDefaultedIgnoreHitShake_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_IgnoreHitShake::GetDefaultedIgnoreHitShake(Entity);
}
UFUNCTION()
bool RemoveIgnoreHitShake(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_IgnoreHitShake);
}
}
FECSMonitorRuntimeView __GetMonitorIgnoreHitShakeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_IgnoreHitShake, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIgnoreHitShakeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_IgnoreHitShake, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIgnoreHitShakeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_IgnoreHitShake, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIgnoreHitShakeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_IgnoreHitShake, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIgnoreHitShakeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_IgnoreHitShake, bFixedFrame, bMustHandleAll);
}
void __MonitorIgnoreHitShakeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_IgnoreHitShake, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorIgnoreHitShakeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_IgnoreHitShake, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorIgnoreHitShakeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_IgnoreHitShake, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_HittableConfig
{
UFUNCTION()
bool HasHittableConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HittableConfig);
}
FC_HittableConfig& AssignHittableConfig(const FECSEntity &inout Entity, const FC_HittableConfig &inout DefaultValue = FC_HittableConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HittableConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHittableConfig_BP(const FECSEntity &inout Entity, const FC_HittableConfig &inout DefaultValue = FC_HittableConfig())
{
    ECSFunc_FC_HittableConfig::AssignHittableConfig(Entity, DefaultValue);
    return;
}
FC_HittableConfig& ModifyHittableConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HittableConfig));
    return local_12.GetComp();
}
FC_HittableConfig& ModifyOrAddHittableConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HittableConfig));
    return local_12.GetComp();
}
const FC_HittableConfig& GetHittableConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HittableConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_HittableConfig GetHittableConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_HittableConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_HittableConfig::GetHittableConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_HittableConfig GetDefaultedHittableConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HittableConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HittableConfig);
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
FC_HittableConfig GetDefaultedHittableConfig_BP(const FECSEntity &inout Entity)
{
    FC_HittableConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveHittableConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HittableConfig);
}
}
FECSMonitorRuntimeView __GetMonitorHittableConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HittableConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHittableConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HittableConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHittableConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HittableConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHittableConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HittableConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHittableConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HittableConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorHittableConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HittableConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHittableConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HittableConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHittableConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HittableConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_HitTestProtectRecord
{
UFUNCTION()
bool HasHitTestProtectRecord(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HitTestProtectRecord);
}
FC_HitTestProtectRecord& AssignHitTestProtectRecord(const FECSEntity &inout Entity, const FC_HitTestProtectRecord &inout DefaultValue = FC_HitTestProtectRecord())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HitTestProtectRecord, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHitTestProtectRecord_BP(const FECSEntity &inout Entity, const FC_HitTestProtectRecord &inout DefaultValue = FC_HitTestProtectRecord())
{
    ECSFunc_FC_HitTestProtectRecord::AssignHitTestProtectRecord(Entity, DefaultValue);
    return;
}
FC_HitTestProtectRecord& ModifyHitTestProtectRecord(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HitTestProtectRecord));
    return local_12.GetComp();
}
FC_HitTestProtectRecord& ModifyOrAddHitTestProtectRecord(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HitTestProtectRecord));
    return local_12.GetComp();
}
const FC_HitTestProtectRecord& GetHitTestProtectRecord(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HitTestProtectRecord));
    return local_12.GetComp();
}
UFUNCTION()
FC_HitTestProtectRecord GetHitTestProtectRecord_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_HitTestProtectRecord& local_4 = ECSFunc_FC_HitTestProtectRecord::GetHitTestProtectRecord(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_HitTestProtectRecord();
}
const FC_HitTestProtectRecord GetDefaultedHitTestProtectRecord(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HitTestProtectRecord __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HitTestProtectRecord);
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
FC_HitTestProtectRecord GetDefaultedHitTestProtectRecord_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_HitTestProtectRecord::GetDefaultedHitTestProtectRecord(Entity);
}
UFUNCTION()
bool RemoveHitTestProtectRecord(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HitTestProtectRecord);
}
}
FECSMonitorRuntimeView __GetMonitorHitTestProtectRecordOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HitTestProtectRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitTestProtectRecordOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HitTestProtectRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitTestProtectRecordOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HitTestProtectRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitTestProtectRecordOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HitTestProtectRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitTestProtectRecordOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HitTestProtectRecord, bFixedFrame, bMustHandleAll);
}
void __MonitorHitTestProtectRecordLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HitTestProtectRecord, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitTestProtectRecordActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HitTestProtectRecord, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitTestProtectRecordModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HitTestProtectRecord, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_HittableDataRuntime
{
UFUNCTION()
bool HasHittableDataRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HittableDataRuntime);
}
FC_HittableDataRuntime& AssignHittableDataRuntime(const FECSEntity &inout Entity, const FC_HittableDataRuntime &inout DefaultValue = FC_HittableDataRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HittableDataRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHittableDataRuntime_BP(const FECSEntity &inout Entity, const FC_HittableDataRuntime &inout DefaultValue = FC_HittableDataRuntime())
{
    ECSFunc_FC_HittableDataRuntime::AssignHittableDataRuntime(Entity, DefaultValue);
    return;
}
FC_HittableDataRuntime& ModifyHittableDataRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HittableDataRuntime));
    return local_12.GetComp();
}
FC_HittableDataRuntime& ModifyOrAddHittableDataRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HittableDataRuntime));
    return local_12.GetComp();
}
const FC_HittableDataRuntime& GetHittableDataRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HittableDataRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_HittableDataRuntime GetHittableDataRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_HittableDataRuntime& local_4 = ECSFunc_FC_HittableDataRuntime::GetHittableDataRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_HittableDataRuntime();
}
const FC_HittableDataRuntime GetDefaultedHittableDataRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HittableDataRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HittableDataRuntime);
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
FC_HittableDataRuntime GetDefaultedHittableDataRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_HittableDataRuntime::GetDefaultedHittableDataRuntime(Entity);
}
UFUNCTION()
bool RemoveHittableDataRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HittableDataRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorHittableDataRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HittableDataRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHittableDataRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HittableDataRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHittableDataRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HittableDataRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHittableDataRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HittableDataRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHittableDataRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HittableDataRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorHittableDataRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HittableDataRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHittableDataRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HittableDataRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHittableDataRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HittableDataRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_IgnoreSpecificAttackTagHit
{
UFUNCTION()
bool HasIgnoreSpecificAttackTagHit(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_IgnoreSpecificAttackTagHit);
}
FC_IgnoreSpecificAttackTagHit& AssignIgnoreSpecificAttackTagHit(const FECSEntity &inout Entity, const FC_IgnoreSpecificAttackTagHit &inout DefaultValue = FC_IgnoreSpecificAttackTagHit())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_IgnoreSpecificAttackTagHit, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignIgnoreSpecificAttackTagHit_BP(const FECSEntity &inout Entity, const FC_IgnoreSpecificAttackTagHit &inout DefaultValue = FC_IgnoreSpecificAttackTagHit())
{
    ECSFunc_FC_IgnoreSpecificAttackTagHit::AssignIgnoreSpecificAttackTagHit(Entity, DefaultValue);
    return;
}
FC_IgnoreSpecificAttackTagHit& ModifyIgnoreSpecificAttackTagHit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_IgnoreSpecificAttackTagHit));
    return local_12.GetComp();
}
FC_IgnoreSpecificAttackTagHit& ModifyOrAddIgnoreSpecificAttackTagHit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_IgnoreSpecificAttackTagHit));
    return local_12.GetComp();
}
const FC_IgnoreSpecificAttackTagHit& GetIgnoreSpecificAttackTagHit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_IgnoreSpecificAttackTagHit));
    return local_12.GetComp();
}
UFUNCTION()
FC_IgnoreSpecificAttackTagHit GetIgnoreSpecificAttackTagHit_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_IgnoreSpecificAttackTagHit& local_4 = ECSFunc_FC_IgnoreSpecificAttackTagHit::GetIgnoreSpecificAttackTagHit(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_IgnoreSpecificAttackTagHit();
}
const FC_IgnoreSpecificAttackTagHit GetDefaultedIgnoreSpecificAttackTagHit(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_IgnoreSpecificAttackTagHit __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_IgnoreSpecificAttackTagHit);
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
FC_IgnoreSpecificAttackTagHit GetDefaultedIgnoreSpecificAttackTagHit_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_IgnoreSpecificAttackTagHit::GetDefaultedIgnoreSpecificAttackTagHit(Entity);
}
UFUNCTION()
bool RemoveIgnoreSpecificAttackTagHit(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_IgnoreSpecificAttackTagHit);
}
}
FECSMonitorRuntimeView __GetMonitorIgnoreSpecificAttackTagHitOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_IgnoreSpecificAttackTagHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIgnoreSpecificAttackTagHitOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_IgnoreSpecificAttackTagHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIgnoreSpecificAttackTagHitOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_IgnoreSpecificAttackTagHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIgnoreSpecificAttackTagHitOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_IgnoreSpecificAttackTagHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIgnoreSpecificAttackTagHitOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_IgnoreSpecificAttackTagHit, bFixedFrame, bMustHandleAll);
}
void __MonitorIgnoreSpecificAttackTagHitLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_IgnoreSpecificAttackTagHit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorIgnoreSpecificAttackTagHitActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_IgnoreSpecificAttackTagHit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorIgnoreSpecificAttackTagHitModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_IgnoreSpecificAttackTagHit, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AttackIgnoreSpecificTarget
{
UFUNCTION()
bool HasAttackIgnoreSpecificTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AttackIgnoreSpecificTarget);
}
FC_AttackIgnoreSpecificTarget& AssignAttackIgnoreSpecificTarget(const FECSEntity &inout Entity, const FC_AttackIgnoreSpecificTarget &inout DefaultValue = FC_AttackIgnoreSpecificTarget())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AttackIgnoreSpecificTarget, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAttackIgnoreSpecificTarget_BP(const FECSEntity &inout Entity, const FC_AttackIgnoreSpecificTarget &inout DefaultValue = FC_AttackIgnoreSpecificTarget())
{
    ECSFunc_FC_AttackIgnoreSpecificTarget::AssignAttackIgnoreSpecificTarget(Entity, DefaultValue);
    return;
}
FC_AttackIgnoreSpecificTarget& ModifyAttackIgnoreSpecificTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AttackIgnoreSpecificTarget));
    return local_12.GetComp();
}
FC_AttackIgnoreSpecificTarget& ModifyOrAddAttackIgnoreSpecificTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AttackIgnoreSpecificTarget));
    return local_12.GetComp();
}
const FC_AttackIgnoreSpecificTarget& GetAttackIgnoreSpecificTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AttackIgnoreSpecificTarget));
    return local_12.GetComp();
}
UFUNCTION()
FC_AttackIgnoreSpecificTarget GetAttackIgnoreSpecificTarget_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AttackIgnoreSpecificTarget& local_4 = ECSFunc_FC_AttackIgnoreSpecificTarget::GetAttackIgnoreSpecificTarget(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AttackIgnoreSpecificTarget();
}
const FC_AttackIgnoreSpecificTarget GetDefaultedAttackIgnoreSpecificTarget(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AttackIgnoreSpecificTarget __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AttackIgnoreSpecificTarget);
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
FC_AttackIgnoreSpecificTarget GetDefaultedAttackIgnoreSpecificTarget_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AttackIgnoreSpecificTarget::GetDefaultedAttackIgnoreSpecificTarget(Entity);
}
UFUNCTION()
bool RemoveAttackIgnoreSpecificTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AttackIgnoreSpecificTarget);
}
}
FECSMonitorRuntimeView __GetMonitorAttackIgnoreSpecificTargetOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AttackIgnoreSpecificTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttackIgnoreSpecificTargetOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AttackIgnoreSpecificTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttackIgnoreSpecificTargetOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AttackIgnoreSpecificTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttackIgnoreSpecificTargetOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AttackIgnoreSpecificTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttackIgnoreSpecificTargetOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AttackIgnoreSpecificTarget, bFixedFrame, bMustHandleAll);
}
void __MonitorAttackIgnoreSpecificTargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AttackIgnoreSpecificTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttackIgnoreSpecificTargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AttackIgnoreSpecificTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttackIgnoreSpecificTargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AttackIgnoreSpecificTarget, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_HitReaction
{
UFUNCTION()
bool HasHitReaction(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HitReaction);
}
FC_HitReaction& AssignHitReaction(const FECSEntity &inout Entity, const FC_HitReaction &inout DefaultValue = FC_HitReaction())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HitReaction, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHitReaction_BP(const FECSEntity &inout Entity, const FC_HitReaction &inout DefaultValue = FC_HitReaction())
{
    ECSFunc_FC_HitReaction::AssignHitReaction(Entity, DefaultValue);
    return;
}
FC_HitReaction& ModifyHitReaction(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HitReaction));
    return local_12.GetComp();
}
FC_HitReaction& ModifyOrAddHitReaction(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HitReaction));
    return local_12.GetComp();
}
const FC_HitReaction& GetHitReaction(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HitReaction));
    return local_12.GetComp();
}
UFUNCTION()
FC_HitReaction GetHitReaction_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_HitReaction& local_4 = ECSFunc_FC_HitReaction::GetHitReaction(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_HitReaction();
}
const FC_HitReaction GetDefaultedHitReaction(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HitReaction __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HitReaction);
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
FC_HitReaction GetDefaultedHitReaction_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_HitReaction::GetDefaultedHitReaction(Entity);
}
UFUNCTION()
bool RemoveHitReaction(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HitReaction);
}
}
FECSMonitorRuntimeView __GetMonitorHitReactionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HitReaction, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitReactionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HitReaction, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitReactionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HitReaction, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitReactionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HitReaction, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitReactionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HitReaction, bFixedFrame, bMustHandleAll);
}
void __MonitorHitReactionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HitReaction, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitReactionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HitReaction, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitReactionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HitReaction, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_HitReactionConfig
{
UFUNCTION()
bool HasHitReactionConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HitReactionConfig);
}
FC_HitReactionConfig& AssignHitReactionConfig(const FECSEntity &inout Entity, const FC_HitReactionConfig &inout DefaultValue = FC_HitReactionConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HitReactionConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHitReactionConfig_BP(const FECSEntity &inout Entity, const FC_HitReactionConfig &inout DefaultValue = FC_HitReactionConfig())
{
    ECSFunc_FC_HitReactionConfig::AssignHitReactionConfig(Entity, DefaultValue);
    return;
}
FC_HitReactionConfig& ModifyHitReactionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HitReactionConfig));
    return local_12.GetComp();
}
FC_HitReactionConfig& ModifyOrAddHitReactionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HitReactionConfig));
    return local_12.GetComp();
}
const FC_HitReactionConfig& GetHitReactionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HitReactionConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_HitReactionConfig GetHitReactionConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_HitReactionConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_HitReactionConfig::GetHitReactionConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_HitReactionConfig GetDefaultedHitReactionConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HitReactionConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HitReactionConfig);
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
FC_HitReactionConfig GetDefaultedHitReactionConfig_BP(const FECSEntity &inout Entity)
{
    FC_HitReactionConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveHitReactionConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HitReactionConfig);
}
}
FECSMonitorRuntimeView __GetMonitorHitReactionConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HitReactionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitReactionConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HitReactionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitReactionConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HitReactionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitReactionConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HitReactionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitReactionConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HitReactionConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorHitReactionConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HitReactionConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitReactionConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HitReactionConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitReactionConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HitReactionConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BeHitRecoverAttributeConfig
{
UFUNCTION()
bool HasBeHitRecoverAttributeConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BeHitRecoverAttributeConfig);
}
FC_BeHitRecoverAttributeConfig& AssignBeHitRecoverAttributeConfig(const FECSEntity &inout Entity, const FC_BeHitRecoverAttributeConfig &inout DefaultValue = FC_BeHitRecoverAttributeConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BeHitRecoverAttributeConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBeHitRecoverAttributeConfig_BP(const FECSEntity &inout Entity, const FC_BeHitRecoverAttributeConfig &inout DefaultValue = FC_BeHitRecoverAttributeConfig())
{
    ECSFunc_FC_BeHitRecoverAttributeConfig::AssignBeHitRecoverAttributeConfig(Entity, DefaultValue);
    return;
}
FC_BeHitRecoverAttributeConfig& ModifyBeHitRecoverAttributeConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BeHitRecoverAttributeConfig));
    return local_12.GetComp();
}
FC_BeHitRecoverAttributeConfig& ModifyOrAddBeHitRecoverAttributeConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BeHitRecoverAttributeConfig));
    return local_12.GetComp();
}
const FC_BeHitRecoverAttributeConfig& GetBeHitRecoverAttributeConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BeHitRecoverAttributeConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_BeHitRecoverAttributeConfig GetBeHitRecoverAttributeConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_BeHitRecoverAttributeConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_BeHitRecoverAttributeConfig::GetBeHitRecoverAttributeConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_BeHitRecoverAttributeConfig GetDefaultedBeHitRecoverAttributeConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BeHitRecoverAttributeConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BeHitRecoverAttributeConfig);
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
FC_BeHitRecoverAttributeConfig GetDefaultedBeHitRecoverAttributeConfig_BP(const FECSEntity &inout Entity)
{
    FC_BeHitRecoverAttributeConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveBeHitRecoverAttributeConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BeHitRecoverAttributeConfig);
}
}
FECSMonitorRuntimeView __GetMonitorBeHitRecoverAttributeConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BeHitRecoverAttributeConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeHitRecoverAttributeConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BeHitRecoverAttributeConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeHitRecoverAttributeConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BeHitRecoverAttributeConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeHitRecoverAttributeConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BeHitRecoverAttributeConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeHitRecoverAttributeConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BeHitRecoverAttributeConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorBeHitRecoverAttributeConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BeHitRecoverAttributeConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeHitRecoverAttributeConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BeHitRecoverAttributeConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeHitRecoverAttributeConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BeHitRecoverAttributeConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AttackerHitPresentationConfig
{
UFUNCTION()
bool HasAttackerHitPresentationConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AttackerHitPresentationConfig);
}
FC_AttackerHitPresentationConfig& AssignAttackerHitPresentationConfig(const FECSEntity &inout Entity, const FC_AttackerHitPresentationConfig &inout DefaultValue = FC_AttackerHitPresentationConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AttackerHitPresentationConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAttackerHitPresentationConfig_BP(const FECSEntity &inout Entity, const FC_AttackerHitPresentationConfig &inout DefaultValue = FC_AttackerHitPresentationConfig())
{
    ECSFunc_FC_AttackerHitPresentationConfig::AssignAttackerHitPresentationConfig(Entity, DefaultValue);
    return;
}
FC_AttackerHitPresentationConfig& ModifyAttackerHitPresentationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AttackerHitPresentationConfig));
    return local_12.GetComp();
}
FC_AttackerHitPresentationConfig& ModifyOrAddAttackerHitPresentationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AttackerHitPresentationConfig));
    return local_12.GetComp();
}
const FC_AttackerHitPresentationConfig& GetAttackerHitPresentationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AttackerHitPresentationConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_AttackerHitPresentationConfig GetAttackerHitPresentationConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AttackerHitPresentationConfig& local_4 = ECSFunc_FC_AttackerHitPresentationConfig::GetAttackerHitPresentationConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AttackerHitPresentationConfig();
}
const FC_AttackerHitPresentationConfig GetDefaultedAttackerHitPresentationConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AttackerHitPresentationConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AttackerHitPresentationConfig);
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
FC_AttackerHitPresentationConfig GetDefaultedAttackerHitPresentationConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AttackerHitPresentationConfig::GetDefaultedAttackerHitPresentationConfig(Entity);
}
UFUNCTION()
bool RemoveAttackerHitPresentationConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AttackerHitPresentationConfig);
}
}
FECSMonitorRuntimeView __GetMonitorAttackerHitPresentationConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AttackerHitPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttackerHitPresentationConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AttackerHitPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttackerHitPresentationConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AttackerHitPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttackerHitPresentationConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AttackerHitPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttackerHitPresentationConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AttackerHitPresentationConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorAttackerHitPresentationConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AttackerHitPresentationConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttackerHitPresentationConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AttackerHitPresentationConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttackerHitPresentationConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AttackerHitPresentationConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AttackerHitPresentation
{
UFUNCTION()
bool HasAttackerHitPresentation(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AttackerHitPresentation);
}
FC_AttackerHitPresentation& AssignAttackerHitPresentation(const FECSEntity &inout Entity, const FC_AttackerHitPresentation &inout DefaultValue = FC_AttackerHitPresentation())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AttackerHitPresentation, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAttackerHitPresentation_BP(const FECSEntity &inout Entity, const FC_AttackerHitPresentation &inout DefaultValue = FC_AttackerHitPresentation())
{
    ECSFunc_FC_AttackerHitPresentation::AssignAttackerHitPresentation(Entity, DefaultValue);
    return;
}
FC_AttackerHitPresentation& ModifyAttackerHitPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AttackerHitPresentation));
    return local_12.GetComp();
}
FC_AttackerHitPresentation& ModifyOrAddAttackerHitPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AttackerHitPresentation));
    return local_12.GetComp();
}
const FC_AttackerHitPresentation& GetAttackerHitPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AttackerHitPresentation));
    return local_12.GetComp();
}
UFUNCTION()
FC_AttackerHitPresentation GetAttackerHitPresentation_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AttackerHitPresentation& local_4 = ECSFunc_FC_AttackerHitPresentation::GetAttackerHitPresentation(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AttackerHitPresentation();
}
const FC_AttackerHitPresentation GetDefaultedAttackerHitPresentation(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AttackerHitPresentation __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AttackerHitPresentation);
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
FC_AttackerHitPresentation GetDefaultedAttackerHitPresentation_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AttackerHitPresentation::GetDefaultedAttackerHitPresentation(Entity);
}
UFUNCTION()
bool RemoveAttackerHitPresentation(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AttackerHitPresentation);
}
}
FECSMonitorRuntimeView __GetMonitorAttackerHitPresentationOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AttackerHitPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttackerHitPresentationOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AttackerHitPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttackerHitPresentationOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AttackerHitPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttackerHitPresentationOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AttackerHitPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttackerHitPresentationOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AttackerHitPresentation, bFixedFrame, bMustHandleAll);
}
void __MonitorAttackerHitPresentationLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AttackerHitPresentation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttackerHitPresentationActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AttackerHitPresentation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttackerHitPresentationModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AttackerHitPresentation, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BeHitPresentationConfig
{
UFUNCTION()
bool HasBeHitPresentationConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BeHitPresentationConfig);
}
FC_BeHitPresentationConfig& AssignBeHitPresentationConfig(const FECSEntity &inout Entity, const FC_BeHitPresentationConfig &inout DefaultValue = FC_BeHitPresentationConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BeHitPresentationConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBeHitPresentationConfig_BP(const FECSEntity &inout Entity, const FC_BeHitPresentationConfig &inout DefaultValue = FC_BeHitPresentationConfig())
{
    ECSFunc_FC_BeHitPresentationConfig::AssignBeHitPresentationConfig(Entity, DefaultValue);
    return;
}
FC_BeHitPresentationConfig& ModifyBeHitPresentationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BeHitPresentationConfig));
    return local_12.GetComp();
}
FC_BeHitPresentationConfig& ModifyOrAddBeHitPresentationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BeHitPresentationConfig));
    return local_12.GetComp();
}
const FC_BeHitPresentationConfig& GetBeHitPresentationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BeHitPresentationConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_BeHitPresentationConfig GetBeHitPresentationConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BeHitPresentationConfig& local_4 = ECSFunc_FC_BeHitPresentationConfig::GetBeHitPresentationConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BeHitPresentationConfig();
}
const FC_BeHitPresentationConfig GetDefaultedBeHitPresentationConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BeHitPresentationConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BeHitPresentationConfig);
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
FC_BeHitPresentationConfig GetDefaultedBeHitPresentationConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BeHitPresentationConfig::GetDefaultedBeHitPresentationConfig(Entity);
}
UFUNCTION()
bool RemoveBeHitPresentationConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BeHitPresentationConfig);
}
}
FECSMonitorRuntimeView __GetMonitorBeHitPresentationConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BeHitPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeHitPresentationConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BeHitPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeHitPresentationConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BeHitPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeHitPresentationConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BeHitPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeHitPresentationConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BeHitPresentationConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorBeHitPresentationConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BeHitPresentationConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeHitPresentationConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BeHitPresentationConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeHitPresentationConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BeHitPresentationConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MutualClash
{
UFUNCTION()
bool HasMutualClash(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MutualClash);
}
FC_MutualClash& AssignMutualClash(const FECSEntity &inout Entity, const FC_MutualClash &inout DefaultValue = FC_MutualClash())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MutualClash, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMutualClash_BP(const FECSEntity &inout Entity, const FC_MutualClash &inout DefaultValue = FC_MutualClash())
{
    ECSFunc_FC_MutualClash::AssignMutualClash(Entity, DefaultValue);
    return;
}
FC_MutualClash& ModifyMutualClash(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MutualClash));
    return local_12.GetComp();
}
FC_MutualClash& ModifyOrAddMutualClash(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MutualClash));
    return local_12.GetComp();
}
const FC_MutualClash& GetMutualClash(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MutualClash));
    return local_12.GetComp();
}
UFUNCTION()
FC_MutualClash GetMutualClash_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MutualClash& local_4 = ECSFunc_FC_MutualClash::GetMutualClash(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MutualClash();
}
const FC_MutualClash GetDefaultedMutualClash(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MutualClash __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MutualClash);
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
FC_MutualClash GetDefaultedMutualClash_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MutualClash::GetDefaultedMutualClash(Entity);
}
UFUNCTION()
bool RemoveMutualClash(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MutualClash);
}
}
FECSMonitorRuntimeView __GetMonitorMutualClashOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MutualClash, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMutualClashOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MutualClash, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMutualClashOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MutualClash, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMutualClashOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MutualClash, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMutualClashOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MutualClash, bFixedFrame, bMustHandleAll);
}
void __MonitorMutualClashLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MutualClash, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMutualClashActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MutualClash, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMutualClashModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MutualClash, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MutualClashActionInfo
{
UFUNCTION()
bool HasMutualClashActionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MutualClashActionInfo);
}
FC_MutualClashActionInfo& AssignMutualClashActionInfo(const FECSEntity &inout Entity, const FC_MutualClashActionInfo &inout DefaultValue = FC_MutualClashActionInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MutualClashActionInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMutualClashActionInfo_BP(const FECSEntity &inout Entity, const FC_MutualClashActionInfo &inout DefaultValue = FC_MutualClashActionInfo())
{
    ECSFunc_FC_MutualClashActionInfo::AssignMutualClashActionInfo(Entity, DefaultValue);
    return;
}
FC_MutualClashActionInfo& ModifyMutualClashActionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MutualClashActionInfo));
    return local_12.GetComp();
}
FC_MutualClashActionInfo& ModifyOrAddMutualClashActionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MutualClashActionInfo));
    return local_12.GetComp();
}
const FC_MutualClashActionInfo& GetMutualClashActionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MutualClashActionInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_MutualClashActionInfo GetMutualClashActionInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MutualClashActionInfo& local_4 = ECSFunc_FC_MutualClashActionInfo::GetMutualClashActionInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MutualClashActionInfo();
}
const FC_MutualClashActionInfo GetDefaultedMutualClashActionInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MutualClashActionInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MutualClashActionInfo);
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
FC_MutualClashActionInfo GetDefaultedMutualClashActionInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MutualClashActionInfo::GetDefaultedMutualClashActionInfo(Entity);
}
UFUNCTION()
bool RemoveMutualClashActionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MutualClashActionInfo);
}
}
FECSMonitorRuntimeView __GetMonitorMutualClashActionInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MutualClashActionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMutualClashActionInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MutualClashActionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMutualClashActionInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MutualClashActionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMutualClashActionInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MutualClashActionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMutualClashActionInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MutualClashActionInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorMutualClashActionInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MutualClashActionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMutualClashActionInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MutualClashActionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMutualClashActionInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MutualClashActionInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DefenseHit
{
UFUNCTION()
bool HasDefenseHit(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DefenseHit);
}
FC_DefenseHit& AssignDefenseHit(const FECSEntity &inout Entity, const FC_DefenseHit &inout DefaultValue = FC_DefenseHit())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DefenseHit, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDefenseHit_BP(const FECSEntity &inout Entity, const FC_DefenseHit &inout DefaultValue = FC_DefenseHit())
{
    ECSFunc_FC_DefenseHit::AssignDefenseHit(Entity, DefaultValue);
    return;
}
FC_DefenseHit& ModifyDefenseHit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DefenseHit));
    return local_12.GetComp();
}
FC_DefenseHit& ModifyOrAddDefenseHit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DefenseHit));
    return local_12.GetComp();
}
const FC_DefenseHit& GetDefenseHit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DefenseHit));
    return local_12.GetComp();
}
UFUNCTION()
FC_DefenseHit GetDefenseHit_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DefenseHit& local_4 = ECSFunc_FC_DefenseHit::GetDefenseHit(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DefenseHit();
}
const FC_DefenseHit GetDefaultedDefenseHit(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DefenseHit __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DefenseHit);
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
FC_DefenseHit GetDefaultedDefenseHit_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DefenseHit::GetDefaultedDefenseHit(Entity);
}
UFUNCTION()
bool RemoveDefenseHit(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DefenseHit);
}
}
FECSMonitorRuntimeView __GetMonitorDefenseHitOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DefenseHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefenseHitOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DefenseHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefenseHitOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DefenseHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefenseHitOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DefenseHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefenseHitOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DefenseHit, bFixedFrame, bMustHandleAll);
}
void __MonitorDefenseHitLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DefenseHit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDefenseHitActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DefenseHit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDefenseHitModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DefenseHit, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_HitBoxPriorityHit
{
UFUNCTION()
bool HasHitBoxPriorityHit(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HitBoxPriorityHit);
}
FC_HitBoxPriorityHit& AssignHitBoxPriorityHit(const FECSEntity &inout Entity, const FC_HitBoxPriorityHit &inout DefaultValue = FC_HitBoxPriorityHit())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HitBoxPriorityHit, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHitBoxPriorityHit_BP(const FECSEntity &inout Entity, const FC_HitBoxPriorityHit &inout DefaultValue = FC_HitBoxPriorityHit())
{
    ECSFunc_FC_HitBoxPriorityHit::AssignHitBoxPriorityHit(Entity, DefaultValue);
    return;
}
FC_HitBoxPriorityHit& ModifyHitBoxPriorityHit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HitBoxPriorityHit));
    return local_12.GetComp();
}
FC_HitBoxPriorityHit& ModifyOrAddHitBoxPriorityHit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HitBoxPriorityHit));
    return local_12.GetComp();
}
const FC_HitBoxPriorityHit& GetHitBoxPriorityHit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HitBoxPriorityHit));
    return local_12.GetComp();
}
UFUNCTION()
FC_HitBoxPriorityHit GetHitBoxPriorityHit_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_HitBoxPriorityHit& local_4 = ECSFunc_FC_HitBoxPriorityHit::GetHitBoxPriorityHit(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_HitBoxPriorityHit();
}
const FC_HitBoxPriorityHit GetDefaultedHitBoxPriorityHit(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HitBoxPriorityHit __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HitBoxPriorityHit);
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
FC_HitBoxPriorityHit GetDefaultedHitBoxPriorityHit_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_HitBoxPriorityHit::GetDefaultedHitBoxPriorityHit(Entity);
}
UFUNCTION()
bool RemoveHitBoxPriorityHit(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HitBoxPriorityHit);
}
}
FECSMonitorRuntimeView __GetMonitorHitBoxPriorityHitOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HitBoxPriorityHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitBoxPriorityHitOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HitBoxPriorityHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitBoxPriorityHitOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HitBoxPriorityHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitBoxPriorityHitOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HitBoxPriorityHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitBoxPriorityHitOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HitBoxPriorityHit, bFixedFrame, bMustHandleAll);
}
void __MonitorHitBoxPriorityHitLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HitBoxPriorityHit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitBoxPriorityHitActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HitBoxPriorityHit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitBoxPriorityHitModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HitBoxPriorityHit, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_OnlyAcceptSpecificEntityAttack
{
UFUNCTION()
bool HasOnlyAcceptSpecificEntityAttack(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_OnlyAcceptSpecificEntityAttack);
}
FC_OnlyAcceptSpecificEntityAttack& AssignOnlyAcceptSpecificEntityAttack(const FECSEntity &inout Entity, const FC_OnlyAcceptSpecificEntityAttack &inout DefaultValue = FC_OnlyAcceptSpecificEntityAttack())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_OnlyAcceptSpecificEntityAttack, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignOnlyAcceptSpecificEntityAttack_BP(const FECSEntity &inout Entity, const FC_OnlyAcceptSpecificEntityAttack &inout DefaultValue = FC_OnlyAcceptSpecificEntityAttack())
{
    ECSFunc_FC_OnlyAcceptSpecificEntityAttack::AssignOnlyAcceptSpecificEntityAttack(Entity, DefaultValue);
    return;
}
FC_OnlyAcceptSpecificEntityAttack& ModifyOnlyAcceptSpecificEntityAttack(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_OnlyAcceptSpecificEntityAttack));
    return local_12.GetComp();
}
FC_OnlyAcceptSpecificEntityAttack& ModifyOrAddOnlyAcceptSpecificEntityAttack(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_OnlyAcceptSpecificEntityAttack));
    return local_12.GetComp();
}
const FC_OnlyAcceptSpecificEntityAttack& GetOnlyAcceptSpecificEntityAttack(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_OnlyAcceptSpecificEntityAttack));
    return local_12.GetComp();
}
UFUNCTION()
FC_OnlyAcceptSpecificEntityAttack GetOnlyAcceptSpecificEntityAttack_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_OnlyAcceptSpecificEntityAttack& local_4 = ECSFunc_FC_OnlyAcceptSpecificEntityAttack::GetOnlyAcceptSpecificEntityAttack(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_OnlyAcceptSpecificEntityAttack();
}
const FC_OnlyAcceptSpecificEntityAttack GetDefaultedOnlyAcceptSpecificEntityAttack(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_OnlyAcceptSpecificEntityAttack __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_OnlyAcceptSpecificEntityAttack);
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
FC_OnlyAcceptSpecificEntityAttack GetDefaultedOnlyAcceptSpecificEntityAttack_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_OnlyAcceptSpecificEntityAttack::GetDefaultedOnlyAcceptSpecificEntityAttack(Entity);
}
UFUNCTION()
bool RemoveOnlyAcceptSpecificEntityAttack(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_OnlyAcceptSpecificEntityAttack);
}
}
FECSMonitorRuntimeView __GetMonitorOnlyAcceptSpecificEntityAttackOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_OnlyAcceptSpecificEntityAttack, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOnlyAcceptSpecificEntityAttackOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_OnlyAcceptSpecificEntityAttack, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOnlyAcceptSpecificEntityAttackOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_OnlyAcceptSpecificEntityAttack, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOnlyAcceptSpecificEntityAttackOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_OnlyAcceptSpecificEntityAttack, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOnlyAcceptSpecificEntityAttackOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_OnlyAcceptSpecificEntityAttack, bFixedFrame, bMustHandleAll);
}
void __MonitorOnlyAcceptSpecificEntityAttackLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_OnlyAcceptSpecificEntityAttack, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOnlyAcceptSpecificEntityAttackActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_OnlyAcceptSpecificEntityAttack, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOnlyAcceptSpecificEntityAttackModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_OnlyAcceptSpecificEntityAttack, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_IgnoreAttackFromEntities
{
UFUNCTION()
bool HasIgnoreAttackFromEntities(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_IgnoreAttackFromEntities);
}
FC_IgnoreAttackFromEntities& AssignIgnoreAttackFromEntities(const FECSEntity &inout Entity, const FC_IgnoreAttackFromEntities &inout DefaultValue = FC_IgnoreAttackFromEntities())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_IgnoreAttackFromEntities, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignIgnoreAttackFromEntities_BP(const FECSEntity &inout Entity, const FC_IgnoreAttackFromEntities &inout DefaultValue = FC_IgnoreAttackFromEntities())
{
    ECSFunc_FC_IgnoreAttackFromEntities::AssignIgnoreAttackFromEntities(Entity, DefaultValue);
    return;
}
FC_IgnoreAttackFromEntities& ModifyIgnoreAttackFromEntities(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_IgnoreAttackFromEntities));
    return local_12.GetComp();
}
FC_IgnoreAttackFromEntities& ModifyOrAddIgnoreAttackFromEntities(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_IgnoreAttackFromEntities));
    return local_12.GetComp();
}
const FC_IgnoreAttackFromEntities& GetIgnoreAttackFromEntities(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_IgnoreAttackFromEntities));
    return local_12.GetComp();
}
UFUNCTION()
FC_IgnoreAttackFromEntities GetIgnoreAttackFromEntities_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_IgnoreAttackFromEntities& local_4 = ECSFunc_FC_IgnoreAttackFromEntities::GetIgnoreAttackFromEntities(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_IgnoreAttackFromEntities();
}
const FC_IgnoreAttackFromEntities GetDefaultedIgnoreAttackFromEntities(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_IgnoreAttackFromEntities __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_IgnoreAttackFromEntities);
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
FC_IgnoreAttackFromEntities GetDefaultedIgnoreAttackFromEntities_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_IgnoreAttackFromEntities::GetDefaultedIgnoreAttackFromEntities(Entity);
}
UFUNCTION()
bool RemoveIgnoreAttackFromEntities(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_IgnoreAttackFromEntities);
}
}
FECSMonitorRuntimeView __GetMonitorIgnoreAttackFromEntitiesOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_IgnoreAttackFromEntities, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIgnoreAttackFromEntitiesOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_IgnoreAttackFromEntities, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIgnoreAttackFromEntitiesOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_IgnoreAttackFromEntities, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIgnoreAttackFromEntitiesOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_IgnoreAttackFromEntities, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIgnoreAttackFromEntitiesOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_IgnoreAttackFromEntities, bFixedFrame, bMustHandleAll);
}
void __MonitorIgnoreAttackFromEntitiesLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_IgnoreAttackFromEntities, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorIgnoreAttackFromEntitiesActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_IgnoreAttackFromEntities, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorIgnoreAttackFromEntitiesModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_IgnoreAttackFromEntities, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_HitReaction_bIsBlowHeavy(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetbIsBlowHeavy();
    return;
}
void GetEntityBBVar_HitReaction_HitAngle(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetHitAngle();
    return;
}
void GetEntityBBVar_HitReaction_HitFromAngle(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetHitFromAngle();
    return;
}
void GetEntityBBVar_HitReaction_HitImpulseFromAngle(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetHitImpulseFromAngle();
    return;
}
void GetEntityBBVar_HitReaction_HitImpulseX(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetHitImpulseX();
    return;
}
void GetEntityBBVar_HitReaction_HitImpulseZ(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetHitImpulseZ();
    return;
}
void GetEntityBBVar_HitReaction_AttackerPrefabType(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().GetAttackerPrefabType()) != 0);
    return;
}
void GetEntityBBVar_HitReaction_HitStunDuration(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetHitStunDuration();
    return;
}
void GetEntityBBVar_HitReactionConfig_PrefabBodyType(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().PrefabBodyType) != 0);
    return;
}
void GetEntityBBVar_HitReactionConfig_BeHitCheckDirectionType(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().BeHitCheckDirectionType) != 0);
    return;
}
void GetEntityBBVar_HitReactionConfig_BossGroundStaggerDirectionType(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    OutRetValue = (int(FECSEntity::GetDefaulted<FC_HitReactionConfig>(Entity).opCall().BossGroundStaggerDirectionType) != 0);
    return;
}
void GetEntityBBVar_HitReactionConfig_BossGroundBreakDirectionType(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().BossGroundBreakDirectionType) != 0);
    return;
}
void GetEntityBBVar_HitReactionConfig_BossAirHitReactionType(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().BossAirHitReactionType) != 0);
    return;
}
void GetEntityBBVar_HitReactionConfig_BossAirStaggerDirectionType(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().BossAirStaggerDirectionType) != 0);
    return;
}
void GetEntityBBVar_HitReactionConfig_HitTurnType(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().HitTurnType) != 0);
    return;
}
void GetEntityBBVar_HitReactionConfig_HeavyHitTime(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().HeavyHitTime;
    return;
}
void GetEntityBBVar_HitReactionConfig_RetreatHitTime(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().RetreatHitTime;
    return;
}
void GetEntityBBVar_HitReactionConfig_BlowStartHitTime(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().BlowStartHitTime;
    return;
}
void GetEntityBBVar_HitReactionConfig_LandTime(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().LandTime;
    return;
}
void GetEntityBBVar_HitReactionConfig_LieDownTime(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().LieDownTime;
    return;
}
void GetEntityBBVar_HitReactionConfig_StaggerHitTime(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().StaggerHitTime;
    return;
}
void GetEntityBBVar_HitReactionConfig_StaggerAirHitTime(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().StaggerAirHitTime;
    return;
}
void GetEntityBBVar_HitReactionConfig_BreakStartTime(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().BreakStartTime;
    return;
}
void GetEntityBBVar_HitReactionConfig_BreakAirStartTime(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().BreakAirStartTime;
    return;
}
void GetEntityBBVar_HitReactionConfig_BreakEndTime(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().BreakEndTime;
    return;
}
void GetEntityBBVar_HitReactionConfig_BreakTime(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().BreakTime;
    return;
}
void GetEntityBBVar_HitReactionConfig_DeathTime(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().DeathTime;
    return;
}
void GetEntityBBVar_MutualClash_HitAngle(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetHitAngle();
    return;
}
void GetEntityBBVar_MutualClash_HitFromAngle(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetHitFromAngle();
    return;
}
void GetEntityBBVar_HitReaction_GetCurrentHitState(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().GetCurrentHitState()) != 0);
    return;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FHitStrikeData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FHitStrikeData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FHitStrikeData
{
int __IndexOf_DecalConfig()
{
    return 0;
}
int __IndexOf_StrikeShape()
{
    return 1;
}
int __IndexOf_StrikeDirection()
{
    return 2;
}
int __IndexOf_bUseCustomStrikeTransform()
{
    return 3;
}
int __IndexOf_CustomStrikeTransformPos()
{
    return 4;
}
int __IndexOf_CustomStrikeTransformRot()
{
    return 5;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_IgnoreHitShake &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_IgnoreHitShake &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_IgnoreHitShake &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_IgnoreHitShake
{
int __IndexOf_Counter()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_HitTestProtectRecord &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_HitTestProtectRecord &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_HitTestProtectRecord &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_HitTestProtectRecord
{
int __IndexOf_MultiStrikeProtect()
{
    return 0;
}
int __IndexOf_DodgeProtect()
{
    return 1;
}
int __IndexOf_ForceHitInvincible()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_HittableDataRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_HittableDataRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_HittableDataRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_HittableDataRuntime
{
int __IndexOf_DefaultHitData()
{
    return 0;
}
int __IndexOf_ConditionalHitDatas()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_IgnoreSpecificAttackTagHit &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_IgnoreSpecificAttackTagHit &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_IgnoreSpecificAttackTagHit &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_IgnoreSpecificAttackTagHit
{
int __IndexOf_bInverseIgnore()
{
    return 0;
}
int __IndexOf_CountByTagName()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AttackIgnoreSpecificTarget &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AttackIgnoreSpecificTarget &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AttackIgnoreSpecificTarget &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AttackIgnoreSpecificTarget
{
int __IndexOf_ConditionByAttackData()
{
    return 0;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FHitBreakResistanceData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FHitBreakResistanceData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FHitBreakResistanceData
{
int __IndexOf_Leve2Count()
{
    return 0;
}
int __IndexOf_Leve3Count()
{
    return 1;
}
int __IndexOf_Leve4Count()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags32 GetDirtyFlags(FC_HitReaction &inout Data)
{
    FRootDirtyFlags32 __r;
    return __r;
}
void InitDirtyFlags(FC_HitReaction &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_HitReaction &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_HitReaction
{
int __IndexOf_StackedHitStates()
{
    return 0;
}
int __IndexOf_bIsBlowHeavy()
{
    return 1;
}
int __IndexOf_HitAngle()
{
    return 2;
}
int __IndexOf_HitFromAngle()
{
    return 3;
}
int __IndexOf_HitImpulseFromAngle()
{
    return 4;
}
int __IndexOf_HitImpulseX()
{
    return 5;
}
int __IndexOf_HitImpulseZ()
{
    return 6;
}
int __IndexOf_AttackerPrefabType()
{
    return 7;
}
int __IndexOf_DamageStartTime()
{
    return 8;
}
int __IndexOf_BreakStartTime()
{
    return 9;
}
int __IndexOf_HitStunDuration()
{
    return 10;
}
int __IndexOf_HitBreakResistance()
{
    return 11;
}
int __IndexOf_LastHitProtectTime()
{
    return 14;
}
int __IndexOf_HitProtectCount()
{
    return 15;
}
int __IndexOf_StaggerCount()
{
    return 16;
}
int __IndexOf_bToBreakCurFrame()
{
    return 17;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AttackerHitPresentation &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AttackerHitPresentation &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AttackerHitPresentation &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AttackerHitPresentation
{
int __IndexOf_AttackerHitOwner()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MutualClash &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MutualClash &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MutualClash &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MutualClash
{
int __IndexOf_bIsPlayer()
{
    return 0;
}
int __IndexOf_TotalClashCount()
{
    return 1;
}
int __IndexOf_HitAngle()
{
    return 2;
}
int __IndexOf_HitFromAngle()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_MutualClashActionInfo &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_MutualClashActionInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MutualClashActionInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MutualClashActionInfo
{
int __IndexOf_bIsPlayer()
{
    return 0;
}
int __IndexOf_MutualClashDamageType()
{
    return 1;
}
int __IndexOf_ConsumeMutualClashValue()
{
    return 2;
}
int __IndexOf_bTrigger()
{
    return 3;
}
int __IndexOf_bHappenClash()
{
    return 4;
}
int __IndexOf_bCheckDirection()
{
    return 5;
}
int __IndexOf_FromEntity()
{
    return 6;
}
int __IndexOf_EventEntity()
{
    return 7;
}
int __IndexOf_HitState()
{
    return 8;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FDefenseHitData &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FDefenseHitData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FDefenseHitData
{
int __IndexOf_bIsParry()
{
    return 0;
}
int __IndexOf_bCanDefense()
{
    return 1;
}
int __IndexOf_bBanAttackPresentation()
{
    return 2;
}
int __IndexOf_DefenseSuccessConsumeStamina()
{
    return 3;
}
int __IndexOf_DefenseFailedConsumeStamina()
{
    return 4;
}
int __IndexOf_bBreakWhenStaminaClear()
{
    return 5;
}
int __IndexOf_BreakStateWhenStaminaClear()
{
    return 6;
}
int __IndexOf_DefenseSuccessDamageRatio()
{
    return 7;
}
int __IndexOf_DefenseFailedDamageRatio()
{
    return 8;
}
int __IndexOf_bTransitDefenseSuccess()
{
    return 9;
}
int __IndexOf_DefenseSuccessTransitStateName()
{
    return 10;
}
int __IndexOf_bTransitDefenseFailed()
{
    return 11;
}
int __IndexOf_DefenseFailedTransitStateName()
{
    return 12;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DefenseHit &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DefenseHit &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DefenseHit &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DefenseHit
{
int __IndexOf_DefenseHitDatas()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_HitBoxPriorityHit &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_HitBoxPriorityHit &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_HitBoxPriorityHit &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_HitBoxPriorityHit
{
int __IndexOf_HitBoxName()
{
    return 0;
}
int __IndexOf_XYAngleMax()
{
    return 1;
}
int __IndexOf_ZAngleMax()
{
    return 2;
}
int __IndexOf_HitBoxCenterOffset()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_OnlyAcceptSpecificEntityAttack &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_OnlyAcceptSpecificEntityAttack &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_OnlyAcceptSpecificEntityAttack &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_OnlyAcceptSpecificEntityAttack
{
int __IndexOf_AcceptedEntity()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_IgnoreAttackFromEntities &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_IgnoreAttackFromEntities &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_IgnoreAttackFromEntities &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_IgnoreAttackFromEntities
{
int __IndexOf_IgnoredEntities()
{
    return 0;
}
}
