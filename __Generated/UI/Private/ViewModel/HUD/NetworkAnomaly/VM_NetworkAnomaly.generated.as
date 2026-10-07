
namespace __FVM_NetworkAnomaly_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_NetworkAnomaly> __ModelContainer_Require_FVM_NetworkAnomaly(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_NetworkAnomaly>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_NetworkAnomaly(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_NetworkAnomaly>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_NetworkAnomaly>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_NetworkAnomaly>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
