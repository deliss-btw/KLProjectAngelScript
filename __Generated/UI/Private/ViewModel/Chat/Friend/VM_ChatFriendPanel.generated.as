
namespace __FVM_ChatFriendPanel_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ChatFriendPanel> __ModelContainer_Require_FVM_ChatFriendPanel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ChatFriendPanel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ChatFriendPanel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ChatFriendPanel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ChatFriendPanel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ChatFriendPanel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
