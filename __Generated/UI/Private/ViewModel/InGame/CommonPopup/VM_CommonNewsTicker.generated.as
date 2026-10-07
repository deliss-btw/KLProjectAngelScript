
namespace __FVM_CommonNewsTicker_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonNewsTicker> __ModelContainer_Require_FVM_CommonNewsTicker(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonNewsTicker>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonNewsTicker(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonNewsTicker>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonNewsTicker>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonNewsTicker>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
