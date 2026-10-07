
namespace __FVM_ForgeWeaponItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ForgeWeaponItem> __ModelContainer_Require_FVM_ForgeWeaponItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ForgeWeaponItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ForgeWeaponItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ForgeWeaponItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ForgeWeaponItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ForgeWeaponItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
