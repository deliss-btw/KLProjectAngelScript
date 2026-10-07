

// NOTE: class defaults are not authored in this module: AProjectilePrefab (default scalar field AECSPrefab.NetRelevancePolicyType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

UCLASS(Abstract)
class AProjectilePrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_Projectile Projectile;
    UPROPERTY()
    FT_Hittable Hittable;
    UPROPERTY()
    FT_BeHitPresentation BeHitPresentation;
    UPROPERTY()
    FT_GameplayTags GameplayTags;
    UPROPERTY()
    FT_Lockable Lockable;
    UPROPERTY()
    FT_HUDIndicator HUDIndicator;
    UPROPERTY()
    FT_Prop_Presentation UIPresentation;
    UPROPERTY()
    FT_VisualComponentToggle VisualComponentToggle;

    AProjectilePrefab()
    {
        int local_1_2 = int(this.Hittable._base_FECSTrait);
        this.BeHitPresentation.Config_FC_BeHitPresentationConfig.bShowHitFX = false;
        this.BeHitPresentation.Config_FC_BeHitPresentationConfig.bShowDamageNum = false;
        this.GameplayTags.bTraitEnable = false;
        this.VisualComponentToggle.bTraitEnable = false;
        return;
    }
}

