
namespace __FVM_CommissionDetail_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionDetail> __ModelContainer_Require_FVM_CommissionDetail(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionDetail>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionDetail(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionDetail>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionDetail>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionDetail>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
