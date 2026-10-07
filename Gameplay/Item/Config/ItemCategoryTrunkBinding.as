
namespace ItemCategoryTrunkBindings
{
    const FItemCategoryTrunkBinding Weapon = FItemCategoryTrunkBinding();
    const FItemCategoryTrunkBinding Talisman = FItemCategoryTrunkBinding();
    const FItemCategoryTrunkBinding Mount = FItemCategoryTrunkBinding();
    const FItemCategoryTrunkBinding CombatItem = FItemCategoryTrunkBinding();
    const FItemCategoryTrunkBinding Consumable = FItemCategoryTrunkBinding();
    const FItemCategoryTrunkBinding CraftMaterials = FItemCategoryTrunkBinding();
    const FItemCategoryTrunkBinding EquipmentMaterials = FItemCategoryTrunkBinding();
    const FItemCategoryTrunkBinding CookMaterial = FItemCategoryTrunkBinding();
    const FItemCategoryTrunkBinding CommonItem = FItemCategoryTrunkBinding();

}
struct FItemCategoryTrunkBinding
{
    UPROPERTY()
    FGameplayTag m_Category;
    UPROPERTY()
    EItemTrunk m_Trunk;

    FItemCategoryTrunkBinding()
    {
        this.m_Trunk = EItemTrunk(0);
        return;
    }
    FItemCategoryTrunkBinding(const FGameplayTag &inout InCategory, const EItemTrunk InTrunk)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FGameplayTag GetCategory() const property
    {
        return this;
    }
    EItemTrunk GetTrunk() const property
    {
        return this.m_Trunk;
    }
}

namespace FItemCategoryTrunkBinding
{
const EItemTrunk FindTrunk(const FGameplayTag &inout Category)
{
    EItemTrunk local_1;
    if (Category.Find(local_1))
    {
        return local_1;
    }
    return EItemTrunk(0);
}
const FGameplayTag FindCategory(const EItemTrunk Trunk)
{
    FGameplayTag local_2;
    if (Trunk.Find(local_2))
    {
        return local_2;
    }
    return local_2;
}
}
