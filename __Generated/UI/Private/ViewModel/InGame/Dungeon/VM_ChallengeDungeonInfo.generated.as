
namespace __FVM_ChallengeDungeonInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ChallengeDungeonInfo> __ModelContainer_Require_FVM_ChallengeDungeonInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ChallengeDungeonInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ChallengeDungeonInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ChallengeDungeonInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ChallengeDungeonInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ChallengeDungeonInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
