
namespace __FVMS_ProgressOperation_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_ProgressOperation> __ModelContainer_Require_FVMS_ProgressOperation(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_ProgressOperation>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_ProgressOperation(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_ProgressOperation>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_ProgressOperation>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_ProgressOperation>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
