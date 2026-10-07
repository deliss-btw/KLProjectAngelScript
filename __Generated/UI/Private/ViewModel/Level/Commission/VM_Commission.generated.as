
namespace __FVMS_Commission_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_Commission> __ModelContainer_Require_FVMS_Commission(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_Commission>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_Commission(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_Commission>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_Commission>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_Commission>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
