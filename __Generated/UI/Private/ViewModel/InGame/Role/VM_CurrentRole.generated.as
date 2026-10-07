
namespace __FVMS_CurrentRole_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_CurrentRole> __ModelContainer_Require_FVMS_CurrentRole(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_CurrentRole>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_CurrentRole(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_CurrentRole>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_CurrentRole>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_CurrentRole>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
