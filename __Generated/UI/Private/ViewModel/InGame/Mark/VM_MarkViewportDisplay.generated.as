
namespace __FVM_MarkViewportDisplay_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MarkViewportDisplay> __ModelContainer_Require_FVM_MarkViewportDisplay(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MarkViewportDisplay>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MarkViewportDisplay(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MarkViewportDisplay>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MarkViewportDisplay>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MarkViewportDisplay>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
