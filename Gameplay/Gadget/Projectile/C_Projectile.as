
enum EProjectileHitFXRotationMode
{
    ZeroRotation,
    MoveDirectionYaw,
    MoveDirection,
    ImpactNormal,
}

enum EProjectileFXLifeTime
{
    Independent,
    StopWhenProjectileDestroy,
    DestroyWhenProjectileDestroy,
}

namespace __INTENRAL_FC_ProjectileInfo_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileInfo> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileInfo>();
    const FC_ProjectileInfo DefaultValue = FC_ProjectileInfo();
}
namespace __INTENRAL_FC_ProjectileDelayDestroy_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileDelayDestroy> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileDelayDestroy>();
    const FC_ProjectileDelayDestroy DefaultValue = FC_ProjectileDelayDestroy();
}
namespace __INTENRAL_FC_ProjectileHitInfo_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileHitInfo> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileHitInfo>();
    const FC_ProjectileHitInfo DefaultValue = FC_ProjectileHitInfo();
}
namespace __INTENRAL_FC_ProjectileFXConfig_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileFXConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileFXConfig>();
    const FC_ProjectileFXConfig DefaultValue = FC_ProjectileFXConfig();
}
namespace __INTENRAL_FC_ProjectileActorVisualConfig_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileActorVisualConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileActorVisualConfig>();
    const FC_ProjectileActorVisualConfig DefaultValue = FC_ProjectileActorVisualConfig();
}
namespace __INTENRAL_FC_ProjectileFXLifeTime_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileFXLifeTime> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileFXLifeTime>();
    const FC_ProjectileFXLifeTime DefaultValue = FC_ProjectileFXLifeTime();
}
namespace __INTENRAL_FC_ProjectileHitConfig_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileHitConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileHitConfig>();
    const FC_ProjectileHitConfig DefaultValue = FC_ProjectileHitConfig();
}
namespace __INTENRAL_FC_ProjectileHitExplosionConfig_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileHitExplosionConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileHitExplosionConfig>();
    const FC_ProjectileHitExplosionConfig DefaultValue = FC_ProjectileHitExplosionConfig();
}
namespace __INTENRAL_FC_ProjectileStickyConfig_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileStickyConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileStickyConfig>();
    const FC_ProjectileStickyConfig DefaultValue = FC_ProjectileStickyConfig();
}
namespace __INTENRAL_FC_ProjectileDistanceAttenuationConfig_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileDistanceAttenuationConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileDistanceAttenuationConfig>();
    const FC_ProjectileDistanceAttenuationConfig DefaultValue = FC_ProjectileDistanceAttenuationConfig();
}
namespace __INTENRAL_FC_ProjectilePenetrationConfig_NS
{
    const TECSComponentDerivedPtr<FC_ProjectilePenetrationConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectilePenetrationConfig>();
    const FC_ProjectilePenetrationConfig DefaultValue = FC_ProjectilePenetrationConfig();
}
namespace __INTENRAL_FC_ProjectileHealthConfig_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileHealthConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileHealthConfig>();
    const FC_ProjectileHealthConfig DefaultValue = FC_ProjectileHealthConfig();
}
namespace __INTENRAL_FC_ProjectileHealth_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileHealth> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileHealth>();
    const FC_ProjectileHealth DefaultValue = FC_ProjectileHealth();
}
namespace __INTENRAL_FC_ProjectileHitStickAttach_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileHitStickAttach> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileHitStickAttach>();
    const FC_ProjectileHitStickAttach DefaultValue = FC_ProjectileHitStickAttach();
}
namespace __INTENRAL_FC_ProjectileVisualOffsetCacheData_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileVisualOffsetCacheData> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileVisualOffsetCacheData>();
    const FC_ProjectileVisualOffsetCacheData DefaultValue = FC_ProjectileVisualOffsetCacheData();
}
namespace __INTENRAL_FC_SurroundingMaterialCheckConfig_NS
{
    const TECSComponentDerivedPtr<FC_SurroundingMaterialCheckConfig> DerivedPtr = TECSComponentDerivedPtr<FC_SurroundingMaterialCheckConfig>();
    const FC_SurroundingMaterialCheckConfig DefaultValue = FC_SurroundingMaterialCheckConfig();
}
namespace __INTENRAL_FC_SurroundingMaterialCheckRuntime_NS
{
    const TECSComponentDerivedPtr<FC_SurroundingMaterialCheckRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_SurroundingMaterialCheckRuntime>();
    const FC_SurroundingMaterialCheckRuntime DefaultValue = FC_SurroundingMaterialCheckRuntime();
}
namespace __INTENRAL_FC_ProjectileVisualOffsetDisableTag_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileVisualOffsetDisableTag> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileVisualOffsetDisableTag>();
    const FC_ProjectileVisualOffsetDisableTag DefaultValue = FC_ProjectileVisualOffsetDisableTag();
}
namespace __INTENRAL_FC_ProjectileInTimeTweakTag_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileInTimeTweakTag> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileInTimeTweakTag>();
    const FC_ProjectileInTimeTweakTag DefaultValue = FC_ProjectileInTimeTweakTag();
}
namespace __INTENRAL_FC_ProjectileStickDestroyWithSimpleDestructible_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileStickDestroyWithSimpleDestructible> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileStickDestroyWithSimpleDestructible>();
    const FC_ProjectileStickDestroyWithSimpleDestructible DefaultValue = FC_ProjectileStickDestroyWithSimpleDestructible();
}
namespace __INTENRAL_FCE_CharacterFireProjectile_NS
{
    const TECSEventDerivedPtr<FCE_CharacterFireProjectile> DerivedPtr = TECSEventDerivedPtr<FCE_CharacterFireProjectile>();
}
namespace __INTENRAL_FCE_ProjectileHitPresentation_NS
{
    const TECSEventDerivedPtr<FCE_ProjectileHitPresentation> DerivedPtr = TECSEventDerivedPtr<FCE_ProjectileHitPresentation>();

}
struct FCE_CharacterFireProjectile : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity ProjectileEntity;
    UPROPERTY()
    FFireProjectileData FireConfig;
    UPROPERTY()
    FAttackInfo AttackInfo;
    UPROPERTY()
    FAttackHitTestProtectData HitTestProtectData;
    UPROPERTY()
    FVector Position;
    UPROPERTY()
    FRotator3f Rotation;
    UPROPERTY()
    FECSEntity FromWeaponEntity;
    UPROPERTY()
    FFPTime LifeTimeOverride = -1;
    UPROPERTY()
    int PoolType;


}

struct FC_ProjectileInfo : FECSComponent
{
    FRootDirtyFlags64 __DirtyFlags;
    UPROPERTY()
    bool m_bPredictable;
    UPROPERTY()
    FVector m_SpawnPosition;
    UPROPERTY()
    FQuat m_SpawnRotation;
    UPROPERTY()
    FVector m_DestroyPosition;
    UPROPERTY()
    bool m_bAttackDataOverride;
    UPROPERTY()
    FAttackInfo m_AttackInfo;
    UPROPERTY()
    FAttackBaseDamageValue m_Damage;
    UPROPERTY()
    FAttackBaseDamageValue m_DamageToAvatar;
    UPROPERTY()
    FAttackRecoverEnergyValue m_AttackRecoverEnergyData;
    UPROPERTY()
    FAttackInfo m_AttackInfoAfterPenetration;
    UPROPERTY()
    FAttackBaseDamageValue m_DamageAfterPenetration;
    UPROPERTY()
    FAttackBaseDamageValue m_DamageToAvatarAfterPenetration;
    UPROPERTY()
    FAttackRecoverEnergyValue m_AttackRecoverEnergyDataAfterPenetration;
    UPROPERTY()
    FFPTime m_DelayDestroyTime;
    UPROPERTY()
    FAttackHitTestProtectData m_HitTestProtectData;

