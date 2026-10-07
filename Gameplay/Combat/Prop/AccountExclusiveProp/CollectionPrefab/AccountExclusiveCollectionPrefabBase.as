

class AAccountExclusiveCollectionPrefabPrefabBase : AAccountExclusivePropPrefabBase
{
    UPROPERTY()
    FT_AccountExclusiveCollectionPrefab AccountExclusiveCollectionPrefabTrait;
    UPROPERTY()
    FT_LevelObjectStat LevelObjectStatTrait;
    UPROPERTY()
    FT_InteractTrait InteractTrait;
    UPROPERTY()
    FT_PrefabConfig PrefabConfig;
    UPROPERTY()
    FT_DropItemSource DropItemSource;
    UPROPERTY()
    FT_HUDIndicator HUDIndicator;
    UPROPERTY()
    FT_Prop_Presentation Prop_Presentation;
    UPROPERTY()
    FT_AccountExclusiveCollectionPrefabPresentationConfig AccountExclusiveCollectionPrefabPresentationConfig;

    AAccountExclusiveCollectionPrefabPrefabBase()
    {
        super();
        return;
    }
}

