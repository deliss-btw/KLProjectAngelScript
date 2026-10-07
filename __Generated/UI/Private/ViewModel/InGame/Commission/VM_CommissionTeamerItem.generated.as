
namespace __FVM_CommissionTeamerItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionTeamerItem> __ModelContainer_Require_FVM_CommissionTeamerItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionTeamerItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionTeamerItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionTeamerItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionTeamerItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionTeamerItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
