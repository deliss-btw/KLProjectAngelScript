
namespace __FVM_CommissionRewardInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionRewardInfo> __ModelContainer_Require_FVM_CommissionRewardInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionRewardInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionRewardInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionRewardInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionRewardInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionRewardInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
