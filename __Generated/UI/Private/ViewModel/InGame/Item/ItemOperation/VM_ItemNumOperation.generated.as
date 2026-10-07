
namespace __FVM_ItemNumOperation_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemNumOperation> __ModelContainer_Require_FVM_ItemNumOperation(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemNumOperation>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemNumOperation(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemNumOperation>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemNumOperation>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemNumOperation>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
