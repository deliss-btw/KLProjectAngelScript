
namespace __FVM_TaskTarget_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TaskTarget> __ModelContainer_Require_FVM_TaskTarget(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TaskTarget>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TaskTarget(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TaskTarget>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TaskTarget>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TaskTarget>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
