
namespace __FVM_SubmitRechargeTier_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SubmitRechargeTier> __ModelContainer_Require_FVM_SubmitRechargeTier(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SubmitRechargeTier>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SubmitRechargeTier(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SubmitRechargeTier>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SubmitRechargeTier>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SubmitRechargeTier>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
