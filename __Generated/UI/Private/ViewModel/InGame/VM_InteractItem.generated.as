
namespace __FVM_InteractItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_InteractItem> __ModelContainer_Require_FVM_InteractItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_InteractItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_InteractItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_InteractItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_InteractItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_InteractItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
