
namespace __FVM_CommissionFinish_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionFinish> __ModelContainer_Require_FVM_CommissionFinish(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionFinish>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionFinish(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionFinish>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionFinish>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionFinish>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
