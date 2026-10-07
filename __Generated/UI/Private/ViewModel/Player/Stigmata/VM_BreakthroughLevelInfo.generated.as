
namespace __FVM_BreakthroughLevelInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BreakthroughLevelInfo> __ModelContainer_Require_FVM_BreakthroughLevelInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BreakthroughLevelInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BreakthroughLevelInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BreakthroughLevelInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BreakthroughLevelInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BreakthroughLevelInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
