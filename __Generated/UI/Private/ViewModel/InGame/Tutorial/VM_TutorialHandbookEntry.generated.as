
namespace __FVM_TutorialHandbookEntry_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TutorialHandbookEntry> __ModelContainer_Require_FVM_TutorialHandbookEntry(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TutorialHandbookEntry>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TutorialHandbookEntry(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TutorialHandbookEntry>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TutorialHandbookEntry>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TutorialHandbookEntry>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
