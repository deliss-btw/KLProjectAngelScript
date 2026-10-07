
namespace __FVM_CommissionRandomElement_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionRandomElement> __ModelContainer_Require_FVM_CommissionRandomElement(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionRandomElement>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionRandomElement(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionRandomElement>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionRandomElement>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionRandomElement>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
