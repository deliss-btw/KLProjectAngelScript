
namespace __FVM_TutorialHandbookListItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TutorialHandbookListItem> __ModelContainer_Require_FVM_TutorialHandbookListItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TutorialHandbookListItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TutorialHandbookListItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TutorialHandbookListItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TutorialHandbookListItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TutorialHandbookListItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
