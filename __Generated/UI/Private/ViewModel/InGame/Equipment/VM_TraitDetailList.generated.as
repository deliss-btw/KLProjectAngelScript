
namespace __FVM_TraitDetailList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TraitDetailList> __ModelContainer_Require_FVM_TraitDetailList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TraitDetailList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TraitDetailList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TraitDetailList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TraitDetailList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TraitDetailList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
