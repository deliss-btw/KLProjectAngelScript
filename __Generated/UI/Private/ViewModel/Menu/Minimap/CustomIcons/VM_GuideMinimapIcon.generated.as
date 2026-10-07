
namespace __FVM_GuideMinimapIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_GuideMinimapIcon> __ModelContainer_Require_FVM_GuideMinimapIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_GuideMinimapIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_GuideMinimapIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_GuideMinimapIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_GuideMinimapIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_GuideMinimapIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
