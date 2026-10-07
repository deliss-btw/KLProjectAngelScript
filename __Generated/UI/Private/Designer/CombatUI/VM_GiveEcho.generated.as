
namespace __FVM_GiveEcho_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_GiveEcho> __ModelContainer_Require_FVM_GiveEcho(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_GiveEcho>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_GiveEcho(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_GiveEcho>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_GiveEcho>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_GiveEcho>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
