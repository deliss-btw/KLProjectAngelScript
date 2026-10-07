

struct FGameplayItemConfig : FInventoryItemConfig
{
    FInventoryItemConfig _base_FInventoryItemConfig;

    default ItemType = EItemType(4);

    FGameplayItemConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FCombatItemConfig : FGameplayItemConfig
{
    FGameplayItemConfig _base_FGameplayItemConfig;
    UPROPERTY()
    const USkillConfig ItemSkillConfig;
    UPROPERTY()
    FBuffConfigRef ItemBuffConfig;

    default ItemTrunk = ItemCategoryTrunkBindings::CombatItem.GetTrunk();
    default ItemCategory = FFilteredGameplayTag(ItemCategoryTrunkBindings::CombatItem.GetCategory(), GameplayTags::ItemCategory_Usable_Combat_Attack);

    FCombatItemConfig()
    {
        super();
        this.ItemSkillConfig = nullptr;
        this.__InitDefaults();
        return;
    }
}

