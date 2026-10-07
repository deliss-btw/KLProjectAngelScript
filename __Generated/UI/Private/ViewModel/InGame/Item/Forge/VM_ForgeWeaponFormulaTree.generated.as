
namespace __FVM_ForgeWeaponFormulaTree_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ForgeWeaponFormulaTree> __ModelContainer_Require_FVM_ForgeWeaponFormulaTree(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ForgeWeaponFormulaTree>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ForgeWeaponFormulaTree(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ForgeWeaponFormulaTree>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ForgeWeaponFormulaTree>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ForgeWeaponFormulaTree>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
