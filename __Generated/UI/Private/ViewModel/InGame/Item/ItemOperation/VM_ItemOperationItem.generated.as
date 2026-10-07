
namespace __FVM_ItemOperationItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemOperationItem> __ModelContainer_Require_FVM_ItemOperationItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemOperationItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemOperationItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemOperationItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemOperationItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemOperationItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
