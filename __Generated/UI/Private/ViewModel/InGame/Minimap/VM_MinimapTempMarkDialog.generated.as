
namespace __FVM_MinimapTempMarkDialog_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MinimapTempMarkDialog> __ModelContainer_Require_FVM_MinimapTempMarkDialog(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MinimapTempMarkDialog>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MinimapTempMarkDialog(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MinimapTempMarkDialog>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MinimapTempMarkDialog>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MinimapTempMarkDialog>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
