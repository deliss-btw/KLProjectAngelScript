
namespace __FVM_CommissionFinishResurltItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionFinishResurltItem> __ModelContainer_Require_FVM_CommissionFinishResurltItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionFinishResurltItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionFinishResurltItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionFinishResurltItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionFinishResurltItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionFinishResurltItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
