
namespace __FVM_IndicatorList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_IndicatorList> __ModelContainer_Require_FVM_IndicatorList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_IndicatorList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_IndicatorList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_IndicatorList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_IndicatorList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_IndicatorList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
