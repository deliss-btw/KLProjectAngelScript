
namespace __FVMS_Crosshair_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_Crosshair> __ModelContainer_Require_FVMS_Crosshair(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_Crosshair>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_Crosshair(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_Crosshair>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_Crosshair>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_Crosshair>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
