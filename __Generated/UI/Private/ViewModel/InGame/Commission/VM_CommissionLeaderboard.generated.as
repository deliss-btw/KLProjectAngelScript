
namespace __FVM_CommissionLeaderboard_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionLeaderboard> __ModelContainer_Require_FVM_CommissionLeaderboard(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionLeaderboard>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionLeaderboard(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionLeaderboard>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionLeaderboard>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionLeaderboard>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
