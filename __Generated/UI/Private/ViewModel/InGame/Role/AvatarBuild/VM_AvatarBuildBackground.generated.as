
namespace __FVM_AvatarBuildBackground_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarBuildBackground> __ModelContainer_Require_FVM_AvatarBuildBackground(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarBuildBackground>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarBuildBackground(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarBuildBackground>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarBuildBackground>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarBuildBackground>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
