
namespace __FVM_Execute_InputPushProgress_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Execute_InputPushProgress> __ModelContainer_Require_FVM_Execute_InputPushProgress(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Execute_InputPushProgress>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Execute_InputPushProgress(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Execute_InputPushProgress>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Execute_InputPushProgress>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Execute_InputPushProgress>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
