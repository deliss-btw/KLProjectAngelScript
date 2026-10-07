
namespace __FVM_BuffHoverDialogAttrItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BuffHoverDialogAttrItem> __ModelContainer_Require_FVM_BuffHoverDialogAttrItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BuffHoverDialogAttrItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BuffHoverDialogAttrItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BuffHoverDialogAttrItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BuffHoverDialogAttrItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BuffHoverDialogAttrItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
