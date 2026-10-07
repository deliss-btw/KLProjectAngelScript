
namespace __FVM_CommissionPanel_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionPanel> __ModelContainer_Require_FVM_CommissionPanel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionPanel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionPanel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionPanel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionPanel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionPanel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
