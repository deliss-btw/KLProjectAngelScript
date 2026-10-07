
namespace __FVM_Minimap_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Minimap> __ModelContainer_Require_FVM_Minimap(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Minimap>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Minimap(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Minimap>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Minimap>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Minimap>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
