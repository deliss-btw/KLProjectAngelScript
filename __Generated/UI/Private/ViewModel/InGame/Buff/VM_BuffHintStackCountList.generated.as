
namespace __FVM_BuffHintStackCountList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BuffHintStackCountList> __ModelContainer_Require_FVM_BuffHintStackCountList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BuffHintStackCountList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BuffHintStackCountList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BuffHintStackCountList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BuffHintStackCountList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BuffHintStackCountList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
