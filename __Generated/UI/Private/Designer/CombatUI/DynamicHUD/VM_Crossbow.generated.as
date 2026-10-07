
namespace __FVMS_Crossbow_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_Crossbow> __ModelContainer_Require_FVMS_Crossbow(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_Crossbow>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_Crossbow(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_Crossbow>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_Crossbow>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_Crossbow>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
