
namespace __FVM_DialogueOptionItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_DialogueOptionItem> __ModelContainer_Require_FVM_DialogueOptionItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_DialogueOptionItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_DialogueOptionItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_DialogueOptionItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_DialogueOptionItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_DialogueOptionItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
