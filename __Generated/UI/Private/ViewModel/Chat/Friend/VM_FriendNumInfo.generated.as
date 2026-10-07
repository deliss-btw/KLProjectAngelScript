
namespace __FVM_FriendNumInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_FriendNumInfo> __ModelContainer_Require_FVM_FriendNumInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_FriendNumInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_FriendNumInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_FriendNumInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_FriendNumInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_FriendNumInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
