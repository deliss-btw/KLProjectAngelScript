
namespace __FVM_CommissionMonsterInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionMonsterInfo> __ModelContainer_Require_FVM_CommissionMonsterInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionMonsterInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionMonsterInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionMonsterInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionMonsterInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionMonsterInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
