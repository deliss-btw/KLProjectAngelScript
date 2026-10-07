
namespace __FVM_LockHover_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_LockHover> __ModelContainer_Require_FVM_LockHover(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_LockHover>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_LockHover(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_LockHover>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_LockHover>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_LockHover>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
