

// NOTE: class defaults are not authored in this module: APropPrefab (default scalar field AECSPrefab.NetRelevancePolicyType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

UCLASS(Abstract)
class APropPrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_PrefabConfig PrefabConfig;
    UPROPERTY()
    FT_Prop Prop;
    UPROPERTY()
    FT_SimpleMovement Movement;
    UPROPERTY()
    FT_BeHitPresentation BeHitPresentation;
    UPROPERTY()
    FT_MiniHPBarConfig MiniHPBarConfig;
    UPROPERTY()
    FT_GameAttribute Attribute;
    UPROPERTY()
    FT_AITargetable AITargetable;
    UPROPERTY()
    FT_Prop_Presentation PropPresentation;
    UPROPERTY()
    FT_HUDIndicator HUDIndicator;
    UPROPERTY()
    FT_EcosimAIV2Chain EcosimAIV2Chain;

    APropPrefab()
    {
        this.BeHitPresentation.Config_FC_BeHitPresentationConfig.bShowHitFX = true;
        this.BeHitPresentation.Config_FC_BeHitPresentationConfig.bShowDamageNum = false;
        return;
    }
    UFUNCTION()
    void ConstructionScript_Implementation()
    {
        return;
    }
    UFUNCTION()
    void DrawVisualisationOnSelected_Implementation() const
    {
        return;
    }
}

