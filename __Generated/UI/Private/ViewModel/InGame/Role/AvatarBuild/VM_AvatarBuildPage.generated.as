
namespace __FVM_AvatarBuildPage_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarBuildPage> __ModelContainer_Require_FVM_AvatarBuildPage(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarBuildPage>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarBuildPage(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarBuildPage>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarBuildPage>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarBuildPage>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
