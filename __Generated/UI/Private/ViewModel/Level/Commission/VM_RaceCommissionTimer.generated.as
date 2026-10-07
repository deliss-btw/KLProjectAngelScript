
namespace __FVM_RaceCommissionTimer_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_RaceCommissionTimer> __ModelContainer_Require_FVM_RaceCommissionTimer(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_RaceCommissionTimer>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_RaceCommissionTimer(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_RaceCommissionTimer>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_RaceCommissionTimer>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_RaceCommissionTimer>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