    FC_ProjectileInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProjectileInfo(const FC_ProjectileInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProjectileInfo opAssign(const FC_ProjectileInfo &inout Other)
    {
        FC_ProjectileInfo __r;
        this.SetbPredictable(Other.GetbPredictable());
        this.SetSpawnPosition(Other.GetSpawnPosition());
        this.SetSpawnRotation(Other.GetSpawnRotation());
        this.SetDestroyPosition(Other.GetDestroyPosition());
        this.SetbAttackDataOverride(Other.GetbAttackDataOverride());
        this.SetAttackInfo(Other.GetAttackInfo());
        this.SetDamage(Other.GetDamage());
        this.SetDamageToAvatar(Other.GetDamageToAvatar());
        this.SetAttackRecoverEnergyData(Other.GetAttackRecoverEnergyData());
        this.SetAttackInfoAfterPenetration(Other.GetAttackInfoAfterPenetration());
        this.SetDamageAfterPenetration(Other.GetDamageAfterPenetration());
        this.SetDamageToAvatarAfterPenetration(Other.GetDamageToAvatarAfterPenetration());
        this.SetAttackRecoverEnergyDataAfterPenetration(Other.GetAttackRecoverEnergyDataAfterPenetration());
        this.SetDelayDestroyTime(Other.GetDelayDestroyTime());
        this.SetHitTestProtectData(Other.GetHitTestProtectData());
        return __r;
    }
    bool GetbPredictable() const property
    {
        return this.m_bPredictable;
    }
    void SetbPredictable(const bool __Value) property
    {
        if (!(this.m_bPredictable) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bPredictable = __Value;
        return;
    }
    const FVector GetSpawnPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_SpawnPosition() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetSpawnPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SpawnPosition = __Value;
        return;
    }
    const FQuat GetSpawnRotation() const property
    {
        const FQuat __r;
        return __r;
    }
    FQuat GetModify_SpawnRotation() property
    {
        FQuat __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetSpawnRotation(const FQuat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_SpawnRotation = __Value;
        return;
    }
    const FVector GetDestroyPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_DestroyPosition() property
    {
        FVector __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetDestroyPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_DestroyPosition = __Value;
        return;
    }
    bool GetbAttackDataOverride() const property
    {
        return this.m_bAttackDataOverride;
    }
    void SetbAttackDataOverride(const bool __Value) property
    {
        if (!(this.m_bAttackDataOverride) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bAttackDataOverride = __Value;
        return;
    }
    const FAttackInfo GetAttackInfo() const property
    {
        const FAttackInfo __r;
        return __r;
    }
    FAttackInfo GetModify_AttackInfo() property
    {
        FAttackInfo __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetAttackInfo(const FAttackInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_AttackInfo = __Value;
        return;
    }
    const FAttackBaseDamageValue GetDamage() const property
    {
        const FAttackBaseDamageValue __r;
        return __r;
    }
    FAttackBaseDamageValue GetDamage() property
    {
        FAttackBaseDamageValue __r;
        return __r;
    }
    void SetDamage(const FAttackBaseDamageValue &inout __Value) property
    {
        this.m_Damage = __Value;
        return;
    }
    const FAttackBaseDamageValue GetDamageToAvatar() const property
    {
        const FAttackBaseDamageValue __r;
        return __r;
    }
    FAttackBaseDamageValue GetDamageToAvatar() property
    {
        FAttackBaseDamageValue __r;
        return __r;
    }
    void SetDamageToAvatar(const FAttackBaseDamageValue &inout __Value) property
    {
        this.m_DamageToAvatar = __Value;
        return;
    }
    const FAttackRecoverEnergyValue GetAttackRecoverEnergyData() const property
    {
        const FAttackRecoverEnergyValue __r;
        return __r;
    }
    FAttackRecoverEnergyValue GetAttackRecoverEnergyData() property
    {
        FAttackRecoverEnergyValue __r;
        return __r;
    }
    void SetAttackRecoverEnergyData(const FAttackRecoverEnergyValue &inout __Value) property
    {
        this.m_AttackRecoverEnergyData = __Value;
        return;
    }
    const FAttackInfo GetAttackInfoAfterPenetration() const property
    {
        const FAttackInfo __r;
        return __r;
    }
    FAttackInfo GetModify_AttackInfoAfterPenetration() property
    {
        FAttackInfo __r;
        this.__MarkDirty(24);
        return __r;
    }
    void SetAttackInfoAfterPenetration(const FAttackInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(24);
        this.m_AttackInfoAfterPenetration = __Value;
        return;
    }
    const FAttackBaseDamageValue GetDamageAfterPenetration() const property
    {
        const FAttackBaseDamageValue __r;
        return __r;
    }
    FAttackBaseDamageValue GetDamageAfterPenetration() property
    {
        FAttackBaseDamageValue __r;
        return __r;
    }
    void SetDamageAfterPenetration(const FAttackBaseDamageValue &inout __Value) property
    {
        this.m_DamageAfterPenetration = __Value;
        return;
    }
    const FAttackBaseDamageValue GetDamageToAvatarAfterPenetration() const property
    {
        const FAttackBaseDamageValue __r;
        return __r;
    }
    FAttackBaseDamageValue GetDamageToAvatarAfterPenetration() property
    {
        FAttackBaseDamageValue __r;
        return __r;
    }
    void SetDamageToAvatarAfterPenetration(const FAttackBaseDamageValue &inout __Value) property
    {
        this.m_DamageToAvatarAfterPenetration = __Value;
        return;
    }
    const FAttackRecoverEnergyValue GetAttackRecoverEnergyDataAfterPenetration() const property
    {
        const FAttackRecoverEnergyValue __r;
        return __r;
    }
    FAttackRecoverEnergyValue GetAttackRecoverEnergyDataAfterPenetration() property
    {
        FAttackRecoverEnergyValue __r;
        return __r;
    }
    void SetAttackRecoverEnergyDataAfterPenetration(const FAttackRecoverEnergyValue &inout __Value) property
    {
        this.m_AttackRecoverEnergyDataAfterPenetration = __Value;
        return;
    }
    const FFPTime GetDelayDestroyTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_DelayDestroyTime() property
    {
        FFPTime __r;
        this.__MarkDirty(43);
        return __r;
    }
    void SetDelayDestroyTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(43);
        this.m_DelayDestroyTime = __Value;
        return;
    }
    const FAttackHitTestProtectData GetHitTestProtectData() const property
    {
        const FAttackHitTestProtectData __r;
        return __r;
    }
    FAttackHitTestProtectData GetModify_HitTestProtectData() property
    {
        FAttackHitTestProtectData __r;
        this.__MarkDirty(44);
        return __r;
    }
    void SetHitTestProtectData(const FAttackHitTestProtectData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(44);
        this.m_HitTestProtectData = __Value;
        return;
    }
}

struct FC_ProjectileDelayDestroy : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_DestroyTime;

    FC_ProjectileDelayDestroy()
    {
        this.m_DestroyTime = 0;
        this.__InitDirtyFlags();
        return;
    }
    FC_ProjectileDelayDestroy(const FC_ProjectileDelayDestroy &inout Other)
    {
        this.m_DestroyTime = 0;
        this.__InitDirtyFlags();
        this.m_DestroyTime = Other.m_DestroyTime;
        return;
    }
    FC_ProjectileDelayDestroy opAssign(const FC_ProjectileDelayDestroy &inout Other)
    {
        FC_ProjectileDelayDestroy __r;
        this.SetDestroyTime(Other.GetDestroyTime());
        return __r;
    }
    const FFPTime GetDestroyTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_DestroyTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDestroyTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DestroyTime = __Value;
        return;
    }
}

struct FC_ProjectileHitInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_HitCount;
    UPROPERTY()
    float32 m_PenetratedAttenuationRatio;
    UPROPERTY()
    TMap<FECSEntityId, int> m_HitCountByEntity;
    UPROPERTY()
    TMap<FECSEntityId, FFPTime> m_NextPenetrationTimeByEntity;

