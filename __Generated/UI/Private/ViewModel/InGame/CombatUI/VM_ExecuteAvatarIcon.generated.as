
namespace __FVM_ExecuteAvatarIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ExecuteAvatarIcon> __ModelContainer_Require_FVM_ExecuteAvatarIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ExecuteAvatarIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ExecuteAvatarIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ExecuteAvatarIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ExecuteAvatarIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ExecuteAvatarIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
