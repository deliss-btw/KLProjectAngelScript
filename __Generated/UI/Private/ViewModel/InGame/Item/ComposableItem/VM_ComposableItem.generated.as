
namespace __FVM_ComposableItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ComposableItem> __ModelContainer_Require_FVM_ComposableItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ComposableItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ComposableItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ComposableItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ComposableItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ComposableItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
