
namespace __FVM_CommissionEcologyInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionEcologyInfo> __ModelContainer_Require_FVM_CommissionEcologyInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionEcologyInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionEcologyInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionEcologyInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionEcologyInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionEcologyInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
