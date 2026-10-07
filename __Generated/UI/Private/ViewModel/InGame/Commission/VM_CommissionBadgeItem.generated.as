
namespace __FVM_CommissionBadgeItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionBadgeItem> __ModelContainer_Require_FVM_CommissionBadgeItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionBadgeItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionBadgeItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionBadgeItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionBadgeItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionBadgeItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
