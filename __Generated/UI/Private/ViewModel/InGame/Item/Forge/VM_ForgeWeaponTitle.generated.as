
namespace __FVM_ForgeWeaponTitle_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ForgeWeaponTitle> __ModelContainer_Require_FVM_ForgeWeaponTitle(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ForgeWeaponTitle>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ForgeWeaponTitle(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ForgeWeaponTitle>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ForgeWeaponTitle>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ForgeWeaponTitle>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
