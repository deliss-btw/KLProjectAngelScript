
namespace __FVM_AvatarSelectBarItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarSelectBarItem> __ModelContainer_Require_FVM_AvatarSelectBarItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarSelectBarItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarSelectBarItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarSelectBarItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarSelectBarItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarSelectBarItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
