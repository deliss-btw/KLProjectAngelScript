
namespace __FVM_SocialDungeonMinimapIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SocialDungeonMinimapIcon> __ModelContainer_Require_FVM_SocialDungeonMinimapIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SocialDungeonMinimapIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SocialDungeonMinimapIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SocialDungeonMinimapIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SocialDungeonMinimapIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SocialDungeonMinimapIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
