

// NOTE: class defaults are not authored in this module: ACombatPropPrefab (default scalar field AECSPrefab.PerformanceStatCategory has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

UCLASS(Abstract)
class ACombatPropPrefab : APropPrefab
{
    UPROPERTY()
    FT_EntityPoolOwner EntityPoolOwner;
    UPROPERTY()
    FT_GameplayTags GameplayTags;
    UPROPERTY()
    FT_InteractTrait Interact;
    UPROPERTY()
    FT_Buff Buff;
    UPROPERTY()
    FT_Ability Ability;
    UPROPERTY()
    FT_Skill Skill;
    UPROPERTY()
    FT_EntityBlackboard EntityBlackboard;
    UPROPERTY()
    FT_Hittable Hittable;
    UPROPERTY()
    FT_Collision Collision;
    UPROPERTY()
    FT_PossessPropConfig PossessProp;
    UPROPERTY()
    FT_Teleporter Teleporter;
    UPROPERTY()
    FT_TeleportSlotConfig TeleportSlot;
    UPROPERTY()
    FT_VehicleSnapToFloor VehicleSnapToFloor;

    ACombatPropPrefab()
    {
        super();
        return;
    }
    UFUNCTION()
    float32 GetCollisionHalfHeight_Implementation() const
    {
        if (this.Collision.bTraitEnable)
        {
            return this.Collision.Config_FC_Collision.GetScaledHalfHeight();
        }
        return 0.0f;
    }
}

