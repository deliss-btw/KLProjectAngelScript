
namespace __FVM_BuffHoverStackCount_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BuffHoverStackCount> __ModelContainer_Require_FVM_BuffHoverStackCount(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BuffHoverStackCount>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BuffHoverStackCount(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BuffHoverStackCount>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BuffHoverStackCount>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BuffHoverStackCount>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
