
namespace __FVM_HeadsUpDisplay_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_HeadsUpDisplay> __ModelContainer_Require_FVM_HeadsUpDisplay(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_HeadsUpDisplay>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_HeadsUpDisplay(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_HeadsUpDisplay>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_HeadsUpDisplay>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_HeadsUpDisplay>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
