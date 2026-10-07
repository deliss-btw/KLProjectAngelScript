
namespace __FVM_CommonDialog_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonDialog> __ModelContainer_Require_FVM_CommonDialog(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonDialog>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonDialog(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonDialog>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonDialog>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonDialog>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
