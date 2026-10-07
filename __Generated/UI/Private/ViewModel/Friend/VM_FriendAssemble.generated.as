
namespace __FVMS_FriendAssemble_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_FriendAssemble> __ModelContainer_Require_FVMS_FriendAssemble(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_FriendAssemble>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_FriendAssemble(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_FriendAssemble>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_FriendAssemble>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_FriendAssemble>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