    FC_ProjectileHitInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProjectileHitInfo(const FC_ProjectileHitInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProjectileHitInfo opAssign(const FC_ProjectileHitInfo &inout Other)
    {
        FC_ProjectileHitInfo __r;
        this.SetHitCount(Other.GetHitCount());
        this.SetPenetratedAttenuationRatio(Other.GetPenetratedAttenuationRatio());
        this.SetHitCountByEntity(Other.GetHitCountByEntity());
        this.SetNextPenetrationTimeByEntity(Other.GetNextPenetrationTimeByEntity());
        return __r;
    }
    int GetHitCount() const property
    {
        return this.m_HitCount;
    }
    void SetHitCount(const int __Value) property
    {
        if (this.m_HitCount == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_HitCount = __Value;
        return;
    }
    float32 GetPenetratedAttenuationRatio() const property
    {
        return this.m_PenetratedAttenuationRatio;
    }
    void SetPenetratedAttenuationRatio(const float32 __Value) property
    {
        if (this.m_PenetratedAttenuationRatio == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_PenetratedAttenuationRatio = __Value;
        return;
    }
    const TMap<FECSEntityId, int> GetHitCountByEntity() const property
    {
        const TMap<FECSEntityId, int> __r;
        return __r;
    }
    TMap<FECSEntityId, int> GetModify_HitCountByEntity() property
    {
        TMap<FECSEntityId, int> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetHitCountByEntity(const TMap<FECSEntityId, int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_HitCountByEntity = __Value;
        return;
    }
    const TMap<FECSEntityId, FFPTime> GetNextPenetrationTimeByEntity() const property
    {
        const TMap<FECSEntityId, FFPTime> __r;
        return __r;
    }
    TMap<FECSEntityId, FFPTime> GetModify_NextPenetrationTimeByEntity() property
    {
        TMap<FECSEntityId, FFPTime> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetNextPenetrationTimeByEntity(const TMap<FECSEntityId, FFPTime> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_NextPenetrationTimeByEntity = __Value;
        return;
    }
}

struct FProjectileFXConfig
{
    UPROPERTY()
    bool bDetach = true;
    UPROPERTY()
    bool bUseAbsoluteRotation = false;
    UPROPERTY()
    EProjectileFXLifeTime FXLifeTime = EProjectileFXLifeTime(0);
    UPROPERTY()
    FVector LocationOffset = FVector::ZeroVector;
    UPROPERTY()
    FRotator RotationOffset = FRotator::ZeroRotator;
    UPROPERTY()
    FVector Scale = FVector::OneVector;
    UPROPERTY()
    FSoftClassPath Asset;
    UPROPERTY()
    TArray<FFXOverrideParam> OverrideParams;
    UPROPERTY()
    FFXSurfaceTraceParam SurfaceTraceParam;


    FFXConfig GetFXConfig() const
    {
        FFXConfig local_116;
        local_116.SetAsset(this.Asset);
        local_116.SetScale(this.Scale);
        local_116.SetbDetach(this.bDetach);
        local_116.SetbUseAbsoluteRotation(this.bUseAbsoluteRotation);
        local_116.SetLocationOffset(this.LocationOffset);
        local_116.SetRotationOffset(this.RotationOffset);
        local_116.SetOverrideParams(this.OverrideParams);
        local_116.SetSurfaceTraceParam(this.SurfaceTraceParam);
        return local_116;
    }
}

struct FProjectileFXLifeTimeConfig
{
    UPROPERTY()
    bool bLifeTimeWithProjectile;
    UPROPERTY()
    EFXStopMethod StopMethod;
    UPROPERTY()
    FProjectileFXConfig FXConfig;
    UPROPERTY()
    FFPTime SpawnTime;
    UPROPERTY()
    FFPTime Duration;
    UPROPERTY()
    TArray<FFXParamChangePoint> ParamChangePoints;

    FProjectileFXLifeTimeConfig()
    {
        this.bLifeTimeWithProjectile = true;
        this.StopMethod = EFXStopMethod(0);
        this.SpawnTime = 0;
        this.Duration = 0;
        this.FXConfig.bDetach = false;
        return;
    }
}

struct FC_ProjectileFXConfig : FECSComponent
{
    UPROPERTY()
    TArray<FProjectileFXLifeTimeConfig> LifeTimeFX;

    FC_ProjectileFXConfig()
    {
        return;
    }
}

struct FC_ProjectileActorVisualConfig : FECSComponent
{
    UPROPERTY()
    TArray<FSingleMaterialParamRequestData> SpawnMaterialParam;
    UPROPERTY()
    float32 DestroyActorDelayTime = 0.0f;
    UPROPERTY()
    TArray<FSingleMaterialParamRequestData> DestroyMaterialParam;


}

struct FProjectileFXLifeTimeRuntimeData
{
    UPROPERTY()
    FECSEntity FXEntity;
    UPROPERTY()
    bool bStopWithProjectile = true;
    UPROPERTY()
    FFPTime EndTime;
    UPROPERTY()
    EFXStopMethod StopMethod = EFXStopMethod(0);
    UPROPERTY()
    TMap<FName, FFXParamValueLerpTime> LerpParamValues;


}

struct FC_ProjectileFXLifeTime : FECSComponent
{
    UPROPERTY()
    FFPTime CurTime;
    UPROPERTY()
    TArray<FProjectileFXLifeTimeRuntimeData> FXActorDatas;

    FC_ProjectileFXLifeTime()
    {
        return;
    }
    bool ConditionalReservePopFromPool(const FECSEntity &inout Entity) const
    {
        int local_6 = 0;
        FC_PoolEntityVersionNonSync local_12;
        if (!(!(local_6)) && local_12)
        {
            return (FName(local_12.PrefabPathName) == local_6.GetPrefabPathName()) && (int(local_12.PopFrame) == local_6.GetPopFrame());
        }
        return false;
    }
}

struct FC_ProjectileHitConfig : FECSComponent
{
    UPROPERTY()
    bool bCanCauseDamageByHit = true;
    UPROPERTY()
    bool bDestroyWhenHitScene = true;
    UPROPERTY()
    bool bNeverDestroyByHit = false;
    UPROPERTY()
    uint8 HitableRelation = (3 != 0);
    UPROPERTY()
    FDataObjectPtr AttackDataConfig;
    UPROPERTY()
    EProjectileHitFXRotationMode FXRotationMode = EProjectileHitFXRotationMode(1);
    UPROPERTY()
    bool bUseCustomStrikeDirection = false;
    UPROPERTY()
    float32 CustomStrikeDirectionAngle = 0.0f;
    UPROPERTY()
    FProjectileFXConfig HitFXConfig;
    UPROPERTY()
    FProjectileFXConfig HitSceneFXConfig;


}

struct FC_ProjectileHitExplosionConfig : FECSComponent
{
    UPROPERTY()
    EHitEffectTriggerTime ExposionTriggerTime;
    UPROPERTY()
    bool bExpolsionOnHitScene = true;
    UPROPERTY()
    bool bExpolsionOnHitEntity = true;
    UPROPERTY()
    bool bExpolsionOnHitAlly = true;
    UPROPERTY()
    FHitTestShape ExplosionShape;
    UPROPERTY()
    FVector ExplosionPointOffset = FVector::ZeroVector;
    UPROPERTY()
    FDataObjectPtr AttackDataConfig;
    UPROPERTY()
    FFXConfig ExplosionFX;


}

struct FC_ProjectileStickyConfig : FECSComponent
{
    UPROPERTY()
    bool bDestroyWithTarget = true;
    UPROPERTY()
    float32 OverrideLifeTime = 0.0f;


}

struct FC_ProjectileDistanceAttenuationConfig : FECSComponent
{
    UPROPERTY()
    FRuntimeFloatCurve AttenuationCurve;

    FC_ProjectileDistanceAttenuationConfig()
    {
        FRuntimeCurveUtils::CreateLinear(1000.0f, 1.0f, 3000.0f, 0.2f);
        return;
    }
}

struct FC_ProjectilePenetrationConfig : FECSComponent
{
    UPROPERTY()
    bool bDestroyWhenReachMaxHitCount = true;
    UPROPERTY()
    int MaxHitCount = 20;
    UPROPERTY()
    int MaxHitCountPerTargetEntity = 1;
    UPROPERTY()
    float32 AttenuationRatioPerHit = 1.0f;
    UPROPERTY()
    float32 AttenuationRatioMin = 0.1f;
    UPROPERTY()
    float32 AttenuationBonusWhenHitWeakness = 1.1f;
    UPROPERTY()
    FFPTime HitInterval = -1;
    UPROPERTY()
    bool bChangeAttackForPenetration = false;
    UPROPERTY()
    FDataObjectPtr AttackDataAfterPenetration;
    UPROPERTY()
    FProjectileFXConfig HitFXConfigAfterPenetration;
    UPROPERTY()
    EProjectileHitTestType HitTestType = EProjectileHitTestType(1);
    UPROPERTY()
    int PenetrationHitCheckMaxSampleNum = 5;
    UPROPERTY()
    float32 PenetrationHitCheckDeltaDistance = 50.0f;
    UPROPERTY()
    FFPTime TimeDelayPerPenetrationHit = 0.2;
    UPROPERTY()
    FFPTime PenetrationSameTargetMinInterval = -1.0;


}

struct FProjectileHealthHitDamageOverride
{
    UPROPERTY()
    bool bNoDamageToHealth = false;
    UPROPERTY()
    int OverrideHitCountAccumulation = 1;


}

struct FC_ProjectileHealthConfig : FECSComponent
{
    UPROPERTY()
    bool bCanDestroyByHit = true;
    UPROPERTY()
    float32 DamageCanTake = 0.0f;
    UPROPERTY()
    int CanBeHitCount = 0;
    UPROPERTY()
    bool bShowUI = false;


}

struct FC_ProjectileHealth : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bCanDestroyByHit;
    UPROPERTY()
    int m_RemainCanBeHitCount;
    UPROPERTY()
    float32 m_DamageTaken;
    UPROPERTY()
    float32 m_RemainDamageCanTake;

    FC_ProjectileHealth()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProjectileHealth(const FC_ProjectileHealth &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProjectileHealth opAssign(const FC_ProjectileHealth &inout Other)
    {
        FC_ProjectileHealth __r;
        this.SetbCanDestroyByHit(Other.GetbCanDestroyByHit());
        this.SetRemainCanBeHitCount(Other.GetRemainCanBeHitCount());
        this.SetDamageTaken(Other.GetDamageTaken());
        this.SetRemainDamageCanTake(Other.GetRemainDamageCanTake());
        return __r;
    }
    bool GetbCanDestroyByHit() const property
    {
        return this.m_bCanDestroyByHit;
    }
    void SetbCanDestroyByHit(const bool __Value) property
    {
        if (!(this.m_bCanDestroyByHit) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bCanDestroyByHit = __Value;
        return;
    }
    int GetRemainCanBeHitCount() const property
    {
        return this.m_RemainCanBeHitCount;
    }
    void SetRemainCanBeHitCount(const int __Value) property
    {
        if (this.m_RemainCanBeHitCount == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RemainCanBeHitCount = __Value;
        return;
    }
    float32 GetDamageTaken() const property
    {
        return this.m_DamageTaken;
    }
    void SetDamageTaken(const float32 __Value) property
    {
        if (this.m_DamageTaken == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_DamageTaken = __Value;
        return;
    }
    float32 GetRemainDamageCanTake() const property
    {
        return this.m_RemainDamageCanTake;
    }
    void SetRemainDamageCanTake(const float32 __Value) property
    {
        if (this.m_RemainDamageCanTake == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_RemainDamageCanTake = __Value;
        return;
    }
}

struct FCE_ProjectileHitPresentation : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    EAttachFXStopMethod StopMethod = EAttachFXStopMethod(4);
    UPROPERTY()
    FECSEntity OwnerEntity;
    UPROPERTY()
    FECSEntity AttachEntity;
    UPROPERTY()
    FFXConfig HitFX;


}

struct FProjectileStickAttachmentInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    FVector m_HitTestFromPos;
    UPROPERTY()
    FVector m_HitTestToPos;
    UPROPERTY()
    FName m_SocketName;

    FProjectileStickAttachmentInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FProjectileStickAttachmentInfo(const FProjectileStickAttachmentInfo &inout Other)
    {
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_HitTestFromPos = Other.m_HitTestFromPos;
        this.m_HitTestToPos = Other.m_HitTestToPos;
        this.m_SocketName = Other.m_SocketName;
        return;
    }
    FProjectileStickAttachmentInfo opAssign(const FProjectileStickAttachmentInfo &inout Other)
    {
        FProjectileStickAttachmentInfo __r;
        this.SetTargetEntity(Other.GetTargetEntity());
        this.SetHitTestFromPos(Other.GetHitTestFromPos());
        this.SetHitTestToPos(Other.GetHitTestToPos());
        this.SetSocketName(Other.GetSocketName());
        return __r;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TargetEntity = __Value;
        return;
    }
    const FVector GetHitTestFromPos() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_HitTestFromPos() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetHitTestFromPos(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_HitTestFromPos = __Value;
        return;
    }
    const FVector GetHitTestToPos() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_HitTestToPos() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetHitTestToPos(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_HitTestToPos = __Value;
        return;
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
        this.__MarkDirty(3);
        this.m_SocketName = __Value;
        return;
    }
}

struct FC_ProjectileHitStickAttach : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FProjectileStickAttachmentInfo m_Info;

    FC_ProjectileHitStickAttach()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ProjectileHitStickAttach(const FC_ProjectileHitStickAttach &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Info = Other.m_Info;
        return;
    }
    FC_ProjectileHitStickAttach opAssign(const FC_ProjectileHitStickAttach &inout Other)
    {
        FC_ProjectileHitStickAttach __r;
        this.SetInfo(Other.GetInfo());
        return __r;
    }
    FProjectileStickAttachmentInfo GetInfo() const property
    {
        FProjectileStickAttachmentInfo __r;
        return __r;
    }
    FProjectileStickAttachmentInfo GetInfo() property
    {
        FProjectileStickAttachmentInfo __r;
        return __r;
    }
    void SetInfo(const FProjectileStickAttachmentInfo &inout __Value) property
    {
        this.m_Info = __Value;
        return;
    }
}

struct FC_ProjectileVisualOffsetCacheData : FECSComponent
{
    UPROPERTY()
    FFPTime AddTime;
    UPROPERTY()
    FVector3f PositionOffset = FVector3f::ZeroVector;
    UPROPERTY()
    FQuat4f RotationOffset = FQuat4f::Identity;
    UPROPERTY()
    float32 BlendWeight = 0.0f;


}

struct FC_SurroundingMaterialCheckConfig : FECSComponent
{
    UPROPERTY()
    FVector TraceLine;
    UPROPERTY()
    float32 CheckInterval;

    FC_SurroundingMaterialCheckConfig()
    {
        FVector local_6 = FVector(0.0, 0.0, -50.0);
        this.CheckInterval = 0.1f;
        return;
    }
}

struct FC_SurroundingMaterialCheckRuntime : FECSComponent
{
    UPROPERTY()
    FVector TraceLine;
    UPROPERTY()
    float32 CheckInterval;
    UPROPERTY()
    float32 LastCheckTime;
    UPROPERTY()
    bool bSurfaceUpdate;
    UPROPERTY()
    FName OldSurfaceName;
    UPROPERTY()
    FName NewSurfaceName;
    UPROPERTY()
    int NewSurfaceIndex;

    FC_SurroundingMaterialCheckRuntime()
    {
        FVector local_6 = FVector(0.0, 0.0, -50.0);
        this.CheckInterval = 0.1f;
        this.LastCheckTime = 0.0f;
        this.bSurfaceUpdate = false;
        this.OldSurfaceName = NAME_None;
        this.NewSurfaceName = NAME_None;
        this.NewSurfaceIndex = 0;
        return;
    }
    bool ConditionalReservePopFromPool(const FECSEntity &inout Entity) const
    {
        int local_6 = 0;
        int local_12 = 0;
        if (!(!(local_6)) && local_12)
        {
            return (FName(local_12.PrefabPathName) == local_6.GetPrefabPathName());
        }
        return false;
    }
}

struct FC_ProjectileVisualOffsetDisableTag : FECSComponent
{
    FC_ProjectileVisualOffsetDisableTag()
    {
        return;
    }
}

struct FC_ProjectileInTimeTweakTag : FECSComponent
{
    FC_ProjectileInTimeTweakTag()
    {
        return;
    }
}

struct FC_ProjectileStickDestroyWithSimpleDestructible : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FSimpleDestructibleCacheKey_FoliageISM m_FoliageISM;
    UPROPERTY()
    FSimpleDestructibleCacheKey_FoliageISkM m_FoliageISkM;
    UPROPERTY()
    FSimpleDestructibleCacheKey_StaticMesh m_StaticMesh;

    FC_ProjectileStickDestroyWithSimpleDestructible()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ProjectileStickDestroyWithSimpleDestructible(const FC_ProjectileStickDestroyWithSimpleDestructible &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_FoliageISM = Other.m_FoliageISM;
        this.m_FoliageISkM = Other.m_FoliageISkM;
        this.m_StaticMesh = Other.m_StaticMesh;
        return;
    }
    FC_ProjectileStickDestroyWithSimpleDestructible opAssign(const FC_ProjectileStickDestroyWithSimpleDestructible &inout Other)
    {
        FC_ProjectileStickDestroyWithSimpleDestructible __r;
        this.SetFoliageISM(Other.GetFoliageISM());
        this.SetFoliageISkM(Other.GetFoliageISkM());
        this.SetStaticMesh(Other.GetStaticMesh());
        return __r;
    }
    const FSimpleDestructibleCacheKey_FoliageISM GetFoliageISM() const property
    {
        const FSimpleDestructibleCacheKey_FoliageISM __r;
        return __r;
    }
    FSimpleDestructibleCacheKey_FoliageISM GetModify_FoliageISM() property
    {
        FSimpleDestructibleCacheKey_FoliageISM __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetFoliageISM(const FSimpleDestructibleCacheKey_FoliageISM &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FoliageISM = __Value;
        return;
    }
    const FSimpleDestructibleCacheKey_FoliageISkM GetFoliageISkM() const property
    {
        const FSimpleDestructibleCacheKey_FoliageISkM __r;
        return __r;
    }
    FSimpleDestructibleCacheKey_FoliageISkM GetModify_FoliageISkM() property
    {
        FSimpleDestructibleCacheKey_FoliageISkM __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetFoliageISkM(const FSimpleDestructibleCacheKey_FoliageISkM &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_FoliageISkM = __Value;
        return;
    }
    FSimpleDestructibleCacheKey_StaticMesh GetStaticMesh() const property
    {
        FSimpleDestructibleCacheKey_StaticMesh __r;
        return __r;
    }
    FSimpleDestructibleCacheKey_StaticMesh GetModify_StaticMesh() property
    {
        FSimpleDestructibleCacheKey_StaticMesh __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetStaticMesh(const FSimpleDestructibleCacheKey_StaticMesh &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_StaticMesh = __Value;
        return;
    }
}

namespace ECSFunc_FC_ProjectileInfo
{
UFUNCTION()
bool HasProjectileInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileInfo);
}
FC_ProjectileInfo& AssignProjectileInfo(const FECSEntity &inout Entity, const FC_ProjectileInfo &inout DefaultValue = FC_ProjectileInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileInfo_BP(const FECSEntity &inout Entity, const FC_ProjectileInfo &inout DefaultValue = FC_ProjectileInfo())
{
    ECSFunc_FC_ProjectileInfo::AssignProjectileInfo(Entity, DefaultValue);
    return;
}
FC_ProjectileInfo& ModifyProjectileInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileInfo));
    return local_12.GetComp();
}
FC_ProjectileInfo& ModifyOrAddProjectileInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileInfo));
    return local_12.GetComp();
}
const FC_ProjectileInfo& GetProjectileInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileInfo GetProjectileInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileInfo& local_4 = ECSFunc_FC_ProjectileInfo::GetProjectileInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileInfo();
}
const FC_ProjectileInfo GetDefaultedProjectileInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileInfo);
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
FC_ProjectileInfo GetDefaultedProjectileInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileInfo::GetDefaultedProjectileInfo(Entity);
}
UFUNCTION()
bool RemoveProjectileInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileInfo);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileDelayDestroy
{
UFUNCTION()
bool HasProjectileDelayDestroy(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDelayDestroy);
}
FC_ProjectileDelayDestroy& AssignProjectileDelayDestroy(const FECSEntity &inout Entity, const FC_ProjectileDelayDestroy &inout DefaultValue = FC_ProjectileDelayDestroy())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDelayDestroy, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileDelayDestroy_BP(const FECSEntity &inout Entity, const FC_ProjectileDelayDestroy &inout DefaultValue = FC_ProjectileDelayDestroy())
{
    ECSFunc_FC_ProjectileDelayDestroy::AssignProjectileDelayDestroy(Entity, DefaultValue);
    return;
}
FC_ProjectileDelayDestroy& ModifyProjectileDelayDestroy(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDelayDestroy));
    return local_12.GetComp();
}
FC_ProjectileDelayDestroy& ModifyOrAddProjectileDelayDestroy(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDelayDestroy));
    return local_12.GetComp();
}
const FC_ProjectileDelayDestroy& GetProjectileDelayDestroy(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDelayDestroy));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileDelayDestroy GetProjectileDelayDestroy_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileDelayDestroy& local_4 = ECSFunc_FC_ProjectileDelayDestroy::GetProjectileDelayDestroy(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileDelayDestroy();
}
const FC_ProjectileDelayDestroy GetDefaultedProjectileDelayDestroy(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileDelayDestroy __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDelayDestroy);
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
FC_ProjectileDelayDestroy GetDefaultedProjectileDelayDestroy_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileDelayDestroy::GetDefaultedProjectileDelayDestroy(Entity);
}
UFUNCTION()
bool RemoveProjectileDelayDestroy(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDelayDestroy);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileDelayDestroyOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileDelayDestroy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDelayDestroyOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileDelayDestroy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDelayDestroyOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileDelayDestroy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDelayDestroyOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileDelayDestroy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDelayDestroyOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileDelayDestroy, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileDelayDestroyLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileDelayDestroy, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileDelayDestroyActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileDelayDestroy, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileDelayDestroyModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileDelayDestroy, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileHitInfo
{
UFUNCTION()
bool HasProjectileHitInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitInfo);
}
FC_ProjectileHitInfo& AssignProjectileHitInfo(const FECSEntity &inout Entity, const FC_ProjectileHitInfo &inout DefaultValue = FC_ProjectileHitInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileHitInfo_BP(const FECSEntity &inout Entity, const FC_ProjectileHitInfo &inout DefaultValue = FC_ProjectileHitInfo())
{
    ECSFunc_FC_ProjectileHitInfo::AssignProjectileHitInfo(Entity, DefaultValue);
    return;
}
FC_ProjectileHitInfo& ModifyProjectileHitInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitInfo));
    return local_12.GetComp();
}
FC_ProjectileHitInfo& ModifyOrAddProjectileHitInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitInfo));
    return local_12.GetComp();
}
const FC_ProjectileHitInfo& GetProjectileHitInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileHitInfo GetProjectileHitInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileHitInfo& local_4 = ECSFunc_FC_ProjectileHitInfo::GetProjectileHitInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileHitInfo();
}
const FC_ProjectileHitInfo GetDefaultedProjectileHitInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileHitInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitInfo);
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
FC_ProjectileHitInfo GetDefaultedProjectileHitInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileHitInfo::GetDefaultedProjectileHitInfo(Entity);
}
UFUNCTION()
bool RemoveProjectileHitInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitInfo);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileHitInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileHitInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileHitInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileHitInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileHitInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileHitInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileHitInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileHitInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileHitInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileHitInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileHitInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileHitInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileFXConfig
{
UFUNCTION()
bool HasProjectileFXConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileFXConfig);
}
FC_ProjectileFXConfig& AssignProjectileFXConfig(const FECSEntity &inout Entity, const FC_ProjectileFXConfig &inout DefaultValue = FC_ProjectileFXConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileFXConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileFXConfig_BP(const FECSEntity &inout Entity, const FC_ProjectileFXConfig &inout DefaultValue = FC_ProjectileFXConfig())
{
    ECSFunc_FC_ProjectileFXConfig::AssignProjectileFXConfig(Entity, DefaultValue);
    return;
}
FC_ProjectileFXConfig& ModifyProjectileFXConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileFXConfig));
    return local_12.GetComp();
}
FC_ProjectileFXConfig& ModifyOrAddProjectileFXConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileFXConfig));
    return local_12.GetComp();
}
const FC_ProjectileFXConfig& GetProjectileFXConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileFXConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileFXConfig GetProjectileFXConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ProjectileFXConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_ProjectileFXConfig::GetProjectileFXConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ProjectileFXConfig GetDefaultedProjectileFXConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileFXConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileFXConfig);
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
FC_ProjectileFXConfig GetDefaultedProjectileFXConfig_BP(const FECSEntity &inout Entity)
{
    FC_ProjectileFXConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveProjectileFXConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileFXConfig);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileFXConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileFXConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileFXConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileFXConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileFXConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileFXConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileFXConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileFXConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileFXConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileFXConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileFXConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileFXConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileActorVisualConfig
{
UFUNCTION()
bool HasProjectileActorVisualConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileActorVisualConfig);
}
FC_ProjectileActorVisualConfig& AssignProjectileActorVisualConfig(const FECSEntity &inout Entity, const FC_ProjectileActorVisualConfig &inout DefaultValue = FC_ProjectileActorVisualConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileActorVisualConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileActorVisualConfig_BP(const FECSEntity &inout Entity, const FC_ProjectileActorVisualConfig &inout DefaultValue = FC_ProjectileActorVisualConfig())
{
    ECSFunc_FC_ProjectileActorVisualConfig::AssignProjectileActorVisualConfig(Entity, DefaultValue);
    return;
}
FC_ProjectileActorVisualConfig& ModifyProjectileActorVisualConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileActorVisualConfig));
    return local_12.GetComp();
}
FC_ProjectileActorVisualConfig& ModifyOrAddProjectileActorVisualConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileActorVisualConfig));
    return local_12.GetComp();
}
const FC_ProjectileActorVisualConfig& GetProjectileActorVisualConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileActorVisualConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileActorVisualConfig GetProjectileActorVisualConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ProjectileActorVisualConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_ProjectileActorVisualConfig::GetProjectileActorVisualConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ProjectileActorVisualConfig GetDefaultedProjectileActorVisualConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileActorVisualConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileActorVisualConfig);
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
FC_ProjectileActorVisualConfig GetDefaultedProjectileActorVisualConfig_BP(const FECSEntity &inout Entity)
{
    FC_ProjectileActorVisualConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveProjectileActorVisualConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileActorVisualConfig);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileActorVisualConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileActorVisualConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileActorVisualConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileActorVisualConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileActorVisualConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileActorVisualConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileActorVisualConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileActorVisualConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileActorVisualConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileActorVisualConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileActorVisualConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileActorVisualConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileActorVisualConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileActorVisualConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileActorVisualConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileActorVisualConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileFXLifeTime
{
UFUNCTION()
bool HasProjectileFXLifeTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileFXLifeTime);
}
FC_ProjectileFXLifeTime& AssignProjectileFXLifeTime(const FECSEntity &inout Entity, const FC_ProjectileFXLifeTime &inout DefaultValue = FC_ProjectileFXLifeTime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileFXLifeTime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileFXLifeTime_BP(const FECSEntity &inout Entity, const FC_ProjectileFXLifeTime &inout DefaultValue = FC_ProjectileFXLifeTime())
{
    ECSFunc_FC_ProjectileFXLifeTime::AssignProjectileFXLifeTime(Entity, DefaultValue);
    return;
}
FC_ProjectileFXLifeTime& ModifyProjectileFXLifeTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileFXLifeTime));
    return local_12.GetComp();
}
FC_ProjectileFXLifeTime& ModifyOrAddProjectileFXLifeTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileFXLifeTime));
    return local_12.GetComp();
}
const FC_ProjectileFXLifeTime& GetProjectileFXLifeTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileFXLifeTime));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileFXLifeTime GetProjectileFXLifeTime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ProjectileFXLifeTime __r;
    bValid = false;
    bValid = ECSFunc_FC_ProjectileFXLifeTime::GetProjectileFXLifeTime(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ProjectileFXLifeTime GetDefaultedProjectileFXLifeTime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileFXLifeTime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileFXLifeTime);
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
FC_ProjectileFXLifeTime GetDefaultedProjectileFXLifeTime_BP(const FECSEntity &inout Entity)
{
    FC_ProjectileFXLifeTime __r;
    return __r;
}
UFUNCTION()
bool RemoveProjectileFXLifeTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileFXLifeTime);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileFXLifeTimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileFXLifeTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileFXLifeTimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileFXLifeTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileFXLifeTimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileFXLifeTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileFXLifeTimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileFXLifeTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileFXLifeTimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileFXLifeTime, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileFXLifeTimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileFXLifeTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileFXLifeTimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileFXLifeTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileFXLifeTimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileFXLifeTime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileHitConfig
{
UFUNCTION()
bool HasProjectileHitConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitConfig);
}
FC_ProjectileHitConfig& AssignProjectileHitConfig(const FECSEntity &inout Entity, const FC_ProjectileHitConfig &inout DefaultValue = FC_ProjectileHitConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileHitConfig_BP(const FECSEntity &inout Entity, const FC_ProjectileHitConfig &inout DefaultValue = FC_ProjectileHitConfig())
{
    ECSFunc_FC_ProjectileHitConfig::AssignProjectileHitConfig(Entity, DefaultValue);
    return;
}
FC_ProjectileHitConfig& ModifyProjectileHitConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitConfig));
    return local_12.GetComp();
}
FC_ProjectileHitConfig& ModifyOrAddProjectileHitConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitConfig));
    return local_12.GetComp();
}
const FC_ProjectileHitConfig& GetProjectileHitConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileHitConfig GetProjectileHitConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ProjectileHitConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_ProjectileHitConfig::GetProjectileHitConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ProjectileHitConfig GetDefaultedProjectileHitConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileHitConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitConfig);
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
FC_ProjectileHitConfig GetDefaultedProjectileHitConfig_BP(const FECSEntity &inout Entity)
{
    FC_ProjectileHitConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveProjectileHitConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitConfig);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileHitConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileHitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileHitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileHitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileHitConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileHitConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileHitConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileHitConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileHitConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileHitConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileHitConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileHitConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileHitExplosionConfig
{
UFUNCTION()
bool HasProjectileHitExplosionConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitExplosionConfig);
}
FC_ProjectileHitExplosionConfig& AssignProjectileHitExplosionConfig(const FECSEntity &inout Entity, const FC_ProjectileHitExplosionConfig &inout DefaultValue = FC_ProjectileHitExplosionConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitExplosionConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileHitExplosionConfig_BP(const FECSEntity &inout Entity, const FC_ProjectileHitExplosionConfig &inout DefaultValue = FC_ProjectileHitExplosionConfig())
{
    ECSFunc_FC_ProjectileHitExplosionConfig::AssignProjectileHitExplosionConfig(Entity, DefaultValue);
    return;
}
FC_ProjectileHitExplosionConfig& ModifyProjectileHitExplosionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitExplosionConfig));
    return local_12.GetComp();
}
FC_ProjectileHitExplosionConfig& ModifyOrAddProjectileHitExplosionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitExplosionConfig));
    return local_12.GetComp();
}
const FC_ProjectileHitExplosionConfig& GetProjectileHitExplosionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitExplosionConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileHitExplosionConfig GetProjectileHitExplosionConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ProjectileHitExplosionConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_ProjectileHitExplosionConfig::GetProjectileHitExplosionConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ProjectileHitExplosionConfig GetDefaultedProjectileHitExplosionConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileHitExplosionConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitExplosionConfig);
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
FC_ProjectileHitExplosionConfig GetDefaultedProjectileHitExplosionConfig_BP(const FECSEntity &inout Entity)
{
    FC_ProjectileHitExplosionConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveProjectileHitExplosionConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitExplosionConfig);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileHitExplosionConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileHitExplosionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitExplosionConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileHitExplosionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitExplosionConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileHitExplosionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitExplosionConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileHitExplosionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitExplosionConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileHitExplosionConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileHitExplosionConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileHitExplosionConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileHitExplosionConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileHitExplosionConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileHitExplosionConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileHitExplosionConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileStickyConfig
{
UFUNCTION()
bool HasProjectileStickyConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileStickyConfig);
}
FC_ProjectileStickyConfig& AssignProjectileStickyConfig(const FECSEntity &inout Entity, const FC_ProjectileStickyConfig &inout DefaultValue = FC_ProjectileStickyConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileStickyConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileStickyConfig_BP(const FECSEntity &inout Entity, const FC_ProjectileStickyConfig &inout DefaultValue = FC_ProjectileStickyConfig())
{
    ECSFunc_FC_ProjectileStickyConfig::AssignProjectileStickyConfig(Entity, DefaultValue);
    return;
}
FC_ProjectileStickyConfig& ModifyProjectileStickyConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileStickyConfig));
    return local_12.GetComp();
}
FC_ProjectileStickyConfig& ModifyOrAddProjectileStickyConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileStickyConfig));
    return local_12.GetComp();
}
const FC_ProjectileStickyConfig& GetProjectileStickyConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileStickyConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileStickyConfig GetProjectileStickyConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileStickyConfig& local_4 = ECSFunc_FC_ProjectileStickyConfig::GetProjectileStickyConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileStickyConfig();
}
const FC_ProjectileStickyConfig GetDefaultedProjectileStickyConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileStickyConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileStickyConfig);
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
FC_ProjectileStickyConfig GetDefaultedProjectileStickyConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileStickyConfig::GetDefaultedProjectileStickyConfig(Entity);
}
UFUNCTION()
bool RemoveProjectileStickyConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileStickyConfig);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileStickyConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileStickyConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileStickyConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileStickyConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileStickyConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileStickyConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileStickyConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileStickyConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileStickyConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileStickyConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileStickyConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileStickyConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileStickyConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileStickyConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileStickyConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileStickyConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileDistanceAttenuationConfig
{
UFUNCTION()
bool HasProjectileDistanceAttenuationConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDistanceAttenuationConfig);
}
FC_ProjectileDistanceAttenuationConfig& AssignProjectileDistanceAttenuationConfig(const FECSEntity &inout Entity, const FC_ProjectileDistanceAttenuationConfig &inout DefaultValue = FC_ProjectileDistanceAttenuationConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDistanceAttenuationConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileDistanceAttenuationConfig_BP(const FECSEntity &inout Entity, const FC_ProjectileDistanceAttenuationConfig &inout DefaultValue = FC_ProjectileDistanceAttenuationConfig())
{
    ECSFunc_FC_ProjectileDistanceAttenuationConfig::AssignProjectileDistanceAttenuationConfig(Entity, DefaultValue);
    return;
}
FC_ProjectileDistanceAttenuationConfig& ModifyProjectileDistanceAttenuationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDistanceAttenuationConfig));
    return local_12.GetComp();
}
FC_ProjectileDistanceAttenuationConfig& ModifyOrAddProjectileDistanceAttenuationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDistanceAttenuationConfig));
    return local_12.GetComp();
}
const FC_ProjectileDistanceAttenuationConfig& GetProjectileDistanceAttenuationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDistanceAttenuationConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileDistanceAttenuationConfig GetProjectileDistanceAttenuationConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ProjectileDistanceAttenuationConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_ProjectileDistanceAttenuationConfig::GetProjectileDistanceAttenuationConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ProjectileDistanceAttenuationConfig GetDefaultedProjectileDistanceAttenuationConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileDistanceAttenuationConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDistanceAttenuationConfig);
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
FC_ProjectileDistanceAttenuationConfig GetDefaultedProjectileDistanceAttenuationConfig_BP(const FECSEntity &inout Entity)
{
    FC_ProjectileDistanceAttenuationConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveProjectileDistanceAttenuationConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDistanceAttenuationConfig);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileDistanceAttenuationConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileDistanceAttenuationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDistanceAttenuationConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileDistanceAttenuationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDistanceAttenuationConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileDistanceAttenuationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDistanceAttenuationConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileDistanceAttenuationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDistanceAttenuationConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileDistanceAttenuationConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileDistanceAttenuationConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileDistanceAttenuationConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileDistanceAttenuationConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileDistanceAttenuationConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileDistanceAttenuationConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileDistanceAttenuationConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectilePenetrationConfig
{
UFUNCTION()
bool HasProjectilePenetrationConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectilePenetrationConfig);
}
FC_ProjectilePenetrationConfig& AssignProjectilePenetrationConfig(const FECSEntity &inout Entity, const FC_ProjectilePenetrationConfig &inout DefaultValue = FC_ProjectilePenetrationConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectilePenetrationConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectilePenetrationConfig_BP(const FECSEntity &inout Entity, const FC_ProjectilePenetrationConfig &inout DefaultValue = FC_ProjectilePenetrationConfig())
{
    ECSFunc_FC_ProjectilePenetrationConfig::AssignProjectilePenetrationConfig(Entity, DefaultValue);
    return;
}
FC_ProjectilePenetrationConfig& ModifyProjectilePenetrationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectilePenetrationConfig));
    return local_12.GetComp();
}
FC_ProjectilePenetrationConfig& ModifyOrAddProjectilePenetrationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectilePenetrationConfig));
    return local_12.GetComp();
}
const FC_ProjectilePenetrationConfig& GetProjectilePenetrationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectilePenetrationConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectilePenetrationConfig GetProjectilePenetrationConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ProjectilePenetrationConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_ProjectilePenetrationConfig::GetProjectilePenetrationConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ProjectilePenetrationConfig GetDefaultedProjectilePenetrationConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectilePenetrationConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectilePenetrationConfig);
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
FC_ProjectilePenetrationConfig GetDefaultedProjectilePenetrationConfig_BP(const FECSEntity &inout Entity)
{
    FC_ProjectilePenetrationConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveProjectilePenetrationConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectilePenetrationConfig);
}
}
FECSMonitorRuntimeView __GetMonitorProjectilePenetrationConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectilePenetrationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectilePenetrationConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectilePenetrationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectilePenetrationConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectilePenetrationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectilePenetrationConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectilePenetrationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectilePenetrationConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectilePenetrationConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectilePenetrationConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectilePenetrationConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectilePenetrationConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectilePenetrationConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectilePenetrationConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectilePenetrationConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileHealthConfig
{
UFUNCTION()
bool HasProjectileHealthConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHealthConfig);
}
FC_ProjectileHealthConfig& AssignProjectileHealthConfig(const FECSEntity &inout Entity, const FC_ProjectileHealthConfig &inout DefaultValue = FC_ProjectileHealthConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHealthConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileHealthConfig_BP(const FECSEntity &inout Entity, const FC_ProjectileHealthConfig &inout DefaultValue = FC_ProjectileHealthConfig())
{
    ECSFunc_FC_ProjectileHealthConfig::AssignProjectileHealthConfig(Entity, DefaultValue);
    return;
}
FC_ProjectileHealthConfig& ModifyProjectileHealthConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHealthConfig));
    return local_12.GetComp();
}
FC_ProjectileHealthConfig& ModifyOrAddProjectileHealthConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHealthConfig));
    return local_12.GetComp();
}
const FC_ProjectileHealthConfig& GetProjectileHealthConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHealthConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileHealthConfig GetProjectileHealthConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileHealthConfig& local_4 = ECSFunc_FC_ProjectileHealthConfig::GetProjectileHealthConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileHealthConfig();
}
const FC_ProjectileHealthConfig GetDefaultedProjectileHealthConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileHealthConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHealthConfig);
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
FC_ProjectileHealthConfig GetDefaultedProjectileHealthConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileHealthConfig::GetDefaultedProjectileHealthConfig(Entity);
}
UFUNCTION()
bool RemoveProjectileHealthConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHealthConfig);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileHealthConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileHealthConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHealthConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileHealthConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHealthConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileHealthConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHealthConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileHealthConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHealthConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileHealthConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileHealthConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileHealthConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileHealthConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileHealthConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileHealthConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileHealthConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileHealth
{
UFUNCTION()
bool HasProjectileHealth(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHealth);
}
FC_ProjectileHealth& AssignProjectileHealth(const FECSEntity &inout Entity, const FC_ProjectileHealth &inout DefaultValue = FC_ProjectileHealth())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHealth, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileHealth_BP(const FECSEntity &inout Entity, const FC_ProjectileHealth &inout DefaultValue = FC_ProjectileHealth())
{
    ECSFunc_FC_ProjectileHealth::AssignProjectileHealth(Entity, DefaultValue);
    return;
}
FC_ProjectileHealth& ModifyProjectileHealth(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHealth));
    return local_12.GetComp();
}
FC_ProjectileHealth& ModifyOrAddProjectileHealth(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHealth));
    return local_12.GetComp();
}
const FC_ProjectileHealth& GetProjectileHealth(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHealth));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileHealth GetProjectileHealth_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileHealth& local_4 = ECSFunc_FC_ProjectileHealth::GetProjectileHealth(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileHealth();
}
const FC_ProjectileHealth GetDefaultedProjectileHealth(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileHealth __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHealth);
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
FC_ProjectileHealth GetDefaultedProjectileHealth_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileHealth::GetDefaultedProjectileHealth(Entity);
}
UFUNCTION()
bool RemoveProjectileHealth(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHealth);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileHealthOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileHealth, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHealthOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileHealth, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHealthOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileHealth, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHealthOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileHealth, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHealthOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileHealth, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileHealthLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileHealth, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileHealthActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileHealth, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileHealthModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileHealth, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileHitStickAttach
{
UFUNCTION()
bool HasProjectileHitStickAttach(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitStickAttach);
}
FC_ProjectileHitStickAttach& AssignProjectileHitStickAttach(const FECSEntity &inout Entity, const FC_ProjectileHitStickAttach &inout DefaultValue = FC_ProjectileHitStickAttach())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitStickAttach, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileHitStickAttach_BP(const FECSEntity &inout Entity, const FC_ProjectileHitStickAttach &inout DefaultValue = FC_ProjectileHitStickAttach())
{
    ECSFunc_FC_ProjectileHitStickAttach::AssignProjectileHitStickAttach(Entity, DefaultValue);
    return;
}
FC_ProjectileHitStickAttach& ModifyProjectileHitStickAttach(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitStickAttach));
    return local_12.GetComp();
}
FC_ProjectileHitStickAttach& ModifyOrAddProjectileHitStickAttach(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitStickAttach));
    return local_12.GetComp();
}
const FC_ProjectileHitStickAttach& GetProjectileHitStickAttach(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitStickAttach));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileHitStickAttach GetProjectileHitStickAttach_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileHitStickAttach& local_4 = ECSFunc_FC_ProjectileHitStickAttach::GetProjectileHitStickAttach(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileHitStickAttach();
}
const FC_ProjectileHitStickAttach GetDefaultedProjectileHitStickAttach(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileHitStickAttach __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitStickAttach);
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
FC_ProjectileHitStickAttach GetDefaultedProjectileHitStickAttach_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileHitStickAttach::GetDefaultedProjectileHitStickAttach(Entity);
}
UFUNCTION()
bool RemoveProjectileHitStickAttach(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileHitStickAttach);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileHitStickAttachOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileHitStickAttach, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitStickAttachOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileHitStickAttach, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitStickAttachOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileHitStickAttach, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitStickAttachOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileHitStickAttach, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileHitStickAttachOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileHitStickAttach, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileHitStickAttachLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileHitStickAttach, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileHitStickAttachActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileHitStickAttach, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileHitStickAttachModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileHitStickAttach, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileVisualOffsetCacheData
{
UFUNCTION()
bool HasProjectileVisualOffsetCacheData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileVisualOffsetCacheData);
}
FC_ProjectileVisualOffsetCacheData& AssignProjectileVisualOffsetCacheData(const FECSEntity &inout Entity, const FC_ProjectileVisualOffsetCacheData &inout DefaultValue = FC_ProjectileVisualOffsetCacheData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileVisualOffsetCacheData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileVisualOffsetCacheData_BP(const FECSEntity &inout Entity, const FC_ProjectileVisualOffsetCacheData &inout DefaultValue = FC_ProjectileVisualOffsetCacheData())
{
    ECSFunc_FC_ProjectileVisualOffsetCacheData::AssignProjectileVisualOffsetCacheData(Entity, DefaultValue);
    return;
}
FC_ProjectileVisualOffsetCacheData& ModifyProjectileVisualOffsetCacheData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileVisualOffsetCacheData));
    return local_12.GetComp();
}
FC_ProjectileVisualOffsetCacheData& ModifyOrAddProjectileVisualOffsetCacheData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileVisualOffsetCacheData));
    return local_12.GetComp();
}
const FC_ProjectileVisualOffsetCacheData& GetProjectileVisualOffsetCacheData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileVisualOffsetCacheData));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileVisualOffsetCacheData GetProjectileVisualOffsetCacheData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ProjectileVisualOffsetCacheData __r;
    bValid = false;
    bValid = ECSFunc_FC_ProjectileVisualOffsetCacheData::GetProjectileVisualOffsetCacheData(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ProjectileVisualOffsetCacheData GetDefaultedProjectileVisualOffsetCacheData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileVisualOffsetCacheData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileVisualOffsetCacheData);
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
FC_ProjectileVisualOffsetCacheData GetDefaultedProjectileVisualOffsetCacheData_BP(const FECSEntity &inout Entity)
{
    FC_ProjectileVisualOffsetCacheData __r;
    return __r;
}
UFUNCTION()
bool RemoveProjectileVisualOffsetCacheData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileVisualOffsetCacheData);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileVisualOffsetCacheDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileVisualOffsetCacheData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileVisualOffsetCacheDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileVisualOffsetCacheData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileVisualOffsetCacheDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileVisualOffsetCacheData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileVisualOffsetCacheDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileVisualOffsetCacheData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileVisualOffsetCacheDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileVisualOffsetCacheData, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileVisualOffsetCacheDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileVisualOffsetCacheData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileVisualOffsetCacheDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileVisualOffsetCacheData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileVisualOffsetCacheDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileVisualOffsetCacheData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SurroundingMaterialCheckConfig
{
UFUNCTION()
bool HasSurroundingMaterialCheckConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SurroundingMaterialCheckConfig);
}
FC_SurroundingMaterialCheckConfig& AssignSurroundingMaterialCheckConfig(const FECSEntity &inout Entity, const FC_SurroundingMaterialCheckConfig &inout DefaultValue = FC_SurroundingMaterialCheckConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SurroundingMaterialCheckConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSurroundingMaterialCheckConfig_BP(const FECSEntity &inout Entity, const FC_SurroundingMaterialCheckConfig &inout DefaultValue = FC_SurroundingMaterialCheckConfig())
{
    ECSFunc_FC_SurroundingMaterialCheckConfig::AssignSurroundingMaterialCheckConfig(Entity, DefaultValue);
    return;
}
FC_SurroundingMaterialCheckConfig& ModifySurroundingMaterialCheckConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SurroundingMaterialCheckConfig));
    return local_12.GetComp();
}
FC_SurroundingMaterialCheckConfig& ModifyOrAddSurroundingMaterialCheckConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SurroundingMaterialCheckConfig));
    return local_12.GetComp();
}
const FC_SurroundingMaterialCheckConfig& GetSurroundingMaterialCheckConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SurroundingMaterialCheckConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_SurroundingMaterialCheckConfig GetSurroundingMaterialCheckConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SurroundingMaterialCheckConfig& local_4 = ECSFunc_FC_SurroundingMaterialCheckConfig::GetSurroundingMaterialCheckConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SurroundingMaterialCheckConfig();
}
const FC_SurroundingMaterialCheckConfig GetDefaultedSurroundingMaterialCheckConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SurroundingMaterialCheckConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SurroundingMaterialCheckConfig);
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
FC_SurroundingMaterialCheckConfig GetDefaultedSurroundingMaterialCheckConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SurroundingMaterialCheckConfig::GetDefaultedSurroundingMaterialCheckConfig(Entity);
}
UFUNCTION()
bool RemoveSurroundingMaterialCheckConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SurroundingMaterialCheckConfig);
}
}
FECSMonitorRuntimeView __GetMonitorSurroundingMaterialCheckConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SurroundingMaterialCheckConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSurroundingMaterialCheckConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SurroundingMaterialCheckConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSurroundingMaterialCheckConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SurroundingMaterialCheckConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSurroundingMaterialCheckConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SurroundingMaterialCheckConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSurroundingMaterialCheckConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SurroundingMaterialCheckConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorSurroundingMaterialCheckConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SurroundingMaterialCheckConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSurroundingMaterialCheckConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SurroundingMaterialCheckConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSurroundingMaterialCheckConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SurroundingMaterialCheckConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SurroundingMaterialCheckRuntime
{
UFUNCTION()
bool HasSurroundingMaterialCheckRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SurroundingMaterialCheckRuntime);
}
FC_SurroundingMaterialCheckRuntime& AssignSurroundingMaterialCheckRuntime(const FECSEntity &inout Entity, const FC_SurroundingMaterialCheckRuntime &inout DefaultValue = FC_SurroundingMaterialCheckRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SurroundingMaterialCheckRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSurroundingMaterialCheckRuntime_BP(const FECSEntity &inout Entity, const FC_SurroundingMaterialCheckRuntime &inout DefaultValue = FC_SurroundingMaterialCheckRuntime())
{
    ECSFunc_FC_SurroundingMaterialCheckRuntime::AssignSurroundingMaterialCheckRuntime(Entity, DefaultValue);
    return;
}
FC_SurroundingMaterialCheckRuntime& ModifySurroundingMaterialCheckRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SurroundingMaterialCheckRuntime));
    return local_12.GetComp();
}
FC_SurroundingMaterialCheckRuntime& ModifyOrAddSurroundingMaterialCheckRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SurroundingMaterialCheckRuntime));
    return local_12.GetComp();
}
const FC_SurroundingMaterialCheckRuntime& GetSurroundingMaterialCheckRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SurroundingMaterialCheckRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_SurroundingMaterialCheckRuntime GetSurroundingMaterialCheckRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SurroundingMaterialCheckRuntime& local_4 = ECSFunc_FC_SurroundingMaterialCheckRuntime::GetSurroundingMaterialCheckRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SurroundingMaterialCheckRuntime();
}
const FC_SurroundingMaterialCheckRuntime GetDefaultedSurroundingMaterialCheckRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SurroundingMaterialCheckRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SurroundingMaterialCheckRuntime);
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
FC_SurroundingMaterialCheckRuntime GetDefaultedSurroundingMaterialCheckRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SurroundingMaterialCheckRuntime::GetDefaultedSurroundingMaterialCheckRuntime(Entity);
}
UFUNCTION()
bool RemoveSurroundingMaterialCheckRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SurroundingMaterialCheckRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorSurroundingMaterialCheckRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SurroundingMaterialCheckRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSurroundingMaterialCheckRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SurroundingMaterialCheckRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSurroundingMaterialCheckRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SurroundingMaterialCheckRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSurroundingMaterialCheckRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SurroundingMaterialCheckRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSurroundingMaterialCheckRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SurroundingMaterialCheckRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorSurroundingMaterialCheckRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SurroundingMaterialCheckRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSurroundingMaterialCheckRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SurroundingMaterialCheckRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSurroundingMaterialCheckRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SurroundingMaterialCheckRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileVisualOffsetDisableTag
{
UFUNCTION()
bool HasProjectileVisualOffsetDisableTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileVisualOffsetDisableTag);
}
FC_ProjectileVisualOffsetDisableTag& AssignProjectileVisualOffsetDisableTag(const FECSEntity &inout Entity, const FC_ProjectileVisualOffsetDisableTag &inout DefaultValue = FC_ProjectileVisualOffsetDisableTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileVisualOffsetDisableTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileVisualOffsetDisableTag_BP(const FECSEntity &inout Entity, const FC_ProjectileVisualOffsetDisableTag &inout DefaultValue = FC_ProjectileVisualOffsetDisableTag())
{
    ECSFunc_FC_ProjectileVisualOffsetDisableTag::AssignProjectileVisualOffsetDisableTag(Entity, DefaultValue);
    return;
}
FC_ProjectileVisualOffsetDisableTag& ModifyProjectileVisualOffsetDisableTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileVisualOffsetDisableTag));
    return local_12.GetComp();
}
FC_ProjectileVisualOffsetDisableTag& ModifyOrAddProjectileVisualOffsetDisableTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileVisualOffsetDisableTag));
    return local_12.GetComp();
}
const FC_ProjectileVisualOffsetDisableTag& GetProjectileVisualOffsetDisableTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileVisualOffsetDisableTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileVisualOffsetDisableTag GetProjectileVisualOffsetDisableTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileVisualOffsetDisableTag& local_4 = ECSFunc_FC_ProjectileVisualOffsetDisableTag::GetProjectileVisualOffsetDisableTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileVisualOffsetDisableTag();
}
const FC_ProjectileVisualOffsetDisableTag GetDefaultedProjectileVisualOffsetDisableTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileVisualOffsetDisableTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileVisualOffsetDisableTag);
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
FC_ProjectileVisualOffsetDisableTag GetDefaultedProjectileVisualOffsetDisableTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileVisualOffsetDisableTag::GetDefaultedProjectileVisualOffsetDisableTag(Entity);
}
UFUNCTION()
bool RemoveProjectileVisualOffsetDisableTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileVisualOffsetDisableTag);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileVisualOffsetDisableTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileVisualOffsetDisableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileVisualOffsetDisableTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileVisualOffsetDisableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileVisualOffsetDisableTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileVisualOffsetDisableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileVisualOffsetDisableTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileVisualOffsetDisableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileVisualOffsetDisableTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileVisualOffsetDisableTag, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileVisualOffsetDisableTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileVisualOffsetDisableTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileVisualOffsetDisableTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileVisualOffsetDisableTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileVisualOffsetDisableTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileVisualOffsetDisableTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileInTimeTweakTag
{
UFUNCTION()
bool HasProjectileInTimeTweakTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileInTimeTweakTag);
}
FC_ProjectileInTimeTweakTag& AssignProjectileInTimeTweakTag(const FECSEntity &inout Entity, const FC_ProjectileInTimeTweakTag &inout DefaultValue = FC_ProjectileInTimeTweakTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileInTimeTweakTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileInTimeTweakTag_BP(const FECSEntity &inout Entity, const FC_ProjectileInTimeTweakTag &inout DefaultValue = FC_ProjectileInTimeTweakTag())
{
    ECSFunc_FC_ProjectileInTimeTweakTag::AssignProjectileInTimeTweakTag(Entity, DefaultValue);
    return;
}
FC_ProjectileInTimeTweakTag& ModifyProjectileInTimeTweakTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileInTimeTweakTag));
    return local_12.GetComp();
}
FC_ProjectileInTimeTweakTag& ModifyOrAddProjectileInTimeTweakTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileInTimeTweakTag));
    return local_12.GetComp();
}
const FC_ProjectileInTimeTweakTag& GetProjectileInTimeTweakTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileInTimeTweakTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileInTimeTweakTag GetProjectileInTimeTweakTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileInTimeTweakTag& local_4 = ECSFunc_FC_ProjectileInTimeTweakTag::GetProjectileInTimeTweakTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileInTimeTweakTag();
}
const FC_ProjectileInTimeTweakTag GetDefaultedProjectileInTimeTweakTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileInTimeTweakTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileInTimeTweakTag);
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
FC_ProjectileInTimeTweakTag GetDefaultedProjectileInTimeTweakTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileInTimeTweakTag::GetDefaultedProjectileInTimeTweakTag(Entity);
}
UFUNCTION()
bool RemoveProjectileInTimeTweakTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileInTimeTweakTag);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileInTimeTweakTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileInTimeTweakTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileInTimeTweakTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileInTimeTweakTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileInTimeTweakTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileInTimeTweakTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileInTimeTweakTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileInTimeTweakTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileInTimeTweakTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileInTimeTweakTag, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileInTimeTweakTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileInTimeTweakTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileInTimeTweakTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileInTimeTweakTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileInTimeTweakTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileInTimeTweakTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileStickDestroyWithSimpleDestructible
{
UFUNCTION()
bool HasProjectileStickDestroyWithSimpleDestructible(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileStickDestroyWithSimpleDestructible);
}
FC_ProjectileStickDestroyWithSimpleDestructible& AssignProjectileStickDestroyWithSimpleDestructible(const FECSEntity &inout Entity, const FC_ProjectileStickDestroyWithSimpleDestructible &inout DefaultValue = FC_ProjectileStickDestroyWithSimpleDestructible())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileStickDestroyWithSimpleDestructible, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileStickDestroyWithSimpleDestructible_BP(const FECSEntity &inout Entity, const FC_ProjectileStickDestroyWithSimpleDestructible &inout DefaultValue = FC_ProjectileStickDestroyWithSimpleDestructible())
{
    ECSFunc_FC_ProjectileStickDestroyWithSimpleDestructible::AssignProjectileStickDestroyWithSimpleDestructible(Entity, DefaultValue);
    return;
}
FC_ProjectileStickDestroyWithSimpleDestructible& ModifyProjectileStickDestroyWithSimpleDestructible(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileStickDestroyWithSimpleDestructible));
    return local_12.GetComp();
}
FC_ProjectileStickDestroyWithSimpleDestructible& ModifyOrAddProjectileStickDestroyWithSimpleDestructible(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileStickDestroyWithSimpleDestructible));
    return local_12.GetComp();
}
const FC_ProjectileStickDestroyWithSimpleDestructible& GetProjectileStickDestroyWithSimpleDestructible(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileStickDestroyWithSimpleDestructible));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileStickDestroyWithSimpleDestructible GetProjectileStickDestroyWithSimpleDestructible_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileStickDestroyWithSimpleDestructible& local_4 = ECSFunc_FC_ProjectileStickDestroyWithSimpleDestructible::GetProjectileStickDestroyWithSimpleDestructible(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileStickDestroyWithSimpleDestructible();
}
const FC_ProjectileStickDestroyWithSimpleDestructible GetDefaultedProjectileStickDestroyWithSimpleDestructible(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileStickDestroyWithSimpleDestructible __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileStickDestroyWithSimpleDestructible);
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
FC_ProjectileStickDestroyWithSimpleDestructible GetDefaultedProjectileStickDestroyWithSimpleDestructible_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileStickDestroyWithSimpleDestructible::GetDefaultedProjectileStickDestroyWithSimpleDestructible(Entity);
}
UFUNCTION()
bool RemoveProjectileStickDestroyWithSimpleDestructible(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileStickDestroyWithSimpleDestructible);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileStickDestroyWithSimpleDestructibleOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileStickDestroyWithSimpleDestructible, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileStickDestroyWithSimpleDestructibleOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileStickDestroyWithSimpleDestructible, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileStickDestroyWithSimpleDestructibleOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileStickDestroyWithSimpleDestructible, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileStickDestroyWithSimpleDestructibleOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileStickDestroyWithSimpleDestructible, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileStickDestroyWithSimpleDestructibleOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileStickDestroyWithSimpleDestructible, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileStickDestroyWithSimpleDestructibleLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileStickDestroyWithSimpleDestructible, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileStickDestroyWithSimpleDestructibleActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileStickDestroyWithSimpleDestructible, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileStickDestroyWithSimpleDestructibleModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileStickDestroyWithSimpleDestructible, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags64 GetDirtyFlags(FC_ProjectileInfo &inout Data)
{
    FRootDirtyFlags64 __r;
    return __r;
}
void InitDirtyFlags(FC_ProjectileInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProjectileInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProjectileInfo
{
int __IndexOf_bPredictable()
{
    return 0;
}
int __IndexOf_SpawnPosition()
{
    return 1;
}
int __IndexOf_SpawnRotation()
{
    return 2;
}
int __IndexOf_DestroyPosition()
{
    return 3;
}
int __IndexOf_bAttackDataOverride()
{
    return 4;
}
int __IndexOf_AttackInfo()
{
    return 5;
}
int __IndexOf_Damage()
{
    return 6;
}
int __IndexOf_DamageToAvatar()
{
    return 12;
}
int __IndexOf_AttackRecoverEnergyData()
{
    return 18;
}
int __IndexOf_AttackInfoAfterPenetration()
{
    return 24;
}
int __IndexOf_DamageAfterPenetration()
{
    return 25;
}
int __IndexOf_DamageToAvatarAfterPenetration()
{
    return 31;
}
int __IndexOf_AttackRecoverEnergyDataAfterPenetration()
{
    return 37;
}
int __IndexOf_DelayDestroyTime()
{
    return 43;
}
int __IndexOf_HitTestProtectData()
{
    return 44;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProjectileDelayDestroy &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProjectileDelayDestroy &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProjectileDelayDestroy &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProjectileDelayDestroy
{
int __IndexOf_DestroyTime()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProjectileHitInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProjectileHitInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProjectileHitInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProjectileHitInfo
{
int __IndexOf_HitCount()
{
    return 0;
}
int __IndexOf_PenetratedAttenuationRatio()
{
    return 1;
}
int __IndexOf_HitCountByEntity()
{
    return 2;
}
int __IndexOf_NextPenetrationTimeByEntity()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProjectileHealth &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProjectileHealth &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProjectileHealth &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProjectileHealth
{
int __IndexOf_bCanDestroyByHit()
{
    return 0;
}
int __IndexOf_RemainCanBeHitCount()
{
    return 1;
}
int __IndexOf_DamageTaken()
{
    return 2;
}
int __IndexOf_RemainDamageCanTake()
{
    return 3;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FProjectileStickAttachmentInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FProjectileStickAttachmentInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FProjectileStickAttachmentInfo
{
int __IndexOf_TargetEntity()
{
    return 0;
}
int __IndexOf_HitTestFromPos()
{
    return 1;
}
int __IndexOf_HitTestToPos()
{
    return 2;
}
int __IndexOf_SocketName()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProjectileHitStickAttach &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProjectileHitStickAttach &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProjectileHitStickAttach &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProjectileHitStickAttach
{
int __IndexOf_Info()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProjectileStickDestroyWithSimpleDestructible &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProjectileStickDestroyWithSimpleDestructible &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProjectileStickDestroyWithSimpleDestructible &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProjectileStickDestroyWithSimpleDestructible
{
int __IndexOf_FoliageISM()
{
    return 0;
}
int __IndexOf_FoliageISkM()
{
    return 1;
}
int __IndexOf_StaticMesh()
{
    return 2;
}
}
