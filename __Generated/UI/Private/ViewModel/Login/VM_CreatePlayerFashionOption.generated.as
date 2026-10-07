
namespace __FVM_CreatePlayerFashionOption_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CreatePlayerFashionOption> __ModelContainer_Require_FVM_CreatePlayerFashionOption(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CreatePlayerFashionOption>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CreatePlayerFashionOption(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CreatePlayerFashionOption>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CreatePlayerFashionOption>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CreatePlayerFashionOption>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
