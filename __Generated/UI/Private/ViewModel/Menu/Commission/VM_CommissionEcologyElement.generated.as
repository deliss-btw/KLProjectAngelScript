
namespace __FVM_CommissionEcologyElement_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionEcologyElement> __ModelContainer_Require_FVM_CommissionEcologyElement(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionEcologyElement>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionEcologyElement(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionEcologyElement>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionEcologyElement>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionEcologyElement>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
