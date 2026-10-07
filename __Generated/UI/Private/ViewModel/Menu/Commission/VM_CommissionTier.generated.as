
namespace __FVM_CommissionTier_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionTier> __ModelContainer_Require_FVM_CommissionTier(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionTier>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionTier(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionTier>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionTier>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionTier>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
