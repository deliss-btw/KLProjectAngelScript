

// NOTE: class defaults are not authored in this module: UCombatArealEffectPoolMeta (default scalar field UECSEntityPoolMeta.InitSize has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UCombatArealEffectPoolMeta : UECSEntityPoolMeta
{
    UCombatArealEffectPoolMeta()
    {
        return;
    }
    UFUNCTION()
    void Init_Implementation()
    {
        this.AddManagedTrait(FT_CombatArealEffect);
        this.AddManagedTrait(FT_CombatArealEffectSpawner);
        this.AddManagedTrait(FT_MovementConfig);
        this.AddManagedComponent(FC_CombatArealEffectRuntime);
        this.AddManagedComponent(FC_CombatArealEffectBuffOverride);
        this.AddManagedComponent(FC_CombatArealEffectBuffAddedData);
        this.AddManagedComponent(FC_CombatArealEffectAbilityEffectTriggerOverride);
        this.AddManagedComponent(FC_CombatArealEffectHitTestOverride);
        this.AddManagedComponent(FC_CombatArealEffectTestShape);
        this.AddManagedComponent(FC_CombatArealEffectSpawnerRuntime);
        this.AddManagedComponent(FC_CombatArealEffectFXRuntime);
        this.AddManagedComponent(FC_Transform);
        this.AddManagedComponent(FC_LifeTime);
        this.AddManagedComponent(FC_MovementInfo);
        this.AddManagedComponent(FC_LinearMovementOverride);
        this.AddManagedComponent(FC_SimpleProjectileMovementOverride);
        this.AddManagedComponent(FC_ThrowMovementOverride);
        this.AddManagedComponent(FC_GroundMovementOverride);
        this.AddManagedComponent(FC_CurveMovementOverride);
        this.AddManagedComponent(FC_TrackMovementOverride);
        this.AddManagedComponent(FC_TrackRuntime);
        this.AddManagedComponent(FC_OrbitMovementRuntime);
        return;
    }
}

