
namespace __FVM_Task_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Task> __ModelContainer_Require_FVM_Task(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Task>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Task(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Task>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Task>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Task>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
