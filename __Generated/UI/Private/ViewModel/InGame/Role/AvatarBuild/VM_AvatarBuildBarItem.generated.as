
namespace __FVM_AvatarBuildBarItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarBuildBarItem> __ModelContainer_Require_FVM_AvatarBuildBarItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarBuildBarItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarBuildBarItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarBuildBarItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarBuildBarItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarBuildBarItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
