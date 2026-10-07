
namespace __FVM_CGPlayer_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CGPlayer> __ModelContainer_Require_FVM_CGPlayer(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CGPlayer>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CGPlayer(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CGPlayer>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CGPlayer>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CGPlayer>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
