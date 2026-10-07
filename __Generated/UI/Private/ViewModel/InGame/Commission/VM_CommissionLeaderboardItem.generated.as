
namespace __FVM_CommissionLeaderboardItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionLeaderboardItem> __ModelContainer_Require_FVM_CommissionLeaderboardItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionLeaderboardItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionLeaderboardItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionLeaderboardItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionLeaderboardItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionLeaderboardItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CommissionLeaderboardPlayer_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionLeaderboardPlayer> __ModelContainer_Require_FVM_CommissionLeaderboardPlayer(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionLeaderboardPlayer>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionLeaderboardPlayer(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionLeaderboardPlayer>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionLeaderboardPlayer>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionLeaderboardPlayer>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
