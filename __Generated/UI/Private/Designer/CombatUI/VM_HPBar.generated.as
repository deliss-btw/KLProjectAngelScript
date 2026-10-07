
namespace __FVM_HPBar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_HPBar> __ModelContainer_Require_FVM_HPBar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_HPBar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_HPBar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_HPBar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_HPBar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_HPBar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
