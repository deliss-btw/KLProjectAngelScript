
namespace __FVM_CommonConsume_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonConsume> __ModelContainer_Require_FVM_CommonConsume(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonConsume>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonConsume(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonConsume>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonConsume>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonConsume>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
