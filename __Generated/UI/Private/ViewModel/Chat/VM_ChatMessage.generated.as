
namespace __FVM_ChatMessage_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ChatMessage> __ModelContainer_Require_FVM_ChatMessage(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ChatMessage>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ChatMessage(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ChatMessage>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ChatMessage>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ChatMessage>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
