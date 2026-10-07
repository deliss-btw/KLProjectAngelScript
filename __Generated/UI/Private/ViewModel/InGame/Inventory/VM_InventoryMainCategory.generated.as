
namespace __FVM_InventoryMainRootCategory_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_InventoryMainRootCategory> __ModelContainer_Require_FVM_InventoryMainRootCategory(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_InventoryMainRootCategory>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_InventoryMainRootCategory(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_InventoryMainRootCategory>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_InventoryMainRootCategory>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_InventoryMainRootCategory>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_InventoryMainCategory_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_InventoryMainCategory> __ModelContainer_Require_FVM_InventoryMainCategory(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_InventoryMainCategory>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_InventoryMainCategory(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_InventoryMainCategory>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_InventoryMainCategory>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_InventoryMainCategory>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
