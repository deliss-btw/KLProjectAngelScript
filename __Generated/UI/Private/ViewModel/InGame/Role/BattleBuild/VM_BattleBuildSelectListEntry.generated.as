
namespace __FVM_BattleBuildSelectListEntry_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BattleBuildSelectListEntry> __ModelContainer_Require_FVM_BattleBuildSelectListEntry(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BattleBuildSelectListEntry>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BattleBuildSelectListEntry(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BattleBuildSelectListEntry>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BattleBuildSelectListEntry>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BattleBuildSelectListEntry>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
