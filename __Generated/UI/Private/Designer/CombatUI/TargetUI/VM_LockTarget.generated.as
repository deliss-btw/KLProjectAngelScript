
namespace __FVMS_LockTarget_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_LockTarget> __ModelContainer_Require_FVMS_LockTarget(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_LockTarget>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_LockTarget(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_LockTarget>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_LockTarget>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_LockTarget>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
