
namespace __FVM_Inventory_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Inventory> __ModelContainer_Require_FVM_Inventory(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Inventory>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Inventory(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Inventory>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Inventory>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Inventory>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CloseVisibilityState_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CloseVisibilityState> __ModelContainer_Require_FVM_CloseVisibilityState(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CloseVisibilityState>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CloseVisibilityState(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CloseVisibilityState>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CloseVisibilityState>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CloseVisibilityState>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
