

struct FT_Projectile : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LifeTime_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LifeTime, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ProjectileInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ProjectileInfo, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MovementInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MovementInfo, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ProjectileTimelineConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ProjectileTimelineConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_ProjectileTimelineConfig = false;
    UPROPERTY()
    FC_ProjectileTimelineConfig Config_FC_ProjectileTimelineConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_NumLimited_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_NumLimited, NAME_None);
    UPROPERTY()
    bool bHas_FC_NumLimited = false;
    UPROPERTY()
    FC_NumLimited Config_FC_NumLimited;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LifeTimeInitConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LifeTimeInitConfig, NAME_None);
    UPROPERTY()
    FC_LifeTimeInitConfig Config_FC_LifeTimeInitConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ProjectileBasicConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ProjectileBasicConfig, NAME_None);
    UPROPERTY()
    FC_ProjectileBasicConfig Config_FC_ProjectileBasicConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ProjectileHealthConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ProjectileHealthConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_ProjectileHealthConfig = false;
    UPROPERTY()
    FC_ProjectileHealthConfig Config_FC_ProjectileHealthConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ProjectileFXConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ProjectileFXConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_ProjectileFXConfig = false;
    UPROPERTY()
    FC_ProjectileFXConfig Config_FC_ProjectileFXConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ProjectileActorVisualConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ProjectileActorVisualConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_ProjectileActorVisualConfig = false;
    UPROPERTY()
    FC_ProjectileActorVisualConfig Config_FC_ProjectileActorVisualConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SurroundingMaterialCheckConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SurroundingMaterialCheckConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_SurroundingMaterialCheckConfig = false;
    UPROPERTY()
    FC_SurroundingMaterialCheckConfig Config_FC_SurroundingMaterialCheckConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_Collision_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_Collision, NAME_None);
    UPROPERTY()
    bool bHas_FC_Collision = true;
    UPROPERTY()
    FC_Collision Config_FC_Collision;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_HitTestShape_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_HitTestShape, NAME_None);
    UPROPERTY()
    bool bHas_FC_HitTestShape = true;
    UPROPERTY()
    FC_HitTestShape Config_FC_HitTestShape;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ProjectileHitConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ProjectileHitConfig, NAME_None);
    UPROPERTY()
    FC_ProjectileHitConfig Config_FC_ProjectileHitConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ProjectilePenetrationConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ProjectilePenetrationConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_ProjectilePenetrationConfig = false;
    UPROPERTY()
    FC_ProjectilePenetrationConfig Config_FC_ProjectilePenetrationConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ProjectileDistanceAttenuationConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ProjectileDistanceAttenuationConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_ProjectileDistanceAttenuationConfig = false;
    UPROPERTY()
    FC_ProjectileDistanceAttenuationConfig Config_FC_ProjectileDistanceAttenuationConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ProjectileHitExplosionConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ProjectileHitExplosionConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_ProjectileHitExplosionConfig = false;
    UPROPERTY()
    FC_ProjectileHitExplosionConfig Config_FC_ProjectileHitExplosionConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SimpleProjectileMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SimpleProjectileMovementConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_SimpleProjectileMovementConfig = false;
    UPROPERTY()
    FC_SimpleProjectileMovementConfig Config_FC_SimpleProjectileMovementConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ThrowMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ThrowMovementConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_ThrowMovementConfig = false;
    UPROPERTY()
    FC_ThrowMovementConfig Config_FC_ThrowMovementConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_GroundMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_GroundMovementConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_GroundMovementConfig = false;
    UPROPERTY()
    FC_GroundMovementConfig Config_FC_GroundMovementConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_TrackMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_TrackMovementConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_TrackMovementConfig = false;
    UPROPERTY()
    FC_TrackMovementConfig Config_FC_TrackMovementConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CurveMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CurveMovementConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_CurveMovementConfig = false;
    UPROPERTY()
    FC_CurveMovementConfig Config_FC_CurveMovementConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CurveRotationConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CurveRotationConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_CurveRotationConfig = false;
    UPROPERTY()
    FC_CurveRotationConfig Config_FC_CurveRotationConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SpawnInstantFXPeriod_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SpawnInstantFXPeriod, NAME_None);
    UPROPERTY()
    bool bHas_FC_SpawnInstantFXPeriod = false;
    UPROPERTY()
    FC_SpawnInstantFXPeriod Config_FC_SpawnInstantFXPeriod;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ScaleByTimeConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ScaleByTimeConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_ScaleByTimeConfig = false;
    UPROPERTY()
    FC_ScaleByTimeConfig Config_FC_ScaleByTimeConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_DelayArealStrike_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_DelayArealStrike, NAME_None);
    UPROPERTY()
    bool bHas_FC_DelayArealStrike = false;
    UPROPERTY()
    FC_DelayArealStrike Config_FC_DelayArealStrike;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_HitTestByMoveTrail_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_HitTestByMoveTrail, NAME_None);
    UPROPERTY()
    bool bHas_FC_HitTestByMoveTrail = false;
    UPROPERTY()
    FC_HitTestByMoveTrail Config_FC_HitTestByMoveTrail;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_FXByMoveTrail_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_FXByMoveTrail, NAME_None);
    UPROPERTY()
    bool bHas_FC_FXByMoveTrail = false;
    UPROPERTY()
    FC_FXByMoveTrail Config_FC_FXByMoveTrail;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CombatActionTimelineConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CombatActionTimelineConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_CombatActionTimelineConfig = false;
    UPROPERTY()
    FC_CombatActionTimelineConfig Config_FC_CombatActionTimelineConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AbilityEffectEventTriggerConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AbilityEffectEventTriggerConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_AbilityEffectEventTriggerConfig = false;
    UPROPERTY()
    FC_AbilityEffectEventTriggerConfig Config_FC_AbilityEffectEventTriggerConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CombatArealEffectBuffConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CombatArealEffectBuffConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_CombatArealEffectBuffConfig = false;
    UPROPERTY()
    FC_CombatArealEffectBuffConfig Config_FC_CombatArealEffectBuffConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CombatArealEffectAbilityEffectTriggerConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CombatArealEffectAbilityEffectTriggerConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_CombatArealEffectAbilityEffectTriggerConfig = false;
    UPROPERTY()
    FC_CombatArealEffectAbilityEffectTriggerConfig Config_FC_CombatArealEffectAbilityEffectTriggerConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MovementRadialForce_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MovementRadialForce, NAME_None);
    UPROPERTY()
    bool bHas_FC_MovementRadialForce = false;
    UPROPERTY()
    FC_MovementRadialForce Config_FC_MovementRadialForce;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MovementBoxForce_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MovementBoxForce, NAME_None);
    UPROPERTY()
    bool bHas_FC_MovementBoxForce = false;
    UPROPERTY()
    FC_MovementBoxForce Config_FC_MovementBoxForce;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ProjectileStickyConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ProjectileStickyConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_ProjectileStickyConfig = false;
    UPROPERTY()
    FC_ProjectileStickyConfig Config_FC_ProjectileStickyConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_RotationByTime_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_RotationByTime, NAME_None);
    UPROPERTY()
    bool bHas_FC_RotationByTime = false;
    UPROPERTY()
    FC_RotationByTime Config_FC_RotationByTime;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AdditionalMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AdditionalMovementConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_AdditionalMovementConfig = false;
    UPROPERTY()
    FC_AdditionalMovementConfig Config_FC_AdditionalMovementConfig;


}

