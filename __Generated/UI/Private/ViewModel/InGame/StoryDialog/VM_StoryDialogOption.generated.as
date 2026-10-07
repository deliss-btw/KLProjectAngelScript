
namespace __FVM_StoryDialogOption_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_StoryDialogOption> __ModelContainer_Require_FVM_StoryDialogOption(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_StoryDialogOption>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_StoryDialogOption(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_StoryDialogOption>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_StoryDialogOption>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_StoryDialogOption>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
