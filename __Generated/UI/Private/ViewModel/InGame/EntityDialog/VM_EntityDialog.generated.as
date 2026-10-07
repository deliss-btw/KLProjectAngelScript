
namespace __FVM_EntityDialog_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_EntityDialog> __ModelContainer_Require_FVM_EntityDialog(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_EntityDialog>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_EntityDialog(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_EntityDialog>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_EntityDialog>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_EntityDialog>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
