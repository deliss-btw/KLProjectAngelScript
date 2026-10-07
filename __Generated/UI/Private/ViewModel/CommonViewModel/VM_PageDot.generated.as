
namespace __FVM_PageDot_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PageDot> __ModelContainer_Require_FVM_PageDot(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PageDot>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PageDot(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PageDot>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PageDot>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PageDot>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
