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

