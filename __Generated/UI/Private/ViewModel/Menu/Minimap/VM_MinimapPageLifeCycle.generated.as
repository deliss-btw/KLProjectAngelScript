
namespace __FVM_MinimapPageLifeCycle_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MinimapPageLifeCycle> __ModelContainer_Require_FVM_MinimapPageLifeCycle(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MinimapPageLifeCycle>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MinimapPageLifeCycle(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MinimapPageLifeCycle>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MinimapPageLifeCycle>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MinimapPageLifeCycle>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
