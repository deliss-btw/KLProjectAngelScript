

// NOTE: class defaults are not authored in this module: ACollectionPrefab (default scalar field AECSPrefab.NetRelevancePolicyType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class ACollectionPrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_PrefabConfig PrefabConfig;
    UPROPERTY()
    FT_InteractTrait Interact;
    UPROPERTY()
    FT_DropItemSource DropItemSource;
    UPROPERTY()
    FT_DropItem DropItem;
    UPROPERTY()
    FT_AITargetable AITargetable;
    UPROPERTY()
    FT_VisualComponentToggle VisualComponentToggle;
    UPROPERTY()
    FT_HUDIndicator HUDIndicator;
    UPROPERTY()
    FT_Prop_Presentation Prop_Presentation;
    UPROPERTY()
    FT_CollectionPrefabPresentationConfig CollectionPrefabPresentationConfig;

    ACollectionPrefab()
    {
        return;
    }
}

