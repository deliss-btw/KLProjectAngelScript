
namespace __FVM_SelectTarget_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SelectTarget> __ModelContainer_Require_FVM_SelectTarget(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SelectTarget>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SelectTarget(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SelectTarget>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SelectTarget>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SelectTarget>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
