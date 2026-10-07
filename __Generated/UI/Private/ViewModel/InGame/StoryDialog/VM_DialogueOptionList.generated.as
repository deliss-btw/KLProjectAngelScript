
namespace __FVM_DialogueOptionList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_DialogueOptionList> __ModelContainer_Require_FVM_DialogueOptionList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_DialogueOptionList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_DialogueOptionList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_DialogueOptionList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_DialogueOptionList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_DialogueOptionList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
