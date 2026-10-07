
namespace __FVMS_CommissionPanel_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_CommissionPanel> __ModelContainer_Require_FVMS_CommissionPanel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_CommissionPanel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_CommissionPanel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_CommissionPanel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_CommissionPanel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_CommissionPanel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
