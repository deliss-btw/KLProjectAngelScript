
namespace __FVM_CommissionMyRank_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionMyRank> __ModelContainer_Require_FVM_CommissionMyRank(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionMyRank>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionMyRank(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionMyRank>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionMyRank>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionMyRank>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
