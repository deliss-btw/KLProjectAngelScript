
namespace __FVM_StigmataItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_StigmataItem> __ModelContainer_Require_FVM_StigmataItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_StigmataItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_StigmataItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_StigmataItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_StigmataItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_StigmataItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
