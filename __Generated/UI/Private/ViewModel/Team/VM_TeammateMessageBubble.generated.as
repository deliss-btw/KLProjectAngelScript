
namespace __FVM_TeammateMessageBubble_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TeammateMessageBubble> __ModelContainer_Require_FVM_TeammateMessageBubble(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TeammateMessageBubble>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TeammateMessageBubble(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TeammateMessageBubble>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TeammateMessageBubble>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TeammateMessageBubble>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_TeammateMessageBubbleManager_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TeammateMessageBubbleManager> __ModelContainer_Require_FVM_TeammateMessageBubbleManager(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TeammateMessageBubbleManager>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TeammateMessageBubbleManager(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TeammateMessageBubbleManager>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TeammateMessageBubbleManager>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TeammateMessageBubbleManager>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
