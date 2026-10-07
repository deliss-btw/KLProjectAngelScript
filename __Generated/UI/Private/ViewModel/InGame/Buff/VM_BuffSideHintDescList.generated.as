
namespace __FVM_BuffSideHintDesc_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BuffSideHintDesc> __ModelContainer_Require_FVM_BuffSideHintDesc(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BuffSideHintDesc>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BuffSideHintDesc(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BuffSideHintDesc>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BuffSideHintDesc>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BuffSideHintDesc>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_BuffSideHintDescList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BuffSideHintDescList> __ModelContainer_Require_FVM_BuffSideHintDescList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BuffSideHintDescList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BuffSideHintDescList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BuffSideHintDescList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BuffSideHintDescList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BuffSideHintDescList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
