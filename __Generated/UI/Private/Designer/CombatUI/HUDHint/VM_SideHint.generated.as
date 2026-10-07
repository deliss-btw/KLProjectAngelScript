
namespace __FVMS_SideHint_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_SideHint> __ModelContainer_Require_FVMS_SideHint(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_SideHint>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_SideHint(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_SideHint>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_SideHint>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_SideHint>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
