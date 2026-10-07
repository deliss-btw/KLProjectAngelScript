
namespace __FVM_TutorialMain_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TutorialMain> __ModelContainer_Require_FVM_TutorialMain(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TutorialMain>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TutorialMain(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TutorialMain>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TutorialMain>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TutorialMain>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
