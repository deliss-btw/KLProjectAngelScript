
namespace __FVMS_PendingConfirmQueue_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_PendingConfirmQueue> __ModelContainer_Require_FVMS_PendingConfirmQueue(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_PendingConfirmQueue>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_PendingConfirmQueue(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_PendingConfirmQueue>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_PendingConfirmQueue>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_PendingConfirmQueue>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
