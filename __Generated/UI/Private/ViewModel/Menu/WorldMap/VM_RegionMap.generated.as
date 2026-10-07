
namespace __FVM_RegionMap_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_RegionMap> __ModelContainer_Require_FVM_RegionMap(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_RegionMap>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_RegionMap(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_RegionMap>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_RegionMap>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_RegionMap>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
