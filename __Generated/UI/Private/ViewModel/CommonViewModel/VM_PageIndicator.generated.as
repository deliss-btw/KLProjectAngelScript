
namespace __FVM_PageIndicator_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PageIndicator> __ModelContainer_Require_FVM_PageIndicator(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PageIndicator>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PageIndicator(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PageIndicator>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PageIndicator>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PageIndicator>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
