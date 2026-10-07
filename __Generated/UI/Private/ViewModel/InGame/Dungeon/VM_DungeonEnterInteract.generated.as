
namespace __FVM_DungeonEnterInteract_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_DungeonEnterInteract> __ModelContainer_Require_FVM_DungeonEnterInteract(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_DungeonEnterInteract>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_DungeonEnterInteract(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_DungeonEnterInteract>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_DungeonEnterInteract>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_DungeonEnterInteract>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
