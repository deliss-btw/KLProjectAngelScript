
namespace __FVM_AvatarButton_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarButton> __ModelContainer_Require_FVM_AvatarButton(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarButton>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarButton(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarButton>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarButton>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarButton>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
