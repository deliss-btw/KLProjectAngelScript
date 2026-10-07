
namespace __FVM_Indicator_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Indicator> __ModelContainer_Require_FVM_Indicator(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Indicator>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Indicator(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Indicator>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Indicator>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Indicator>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
