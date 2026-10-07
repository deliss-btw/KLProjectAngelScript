
namespace __FVM_AvatarAttributeList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarAttributeList> __ModelContainer_Require_FVM_AvatarAttributeList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarAttributeList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarAttributeList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarAttributeList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarAttributeList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarAttributeList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
