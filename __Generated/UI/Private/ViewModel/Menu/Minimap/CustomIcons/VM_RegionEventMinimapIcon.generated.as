
namespace __FVM_RegionEventMinimapIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_RegionEventMinimapIcon> __ModelContainer_Require_FVM_RegionEventMinimapIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_RegionEventMinimapIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_RegionEventMinimapIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_RegionEventMinimapIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_RegionEventMinimapIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_RegionEventMinimapIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
