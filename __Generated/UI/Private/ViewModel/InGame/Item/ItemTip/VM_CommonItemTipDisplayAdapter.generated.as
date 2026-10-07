
namespace __FVM_CommonItemTipDisplayAdapter_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonItemTipDisplayAdapter> __ModelContainer_Require_FVM_CommonItemTipDisplayAdapter(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonItemTipDisplayAdapter>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonItemTipDisplayAdapter(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonItemTipDisplayAdapter>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonItemTipDisplayAdapter>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonItemTipDisplayAdapter>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
