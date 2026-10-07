
namespace __FVM_AvatarSelectBar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarSelectBar> __ModelContainer_Require_FVM_AvatarSelectBar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarSelectBar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarSelectBar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarSelectBar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarSelectBar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarSelectBar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
