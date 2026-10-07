
namespace __FVMS_CommonLoading_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_CommonLoading> __ModelContainer_Require_FVMS_CommonLoading(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_CommonLoading>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_CommonLoading(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_CommonLoading>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_CommonLoading>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_CommonLoading>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
