
namespace __FVM_ChatInputPanel_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ChatInputPanel> __ModelContainer_Require_FVM_ChatInputPanel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ChatInputPanel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ChatInputPanel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ChatInputPanel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ChatInputPanel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ChatInputPanel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
