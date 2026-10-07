
namespace __FVM_ItemOperationList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemOperationList> __ModelContainer_Require_FVM_ItemOperationList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemOperationList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemOperationList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemOperationList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemOperationList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemOperationList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
