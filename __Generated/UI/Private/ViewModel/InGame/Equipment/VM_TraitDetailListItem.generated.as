
namespace __FVM_TraitDetailListItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TraitDetailListItem> __ModelContainer_Require_FVM_TraitDetailListItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TraitDetailListItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TraitDetailListItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TraitDetailListItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TraitDetailListItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TraitDetailListItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
