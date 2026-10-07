
namespace __FVMS_CommissionTime_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_CommissionTime> __ModelContainer_Require_FVMS_CommissionTime(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_CommissionTime>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_CommissionTime(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_CommissionTime>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_CommissionTime>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_CommissionTime>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CommissionTimeHover_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionTimeHover> __ModelContainer_Require_FVM_CommissionTimeHover(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionTimeHover>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionTimeHover(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionTimeHover>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionTimeHover>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionTimeHover>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
