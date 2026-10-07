
namespace __FVM_ChallengeDungeonMinimapIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ChallengeDungeonMinimapIcon> __ModelContainer_Require_FVM_ChallengeDungeonMinimapIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ChallengeDungeonMinimapIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ChallengeDungeonMinimapIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ChallengeDungeonMinimapIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ChallengeDungeonMinimapIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ChallengeDungeonMinimapIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
