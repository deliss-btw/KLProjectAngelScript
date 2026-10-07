
namespace __FVM_MonsterInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MonsterInfo> __ModelContainer_Require_FVM_MonsterInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MonsterInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MonsterInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MonsterInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MonsterInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MonsterInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
