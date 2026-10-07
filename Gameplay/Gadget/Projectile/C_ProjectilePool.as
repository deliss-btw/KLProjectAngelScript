

// NOTE: class defaults are not authored in this module: UProjectilePoolMeta (default scalar field UECSEntityPoolMeta.InitSize has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UProjectilePoolMeta : UECSEntityPoolMeta
{
    UProjectilePoolMeta()
    {
        return;
    }
    UFUNCTION()
    void Init_Implementation()
    {
        this.AddManagedTrait(FT_Projectile);
        this.AddManagedTrait(FT_Hittable);
        this.AddManagedTrait(FT_BeHitPresentation);
        this.AddManagedComponent(FC_ProjectileDelayDestroy);
        this.AddManagedComponent(FC_VisualTransformOffset);
        this.AddManagedComponent(FC_TimeTweak);
        this.AddManagedComponent(FC_HitRecords);
        this.AddManagedComponent(FC_TrackRuntime);
        this.AddManagedComponent(FC_ProjectileHitInfo);
        this.AddManagedComponent(FC_HittableDataRuntime);
        this.AddManagedComponent(FC_ProjectileHealth);
        this.AddManagedComponent(FC_ProjectileFXLifeTime);
        this.AddManagedComponent(FC_ScaleByTimeRuntime);
        this.AddManagedComponent(FC_HitTestByMoveTrailRunTimeData);
        this.AddManagedComponent(FC_AbilityEffectEventTrigger);
        this.AddManagedComponent(FC_CombatActionPendingTrigger);
        this.AddManagedComponent(FC_TransformAttachmentLogic);
        this.AddManagedComponent(FC_AttachmentParent);
        this.AddManagedComponent(FC_TransformSyncDisabled);
        this.AddManagedComponent(FC_ProjectileHitTestDisableTag);
        this.AddManagedComponent(FC_SimpleProjectileMovementOverride);
        this.AddManagedComponent(FC_ThrowMovementOverride);
        this.AddManagedComponent(FC_GroundMovementOverride);
        this.AddManagedComponent(FC_TrackMovementOverride);
        this.AddManagedComponent(FC_CurveMovementOverride);
        this.AddManagedComponent(FC_CurveRotationOverride);
        this.AddManagedComponent(FC_FixedDurationMovementOverride);
        this.AddManagedComponent(FC_RotationRuntimeInfo);
        this.AddManagedComponent(FC_InterpoBlendSameAsOwnerTag);
        this.AddManagedComponent(FC_SyncChangeMaterialParamRequests);
        this.AddManagedComponent(FC_ChangeMaterialRequestUpdatedTag);
        this.AddManagedComponent(FC_MaterialParamBlendingTag);
        this.AddManagedComponent(FC_CachedAllChangeMateraialData);
        this.AddManagedComponent(FC_CachedMaterialOverrides);
        this.AddManagedComponent(FC_RelativeMovement);
        this.AddManagedComponent(FC_RelativeMovementEnableByTime);
        this.AddManagedComponent(FC_ProjectileTimelineData);
        this.AddManagedComponent(FC_ProjectileUseTimelineTag);
        this.AddManagedComponent(FC_ProjectileTimelineController);
        this.AddManagedComponent(FC_ProjectileTimelineChange);
        this.AddManagedComponent(FC_ProjectileTimelineComponentReplaceSync);
        this.AddManagedComponent(FC_ProjectileTimelineComponentReplaceNonSync);
        this.AddManagedComponent(FC_ProjectileTimelineEventTriggerConfig);
        this.AddManagedComponent(FC_ConfigSelection);
        this.AddManagedInternalComponent(FC_ConfigSelectionLastValue);
        this.AddManagedComponent(FC_ProjectileHitStickAttach);
        this.AddManagedComponent(FC_ProjectileStickDestroyWithSimpleDestructible);
        this.AddManagedComponent(FC_RootAudioEmitterRef);
        this.AddManagedComponent(FC_ProjectileDurationalSFXList);
        this.AddManagedComponent(FC_ProjectileAudioKeepSwitchList);
        this.AddManagedComponent(FC_ProjectileAudioKeepRtpcList);
        this.AddConditionalReserveNonSyncComponent(FC_ProjectileFXLifeTime);
        this.AddConditionalReserveNonSyncComponent(FC_SurroundingMaterialCheckRuntime);
        return;
    }
}

