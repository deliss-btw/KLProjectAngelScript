
namespace __FVM_ChatCommonAvatar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ChatCommonAvatar> __ModelContainer_Require_FVM_ChatCommonAvatar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ChatCommonAvatar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ChatCommonAvatar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ChatCommonAvatar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ChatCommonAvatar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ChatCommonAvatar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
