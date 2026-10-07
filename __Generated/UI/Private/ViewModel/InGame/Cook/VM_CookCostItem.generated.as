
namespace __FVM_CookCostItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CookCostItem> __ModelContainer_Require_FVM_CookCostItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CookCostItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CookCostItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CookCostItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CookCostItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CookCostItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_WaitCookItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_WaitCookItem> __ModelContainer_Require_FVM_WaitCookItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_WaitCookItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_WaitCookItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_WaitCookItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_WaitCookItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_WaitCookItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
