
namespace __FVM_InventoryCategory_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_InventoryCategory> __ModelContainer_Require_FVM_InventoryCategory(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_InventoryCategory>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_InventoryCategory(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_InventoryCategory>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_InventoryCategory>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_InventoryCategory>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_InventoryRootCategory_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_InventoryRootCategory> __ModelContainer_Require_FVM_InventoryRootCategory(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_InventoryRootCategory>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_InventoryRootCategory(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_InventoryRootCategory>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_InventoryRootCategory>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_InventoryRootCategory>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
