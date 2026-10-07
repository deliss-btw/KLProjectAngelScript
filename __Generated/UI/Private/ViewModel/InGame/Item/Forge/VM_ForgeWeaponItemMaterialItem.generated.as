
namespace __FVM_ForgeWeaponItemMaterialItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ForgeWeaponItemMaterialItem> __ModelContainer_Require_FVM_ForgeWeaponItemMaterialItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ForgeWeaponItemMaterialItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
