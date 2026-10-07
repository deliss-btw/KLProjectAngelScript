
namespace __FVM_Execute_QTE_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Execute_QTE> __ModelContainer_Require_FVM_Execute_QTE(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Execute_QTE>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Execute_QTE(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Execute_QTE>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Execute_QTE>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Execute_QTE>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
