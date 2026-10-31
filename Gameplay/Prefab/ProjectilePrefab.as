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

