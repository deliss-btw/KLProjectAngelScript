
namespace __FVM_EditAvatarScope_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_EditAvatarScope> __ModelContainer_Require_FVM_EditAvatarScope(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_EditAvatarScope>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_EditAvatarScope(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_EditAvatarScope>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_EditAvatarScope>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_EditAvatarScope>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
