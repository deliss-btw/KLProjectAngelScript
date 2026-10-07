
namespace __FVM_MinimapIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MinimapIcon> __ModelContainer_Require_FVM_MinimapIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MinimapIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MinimapIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MinimapIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MinimapIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MinimapIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
