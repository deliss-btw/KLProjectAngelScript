
namespace __FVM_KeyList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_KeyList> __ModelContainer_Require_FVM_KeyList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_KeyList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_KeyList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_KeyList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_KeyList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_KeyList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
