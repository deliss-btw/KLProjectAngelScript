
namespace __FVM_TutorialHint_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TutorialHint> __ModelContainer_Require_FVM_TutorialHint(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TutorialHint>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TutorialHint(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TutorialHint>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TutorialHint>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TutorialHint>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
