
namespace __FVM_ItemAction_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemAction> __ModelContainer_Require_FVM_ItemAction(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemAction>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemAction(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemAction>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemAction>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemAction>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
