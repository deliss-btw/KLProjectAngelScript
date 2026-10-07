
namespace __FVM_TaskGroup_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TaskGroup> __ModelContainer_Require_FVM_TaskGroup(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TaskGroup>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TaskGroup(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TaskGroup>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TaskGroup>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TaskGroup>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
