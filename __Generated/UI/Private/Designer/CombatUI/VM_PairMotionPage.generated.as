
namespace __FVMS_PairMotionPage_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_PairMotionPage> __ModelContainer_Require_FVMS_PairMotionPage(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_PairMotionPage>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_PairMotionPage(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_PairMotionPage>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_PairMotionPage>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_PairMotionPage>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
