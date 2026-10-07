
enum EProjectileTimelineEntityType
{
    None,
    Projectile,
    ProjectileOwner,
    EventTarget,
}

enum EProjectileTimelineRotationBaseType
{
    ZeroRotation,
    EntityRotation,
    MoveDirection,
    MoveDirection2D,
    ContextRotation,
}

enum EProjectileTimelinePositionBaseType
{
    ZeroPosition,
    EntityPosition,
    ContextPosition,
    SpawnOnGround,
}

enum EProjectileTimelineTransformOffsetType
{
    LocalSpace,
    WorldSpace,
}


struct FProjectileTimelineActionIdentity
{
    UPROPERTY()
    uint16 m_TimelineIndex;
    UPROPERTY()
    uint16 m_ActionIndex;

    FProjectileTimelineActionIdentity(const int InTimelineIndex = 0, const int InActionIndex = 0)
    {
        this.SetTimelineIndex(uint16(InTimelineIndex));
        this.SetActionIndex(uint16(InActionIndex));
        return;
    }
    uint Hash() const
    {
        int local_3 = (this.GetTimelineIndex() << 16) ^ this.GetActionIndex();
        return local_3;
    }
    bool opEquals(const FProjectileTimelineActionIdentity &inout Other) const
    {
        return this.GetTimelineIndex() == Other.GetTimelineIndex() && (this.GetActionIndex() == Other.GetActionIndex());
    }
    uint16 GetTimelineIndex() const property
    {
        return this.m_TimelineIndex;
    }
    void SetTimelineIndex(const uint16 __Value) property
    {
        this.m_TimelineIndex = __Value;
        return;
    }
    uint16 GetActionIndex() const property
    {
        return this.m_ActionIndex;
    }
    void SetActionIndex(const uint16 __Value) property
    {
        this.m_ActionIndex = __Value;
        return;
    }
}

struct FProjectileTimelineActionData_TrunToState : FProjectileTimelineActionDataBase
{
    UPROPERTY()
    FProjectileTimelineStateNameRef StateName;

    FProjectileTimelineActionData_TrunToState()
    {
        return;
    }
}

struct FProjectileTimelineActionData_PlayFX : FProjectileTimelineActionDataRepeatable
{
    FProjectileTimelineActionDataRepeatable _base_FProjectileTimelineActionDataRepeatable;
    UPROPERTY()
    EFXStopMethod StopMethodOnActionEnd = EFXStopMethod(0);
    UPROPERTY()
    FProjectileFXConfig FXConfig;
    UPROPERTY()
    TArray<FFXParamChangePoint> ParamChangePoints;
    UPROPERTY()
    EProjectileTimelineEntityType TransformRefEntity = EProjectileTimelineEntityType(1);
    UPROPERTY()
    EProjectileTimelineRotationBaseType RotationBaseType = EProjectileTimelineRotationBaseType(1);
    UPROPERTY()
    EProjectileTimelineTransformOffsetType RotationOffsetType = EProjectileTimelineTransformOffsetType(0);
    UPROPERTY()
    EProjectileTimelinePositionBaseType PositionBaseType = EProjectileTimelinePositionBaseType(1);
    UPROPERTY()
    EProjectileTimelineTransformOffsetType PositionOffsetType = EProjectileTimelineTransformOffsetType(0);
    UPROPERTY()
    float32 GroundHeightCheck = 1000.0f;


}

struct FProjectileTimelineActionData_HitTest : FProjectileTimelineActionDataRepeatable
{
    FProjectileTimelineActionDataRepeatable _base_FProjectileTimelineActionDataRepeatable;
    UPROPERTY()
    EProjectileTimelineRotationBaseType RotationBaseType = EProjectileTimelineRotationBaseType(1);
    UPROPERTY()
    EProjectileTimelineTransformOffsetType RotationOffsetType = EProjectileTimelineTransformOffsetType(0);
    UPROPERTY()
    FQuat4f RotationOffset = FQuat4f::Identity;
    UPROPERTY()
    EProjectileTimelinePositionBaseType PositionBaseType = EProjectileTimelinePositionBaseType(1);
    UPROPERTY()
    EProjectileTimelineTransformOffsetType PositionOffsetType = EProjectileTimelineTransformOffsetType(0);
    UPROPERTY()
    FVector PositionOffset;
    UPROPERTY()
    float32 GroundHeightCheck = 1000.0f;
    UPROPERTY()
    FHitTestShape HitTestShape;
    UPROPERTY()
    FDataObjectPtr AttackData;
    UPROPERTY()
    FAreaStrikeShape StrikeShape;


}

