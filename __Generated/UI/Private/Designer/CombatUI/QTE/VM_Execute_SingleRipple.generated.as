
namespace __FVM_Execute_SingleRipple_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Execute_SingleRipple> __ModelContainer_Require_FVM_Execute_SingleRipple(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Execute_SingleRipple>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Execute_SingleRipple(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Execute_SingleRipple>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Execute_SingleRipple>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Execute_SingleRipple>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
