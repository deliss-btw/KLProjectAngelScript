
namespace __FVM_PendingConfirmItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PendingConfirmItem> __ModelContainer_Require_FVM_PendingConfirmItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PendingConfirmItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PendingConfirmItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PendingConfirmItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PendingConfirmItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PendingConfirmItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
