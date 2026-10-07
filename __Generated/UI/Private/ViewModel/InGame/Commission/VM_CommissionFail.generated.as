
namespace __FVM_CommissionFail_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionFail> __ModelContainer_Require_FVM_CommissionFail(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionFail>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionFail(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionFail>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionFail>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionFail>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
