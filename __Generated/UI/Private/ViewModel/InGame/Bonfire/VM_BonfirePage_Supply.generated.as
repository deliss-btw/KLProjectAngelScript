
namespace __FVM_BonfirePage_Supply_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BonfirePage_Supply> __ModelContainer_Require_FVM_BonfirePage_Supply(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BonfirePage_Supply>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BonfirePage_Supply(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BonfirePage_Supply>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BonfirePage_Supply>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BonfirePage_Supply>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
