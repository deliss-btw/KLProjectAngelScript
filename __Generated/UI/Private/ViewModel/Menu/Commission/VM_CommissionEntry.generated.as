

struct FConfigVM_CommissionEntry : FConfigEUIModelBase
{
    UPROPERTY()
    ECommissionType CommissionType;


}

namespace __FVM_CommissionEntry_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionEntry> __ModelContainer_Require_FVM_CommissionEntry(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionEntry>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionEntry(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionEntry>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionEntry>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionEntry>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
