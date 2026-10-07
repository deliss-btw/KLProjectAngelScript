
namespace __FVM_SelectableItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SelectableItem> __ModelContainer_Require_FVM_SelectableItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SelectableItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SelectableItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SelectableItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SelectableItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SelectableItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CommonTabItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonTabItem> __ModelContainer_Require_FVM_CommonTabItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonTabItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonTabItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonTabItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonTabItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonTabItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
