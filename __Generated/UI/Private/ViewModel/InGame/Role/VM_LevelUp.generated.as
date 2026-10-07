
namespace __FVM_LevelUp_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_LevelUp> __ModelContainer_Require_FVM_LevelUp(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_LevelUp>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_LevelUp(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_LevelUp>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_LevelUp>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_LevelUp>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
