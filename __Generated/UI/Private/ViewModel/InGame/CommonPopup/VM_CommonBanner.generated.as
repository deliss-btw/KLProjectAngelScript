
namespace __FVM_CommonBanner_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonBanner> __ModelContainer_Require_FVM_CommonBanner(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonBanner>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonBanner(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonBanner>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonBanner>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonBanner>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
