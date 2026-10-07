
namespace __FVM_BuffHoverDialog_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BuffHoverDialog> __ModelContainer_Require_FVM_BuffHoverDialog(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BuffHoverDialog>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BuffHoverDialog(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BuffHoverDialog>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BuffHoverDialog>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BuffHoverDialog>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
