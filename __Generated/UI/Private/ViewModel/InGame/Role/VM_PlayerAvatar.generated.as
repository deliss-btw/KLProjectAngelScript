
namespace __FVM_PlayerAvatar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PlayerAvatar> __ModelContainer_Require_FVM_PlayerAvatar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PlayerAvatar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PlayerAvatar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PlayerAvatar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PlayerAvatar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PlayerAvatar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