struct FProjectileTimelineActionData_CreateArealEffectEntity : FProjectileTimelineActionDataBase
{
    UPROPERTY()
    TSubclassOf<ACombatArealEffectPrefab> ArealEffectPrefabClass;
    UPROPERTY()
    bool bLifeTimeWithAction = true;
    UPROPERTY()
    FFPTime Duration = 0;
    UPROPERTY()
    EProjectileTimelineRotationBaseType RotationBaseType = EProjectileTimelineRotationBaseType(1);
    UPROPERTY()
    EProjectileTimelineTransformOffsetType RotationOffsetType = EProjectileTimelineTransformOffsetType(0);
    UPROPERTY()
    FQuat4f RotationOffset = FQuat4f::Identity;
    UPROPERTY()
    EProjectileTimelinePositionBaseType PositionBaseType = EProjectileTimelinePositionBaseType(1);
    UPROPERTY()
    EProjectileTimelineTransformOffsetType PositionOffsetType = EProjectileTimelineTransformOffsetType(0);
    UPROPERTY()
    FVector PositionOffset;
    UPROPERTY()
    float32 GroundHeightCheck = 1000.0f;


}

struct FProjectileTimelineActionData_AbilitySignal : FProjectileTimelineActionDataBase
{
    UPROPERTY()
    TSubclassOf<UEASAbility> AbilityClass;
    UPROPERTY()
    FName SignalName;

    FProjectileTimelineActionData_AbilitySignal()
    {
        return;
    }
}

struct FProjectileTimelineActionData_AbilityEffectEvent : FProjectileTimelineActionDataBase
{
    UPROPERTY()
    TArray<FAbilityEffectEventDataPair> ProjectileSpawn;
    UPROPERTY()
    TArray<FAbilityEffectEventDataPair> ProjectileHit;
    UPROPERTY()
    TArray<FAbilityEffectEventDataPair> ProjectileHitScene;
    UPROPERTY()
    TArray<FAbilityEffectEventDataPair> ProjectileDestroy;

    FProjectileTimelineActionData_AbilityEffectEvent()
    {
        return;
    }
}

struct FProjectileTimelineActionData_ChangeMaterialParam : FProjectileTimelineActionDataBase
{
    UPROPERTY()
    FName RequestName;
    UPROPERTY()
    TArray<FSingleMaterialParamRequestData> MaterialParams;

    FProjectileTimelineActionData_ChangeMaterialParam()
    {
        return;
    }
}

struct FProjectileTimelineActionData_ChangeMaterialParamSpan : FProjectileTimelineActionData_ChangeMaterialParam
{
    FProjectileTimelineActionData_ChangeMaterialParam _base_FProjectileTimelineActionData_ChangeMaterialParam;

    FProjectileTimelineActionData_ChangeMaterialParamSpan()
    {
        super();
        return;
    }
}

struct FProjectileTimelineActionData_InstantSFX : FProjectileTimelineActionDataBase
{
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> Event;
    UPROPERTY()
    bool bFollow;
    UPROPERTY()
    bool bSelfOnly;

    FProjectileTimelineActionData_InstantSFX()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FProjectileTimelineActionData_DurationalSFX : FProjectileTimelineActionDataBase
{
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> EnterEvent;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> ExitEvent = nullptr;
    UPROPERTY()
    bool bFollow = true;
    UPROPERTY()
    bool bSelfOnly = false;


}

struct FProjectileTimelineActionData_KeepSwitchValue : FProjectileTimelineActionDataBase
{
    UPROPERTY()
    TSoftObjectPtr<UAkSwitchValue> KeepSwitchValue;
    UPROPERTY()
    TSoftObjectPtr<UAkSwitchValue> ResetSwitchValue = nullptr;

    FProjectileTimelineActionData_KeepSwitchValue()
    {
        return;
    }
}

struct FProjectileTimelineActionData_KeepRtpcValue : FProjectileTimelineActionDataBase
{
    UPROPERTY()
    TSoftObjectPtr<UAkRtpc> Rtpc;
    UPROPERTY()
    float32 Value;
    UPROPERTY()
    float32 ResetValue;
    UPROPERTY()
    float32 InterpolateTime;

    FProjectileTimelineActionData_KeepRtpcValue()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

