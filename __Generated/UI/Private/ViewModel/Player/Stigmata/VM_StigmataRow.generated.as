
namespace __FVM_StigmataRow_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_StigmataRow> __ModelContainer_Require_FVM_StigmataRow(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_StigmataRow>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_StigmataRow(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_StigmataRow>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_StigmataRow>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_StigmataRow>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
