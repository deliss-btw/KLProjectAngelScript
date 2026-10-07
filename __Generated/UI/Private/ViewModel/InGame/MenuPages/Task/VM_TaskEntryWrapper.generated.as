
namespace __FVM_TaskEntryWrapper_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TaskEntryWrapper> __ModelContainer_Require_FVM_TaskEntryWrapper(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TaskEntryWrapper>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TaskEntryWrapper(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TaskEntryWrapper>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TaskEntryWrapper>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TaskEntryWrapper>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
