

struct FMountItemConfig : FItemConfig
{
    FItemConfig _base_FItemConfig;
    UPROPERTY()
    TSoftClassPtr<AECSPrefab> MountPrefab;

    default ItemType = EItemType(101);
    default ItemTrunk = ItemCategoryTrunkBindings::Mount.GetTrunk();
    default ItemCategory = FFilteredGameplayTag(ItemCategoryTrunkBindings::Mount.GetCategory(), GameplayTags::ItemCategory_Appearance_Mount);

    FMountItemConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

