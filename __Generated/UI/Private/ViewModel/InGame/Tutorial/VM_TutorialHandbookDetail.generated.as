
namespace __FVM_TutorialHandbookDetail_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TutorialHandbookDetail> __ModelContainer_Require_FVM_TutorialHandbookDetail(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TutorialHandbookDetail>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TutorialHandbookDetail(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TutorialHandbookDetail>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TutorialHandbookDetail>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TutorialHandbookDetail>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
