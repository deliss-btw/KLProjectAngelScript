
namespace __FVM_DisplayItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_DisplayItem> __ModelContainer_Require_FVM_DisplayItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_DisplayItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_DisplayItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_DisplayItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_DisplayItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_DisplayItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
