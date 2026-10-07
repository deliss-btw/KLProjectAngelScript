
namespace __FVM_CommissionInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionInfo> __ModelContainer_Require_FVM_CommissionInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
