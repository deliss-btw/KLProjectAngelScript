
namespace __FVM_EscapeExecuted_Progress_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_EscapeExecuted_Progress> __ModelContainer_Require_FVM_EscapeExecuted_Progress(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_EscapeExecuted_Progress>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_EscapeExecuted_Progress(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_EscapeExecuted_Progress>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_EscapeExecuted_Progress>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_EscapeExecuted_Progress>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
