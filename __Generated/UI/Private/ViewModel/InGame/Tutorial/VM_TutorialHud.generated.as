
namespace __FVM_TutorialHud_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TutorialHud> __ModelContainer_Require_FVM_TutorialHud(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TutorialHud>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TutorialHud(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TutorialHud>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TutorialHud>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TutorialHud>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
