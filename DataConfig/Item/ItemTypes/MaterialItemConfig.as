

struct FMaterialItemConfig : FInventoryItemConfig
{
    FInventoryItemConfig _base_FInventoryItemConfig;

    default ItemType = EItemType(3);

    FMaterialItemConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FCraftItemMaterialConfig : FMaterialItemConfig
{
    FMaterialItemConfig _base_FMaterialItemConfig;

    default ItemTrunk = ItemCategoryTrunkBindings::CraftMaterials.GetTrunk();
    default ItemCategory = FFilteredGameplayTag(ItemCategoryTrunkBindings::CraftMaterials.GetCategory(), GameplayTags::ItemCategory_Material_Craft);

    FCraftItemMaterialConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FEquipmentMaterialConfig : FMaterialItemConfig
{
    FMaterialItemConfig _base_FMaterialItemConfig;

    default ItemTrunk = ItemCategoryTrunkBindings::EquipmentMaterials.GetTrunk();
    default ItemCategory = FFilteredGameplayTag(ItemCategoryTrunkBindings::EquipmentMaterials.GetCategory(), GameplayTags::ItemCategory_Material_EquipmentBuild);

    FEquipmentMaterialConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FCookMaterialConfig : FMaterialItemConfig
{
    FMaterialItemConfig _base_FMaterialItemConfig;
    UPROPERTY()
    int EnergyAbundance;
    UPROPERTY()
    TMap<FGameplayTag, int> CookTags;
    UPROPERTY()
    TArray<FCookIngredientAttribute> AbundanceTier1Attributes;
    UPROPERTY()
    TArray<FCookIngredientAttribute> AbundanceTier2Attributes;
    UPROPERTY()
    TArray<FCookIngredientAttribute> AbundanceTier3Attributes;
    UPROPERTY()
    TArray<FCookIngredientAttribute> AbundanceTier4Attributes;

    default ItemTrunk = ItemCategoryTrunkBindings::CookMaterial.GetTrunk();
    default ItemCategory = FFilteredGameplayTag(ItemCategoryTrunkBindings::CookMaterial.GetCategory(), GameplayTags::ItemCategory_Material_Cook);

    FCookMaterialConfig()
    {
        super();
        this.EnergyAbundance = 0;
        this.__InitDefaults();
        return;
    }
}

struct FTestThreeChooseOneItemConfig : FMaterialItemConfig
{
    FMaterialItemConfig _base_FMaterialItemConfig;
    UPROPERTY()
    FDataObjectPtr m_BoonRandomSlots;

    default ItemTrunk = ItemCategoryTrunkBindings::EquipmentMaterials.GetTrunk();
    default ItemCategory = FFilteredGameplayTag(ItemCategoryTrunkBindings::EquipmentMaterials.GetCategory(), GameplayTags::ItemCategory_Material_EquipmentBuild);

    FTestThreeChooseOneItemConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
    const TDataObjectPtr<FBoonRandomSlotsConfig> GetBoonRandomSlots() const property
    {
        const TDataObjectPtr<FBoonRandomSlotsConfig> __r;
        return __r;
    }
    void SetBoonRandomSlots(const TDataObjectPtr<FBoonRandomSlotsConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FBoonRandomSlotsConfig>> local_2;
        this.m_BoonRandomSlots = local_2;
        return;
    }
}

