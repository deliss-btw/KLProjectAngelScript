
namespace __FVM_SearchFriendInput_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SearchFriendInput> __ModelContainer_Require_FVM_SearchFriendInput(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SearchFriendInput>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SearchFriendInput(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SearchFriendInput>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SearchFriendInput>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SearchFriendInput>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
