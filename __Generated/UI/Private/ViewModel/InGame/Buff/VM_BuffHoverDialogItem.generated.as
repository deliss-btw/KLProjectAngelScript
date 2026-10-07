
namespace __FVM_BuffHoverDialogItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BuffHoverDialogItem> __ModelContainer_Require_FVM_BuffHoverDialogItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BuffHoverDialogItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BuffHoverDialogItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BuffHoverDialogItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BuffHoverDialogItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BuffHoverDialogItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
