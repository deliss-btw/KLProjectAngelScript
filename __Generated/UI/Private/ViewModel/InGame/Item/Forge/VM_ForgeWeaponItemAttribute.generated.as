
namespace __FVM_ForgeWeaponItemAttribute_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ForgeWeaponItemAttribute> __ModelContainer_Require_FVM_ForgeWeaponItemAttribute(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ForgeWeaponItemAttribute>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ForgeWeaponItemAttribute(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ForgeWeaponItemAttribute>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ForgeWeaponItemAttribute>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ForgeWeaponItemAttribute>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
