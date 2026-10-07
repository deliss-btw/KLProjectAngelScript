
namespace __FVM_PVX_LeaderboardListEntry_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PVX_LeaderboardListEntry> __ModelContainer_Require_FVM_PVX_LeaderboardListEntry(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PVX_LeaderboardListEntry>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PVX_LeaderboardListEntry(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PVX_LeaderboardListEntry>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PVX_LeaderboardListEntry>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PVX_LeaderboardListEntry>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
