
namespace __FVM_ForgeWeaponItemUnlockCondItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem> __ModelContainer_Require_FVM_ForgeWeaponItemUnlockCondItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ForgeWeaponItemUnlockCondItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
