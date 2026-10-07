
namespace __FVM_AvatarBuildBar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarBuildBar> __ModelContainer_Require_FVM_AvatarBuildBar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarBuildBar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarBuildBar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarBuildBar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarBuildBar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarBuildBar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
