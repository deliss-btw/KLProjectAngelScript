
namespace __FVM_InteractTarget_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_InteractTarget> __ModelContainer_Require_FVM_InteractTarget(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_InteractTarget>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_InteractTarget(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_InteractTarget>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_InteractTarget>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_InteractTarget>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
