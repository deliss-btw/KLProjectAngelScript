
namespace __FVMS_DigPoint_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_DigPoint> __ModelContainer_Require_FVMS_DigPoint(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_DigPoint>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_DigPoint(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_DigPoint>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_DigPoint>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_DigPoint>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
