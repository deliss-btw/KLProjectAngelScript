
namespace __FVM_SideHintItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SideHintItem> __ModelContainer_Require_FVM_SideHintItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SideHintItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SideHintItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SideHintItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SideHintItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SideHintItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
