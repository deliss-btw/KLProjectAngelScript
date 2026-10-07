
namespace __FVMS_ChangeRole_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_ChangeRole> __ModelContainer_Require_FVMS_ChangeRole(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_ChangeRole>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_ChangeRole(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_ChangeRole>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_ChangeRole>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_ChangeRole>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
