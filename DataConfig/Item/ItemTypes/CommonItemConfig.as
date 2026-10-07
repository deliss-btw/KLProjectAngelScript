

struct FCommonItemConfig : FInventoryItemConfig
{
    FInventoryItemConfig _base_FInventoryItemConfig;
    UPROPERTY()
    TArray<FInstancedStruct> GSUseEffects;

    default ItemType = EItemType(5);
    default ItemTrunk = ItemCategoryTrunkBindings::CommonItem.GetTrunk();
    default ItemCategory = FFilteredGameplayTag(ItemCategoryTrunkBindings::CommonItem.GetCategory(), GameplayTags::ItemCategory_Usable_Common_Item);

    FCommonItemConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

