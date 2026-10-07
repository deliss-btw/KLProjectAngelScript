
namespace __FVM_ForgeWeaponItemPassiveSkill_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill> __ModelContainer_Require_FVM_ForgeWeaponItemPassiveSkill(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ForgeWeaponItemPassiveSkill(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
