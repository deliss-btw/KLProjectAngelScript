
namespace __FVM_TutorialHandbook_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TutorialHandbook> __ModelContainer_Require_FVM_TutorialHandbook(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TutorialHandbook>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TutorialHandbook(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TutorialHandbook>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TutorialHandbook>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TutorialHandbook>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
