
namespace __FVM_ForgeWeaponItemMaterial_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ForgeWeaponItemMaterial> __ModelContainer_Require_FVM_ForgeWeaponItemMaterial(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ForgeWeaponItemMaterial>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ForgeWeaponItemMaterial(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterial>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterial>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ForgeWeaponItemMaterial>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
