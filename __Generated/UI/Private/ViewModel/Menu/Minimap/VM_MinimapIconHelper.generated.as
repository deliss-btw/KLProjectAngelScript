
namespace __FVM_MinimapIconHelper_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MinimapIconHelper> __ModelContainer_Require_FVM_MinimapIconHelper(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MinimapIconHelper>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MinimapIconHelper(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MinimapIconHelper>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MinimapIconHelper>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MinimapIconHelper>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
