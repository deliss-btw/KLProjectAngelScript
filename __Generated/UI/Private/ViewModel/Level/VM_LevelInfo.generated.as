
namespace __FVM_LevelInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_LevelInfo> __ModelContainer_Require_FVM_LevelInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_LevelInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_LevelInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_LevelInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_LevelInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_LevelInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
