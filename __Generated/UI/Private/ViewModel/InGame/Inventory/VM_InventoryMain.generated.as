
namespace __FVM_InventoryMainItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_InventoryMainItem> __ModelContainer_Require_FVM_InventoryMainItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_InventoryMainItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_InventoryMainItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_InventoryMainItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_InventoryMainItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_InventoryMainItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_InventoryMain_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_InventoryMain> __ModelContainer_Require_FVM_InventoryMain(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_InventoryMain>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_InventoryMain(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_InventoryMain>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_InventoryMain>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_InventoryMain>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
